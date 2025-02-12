Return-Path: <linuxppc-dev+bounces-6122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC87DA326DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 14:20:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtJpJ1D26z30Lt;
	Thu, 13 Feb 2025 00:20:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739366424;
	cv=none; b=Fu3cdAFTGLBL7a60lkqsKw1VMtNzWP/KQ34sE02UeDgeOt6720WagEDh4Wb4nGE+MCZR+xPcqU7aMFFRAU7MiFxQBR/lqcF7U5ss3dDfmt3LXdUpY42WdSLleobybDse6Cv54srBbtz9+pyQhZGSh2X73WhaykA1dOdbaRV7u2zjzlLKxANGjw5qJQbj8IMXNRk4NZyVbO6Zjjd1vPQjM+VjosHqbZORnBdCs3Ngn8GJ7FjgXrxrcaQk4YmrosyYONdSh+2H97HPisBBCgLmLklU0cnLp8IkA4wXZwjbBV/alHFpkTXa1REEqg+15fWWGYvDm0NPhXDYldRsA6ijqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739366424; c=relaxed/relaxed;
	bh=nbAWx8pHcbvAC2Iov+3r/7BwyVoIF0qkZ/L/FMY3MFo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FHRp6ODatxerigLHDz9xmd0ev7EaFUZ/+3kD92mgByIV9IbPBA7qbjZtqzBnuFalc/CmyJCAwE4AS7j8R4dx9ibBoEzsSK+y4uhl1PIpTIk7mYXDQuV1q33I63H5XyBypGTEH33cUJmRfKKCLrNobrxRrnPMiT+0Hc6kO++E6OcKin0g3dCWhvzq9zLEiky/vf+8x5LaoKnJGZv8kDQYMaNVckyBRKlv4WuVZzAhNxDKl4ba6pSIScbqtwvkCU4NRulHmcggzX8WtO8FLtyLbtSjj2w2wGABaxzLZM94SYWHVfEoCVj5MoTtkr3QNDlSVaWVelLao+UOVXyB+ve3NQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EAT8b6zy; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EAT8b6zy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtJpG6r7Gz2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 00:20:22 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C5O5mZ002848;
	Wed, 12 Feb 2025 13:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=nbAWx8pHcbvAC2Iov+3r/7BwyVoIF0qkZ/L/FMY3M
	Fo=; b=EAT8b6zyfMqqVzFByaS27ZnH0Q8rasWPDBXSscZvJxcvRitUi5OIVelf7
	69twiewJWcF73bk1G7+uA0lvvv+FxpFTTLnztrPuioSFv2yzZ+uGwK47yr3kTlL5
	tj8Xqz/Fp/qLBfs4NCRnxiYTHJuRVBO+2Yv5Oxmp/vF2Q0kKRAtJpPAjlW+EQLfu
	GtxVTrtWrM0So0WoggWvVBQcw5BsOjfnQ4jETE86hVSijDaenULAGZGzour9Pvz5
	xdCY1t+A8uJAkNqEx9mXSlZB/8lXvjiYuoaQefCVeyGKuj05r6Q4tn2NPIewf2oi
	QgF4Li66ddFvHIzlXH6E87hOQylFQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44rnf8a83r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 13:20:16 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51CDKGZ8020232;
	Wed, 12 Feb 2025 13:20:16 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44rnf8a830-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 13:20:16 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51CDJIjk001363;
	Wed, 12 Feb 2025 13:20:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pjkn8sp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 13:20:15 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51CDKBXp45744492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Feb 2025 13:20:11 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FF1120043;
	Wed, 12 Feb 2025 13:20:11 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 661022004E;
	Wed, 12 Feb 2025 13:20:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.147])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Feb 2025 13:20:04 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com
Subject: [PATCH] tools/perf: Pick the correct dwarf die while adding probe point for a function
Date: Wed, 12 Feb 2025 18:49:49 +0530
Message-Id: <20250212131949.68706-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _dI9D5PWgel5RddFmlqmlM7J0fVqbajF
X-Proofpoint-GUID: eXtSnEdc3-1pRlacr0PHySAuZKlAZuzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120101
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Perf probe on vfs_fstatat fails as below on a powerpc system

./perf probe -nf --max-probes=512 -a 'vfs_fstatat $params'
Segmentation fault (core dumped)

This is observed while running perftool-testsuite_probe testcase.

While running with verbose, its observed that segfault happens
at:

   synthesize_probe_trace_arg ()
   synthesize_probe_trace_command ()
   probe_file.add_event ()
   apply_perf_probe_events ()
   __cmd_probe ()
   cmd_probe ()
   run_builtin ()
   handle_internal_command ()
   main ()

Code in synthesize_probe_trace_arg() access a null value and results in
segfault. Data structure which is null:
struct probe_trace_arg arg->value

We are hitting a case where arg->value is null in probe point:
"vfs_fstatat $params". This is happening since 'commit e896474fe485
("getname_maybe_null() - the third variant of pathname copy-in")'
Before the commit, probe point for vfs_fstatat was getting added only
for one location:

Writing event: p:probe/vfs_fstatat _text+6345404 dfd=%gpr3:s32 filename=%gpr4:x64 stat=%gpr5:x64 flags=%gpr6:s32

With this change, vfs_fstatat code is inlined for other locations in the
code:
Probe point found: __do_sys_lstat64+48
Probe point found: __do_sys_stat64+48
Probe point found: __do_sys_newlstat+48
Probe point found: __do_sys_newstat+48
Probe point found: vfs_fstatat+0

When trying to find matching dwarf information entry (DIE)
from the debuginfo, the code incorrectly picks DIE which is
not referring to vfs_fstatat. Snippet from dwarf entry in vmlinux
debuginfo file.

