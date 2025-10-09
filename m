Return-Path: <linuxppc-dev+bounces-12751-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69417BC9DBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 17:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjDqK3hZtz2ySJ;
	Fri, 10 Oct 2025 02:50:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760025037;
	cv=none; b=i9ucMyd9OKUQIlBFRgztrGSBKK+UpxMQy3JsTsR8XnLLR13yFXwCVPOanhDoz87GlaT4fZ0SBtXcR0/9Z4EqVvQWVmiJ/OkKW0LD6QX3UuHgtWv+bSvMdJsFs9P9dxBEpBJNqDQ/Ap50g/YQf0z8u1jHLHXt/AfaKL7cBg14pvg8e5/Dr8SNBS+Vt63GEvb5MV9ZjEZxwlFtEXhi0rYI6tOPy6aTcHJVyyRnaEqF4ZnW6MB1TQ73ji16NlrrrY5r6aMmkrMq2RHL/RcOXpr8Dkz5ITGg4l5aovyKpaxVth5vvIgcFHY6/rJQWNLZNsK0yfIlBOD1ET16dM6YuZrhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760025037; c=relaxed/relaxed;
	bh=rpgmLafL4bilKiy19HaYhuGgCDuEAMpY9ohRqHMRzBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RyrXvFT3EzJq1+1dKrUVAgChYo9OfzsmnzAOA5bJ8IReeTrT7A5P5O3VYRtl/PI+lty/yExGWfhhz5Irrr/sV5oEfzgKzGkkYsOCnQ8nix8smRjZm+I2muxmAz8rKs84EBJW/AZ8JcR3Wk2UDGDhBmsrnIBY45YfWDb5KMqCXjZ19lMN1Y2u6oKc+ow7OUfRAOPWvZfE5NIUFkQMXVy25BnJB6DWskOq44mAC6rdK1oiM+Wrax+gGKnAK/r/KzUa/laapT0lE9DMlMgHnsPRUVi9KH3PQBfEhPF6Wy1/auJQBn5ZnTw4cDentSvE/urHV67sblQqf4zVI7njS8VjKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjDqJ3mmrz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 02:50:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cjBZr0N1Cz9sVP;
	Thu,  9 Oct 2025 16:09:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PxhQ5bNCSMfs; Thu,  9 Oct 2025 16:09:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cjBZY3J3Rz9sVc;
	Thu,  9 Oct 2025 16:09:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D9C78B774;
	Thu,  9 Oct 2025 16:09:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dbdXZBCVk2oF; Thu,  9 Oct 2025 16:09:25 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D24D08B76D;
	Thu,  9 Oct 2025 16:09:24 +0200 (CEST)
Message-ID: <149c6b9a-5fdb-4783-b4a3-4afc368a05dd@csgroup.eu>
Date: Thu, 9 Oct 2025 16:09:24 +0200
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
Subject: Re: [PATCH 4/4] powerpc: p2020: Rename wdt@ nodes to watchdog@
To: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
 <20250418-watchdog-v1-4-987ff2046272@posteo.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250418-watchdog-v1-4-987ff2046272@posteo.net>
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
>   arch/powerpc/boot/dts/fsl/ge_imp3a.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/ge_imp3a.dts b/arch/powerpc/boot/dts/fsl/ge_imp3a.dts
> index da3de8e2b7d2c55cf735f3cfdef8729655979a06..9e5c01cfac2f8ad93dfa3b33d05b3ad3331b2c76 100644
> --- a/arch/powerpc/boot/dts/fsl/ge_imp3a.dts
> +++ b/arch/powerpc/boot/dts/fsl/ge_imp3a.dts
> @@ -94,7 +94,7 @@ gef_gpio: gpio@4,400 {
>   			gpio-controller;
>   		};
>   
> -		wdt@4,800 {
> +		watchdog@4,800 {
>   			compatible = "ge,imp3a-fpga-wdt", "gef,fpga-wdt-1.00",
>   				"gef,fpga-wdt";
>   			reg = <0x4 0x800 0x8>;
> @@ -103,7 +103,7 @@ wdt@4,800 {
>   		};
>   
>   		/* Second watchdog available, driver currently supports one.
> -		wdt@4,808 {
> +		watchdog@4,808 {
>   			compatible = "gef,imp3a-fpga-wdt", "gef,fpga-wdt-1.00",
>   				"gef,fpga-wdt";
>   			reg = <0x4 0x808 0x8>;
> 


