Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9767F75FCCA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 18:59:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mEmhHGWw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8mbf3nM8z30N2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 02:59:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mEmhHGWw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8mZk5NmSz2yVM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 02:58:37 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36OGbnPM025792;
	Mon, 24 Jul 2023 16:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=SEeEt1/gcnQOQ2uaDKY1YS9JdPPgF+gNd/5X/HLnQ0o=;
 b=mEmhHGWwAB3qw/zBN0zYtmpiEp3XPf/zMFXUKToiphjlgdHGXTsQLaKibjWND3Rl+vyN
 ZL+OHmv0Az8bNOYquIp0po6Jdb7uNRPH503px3ytSg99b9bzEh3XcG2zx3vLx7QJwZyX
 k4k29cVrN+X+Bv6HNLA8YdZUa8ej05biZlkDsCBuBrdKS4BGJpimwqDQ8I6uZWqSYw/d
 qlUZGf7lDMy4j5aihg5rqL5Qc3kklMJ3uUAywBPFfAkToZ09b/nzPHK0rF5IFcrZkXBe
 YQvgpMSkHvy3d6eS0HcXxsZ9BWI0VOb3N5/fkx3nfzJnJodg7N/Dhjvf94QbaW9Cki5U Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1t2ep674-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 16:58:26 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36OGcNYL030357;
	Mon, 24 Jul 2023 16:58:26 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s1t2ep66m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 16:58:26 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36OFApb8014406;
	Mon, 24 Jul 2023 16:58:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0stxn4pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 16:58:24 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36OGwLk544040862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jul 2023 16:58:21 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 672B720043;
	Mon, 24 Jul 2023 16:58:21 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B242A20040;
	Mon, 24 Jul 2023 16:58:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.66.145])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jul 2023 16:58:18 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH] tools/perf: Fix addr location init during arch_skip_callchain_idx function
Date: Mon, 24 Jul 2023 22:28:15 +0530
Message-Id: <20230724165815.17810-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5DxQflGR6DcLF8xNGTTXg83EhE5bI9W1
X-Proofpoint-GUID: FbdRUrbGBbRjgiFbRGkmCa70pIuSjBG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_12,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307240148
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

perf record with callchain recording fails as below
in powerpc:

    ./perf record -a -gR sleep 10
    ./perf report
    perf: Segmentation fault

gdb trace points to thread__find_map

    0  0x00000000101df314 in atomic_cmpxchg (newval=1818846826, oldval=1818846827, v=0x1001a8f3) at /home/athira/linux/tools/include/asm-generic/atomic-gcc.h:70
    1  refcount_sub_and_test (i=1, r=0x1001a8f3) at /home/athira/linux/tools/include/linux/refcount.h:135
    2  refcount_dec_and_test (r=0x1001a8f3) at /home/athira/linux/tools/include/linux/refcount.h:148
    3  map__put (map=0x1001a8b3) at util/map.c:311
    4  0x000000001016842c in __map__zput (map=0x7fffffffa368) at util/map.h:190
    5  thread__find_map (thread=0x105b92f0, cpumode=<optimized out>, addr=13835058055283572736, al=al@entry=0x7fffffffa358) at util/event.c:582
    6  0x000000001016882c in thread__find_symbol (thread=<optimized out>, cpumode=<optimized out>, addr=<optimized out>, al=0x7fffffffa358) at util/event.c:656
    7  0x00000000102e12b4 in arch_skip_callchain_idx (thread=<optimized out>, chain=<optimized out>) at arch/powerpc/util/skip-callchain-idx.c:255
    8  0x00000000101d3bf4 in thread__resolve_callchain_sample (thread=0x105b92f0, cursor=0x1053d160, evsel=<optimized out>, sample=0x7fffffffa908, parent=0x7fffffffa778, root_al=0x7fffffffa710,
        max_stack=<optimized out>) at util/machine.c:2940
    9  0x00000000101cd210 in sample__resolve_callchain (sample=<optimized out>, cursor=<optimized out>, parent=<optimized out>, evsel=<optimized out>, al=<optimized out>, max_stack=<optimized out>)
        at util/callchain.c:1112
    10 0x000000001022a9d8 in hist_entry_iter__add (iter=0x7fffffffa750, al=0x7fffffffa710, max_stack_depth=<optimized out>, arg=0x7fffffffbbd0) at util/hist.c:1232
    11 0x0000000010056d98 in process_sample_event (tool=0x7fffffffbbd0, event=0x7ffff6223c38, sample=0x7fffffffa908, evsel=<optimized out>, machine=0x10524ef8) at builtin-report.c:332

Here arch_skip_callchain_idx calls thread__find_symbol and which
invokes thread__find_map with uninitialised "addr_location".
Snippet:

thread__find_symbol(thread, PERF_RECORD_MISC_USER, ip, &al);

Recent change with commit 0dd5041c9a0ea ("perf addr_location:
Add init/exit/copy functions"), introduced "maps__zput" in the
function thread__find_map. This could result in segfault while
accessing uninitialised map from "struct addr_location". Fix this
by adding addr_location__init and addr_location__exit in
arch_skip_callchain_idx.

Fixes: 0dd5041c9a0ea ("perf addr_location: Add init/exit/copy functions")
Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/arch/powerpc/util/skip-callchain-idx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/arch/powerpc/util/skip-callchain-idx.c b/tools/perf/arch/powerpc/util/skip-callchain-idx.c
index b7223feec770..5f3edb3004d8 100644
--- a/tools/perf/arch/powerpc/util/skip-callchain-idx.c
+++ b/tools/perf/arch/powerpc/util/skip-callchain-idx.c
@@ -250,6 +250,7 @@ int arch_skip_callchain_idx(struct thread *thread, struct ip_callchain *chain)
 	if (!chain || chain->nr < 3)
 		return skip_slot;
 
+	addr_location__init(&al);
 	ip = chain->ips[1];
 
 	thread__find_symbol(thread, PERF_RECORD_MISC_USER, ip, &al);
@@ -259,6 +260,7 @@ int arch_skip_callchain_idx(struct thread *thread, struct ip_callchain *chain)
 
 	if (!dso) {
 		pr_debug("%" PRIx64 " dso is NULL\n", ip);
+		addr_location__exit(&al);
 		return skip_slot;
 	}
 
@@ -279,5 +281,7 @@ int arch_skip_callchain_idx(struct thread *thread, struct ip_callchain *chain)
 		 */
 		skip_slot = 3;
 	}
+
+	addr_location__exit(&al);
 	return skip_slot;
 }
-- 
2.25.1