The main abstract die is:
 <1><4214883>: Abbrev Number: 147 (DW_TAG_subprogram)
    <4214885>   DW_AT_external    : 1
    <4214885>   DW_AT_name        : (indirect string, offset: 0x17b9f3): vfs_fstatat

With formal parameters:
 <2><4214896>: Abbrev Number: 51 (DW_TAG_formal_parameter)
    <4214897>   DW_AT_name        : dfd
 <2><42148a3>: Abbrev Number: 23 (DW_TAG_formal_parameter)
    <42148a4>   DW_AT_name        : (indirect string, offset: 0x8fda9): filename
 <2><42148b0>: Abbrev Number: 23 (DW_TAG_formal_parameter)
    <42148b1>   DW_AT_name        : (indirect string, offset: 0x16bd9c): stat
 <2><42148bd>: Abbrev Number: 23 (DW_TAG_formal_parameter)
    <42148be>   DW_AT_name        : (indirect string, offset: 0x39832b): flags

While collecting variables/parameters for a probe point, the function
copy_variables_cb() also looks at dwarf debug entries based on the
instruction address. Snippet

        if (dwarf_haspc(die_mem, vf->pf->addr))
                return DIE_FIND_CB_CONTINUE;
        else
                return DIE_FIND_CB_SIBLING;

But incase of inlined function instance for vfs_fstatat, there are two
entries which has the instruction address entry point as same.

Instance 1: which is for vfs_fstatat and DW_AT_abstract_origin points to
0x4214883 (reference above for main abstract die)

<3><42131fa>: Abbrev Number: 59 (DW_TAG_inlined_subroutine)
    <42131fb>   DW_AT_abstract_origin: <0x4214883>
    <42131ff>   DW_AT_entry_pc    : 0xc00000000062b1e0

Instance 2: which is not for vfs_fstatat but for getname

 <5><4213270>: Abbrev Number: 39 (DW_TAG_inlined_subroutine)
    <4213271>   DW_AT_abstract_origin: <0x4215b6b>
    <4213275>   DW_AT_entry_pc    : 0xc00000000062b1e0

But the copy_variables_cb() continues to add parameters from second
instance also based on the dwarf_haspc() check. This results in
formal parameters for getname also appended to params. But while
filling in the args->value for these parameters, since these args
are not part of dwarf with offset "42131fa". Hence value will be
null. This incorrect args results in segfault when value field is
accessed.

Save the Dwarf_Die which is the actual DW_TAG_subprogram as part of
"struct probe_finder". In copy_variables_cb(), include check to make
sure the DW_AT_abstract_origin points to the correct entry if the
dwarf_haspc() matches the instruction address.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/probe-finder.c | 21 ++++++++++++++++++---
 tools/perf/util/probe-finder.h |  1 +
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
index 1e769b68da37..361086a7adae 100644
--- a/tools/perf/util/probe-finder.c
+++ b/tools/perf/util/probe-finder.c
@@ -973,6 +973,7 @@ static int probe_point_search_cb(Dwarf_Die *sp_die, void *data)
 	pr_debug("Matched function: %s [%lx]\n", dwarf_diename(sp_die),
 		 (unsigned long)dwarf_dieoffset(sp_die));
 	pf->fname = fname;
+	memcpy(&pf->abstract_die, sp_die, sizeof(Dwarf_Die));
 	if (pp->line) { /* Function relative line */
 		dwarf_decl_line(sp_die, &pf->lno);
 		pf->lno += pp->line;
@@ -1179,6 +1180,8 @@ static int copy_variables_cb(Dwarf_Die *die_mem, void *data)
 	struct local_vars_finder *vf = data;
 	struct probe_finder *pf = vf->pf;
 	int tag;
+	Dwarf_Attribute attr;
+	Dwarf_Die var_die;
 
 	tag = dwarf_tag(die_mem);
 	if (tag == DW_TAG_formal_parameter ||
@@ -1196,10 +1199,22 @@ static int copy_variables_cb(Dwarf_Die *die_mem, void *data)
 		}
 	}
 
-	if (dwarf_haspc(die_mem, vf->pf->addr))
+	if (dwarf_haspc(die_mem, vf->pf->addr)) {
+		/*
+		 * when DW_AT_entry_pc contains instruction address,
+		 * also check if the DW_AT_abstract_origin of die_mem
+		 * points to correct die.
+		 */
+		if (dwarf_attr(die_mem, DW_AT_abstract_origin, &attr)) {
+			dwarf_formref_die(&attr, &var_die);
+			if (dwarf_dieoffset(&pf->abstract_die) != dwarf_dieoffset(&var_die))
+				goto out;
+		}
 		return DIE_FIND_CB_CONTINUE;
-	else
-		return DIE_FIND_CB_SIBLING;
+	}
+
+out:
+	return DIE_FIND_CB_SIBLING;
 }
 
 static int expand_probe_args(Dwarf_Die *sc_die, struct probe_finder *pf,
diff --git a/tools/perf/util/probe-finder.h b/tools/perf/util/probe-finder.h
index dcf6cc1e1cbe..b3039635c94e 100644
--- a/tools/perf/util/probe-finder.h
+++ b/tools/perf/util/probe-finder.h
@@ -63,6 +63,7 @@ struct probe_finder {
 	const char		*fname;		/* Real file name */
 	Dwarf_Die		cu_die;		/* Current CU */
 	Dwarf_Die		sp_die;
+	Dwarf_Die		abstract_die;
 	struct intlist		*lcache;	/* Line cache for lazy match */
 
 	/* For variable searching */
-- 
2.43.5


