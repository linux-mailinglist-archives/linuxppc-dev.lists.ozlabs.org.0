Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 037B61C33EE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 10:03:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FwMV5WK6zDqf3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 18:03:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FwKX63xHzDqSx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 18:01:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49FwKW0mNQz9sSr;
 Mon,  4 May 2020 18:01:19 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v7 08/28] powerpc: Use a function for getting the
 instruction op code
Date: Mon, 04 May 2020 18:01:14 +1000
Message-ID: <3093607.lZebHzm4vX@townsend>
In-Reply-To: <20200501034220.8982-9-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-9-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks good to me in that it doesn't look to change the behaviour of any 
existing code.

Reviewed-by: Alistair Popple <alistair@popple.id.au>

On Friday, 1 May 2020 1:42:00 PM AEST Jordan Niethe wrote:
> In preparation for using a data type for instructions that can not be
> directly used with the '>>' operator use a function for getting the op
> code of an instruction.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> v6: - Rename ppc_inst_primary() to ppc_inst_primary_opcode()
>     - Use in vecemu.c, fault.c, sstep.c
>     - Move this patch after the ppc_inst_val() patch
> ---
>  arch/powerpc/include/asm/inst.h  | 5 +++++
>  arch/powerpc/kernel/align.c      | 2 +-
>  arch/powerpc/kernel/vecemu.c     | 3 ++-
>  arch/powerpc/lib/code-patching.c | 4 ++--
>  arch/powerpc/lib/sstep.c         | 2 +-
>  arch/powerpc/mm/fault.c          | 3 ++-
>  6 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/inst.h
> b/arch/powerpc/include/asm/inst.h index 8a9e73bfbd27..442a95f20de7 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -13,4 +13,9 @@ static inline u32 ppc_inst_val(u32 x)
>  	return x;
>  }
> 
> +static inline int ppc_inst_primary_opcode(u32 x)
> +{
> +	return ppc_inst_val(x) >> 26;
> +}
> +
>  #endif /* _ASM_INST_H */
> diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
> index 44921001f84a..47dbba81a227 100644
> --- a/arch/powerpc/kernel/align.c
> +++ b/arch/powerpc/kernel/align.c
> @@ -314,7 +314,7 @@ int fix_alignment(struct pt_regs *regs)
>  	}
> 
>  #ifdef CONFIG_SPE
> -	if ((ppc_inst_val(instr) >> 26) == 0x4) {
> +	if (ppc_inst_primary_opcode(instr) == 0x4) {
>  		int reg = (ppc_inst_val(instr) >> 21) & 0x1f;
>  		PPC_WARN_ALIGNMENT(spe, regs);
>  		return emulate_spe(regs, reg, instr);
> diff --git a/arch/powerpc/kernel/vecemu.c b/arch/powerpc/kernel/vecemu.c
> index 1f5e3b4c8ae4..a544590b90e5 100644
> --- a/arch/powerpc/kernel/vecemu.c
> +++ b/arch/powerpc/kernel/vecemu.c
> @@ -10,6 +10,7 @@
>  #include <asm/processor.h>
>  #include <asm/switch_to.h>
>  #include <linux/uaccess.h>
> +#include <asm/inst.h>
> 
>  /* Functions in vector.S */
>  extern void vaddfp(vector128 *dst, vector128 *a, vector128 *b);
> @@ -268,7 +269,7 @@ int emulate_altivec(struct pt_regs *regs)
>  		return -EFAULT;
> 
>  	word = ppc_inst_val(instr);
> -	if ((word >> 26) != 4)
> +	if (ppc_inst_primary_opcode(instr) != 4)
>  		return -EINVAL;		/* not an altivec instruction */
>  	vd = (word >> 21) & 0x1f;
>  	va = (word >> 16) & 0x1f;
> diff --git a/arch/powerpc/lib/code-patching.c
> b/arch/powerpc/lib/code-patching.c index baa849b1a1f9..f5c6dcbac44b 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -231,7 +231,7 @@ bool is_offset_in_branch_range(long offset)
>   */
>  bool is_conditional_branch(unsigned int instr)
>  {
> -	unsigned int opcode = instr >> 26;
> +	unsigned int opcode = ppc_inst_primary_opcode(instr);
> 
>  	if (opcode == 16)       /* bc, bca, bcl, bcla */
>  		return true;
> @@ -289,7 +289,7 @@ int create_cond_branch(unsigned int *instr, const
> unsigned int *addr,
> 
>  static unsigned int branch_opcode(unsigned int instr)
>  {
> -	return (instr >> 26) & 0x3F;
> +	return ppc_inst_primary_opcode(instr) & 0x3F;
>  }
> 
>  static int instr_is_branch_iform(unsigned int instr)
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index 14c93ee4ffc8..7f7be154da7e 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1175,7 +1175,7 @@ int analyse_instr(struct instruction_op *op, const
> struct pt_regs *regs, word = ppc_inst_val(instr);
>  	op->type = COMPUTE;
> 
> -	opcode = instr >> 26;
> +	opcode = ppc_inst_primary_opcode(instr);
>  	switch (opcode) {
>  	case 16:	/* bc */
>  		op->type = BRANCH;
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 9364921870df..0e7e145d5cad 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -41,6 +41,7 @@
>  #include <asm/siginfo.h>
>  #include <asm/debug.h>
>  #include <asm/kup.h>
> +#include <asm/inst.h>
> 
>  /*
>   * Check whether the instruction inst is a store using
> @@ -52,7 +53,7 @@ static bool store_updates_sp(unsigned int inst)
>  	if (((ppc_inst_val(inst) >> 16) & 0x1f) != 1)
>  		return false;
>  	/* check major opcode */
> -	switch (inst >> 26) {
> +	switch (ppc_inst_primary_opcode(inst)) {
>  	case OP_STWU:
>  	case OP_STBU:
>  	case OP_STHU:




