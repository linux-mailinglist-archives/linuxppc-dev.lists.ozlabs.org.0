Return-Path: <linuxppc-dev+bounces-12773-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F373ABCD9C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Oct 2025 16:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjqRf06Vxz2yrT;
	Sat, 11 Oct 2025 01:50:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760107837;
	cv=none; b=Ie5bDY0vNE02ZkR5n0NDkXEtdqg5hpnPUNIhCDD41XUOt1t4YA2PrCB1dGFp6prSWUkRLn6cQI0ne/gD5hoS8+8Ly6JgQPNhmicj5HTw+ehDrIxxKlyEq5JBMc+4dtlgm99RdkgnIhF05oXg9ZS2NJXFJLRZCtlmj4L6WSmSIFiavtOm/xZqfjrSY0tUMv6kQq0T3qZ5tOf4v1vKdoDg0qHWh7RUrzSzHWNFqLG3/mCB38CYC4TmJM/CzCFq6yz4GCnrBQNq8A8REVuiZE+/vaVo0/994TnwMMEAXmrBAJnB0L4h51XYRSwB4k74AEZ3SZvjmXXNP9qui0klHHVbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760107837; c=relaxed/relaxed;
	bh=GDWEk3KJMGVR0OHtPOF+KV4MFc+OSXCSrmTuqCvwD6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nkSPgwXfUHh4T31sd5qvO69mJXCdA2YXrCWgPtjwtcoZlVeRDFZvEryviuHxIh1/KX+4yF6GYifaD/oG8VFP24qNFemtyziMwtxQY89u/sRyvj+rZAsIY2L9kJA4u03nhb1yqU3EAW7/owF9dcQybcLmar0d2/H17W//iPspsWLMOi5rq+Xc/av4QhPHTYSeVnsxxO1ZQfvKK/hqgR52uhuk/knrALN0PgSQTCnmy6f7ZQ5ef3ySmk18eytoH86ojs13zRZuWOyGNgarUVxTDlSgIf9VVx4s1FDf/MSv3WqPv/MncJxYtPS/X7XTYt/Du46NWuW1imsz1L7Ylw9sgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjqRd0Fcfz2y8B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Oct 2025 01:50:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cjpzk4Kbmz9sS8;
	Fri, 10 Oct 2025 16:29:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kVVLb1asJWS3; Fri, 10 Oct 2025 16:29:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cjpzk3d5Tz9sRy;
	Fri, 10 Oct 2025 16:29:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6BC278B774;
	Fri, 10 Oct 2025 16:29:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dGGoIumUbtKf; Fri, 10 Oct 2025 16:29:54 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E9038B763;
	Fri, 10 Oct 2025 16:29:54 +0200 (CEST)
Message-ID: <fd1fbd79-734c-47c7-b229-a985e9761da3@csgroup.eu>
Date: Fri, 10 Oct 2025 16:29:53 +0200
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
Subject: Re: [PATCH] 85xx: Add several root nodes to probe
To: linuxppc-dev@lists.ozlabs.org, Scott Wood <oss@buserror.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <2025042122-shiny-vicugna-28507c@boujee-and-buff>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <2025042122-shiny-vicugna-28507c@boujee-and-buff>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/04/2025 à 04:40, Ben Collins a écrit :
> T4240 fails to hafve ifc, rapidio, and localbus probed.
> 
> This matches other QorIQ platforms and ensures devices under these nodes
> get added as platform devices.

What do you mean by "this matches other platforms" ? I can't grep any 
other platform file with "fsl,ifc" or "rapidio"

Christophe

> 
> Signed-off-by: Ben Collins <bcollins@kernel.org>
> Cc: Scott Wood <oss@buserror.net>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   arch/powerpc/platforms/85xx/corenet_generic.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
> index c44400e95f551..c81b8a47f3b0f 100644
> --- a/arch/powerpc/platforms/85xx/corenet_generic.c
> +++ b/arch/powerpc/platforms/85xx/corenet_generic.c
> @@ -61,6 +61,9 @@ static const struct of_device_id of_device_ids[] = {
>   	{
>   		.compatible	= "simple-bus"
>   	},
> +	{
> +		.compatible	= "fsl,ifc"
> +	},
>   	{
>   		.compatible	= "mdio-mux-gpio"
>   	},
> @@ -91,6 +94,12 @@ static const struct of_device_id of_device_ids[] = {
>   	{
>   		.compatible	= "fsl,qe",
>   	},
> +	{
> +		.name           = "localbus",
> +	},
> +	{
> +		.name		= "rapidio",
> +	},
>   	/* The following two are for the Freescale hypervisor */
>   	{
>   		.name		= "hypervisor",


