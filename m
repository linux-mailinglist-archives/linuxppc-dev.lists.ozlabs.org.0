Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4681977192B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 06:53:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rQmtfINy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK3qj0Zfwz30YZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 14:53:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rQmtfINy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RK3ph74wwz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 14:52:44 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3774pSOO023131;
	Mon, 7 Aug 2023 04:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6h9oIQZ5wQGaAGzbKXiwKRd4JU/m5IdhoKvxub11GFo=;
 b=rQmtfINyfxNlz9puoARRj1Xck+MkE5fDL1ngTSg3mQF8kUwsSTYF568yJXz7VysWqgLH
 Oqw7aW7LvUAG6TzUn/Lfm83QSPloqohxvfl5qWdQtnmpkj6Fd3ONJ2CAiGsJR4onhqS3
 wXpaGN+HgRKtkPznAJmHcJ1VHa8vASWZ6Cg9QzQqnQ8UIFqITkYqdsmjv6acezbjO+BH
 7EIDogTIm2nPoKezDnuM9Q7COR5Cb5N7PQgwh66VyWCIvw6xggL2cHfEGA3L8SUEPNhr
 tQWikW3VRZo9MlfGdWbEY62SSXoYgkl7cMLtcnMoVVGTEGrVJ9goAjNHkZ2WankZIoW4 XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sasg9rf5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 04:52:33 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3774feSH022656;
	Mon, 7 Aug 2023 04:52:33 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sasg9rf5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 04:52:33 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3773JY45030348;
	Mon, 7 Aug 2023 04:52:32 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sa1rmt481-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 04:52:32 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3774qSJT4588150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Aug 2023 04:52:29 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAE9C20040;
	Mon,  7 Aug 2023 04:52:28 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BB5120049;
	Mon,  7 Aug 2023 04:52:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.77.230])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Aug 2023 04:52:26 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH] tools/perf: Fix bpf__probe to set bpf_prog_type type only if differs from the desired one
Date: Mon,  7 Aug 2023 10:22:23 +0530
Message-Id: <20230807045223.23452-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _6lVUVaakV_NuZWhDVWiKsrlwq-1z-Rl
X-Proofpoint-ORIG-GUID: KXDVG629-T-mNNLga-7oJg9VF_OdI4P0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_02,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308070041
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The test "BPF prologue generation" fails as below:

   Writing event: p:perf_bpf_probe/func _text+10423200 f_mode=+20(%gpr3):x32 offset=%gpr4:s64 orig=%gpr5:s32
   In map_prologue, ntevs=1
   mapping[0]=0
   libbpf: prog 'bpf_func__null_lseek': BPF program load failed: Permission denied
   libbpf: prog 'bpf_func__null_lseek': -- BEGIN PROG LOAD LOG --
   btf_vmlinux is malformed
   reg type unsupported for arg#0 function bpf_func__null_lseek#5
   0: R1=ctx(off=0,imm=0) R10=fp0
   ;
   0: (57) r3 &= 2
   R3 !read_ok
   processed 1 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
   -- END PROG LOAD LOG --
   libbpf: prog 'bpf_func__null_lseek': failed to load: -13
   libbpf: failed to load object '[bpf_prologue_test]'
   bpf: load objects failed: err=-13: (Permission denied)
   Failed to add events selected by BPF

This fails occurs after this commit:
commit d6e6286a12e7 ("libbpf: disassociate section handler
on explicit bpf_program__set_type() call")'

With this change, SEC_DEF handler libbpf which is determined
initially based on program's SEC() is set to NULL. The change
is made because sec_def is not valid when user sets the program
type with bpf_program__set_type function. This commit also fixed
bpf_prog_test_load() helper in selftests/bpf to force-set program
type only if it differs from the desired one.

The "bpf__probe" function in util/bpf-loader.c, also calls
bpf_program__set_type to set bpf_prog_type. Add similar fix in
here as well to avoid setting sec_def to NULL.

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/bpf-loader.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/bpf-loader.c b/tools/perf/util/bpf-loader.c
index 44cde27d6389..b8e0b430e302 100644
--- a/tools/perf/util/bpf-loader.c
+++ b/tools/perf/util/bpf-loader.c
@@ -870,12 +870,14 @@ int bpf__probe(struct bpf_object *obj)
 			goto out;
 		}
 
-		if (priv->is_tp) {
+		if (priv->is_tp && bpf_program__type(prog) != BPF_PROG_TYPE_TRACEPOINT) {
 			bpf_program__set_type(prog, BPF_PROG_TYPE_TRACEPOINT);
 			continue;
 		}
 
-		bpf_program__set_type(prog, BPF_PROG_TYPE_KPROBE);
+		if (bpf_program__type(prog) != BPF_PROG_TYPE_KPROBE)
+			bpf_program__set_type(prog, BPF_PROG_TYPE_KPROBE);
+
 		pev = &priv->pev;
 
 		err = convert_perf_probe_events(pev, 1);
-- 
2.39.3

