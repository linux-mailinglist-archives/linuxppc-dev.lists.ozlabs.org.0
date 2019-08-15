Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D15C8E37C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 06:17:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468Cq41xDwzDr1Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 14:17:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=au1.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alastair@au1.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Chs3zz5zDqsm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 14:12:29 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7F4CCjf058718
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 00:12:25 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ucxuqa8uw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 00:12:25 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Thu, 15 Aug 2019 05:12:23 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 15 Aug 2019 05:12:18 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7F4CHtu60489928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Aug 2019 04:12:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F652A4057;
 Thu, 15 Aug 2019 04:12:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1223A404D;
 Thu, 15 Aug 2019 04:12:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 15 Aug 2019 04:12:16 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A1550A03BE;
 Thu, 15 Aug 2019 14:12:15 +1000 (AEST)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH 2/6] powerpc: define helpers to get L1 icache sizes
Date: Thu, 15 Aug 2019 14:10:47 +1000
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815041057.13627-1-alastair@au1.ibm.com>
References: <20190815041057.13627-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19081504-0020-0000-0000-0000035FEBFB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081504-0021-0000-0000-000021B508F0
Message-Id: <20190815041057.13627-3-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-15_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=912 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908150045
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Qian Cai <cai@lca.pw>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alastair D'Silva <alastair@d-silva.org>

This patch adds helpers to retrieve icache sizes, and renames the existing
helpers to make it clear that they are for dcache.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/powerpc/include/asm/cache.h      | 29 +++++++++++++++++++++++----
 arch/powerpc/include/asm/cacheflush.h | 12 +++++------
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index b3388d95f451..f852d5cd746c 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -55,25 +55,46 @@ struct ppc64_caches {
 
 extern struct ppc64_caches ppc64_caches;
 
-static inline u32 l1_cache_shift(void)
+static inline u32 l1_dcache_shift(void)
 {
 	return ppc64_caches.l1d.log_block_size;
 }
 
-static inline u32 l1_cache_bytes(void)
+static inline u32 l1_dcache_bytes(void)
 {
 	return ppc64_caches.l1d.block_size;
 }
+
+static inline u32 l1_icache_shift(void)
+{
+	return ppc64_caches.l1i.log_block_size;
+}
+
+static inline u32 l1_icache_bytes(void)
+{
+	return ppc64_caches.l1i.block_size;
+}
 #else
-static inline u32 l1_cache_shift(void)
+static inline u32 l1_dcache_shift(void)
 {
 	return L1_CACHE_SHIFT;
 }
 
-static inline u32 l1_cache_bytes(void)
+static inline u32 l1_dcache_bytes(void)
 {
 	return L1_CACHE_BYTES;
 }
+
+static inline u32 l1_icache_shift(void)
+{
+	return L1_CACHE_SHIFT;
+}
+
+static inline u32 l1_icache_bytes(void)
+{
+	return L1_CACHE_BYTES;
+}
+
 #endif
 #endif /* ! __ASSEMBLY__ */
 
diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index eef388f2659f..ed57843ef452 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -63,8 +63,8 @@ static inline void __flush_dcache_icache_phys(unsigned long physaddr)
  */
 static inline void flush_dcache_range(unsigned long start, unsigned long stop)
 {
-	unsigned long shift = l1_cache_shift();
-	unsigned long bytes = l1_cache_bytes();
+	unsigned long shift = l1_dcache_shift();
+	unsigned long bytes = l1_dcache_bytes();
 	void *addr = (void *)(start & ~(bytes - 1));
 	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
 	unsigned long i;
@@ -89,8 +89,8 @@ static inline void flush_dcache_range(unsigned long start, unsigned long stop)
  */
 static inline void clean_dcache_range(unsigned long start, unsigned long stop)
 {
-	unsigned long shift = l1_cache_shift();
-	unsigned long bytes = l1_cache_bytes();
+	unsigned long shift = l1_dcache_shift();
+	unsigned long bytes = l1_dcache_bytes();
 	void *addr = (void *)(start & ~(bytes - 1));
 	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
 	unsigned long i;
@@ -108,8 +108,8 @@ static inline void clean_dcache_range(unsigned long start, unsigned long stop)
 static inline void invalidate_dcache_range(unsigned long start,
 					   unsigned long stop)
 {
-	unsigned long shift = l1_cache_shift();
-	unsigned long bytes = l1_cache_bytes();
+	unsigned long shift = l1_dcache_shift();
+	unsigned long bytes = l1_dcache_bytes();
 	void *addr = (void *)(start & ~(bytes - 1));
 	unsigned long size = stop - (unsigned long)addr + (bytes - 1);
 	unsigned long i;
-- 
2.21.0

