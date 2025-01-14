Return-Path: <linuxppc-dev+bounces-5258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 073B1A10FEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 19:24:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXcvy2xnNz3bV3;
	Wed, 15 Jan 2025 05:23:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736879038;
	cv=none; b=dNXkKtgcFyhFGOb1eBJSrSnTsbHN4mOAhD9iBCsBVMCStmmYFiQwR973Yuqa+L2dJ7NCY5t/vCBEB3c6VYd1mBPL/YM4HPD6sp6obHMM7WQ4erV1tVpNVKPjGn/veuC+c1bQ7Z3rvx33nNdm/5r6IkXqa+JiC90z5vcOSSqVIuP12qGrHrWb0gXhWDpwD+0qe+3GXLN5nyr6I6U+8crLo38pM8GZiCeFjJ1ycL8a3zsR+Jzm8PVpZiya3KFCNW3qM4Etg9OzM2uNyc+B5aYkQGbcsYQWHvOHVA8DBPmWcrhKY/PbzcEpHh5ZEUdBo696/x3xqZA5mBvIchwxF8w5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736879038; c=relaxed/relaxed;
	bh=yUqL9QrhUm9MgALIjYATxNORXILfn/rkRDPpzfOF40I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Pb9LX8H0iKoHs8wnS5KVaIIRwW/8QdnehG9qjWhHjLWR+wGdI/fYD7B7nUPwbGmSiSonhE5bQyukBSW0YTS27u98ZIWye9aDPzzy323hTytyV/XNKAeiONp+cTzCEaMtq69/h8WucROUwrG0mXqE2WRzxZ3WriUEQ2lnucKMsFs4scQnDUfE6rI4ZOyxbpitQPRlYQDwk33j9P3pXRTr7jfKue03gHGXF0GyhBC6Rm0TLRqXgkkf3KJEz7BFADxvviauJ6lAnYpUxyjD+tbREqk27TL0EUQCyRE0NQax3aO+P5okragfRUn9dbLl9J8FbGdZjhNovwxVY5PyW1dSrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NncQL+gO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NncQL+gO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXcvw51VBz3bSc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 05:23:54 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4361aa6e517so7336515e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 10:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736879031; x=1737483831; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUqL9QrhUm9MgALIjYATxNORXILfn/rkRDPpzfOF40I=;
        b=NncQL+gOlkJlX9pMnJVCtHaCeCq8cOoVbpsTzTCbM69qGF6A+BUe7qOHTYYDm7fkvf
         tt5P/6VoApFSICGoF7i+XTt3+Ff229ZZGTzbNRu1zLTb8cRwYct8IRIxYNJP3zqP2h/n
         8BkqrmXmjHNBkdygh0QBg8IWJdUv7W1tcZb+RQYNNvmKODO+aRFitYQr1N76vPA2PZJQ
         j2eee3dFwuqK5hQ7C+yFgJhwKbkJ8fzq1XU8N3Qxneq5C3coMgtqQM4mmQdJhEXZvT0E
         zXQn1GkNlLSG8Em7f5LwkcdFP1IZq2j76MVlYivSPJLQI5xlJco9nvcvz+kLl8OSj7bo
         Mllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736879031; x=1737483831;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUqL9QrhUm9MgALIjYATxNORXILfn/rkRDPpzfOF40I=;
        b=ZAowU12TKPfwjLMc7W03DC1dhoqmqXg0fg3Q5IuJi18M71EMNHeE+mKVmb3MbDmnhB
         zY73QlVWBuOgP3GVVozPmqxNeDYHWprooDy+rWthQ+Ow6bLdR+k3ppgAfPaNpVoMHjpX
         35KWT/XIRsAPzw37KqkfaSoF7u+I+Jnry4enY8a4PggMarac3TYvu/UKAILK5esO0Wqu
         SaQF8/ZLfpKtQJQvHSmlPvNaFW1MJnU2TqAd15NnMP56sbRonrBz4ljN5goH9OwU1he+
         LAuwVoudpd4Mtqgk7o12UDukwhBd7M6uYwotaPAG/H+nGEMJFRZXM6q0scCwyhr/3zKA
         o02Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOlQIGq9VDX6dtNoZ3S7SDeZmCHJpSNuMSY2kralqTRFg8IOqjmoPyAlo7XfxuqOs8EBvfZdC7F8KB1jA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxRUc6ORiCitniUItBc0Gl+BuslMNcn9CquWA4WuEgkqsjBq/Vl
	/WbaDqyV/ZlZW++krwrB4RUF1EnhZL3smV6xJA2PKUH3aKEZMFo+B7yIKOIr5go=
X-Gm-Gg: ASbGncs0poAg+jbn6xyWh6NWwZeonMhKTBJbzAPO1pD31o27rTtzcfL+8M3jg7VgAAu
	o6PPFK1vQ0Bh9Ei77uT/5t9KzLJzz3poH9TC+479jZ8F8hvYODgME1ScHHriuTxNm3M050DTvK9
	+3E5aVf5dkj+jmJEfZHoRHWjV5pSc+ag4KCxSY+YA7K2cuppyHfRGmhil++J7bcK2abJ+wgo4G+
	5KGqnzKNTKNnxzfpYdoevk0WZ0Ad4GuAd4yeYDQNt3DCTY5ont4heHHMFdzTzBa1SVbqqa3/LqF
X-Google-Smtp-Source: AGHT+IGtIenA3f6iiGnwlD3ARMP6mMv7fFe+fyygz40yBDhc9W3UIiuhWYPynYhF7A00tP/tplnUiA==
X-Received: by 2002:a05:600c:5112:b0:42c:baba:13cb with SMTP id 5b1f17b1804b1-436e267f035mr101854795e9.2.1736879030982;
        Tue, 14 Jan 2025 10:23:50 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bdc0d8e4bsm6454046f8f.42.2025.01.14.10.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 10:23:50 -0800 (PST)
Message-ID: <2f263350-a455-45a8-86d3-314b5d7a7e26@linaro.org>
Date: Tue, 14 Jan 2025 19:23:49 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: Use str_enable_disable-like helpers
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20250114105611.273202-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250114105611.273202-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 14/01/2025 11:56, Krzysztof Kozlowski wrote:
>  	if (cpufreq_boost_trigger_state(enable)) {
>  		pr_err("%s: Cannot %s BOOST!\n",
> -		       __func__, enable ? "enable" : "disable");
> +		       __func__, str_enable_disable(enable));
>  		return -EINVAL;
>  	}
>  
>  	pr_debug("%s: cpufreq BOOST %s\n",
> -		 __func__, enable ? "enabled" : "disabled");
> +		 __func__, str_enable_disable(enable));
This needs fix - enabled, not enable. V2.

Best regards,
Krzysztof

