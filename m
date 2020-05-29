Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 002321E7580
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 07:43:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YD4z2SHMzDqZD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 15:43:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YCmJ0ZCZzDqbW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 15:29:03 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04T52YTJ131678; Fri, 29 May 2020 01:28:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31as1bmnnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 01:28:59 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04T52edK132101;
 Fri, 29 May 2020 01:28:58 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31as1bmnn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 01:28:58 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04T5P8V6030057;
 Fri, 29 May 2020 05:28:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 316ufb6ruv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 05:28:57 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04T5SusE25756152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 May 2020 05:28:56 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 512E6BE04F;
 Fri, 29 May 2020 05:28:56 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D50E3BE051;
 Fri, 29 May 2020 05:28:53 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.84.128])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 29 May 2020 05:28:53 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org
Subject: [PATCH v4 7/8] powerpc/book3s/pmem: Add WARN_ONCE to catch the wrong
 usage of pmem flush functions.
Date: Fri, 29 May 2020 10:58:19 +0530
Message-Id: <20200529052820.151651-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529052820.151651-1-aneesh.kumar@linux.ibm.com>
References: <20200529052820.151651-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_01:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 cotscore=-2147483648 lowpriorityscore=0 clxscore=1015 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290038
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, dan.j.williams@intel.com,
 oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We only support persistent memory on P8 and above. This is enforced by the
firmware and further checked on virtualzied platform during platform init.
Add WARN_ONCE in pmem flush routines to catch the wrong usage of these.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/cacheflush.h | 2 ++
 arch/powerpc/lib/pmem.c               | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index bc3ea009cf14..865fae8a226e 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -125,6 +125,8 @@ static inline void  arch_pmem_flush_barrier(void)
 {
 	if (cpu_has_feature(CPU_FTR_ARCH_207S))
 		asm volatile(PPC_PHWSYNC ::: "memory");
+	else
+		WARN_ONCE(1, "Using pmem flush on older hardware.");
 }
 #endif /* __KERNEL__ */
 
diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
index 21210fa676e5..f40bd908d28d 100644
--- a/arch/powerpc/lib/pmem.c
+++ b/arch/powerpc/lib/pmem.c
@@ -37,12 +37,14 @@ static inline void clean_pmem_range(unsigned long start, unsigned long stop)
 {
 	if (cpu_has_feature(CPU_FTR_ARCH_207S))
 		return __clean_pmem_range(start, stop);
+	WARN_ONCE(1, "Using pmem flush on older hardware.");
 }
 
 static inline void flush_pmem_range(unsigned long start, unsigned long stop)
 {
 	if (cpu_has_feature(CPU_FTR_ARCH_207S))
 		return __flush_pmem_range(start, stop);
+	WARN_ONCE(1, "Using pmem flush on older hardware.");
 }
 
 /*
-- 
2.26.2

