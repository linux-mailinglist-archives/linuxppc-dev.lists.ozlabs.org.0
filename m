Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1910924CA1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 02:09:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lvr/ZTaY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDKsP4F9Sz3cMX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 10:09:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lvr/ZTaY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDKrh1lWKz2ysc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 10:09:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9EA69CE0F7B;
	Wed,  3 Jul 2024 00:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6506EC2BD10;
	Wed,  3 Jul 2024 00:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719965345;
	bh=ePBM8uzJRxVTZEWmIyligoS+xxnug3U4PYJjOKa/19E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lvr/ZTaYVRJ9GFS+EgvLaekvn6pqKwXp0nujszy9uerwf5WHRSz1q8pNStd+G6zgR
	 1AXAX+uAkpReldOxNUA8QVK8HII6G9PNo37nU7fOaSUCb72zfU5epPkholCk/PxcMb
	 AQ5EeU3tHlW6SuaSzE+HKyf5r/6/ol5tucZIl2wr69tIrnle4FAcHF5ByNXWyYqHeD
	 /bteuTjUV6iEnDX3uvIhuqFv+2PvDNuO/Lh6zvyWz433gv7Zt78Y0nlgYyO7v9wDdU
	 4hzQWdRqhM3wiR70fyiOhKvctoTGnsNig5xGK+7bFtWAUGso0ijRVyk0lFSWalqSbA
	 TlslREdQXBrBQ==
Date: Tue, 2 Jul 2024 17:09:03 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V5 03/17] tools/perf: Update TYPE_STATE_MAX_REGS to
 include max of regs in powerpc
Message-ID: <ZoSWn0q8YCxxbylS@google.com>
References: <20240701043430.66666-1-atrajeev@linux.vnet.ibm.com>
 <20240701043430.66666-4-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240701043430.66666-4-atrajeev@linux.vnet.ibm.com>
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

