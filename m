Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90474B0197
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:25:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6h15tD5zDqM5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:25:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4kr0kH8zF3FJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:57:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4kq5CGvz8sjs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:57:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4kq325Hz9sNT; Thu, 12 Sep 2019 00:57:39 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4kp2wtbz9sNF
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:57:38 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgtKe044485
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:57:36 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uy20gu4ng-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:57:35 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:57:33 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:57:30 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEvTRs50266294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:57:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FE71AE053;
 Wed, 11 Sep 2019 14:57:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C88EAE04D;
 Wed, 11 Sep 2019 14:57:27 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:57:27 +0000 (GMT)
Subject: [PATCH v6 35/36] powerpc/fadump: remove RMA_START and RMA_END macros
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:27:26 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0008-0000-0000-000003146C40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0009-0000-0000-00004A32D876
Message-Id: <156821384096.5656.15026984053970204652.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
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

RMA_START is defined as '0' and there is even a BUILD_BUG_ON() to
make sure it is never anything else. Remove this macro and use '0'
instead as code change is needed anyway when it has to be something
else. Also, remove unused RMA_END macro.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* New patch to remove unnecessary/unused RMA_START & RMA_END.


 arch/powerpc/include/asm/fadump-internal.h   |    8 -------
 arch/powerpc/kernel/fadump.c                 |   32 ++++++++++++++------------
 arch/powerpc/platforms/pseries/rtas-fadump.c |    2 +-
 3 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index a669aaa..aec1515 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -10,14 +10,6 @@
 #define _ASM_POWERPC_FADUMP_INTERNAL_H
 
 #ifndef CONFIG_PRESERVE_FA_DUMP
-/*
- * The RMA region will be saved for later dumping when kernel crashes.
- * RMA is Real Mode Area, the first block of logical memory address owned
- * by logical partition, containing the storage that may be accessed with
- * translate off.
- */
-#define RMA_START	0x0
-#define RMA_END		(ppc64_rma_size)
 
 /* The upper limit percentage for user specified boot memory size (25%) */
 #define MAX_BOOT_MEM_RATIO			4
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index bd49b1f..2e13925 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -128,18 +128,22 @@ int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
  * If fadump is registered, check if the memory provided
  * falls within boot memory area and reserved memory area.
  */
-int is_fadump_memory_area(u64 addr, ulong size)
+int is_fadump_memory_area(u64 addr, unsigned long size)
 {
-	u64 d_start = fw_dump.reserve_dump_area_start;
-	u64 d_end = d_start + fw_dump.reserve_dump_area_size;
+	u64 d_start, d_end;
 
 	if (!fw_dump.dump_registered)
 		return 0;
 
+	if (!size)
+		return 0;
+
+	d_start = fw_dump.reserve_dump_area_start;
+	d_end = d_start + fw_dump.reserve_dump_area_size;
 	if (((addr + size) > d_start) && (addr <= d_end))
 		return 1;
 
-	return (addr + size) > RMA_START && addr <= fw_dump.boot_memory_size;
+	return (addr <= fw_dump.boot_memory_size);
 }
 
 int should_fadump_crash(void)
@@ -771,14 +775,14 @@ static int fadump_setup_crash_memory_ranges(void)
 	crash_mrange_info.mem_range_cnt = 0;
 
 	/*
-	 * add the first memory chunk (RMA_START through boot_memory_size) as
+	 * add the first memory chunk (0 through boot_memory_size) as
 	 * a separate memory chunk. The reason is, at the time crash firmware
 	 * will move the content of this memory chunk to different location
 	 * specified during fadump registration. We need to create a separate
 	 * program header for this chunk with the correct offset.
 	 */
 	ret = fadump_add_mem_range(&crash_mrange_info,
-				   RMA_START, fw_dump.boot_memory_size);
+				   0, fw_dump.boot_memory_size);
 	if (ret)
 		return ret;
 
@@ -787,11 +791,9 @@ static int fadump_setup_crash_memory_ranges(void)
 		end = start + (u64)reg->size;
 
 		/*
-		 * skip the first memory chunk that is already added (RMA_START
-		 * through boot_memory_size). This logic needs a relook if and
-		 * when RMA_START changes to a non-zero value.
+		 * skip the first memory chunk that is already added
+		 * (0 through boot_memory_size).
 		 */
-		BUILD_BUG_ON(RMA_START != 0);
 		if (start < fw_dump.boot_memory_size) {
 			if (end > fw_dump.boot_memory_size)
 				start = fw_dump.boot_memory_size;
@@ -815,7 +817,7 @@ static int fadump_setup_crash_memory_ranges(void)
  */
 static inline unsigned long fadump_relocate(unsigned long paddr)
 {
-	if (paddr > RMA_START && paddr < fw_dump.boot_memory_size)
+	if ((paddr > 0) && (paddr < fw_dump.boot_memory_size))
 		return fw_dump.boot_mem_dest_addr + paddr;
 	else
 		return paddr;
@@ -883,11 +885,11 @@ static int fadump_create_elfcore_headers(char *bufp)
 		phdr->p_flags	= PF_R|PF_W|PF_X;
 		phdr->p_offset	= mbase;
 
-		if (mbase == RMA_START) {
+		if (mbase == 0) {
 			/*
-			 * The entire RMA region will be moved by firmware
-			 * to the specified destination_address. Hence set
-			 * the correct offset.
+			 * The entire real memory region will be moved by
+			 * firmware to the specified destination_address.
+			 * Hence set the correct offset.
 			 */
 			phdr->p_offset = fw_dump.boot_mem_dest_addr;
 		}
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 1d8f287..a525180 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -106,7 +106,7 @@ static u64 rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 	fdm.rmr_region.request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
 	fdm.rmr_region.source_data_type =
 		cpu_to_be16(RTAS_FADUMP_REAL_MODE_REGION);
-	fdm.rmr_region.source_address = cpu_to_be64(RMA_START);
+	fdm.rmr_region.source_address = cpu_to_be64(0);
 	fdm.rmr_region.source_len = cpu_to_be64(fadump_conf->boot_memory_size);
 	fdm.rmr_region.destination_address = cpu_to_be64(addr);
 	addr += fadump_conf->boot_memory_size;

