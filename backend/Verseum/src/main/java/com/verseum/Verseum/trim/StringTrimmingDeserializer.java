package com.verseum.Verseum.trim;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;

import java.io.IOException;

public class StringTrimmingDeserializer extends StdDeserializer<String> {

	private static final long serialVersionUID = -6972065572263950443L;

	protected StringTrimmingDeserializer(Class<String> vc) {
		super(vc);
	}

	@Override
	public String deserialize(JsonParser parser, DeserializationContext deserializationContext) throws IOException {

		String data = parser.getText();

		String result = data == null ? "" : data.trim();

		return result;
	}
}