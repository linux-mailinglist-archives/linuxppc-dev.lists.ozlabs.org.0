Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C996A930195
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 23:28:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MBE23TqJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLPpL5CzKz3c47
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 07:28:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MBE23TqJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLPng0Vk9z2xPZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2024 07:27:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2091061A25;
	Fri, 12 Jul 2024 21:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208A1C32782;
	Fri, 12 Jul 2024 21:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720819651;
	bh=JMjKh9IPFgPjRTXjkgCQOr6ucOhjdNrIfRB27FfhLOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MBE23TqJHdIe6hnT4w3SA5zamcgKWjhsOvSEaiUzq9NhGtIJYQ7s3EOiKflyOef/C
	 xflKcWCJEPXs+yDWg55ID5Csuajlw0eGMEJL+nYDMtFhyirDz1+962N2SxCrGxWmRJ
	 dMuKfBl3Z0vkq84vXSFC5dXuviP/HP3hFN0o4jfuNBLlgUYVBl2UfIswzAgy8nP0dc
	 dryOpeTq895Z1Iumzg10J6/7gyy08ridRSViwJBUvov1mWdYRGmNy6lplZ5eqxT1m4
	 ChE0qsTNPj+fZWVP9cTOW+OYGJys6xKU6COLl/Y5QseDcR42NOgcn84WbTt0fl+frj
	 kLBGjlKt3VlFw==
Date: Fri, 12 Jul 2024 16:27:27 -0500
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V6 18/18] tools/perf: Set instruction name to be used
 with insn-stat when using raw instruction
Message-ID: <ZpGfvwxGh1ud6SeP@google.com>
References: <20240707144419.92510-1-atrajeev@linux.vnet.ibm.com>
 <20240707144419.92510-19-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240707144419.92510-19-atrajeev@linux.vnet.ibm.com>
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

