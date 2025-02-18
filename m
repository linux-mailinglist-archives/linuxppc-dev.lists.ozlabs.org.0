Return-Path: <linuxppc-dev+bounces-6333-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0940BA3ABC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 23:36:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyDsb2RCqz302D;
	Wed, 19 Feb 2025 09:36:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739918211;
	cv=none; b=jhSlM3rWtW2nc3PqXvPAPGyKHDPJbPrm9x7ZQihEsnn4vc15SgnW9FaafpYzzUVJRz5l17czRpqIUtEXuvaUQw/rev+WQKjKneqR531AF6Sa2+NPzfxn/x5vo0jS/xQREgtG/UAWXkqlXFsiNzgNLYAxCy5gi1BJzZU2x+fwFD+zWPCpIjI+OxmC+ndt30qSYcocgRjExfF+K821T5wZMIYxLA9LQ03TfpXpuk8wjUM1PtCBjAgVRi7gMoQFc73K3cEKTJsWgKXYiiB6/IEwd8UKOLlgYbuNMTQa4IpFHFGei6Sv9lsli/XNuD5cu9/4SHdzOF/OJnu4cxZiV+Jmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739918211; c=relaxed/relaxed;
	bh=ljP0/+JBvdxkMoDKYToPrHo8jlALGXpoygwmd3hCCQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VODbAXvzNnGe56FLvuqFNq3KteZstqkDCcUehmHaD4KgcVS7IAOUf2Im/eClfAq+FKk0v7bADDti/u+ApPtrLb1amy3Xi7cDkZieYbqbkzlbdDL3JCwN6P1dusZjGCcGx9aWtNQmW8eKXaCes/5ywbvjNGzDYwKW1EhOq2KiyX9oLNOncrOuylhyiEpxNDIc7k6Yse+Flfr9lbVmspmu2YGp67B/KsU8RO6R5IvDppL+0K46E43WcvaLy5F7MLspok3M/ZAOV1ue8u9Di5QzhtjpdO89FAKsPzAV83ecXoeqsndl1eUK/JKsaSYx9ol/K3ajzOXcnmRN44H8gpsgEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bS6pFcx3; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bS6pFcx3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyDsZ0TMQz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 09:36:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62B135C62C2;
	Tue, 18 Feb 2025 22:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C70C4CEE2;
	Tue, 18 Feb 2025 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739918207;
	bh=/+jngrR7RaUOqC99Mef2L3Iz0wPA/2tUx4T2hEeRdnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bS6pFcx3LPcbm2pJQ8YK0I1SriLAVJyrYojUqvAjMou3jlXRE1srDY35QkiOUhFNr
	 I1DYRg4aHI77oOg+oIyl1iKi2rR/TeNLn4tWCkh2eB7dk7netI90QahkEZvBSnQwaD
	 IzRkcckXCoc/oIDxlgal30wJw3wiB7R1YnctAeoRGWGAPkW4qhkpjidV26Rd2hoc4h
	 8195RWRR3e7/TaQuxhbHhvdcb9HpZ3fYVTN4lmH538VpOXLlKDA1oV0lscruHsJgN8
	 43J5wmJNGWC8LrA3BA2CF7i22O8YQxCI2eOCktd+zC7wMl46EIwRc/yiuTToyCct/v
	 dD94rKgdV1qAw==
Date: Tue, 18 Feb 2025 14:36:45 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
	irogers@google.com, linux-perf-users@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
	hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com
Subject: Re: [PATCH] tools/perf: Pick the correct dwarf die while adding
 probe point for a function
Message-ID: <Z7ULfdJXKWG0u9uY@google.com>
References: <20250212131949.68706-1-atrajeev@linux.vnet.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212131949.68706-1-atrajeev@linux.vnet.ibm.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Added Masami.

