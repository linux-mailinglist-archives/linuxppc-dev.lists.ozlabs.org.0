Return-Path: <linuxppc-dev+bounces-6495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E93C0A45CE7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 12:17:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2sQT2n7tz3blH;
	Wed, 26 Feb 2025 22:17:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740568673;
	cv=none; b=N1BTOq1cPvxQFUqoHeS5C6wEAZ0QjCpNWPY0Gpfw5rbkWvGb98vGepmR9rf5nbkurHQc4YCY6NRxBNLGcmzAxr5Fj8ztGFHZ8+JnTESGU1ig/epTbUqCQlPQq2gnIlg+i3P1tNJOEmDsLQQvbpkVPVCnEui4jXcPoz1O1BndqjXg3IBFimi9H3Ewv/LhkA2A/OfSyT0MnH3cXQcnhdgOXeEEK2fxanUpSyqxgvjYBaVy9cSIIURVSoKuUzFjWKRXLXM9gX4sa6KujgG0F35UFDODn3o2arSYKPQM6ByRxOMPm5Cp7u5NFlBgvY6AzHUpHneCu7nwRUD4GmEmy8TVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740568673; c=relaxed/relaxed;
	bh=vK3kSjM7Fv60AYVd2Cx5zcksYsqSwlKji1F8tcjj+kM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GMBpMvvcoqFZOlEUKUZtUuFwMs27YC4oV5Vsqp6aQQYD1548WGpM5dxHovyr4Wwn/NEnp6eEASrAEicym/RcArFwQkHvRGYMTtpVEIf4v5/R+PVS+DoZwK/R/p5tza1BHCRLh6DxmsYnyKDmnVYFhV8eUUuWxR7YeNOOZeNqMGWJZwkB1vfr1otYuaawxhp1UaulcS8ncCsA3hbPKmoxm4tzYUZMRwAr6R6sA44qS3dDJShgK9yRUiZQHwDjDcOQeKQeTCgZ8fl2zxM4sl2u1kRok7Fa50E1VzZptgL2RKqEeWmLINb8jpZjPcKv1uxqG748zzwTFuTrd49T7on34A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pwbYutcA; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pwbYutcA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2sQS0VBPz3blF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 22:17:51 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q1l4ok028094;
	Wed, 26 Feb 2025 11:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vK3kSj
	M7Fv60AYVd2Cx5zcksYsqSwlKji1F8tcjj+kM=; b=pwbYutcA2lMTeaLEpr7nm1
	omN7Ax3JVUGmHEhI1SYF8v2EwO6AByAF8IrcW/PrK2OLDJSW+6q1V/5XxQCDOU6V
	iHYFgm6c/f4k7ab7mqKaSAGV2ybsFeDCMeTEaM5R0otbEyzL9d57YWUxJVactWsD
	kC36V5NtgZHg1qpm1BDBcjqvef8v1/7mDC/sqc7fL3Zc68fKg/abQCl+Jzj+i7Rl
	qcL8YCO+ZfXBnLTr3I+4VxnOjdB/7V/+l7MJQOCs0kb9KmewBRtmIn3t0yksuTSU
	HKlm1w1DuKYUfdrMMSTCnqwD+3DM65ewy0RmlzkM8WYkIoXe+RQqYuyJLQt9X9fA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5jas0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:17:42 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51QAslLh005755;
	Wed, 26 Feb 2025 11:17:42 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451q5jas09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:17:42 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9gp8G002567;
	Wed, 26 Feb 2025 11:17:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44yu4jsymy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:17:41 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51QBHbFF34079102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 11:17:37 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C296220040;
	Wed, 26 Feb 2025 11:17:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D3C020043;
	Wed, 26 Feb 2025 11:17:30 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.247.223])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 26 Feb 2025 11:17:30 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH V2] tools/perf: Pick the correct dwarf die while adding
 probe point for a function
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <20250225123042.37263-1-atrajeev@linux.ibm.com>
Date: Wed, 26 Feb 2025 16:47:16 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Kajol Jain <kjain@linux.ibm.com>,
        Disha Goel <disgoel@linux.vnet.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, Tejas Manhas <Tejas.Manhas1@ibm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B459FF3D-5DD5-4218-BA3E-90A2A00B13A3@linux.ibm.com>
References: <20250225123042.37263-1-atrajeev@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.ibm.com>,
        James Clark <james.clark@linaro.org>,
        Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yJYG7AeWvS1JxfHknFFpt7rSluJlf6pz
