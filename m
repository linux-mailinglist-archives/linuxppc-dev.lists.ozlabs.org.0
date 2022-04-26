Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B87750F268
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 09:29:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnYR438zWz3bpZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 17:29:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=WLsMfwV0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=WLsMfwV0; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnYQS5FPVz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 17:28:32 +1000 (AEST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B6E0A2223A;
 Tue, 26 Apr 2022 09:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650958108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mzzsrtLgDhH/mUpZ95LPe7yFWgFVICtJRss1dScu0l4=;
 b=WLsMfwV0KL/FIMULQI396eMh2JgmUNPuLtROTi2Uf6+MI9kKJWGfdOy3upRieZ36tH/mnF
 UaB7LffD+miuwmjsCrhJXFO1MhRqJ9Gm1Uq82AvQIUUNm09Avl31g13lar3POnut6X7d8L
 yJx48P/MaJpQ/trOFQcS6gGsy9TIAJo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 26 Apr 2022 09:28:27 +0200
From: Michael Walle <michael@walle.cc>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: fsl, ls-extirq:
 convert to YAML
In-Reply-To: <c324eec7-79b1-33da-c38e-4a480fe23126@linaro.org>
References: <20220425140214.32448-1-michael@walle.cc>
 <658851ed-33fd-8e2b-7db7-ef1ca9e31c33@linaro.org>
 <83b596d0570c779c61c3c37c6f512679@walle.cc>
 <c324eec7-79b1-33da-c38e-4a480fe23126@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <6fec63c911c88a375fc024f6ca0e946d@walle.cc>
X-Sender: michael@walle.cc
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 2022-04-26 08:53, schrieb Krzysztof Kozlowski:
> On 25/04/2022 23:58, Michael Walle wrote:
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Specifies the Interrupt Polarity Control Register (INTPCR) in
>>>> the
>>>> +      SCFG or the External Interrupt Control Register (IRQCR) in 
>>>> the
>>>> ISC.
>>>> +
>>>> +  interrupt-map:
>> 
>> btw.
>> 
>> minItems: 12
>> maxItems: 12
>> 
>> Isn't working here, is that expected? The validator seem to get the
>> count
>> of the elements of one tuple wrong.
>> 
>> I.e.
>> arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb:
>> interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1,
>> 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5,
>> 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 
>> 8,
>> 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is 
>> too
>> short
> 
> 
> Works for me (in different schema)... maybe update your dtschema?

Just updated to the latest one. But I'm still getting the same errors.

$ dt-validate -V
2022.4

/home/mwalle/repos/b-linux-arm64/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dtb: 
interrupt-controller@14: interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 
0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 
0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 
4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too 
short
	From schema: 
/home/mwalle/repos/linux-mw/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml

How is the length of one entry calculated?

-michael
