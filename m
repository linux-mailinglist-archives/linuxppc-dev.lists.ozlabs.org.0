Return-Path: <linuxppc-dev+bounces-11657-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E57DEB41A86
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 11:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGyXY3VLmz2yrV;
	Wed,  3 Sep 2025 19:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756893037;
	cv=none; b=TqpjZ8Wmm/FbMWIFQV2KQ5LXgi/2tCYNr06gwJFCD9ORtsOP3/qpX10g8kCNkT15QFUuAOS/dTIzEj1UaDNHugTs5nqVt1u65/LajsYTH8XvR+gkFd3O7BzLqoeENNqF71ts7NSJ+aye4xQaw5DyTyn/PniP85DVvYanQer76T/7+chJC9VElHbuTjKEmYKuTjvOPN4tJkjHIqCXkLzrv5+69lcrkCK282LmMw3wqo0Py2v9V9xgnFjzpw8HQLztAQQKg2sGkz9oxYDy6orFLv4W5dg30mlGxBNKKscg46mKqHvaGeqlcvTH4M/cCG8zUUu1kmZz0826NlqEeZDlMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756893037; c=relaxed/relaxed;
	bh=ot/54tgNiSSTgP17tACa3Qi5C4nX6m4lf8PQn/BROgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YH2ApiwRg4r3kDV6NFalLIrKFEEO4t8Dl4gNziAzu1nA809mztjLudF9AQsFX72wzTjK/w/mfsmsLb7m0U398KOdaTfrWRYuDl4Y6M4qqhAtllNWBcoPdIIprjx1VP4Om5eIHyRZ6Ol+GB71bFIR6XSYUC/kpyXJ/iriJMCFWeBaEPZBj3Xwp4jfrbkxdMmXf6fx6jTg3Iz3Y3x5IADua/dQ7cHGtBSD6HJVi7Z37PxSVP+HqUt/ZYD4KnbJ8IIwCJQbgPnvYCNHzrX02WUgQrra+5F8iZdCGuc9DZJZQ5HMoDSstULZTEXjMjdF2Gj+88G6EGwrBL2qPBe87s12ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGyXX3mVkz2xrL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 19:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cGy2X3V7Dz9sSC;
	Wed,  3 Sep 2025 11:28:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oT-7cP3vo05a; Wed,  3 Sep 2025 11:28:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cGy2X2fQ3z9sRy;
	Wed,  3 Sep 2025 11:28:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4406F8B764;
	Wed,  3 Sep 2025 11:28:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ogUe_nDKrpw7; Wed,  3 Sep 2025 11:28:04 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EDDF48B763;
	Wed,  3 Sep 2025 11:28:03 +0200 (CEST)
Message-ID: <77252ee2-4640-45f4-a7cb-76e2d47ed0c4@csgroup.eu>
Date: Wed, 3 Sep 2025 11:28:03 +0200
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
Subject: Re: [PATCH] powerpc/32: Restore clearing of MSR[RI] in
 interrupt_exit_kernel_prepare()
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <e6166d2568386517de96a89e6cb3c7bd67e71eec.1756723048.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <e6166d2568386517de96a89e6cb3c7bd67e71eec.1756723048.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 01/09/2025 à 12:37, Christophe Leroy a écrit :
> Commit 13799748b957 ("powerpc/64: use interrupt restart table to speed
> up return from interrupt") removed the inconditional clearing of MSR[RI]
> when returning from interrupt into kernel. But powerpc/32 doesn't
> implement interrupt restart table hence still need MSR[RI] to be
> cleared.

This is needed but not enough. A synchronisation instruction is needed 
after clearing MSR[RI], otherwise the Instruction Breakpoint still 
triggers on a few instructions passed clearing of RI, allthough the 
LCTRL2[BRKNOMSK] is unset, meaning "Masked mode, breakpoints are 
recognized only when MSR[RI] =1 (reset value)"

We could as a isync() after __hard_EE_RI_disable(), but to minimise the 
impact it will be better to move clearing of MSR[RI] in the low-level 
assembly part of interrupt exit, just before the mtspr to SRR0 and SRR1, 
as was done before commit 6f76a01173cc ("powerpc/syscall: implement 
system call entry/exit logic in C for PPC32")

> 
> Fixes: 13799748b957 ("powerpc/64: use interrupt restart table to speed up return from interrupt")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   arch/powerpc/kernel/interrupt.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index e0c681d0b076..e63bfde13e03 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -443,6 +443,9 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>   
>   		if (unlikely(stack_store))
>   			__hard_EE_RI_disable();
> +#else
> +	} else {
> +		__hard_EE_RI_disable();
>   #endif /* CONFIG_PPC64 */
>   	}
>   


