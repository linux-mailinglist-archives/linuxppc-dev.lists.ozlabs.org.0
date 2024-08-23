Return-Path: <linuxppc-dev+bounces-445-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AE595C7BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:14:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqtC03mjgz2xYr;
	Fri, 23 Aug 2024 18:14:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400860;
	cv=none; b=ZVBOaW4cfNJZgQUos/cvO1m/Ex+f1MWZheeusSFBbjVYCozRJ9SQfCWNJrPHon6+8ouQwjTlUPbOHgbAjQ+PMSwobOHdm4eFuyPukCA27QNaXkh8U31c+1JyWpSILmw8N0RlnBu6GfyeSHa1gJFIxTK2+v+tKOxtlfQ6BJeaFEKC3/DIMcPZObUjl2TKRsKUYGrhUTL9nVugRy+fwhbMDK9MKyQ+ZnKPGyEX12Ie6BYnshw4rxz/idbyC5YwA4Xuw+5tn9nqS65TWKl69DJDgrsxtLvaZgy4kJhYlHD7q91QNbUPCFZK173EgPx36dnRgj1Fj6Dngm7n3tuVdTCFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400860; c=relaxed/relaxed;
	bh=dHBP28zqr0s4gnpW30LwSQ5PZz4WWS0SNwbj3hxl/no=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=ci8ORELngcgUXwzQQ9lOhB1y8mANjhyis0iTx82CeWCvZ0CPyeKwlgKWfZlX4lnnZFKBwp/kKctZ0ddlbo4P041UJL/osDtkk79/6BOUNXCjaEYcW+QahoF2kz9bYFYLv7f3Qw7I8FNrEfAxsNK8Gm3+/SOEDqhACL7/PX5UvK28PWxOuR/8SpOQsa6AseBQgB92BMQiM0PwcoJe694bx+phvufU46meb8HliMghjxCdFGh0NzXMoVzgwEOUD2dS0lxo/h/E9M9byzj1n+KXaSszG2ibkQsHPnfyWNExPMR1nAzhqCJDeMwGOVxJn9AfeGfebNuAnRNyprfSiGWE+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqtC01dvvz2xWZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:14:19 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqtBx1cqPz9sRr;
	Fri, 23 Aug 2024 10:14:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fcAlrhSmdtDo; Fri, 23 Aug 2024 10:14:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqtBx0rp4z9rvV;
	Fri, 23 Aug 2024 10:14:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B04B8B77D;
	Fri, 23 Aug 2024 10:14:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id V25q8XIA9PCy; Fri, 23 Aug 2024 10:14:16 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8036E8B763;
	Fri, 23 Aug 2024 10:14:16 +0200 (CEST)
Message-ID: <a79ef3a8-8754-4b74-9336-a06a17ac88a7@csgroup.eu>
Date: Fri, 23 Aug 2024 10:14:15 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/36] soc: fsl: qe: Add missing PUSHSCHED command
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-34-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-34-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> The PUSHSCHED command is missing in the QE header file.
> 
> This command is supported on MPC8321 and is used to modify the start
> address for the task running on a given peripheral. It is needed for the
> QMC in order to perform the re-initialization procedure and so, ensure
> the correct UCC setup in that case.
> 
> Simply add the missing command in the commands list available in the QE
> header file.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   include/soc/fsl/qe/qe.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
> index 629835b6c71d..8f967d15e479 100644
> --- a/include/soc/fsl/qe/qe.h
> +++ b/include/soc/fsl/qe/qe.h
> @@ -469,6 +469,7 @@ enum comm_dir {
>   #define QE_QMC_STOP_TX			0x0000000c
>   #define QE_QMC_STOP_RX			0x0000000d
>   #define QE_SS7_SU_FIL_RESET		0x0000000e
> +#define QE_PUSHSCHED			0x0000000f
>   /* jonathbr added from here down for 83xx */
>   #define QE_RESET_BCS			0x0000000a
>   #define QE_MCC_INIT_TX_RX_16		0x00000003