X-Proofpoint-ORIG-GUID: D47MOmtmUr8IhFYzbBckEmGAf0mt5520
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260088
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 25 Feb 2025, at 6:00=E2=80=AFPM, Athira Rajeev =
<atrajeev@linux.ibm.com> wrote:
>=20
> Perf probe on vfs_fstatat fails as below on a powerpc system
>=20
> ./perf probe -nf --max-probes=3D512 -a 'vfs_fstatat $params'
> Segmentation fault (core dumped)
>=20
> This is observed while running perftool-testsuite_probe testcase.
>=20
> While running with verbose, its observed that segfault happens
> at:
>=20
>   synthesize_probe_trace_arg ()
>   synthesize_probe_trace_command ()
>   probe_file.add_event ()
>   apply_perf_probe_events ()
>   __cmd_probe ()
>   cmd_probe ()
>   run_builtin ()
>   handle_internal_command ()
>   main ()
>=20
> Code in synthesize_probe_trace_arg() access a null value and results =
in
> segfault. Data structure which is null:
> struct probe_trace_arg arg->value
>=20
> We are hitting a case where arg->value is null in probe point:
> "vfs_fstatat $params". This is happening since 'commit e896474fe485
> ("getname_maybe_null() - the third variant of pathname copy-in")'
> Before the commit, probe point for vfs_fstatat was getting added only
> for one location:
>=20
> Writing event: p:probe/vfs_fstatat _text+6345404 dfd=3D%gpr3:s32 =
filename=3D%gpr4:x64 stat=3D%gpr5:x64 flags=3D%gpr6:s32
>=20
> With this change, vfs_fstatat code is inlined for other locations in =
the
> code:
> Probe point found: __do_sys_lstat64+48
> Probe point found: __do_sys_stat64+48
> Probe point found: __do_sys_newlstat+48
> Probe point found: __do_sys_newstat+48
> Probe point found: vfs_fstatat+0
>=20
> When trying to find matching dwarf information entry (DIE)
> from the debuginfo, the code incorrectly picks DIE which is
> not referring to vfs_fstatat. Snippet from dwarf entry in vmlinux
> debuginfo file.
>=20
> The main abstract die is:
> <1><4214883>: Abbrev Number: 147 (DW_TAG_subprogram)
>    <4214885>   DW_AT_external    : 1
>    <4214885>   DW_AT_name        : (indirect string, offset: =
0x17b9f3): vfs_fstatat
>=20
> With formal parameters:
> <2><4214896>: Abbrev Number: 51 (DW_TAG_formal_parameter)
>    <4214897>   DW_AT_name        : dfd
> <2><42148a3>: Abbrev Number: 23 (DW_TAG_formal_parameter)
>    <42148a4>   DW_AT_name        : (indirect string, offset: 0x8fda9): =
filename
> <2><42148b0>: Abbrev Number: 23 (DW_TAG_formal_parameter)
>    <42148b1>   DW_AT_name        : (indirect string, offset: =
0x16bd9c): stat
> <2><42148bd>: Abbrev Number: 23 (DW_TAG_formal_parameter)
>    <42148be>   DW_AT_name        : (indirect string, offset: =
0x39832b): flags
>=20
> While collecting variables/parameters for a probe point, the function
> copy_variables_cb() also looks at dwarf debug entries based on the
> instruction address. Snippet
>=20
>        if (dwarf_haspc(die_mem, vf->pf->addr))
>                return DIE_FIND_CB_CONTINUE;
>        else
>                return DIE_FIND_CB_SIBLING;
>=20
> But incase of inlined function instance for vfs_fstatat, there are two
> entries which has the instruction address entry point as same.
>=20
> Instance 1: which is for vfs_fstatat and DW_AT_abstract_origin points =
to
> 0x4214883 (reference above for main abstract die)
>=20
> <3><42131fa>: Abbrev Number: 59 (DW_TAG_inlined_subroutine)
>    <42131fb>   DW_AT_abstract_origin: <0x4214883>
>    <42131ff>   DW_AT_entry_pc    : 0xc00000000062b1e0
>=20
> Instance 2: which is not for vfs_fstatat but for getname
>=20
> <5><4213270>: Abbrev Number: 39 (DW_TAG_inlined_subroutine)
>    <4213271>   DW_AT_abstract_origin: <0x4215b6b>
>    <4213275>   DW_AT_entry_pc    : 0xc00000000062b1e0
>=20
> But the copy_variables_cb() continues to add parameters from second
> instance also based on the dwarf_haspc() check. This results in
> formal parameters for getname also appended to params. But while
> filling in the args->value for these parameters, since these args
> are not part of dwarf with offset "42131fa". Hence value will be
> null. This incorrect args results in segfault when value field is
> accessed.
>=20
> Save the dwarf dieoffset of the actual DW_TAG_subprogram as part of
> "struct probe_finder". In copy_variables_cb(), include check to make
> sure the DW_AT_abstract_origin points to the correct entry if the
> dwarf_haspc() matches the instruction address.
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
> ---
> Changelog:
> v1 -> v2:
> Instead of saving the Dwarf_Die as part of "struct probe_finder",
> save the dwarf dieoffset. We only need offset while comparing to see
> if DW_AT_abstract_origin points to correct entry
> Suggested in review by Namhyung.

