Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F2915E8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 08:01:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YfIllv7I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7Z2j0fxcz3dVv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 16:01:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YfIllv7I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7Z1z5FwNz3clY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 16:00:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC38A611EF;
	Tue, 25 Jun 2024 06:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4DBC32781;
	Tue, 25 Jun 2024 06:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719295236;
	bh=hUY9QayOGxEWp5akn0k9uwjuEr6tWEzbZu9atZ2hxRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfIllv7IRG1mvoimyKt56tThjUxitLAKpqlUyUlnGwRweqqrJuGTKAXWC0jUrA6aC
	 dViTeZNAnvm+ZGA/1qREi5RmQoPvkphVqtcyjYBK9rD394ewwoomb10Wb6vcqMaqbb
	 v9H+lCnV9jdpUdBk1EHGDHPKt2mfRCHM9B7vWz1EpT53aeryCgB4yyFavYk/WNYLEU
	 JFeb/xP97B0kv2FQJY3lLPRbJTHV4mzH0jwX4xTqlTln8zpGzAOYUGLqUvwXglmnkz
	 QuBiZiHt45dfJN0Uf9ltnUiRN8omA/SKDBq5nOr9RZplHhrhYkO9XNKQmjyElEWKMK
	 sca8y+WtNKsew==
Date: Mon, 24 Jun 2024 23:00:34 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [V4 06/16] tools/perf: Update parameters for reg extract
 functions to use raw instruction on powerpc
Message-ID: <ZnpdAhTHWAlS_MYa@google.com>
References: <20240614172631.56803-1-atrajeev@linux.vnet.ibm.com>
 <20240614172631.56803-7-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240614172631.56803-7-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, acme@kernel.org, jolsa@kernel.org, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 14, 2024 at 10:56:21PM +0530, Athira Rajeev wrote:
> Use the raw instruction code and macros to identify memory instructions,
> extract register fields and also offset. The implementation addresses
> the D-form, X-form, DS-form instructions. Two main functions are added.
> New parse function "load_store__parse" as instruction ops parser for
> memory instructions. Unlink other parser (like mov__parse), this parser
> fills in the "multi_regs" field for source/target and new added "mem_ref"
> field. No other fields are set because, here there is no need to parse the
> disassembled code and arch specific macros will take care of extracting
> offset and regs which is easier and will be precise.
> 
> In powerpc, all instructions with a primary opcode from 32 to 63
> are memory instructions. Update "ins__find" function to have "raw_insn"
> also as a parameter. Don't use the "extract_reg_offset", instead use
> newly added function "get_arch_regs" which will set these fields: reg1,
> reg2, offset depending of where it is source or target ops.
> 
> Update "parse" callback for "struct ins_ops" to also pass "struct
> disasm_line" as argument. This is needed in parse functions where opcode
> is used to determine whether to set multi_regs.

Can you please split "ins__find" change and "parse" change into separate
commits?

> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/arch/arm64/annotate/instructions.c |  3 +-
>  .../arch/loongarch/annotate/instructions.c    |  6 +-
>  .../perf/arch/powerpc/annotate/instructions.c | 16 ++++
>  tools/perf/arch/powerpc/util/dwarf-regs.c     | 44 +++++++++++
>  tools/perf/arch/s390/annotate/instructions.c  |  5 +-
>  tools/perf/util/annotate.c                    | 25 ++++++-
>  tools/perf/util/disasm.c                      | 73 ++++++++++++++++---
>  tools/perf/util/disasm.h                      |  6 +-
>  tools/perf/util/include/dwarf-regs.h          |  3 +
>  9 files changed, 159 insertions(+), 22 deletions(-)
> 
> diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
> index 4af0c3a0f86e..f86d9f4798bd 100644
> --- a/tools/perf/arch/arm64/annotate/instructions.c
> +++ b/tools/perf/arch/arm64/annotate/instructions.c
> @@ -11,7 +11,8 @@ struct arm64_annotate {
>  
>  static int arm64_mov__parse(struct arch *arch __maybe_unused,
>  			    struct ins_operands *ops,
> -			    struct map_symbol *ms __maybe_unused)
> +			    struct map_symbol *ms __maybe_unused,
> +			    struct disasm_line *dl __maybe_unused)
>  {
>  	char *s = strchr(ops->raw, ','), *target, *endptr;
>  
> diff --git a/tools/perf/arch/loongarch/annotate/instructions.c b/tools/perf/arch/loongarch/annotate/instructions.c
> index 21cc7e4149f7..ab43b1ab51e3 100644
> --- a/tools/perf/arch/loongarch/annotate/instructions.c
> +++ b/tools/perf/arch/loongarch/annotate/instructions.c
> @@ -5,7 +5,8 @@
>   * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
>   */
>  
> -static int loongarch_call__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms)
> +static int loongarch_call__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
> +		struct disasm_line *dl __maybe_unused)
>  {
>  	char *c, *endptr, *tok, *name;
>  	struct map *map = ms->map;
> @@ -51,7 +52,8 @@ static struct ins_ops loongarch_call_ops = {
>  	.scnprintf = call__scnprintf,
>  };
>  
> -static int loongarch_jump__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms)
> +static int loongarch_jump__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
> +		struct disasm_line *dl __maybe_unused)
>  {
>  	struct map *map = ms->map;
>  	struct symbol *sym = ms->sym;
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

It'd be nice to use 'u32' instead of 'int' for raw_insn if you want to
do some bit operations.

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
> index 430623ca5612..e01729f3c0b3 100644
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

Ditto, and others too.


> +}
> +
> +static int get_target_reg(unsigned int raw_insn)
> +{
> +	return PPC_RT(raw_insn);
> +}
> +
> +static int get_offset_opcode(int raw_insn)
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
> +void get_arch_regs(int raw_insn, int is_source,
> +		struct annotated_op_loc *op_loc)
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
> diff --git a/tools/perf/arch/s390/annotate/instructions.c b/tools/perf/arch/s390/annotate/instructions.c
> index da5aa3e1f04c..eeac25cca699 100644
> --- a/tools/perf/arch/s390/annotate/instructions.c
> +++ b/tools/perf/arch/s390/annotate/instructions.c
> @@ -2,7 +2,7 @@
>  #include <linux/compiler.h>
>  
>  static int s390_call__parse(struct arch *arch, struct ins_operands *ops,
> -			    struct map_symbol *ms)
> +			    struct map_symbol *ms, struct disasm_line *dl __maybe_unused)
>  {
>  	char *endptr, *tok, *name;
>  	struct map *map = ms->map;
> @@ -52,7 +52,8 @@ static struct ins_ops s390_call_ops = {
>  
>  static int s390_mov__parse(struct arch *arch __maybe_unused,
>  			   struct ins_operands *ops,
> -			   struct map_symbol *ms __maybe_unused)
> +			   struct map_symbol *ms __maybe_unused,
> +			   struct disasm_line *dl __maybe_unused)
>  {
>  	char *s = strchr(ops->raw, ','), *target, *endptr;
>  
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index 1451caf25e77..bfa6420dc4b9 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -2079,6 +2079,12 @@ static int extract_reg_offset(struct arch *arch, const char *str,
>  	return 0;
>  }
>  
> +__weak void get_arch_regs(int raw_insn __maybe_unused, int is_source __maybe_unused,
> +		struct annotated_op_loc *op_loc __maybe_unused)

I'd like to avoid adding weak functions if possible.  It's supposed to
be powerpc only, maybe you can add get_powerpc_regs() in the arch
directory and add a dummy static inline somewhere under #ifndef.

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
> +			get_arch_regs(dl->raw.raw_insn, !i, op_loc);
> +		} else if (strchr(insn_str, arch->objdump.memory_ref_char)) {
>  			op_loc->mem_ref = true;
>  			op_loc->multi_regs = multi_regs;
>  			extract_reg_offset(arch, insn_str, op_loc);
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index 1e8568738b38..8428df0b9c17 100644
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
> @@ -254,7 +255,8 @@ bool ins__is_fused(struct arch *arch, const char *ins1, const char *ins2)
>  	return arch->ins_is_fused(arch, ins1, ins2);
>  }
>  
> -static int call__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms)
> +static int call__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
> +		struct disasm_line *dl __maybe_unused)
>  {
>  	char *endptr, *tok, *name;
>  	struct map *map = ms->map;
> @@ -349,7 +351,8 @@ static inline const char *validate_comma(const char *c, struct ins_operands *ops
>  	return c;
>  }
>  
> -static int jump__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms)
> +static int jump__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
> +		struct disasm_line *dl __maybe_unused)
>  {
>  	struct map *map = ms->map;
>  	struct symbol *sym = ms->sym;
> @@ -508,7 +511,8 @@ static int comment__symbol(char *raw, char *comment, u64 *addrp, char **namep)
>  	return 0;
>  }
>  
> -static int lock__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms)
> +static int lock__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms,
> +		struct disasm_line *dl __maybe_unused)
>  {
>  	ops->locked.ops = zalloc(sizeof(*ops->locked.ops));
>  	if (ops->locked.ops == NULL)
> @@ -517,13 +521,13 @@ static int lock__parse(struct arch *arch, struct ins_operands *ops, struct map_s
>  	if (disasm_line__parse(ops->raw, &ops->locked.ins.name, &ops->locked.ops->raw) < 0)
>  		goto out_free_ops;
>  
> -	ops->locked.ins.ops = ins__find(arch, ops->locked.ins.name);
> +	ops->locked.ins.ops = ins__find(arch, ops->locked.ins.name, 0);
>  
>  	if (ops->locked.ins.ops == NULL)
>  		goto out_free_ops;
>  
>  	if (ops->locked.ins.ops->parse &&
> -	    ops->locked.ins.ops->parse(arch, ops->locked.ops, ms) < 0)
> +	    ops->locked.ins.ops->parse(arch, ops->locked.ops, ms, NULL) < 0)
>  		goto out_free_ops;
>  
>  	return 0;
> @@ -594,7 +598,8 @@ static bool check_multi_regs(struct arch *arch, const char *op)
>  	return count > 1;
>  }
>  
> -static int mov__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms __maybe_unused)
> +static int mov__parse(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms __maybe_unused,
> +		struct disasm_line *dl __maybe_unused)
>  {
>  	char *s = strchr(ops->raw, ','), *target, *comment, prev;
>  
> @@ -672,7 +677,39 @@ static struct ins_ops mov_ops = {
>  	.scnprintf = mov__scnprintf,
>  };
>  
> -static int dec__parse(struct arch *arch __maybe_unused, struct ins_operands *ops, struct map_symbol *ms __maybe_unused)
> +static int load_store__scnprintf(struct ins *ins, char *bf, size_t size,
> +		struct ins_operands *ops, int max_ins_name)
> +{
> +	return scnprintf(bf, size, "%-*s %s", max_ins_name, ins->name,
> +			ops->raw);
> +}
> +
> +/*
> + * Sets the fields: multi_regs and "mem_ref".
> + * "mem_ref" is set for ops->source which is later used to
> + * fill the objdump->memory_ref-char field. This ops is currently
> + * used by powerpc and since binary instruction code is used to
> + * extract opcode, regs and offset, no other parsing is needed here
> + */
> +static int load_store__parse(struct arch *arch __maybe_unused, struct ins_operands *ops,
> +		struct map_symbol *ms __maybe_unused, struct disasm_line *dl __maybe_unused)
> +{
> +	ops->source.mem_ref = true;
> +	ops->source.multi_regs = false;
> +
> +	ops->target.mem_ref = false;
> +	ops->target.multi_regs = false;
> +
> +	return 0;
> +}
> +
> +static struct ins_ops load_store_ops = {
> +	.parse     = load_store__parse,
> +	.scnprintf = load_store__scnprintf,
> +};
> +
> +static int dec__parse(struct arch *arch __maybe_unused, struct ins_operands *ops, struct map_symbol *ms __maybe_unused,
> +		struct disasm_line *dl __maybe_unused)
>  {
>  	char *target, *comment, *s, prev;
>  
> @@ -762,11 +799,23 @@ static void ins__sort(struct arch *arch)
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
> @@ -796,9 +845,9 @@ static struct ins_ops *__ins__find(struct arch *arch, const char *name)
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
> @@ -808,12 +857,12 @@ struct ins_ops *ins__find(struct arch *arch, const char *name)
>  
>  static void disasm_line__init_ins(struct disasm_line *dl, struct arch *arch, struct map_symbol *ms)
>  {
> -	dl->ins.ops = ins__find(arch, dl->ins.name);
> +	dl->ins.ops = ins__find(arch, dl->ins.name, dl->raw.raw_insn);
>  
>  	if (!dl->ins.ops)
>  		return;
>  
> -	if (dl->ins.ops->parse && dl->ins.ops->parse(arch, &dl->ops, ms) < 0)
> +	if (dl->ins.ops->parse && dl->ins.ops->parse(arch, &dl->ops, ms, dl) < 0)
>  		dl->ins.ops = NULL;
>  }
>  
> diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
> index 718177fa4775..6b6ec23e4f6f 100644
> --- a/tools/perf/util/disasm.h
> +++ b/tools/perf/util/disasm.h
> @@ -57,6 +57,7 @@ struct ins_operands {
>  		bool	offset_avail;
>  		bool	outside;
>  		bool	multi_regs;
> +		bool	mem_ref;
>  	} target;
>  	union {
>  		struct {
> @@ -64,6 +65,7 @@ struct ins_operands {
>  			char	*name;
>  			u64	addr;
>  			bool	multi_regs;
> +			bool	mem_ref;
>  		} source;
>  		struct {
>  			struct ins	    ins;
> @@ -78,7 +80,7 @@ struct ins_operands {
>  
>  struct ins_ops {
>  	void (*free)(struct ins_operands *ops);
> -	int (*parse)(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms);
> +	int (*parse)(struct arch *arch, struct ins_operands *ops, struct map_symbol *ms, struct disasm_line *dl);

The line is too long, please break.

Thanks,
Namhyung


>  	int (*scnprintf)(struct ins *ins, char *bf, size_t size,
>  			 struct ins_operands *ops, int max_ins_name);
>  };
> @@ -97,7 +99,7 @@ struct annotate_args {
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