On Sun, Jul 07, 2024 at 08:14:19PM +0530, Athira Rajeev wrote:
> Since the "ins.name" is not set while using raw instruction,
> perf annotate with insn-stat gives wrong data:
> 
> Result from "./perf annotate --data-type --insn-stat":
> 
> Annotate Instruction stats
> total 615, ok 419 (68.1%), bad 196 (31.9%)
> 
>   Name      :  Good   Bad
> -----------------------------------------------------------
>             :   419   196
> 
> Patch sets "dl->ins.name" in arch specific function "check_ppc_insn"
> while initialising "struct disasm_line". Also update "ins_find" function
> to pass "struct disasm_line" as a parameter so as to set its name field
> in arch specific call.
> 
> With the patch changes:
> 
> Annotate Instruction stats
> total 609, ok 446 (73.2%), bad 163 (26.8%)
> 
>   Name/opcode:  Good   Bad
> -----------------------------------------------------------
>   58                  :   323    80
>   32                  :    49    43
>   34                  :    33    11
>   OP_31_XOP_LDX       :     8    20
>   40                  :    23     0
>   OP_31_XOP_LWARX     :     5     1
>   OP_31_XOP_LWZX      :     2     3
>   OP_31_XOP_LDARX     :     3     0
>   33                  :     0     2
>   OP_31_XOP_LBZX      :     0     1
>   OP_31_XOP_LWAX      :     0     1
>   OP_31_XOP_LHZX      :     0     1
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  .../perf/arch/powerpc/annotate/instructions.c  | 18 +++++++++++++++---
>  tools/perf/builtin-annotate.c                  |  4 ++--
>  tools/perf/util/annotate.c                     |  2 +-
>  tools/perf/util/disasm.c                       | 10 +++++-----
>  tools/perf/util/disasm.h                       |  2 +-
>  5 files changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
> index af1032572bf3..ede9eeade0ab 100644
> --- a/tools/perf/arch/powerpc/annotate/instructions.c
> +++ b/tools/perf/arch/powerpc/annotate/instructions.c
> @@ -189,8 +189,9 @@ static int cmp_offset(const void *a, const void *b)
>  	return (val1->value - val2->value);
>  }
>  
> -static struct ins_ops *check_ppc_insn(u32 raw_insn)
> +static struct ins_ops *check_ppc_insn(struct disasm_line *dl)
>  {
> +	int raw_insn = dl->raw.raw_insn;
>  	int opcode = PPC_OP(raw_insn);
>  	int mem_insn_31 = PPC_21_30(raw_insn);
>  	struct insn_offset *ret;
> @@ -198,19 +199,30 @@ static struct ins_ops *check_ppc_insn(u32 raw_insn)
>  		"OP_31_INSN",
>  		mem_insn_31
>  	};
> +	char name_insn[32];
>  
>  	/*
>  	 * Instructions with opcode 32 to 63 are memory
>  	 * instructions in powerpc
>  	 */
>  	if ((opcode & 0x20)) {
> +		/*
> +		 * Set name in case of raw instruction to
> +		 * opcode to be used in insn-stat
> +		 */
> +		if (!strlen(dl->ins.name)) {
> +			sprintf(name_insn, "%d", opcode);
> +			dl->ins.name = strdup(name_insn);
> +		}
>  		return &load_store_ops;
>  	} else if (opcode == 31) {
>  		/* Check for memory instructions with opcode 31 */
>  		ret = bsearch(&mem_insns_31_opcode, ins_array, ARRAY_SIZE(ins_array), sizeof(ins_array[0]), cmp_offset);
> -		if (ret != NULL)
> +		if (ret) {
> +			if (!strlen(dl->ins.name))
> +				dl->ins.name = strdup(ret->name);
>  			return &load_store_ops;
> -		else {
> +		} else {
>  			mem_insns_31_opcode.value = PPC_22_30(raw_insn);
>  			ret = bsearch(&mem_insns_31_opcode, arithmetic_ins_op_31, ARRAY_SIZE(arithmetic_ins_op_31),
>  					sizeof(arithmetic_ins_op_31[0]), cmp_offset);
> diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
> index b10b7f005658..68e929d4746e 100644
> --- a/tools/perf/builtin-annotate.c
> +++ b/tools/perf/builtin-annotate.c
> @@ -396,10 +396,10 @@ static void print_annotate_item_stat(struct list_head *head, const char *title)
>  	printf("total %d, ok %d (%.1f%%), bad %d (%.1f%%)\n\n", total,
>  	       total_good, 100.0 * total_good / (total ?: 1),
>  	       total_bad, 100.0 * total_bad / (total ?: 1));
> -	printf("  %-10s: %5s %5s\n", "Name", "Good", "Bad");
> +	printf("  %-10s: %5s %5s\n", "Name/opcode", "Good", "Bad");

It should be "%-20s".

Thanks,
Namhyung


>  	printf("-----------------------------------------------------------\n");
>  	list_for_each_entry(istat, head, list)
> -		printf("  %-10s: %5d %5d\n", istat->name, istat->good, istat->bad);
> +		printf("  %-20s: %5d %5d\n", istat->name, istat->good, istat->bad);
>  	printf("\n");
>  }
>  
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index 8db2f32700aa..e1f24dff8042 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -2229,7 +2229,7 @@ static struct annotated_item_stat *annotate_data_stat(struct list_head *head,
>  		return NULL;
>  
>  	istat->name = strdup(name);
> -	if (istat->name == NULL) {
> +	if ((istat->name == NULL) || (!strlen(istat->name))) {
>  		free(istat);
>  		return NULL;
>  	}
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index 63681df6482b..cd283c42195c 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -859,7 +859,7 @@ static void ins__sort(struct arch *arch)
>  	qsort(arch->instructions, nmemb, sizeof(struct ins), ins__cmp);
>  }
>  
> -static struct ins_ops *__ins__find(struct arch *arch, const char *name, u32 raw_insn)
> +static struct ins_ops *__ins__find(struct arch *arch, const char *name, struct disasm_line *dl)
>  {
>  	struct ins *ins;
>  	const int nmemb = arch->nr_instructions;
> @@ -871,7 +871,7 @@ static struct ins_ops *__ins__find(struct arch *arch, const char *name, u32 raw_
>  		 */
>  		struct ins_ops *ops;
>  
> -		ops = check_ppc_insn(raw_insn);
> +		ops = check_ppc_insn(dl);
>  		if (ops)
>  			return ops;
>  	}
> @@ -905,9 +905,9 @@ static struct ins_ops *__ins__find(struct arch *arch, const char *name, u32 raw_
>  	return ins ? ins->ops : NULL;
>  }
>  
> -struct ins_ops *ins__find(struct arch *arch, const char *name, u32 raw_insn)
> +struct ins_ops *ins__find(struct arch *arch, const char *name, struct disasm_line *dl)
>  {
> -	struct ins_ops *ops = __ins__find(arch, name, raw_insn);
> +	struct ins_ops *ops = __ins__find(arch, name, dl);
>  
>  	if (!ops && arch->associate_instruction_ops)
>  		ops = arch->associate_instruction_ops(arch, name);
> @@ -917,7 +917,7 @@ struct ins_ops *ins__find(struct arch *arch, const char *name, u32 raw_insn)
>  
>  static void disasm_line__init_ins(struct disasm_line *dl, struct arch *arch, struct map_symbol *ms)
>  {
> -	dl->ins.ops = ins__find(arch, dl->ins.name, dl->raw.raw_insn);
> +	dl->ins.ops = ins__find(arch, dl->ins.name, dl);
>  
>  	if (!dl->ins.ops)
>  		return;
> diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
> index c1bb1e484bfb..f56beedeb9da 100644
> --- a/tools/perf/util/disasm.h
> +++ b/tools/perf/util/disasm.h
> @@ -105,7 +105,7 @@ struct annotate_args {
>  struct arch *arch__find(const char *name);
>  bool arch__is(struct arch *arch, const char *name);
>  
> -struct ins_ops *ins__find(struct arch *arch, const char *name, u32 raw_insn);
> +struct ins_ops *ins__find(struct arch *arch, const char *name, struct disasm_line *dl);
>  int ins__scnprintf(struct ins *ins, char *bf, size_t size,
>  		   struct ins_operands *ops, int max_ins_name);
>  
> -- 
> 2.43.0
> 
