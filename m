Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAAE8FDF25
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 08:53:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PaiC5FDh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvw5c37Gtz30W6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 16:53:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PaiC5FDh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvw4s3Tvbz30VN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 16:52:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 13658CE1912;
	Thu,  6 Jun 2024 06:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACBCC2BD10;
	Thu,  6 Jun 2024 06:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717656727;
	bh=aVZFhiIpqTKVnjdLgL8jJJWTtDahdSBgcm8WObNGDZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaiC5FDhxjkXPXOd01cb4MzBHU7YcQobjTq10qEMNZhEXFQyCVxVDs4OhuB5MptLG
	 Upv9FJUnRJwjc7HKBZilZmPJIoNh8o2G8zhCqbSHViVNDEKro22ee9d1MqmmOG54G9
	 QcD1884LVgUC7Bs/yebPEVKfy4pRh5N1odpBUbtEkCcm0kvYOvsba37DICuUUD/M29
	 /4CLzkl6kTdiepz6YW/E6A7OiT/JVu72+mq+oBIZZqba+UQJhkJW+OmH2cABr5wvC9
	 rys2aA4RhWyzJv1PxI1BguPKw3enKaihOP+4KG1tWen5akxpPswrdfbUQ5ko2+W5J9
	 weZCWEf0ET7rw==
Date: Wed, 5 Jun 2024 23:52:05 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 06/14] tools/perf: Update parameters for reg extract
 functions to use raw instruction on powerpc
Message-ID: <ZmFclbqQytaZt1Ep@google.com>
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
 <20240601060941.13692-7-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240601060941.13692-7-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, acme@kernel.org, jolsa@kernel.org, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 01, 2024 at 11:39:33AM +0530, Athira Rajeev wrote:
