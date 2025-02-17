Return-Path: <linuxppc-dev+bounces-6283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 707E7A38DCF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 22:04:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxZs66vw4z2xWL;
	Tue, 18 Feb 2025 08:04:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739807311;
	cv=none; b=Yrk4Fjbmsx3GYwTdZBX1+q/9T2qhJhHyhU6Vt9WK6Zbd2wJd1abITGbvMUHOf2nduX2esfk4JCWfM2/9YjaEuzF0lrz5xTZRTk+bM4YTymyxZNUA/Mvnkj++DOCeOZ+wHwJbGwQU2ehsxZJ5Aa+dmjsUUzsclP1+AzREmS1XASf7yC8RhAFNmDMSD5RDUuXolCbue3M6hIi9t5KOGkYN6wx5vSsYf5hcqViJqkGC/Vr1kKZmROcwyg+71FdCpCSHRx127dSSwWShex+RkUPvoyjqR+m7i6U00yA7RWkjabExDljDBSB28qY/JIMQMBdzJCkdcGmfBJZiirlG9tuQ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739807311; c=relaxed/relaxed;
	bh=LPDghrWJkASO+zl2RLTvdn4N9sHfOOgrUhUPDIBW/kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONdP2GXgO09F79HJqzwYPmqDATsOSe+5Xvjva7ZY/507e9J7EAYpzGUj+VV4/CYlUXo5JSXz9izB41ELkcXEFrOBzFZihfC0u8r8DAOt4C+EIkeTOy3EZAA4mDMc6LlLLEcgVOfBbJThDU+ugGPQ9L7+BTqBgbKqc+9TYWWcD6zTzzQhKZ0OvzbIrU1L9zz4ju8JV4r5OaNWivL/Q5f16ZzDIT2XVPfbbzU+JsobsenODAlXt9P4qNMrKNZI18/BlPOl8wckX3S+gzz1919CFDnnSC6nHhqNYFK1oRHR6+d6GTxYbYuXQ8iH0KC+iV0a3ZBF/9hblhLoVqfTuwzTog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qkXSK3t6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=james.clark@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qkXSK3t6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=james.clark@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxRrs4vYRz2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 02:48:28 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38f3ea6207cso1198372f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739807302; x=1740412102; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPDghrWJkASO+zl2RLTvdn4N9sHfOOgrUhUPDIBW/kE=;
        b=qkXSK3t6NdKHQ/zZk/8HCJIxB4/WCuxNbFsJl7IPHPwt6TSNvmKdxGPvOQmlrh4LyU
         wGPXFNhkQHW1mHZyns8Qzot8PUuyBlFuPeQ3agoORN6o/lKWjsZfRYllAXYIWSzYrhKh
         EdRd76dmI/XP0MkQ3ruYTQbkfw4woT+rxLOV3mNcYCainqZWZXMzyuDzoI4Nh3ILr3v6
         l07xsjORk4Y+20PdpoocUO9uQUmVJ8zE2xtEuUEOPWx1vhOuJPwNbAOwUdK2cn2j798s
         TO1FMWhSUjpxBEa45cVZVo6H+Hq0DxRnkg+btoXBZTdH1nIeaf/rguPasLUOzdpMQw/A
         Tlgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739807302; x=1740412102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPDghrWJkASO+zl2RLTvdn4N9sHfOOgrUhUPDIBW/kE=;
        b=AHjCf/frv+x1UjVUYGEkM1vJWPfdgpuqBz7u9kjc61g7rFrn2d4BXeoWdfyAENDR0w
         7heHCqBM3/D/KJi0/UMy5zvxmxFKSDVv+uDKJt9oog1YrNC5f0ih0LhvL0u0f53uSLiu
         nfwf7IWIV+uJ/16zJORfNiyk+rskBPCWC3Khen3H2BzEAv3TRVcFKNRtH5EelYF0OJ5n
         EQ5JB130AaGhYRmUiS5F9ApPeZELHPH0tem+D8gj7Wn1j9Iq1aRCV/7HajbFH9vhP2FZ
         c8dQ1qsZQ4BO/DJEpRSSuBjIhu7KC/LN7pR7cwkATjLR847K+0C+4SaoY6EPGCnFmFGe
         HL0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoGsCXH5Rcw7VRGJAPGHlnp6Mk+ReRYCCV1Sa4UQurvXUay6ik/qMdri0aBAMO2YoWh44RPj7war8HabQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzCVyboz3GiMr2O5IMOSBlfxE0TMoAITlTKgjmVCmKiWPBeeXUj
	ZrznK3g4z0t/fjDJ6TO/j0xn0yAay+m5Gld5FFLdwbyNRqAowObOcOjZzoVY58M=
X-Gm-Gg: ASbGncuPPiK3+YqZh+CIhQMkDjQdIXFuXvqktisanzo0vXzKxxQU4ajZ0AIJvJa+7bC
	NVNO3SrwtsP8GjTd2YIs4bNQfxkhcjhH1z4XYoN0/YqhCE2OSngv+XWQeofhlfQIOZj3hMhgvAF
	o8qZ7yGxolRg6EymWnOWW6u6BiRBSL7VrDSZqc9j6jWmIWIVr8kkDoB8ly+4Zpkq65BoPb19Wpz
	upa1GiJlQ1wAE7A1E2Uxo663K25oG+sf60lWmplGp648ZGQwkAd8D1FdybYn48MlHgpGCh8r75W
	dmvv0KFqFBmTObmIWnvyDzxAuA==