On Wed, Feb 12, 2025 at 06:49:49PM +0530, Athira Rajeev wrote:
> Perf probe on vfs_fstatat fails as below on a powerpc system
> 
> ./perf probe -nf --max-probes=512 -a 'vfs_fstatat $params'
> Segmentation fault (core dumped)
> 
> This is observed while running perftool-testsuite_probe testcase.
> 
> While running with verbose, its observed that segfault happens
> at:
> 
>    synthesize_probe_trace_arg ()
>    synthesize_probe_trace_command ()
>    probe_file.add_event ()
>    apply_perf_probe_events ()
>    __cmd_probe ()
>    cmd_probe ()
>    run_builtin ()
>    handle_internal_command ()
>    main ()
> 
> Code in synthesize_probe_trace_arg() access a null value and results in
> segfault. Data structure which is null:
> struct probe_trace_arg arg->value
> 
> We are hitting a case where arg->value is null in probe point:
> "vfs_fstatat $params". This is happening since 'commit e896474fe485
> ("getname_maybe_null() - the third variant of pathname copy-in")'
> Before the commit, probe point for vfs_fstatat was getting added only
> for one location:
> 
> Writing event: p:probe/vfs_fstatat _text+6345404 dfd=%gpr3:s32 filename=%gpr4:x64 stat=%gpr5:x64 flags=%gpr6:s32
> 
> With this change, vfs_fstatat code is inlined for other locations in the
> code:
> Probe point found: __do_sys_lstat64+48
> Probe point found: __do_sys_stat64+48
> Probe point found: __do_sys_newlstat+48
> Probe point found: __do_sys_newstat+48
> Probe point found: vfs_fstatat+0
> 
> When trying to find matching dwarf information entry (DIE)
> from the debuginfo, the code incorrectly picks DIE which is
> not referring to vfs_fstatat. Snippet from dwarf entry in vmlinux
> debuginfo file.
> 
> The main abstract die is:
>  <1><4214883>: Abbrev Number: 147 (DW_TAG_subprogram)
>     <4214885>   DW_AT_external    : 1
>     <4214885>   DW_AT_name        : (indirect string, offset: 0x17b9f3): vfs_fstatat
> 
> With formal parameters:
>  <2><4214896>: Abbrev Number: 51 (DW_TAG_formal_parameter)
>     <4214897>   DW_AT_name        : dfd
>  <2><42148a3>: Abbrev Number: 23 (DW_TAG_formal_parameter)
>     <42148a4>   DW_AT_name        : (indirect string, offset: 0x8fda9): filename
>  <2><42148b0>: Abbrev Number: 23 (DW_TAG_formal_parameter)
>     <42148b1>   DW_AT_name        : (indirect string, offset: 0x16bd9c): stat
>  <2><42148bd>: Abbrev Number: 23 (DW_TAG_formal_parameter)
>     <42148be>   DW_AT_name        : (indirect string, offset: 0x39832b): flags
> 
> While collecting variables/parameters for a probe point, the function
> copy_variables_cb() also looks at dwarf debug entries based on the
> instruction address. Snippet
> 
>         if (dwarf_haspc(die_mem, vf->pf->addr))
>                 return DIE_FIND_CB_CONTINUE;
>         else
>                 return DIE_FIND_CB_SIBLING;
> 
> But incase of inlined function instance for vfs_fstatat, there are two
> entries which has the instruction address entry point as same.
> 
> Instance 1: which is for vfs_fstatat and DW_AT_abstract_origin points to
> 0x4214883 (reference above for main abstract die)
> 
> <3><42131fa>: Abbrev Number: 59 (DW_TAG_inlined_subroutine)
>     <42131fb>   DW_AT_abstract_origin: <0x4214883>
>     <42131ff>   DW_AT_entry_pc    : 0xc00000000062b1e0
> 
> Instance 2: which is not for vfs_fstatat but for getname
> 
>  <5><4213270>: Abbrev Number: 39 (DW_TAG_inlined_subroutine)
>     <4213271>   DW_AT_abstract_origin: <0x4215b6b>
>     <4213275>   DW_AT_entry_pc    : 0xc00000000062b1e0
> 
> But the copy_variables_cb() continues to add parameters from second
> instance also based on the dwarf_haspc() check. This results in
> formal parameters for getname also appended to params. But while
> filling in the args->value for these parameters, since these args
> are not part of dwarf with offset "42131fa". Hence value will be
> null. This incorrect args results in segfault when value field is
> accessed.
> 
> Save the Dwarf_Die which is the actual DW_TAG_subprogram as part of
> "struct probe_finder". In copy_variables_cb(), include check to make
> sure the DW_AT_abstract_origin points to the correct entry if the
> dwarf_haspc() matches the instruction address.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/util/probe-finder.c | 21 ++++++++++++++++++---
>  tools/perf/util/probe-finder.h |  1 +
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
> index 1e769b68da37..361086a7adae 100644
> --- a/tools/perf/util/probe-finder.c
> +++ b/tools/perf/util/probe-finder.c
> @@ -973,6 +973,7 @@ static int probe_point_search_cb(Dwarf_Die *sp_die, void *data)
>  	pr_debug("Matched function: %s [%lx]\n", dwarf_diename(sp_die),
>  		 (unsigned long)dwarf_dieoffset(sp_die));
>  	pf->fname = fname;
> +	memcpy(&pf->abstract_die, sp_die, sizeof(Dwarf_Die));

