Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE2F19F1DA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 10:53:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wkps5PbMzDqXZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 18:53:41 +1000 (AEST)
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
 header.s=mail header.b=Wg9zAGcZ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wk7T583bzDqNs
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 18:22:59 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wk7D5SWwzB09Zj;
 Mon,  6 Apr 2020 10:22:48 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Wg9zAGcZ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VsZigCgSnL6N; Mon,  6 Apr 2020 10:22:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wk7D4QHTzB09Zf;
 Mon,  6 Apr 2020 10:22:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586161368; bh=JF58x+OyqqGUOc9uBpvPDnSB4zGNGE4eIGdY1JoHsxY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Wg9zAGcZrFjE9k8qIHL4YEFQpg49IOsrKs20RcqU6ffiCxdfvu8ldOoAyMKq73PxQ
 a2NqBYHEGpWzgz3pxe65Ro+XdsZIHW3UJ2Qn+mGoO4zkdEVk5l7VONVJbah0aIgTsA
 zkpx/T2Iaw/pt3JKLADQfwPggSsNy+IBCOsxEAQ8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AC148B777;
 Mon,  6 Apr 2020 10:22:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gQS19J4XO3ZL; Mon,  6 Apr 2020 10:22:53 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 40EE08B752;
 Mon,  6 Apr 2020 10:22:52 +0200 (CEST)
Subject: Re: [PATCH v5 05/21] powerpc: Use a function for getting the
 instruction op code
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-6-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <cedd91d6-033a-c503-4b30-9366cac5bc7f@c-s.fr>
Date: Mon, 6 Apr 2020 10:22:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406080936.7180-6-jniethe5@gmail.com>
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
Cc: bala24@linux.ibm.com, alistair@popple.id.au, dja@axtens.net,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/04/2020 à 10:09, Jordan Niethe a écrit :
> In preparation for using a data type for instructions that can not be
> directly used with the '>>' operator use a function for getting the op
> code of an instruction.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> ---
>   arch/powerpc/include/asm/inst.h  | 5 +++++
>   arch/powerpc/kernel/align.c      | 2 +-
>   arch/powerpc/lib/code-patching.c | 4 ++--

What about store_updates_sp() in mm/fault.c ?

Christophe

>   3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> index 5298ba33b6e5..93959016fe4b 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -8,4 +8,9 @@
>   
>   #define ppc_inst(x) (x)
>   
> +static inline int ppc_inst_opcode(u32 x)
> +{
> +	return x >> 26;
> +}
> +
>   #endif /* _ASM_INST_H */
> diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> index 86e9bf62f18c..691013aa9f3c 100644
> --- a/arch/powerpc/kernel/align.c
> +++ b/arch/powerpc/kernel/align.c
> @@ -314,7 +314,7 @@ int fix_alignment(struct pt_regs *regs)
>   	}
>   
>   #ifdef CONFIG_SPE
> -	if ((instr >> 26) == 0x4) {
> +	if (ppc_inst_opcode(instr) == 0x4) {
>   		int reg = (instr >> 21) & 0x1f;
>   		PPC_WARN_ALIGNMENT(spe, regs);
>   		return emulate_spe(regs, reg, instr);
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index fdf0d6ea3575..099a515202aa 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -231,7 +231,7 @@ bool is_offset_in_branch_range(long offset)
>    */
>   bool is_conditional_branch(unsigned int instr)
>   {
> -	unsigned int opcode = instr >> 26;
> +	unsigned int opcode = ppc_inst_opcode(instr);
>   
>   	if (opcode == 16)       /* bc, bca, bcl, bcla */
>   		return true;
> @@ -289,7 +289,7 @@ int create_cond_branch(unsigned int *instr, const unsigned int *addr,
>   
>   static unsigned int branch_opcode(unsigned int instr)
>   {
> -	return (instr >> 26) & 0x3F;
> +	return ppc_inst_opcode(instr) & 0x3F;
>   }
>   
>   static int instr_is_branch_iform(unsigned int instr)
> 
