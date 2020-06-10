Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CF61F4E42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 08:33:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hccp17q8zDqDm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 16:33:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hcQg2w6szDqYh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 16:24:27 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05A63FMr029252; Wed, 10 Jun 2020 02:24:22 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31jks4t434-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 02:24:22 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05A6HiaG071941;
 Wed, 10 Jun 2020 02:24:22 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31jks4t42r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 02:24:21 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05A6LRL1021968;
 Wed, 10 Jun 2020 06:24:20 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 31gxfkf6nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 06:24:20 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05A6OKMG52822298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 06:24:20 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F915AC05F;
 Wed, 10 Jun 2020 06:24:20 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8455AC05E;
 Wed, 10 Jun 2020 06:24:16 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.58.158])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jun 2020 06:24:16 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org, dan.j.williams@intel.com
Subject: [PATCH v5 06/10] powerpc/pmem: Avoid the barrier in flush routines
Date: Wed, 10 Jun 2020 11:53:39 +0530
Message-Id: <20200610062343.492293-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610062343.492293-1-aneesh.kumar@linux.ibm.com>
References: <20200610062343.492293-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_02:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 cotscore=-2147483648
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100046
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

nvdimm expect the flush routines to just mark the cache clean. The barrier
that mark the store globally visible is done in nvdimm_flush().

Update the papr_scm driver to a simplified nvdim_flush callback that do
only the required barrier.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/lib/pmem.c                   |  6 ------
 arch/powerpc/platforms/pseries/papr_scm.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
index 5a61aaeb6930..21210fa676e5 100644
--- a/arch/powerpc/lib/pmem.c
+++ b/arch/powerpc/lib/pmem.c
@@ -19,9 +19,6 @@ static inline void __clean_pmem_range(unsigned long start, unsigned long stop)
 
 	for (i = 0; i < size >> shift; i++, addr += bytes)
 		asm volatile(PPC_DCBSTPS(%0, %1): :"i"(0), "r"(addr): "memory");
-
-
-	asm volatile(PPC_PHWSYNC ::: "memory");
 }
 
 static inline void __flush_pmem_range(unsigned long start, unsigned long stop)
@@ -34,9 +31,6 @@ static inline void __flush_pmem_range(unsigned long start, unsigned long stop)
 
 	for (i = 0; i < size >> shift; i++, addr += bytes)
 		asm volatile(PPC_DCBFPS(%0, %1): :"i"(0), "r"(addr): "memory");
-
-
-	asm volatile(PPC_PHWSYNC ::: "memory");
 }
 
 static inline void clean_pmem_range(unsigned long start, unsigned long stop)
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index f35592423380..ad506e7003c9 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -285,6 +285,18 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
 
 	return 0;
 }
+/*
+ * We have made sure the pmem writes are done such that before calling this
+ * all the caches are flushed/clean. We use dcbf/dcbfps to ensure this. Here
+ * we just need to add the necessary barrier to make sure the above flushes
+ * are have updated persistent storage before any data access or data transfer
+ * caused by subsequent instructions is initiated.
+ */
+static int papr_scm_flush_sync(struct nd_region *nd_region, struct bio *bio)
+{
+	arch_pmem_flush_barrier();
+	return 0;
+}
 
 static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 {
@@ -340,6 +352,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	ndr_desc.mapping = &mapping;
 	ndr_desc.num_mappings = 1;
 	ndr_desc.nd_set = &p->nd_set;
+	ndr_desc.flush = papr_scm_flush_sync;
 
 	if (p->is_volatile)
 		p->region = nvdimm_volatile_region_create(p->bus, &ndr_desc);
-- 
2.26.2

