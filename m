Return-Path: <linuxppc-dev+bounces-11650-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C6B41449
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 07:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGrY12x5bz2xcB;
	Wed,  3 Sep 2025 15:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756876837;
	cv=none; b=WnTQ68W49bOzmQR+at/O45Ymqz/kX1ZXxBt27SL9swZ+7g/l7s9uSkpjAleVULbq8uLz5BMQZeRLwiI2z3YSfp8F1oSdCJ/OsRWXFt4r4l3ua8tkKSphxTy0I5nsB2yd6u4P5HXtkwheDZMvrkSLzCAaU8p4mim+G1cxP9RRaSOWCMh/hSzscHFfLJhRv5WCRrk2qOhlyTon8zhVBQoVtDI+GsS7s5LN4EXaqMOoJq0Lbcsmsvq7z7Aa83eaniq1yCddOqZ1zdRuJ3CyTzQZON+Es2wWR+5A2EKtSvNXD1ZPdEBwdDt56LnqW+ZLtiMCqO8PfDY+ivoLHk5E9NSUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756876837; c=relaxed/relaxed;
	bh=BwZ6lyeUGPsPUI7Jbg2zCet6AR6fKn/AJZG2hUa1h6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N57JGZRuulUsE8F2MWW4GupIWG3qBQCIL2b3Q47ouj0ov0xRW6GXKs8Ph7gyJK6N3ucFPSk9m9HQwzFPPMYDduXDFaj/eVVJNZW4IkC97fPkiPLhzgSay8Pq+/y3nwOLXAJpE1V1hJxW55EWkGh0kBpQ2bCauVENFhsgI2/jgUv94gincpv4ZgT1ZTDw5NaRtdS/qiULLWUMrqFqCMvZSohOWwDR6x1Lj9Z3e/e/4C5kJeKn6lWVHs1Z1RQ4L1FReE5tOuD4U9v+g2n4ODnIw9BMp0h1MH0d2ww81YmHnJBVRKC2UrH0zjcuUHr2dfokjKme8VQY7UYanIFAeMSBcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGrY04B6pz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 15:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cGr3X4MGDz9sSC;
	Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqXfjTzkKbXw; Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cGr3X3cvPz9sRs;
	Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 665ED8B764;
	Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id HhVS512OWuWk; Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D82298B763;
	Wed,  3 Sep 2025 06:58:31 +0200 (CEST)
Message-ID: <646c8a39-c78e-4c2c-b820-d7d57e0a85fc@csgroup.eu>
Date: Wed, 3 Sep 2025 06:58:31 +0200
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
To: Rob Herring <robh@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
 <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
 <20250902212458.GA1184537-robh@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250902212458.GA1184537-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Rob,

Le 02/09/2025 à 23:24, Rob Herring a écrit :
> On Mon, Sep 01, 2025 at 02:05:13PM +0200, Christophe Leroy wrote:
>> Convert QE QPIO devicetree binding to DT schema.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v5: New
>> ---
> 
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - fsl,chip-qe-pario-bank
>> +      - const: fsl,mpc8323-qe-pario-bank
>> +

snip

> 
>> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> 
> Doesn't match the schema.
> 

Can you be more explicit ? Is it the 'mpc8360' ? It is the 'chip'.


bindings/soc/fsl/cpm_qe/qe/par_io.txt was saying:

   - compatible : should be "fsl,<chip>-qe-pario-bank", 
"fsl,mpc8323-qe-pario-bank".

Which I first translated in yaml as :

   properties:
     compatible:
       items:
         - enum:
           - fsl,<chip>-qe-pario-bank
         - const: fsl,mpc8323-qe-pario-bank

But 'make dt_binding_check' complained about the < > around 'chip' so I 
removed them.

How should it be described ?

Thanks
Christophe

