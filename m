Return-Path: <linuxppc-dev+bounces-12755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31386BCA6E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 19:50:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjHTs1Vdzz3cZ9;
	Fri, 10 Oct 2025 04:50:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760032241;
	cv=none; b=YS8rDEy+P1woESiKYluUgz45E5x/5/Q2fJr6sg49xgenmJXGzDx6TJiKlsrCUY6Tcs4Utr5o6/BbHKi78A7SzYsANG853PdVF/iitFYEzgN8zaiSaFSjPapQ3pG2QRfaEZ6RsdKgG8Oe5Kkkd03GTd0/8jvAWjXuzG+jau2qLGt3h5jyOj7lg5nNoZubUwRgAxuD+ic9t/QkIgEqc+FTq44KSTlAItwdfmzOOaDybY93I9+uCnSMiEOgFo82r3v5t+NdJMH6exGQUUHPeUVf93N7V6LFJTIGB8drhkm3VKPqDTEoI5PLsX5TJ37rpVVGlt+JZopPcWubE5nhvJ4dFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760032241; c=relaxed/relaxed;
	bh=xrikbbDbhNllAGlJiIii4u5mgzSyOhoR/VNmGaKX0Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJuOWEUenjyT3yG3QKnDFWV67WP6kGZzUyhWuYAmg2RUU+6Y2rEc0Jn0xO3KtwekB578TIjCt7kfNupsy5LqXGWgbZ9tEtQYi8Kadix5jWp9LtsNbk3mghEQ8U2mmX4I9fv+9afiUBzN9A4iZ9OnZrxqDG+uSlom00vhbEqT285E2E5i3xQeEsBNAlytQWkrwWqcW22S5Q7awQt1SUN5WiAJ0W970nsb9zED6Cy4fifOwsqnmVo/jHTjZEqsLFU2Ah1KQAlnDpViqAj+mXOHO4DcEMkXViZyC9xMmn0qmDBBO2IDqQ8RRsT4arQzgscJNk5fvP0XSndo2t8hMIWUnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjHTr4dHPz3cZ2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 04:50:40 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cjBYm3DcQz9sVs;
	Thu,  9 Oct 2025 16:08:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6Aqq1H6ISzC; Thu,  9 Oct 2025 16:08:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cjBYJ3yX0z9sV9;
	Thu,  9 Oct 2025 16:08:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 76C4D8B774;
	Thu,  9 Oct 2025 16:08:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id iN4ogB5yr0x2; Thu,  9 Oct 2025 16:08:20 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A9A718B76D;
	Thu,  9 Oct 2025 16:08:19 +0200 (CEST)
Message-ID: <a987652d-db73-4ec9-b3b5-3a75114ff877@csgroup.eu>
Date: Thu, 9 Oct 2025 16:08:19 +0200
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
Subject: Re: [PATCH 1/4] powerpc: 512x: Rename wdt@ node to watchdog@
To: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
 <20250418-watchdog-v1-1-987ff2046272@posteo.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250418-watchdog-v1-1-987ff2046272@posteo.net>
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
>   arch/powerpc/boot/dts/mpc5121.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/mpc5121.dtsi
> index d3fc8062fbcd7b959a7edf17c8e9a28086034d69..a278fb7b9e71182582f658b30c2ea4e962edd7b7 100644
> --- a/arch/powerpc/boot/dts/mpc5121.dtsi
> +++ b/arch/powerpc/boot/dts/mpc5121.dtsi
> @@ -112,7 +112,7 @@ ipic: interrupt-controller@c00 {
>   		};
>   
>   		/* Watchdog timer */
> -		wdt@900 {
> +		watchdog@900 {
>   			compatible = "fsl,mpc5121-wdt";
>   			reg = <0x900 0x100>;
>   		};
> 


