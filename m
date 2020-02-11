Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F403B158A0D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 07:48:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GtdF3rShzDq83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 17:48:01 +1100 (AEDT)
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
 header.s=mail header.b=bG4vKByj; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gtbb1D0HzDq83
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 17:46:35 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48GtbW1zZ2z9v4k2;
 Tue, 11 Feb 2020 07:46:31 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=bG4vKByj; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8AVFjcvSjdwk; Tue, 11 Feb 2020 07:46:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48GtbW0mDTz9v4k1;
 Tue, 11 Feb 2020 07:46:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581403591; bh=CfS90PJDXd7ciwM1CoDr/0z6lK+kxHZC4z7ijwcEBGY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bG4vKByj9PM06+wzfFf+pgv/SnearNd9Tv+Bbzw5IJVNEdi1OtE0ZujLbVkp7EG2t
 h8ztXyTrBlBo5IozQ+DmmhPFB8MdD9H4JgY9qXr7raVmtSSeKrC+6eJCbfww9G2RwE
 dkO3VLcxVMSnfDAeRU0jFVaLQ9t+wJGzSR4ai988=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F271B8B78C;
 Tue, 11 Feb 2020 07:46:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 86Jp_LQHABd9; Tue, 11 Feb 2020 07:46:31 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C1508B776;
 Tue, 11 Feb 2020 07:46:31 +0100 (CET)
Subject: Re: [PATCH v2 10/13] powerpc/kprobes: Support kprobes on prefixed
 instructions
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200211053355.21574-1-jniethe5@gmail.com>
 <20200211053355.21574-11-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <4557dfcc-064f-6c94-7620-df13370b6cfb@c-s.fr>