Hi James

Thanks for reviewing the initial version and sending a reviewed-by=20
=
https://lore.kernel.org/linux-perf-users/964f60e0-fe88-48c8-87c3-a6ea2f3ca=
c6c@linaro.org/

Since I added a change in V2 to directly use the die offset, I didn=E2=80=99=
t carry your reviewed-by in V2 to make sure you are ok with V2.
Can you please check and let me know if the V2 looks good to you ..

Thanks
Athira
>=20
> tools/perf/util/probe-finder.c | 21 ++++++++++++++++++---
> tools/perf/util/probe-finder.h |  1 +
> 2 files changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/perf/util/probe-finder.c =
b/tools/perf/util/probe-finder.c
> index 1e769b68da37..3cc7c40f5097 100644
> --- a/tools/perf/util/probe-finder.c
> +++ b/tools/perf/util/probe-finder.c
> @@ -973,6 +973,7 @@ static int probe_point_search_cb(Dwarf_Die =
*sp_die, void *data)
> pr_debug("Matched function: %s [%lx]\n", dwarf_diename(sp_die),
> (unsigned long)dwarf_dieoffset(sp_die));
> pf->fname =3D fname;
> + pf->abstrace_dieoffset =3D dwarf_dieoffset(sp_die);
> if (pp->line) { /* Function relative line */
> dwarf_decl_line(sp_die, &pf->lno);
> pf->lno +=3D pp->line;
> @@ -1179,6 +1180,8 @@ static int copy_variables_cb(Dwarf_Die *die_mem, =
void *data)
> struct local_vars_finder *vf =3D data;
> struct probe_finder *pf =3D vf->pf;
> int tag;
> + Dwarf_Attribute attr;
> + Dwarf_Die var_die;
>=20
> tag =3D dwarf_tag(die_mem);
> if (tag =3D=3D DW_TAG_formal_parameter ||
> @@ -1196,10 +1199,22 @@ static int copy_variables_cb(Dwarf_Die =
*die_mem, void *data)
> }
> }
>=20
> - if (dwarf_haspc(die_mem, vf->pf->addr))
> + if (dwarf_haspc(die_mem, vf->pf->addr)) {
> + /*
> + * when DW_AT_entry_pc contains instruction address,
> + * also check if the DW_AT_abstract_origin of die_mem
> + * points to correct die.
> + */
> + if (dwarf_attr(die_mem, DW_AT_abstract_origin, &attr)) {
> + dwarf_formref_die(&attr, &var_die);
> + if (pf->abstrace_dieoffset !=3D dwarf_dieoffset(&var_die))
> + goto out;
> + }
> return DIE_FIND_CB_CONTINUE;
> - else
> - return DIE_FIND_CB_SIBLING;
> + }
> +
> +out:
> + return DIE_FIND_CB_SIBLING;
> }
>=20
> static int expand_probe_args(Dwarf_Die *sc_die, struct probe_finder =
*pf,
> diff --git a/tools/perf/util/probe-finder.h =
b/tools/perf/util/probe-finder.h
> index dcf6cc1e1cbe..ecd6d937c592 100644
> --- a/tools/perf/util/probe-finder.h
> +++ b/tools/perf/util/probe-finder.h
> @@ -63,6 +63,7 @@ struct probe_finder {
> const char *fname; /* Real file name */
> Dwarf_Die cu_die; /* Current CU */
> Dwarf_Die sp_die;
> + Dwarf_Off abstrace_dieoffset;
> struct intlist *lcache; /* Line cache for lazy match */
>=20
> /* For variable searching */
> --=20
> 2.43.5
>=20
>=20


