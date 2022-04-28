Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99454513AC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 19:22:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kq2Vp3Pnmz3cCL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 03:22:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D4dDj3V2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=D4dDj3V2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kq2Sh73xVz3bfc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 03:20:36 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23SGwclS031777;
 Thu, 28 Apr 2022 17:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=r61VNpkZiPtJmmyH10rEZ8ophRm/CKvATa6yM+ve5tQ=;
 b=D4dDj3V2ghg3WetQNl2FvUHwDHvf3e7m142KLpLYvNLLV5kCent7fPAO428CPoSamXER
 qy4Uw6NWPRPT817o9BKSfGjXTmA71Ykdoz/NSh951Rm8nXTCw1oZvcwcWI6ut4O7/qn5
 O5emFbZRlRSAYnWqh2ecAv7PTnGqggTw6bGnQoNH8rArYKWjzCQy1FfsE4tFDCOB0e44
 cv2hJCYFD4IEB5we66mlp0R1q9/NwAWpe10nwtAtjNtfQa8WieDDh09TqmSw4UhFNVdZ
 KfnkD8BbfZxqgPhC+GlTjfz8IAU3fBcWmRK3s1HDPjYtyHpKQ7I6YjSLRiuu0pITiNlh WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqtdmr89c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 17:20:20 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23SH0RPc003563;
 Thu, 28 Apr 2022 17:20:19 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqtdmr88k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 17:20:19 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23SHChfO023072;
 Thu, 28 Apr 2022 17:20:17 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3fm938yuny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 17:20:16 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23SHKEEH43778366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 17:20:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A410AA4057;
 Thu, 28 Apr 2022 17:20:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFA1AA404D;
 Thu, 28 Apr 2022 17:20:11 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.8.21])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Apr 2022 17:20:11 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 1/2] ftrace: Drop duplicate mcount locations
Date: Thu, 28 Apr 2022 22:49:51 +0530
Message-Id: <810660b7cd62e080607077f1f56b2e42a0327981.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eJ52oX4ze7GvO4pccJTCysV7LRbWSRcR
X-Proofpoint-ORIG-GUID: kSAj_oMnNSAD4RneNuRsDLvIBeVTgnvk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-28_02,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxlogscore=916 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204280103
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
Cc: Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the absence of section symbols [1], objtool (today) and recordmcount
(with a subsequent patch) generate __mcount_loc relocation records with
weak symbols as the base. This works fine as long as those weak symbols
are not overridden, but if they are, these can result in duplicate
entries in the final vmlinux mcount location table. This will cause
ftrace to fail when trying to patch the same location twice. Fix this by
dropping duplicate locations during ftrace init.

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 kernel/trace/ftrace.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 4f1d2f5e726341..038610f1803987 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6496,7 +6496,7 @@ static int ftrace_process_locs(struct module *mod,
 	struct dyn_ftrace *rec;
 	unsigned long count;
 	unsigned long *p;
-	unsigned long addr;
+	unsigned long addr, prev_addr = 0;
 	unsigned long flags = 0; /* Shut up gcc */
 	int ret = -ENOMEM;
 
@@ -6550,6 +6550,7 @@ static int ftrace_process_locs(struct module *mod,
 	while (p < end) {
 		unsigned long end_offset;
 		addr = ftrace_call_adjust(*p++);
+
 		/*
 		 * Some architecture linkers will pad between
 		 * the different mcount_loc sections of different
@@ -6559,6 +6560,15 @@ static int ftrace_process_locs(struct module *mod,
 		if (!addr)
 			continue;
 
+		/*
+		 * Drop duplicate entries, which can happen when weak
+		 * functions are overridden, and __mcount_loc relocation
+		 * records were generated against function names due to
+		 * absence of non-weak section symbols.
+		 */
+		if (addr == prev_addr)
+			continue;
+
 		end_offset = (pg->index+1) * sizeof(pg->records[0]);
 		if (end_offset > PAGE_SIZE << pg->order) {
 			/* We should have allocated enough */
@@ -6569,6 +6579,7 @@ static int ftrace_process_locs(struct module *mod,
 
 		rec = &pg->records[pg->index++];
 		rec->ip = addr;
+		prev_addr = addr;
 	}
 
 	/* We should have used all pages */
-- 
2.35.1

