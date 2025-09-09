Return-Path: <linuxppc-dev+bounces-11936-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FCAB4A76B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 11:20:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLdb865hHz3cZ2;
	Tue,  9 Sep 2025 19:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757409636;
	cv=none; b=ev7rf7YepIVNVW77KBXYssgVIu51dmrgyvCrl95LGYachDM7+MxWIibjCi+2INWdLDdBxhXsfB/ojvbj02xYNmDUyDltn47E5ZQ3m6iPz9iR6R1fb7tFGpsYVkctMD3A64+F53QGBmjjz3CA49q5LhuqXZABWtETb+4ciFKrLLmYSdsQnLTY0AejV6Y7ujmBYQeuzvXSV7OrcNoBYesbGJU+Q7+fP/Zy/5AcVJuN6CiNMxf7wT/QUWJx2z/sckFaKhoNS9kwiASFmAChACjCFvAPnNtcSBlExRtHoiilCb9va9QQD4ZOdKJmMgsL4EoHiZb9wCSnKA6ZVNEuqyZK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757409636; c=relaxed/relaxed;
	bh=tFhQjaX3CwLzX60lVC57V74nziXWr22DPr9UmTglD5E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=iwtvIsCrSv+bZpYJhvGO62S9JSlRmsSrtr7N+PFubcmcRGgalGp6OrnT+J8sGJAgg8oIdTkS310c9qFr2P4pl8Jff7+9ZThsHn/O12yjEunLQAFFaRR5Oz4e37VV5cb68T5vnIOUoMnzeOfD5cfaZ69vxAtDeNyRNCZb1nyJ1PiQi++r7N78ROQoyQdO9wLHj0o2LzIZfojxlZh3ukMpsCC6/Z5zqHc114PTr1SpCKylZDnH5YW0CKJYF92Fqp96SgJCXm5FZ3HXxrZJKk5ilQO2Q7q/epLSVk0OFh+RpMswSbAw64eCkORYjqwdz7zbP4bKy9PRNcgFW51UUuQLrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLdb75hLTz3cYG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 19:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cLd2s6McVz9sRh;
	Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVtZoeAlc5y4; Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cLd2s55HRz9sRg;
	Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 83A658B766;
	Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vVFyT6NJGbhy; Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D2D438B764;
	Tue,  9 Sep 2025 10:55:46 +0200 (CEST)
Message-ID: <ccb27487-9b3f-489f-bcea-dc5d7cca465e@csgroup.eu>
Date: Tue, 9 Sep 2025 10:55:46 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
 <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
 <20250902212458.GA1184537-robh@kernel.org>
 <646c8a39-c78e-4c2c-b820-d7d57e0a85fc@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <646c8a39-c78e-4c2c-b820-d7d57e0a85fc@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Rob, Conor, Krzysztof,

Can one of you or someone else help me with below comment from Rob ?

Le 03/09/2025 à 06:58, Christophe Leroy a écrit :
> Hi Rob,
> 
> Le 02/09/2025 à 23:24, Rob Herring a écrit :
>> On Mon, Sep 01, 2025 at 02:05:13PM +0200, Christophe Leroy wrote:
>>> Convert QE QPIO devicetree binding to DT schema.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>> v5: New
>>> ---
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - fsl,chip-qe-pario-bank
>>> +      - const: fsl,mpc8323-qe-pario-bank
>>> +
> 
> snip
> 
>>
>>> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe- 
>>> pario-bank";
>>
>> Doesn't match the schema.
>>
> 
> Can you be more explicit ? Is it the 'mpc8360' ? It is the 'chip'.
> 
> 
> bindings/soc/fsl/cpm_qe/qe/par_io.txt was saying:
> 
>    - compatible : should be "fsl,<chip>-qe-pario-bank", "fsl,mpc8323-qe- 
> pario-bank".
> 
> Which I first translated in yaml as :
> 
>    properties:
>      compatible:
>        items:
>          - enum:
>            - fsl,<chip>-qe-pario-bank
>          - const: fsl,mpc8323-qe-pario-bank
> 
> But 'make dt_binding_check' complained about the < > around 'chip' so I 
> removed them.
> 
> How should it be described ?
> 

Here is what we have in existing DTS upstream:

arch/powerpc/boot/dts/fsl/mpc8569mds.dts- 
compatible = "fsl,mpc8569-qe-pario-bank",
arch/powerpc/boot/dts/fsl/mpc8569mds.dts: 
             "fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/fsl/mpc8569mds.dts- 
compatible = "fsl,mpc8569-qe-pario-bank",
arch/powerpc/boot/dts/fsl/mpc8569mds.dts: 
             "fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/kmeter1.dts- 
compatible = "fsl,mpc8360-qe-pario-bank",
arch/powerpc/boot/dts/kmeter1.dts: 
     "fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/mpc832x_rdb.dts: 
compatible = "fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/mpc836x_rdk.dts-                  compatible = 
"fsl,mpc8360-qe-pario-bank",
arch/powerpc/boot/dts/mpc836x_rdk.dts: 
"fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/mpc836x_rdk.dts-                  compatible = 
"fsl,mpc8360-qe-pario-bank",
arch/powerpc/boot/dts/mpc836x_rdk.dts: 
"fsl,mpc8323-qe-pario-bank";

If the problem in the DT schema is the fsl,chip-qe-pario-bank, should I 
replace it with the two possible compatible we have in existing DTS, ie 
"fsl,mpc8569-qe-pario-bank" and "fsl,mpc8360-qe-pario-bank", or should I 
just ignore them are they are useless for the drivers, or else ?

Thanks
Christophe