Date: Tue, 11 Feb 2020 07:46:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211053355.21574-11-jniethe5@gmail.com>
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
Cc: bala24@linux.ibm.com, alistair@popple.id.au, mpe@ellerman.id.a,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/02/2020 à 06:33, Jordan Niethe a écrit :
> A prefixed instruction is composed of a word prefix followed by a word
> suffix. It does not make sense to be able to have a kprobe on the suffix
> of a prefixed instruction, so make this impossible.
> 
> Kprobes work by replacing an instruction with a trap and saving that
> instruction to be single stepped out of place later. Currently there is
> not enough space allocated to keep a prefixed instruction for single
> stepping. Increase the amount of space allocated for holding the
> instruction copy.
> 
> kprobe_post_handler() expects all instructions to be 4 bytes long which
> means that it does not function correctly for prefixed instructions.
> Add checks for prefixed instructions which will use a length of 8 bytes
> instead.
> 
> For optprobes we normally patch in loading the instruction we put a
> probe on into r4 before calling emulate_step(). We now make space and
> patch in loading the suffix into r5 as well.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>   arch/powerpc/include/asm/kprobes.h   |  5 +--
>   arch/powerpc/kernel/kprobes.c        | 47 +++++++++++++++++++++-------
>   arch/powerpc/kernel/optprobes.c      | 32 ++++++++++---------
>   arch/powerpc/kernel/optprobes_head.S |  6 ++++
>   4 files changed, 63 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kprobes.h b/arch/powerpc/include/asm/kprobes.h
> index 66b3f2983b22..0d44ce8a3163 100644
> --- a/arch/powerpc/include/asm/kprobes.h
> +++ b/arch/powerpc/include/asm/kprobes.h
> @@ -38,12 +38,13 @@ extern kprobe_opcode_t optprobe_template_entry[];
>   extern kprobe_opcode_t optprobe_template_op_address[];
>   extern kprobe_opcode_t optprobe_template_call_handler[];
>   extern kprobe_opcode_t optprobe_template_insn[];
> +extern kprobe_opcode_t optprobe_template_suffix[];
>   extern kprobe_opcode_t optprobe_template_call_emulate[];
>   extern kprobe_opcode_t optprobe_template_ret[];
>   extern kprobe_opcode_t optprobe_template_end[];
>   
> -/* Fixed instruction size for powerpc */
> -#define MAX_INSN_SIZE		1
> +/* Prefixed instructions are two words */
> +#define MAX_INSN_SIZE		2
>   #define MAX_OPTIMIZED_LENGTH	sizeof(kprobe_opcode_t)	/* 4 bytes */
>   #define MAX_OPTINSN_SIZE	(optprobe_template_end - optprobe_template_entry)
>   #define RELATIVEJUMP_SIZE	sizeof(kprobe_opcode_t)	/* 4 bytes */
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 24a56f062d9e..b061deba4fe7 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -104,17 +104,30 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
>   
>   int arch_prepare_kprobe(struct kprobe *p)
>   {
> +	int len;
>   	int ret = 0;
> +	struct kprobe *prev;
>   	kprobe_opcode_t insn = *p->addr;
> +	kprobe_opcode_t prefix = *(p->addr - 1);
>   
> +	preempt_disable();
>   	if ((unsigned long)p->addr & 0x03) {
>   		printk("Attempt to register kprobe at an unaligned address\n");
>   		ret = -EINVAL;
>   	} else if (IS_MTMSRD(insn) || IS_RFID(insn) || IS_RFI(insn)) {
>   		printk("Cannot register a kprobe on rfi/rfid or mtmsr[d]\n");
>   		ret = -EINVAL;
> +	} else if (IS_PREFIX(prefix)) {
> +		printk("Cannot register a kprobe on the second word of prefixed instruction\n");
> +		ret = -EINVAL;
> +	}
> +	prev = get_kprobe(p->addr - 1);
> +	if (prev && IS_PREFIX(*prev->ainsn.insn)) {
> +		printk("Cannot register a kprobe on the second word of prefixed instruction\n");
> +		ret = -EINVAL;
>   	}
>   
> +
>   	/* insn must be on a special executable page on ppc64.  This is
>   	 * not explicitly required on ppc32 (right now), but it doesn't hurt */
>   	if (!ret) {
> @@ -124,14 +137,18 @@ int arch_prepare_kprobe(struct kprobe *p)
>   	}
>   
>   	if (!ret) {
> -		memcpy(p->ainsn.insn, p->addr,
> -				MAX_INSN_SIZE * sizeof(kprobe_opcode_t));
> +		if (IS_PREFIX(insn))
> +			len = MAX_INSN_SIZE * sizeof(kprobe_opcode_t);
> +		else
> +			len = sizeof(kprobe_opcode_t);
> +		memcpy(p->ainsn.insn, p->addr, len);

This code is about to get changed, see 
https://patchwork.ozlabs.org/patch/1232619/

>   		p->opcode = *p->addr;
>   		flush_icache_range((unsigned long)p->ainsn.insn,
>   			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
>   	}
>   
>   	p->ainsn.boostable = 0;
> +	preempt_enable_no_resched();
>   	return ret;
>   }
>   NOKPROBE_SYMBOL(arch_prepare_kprobe);
> @@ -216,10 +233,11 @@ NOKPROBE_SYMBOL(arch_prepare_kretprobe);
>   static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
>   {
>   	int ret;
> -	unsigned int insn = *p->ainsn.insn;
> +	unsigned int insn = p->ainsn.insn[0];
> +	unsigned int suffix = p->ainsn.insn[1];
>   
>   	/* regs->nip is also adjusted if emulate_step returns 1 */
> -	ret = emulate_step(regs, insn, PPC_NO_SUFFIX);
> +	ret = emulate_step(regs, insn, suffix);
>   	if (ret > 0) {
>   		/*
>   		 * Once this instruction has been boosted
> @@ -233,7 +251,11 @@ static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
>   		 * So, we should never get here... but, its still
>   		 * good to catch them, just in case...
>   		 */
> -		printk("Can't step on instruction %x\n", insn);
> +		if (!IS_PREFIX(insn))
> +			printk("Can't step on instruction %x\n", insn);
> +		else
> +			printk("Can't step on instruction %x %x\n", insn,
> +			       suffix);

Maybe %x:%x as in xmon ?

Christophe