Maybe just saving dieoffset is fine.

Thanks,
Namhyung


>  	if (pp->line) { /* Function relative line */
>  		dwarf_decl_line(sp_die, &pf->lno);
>  		pf->lno += pp->line;
> @@ -1179,6 +1180,8 @@ static int copy_variables_cb(Dwarf_Die *die_mem, void *data)
>  	struct local_vars_finder *vf = data;
>  	struct probe_finder *pf = vf->pf;
>  	int tag;
> +	Dwarf_Attribute attr;
> +	Dwarf_Die var_die;
>  
>  	tag = dwarf_tag(die_mem);
>  	if (tag == DW_TAG_formal_parameter ||
> @@ -1196,10 +1199,22 @@ static int copy_variables_cb(Dwarf_Die *die_mem, void *data)
>  		}
>  	}
>  
> -	if (dwarf_haspc(die_mem, vf->pf->addr))
> +	if (dwarf_haspc(die_mem, vf->pf->addr)) {
> +		/*
> +		 * when DW_AT_entry_pc contains instruction address,
> +		 * also check if the DW_AT_abstract_origin of die_mem
> +		 * points to correct die.
> +		 */
> +		if (dwarf_attr(die_mem, DW_AT_abstract_origin, &attr)) {
> +			dwarf_formref_die(&attr, &var_die);
> +			if (dwarf_dieoffset(&pf->abstract_die) != dwarf_dieoffset(&var_die))
> +				goto out;
> +		}
>  		return DIE_FIND_CB_CONTINUE;
> -	else
> -		return DIE_FIND_CB_SIBLING;
> +	}
> +
> +out:
> +	return DIE_FIND_CB_SIBLING;
>  }
>  
>  static int expand_probe_args(Dwarf_Die *sc_die, struct probe_finder *pf,
> diff --git a/tools/perf/util/probe-finder.h b/tools/perf/util/probe-finder.h
> index dcf6cc1e1cbe..b3039635c94e 100644
> --- a/tools/perf/util/probe-finder.h
> +++ b/tools/perf/util/probe-finder.h
> @@ -63,6 +63,7 @@ struct probe_finder {
>  	const char		*fname;		/* Real file name */
>  	Dwarf_Die		cu_die;		/* Current CU */
>  	Dwarf_Die		sp_die;
> +	Dwarf_Die		abstract_die;
>  	struct intlist		*lcache;	/* Line cache for lazy match */
>  
>  	/* For variable searching */
> -- 
> 2.43.5
> 

