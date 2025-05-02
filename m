Return-Path: <linuxppc-dev+bounces-8256-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0522FAA70E0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 13:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zpq4K6jkMz2xk5;
	Fri,  2 May 2025 21:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746186641;
	cv=none; b=KoU7kU40g32CEiNO6zagLEdMvuZL329Kv+WOMsclAe3LhD4gUVn2bUKeU1biPy+8KG08Gsn1NV/r6nlm43hQddWKTavwKH+aBAeXM6z1mu0LUGc5g06S94Q9hQpCSK7lxxinb8WUjLVEKrzwBU//BSDL0kf+tDrjfAXD7kzXdc1vOxBEEzR9t2O2Fod+wkGDxNkNMnZtjLSRXsP4YhpOpYn13uWLDRGhgZZpjN2/eWg9F3dVYd2FUNmNxA0tyanclCmLMwyY/pzQb+dkiyKXdorQVOeUwOyZuEMrXR+xknkpjaotyD4hodrfWjKyQmI0Wli0ql5+OeWIQelUiW/Qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746186641; c=relaxed/relaxed;
	bh=Hvoeups9LPhMXk26wpQZdee2o3oiiOxlmHryyuLeJjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNrX9LWbDQEs/tIy2A+EgowBypzeFp1A/HYfx2J9ZpdZpqRe5/OkkDK5Rrs6ctQz9qJz/8eoXt9LhNsaZKKMYNIbkmoPhtI68xzB/oYjaZwZpWLhYArG1nFVrIctZ176vF6CTz3XwPrk+Cd0kVDRl8wLmMCEEij9+zW03xP2RZ5J2pa3Ow5RI3ChQxNhaU/DaNfiI3OlBYTZB8wCNnQL2e8BsDNVZA9XFq6WqdwdOdKhrTxYNIAYo94xqlNiJQYDMF2u6A0RI6Ef9ZYn5XiPRRG/12UCvvPrl/mO9KWQpzUinuLs0P1JldN6tfs209AallSNmsPlS0Ia/QaFGd9RVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zpq4F19YPz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 21:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zpmzx4D1pz9sZD;
	Fri,  2 May 2025 12:16:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxByDrBKRY1d; Fri,  2 May 2025 12:16:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zpmzx3FcJz9sZ2;
	Fri,  2 May 2025 12:16:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 698028B765;
	Fri,  2 May 2025 12:16:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LCIcupk9Whb1; Fri,  2 May 2025 12:16:45 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1FA4E8B763;
	Fri,  2 May 2025 12:16:45 +0200 (CEST)
Message-ID: <897452a6-4c78-4aa6-9f6a-18e8720076ae@csgroup.eu>
Date: Fri, 2 May 2025 12:16:44 +0200
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
Subject: Re: [PATCH 4/6] powerpc: fix sparse warnings
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
Cc: npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250422131040.374427-1-maddy@linux.ibm.com>
 <20250422131040.374427-5-maddy@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250422131040.374427-5-maddy@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/04/2025 à 15:10, Madhavan Srinivasan a écrit :
> structs are local to the source and does not need to
> be in global scope, so make it static.
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>   arch/powerpc/kernel/btext.c              | 2 +-
>   arch/powerpc/kernel/setup-common.c       | 2 +-
>   arch/powerpc/platforms/powernv/opal.c    | 2 +-
>   arch/powerpc/platforms/pseries/lparcfg.c | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
> index 7f63f1cdc6c3..fc7f5a5b6d76 100644
> --- a/arch/powerpc/kernel/btext.c
> +++ b/arch/powerpc/kernel/btext.c
> @@ -40,7 +40,7 @@ static int dispDeviceRect[4] __force_data;
>   static unsigned char *dispDeviceBase __force_data;
>   static unsigned char *logicalDisplayBase __force_data;
>   
> -unsigned long disp_BAT[2] __initdata = {0, 0};
> +static unsigned long disp_BAT[2] __initdata = {0, 0};

disp_BAT is used in assembly, has to remain global:

arch/powerpc/kernel/head_book3s_32.S:   addis   r8,r3,disp_BAT@ha
arch/powerpc/kernel/head_book3s_32.S:   addi    r8,r8,disp_BAT@l

Christophe


