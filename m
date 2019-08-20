Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 148BF95FC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 15:17:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CWY657jCzDqDK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 23:17:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CV0R1lBjzDqyP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:07:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46CV0Q4dStz8tFS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:07:18 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46CV0Q2Z3Hz9s3Z; Tue, 20 Aug 2019 22:07:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46CV0P4fRbz9sBF
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 22:07:17 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KC1cpL113453
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:07:15 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ugevrvg7e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:07:14 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 20 Aug 2019 13:07:12 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 13:07:09 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7KC77kh57540796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:07:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B676952050;
 Tue, 20 Aug 2019 12:07:07 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1484B52057;
 Tue, 20 Aug 2019 12:07:05 +0000 (GMT)
Subject: [PATCH v5 24/31] powerpc/fadump: improve how crashed kernel's
 memory is reserved
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 20 Aug 2019 17:37:05 +0530
In-Reply-To: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082012-4275-0000-0000-0000035B1362
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082012-4276-0000-0000-0000386D334D
Message-Id: <156630282529.8896.1590882092846939802.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=875 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200128
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
 arch/powerpc/kernel/fadump.c |   53 +++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 3981599..665104a 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -35,6 +35,8 @@
 
 static struct fw_dump fw_dump;
 
+static void __init fadump_reserve_crash_area(unsigned long base);
+
 static DEFINE_MUTEX(fadump_mutex);
 struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0 };
 struct fadump_mrange_info reserved_mrange_info = { "reserved", NULL, 0, 0, 0 };
@@ -262,26 +264,6 @@ static unsigned long get_fadump_area_size(void)
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
 	int ret = 1;
@@ -347,12 +329,11 @@ int __init fadump_reserve_mem(void)
 #endif
 		/*
 		 * If last boot has crashed then reserve all the memory
-		 * above boot_memory_size so that we don't touch it until
+		 * above boot memory size so that we don't touch it until
 		 * dump is written to disk by userspace tool. This memory
-		 * will be released for general use once the dump is saved.
+		 * can be released for general use by invalidating fadump.
 		 */
-		size = memory_boundary - base;
-		fadump_reserve_crash_area(base, size);
+		fadump_reserve_crash_area(base);
 
 		pr_debug("fadumphdr_addr = %#016lx\n", fw_dump.fadumphdr_addr);
 		pr_debug("Reserve dump area start address: 0x%lx\n",
@@ -1240,3 +1221,27 @@ int __init setup_fadump(void)
 	return 1;
 }
 subsys_initcall(setup_fadump);
+
+/* Preserve everything above the base address */
+static void __init fadump_reserve_crash_area(unsigned long base)
+{
+	struct memblock_region *reg;
+	unsigned long mstart, msize;
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
+		pr_info("Reserving %luMB of memory at %#016lx for preserving crash data",
+			(msize >> 20), mstart);
+		memblock_reserve(mstart, msize);
+	}
+}

