Return-Path: <linuxppc-dev+bounces-12758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 947C4BCAFAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 23:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjNpj3pYNz2xnx;
	Fri, 10 Oct 2025 08:50:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760046637;
	cv=none; b=hQnTqF42A0+KZRO2O189XhVfWaKiOkXasNhfd4X7a+b3oawdHnFSX3mKq8smyEwMYSCcpfwR4XME3F+uoQdHOgZ/9BLZgcYHAVq0CZTSL9EwQyKeOyTZlgNHh1//HqlP6OCuUG8jeV2T/smlzENQF0g+yu5+7SbCHqmd4g3R7mPzYyyLYcSEyEAJeo/dRcJXfTj7c5OsdzbUsP0WEPAm9Rl7F8yNF1+77FPmjaF+S1yEbC+XJ+OymUTVo7aKuw1nawQXyzdKgm+xy7hV19nbpG3wCg652/B0aHIwAlYWXCmr985+bvcjAXJ6+tEwehTjA9VwniSV7g6HNEtmt/NSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760046637; c=relaxed/relaxed;
	bh=ibzttu7iBJfIeR187XK2EpXrGUI0WsVRhmmQSKa+GF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWBW3fuC3/K+fLcU+/WjSaIzSxvjyLcU2/Y+1ZXIcguwaEJMCHVgkyOHFSbrTE/d/lgyRjEH4FKkOBWtXvsPgJyny0HlgHBmpPECACGnRIBkLleuMmRIn5JiDIeFTWzd75nhJjPES6eFXOH7xCde6m53F2qH7LDOw0C3R8LrHEHf+DKg0j1lvVy2baSBTmzex16VP15nOGH63mkZzqIuY3ElJ9Cr6PrfcvGJ7ZhcVxhgB9vqkYQvhfc0rQmYbgymw1QPLufNqvt0ZdCly5BmCGtNoKafBsohECjqoWQjC3itQxN+dSm2vHi6MzI2DYO6OC2IrwRIcDB0dxBmzEhFIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjNph61m4z2xcC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 08:50:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cjBZD4l7Wz9sVK;
	Thu,  9 Oct 2025 16:09:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vyOlSRyxGg0t; Thu,  9 Oct 2025 16:09:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cjBZD3dh4z9sVm;
	Thu,  9 Oct 2025 16:09:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6D9E78B774;
	Thu,  9 Oct 2025 16:09:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id h6jEI0H14JLp; Thu,  9 Oct 2025 16:09:08 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CBB218B76D;
	Thu,  9 Oct 2025 16:09:07 +0200 (CEST)
Message-ID: <376f509b-c088-4387-965d-071faace6409@csgroup.eu>
Date: Thu, 9 Oct 2025 16:09:07 +0200
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
Subject: Re: [PATCH 3/4] powerpc: 86xx: Rename wdt@ nodes to watchdog@
To: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
 <20250418-watchdog-v1-3-987ff2046272@posteo.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250418-watchdog-v1-3-987ff2046272@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 18/04/2025 à 21:28, J. Neuschäfer via B4 Relay a écrit :
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> The watchdog.yaml schema prescribes a node name of "timer" or "watchdog"
> rather than the abbreviation "wdt".
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts  | 4 ++--
>   arch/powerpc/boot/dts/fsl/gef_sbc310.dts | 4 ++--
>   arch/powerpc/boot/dts/fsl/gef_sbc610.dts | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts b/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts
> index fc92bb032c517a543d6e1e498ab903f1937414f8..48a81430a8a31fc29b53fba03986b2fb984b66c1 100644
> --- a/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts
> +++ b/arch/powerpc/boot/dts/fsl/gef_ppc9a.dts
> @@ -82,7 +82,7 @@ fpga@4,0 {
>   			reg = <0x4 0x0 0x40>;
>   		};
>   
> -		wdt@4,2000 {
> +		watchdog@4,2000 {
>   			compatible = "gef,ppc9a-fpga-wdt", "gef,fpga-wdt-1.00",
>   				"gef,fpga-wdt";
>   			reg = <0x4 0x2000 0x8>;
> @@ -90,7 +90,7 @@ wdt@4,2000 {
>   			interrupt-parent = <&gef_pic>;
>   		};
>   		/* Second watchdog available, driver currently supports one.
> -		wdt@4,2010 {
> +		watchdog@4,2010 {
>   			compatible = "gef,ppc9a-fpga-wdt", "gef,fpga-wdt-1.00",
>   				"gef,fpga-wdt";
>   			reg = <0x4 0x2010 0x8>;
> diff --git a/arch/powerpc/boot/dts/fsl/gef_sbc310.dts b/arch/powerpc/boot/dts/fsl/gef_sbc310.dts
> index 47ae85c34635bb0165004e52d15df92542406b15..8eb254b1738dde7327d5e3fc07b4bbba137b4d9c 100644
> --- a/arch/powerpc/boot/dts/fsl/gef_sbc310.dts
> +++ b/arch/powerpc/boot/dts/fsl/gef_sbc310.dts
> @@ -79,7 +79,7 @@ fpga@4,0 {
>   			reg = <0x4 0x0 0x40>;
>   		};
>   
> -		wdt@4,2000 {
> +		watchdog@4,2000 {
>   			compatible = "gef,sbc310-fpga-wdt", "gef,fpga-wdt-1.00",
>   				"gef,fpga-wdt";
>   			reg = <0x4 0x2000 0x8>;
> @@ -87,7 +87,7 @@ wdt@4,2000 {
>   			interrupt-parent = <&gef_pic>;
>   		};
>   /*
> -		wdt@4,2010 {
> +		watchdog@4,2010 {
>   			compatible = "gef,sbc310-fpga-wdt", "gef,fpga-wdt-1.00",
>   				"gef,fpga-wdt";
>   			reg = <0x4 0x2010 0x8>;
> diff --git a/arch/powerpc/boot/dts/fsl/gef_sbc610.dts b/arch/powerpc/boot/dts/fsl/gef_sbc610.dts
> index 5322be44b62e78bebac0fa92c0de05094b186dde..02edbb262b8f00279dea024700eebf874501f6d5 100644
> --- a/arch/powerpc/boot/dts/fsl/gef_sbc610.dts
> +++ b/arch/powerpc/boot/dts/fsl/gef_sbc610.dts
> @@ -82,14 +82,14 @@ fpga@4,0 {
>   			reg = <0x4 0x0 0x40>;
>   		};
>   
> -		wdt@4,2000 {
> +		watchdog@4,2000 {
>   			compatible = "gef,fpga-wdt";
>   			reg = <0x4 0x2000 0x8>;
>   			interrupts = <0x1a 0x4>;
>   			interrupt-parent = <&gef_pic>;
>   		};
>   		/* Second watchdog available, driver currently supports one.
> -		wdt@4,2010 {
> +		watchdog@4,2010 {
>   			compatible = "gef,fpga-wdt";
>   			reg = <0x4 0x2010 0x8>;
>   			interrupts = <0x1b 0x4>;
> 