> Use the raw instruction code and macros to identify memory instructions,
> extract register fields and also offset. The implementation addresses
> the D-form, X-form, DS-form instructions. Two main functions are added.
> New parse function "load_store__parse" as instruction ops parser for
> memory instructions. Unlink other parser (like mov__parse), this parser
> fills in the "raw_insn" field for source/target and new added "mem_ref"
> field. Also set if it is multi_regs and opcode as well. No other fields
> are set because, here there is no need to parse the disassembled
> code and arch specific macros will take care of extracting offset and
> regs which is easier and will be precise.
> 
> In powerpc, all instructions with a primary opcode from 32 to 63
> are memory instructions. Update "ins__find" function to have "raw_insn"
> also as a parameter. Don't use the "extract_reg_offset", instead use
> newly added function "get_arch_regs" which will set these fields: reg1,
> reg2, offset depending of where it is source or target ops.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  .../perf/arch/powerpc/annotate/instructions.c | 16 +++++
>  tools/perf/arch/powerpc/util/dwarf-regs.c     | 44 +++++++++++++
>  tools/perf/util/annotate.c                    | 25 +++++++-
>  tools/perf/util/disasm.c                      | 64 +++++++++++++++++--
>  tools/perf/util/disasm.h                      |  4 +-
>  tools/perf/util/include/dwarf-regs.h          |  3 +
>  6 files changed, 147 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
> index d57fd023ef9c..10fea5e5cf4c 100644
> --- a/tools/perf/arch/powerpc/annotate/instructions.c
> +++ b/tools/perf/arch/powerpc/annotate/instructions.c
> @@ -49,6 +49,22 @@ static struct ins_ops *powerpc__associate_instruction_ops(struct arch *arch, con
>  	return ops;
>  }
>  
> +#define PPC_OP(op)      (((op) >> 26) & 0x3F)
> +
> +static struct ins_ops *check_ppc_insn(int raw_insn)
> +{
> +	int opcode = PPC_OP(raw_insn);
> +
> +	/*
> +	 * Instructions with opcode 32 to 63 are memory
> +	 * instructions in powerpc
> +	 */
> +	if ((opcode & 0x20))
> +		return &load_store_ops;
> +
> +	return NULL;
> +}
> +
>  static int powerpc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
>  {
>  	if (!arch->initialized) {
> diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c b/tools/perf/arch/powerpc/util/dwarf-regs.c
> index 430623ca5612..38b74fa01d8b 100644
> --- a/tools/perf/arch/powerpc/util/dwarf-regs.c
> +++ b/tools/perf/arch/powerpc/util/dwarf-regs.c
> @@ -107,3 +107,47 @@ int regs_query_register_offset(const char *name)
>  #define PPC_DS(DS)	((DS) & 0xfffc)
>  #define OP_LD	58
>  #define OP_STD	62
> +
> +static int get_source_reg(unsigned int raw_insn)
> +{
> +	return PPC_RA(raw_insn);
> +}
> +
> +static int get_target_reg(unsigned int raw_insn)
> +{
> +	return PPC_RT(raw_insn);
> +}
> +
> +static int get_offset_opcode(int raw_insn __maybe_unused)

The argument is used below, no need for __maybe_unused.

> +{
> +	int opcode = PPC_OP(raw_insn);
> +
> +	/* DS- form */
> +	if ((opcode == OP_LD) || (opcode == OP_STD))
> +		return PPC_DS(raw_insn);
> +	else
> +		return PPC_D(raw_insn);
> +}
> +
> +/*
> + * Fills the required fields for op_loc depending on if it
> + * is a source or target.
> + * D form: ins RT,D(RA) -> src_reg1 = RA, offset = D, dst_reg1 = RT
> + * DS form: ins RT,DS(RA) -> src_reg1 = RA, offset = DS, dst_reg1 = RT
> + * X form: ins RT,RA,RB -> src_reg1 = RA, src_reg2 = RB, dst_reg1 = RT
> + */
> +void get_arch_regs(int raw_insn __maybe_unused, int is_source __maybe_unused,
> +		struct annotated_op_loc *op_loc __maybe_unused)

Ditto.

Thanks,
Namhyung


> +{
> +	if (is_source)
> +		op_loc->reg1 = get_source_reg(raw_insn);
> +	else
> +		op_loc->reg1 = get_target_reg(raw_insn);
> +
> +	if (op_loc->multi_regs)
> +		op_loc->reg2 = PPC_RB(raw_insn);
> +
> +	/* TODO: Implement offset handling for X Form */
> +	if ((op_loc->mem_ref) && (PPC_OP(raw_insn) != 31))
> +		op_loc->offset = get_offset_opcode(raw_insn);
> +}
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index 1451caf25e77..2b8cc759ae35 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -2079,6 +2079,12 @@ static int extract_reg_offset(struct arch *arch, const char *str,
>  	return 0;
>  }
>  
> +__weak void get_arch_regs(int raw_insn __maybe_unused, int is_source __maybe_unused,
> +		struct annotated_op_loc *op_loc __maybe_unused)
> +{
> +	return;
> +}
> +
>  /**
>   * annotate_get_insn_location - Get location of instruction
>   * @arch: the architecture info
> @@ -2123,20 +2129,33 @@ int annotate_get_insn_location(struct arch *arch, struct disasm_line *dl,
>  	for_each_insn_op_loc(loc, i, op_loc) {
>  		const char *insn_str = ops->source.raw;
>  		bool multi_regs = ops->source.multi_regs;
> +		bool mem_ref = ops->source.mem_ref;
>  
>  		if (i == INSN_OP_TARGET) {
>  			insn_str = ops->target.raw;
>  			multi_regs = ops->target.multi_regs;
> +			mem_ref = ops->target.mem_ref;
>  		}
>  
>  		/* Invalidate the register by default */
>  		op_loc->reg1 = -1;
>  		op_loc->reg2 = -1;
>  
> -		if (insn_str == NULL)
> -			continue;
> +		if (insn_str == NULL) {
> +			if (!arch__is(arch, "powerpc"))
> +				continue;
> +		}
>  
> -		if (strchr(insn_str, arch->objdump.memory_ref_char)) {
> +		/*
> +		 * For powerpc, call get_arch_regs function which extracts the
> +		 * required fields for op_loc, ie reg1, reg2, offset from the
> +		 * raw instruction.
> +		 */
> +		if (arch__is(arch, "powerpc")) {
> +			op_loc->mem_ref = mem_ref;
> +			op_loc->multi_regs = multi_regs;
> +			get_arch_regs(ops->raw_insn, !i, op_loc);
> +		} else if (strchr(insn_str, arch->objdump.memory_ref_char)) {
>  			op_loc->mem_ref = true;
>  			op_loc->multi_regs = multi_regs;
>  			extract_reg_offset(arch, insn_str, op_loc);
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index 61f0f1656f82..252cb0d1f5d1 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -37,6 +37,7 @@ static struct ins_ops mov_ops;
>  static struct ins_ops nop_ops;
>  static struct ins_ops lock_ops;
>  static struct ins_ops ret_ops;
> +static struct ins_ops load_store_ops;
>  
>  static int jump__scnprintf(struct ins *ins, char *bf, size_t size,
>  			   struct ins_operands *ops, int max_ins_name);
> @@ -517,7 +518,7 @@ static int lock__parse(struct arch *arch, struct ins_operands *ops, struct map_s
>  	if (disasm_line__parse(ops->raw, &ops->locked.ins.name, &ops->locked.ops->raw) < 0)
>  		goto out_free_ops;
>  
> -	ops->locked.ins.ops = ins__find(arch, ops->locked.ins.name);
> +	ops->locked.ins.ops = ins__find(arch, ops->locked.ins.name, 0);
>  
>  	if (ops->locked.ins.ops == NULL)
>  		goto out_free_ops;
> @@ -672,6 +673,47 @@ static struct ins_ops mov_ops = {
>  	.scnprintf = mov__scnprintf,
>  };
>  
> +static int load_store__scnprintf(struct ins *ins, char *bf, size_t size,
> +		struct ins_operands *ops, int max_ins_name)
> +{
> +	return scnprintf(bf, size, "%-*s %s", max_ins_name, ins->name,
> +			ops->raw);
> +}
> +
> +/*
> + * Sets the fields: "raw_insn", opcode, multi_regs and "mem_ref".
> + * "mem_ref" is set for ops->source which is later used to
> + * fill the objdump->memory_ref-char field. This ops is currently
> + * used by powerpc and since binary instruction code is used to
> + * extract opcode, regs and offset, no other parsing is needed here
> + */
> +static int load_store__parse(struct arch *arch __maybe_unused, struct ins_operands *ops,
> +		struct map_symbol *ms __maybe_unused)
> +{
> +	ops->source.raw_insn = ops->raw_insn;
> +	ops->source.mem_ref = true;
> +	ops->source.opcode = ops->opcode;
> +	ops->source.multi_regs = false;
> +
> +	if (!ops->source.raw_insn)
> +		return -1;
> +
> +	ops->target.raw_insn = ops->raw_insn;
> +	ops->target.mem_ref = false;
> +	ops->target.multi_regs = false;
> +	ops->target.opcode = ops->opcode;
> +
> +	if (!ops->target.raw_insn)
> +		return -1;
> +
> +	return 0;
> +}
> +
> +static struct ins_ops load_store_ops = {
> +	.parse     = load_store__parse,
> +	.scnprintf = load_store__scnprintf,
> +};
> +
>  static int dec__parse(struct arch *arch __maybe_unused, struct ins_operands *ops, struct map_symbol *ms __maybe_unused)
>  {
>  	char *target, *comment, *s, prev;
> @@ -762,11 +804,23 @@ static void ins__sort(struct arch *arch)
>  	qsort(arch->instructions, nmemb, sizeof(struct ins), ins__cmp);
>  }
>  
> -static struct ins_ops *__ins__find(struct arch *arch, const char *name)
> +static struct ins_ops *__ins__find(struct arch *arch, const char *name, int raw_insn)
>  {
>  	struct ins *ins;
>  	const int nmemb = arch->nr_instructions;
>  
> +	if (arch__is(arch, "powerpc")) {
> +		/*
> +		 * For powerpc, identify the instruction ops
> +		 * from the opcode using raw_insn.
> +		 */
> +		struct ins_ops *ops;
> +
> +		ops = check_ppc_insn(raw_insn);
> +		if (ops)
> +			return ops;
> +	}
> +
>  	if (!arch->sorted_instructions) {
>  		ins__sort(arch);
>  		arch->sorted_instructions = true;
> @@ -796,9 +850,9 @@ static struct ins_ops *__ins__find(struct arch *arch, const char *name)
>  	return ins ? ins->ops : NULL;
>  }
>  
> -struct ins_ops *ins__find(struct arch *arch, const char *name)
> +struct ins_ops *ins__find(struct arch *arch, const char *name, int raw_insn)
>  {
> -	struct ins_ops *ops = __ins__find(arch, name);
> +	struct ins_ops *ops = __ins__find(arch, name, raw_insn);
>  
>  	if (!ops && arch->associate_instruction_ops)
>  		ops = arch->associate_instruction_ops(arch, name);
> @@ -808,7 +862,7 @@ struct ins_ops *ins__find(struct arch *arch, const char *name)
>  
>  static void disasm_line__init_ins(struct disasm_line *dl, struct arch *arch, struct map_symbol *ms)
>  {
> -	dl->ins.ops = ins__find(arch, dl->ins.name);
> +	dl->ins.ops = ins__find(arch, dl->ins.name, dl->ops.raw_insn);
>  
>  	if (!dl->ins.ops)
>  		return;
> diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
> index a391e1bb81f7..831ebcc329cd 100644
> --- a/tools/perf/util/disasm.h
> +++ b/tools/perf/util/disasm.h
> @@ -62,6 +62,7 @@ struct ins_operands {
>  		bool	offset_avail;
>  		bool	outside;
>  		bool	multi_regs;
> +		bool	mem_ref;
>  	} target;
>  	union {
>  		struct {
> @@ -71,6 +72,7 @@ struct ins_operands {
>  			int	raw_insn;
>  			u64	addr;
>  			bool	multi_regs;
> +			bool	mem_ref;
>  		} source;
>  		struct {
>  			struct ins	    ins;
> @@ -104,7 +106,7 @@ struct annotate_args {
>  struct arch *arch__find(const char *name);
>  bool arch__is(struct arch *arch, const char *name);
>  
> -struct ins_ops *ins__find(struct arch *arch, const char *name);
> +struct ins_ops *ins__find(struct arch *arch, const char *name, int raw_insn);
>  int ins__scnprintf(struct ins *ins, char *bf, size_t size,
>  		   struct ins_operands *ops, int max_ins_name);
>  
> diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
> index 01fb25a1150a..7ea39362ecaf 100644
> --- a/tools/perf/util/include/dwarf-regs.h
> +++ b/tools/perf/util/include/dwarf-regs.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  #ifndef _PERF_DWARF_REGS_H_
>  #define _PERF_DWARF_REGS_H_
> +#include "annotate.h"
>  
>  #define DWARF_REG_PC  0xd3af9c /* random number */
>  #define DWARF_REG_FB  0xd3affb /* random number */
> @@ -31,6 +32,8 @@ static inline int get_dwarf_regnum(const char *name __maybe_unused,
>  }
>  #endif
>  
> +void get_arch_regs(int raw_insn, int is_source, struct annotated_op_loc *op_loc);
> +
>  #ifdef HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET
>  /*
>   * Arch should support fetching the offset of a register in pt_regs
> -- 
> 2.43.0
> 