X-Google-Smtp-Source: AGHT+IECdESRQYV/W+1X8h4Mc4PXA3ZTzsooOvg7iZMEiHqHLyviO+jMiRENW2nH7BAq2FLQxIJOCw==
X-Received: by 2002:a05:6000:188c:b0:38d:b6a9:2cd2 with SMTP id ffacd0b85a97d-38f3407371emr11339096f8f.46.1739807302022;
        Mon, 17 Feb 2025 07:48:22 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258cccdesm12577678f8f.26.2025.02.17.07.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:48:21 -0800 (PST)
Message-ID: <964f60e0-fe88-48c8-87c3-a6ea2f3cac6c@linaro.org>
Date: Mon, 17 Feb 2025 15:48:20 +0000
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/perf: Pick the correct dwarf die while adding probe
 point for a function
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
 hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com, acme@kernel.org,
 jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
 namhyung@kernel.org
References: <20250212131949.68706-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250212131949.68706-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/02/2025 1:19 pm, Athira Rajeev wrote:
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
>     synthesize_probe_trace_arg ()
>     synthesize_probe_trace_command ()
>     probe_file.add_event ()
>     apply_perf_probe_events ()
>     __cmd_probe ()
>     cmd_probe ()
>     run_builtin ()
>     handle_internal_command ()
>     main ()
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
>   <1><4214883>: Abbrev Number: 147 (DW_TAG_subprogram)
>      <4214885>   DW_AT_external    : 1
>      <4214885>   DW_AT_name        : (indirect string, offset: 0x17b9f3): vfs_fstatat
> 
> With formal parameters:
>   <2><4214896>: Abbrev Number: 51 (DW_TAG_formal_parameter)
>      <4214897>   DW_AT_name        : dfd
>   <2><42148a3>: Abbrev Number: 23 (DW_TAG_formal_parameter)
>      <42148a4>   DW_AT_name        : (indirect string, offset: 0x8fda9): filename
>   <2><42148b0>: Abbrev Number: 23 (DW_TAG_formal_parameter)
>      <42148b1>   DW_AT_name        : (indirect string, offset: 0x16bd9c): stat
>   <2><42148bd>: Abbrev Number: 23 (DW_TAG_formal_parameter)
>      <42148be>   DW_AT_name        : (indirect string, offset: 0x39832b): flags
> 
> While collecting variables/parameters for a probe point, the function
> copy_variables_cb() also looks at dwarf debug entries based on the
> instruction address. Snippet
> 
>          if (dwarf_haspc(die_mem, vf->pf->addr))
>                  return DIE_FIND_CB_CONTINUE;
>          else
>                  return DIE_FIND_CB_SIBLING;
> 
> But incase of inlined function instance for vfs_fstatat, there are two
> entries which has the instruction address entry point as same.
> 
> Instance 1: which is for vfs_fstatat and DW_AT_abstract_origin points to
> 0x4214883 (reference above for main abstract die)
> 
> <3><42131fa>: Abbrev Number: 59 (DW_TAG_inlined_subroutine)
>      <42131fb>   DW_AT_abstract_origin: <0x4214883>
>      <42131ff>   DW_AT_entry_pc    : 0xc00000000062b1e0
> 
> Instance 2: which is not for vfs_fstatat but for getname
> 
>   <5><4213270>: Abbrev Number: 39 (DW_TAG_inlined_subroutine)
>      <4213271>   DW_AT_abstract_origin: <0x4215b6b>
>      <4213275>   DW_AT_entry_pc    : 0xc00000000062b1e0
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
>   tools/perf/util/probe-finder.c | 21 ++++++++++++++++++---
>   tools/perf/util/probe-finder.h |  1 +
>   2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
> index 1e769b68da37..361086a7adae 100644
> --- a/tools/perf/util/probe-finder.c
> +++ b/tools/perf/util/probe-finder.c
> @@ -973,6 +973,7 @@ static int probe_point_search_cb(Dwarf_Die *sp_die, void *data)
>   	pr_debug("Matched function: %s [%lx]\n", dwarf_diename(sp_die),
>   		 (unsigned long)dwarf_dieoffset(sp_die));
>   	pf->fname = fname;
> +	memcpy(&pf->abstract_die, sp_die, sizeof(Dwarf_Die));
>   	if (pp->line) { /* Function relative line */
>   		dwarf_decl_line(sp_die, &pf->lno);
>   		pf->lno += pp->line;
> @@ -1179,6 +1180,8 @@ static int copy_variables_cb(Dwarf_Die *die_mem, void *data)
>   	struct local_vars_finder *vf = data;
>   	struct probe_finder *pf = vf->pf;
>   	int tag;
> +	Dwarf_Attribute attr;
> +	Dwarf_Die var_die;
>   
>   	tag = dwarf_tag(die_mem);
>   	if (tag == DW_TAG_formal_parameter ||
> @@ -1196,10 +1199,22 @@ static int copy_variables_cb(Dwarf_Die *die_mem, void *data)
>   		}
>   	}
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
>   		return DIE_FIND_CB_CONTINUE;
> -	else
> -		return DIE_FIND_CB_SIBLING;
> +	}
> +
> +out:
> +	return DIE_FIND_CB_SIBLING;
>   }
>   
>   static int expand_probe_args(Dwarf_Die *sc_die, struct probe_finder *pf,
> diff --git a/tools/perf/util/probe-finder.h b/tools/perf/util/probe-finder.h
> index dcf6cc1e1cbe..b3039635c94e 100644
> --- a/tools/perf/util/probe-finder.h
> +++ b/tools/perf/util/probe-finder.h
> @@ -63,6 +63,7 @@ struct probe_finder {
>   	const char		*fname;		/* Real file name */
>   	Dwarf_Die		cu_die;		/* Current CU */
>   	Dwarf_Die		sp_die;
> +	Dwarf_Die		abstract_die;
>   	struct intlist		*lcache;	/* Line cache for lazy match */
>   
>   	/* For variable searching */

Reviewed-by: James Clark <james.clark@linaro.org>


