Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 216FC559A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 23:06:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YJcH4SKczDqSC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 07:06:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YJB71FWLzDqVB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:47:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45YJB66SWnz8t9D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:47:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45YJB64tPfz9s4Y; Wed, 26 Jun 2019 06:47:10 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45YJB56HcDz9s3l
 for <linuxppc-dev@ozlabs.org>; Wed, 26 Jun 2019 06:47:09 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PKl7iL100531
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:47:07 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tbrv3wbv4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:47:07 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 25 Jun 2019 21:46:57 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 21:46:55 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PKkrQ045809688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 20:46:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94DF911C052;
 Tue, 25 Jun 2019 20:46:53 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E31C11C050;
 Tue, 25 Jun 2019 20:46:51 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.234])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 20:46:51 +0000 (GMT)
Subject: [PATCH v3 08/16] powerpc/fadump: consider reserved ranges while
 releasing memory
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 26 Jun 2019 02:16:50 +0530
In-Reply-To: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062520-0008-0000-0000-000002F6FAF9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062520-0009-0000-0000-000022642CF6
Message-Id: <156149561038.9094.3693213253808770796.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250158
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Stewart Smith <stewart@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 0962e8004e97 ("powerpc/prom: Scan reserved-ranges node for
memory reservations") enabled support to parse 'reserved-ranges' DT
node to reserve kernel memory falling in these ranges for firmware
purposes. Along with the preserved area memory, also ensure memory
in reserved ranges is not overlapped with memory released by capture
kernel aftering saving vmcore. Also, fix the off-by-one error in
fadump_release_reserved_area function while releasing memory.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c |   59 +++++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 1b3df8b..ce8c0bf 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -111,7 +111,7 @@ static int __init fadump_cma_init(void) { return 1; }
  * Sort the reserved ranges in-place and merge adjacent ranges
  * to minimize the reserved ranges count.
  */
-static void __init sort_and_merge_reserved_ranges(void)
+static void sort_and_merge_reserved_ranges(void)
 {
 	unsigned long long base, size;
 	struct fadump_memory_range tmp_range;
@@ -152,8 +152,7 @@ static void __init sort_and_merge_reserved_ranges(void)
 	reserved_ranges_cnt = idx + 1;
 }
 
-static int __init add_reserved_range(unsigned long base,
-				     unsigned long size)
+static int add_reserved_range(unsigned long base, unsigned long size)
 {
 	int i;
 
@@ -1127,33 +1126,57 @@ static void fadump_release_reserved_area(unsigned long start, unsigned long end)
 			if (tend == end_pfn)
 				break;
 
-			start_pfn = tend + 1;
+			start_pfn = tend;
 		}
 	}
 }
 
 /*
- * Release the memory that was reserved in early boot to preserve the memory
- * contents. The released memory will be available for general use.
+ * Release the memory that was reserved during early boot to preserve the
+ * crash'ed kernel's memory contents except reserved dump area (permanent
+ * reservation) and reserved ranges used by F/W. The released memory will
+ * be available for general use.
  */
 static void fadump_release_memory(unsigned long begin, unsigned long end)
 {
+	int i;
 	unsigned long ra_start, ra_end;
-
-	ra_start = fw_dump.reserve_dump_area_start;
-	ra_end = ra_start + fw_dump.reserve_dump_area_size;
+	unsigned long tstart;
 
 	/*
-	 * exclude the dump reserve area. Will reuse it for next
-	 * fadump registration.
+	 * Add memory to permanently preserve to reserved ranges list
+	 * and exclude all these ranges while releasing memory.
 	 */
-	if (begin < ra_end && end > ra_start) {
-		if (begin < ra_start)
-			fadump_release_reserved_area(begin, ra_start);
-		if (end > ra_end)
-			fadump_release_reserved_area(ra_end, end);
-	} else
-		fadump_release_reserved_area(begin, end);
+	i = add_reserved_range(fw_dump.reserve_dump_area_start,
+			       fw_dump.reserve_dump_area_size);
+	if (i == 0) {
+		/*
+		 * Reached the MAX reserved ranges count. To ensure reserved
+		 * dump area is excluded (as it will be reused for next
+		 * FADump registration), ignore the last reserved range and
+		 * add reserved dump area instead.
+		 */
+		reserved_ranges_cnt--;
+		add_reserved_range(fw_dump.reserve_dump_area_start,
+				   fw_dump.reserve_dump_area_size);
+	}
+	sort_and_merge_reserved_ranges();
+
+	tstart = begin;
+	for (i = 0; i < reserved_ranges_cnt; i++) {
+		ra_start = reserved_ranges[i].base;
+		ra_end = ra_start + reserved_ranges[i].size;
+
+		if (tstart >= ra_end)
+			continue;
+
+		if (tstart < ra_start)
+			fadump_release_reserved_area(tstart, ra_start);
+		tstart = ra_end;
+	}
+
+	if (tstart < end)
+		fadump_release_reserved_area(tstart, end);
 }
 
 static void fadump_invalidate_release_mem(void)

