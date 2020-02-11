Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC94D1589E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 07:04:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Gsft5Q5YzDq9y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 17:04:22 +1100 (AEDT)
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
 header.s=mail header.b=SG4n3ucU; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GsWT29DNzDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:57:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48GsWN4jtzz9tx0s;
 Tue, 11 Feb 2020 06:57:52 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=SG4n3ucU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZmAgeeyBokvH; Tue, 11 Feb 2020 06:57:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48GsWN3WcRz9tx0b;
 Tue, 11 Feb 2020 06:57:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581400672; bh=3dl4Qm0YAdV4VER5lXcP2MtK2shMeBvYp9B9skn3Ogk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SG4n3ucU5oxriqrQBQrKD6hPvKuUeRdDDGEQWLs/GxoDxIRl3aLwv71RLm25R1T0i
 9h11Yn6qZnUTWN1Fy5MabpDKC8cBc25Ci9zu/9GVjLF1g9kItA3xisB5bBDR2m9BUM
 e0mCgf3pCFLs+dwPNHNP13OF5cbBX3sR+dfxAlR0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A1D28B78A;
 Tue, 11 Feb 2020 06:57:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LYSVE-Ser_mi; Tue, 11 Feb 2020 06:57:53 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E3E38B776;
 Tue, 11 Feb 2020 06:57:52 +0100 (CET)
Subject: Re: [PATCH v2 03/13] powerpc sstep: Prepare to support prefixed
 instructions
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200211053355.21574-1-jniethe5@gmail.com>
 <20200211053355.21574-4-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <11bf9d8f-ef21-3534-1c49-e3644a60b06d@c-s.fr>
Date: Tue, 11 Feb 2020 06:57:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211053355.21574-4-jniethe5@gmail.com>
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
> Currently all instructions are a single word long. A future ISA version
> will include prefixed instructions which have a double word length. The
> functions used for analysing and emulating instructions need to be
> modified so that they can handle these new instruction types.
> 
> A prefixed instruction is a word prefix followed by a word suffix. All
> prefixes uniquely have the primary op-code 1. Suffixes may be valid word
> instructions or instructions that only exist as suffixes.
> 
> In handling prefixed instructions it will be convenient to treat the
> suffix and prefix as separate words. To facilitate this modify
> analyse_instr() and emulate_step() to take a suffix as a
> parameter. For word instructions it does not matter what is passed in
> here - it will be ignored.
> 
> We also define a new flag, PREFIXED, to be used in instruction_op:type.
> This flag will indicate when emulating an analysed instruction if the
> NIP should be advanced by word length or double word length.
> 
> The callers of analyse_instr() and emulate_step() will need their own
> changes to be able to support prefixed instructions. For now modify them
> to pass in 0 as a suffix.
> 
> Note that at this point no prefixed instructions are emulated or
> analysed - this is just making it possible to do so.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: - Move definition of __get_user_instr() and
> __get_user_instr_inatomic() to "powerpc: Support prefixed instructions
> in alignment handler."
>      - Use a macro for returning the length of an op
>      - Rename sufx -> suffix
>      - Define and use PPC_NO_SUFFIX instead of 0
> ---
>   arch/powerpc/include/asm/ppc-opcode.h |  5 +++++
>   arch/powerpc/include/asm/sstep.h      |  9 ++++++--
>   arch/powerpc/kernel/align.c           |  2 +-
>   arch/powerpc/kernel/hw_breakpoint.c   |  4 ++--
>   arch/powerpc/kernel/kprobes.c         |  2 +-
>   arch/powerpc/kernel/mce_power.c       |  2 +-
>   arch/powerpc/kernel/optprobes.c       |  3 ++-
>   arch/powerpc/kernel/uprobes.c         |  2 +-
>   arch/powerpc/kvm/emulate_loadstore.c  |  2 +-
>   arch/powerpc/lib/sstep.c              | 12 ++++++-----
>   arch/powerpc/lib/test_emulate_step.c  | 30 +++++++++++++--------------
>   arch/powerpc/xmon/xmon.c              |  5 +++--
>   12 files changed, 46 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
> index c1df75edde44..72783bc92e50 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -377,6 +377,11 @@
>   #define PPC_INST_VCMPEQUD		0x100000c7
>   #define PPC_INST_VCMPEQUB		0x10000006
>   
> +/* macro to check if a word is a prefix */
> +#define IS_PREFIX(x)	(((x) >> 26) == 1)

Can you add an OP_PREFIX in the OP list and use it instead of '1' ?

> +#define	PPC_NO_SUFFIX	0
> +#define	PPC_INST_LENGTH(x)	(IS_PREFIX(x) ? 8 : 4)
> +
>   /* macros to insert fields into opcodes */
>   #define ___PPC_RA(a)	(((a) & 0x1f) << 16)
>   #define ___PPC_RB(b)	(((b) & 0x1f) << 11)
> diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
> index 769f055509c9..9ea8904a1549 100644
> --- a/arch/powerpc/include/asm/sstep.h
> +++ b/arch/powerpc/include/asm/sstep.h
> @@ -89,11 +89,15 @@ enum instruction_type {
>   #define VSX_LDLEFT	4	/* load VSX register from left */
>   #define VSX_CHECK_VEC	8	/* check MSR_VEC not MSR_VSX for reg >= 32 */
>   
> +/* Prefixed flag, ORed in with type */
> +#define PREFIXED	0x800
> +
>   /* Size field in type word */
>   #define SIZE(n)		((n) << 12)
>   #define GETSIZE(w)	((w) >> 12)
>   
>   #define GETTYPE(t)	((t) & INSTR_TYPE_MASK)
> +#define OP_LENGTH(t)	(((t) & PREFIXED) ? 8 : 4)

Is it worth naming it OP_LENGTH ? Can't it be mistaken as one of the 
OP_xxx from the list in asm/opcode.h ?

What about GETLENGTH() instead to be consistant with the above lines ?

Christophe
