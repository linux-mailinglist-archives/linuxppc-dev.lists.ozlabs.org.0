Return-Path: <linuxppc-dev+bounces-6505-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B50A4602F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 14:05:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2vpr6ztvz3bmL;
	Thu, 27 Feb 2025 00:05:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740575140;
	cv=none; b=ZfzDhZyaVhKvgcDJYLjJN35b7UIcf14TC1aOnGjXopapbQ2CEyJ/1pvC+N/TBENKV3hsrI7Tu1Abn6TzmTrWSWbVx8X+ibSDZPYL77vWofN8hej0Wt+N8VcxtlwWFZmO/uEQMmoW83gCVjaP3YRJHtD8SWoVjz/cHoiIqsEpuBKouN01mXB7gY3SbMV+4oh27D52vok49Xt94QVF8O2p5EVc04CejfkPlX6U9OXrzvFJPBQu6jZRXDr1Lly2pyfG1UQewlgu9QI8I2zNzaC03hSOGoC7cbktQVXMH1mAdFCO8goJvzWtJQh+6O5i0jHRCZiXo9rVLdx+VBFUVio1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740575140; c=relaxed/relaxed;
	bh=ZEGz2xLsd3duGpKGVTbOz46kT4BCufmh6saskx2w/24=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OYoj/pqHn+/+KOfUQYfqrA4xxE2dj3UaWZDnoSdae2lfaMKKkIw7Oac9lZwTAC/y50IKdrlBGwRfJiJzKTkTPHFZU3uJzOodmo/obR579vRiX3+SPhqKTQK6IlsRUI68X+PofcogQHV5KNZOVsfkydcxW8jyo2xne0VFcl9pBxYOdY5CYDVeSyFA7mSkS5Rez2GXdg3bBgwoL6urqPfdqDV40lv7CvVnRa023ggYFnW4TeHzH37s/04o7iDDGm95Mue2Vk0mRdUYPEYRwOqPDHQCbqqec6zdLaDEuSE5GF9dlLAdGeREYzGe/iLBzzWe0a0nBORSyfTuZbtS/1PXtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GdRjUtSD; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GdRjUtSD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2vpq50sGz3bmJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 00:05:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A68936121C;
	Wed, 26 Feb 2025 13:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40FF8C4CED6;
	Wed, 26 Feb 2025 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740575136;
	bh=ViE3G4RVFe/PtmU+1bwWgae5etl7I5adZcqavmtBBJk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GdRjUtSDulunSchedhZQvTV59UieXOa7J6JthY5cI5CqCO2/xZy+HWxrT801xkO9A
	 y4xtvCMgxWisfuqnm/LKLypI13+V4tu9Tm/YvcSCTTwFwP2HJ4KTcpeBMVTGqsfUoK
	 bdqJZU37/j7qULGCVE1XSFKDvwe0rXOQud0mSnyiXIw4I7syIlwVo1IULdl+VwvE8N
	 UWBgSub+kZ+eMIABvlYFFai4kQLZLSZDpTf5OQu6OjPEPjRtGKQ1LXzjwJ8nIPaplW
	 QkEi/KftfjZNQfyfRRDLw7J+qeUcST5O4e8FKQq7rZCTW4NX90yS+w4ALvMTbthxMN
	 /UIwjtEjmj0UA==
Date: Wed, 26 Feb 2025 22:05:32 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
 irogers@google.com, namhyung@kernel.org, linux-perf-users@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, hbathini@linux.vnet.ibm.com,
 Aditya.Bodkhe1@ibm.com, Tejas.Manhas1@ibm.com, mhiramat@kernel.org
Subject: Re: [PATCH V2] tools/perf: Pick the correct dwarf die while adding
 probe point for a function
Message-Id: <20250226220532.af2538bdbe0d7e3db94cc470@kernel.org>
In-Reply-To: <20250225123042.37263-1-atrajeev@linux.ibm.com>
References: <20250225123042.37263-1-atrajeev@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 25 Feb 2025 18:00:42 +0530
Athira Rajeev <atrajeev@linux.ibm.com> wrote:

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
> Save the dwarf dieoffset of the actual DW_TAG_subprogram as part of
> "struct probe_finder". In copy_variables_cb(), include check to make
> sure the DW_AT_abstract_origin points to the correct entry if the
> dwarf_haspc() matches the instruction address.
> 

Good catch! and this looks good to me :-)

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you!

> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
> Changelog:
> v1 -> v2:
>  Instead of saving the Dwarf_Die as part of "struct probe_finder",
>  save the dwarf dieoffset. We only need offset while comparing to see
>  if DW_AT_abstract_origin points to correct entry
>  Suggested in review by Namhyung.
> 
>  tools/perf/util/probe-finder.c | 21 ++++++++++++++++++---
>  tools/perf/util/probe-finder.h |  1 +
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
> index 1e769b68da37..3cc7c40f5097 100644
> --- a/tools/perf/util/probe-finder.c
> +++ b/tools/perf/util/probe-finder.c
> @@ -973,6 +973,7 @@ static int probe_point_search_cb(Dwarf_Die *sp_die, void *data)
>  	pr_debug("Matched function: %s [%lx]\n", dwarf_diename(sp_die),
>  		 (unsigned long)dwarf_dieoffset(sp_die));
>  	pf->fname = fname;
> +	pf->abstrace_dieoffset = dwarf_dieoffset(sp_die);
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
> +			if (pf->abstrace_dieoffset != dwarf_dieoffset(&var_die))
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
> index dcf6cc1e1cbe..ecd6d937c592 100644
> --- a/tools/perf/util/probe-finder.h
> +++ b/tools/perf/util/probe-finder.h
> @@ -63,6 +63,7 @@ struct probe_finder {
>  	const char		*fname;		/* Real file name */
>  	Dwarf_Die		cu_die;		/* Current CU */
>  	Dwarf_Die		sp_die;
> +	Dwarf_Off		abstrace_dieoffset;
>  	struct intlist		*lcache;	/* Line cache for lazy match */
>  
>  	/* For variable searching */
> -- 
> 2.43.5
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

