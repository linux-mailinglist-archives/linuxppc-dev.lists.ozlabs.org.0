Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9FA512B53
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 08:17:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpll22zdbz3bmT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 16:17:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dm7IIP+s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dm7IIP+s; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KplkM1S5wz2xXV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 16:16:24 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id kq17so7471239ejb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 23:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MFsuND3deEikwDCrPgJTnpdq0PRuR+XEOkINDbDvzIs=;
 b=dm7IIP+sI4Ep4b8lV07ltQtn5GmcD1I83e3a9lsIhs9/CpyP9r/tPoMOX8W4zzn3H+
 Fnt8biujUBQUzZCgmruQol7neI5e+1oPmN5ass7Ow7+tzP7X5FdV0FQ0qyI/rAF+r5Mg
 lAeLuF11cdUQUy4YFabaaRYnqLq018egODyaKP9JjXFOaZhXBy/NwY09f4qxt3kzykN7
 4p0ourLjeTSMhlLuSxZvUNgwovcqwZtXZXFk+bVoa/X84oLITrXu6yFaEGwrMwht7O6d
 9m1/hNubS3pgiwdFHmW3hduT9tqT//aF9r0q8V2nzdHv94WQpalZLz9yq4nLaP3AKEkM
 +5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MFsuND3deEikwDCrPgJTnpdq0PRuR+XEOkINDbDvzIs=;
 b=fzlfSNjHjp1tpJTu/I6Rj+KCw8TB718SL4Z3YU0mWIEcub2uLiD9K9VLWrhaegHlmW
 bTx8vVHfV85eEz43X+JbN862TSDxaR8G0nqVJx5OD+YYRkGVANYH/ph845fJWYm6ltuG
 RfoCWBnYgUCYzLmn0KxI9mXvJylNZj5OOVClQ8FqNUDnkPX5JI4rZUkUiqvvrLU/glDe
 c6WXO7TGBNkM+RSfYIOknDrjXJ73fIC37uIYjxQ9nYkCUx6s7TMZsLKr5I2UT3eTEf+c
 uN4lDUieebm49qIWCSswy3oIk7LXQ5c2Qa2Zizt+UffVIBvW9dEVJAy8JiDkxu/5cfTl
 Af6g==
X-Gm-Message-State: AOAM532Gvv53SsG3ND7UbGjuJ3yV6UMgkjhoc4CG/a9lvRAtfzYR/LM+
 05cpY5JGx+N8wBOAtabxiZKf5Q==
X-Google-Smtp-Source: ABdhPJwBZ1KNRfTA1HAA4LNUtcVVMcP6eFpjtMb2TWZhJ9REFtbQpTpqXSRQVZsbPWfRPDqMyAnXmQ==
X-Received: by 2002:a17:907:9628:b0:6f3:5fbe:c28 with SMTP id
 gb40-20020a170907962800b006f35fbe0c28mr28506329ejc.754.1651126581596; 
 Wed, 27 Apr 2022 23:16:21 -0700 (PDT)
Received: from [192.168.0.159] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 c4-20020a170906170400b006e87c7b8ffasm7971376eje.32.2022.04.27.23.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 23:16:20 -0700 (PDT)
Message-ID: <8d9130b5-7459-bb26-79c7-3d83f7dd29a0@linaro.org>
Date: Thu, 28 Apr 2022 08:16:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/4] dt-bindings: interrupt-controller: fsl, ls-extirq:
 convert to YAML
Content-Language: en-US
To: Leo Li <leoyang.li@nxp.com>, Michael Walle <michael@walle.cc>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220427075338.1156449-1-michael@walle.cc>
 <20220427075338.1156449-4-michael@walle.cc>
 <AS8PR04MB89464877E53B7F7B14A814178FFA9@AS8PR04MB8946.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AS8PR04MB89464877E53B7F7B14A814178FFA9@AS8PR04MB8946.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/04/2022 22:08, Leo Li wrote:
>> Convert the fsl,ls-extirq binding to the new YAML format.
>>
>> In contrast to the original binding documentation, there are three
>> compatibles which are used in their corresponding device trees which have a
>> specific compatible and the (already documented) fallback
>> compatible:
>>  - "fsl,ls1046a-extirq", "fsl,ls1043a-extirq"
>>  - "fsl,ls2080a-extirq", "fsl,ls1088a-extirq"
>>  - "fsl,lx2160a-extirq", "fsl,ls1088a-extirq"
>>
>> Depending on the number of the number of the external IRQs which is
>> usually 12 except for the LS1021A where there are only 6, the interrupt-map-
>> mask was reduced from 0xffffffff to 0xf and 0x7 respectively and the number
>> of interrupt-map entries have to match.
> 
> I assume this change won't prevent driver to be compatible with older device trees using the 0xffffffff?  The original 0xffffffff should work for both 6/12 interrupts or whatever reasonable number of interrupts that maybe used in future SoCs.  So the purpose of this change is to make the binding more specific to catch more errors in device tree?

Yes.

Best regards,
Krzysztof