On Mon, Jul 01, 2024 at 10:04:16AM +0530, Athira Rajeev wrote:
> Add TYPE_STATE_MAX_REGS_X86 and TYPE_STATE_MAX_REGS_PPC. Define
> TYPE_STATE_MAX_REGS to be 32 which is max size of the array. While
> checking if reg is valid using has_reg_type, use the max value
> depending on the architecture. For x86, use TYPE_STATE_MAX_REGS_X86
> since max number of regs is 16. Update has_reg_type to
> pass "struct arch" also as one of the parameters.
> 
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/arch/x86/annotate/instructions.c | 20 ++++++++++----------
>  tools/perf/util/annotate-data.c             | 13 +++++++++----
>  tools/perf/util/annotate-data.h             |  6 ++++--
>  3 files changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/perf/arch/x86/annotate/instructions.c b/tools/perf/arch/x86/annotate/instructions.c
> index 7b7d462c6c6b..ea1dc686e7b4 100644
> --- a/tools/perf/arch/x86/annotate/instructions.c
> +++ b/tools/perf/arch/x86/annotate/instructions.c
> @@ -263,14 +263,14 @@ static void update_insn_state_x86(struct type_state *state,
>  		struct map_symbol *ms = dloc->ms;
>  		u64 ip = ms->sym->start + dl->al.offset;
>  
> -		if (!has_reg_type(state, dst->reg1))
> +		if (!has_reg_type(state, dst->reg1, dloc->arch))
>  			return;
>  
>  		tsr = &state->regs[dst->reg1];
>  
>  		if (src->imm)
>  			imm_value = src->offset;
> -		else if (has_reg_type(state, src->reg1) &&
> +		else if (has_reg_type(state, src->reg1, dloc->arch) &&
>  			 state->regs[src->reg1].kind == TSR_KIND_CONST)
>  			imm_value = state->regs[src->reg1].imm_value;
>  		else if (src->reg1 == DWARF_REG_PC) {
> @@ -321,7 +321,7 @@ static void update_insn_state_x86(struct type_state *state,
>  
>  	/* Case 1. register to register or segment:offset to register transfers */
>  	if (!src->mem_ref && !dst->mem_ref) {
> -		if (!has_reg_type(state, dst->reg1))
> +		if (!has_reg_type(state, dst->reg1, dloc->arch))
>  			return;
>  
>  		tsr = &state->regs[dst->reg1];
> @@ -374,7 +374,7 @@ static void update_insn_state_x86(struct type_state *state,
>  			return;
>  		}
>  
> -		if (!has_reg_type(state, src->reg1) ||
> +		if (!has_reg_type(state, src->reg1, dloc->arch) ||
>  		    !state->regs[src->reg1].ok) {
>  			tsr->ok = false;
>  			return;
> @@ -392,7 +392,7 @@ static void update_insn_state_x86(struct type_state *state,
>  	if (src->mem_ref && !dst->mem_ref) {
>  		int sreg = src->reg1;
>  
> -		if (!has_reg_type(state, dst->reg1))
> +		if (!has_reg_type(state, dst->reg1, dloc->arch))
>  			return;
>  
>  		tsr = &state->regs[dst->reg1];
> @@ -427,7 +427,7 @@ static void update_insn_state_x86(struct type_state *state,
>  			pr_debug_type_name(&tsr->type, tsr->kind);
>  		}
>  		/* And then dereference the pointer if it has one */
> -		else if (has_reg_type(state, sreg) && state->regs[sreg].ok &&
> +		else if (has_reg_type(state, sreg, dloc->arch) && state->regs[sreg].ok &&
>  			 state->regs[sreg].kind == TSR_KIND_TYPE &&
>  			 die_deref_ptr_type(&state->regs[sreg].type,
>  					    src->offset, &type_die)) {
> @@ -464,7 +464,7 @@ static void update_insn_state_x86(struct type_state *state,
>  			pr_debug_type_name(&type_die, tsr->kind);
>  		}
>  		/* And check percpu access with base register */
> -		else if (has_reg_type(state, sreg) &&
> +		else if (has_reg_type(state, sreg, dloc->arch) &&
>  			 state->regs[sreg].kind == TSR_KIND_PERCPU_BASE) {
>  			u64 ip = dloc->ms->sym->start + dl->al.offset;
>  			u64 var_addr = src->offset;
> @@ -473,7 +473,7 @@ static void update_insn_state_x86(struct type_state *state,
>  			if (src->multi_regs) {
>  				int reg2 = (sreg == src->reg1) ? src->reg2 : src->reg1;
>  
> -				if (has_reg_type(state, reg2) && state->regs[reg2].ok &&
> +				if (has_reg_type(state, reg2, dloc->arch) && state->regs[reg2].ok &&
>  				    state->regs[reg2].kind == TSR_KIND_CONST)
>  					var_addr += state->regs[reg2].imm_value;
>  			}
> @@ -504,7 +504,7 @@ static void update_insn_state_x86(struct type_state *state,
>  			}
>  		}
>  		/* And then dereference the calculated pointer if it has one */
> -		else if (has_reg_type(state, sreg) && state->regs[sreg].ok &&
> +		else if (has_reg_type(state, sreg, dloc->arch) && state->regs[sreg].ok &&
>  			 state->regs[sreg].kind == TSR_KIND_POINTER &&
>  			 die_get_member_type(&state->regs[sreg].type,
>  					     src->offset, &type_die)) {
> @@ -543,7 +543,7 @@ static void update_insn_state_x86(struct type_state *state,
>  	}
>  	/* Case 3. register to memory transfers */
>  	if (!src->mem_ref && dst->mem_ref) {
> -		if (!has_reg_type(state, src->reg1) ||
> +		if (!has_reg_type(state, src->reg1, dloc->arch) ||
>  		    !state->regs[src->reg1].ok)
>  			return;
>  
> diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
> index 7a48c3d72b89..fac9d3cdd318 100644
> --- a/tools/perf/util/annotate-data.c
> +++ b/tools/perf/util/annotate-data.c
> @@ -131,9 +131,14 @@ static void pr_debug_location(Dwarf_Die *die, u64 pc, int reg)
>  	}
>  }
>  
> -bool has_reg_type(struct type_state *state, int reg)
> +bool has_reg_type(struct type_state *state, int reg, struct arch *arch)
>  {
> -	return (unsigned)reg < ARRAY_SIZE(state->regs);
> +	if (arch__is(arch, "x86"))
> +		return (unsigned)reg < TYPE_STATE_MAX_REGS_x86;
> +	else if (arch__is(arch, "powerpc"))
> +		return (unsigned)reg < TYPE_STATE_MAX_REGS_PPC;
> +	else
> +		return (unsigned)reg < ARRAY_SIZE(state->regs);
>  }
>  
>  static void init_type_state(struct type_state *state, struct arch *arch)
> @@ -707,7 +712,7 @@ static void update_var_state(struct type_state *state, struct data_loc_info *dlo
>  			pr_debug_dtp("var [%"PRIx64"] -%#x(stack)",
>  				     insn_offset, -var->offset + fb_offset);
>  			pr_debug_type_name(&mem_die, TSR_KIND_TYPE);
> -		} else if (has_reg_type(state, var->reg) && var->offset == 0) {
> +		} else if (has_reg_type(state, var->reg, dloc->arch) && var->offset == 0) {
>  			struct type_state_reg *reg;
>  
>  			reg = &state->regs[var->reg];
> @@ -943,7 +948,7 @@ static int check_matching_type(struct type_state *state,
>  			if (dloc->op->reg2 == reg)
>  				reg2 = dloc->op->reg1;
>  
> -			if (has_reg_type(state, reg2) && state->regs[reg2].ok &&
> +			if (has_reg_type(state, reg2, dloc->arch) && state->regs[reg2].ok &&
>  			    state->regs[reg2].kind == TSR_KIND_CONST)
>  				var_addr += state->regs[reg2].imm_value;
>  		}
> diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
> index 6fe8ee8b8410..4d8682cdc53c 100644
> --- a/tools/perf/util/annotate-data.h
> +++ b/tools/perf/util/annotate-data.h
> @@ -189,7 +189,9 @@ struct type_state_stack {
>  };
>  
>  /* FIXME: This should be arch-dependent */
> -#define TYPE_STATE_MAX_REGS  16
> +#define TYPE_STATE_MAX_REGS  32
> +#define TYPE_STATE_MAX_REGS_x86	16
> +#define TYPE_STATE_MAX_REGS_PPC	32

How about this?

#ifdef __powerpc__  // or something
# define TYPE_STATE_MAX_REGS  32
#else
# define TYPE_STATE_MAX_REGS  16
#endif

Thanks,
Namhyung

>  
>  /*
>   * State table to maintain type info in each register and stack location.
> @@ -224,7 +226,7 @@ void global_var_type__tree_delete(struct rb_root *root);
>  
>  int hist_entry__annotate_data_tty(struct hist_entry *he, struct evsel *evsel);
>  
> -bool has_reg_type(struct type_state *state, int reg);
> +bool has_reg_type(struct type_state *state, int reg, struct arch *arch);
>  struct type_state_stack *findnew_stack_state(struct type_state *state,
>  						int offset, u8 kind,
>  						Dwarf_Die *type_die);
> -- 
> 2.43.0
> 
