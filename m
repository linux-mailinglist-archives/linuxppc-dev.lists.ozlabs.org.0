Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEAE210522
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 09:36:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xY1v1YS7zDqpk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 17:36:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xXls2whhzDqkC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 17:24:09 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06172k5h135873; Wed, 1 Jul 2020 03:23:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32041en8kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 03:23:57 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06172kPm135896;
 Wed, 1 Jul 2020 03:23:51 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32041en8eq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 03:23:51 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0617FwPn003285;
 Wed, 1 Jul 2020 07:23:43 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 31wwr8x641-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Jul 2020 07:23:43 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0617NgKS49283450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Jul 2020 07:23:42 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8859F136061;
 Wed,  1 Jul 2020 07:23:42 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44E37136053;
 Wed,  1 Jul 2020 07:23:39 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.79.220.179])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Jul 2020 07:23:38 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org, dan.j.williams@intel.com
Subject: [PATCH v7 4/7] libnvdimm/nvdimm/flush: Allow architecture to override
 the flush barrier
Date: Wed,  1 Jul 2020 12:52:32 +0530
Message-Id: <20200701072235.223558-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701072235.223558-1-aneesh.kumar@linux.ibm.com>
References: <20200701072235.223558-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_03:2020-07-01,
 2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 cotscore=-2147483648 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007010050
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
Cc: Jan Kara <jack@suse.cz>, Jeff Moyer <jmoyer@redhat.com>, msuchanek@suse.de,
 oohall@gmail.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Architectures like ppc64 provide persistent memory specific barriers
that will ensure that all stores for which the modifications are
written to persistent storage by preceding dcbfps and dcbstps
instructions have updated persistent storage before any data
access or data transfer caused by subsequent instructions is initiated.
This is in addition to the ordering done by wmb()

Update nvdimm core such that architecture can use barriers other than
wmb to ensure all previous writes are architecturally visible for
the platform buffer flush.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 Documentation/memory-barriers.txt | 14 ++++++++++++++
 drivers/md/dm-writecache.c        |  2 +-
 drivers/nvdimm/region_devs.c      |  8 ++++----
 include/asm-generic/barrier.h     | 10 ++++++++++
 4 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
index eaabc3134294..ff07cd3b2f82 100644
--- a/Documentation/memory-barriers.txt
+++ b/Documentation/memory-barriers.txt
@@ -1935,6 +1935,20 @@ There are some more advanced barrier functions:
      relaxed I/O accessors and the Documentation/DMA-API.txt file for more
      information on consistent memory.
 
+ (*) pmem_wmb();
+
+     This is for use with persistent memory to ensure that stores for which
+     modifications are written to persistent storage reached a platform
+     durability domain.
+
+     For example, after a non-temporal write to pmem region, we use pmem_wmb()
+     to ensure that stores have reached a platform durability domain. This ensures
+     that stores have updated persistent storage before any data access or
+     data transfer caused by subsequent instructions is initiated. This is
+     in addition to the ordering done by wmb().
+
+     For load from persistent memory, existing read memory barriers are sufficient
+     to ensure read ordering.
 
 ===============================
 IMPLICIT KERNEL MEMORY BARRIERS
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 74f3c506f084..00534fa4a384 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -536,7 +536,7 @@ static void ssd_commit_superblock(struct dm_writecache *wc)
 static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
 {
 	if (WC_MODE_PMEM(wc))
-		wmb();
+		pmem_wmb();
 	else
 		ssd_commit_flushed(wc, wait_for_ios);
 }
diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
index 4502f9c4708d..c3237c2b03a6 100644
--- a/drivers/nvdimm/region_devs.c
+++ b/drivers/nvdimm/region_devs.c
@@ -1206,13 +1206,13 @@ int generic_nvdimm_flush(struct nd_region *nd_region)
 	idx = this_cpu_add_return(flush_idx, hash_32(current->pid + idx, 8));
 
 	/*
-	 * The first wmb() is needed to 'sfence' all previous writes
-	 * such that they are architecturally visible for the platform
-	 * buffer flush.  Note that we've already arranged for pmem
+	 * The pmem_wmb() is needed to 'sfence' all
+	 * previous writes such that they are architecturally visible for
+	 * the platform buffer flush. Note that we've already arranged for pmem
 	 * writes to avoid the cache via memcpy_flushcache().  The final
 	 * wmb() ensures ordering for the NVDIMM flush write.
 	 */
-	wmb();
+	pmem_wmb();
 	for (i = 0; i < nd_region->ndr_mappings; i++)
 		if (ndrd_get_flush_wpq(ndrd, i, 0))
 			writeq(1, ndrd_get_flush_wpq(ndrd, i, idx));
diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
index 2eacaf7d62f6..b589bb216ee5 100644
--- a/include/asm-generic/barrier.h
+++ b/include/asm-generic/barrier.h
@@ -257,5 +257,15 @@ do {									\
 })
 #endif
 
+/*
+ * pmem_wmb() ensures that all stores for which the modification
+ * are written to persistent storage by preceding instructions have
+ * updated persistent storage before any data  access or data transfer
+ * caused by subsequent instructions is initiated.
+ */
+#ifndef pmem_wmb
+#define pmem_wmb()	wmb()
+#endif
+
 #endif /* !__ASSEMBLY__ */
 #endif /* __ASM_GENERIC_BARRIER_H */
-- 
2.26.2

