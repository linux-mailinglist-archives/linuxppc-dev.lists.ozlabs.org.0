Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA9B8FDF28
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 08:54:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ilU3ez+S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvw6W3GfZz3cYg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 16:54:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ilU3ez+S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvw5n4WnPz3cds
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 16:53:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AC51615EF;
	Thu,  6 Jun 2024 06:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86633C4AF08;
	Thu,  6 Jun 2024 06:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717656812;
	bh=YWrK4iYDDKbeb1azVQHle6znUk1b3N3hYO1w8gGk7I4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ilU3ez+Sh2XfeQBILe8JRGQCLnC0ghKF6UuH7S5xS7LUc3l6SC5WHPqAFhVpuM48c
	 UECg8zkcemdw1eBNAIjRZ/NZWujmFxOgSPn2UL9xZi5NQLBZQ/ef+8I39VSs7UN04U
	 wkFp1ypqPfeFRFh1I5BlyWBysjO7DS9d2V4CePghEko5dFcaph6FPk4VLiMqkIzEM8
	 76XRTmS6pzm8GnxikRS52HlQrOtfSg7hmx1gtGM+TwkIXaIImPaFkacPCT7T5uNSOQ
	 Ngjr8RT737ynyCqqwVmGcV7Hptn6Oh7BKdWg3BvsMl3daitgXE+1H5Q0O75jivs6WI
	 ETUIi3yq6f9ig==
Date: Wed, 5 Jun 2024 23:53:30 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 10/14] tools/perf: Update instruction tracking for
 powerpc
Message-ID: <ZmFc6kPnh-zIrIG1@google.com>
References: <20240601060941.13692-1-atrajeev@linux.vnet.ibm.com>
 <20240601060941.13692-11-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240601060941.13692-11-atrajeev@linux.vnet.ibm.com>
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

On Sat, Jun 01, 2024 at 11:39:37AM +0530, Athira Rajeev wrote:
> Add instruction tracking function "update_insn_state_powerpc" for
> powerpc. Example sequence in powerpc:
> 
> ld      r10,264(r3)
> mr      r31,r3
> <<after some sequence>
> ld      r9,312(r31)
> 
> Consider ithe sample is pointing to: "ld r9,312(r31)".
> Here the memory reference is hit at "312(r31)" where 312 is the offset
> and r31 is the source register. Previous instruction sequence shows that
> register state of r3 is moved to r31. So to identify the data type for r31
> access, the previous instruction ("mr") needs to be tracked and the
> state type entry has to be updated. Current instruction tracking support
> in perf tools infrastructure is specific to x86. Patch adds this support
> for powerpc as well.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  .../perf/arch/powerpc/annotate/instructions.c | 65 +++++++++++++++++++
>  tools/perf/util/annotate-data.c               |  9 ++-
>  tools/perf/util/disasm.c                      |  1 +
>  3 files changed, 74 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
> index db72148eb857..3ecf5a986037 100644
> --- a/tools/perf/arch/powerpc/annotate/instructions.c
> +++ b/tools/perf/arch/powerpc/annotate/instructions.c
> @@ -231,6 +231,71 @@ static struct ins_ops *check_ppc_insn(int raw_insn)
>  	return NULL;
>  }
>  
> +/*
> + * Instruction tracking function to track register state moves.
> + * Example sequence:
> + *    ld      r10,264(r3)
> + *    mr      r31,r3
> + *    <<after some sequence>
> + *    ld      r9,312(r31)
> + *
> + * Previous instruction sequence shows that register state of r3
> + * is moved to r31. update_insn_state_powerpc tracks these state
> + * changes
> + */
> +#ifdef HAVE_DWARF_SUPPORT
> +static void update_insn_state_powerpc(struct type_state *state,
> +		struct data_loc_info *dloc, Dwarf_Die * cu_die __maybe_unused,
> +		struct disasm_line *dl)
> +{
> +	struct annotated_insn_loc loc;
> +	struct annotated_op_loc *src = &loc.ops[INSN_OP_SOURCE];
> +	struct annotated_op_loc *dst = &loc.ops[INSN_OP_TARGET];
> +	struct type_state_reg *tsr;
> +	u32 insn_offset = dl->al.offset;
> +
> +	if (annotate_get_insn_location(dloc->arch, dl, &loc) < 0)
> +		return;
> +
> +	/*
> +	 * Value 444 for bits 21:30 is for "mr"
> +	 * instruction. "mr" is extended OR. So set the
> +	 * source and destination reg correctly
> +	 */
> +	if (PPC_21_30(dl->ops.raw_insn) == 444) {
> +		int src_reg = src->reg1;
> +
> +		src->reg1 = dst->reg1;
> +		dst->reg1 = src_reg;
> +	}
> +
> +	if (!has_reg_type(state, dst->reg1))
> +		return;
> +
> +	tsr = &state->regs[dst->reg1];
> +
> +	if (!has_reg_type(state, src->reg1) ||
> +			!state->regs[src->reg1].ok) {
> +		tsr->ok = false;
> +		return;
> +	}
> +
> +	tsr->type = state->regs[src->reg1].type;
> +	tsr->kind = state->regs[src->reg1].kind;
> +	tsr->ok = true;
> +
> +	pr_debug("mov [%x] reg%d -> reg%d",

pr_debug_dtp() ?

Thanks,
Namhyung


> +			insn_offset, src->reg1, dst->reg1);
> +	pr_debug_type_name(&tsr->type, tsr->kind);
> +}
> +#else /* HAVE_DWARF_SUPPORT */
> +static void update_insn_state_powerpc(struct type_state *state __maybe_unused, struct data_loc_info *dloc __maybe_unused,
> +		Dwarf_Die * cu_die __maybe_unused, struct disasm_line *dl __maybe_unused)
> +{
> +	return;
> +}
> +#endif /* HAVE_DWARF_SUPPORT */
> +
>  static int powerpc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
>  {
>  	if (!arch->initialized) {
> diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
> index 7a48c3d72b89..734acdd8c4b7 100644
> --- a/tools/perf/util/annotate-data.c
> +++ b/tools/perf/util/annotate-data.c
> @@ -1080,6 +1080,13 @@ static int find_data_type_insn(struct data_loc_info *dloc,
>  	return ret;
>  }
>  
> +static int arch_supports_insn_tracking(struct data_loc_info *dloc)
> +{
> +	if ((arch__is(dloc->arch, "x86")) || (arch__is(dloc->arch, "powerpc")))
> +		return 1;
> +	return 0;
> +}
> +
>  /*
>   * Construct a list of basic blocks for each scope with variables and try to find
>   * the data type by updating a type state table through instructions.
> @@ -1094,7 +1101,7 @@ static int find_data_type_block(struct data_loc_info *dloc,
>  	int ret = -1;
>  
>  	/* TODO: other architecture support */
> -	if (!arch__is(dloc->arch, "x86"))
> +	if (!arch_supports_insn_tracking(dloc))
>  		return -1;
>  
>  	prev_dst_ip = dst_ip = dloc->ip;
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index 57af4dc42a58..d8b357055302 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -155,6 +155,7 @@ static struct arch architectures[] = {
>  	{
>  		.name = "powerpc",
>  		.init = powerpc__annotate_init,
> +		.update_insn_state = update_insn_state_powerpc,
>  	},
>  	{
>  		.name = "riscv64",
> -- 
> 2.43.0
> 
