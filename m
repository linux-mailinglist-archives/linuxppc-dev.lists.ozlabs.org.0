Return-Path: <linuxppc-dev+bounces-6462-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86100A43F6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 13:31:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2H5Q66vLz3048;
	Tue, 25 Feb 2025 23:31:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740486666;
	cv=none; b=Zzso0He5fzTVWMFRLhguakcbcI1X15wvQ2rjWvzuTwmClVH16AT/PCSpJuVWqXeRZF10GNk23QOpdjyrTVbCehytWc8VtSz9vAJ8s71jFIa4lZfkvBRBlg184IMGcmSKHIQ4kgnw/6hqopz+Y4JapDIL8ml2etUCFWwaKMcgHtMpmIVS1Lqackr4hufeDukrzOkCjp/JQTCt0F+IJlqQVobjtMlMnTHRZJTS3wkqf9ZHK7SaO4NfZ4jIs5g5Ck+4ZeyhEHA2OkrmJEVCdSnoz5f7xZEP4ZB9hADhbriqnUuoYFJ85AaEsPrvolSaAKa+bY6oOrlHCI5nGeG1t9jDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740486666; c=relaxed/relaxed;
	bh=28sBM1E6Hrq0LbtJC/H5U3/MzpnCPvzi37XhDsEp+vE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XiVrhJRttrdabUbckH0KaCvwb/OHN1YDhpAQu7xbnsyfLSdoN9+ZriLFP20JwYVqCNPcR/8YC+Y9n7lbKFGUo+2fTuN44qwi31swrNS0DNNMA7cLovaDhxlKdwM4Z2+Z9ghK8PuSfxj1QZo+yqOxke6Ve8dfN33Job5Py45EaclVX/uG5YbOJWr3Z34v9S++c0fKqXjbgCCalH8gfEGZJvV8UTD7Jgl4pNUW9kmC1Vagha2xUfjEbLzNQHyLhJAf/FhBcF2bKNW34Wi4g0u1Q3JJ7Gr3ZwvCm7UFL7MwS511O/mLIkRvuKWosbmbrVkxmiX7zdLhTnaOf/wC9SROHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=imsOyH7q; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=imsOyH7q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2H5N3HKrz2yD8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 23:31:04 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PBYAUQ011036;
	Tue, 25 Feb 2025 12:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=28sBM1E6Hrq0LbtJC/H5U3/MzpnCPvzi37XhDsEp+
	vE=; b=imsOyH7q6BszRmd77M/JoHI0FaIp7KQWhJGJEXzK+6FpyjvqVRMrvxscX
	768E2EArDaDv/nPoe4vAARFxjpcWXlrOj39z/fzr2fEY1jgs3zDWJ7BgawQ9DTkY
	UfD5OIt+1mH2PYZqDn/bwGHMcE9tIcFr/dLTEXa7X0dTlC4WtnNatFWdilro56gI
	GoHH4Jkbgke0z0dtMDhYuXji5BWiNWm+YG6fFrFYCilhgRxe9Zd24Ta8n9J59bWK
	b9QZkotMse0cZ7zDSmjzc4TvzW31ZeOpEd11/jhb0UUhj7O+/e4em6mUo0GZCLCr
	cjJ98U41jUSJjdiSw3UwKdoBvqOsw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4513x9tsm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:30:59 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51PCUwS7026091;
	Tue, 25 Feb 2025 12:30:58 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4513x9tsm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:30:58 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51PAAqBk026285;
	Tue, 25 Feb 2025 12:30:57 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44yswncuku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:30:57 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51PCUr3m33423942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 12:30:53 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39D212004D;
	Tue, 25 Feb 2025 12:30:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A5C82004B;
	Tue, 25 Feb 2025 12:30:46 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.248.206])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Feb 2025 12:30:46 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, Tejas.Manhas1@ibm.com, mhiramat@kernel.org
Subject: [PATCH V2] tools/perf: Pick the correct dwarf die while adding probe point for a function
Date: Tue, 25 Feb 2025 18:00:42 +0530
Message-Id: <20250225123042.37263-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: BIHUa8tF_oJGP7eHUyPW-eTGE6Xq3ryi
X-Proofpoint-GUID: B3pnhfLmSvqdLJMCzbjMRhBvCsAOUQAj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502250088
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
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

Save the dwarf dieoffset of the actual DW_TAG_subprogram as part of
"struct probe_finder". In copy_variables_cb(), include check to make
sure the DW_AT_abstract_origin points to the correct entry if the
dwarf_haspc() matches the instruction address.

Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
---
Changelog:
v1 -> v2:
 Instead of saving the Dwarf_Die as part of "struct probe_finder",
 save the dwarf dieoffset. We only need offset while comparing to see
 if DW_AT_abstract_origin points to correct entry
 Suggested in review by Namhyung.

 tools/perf/util/probe-finder.c | 21 ++++++++++++++++++---
 tools/perf/util/probe-finder.h |  1 +
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
index 1e769b68da37..3cc7c40f5097 100644
--- a/tools/perf/util/probe-finder.c
+++ b/tools/perf/util/probe-finder.c
@@ -973,6 +973,7 @@ static int probe_point_search_cb(Dwarf_Die *sp_die, void *data)
 	pr_debug("Matched function: %s [%lx]\n", dwarf_diename(sp_die),
 		 (unsigned long)dwarf_dieoffset(sp_die));
 	pf->fname = fname;
+	pf->abstrace_dieoffset = dwarf_dieoffset(sp_die);
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
+			if (pf->abstrace_dieoffset != dwarf_dieoffset(&var_die))
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
index dcf6cc1e1cbe..ecd6d937c592 100644
--- a/tools/perf/util/probe-finder.h
+++ b/tools/perf/util/probe-finder.h
@@ -63,6 +63,7 @@ struct probe_finder {
 	const char		*fname;		/* Real file name */
 	Dwarf_Die		cu_die;		/* Current CU */
 	Dwarf_Die		sp_die;
+	Dwarf_Off		abstrace_dieoffset;
 	struct intlist		*lcache;	/* Line cache for lazy match */
 
 	/* For variable searching */
-- 
2.43.5


