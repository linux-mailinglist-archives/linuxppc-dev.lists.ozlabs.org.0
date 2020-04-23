Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F8D1B606A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 18:10:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497Mhh1WhbzDqDh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 02:10:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=c/+9v89N; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497M4Y2q60zDqY4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 01:42:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 497M4N5NLDz9tyyH;
 Thu, 23 Apr 2020 17:42:12 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=c/+9v89N; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xGUz_glm_IvS; Thu, 23 Apr 2020 17:42:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 497M4N49nZz9tyyG;
 Thu, 23 Apr 2020 17:42:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587656532; bh=Znh15X+b4U0vd1E+0Rv9Pmk7xP3BxycJASejdfvo3Fk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=c/+9v89NPd6yNaIfPQ8w+j35oDxN9PYBhYYahB4W87FSTRs2ZaxkR3/Ot6WitPSsK
 Sh83dQTlCAoiGaIBAgVHpre/SyE3P71yNJ4Fjhu/rZZtmYAi5SPx3EzplFR+y1hV5w
 1IOntAZQbj9YOEV3ghGH6/uYpaMTSp91t3KSbN30=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 55E2D8B86B;
 Thu, 23 Apr 2020 17:42:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cr1XBy2sneyu; Thu, 23 Apr 2020 17:42:14 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E480F8B868;
 Thu, 23 Apr 2020 17:42:13 +0200 (CEST)
Subject: Re: [PATCH 3/3] powerpc/kprobes: Check return value of
 patch_instruction()
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <3a132ac385340244b8d74179ac7bbbda7bf1f503.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e2fae53a-f00b-b692-d638-f75c8f04feb8@c-s.fr>
Date: Thu, 23 Apr 2020 17:41:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3a132ac385340244b8d74179ac7bbbda7bf1f503.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/04/2020 à 17:09, Naveen N. Rao a écrit :
> patch_instruction() can fail in some scenarios. Add appropriate error
> checking so that such failures are caught and logged, and suitable error
> code is returned.
> 
> Fixes: d07df82c43be8 ("powerpc/kprobes: Move kprobes over to patch_instruction()")
> Fixes: f3eca95638931 ("powerpc/kprobes/optprobes: Use patch_instruction()")
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>   arch/powerpc/kernel/kprobes.c   | 10 +++-
>   arch/powerpc/kernel/optprobes.c | 99 ++++++++++++++++++++++++++-------
>   2 files changed, 87 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 81efb605113e..4a297ae2bd87 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -138,13 +138,19 @@ NOKPROBE_SYMBOL(arch_prepare_kprobe);
>   
>   void arch_arm_kprobe(struct kprobe *p)
>   {
> -	patch_instruction(p->addr, BREAKPOINT_INSTRUCTION);
> +	int rc = patch_instruction(p->addr, BREAKPOINT_INSTRUCTION);
> +
> +	if (rc)
> +		WARN("Failed to patch trap at 0x%pK: %d\n", (void *)p->addr, rc);
>   }
>   NOKPROBE_SYMBOL(arch_arm_kprobe);
>   
>   void arch_disarm_kprobe(struct kprobe *p)
>   {
> -	patch_instruction(p->addr, p->opcode);
> +	int rc = patch_instruction(p->addr, p->opcode);
> +
> +	if (rc)
> +		WARN("Failed to remove trap at 0x%pK: %d\n", (void *)p->addr, rc);
>   }
>   NOKPROBE_SYMBOL(arch_disarm_kprobe);
>   
> diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
> index 024f7aad1952..046485bb0a52 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -139,52 +139,67 @@ void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
>   	}
>   }
>   
> +#define PATCH_INSN(addr, instr)						     \
> +do {									     \
> +	int rc = patch_instruction((unsigned int *)(addr), instr);	     \
> +	if (rc) {							     \
> +		pr_err("%s:%d Error patching instruction at 0x%pK (%pS): %d\n", \
> +				__func__, __LINE__,			     \
> +				(void *)(addr), (void *)(addr), rc);	     \
> +		return rc;						     \
> +	}								     \
> +} while (0)
> +

I hate this kind of macro which hides the "return".

What about keeping the return action in the caller ?

Otherwise, what about implementing something based on the use of goto, 
on the same model as unsafe_put_user() for instance ?


Christophe
