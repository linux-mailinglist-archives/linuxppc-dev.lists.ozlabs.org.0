Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3D2B00F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:07:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6Hc0ZLgzF3cY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:07:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4hx3gSkzF1SK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:56:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4hw2vn7z8sjs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:56:00 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4hw0Pbxz9sP7; Thu, 12 Sep 2019 00:56:00 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4hv3Pvsz9sNx
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:55:59 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgd7v103075
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:55:57 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy1y030q4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:55:57 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:55:55 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:55:54 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEtqMY9568324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:55:52 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45479AE045;
 Wed, 11 Sep 2019 14:55:52 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 520E3AE04D;
 Wed, 11 Sep 2019 14:55:50 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:55:50 +0000 (GMT)
Subject: [PATCH v6 28/36] powerpc/fadump: improve how crashed kernel's
 memory is reserved
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:25:49 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0008-0000-0000-000003146C2C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0009-0000-0000-00004A32D861
Message-Id: <156821374440.5656.2945512543806951766.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=885 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
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
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The size parameter to fadump_reserve_crash_area() function is not needed
as all the memory above boot memory size must be preserved anyway. Update
the function by dropping this redundant parameter.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* No major changes in v6.


 arch/powerpc/kernel/fadump.c |   53 +++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 502e49a..6f52a60 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -34,6 +34,8 @@
 
 static struct fw_dump fw_dump;
 
+static void __init fadump_reserve_crash_area(u64 base);
+
 static DEFINE_MUTEX(fadump_mutex);
 struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0 };
 struct fadump_mrange_info reserved_mrange_info = { "reserved", NULL, 0, 0, 0 };
@@ -318,26 +320,6 @@ static unsigned long get_fadump_area_size(void)
 	return size;
 }
 
-static void __init fadump_reserve_crash_area(unsigned long base,
-					     unsigned long size)
-{
-	struct memblock_region *reg;
-	unsigned long mstart, mend, msize;
-
-	for_each_memblock(memory, reg) {
-		mstart = max_t(unsigned long, base, reg->base);
-		mend = reg->base + reg->size;
-		mend = min(base + size, mend);
-
-		if (mstart < mend) {
-			msize = mend - mstart;
-			memblock_reserve(mstart, msize);
-			pr_info("Reserved %ldMB of memory at %#016lx for saving crash dump\n",
-				(msize >> 20), mstart);
-		}
-	}
-}
-
 int __init fadump_reserve_mem(void)
 {
 	bool is_memblock_bottom_up = memblock_bottom_up();
@@ -406,12 +388,11 @@ int __init fadump_reserve_mem(void)
 #endif
 		/*
 		 * If last boot has crashed then reserve all the memory
-		 * above boot_memory_size so that we don't touch it until
+		 * above boot memory size so that we don't touch it until
 		 * dump is written to disk by userspace tool. This memory
-		 * will be released for general use once the dump is saved.
+		 * can be released for general use by invalidating fadump.
 		 */
-		size = mem_boundary - base;
-		fadump_reserve_crash_area(base, size);
+		fadump_reserve_crash_area(base);
 
 		pr_debug("fadumphdr_addr = %#016lx\n", fw_dump.fadumphdr_addr);
 		pr_debug("Reserve dump area start address: 0x%lx\n",
@@ -1377,3 +1358,27 @@ int __init setup_fadump(void)
 	return 1;
 }
 subsys_initcall(setup_fadump);
+
+/* Preserve everything above the base address */
+static void __init fadump_reserve_crash_area(u64 base)
+{
+	struct memblock_region *reg;
+	u64 mstart, msize;
+
+	for_each_memblock(memory, reg) {
+		mstart = reg->base;
+		msize  = reg->size;
+
+		if ((mstart + msize) < base)
+			continue;
+
+		if (mstart < base) {
+			msize -= (base - mstart);
+			mstart = base;
+		}
+
+		pr_info("Reserving %lluMB of memory at %#016llx for preserving crash data",
+			(msize >> 20), mstart);
+		memblock_reserve(mstart, msize);
+	}
+}

