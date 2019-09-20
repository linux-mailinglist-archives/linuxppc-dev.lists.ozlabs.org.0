Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 024B9B905C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 15:08:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZYv42BDZzF3DG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 23:08:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZYqV2tDQzF2R7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 23:05:41 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8KCstE4034546
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 09:05:36 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v4wjd4ttv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 09:05:35 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Fri, 20 Sep 2019 14:05:32 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Sep 2019 14:05:29 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8KD5RWN52625592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 13:05:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9332F11C054;
 Fri, 20 Sep 2019 13:05:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF3CD11C052;
 Fri, 20 Sep 2019 13:05:26 +0000 (GMT)
Received: from pomme.com (unknown [9.145.3.52])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Sep 2019 13:05:26 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] powerpc/mm: call H_BLOCK_REMOVE when supported
Date: Fri, 20 Sep 2019 15:05:23 +0200
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190920130523.20441-1-ldufour@linux.ibm.com>
References: <20190920130523.20441-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092013-0012-0000-0000-0000034E9127
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092013-0013-0000-0000-0000218916F4
Message-Id: <20190920130523.20441-3-ldufour@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200124
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Depending on the hardware and the hypervisor, the hcall H_BLOCK_REMOVE may
not be able to process all the page sizes for a segment base page size, as
reported by the TLB Invalidate Characteristics.

For each pair of base segment page size and actual page size, this
characteristic tells us the size of the block the hcall supports.

In the case, the hcall is not supporting a pair of base segment page size,
actual page size, it is returning H_PARAM which leads to a panic like this:

kernel BUG at /home/srikar/work/linux.git/arch/powerpc/platforms/pseries/lpar.c:466!
Oops: Exception in kernel mode, sig: 5 [#1]
BE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
Modules linked in:
CPU: 28 PID: 583 Comm: modprobe Not tainted 5.2.0-master #5
NIP: c0000000000be8dc LR: c0000000000be880 CTR: 0000000000000000
REGS: c0000007e77fb130 TRAP: 0700  Not tainted (5.2.0-master)
MSR: 8000000000029032 <SF,EE,ME,IR,DR,RI> CR: 42224824 XER: 20000000
CFAR: c0000000000be8fc IRQMASK: 0
GPR00: 0000000022224828 c0000007e77fb3c0 c000000001434d00 0000000000000005
GPR04: 9000000004fa8c00 0000000000000000 0000000000000003 0000000000000001
GPR08: c0000007e77fb450 0000000000000000 0000000000000001 ffffffffffffffff
GPR12: c0000007e77fb450 c00000000edfcb80 0000cd7d3ea30000 c0000000016022b0
GPR16: 00000000000000b0 0000cd7d3ea30000 0000000000000001 c080001f04f00105
GPR20: 0000000000000003 0000000000000004 c000000fbeb05f58 c000000001602200
GPR24: 0000000000000000 0000000000000004 8800000000000000 c000000000c5d148
GPR28: c000000000000000 8000000000000000 a000000000000000 c0000007e77fb580
NIP [c0000000000be8dc] .call_block_remove+0x12c/0x220
LR [c0000000000be880] .call_block_remove+0xd0/0x220
Call Trace:
[c0000007e77fb3c0] [c000000fb8c00240] 0xc000000fb8c00240 (unreliable)
[c0000007e77fb4e0] [c0000000000bfef8] .pSeries_lpar_flush_hash_range+0x578/0x670
[c0000007e77fb660] [c000000000073994] .flush_hash_range+0x44/0x100
[c0000007e77fb700] [c00000000007667c] .__flush_tlb_pending+0x3c/0xc0
[c0000007e77fb780] [c0000000002d3fdc] .zap_pte_range+0x7ec/0x830
[c0000007e77fb8d0] [c0000000002d4524] .unmap_page_range+0x3f4/0x540
[c0000007e77fb9f0] [c0000000002d4a04] .unmap_vmas+0x94/0x120
[c0000007e77fbab0] [c0000000002e0efc] .exit_mmap+0xac/0x1f0
[c0000007e77fbbc0] [c0000000000fae1c] .mmput+0x9c/0x1f0
[c0000007e77fbc40] [c000000000105738] .do_exit+0x388/0xd60
[c0000007e77fbd20] [c0000000001061b4] .do_group_exit+0x54/0x100
[c0000007e77fbdb0] [c000000000106274] .__se_sys_exit_group+0x14/0x20
[c0000007e77fbe20] [c00000000000b688] system_call+0x5c/0x70
Instruction dump:
39400001 38a00000 4800003c 60000000 60420000 7fa9e800 38e00000 419e0014
7d29d278 7d290074 7929d182 69270001 <0b070000> 7d495378 394a0001 7fa93040

The call to H_BLOCK_REMOVE should only be made for the supported pair of
base segment page size, actual page size and using the correct maximum
block size.

Due to the required complexity in do_block_remove() and
call_block_remove(), and the fact that currently a block size of 8 is
returned by the hypervisor, we are only supporting 8 size block to the
H_BLOCK_REMOVE hcall.

In order to identify this limitation easily in the code,a local define
HBLKR_SUPPORTED_SIZE defining the currently supported block size, and a
dedicated checking helper is_supported_hlbkr() are introduced.

For regular pages and hugetlb, the assumption is made that the page size is
equal to the base page size. For THP the page size is assumed to be 16M.

Fixes: ba2dd8a26baa ("powerpc/pseries/mm: call H_BLOCK_REMOVE")
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 8dad8d9c9e76..6a924276a8c2 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -65,6 +65,13 @@ EXPORT_SYMBOL(plpar_hcall_norets);
  */
 static int hblkrm_size[MMU_PAGE_COUNT][MMU_PAGE_COUNT] __ro_after_init;
 
+/*
+ * Due to the involved complexity, and that the current hypervisor is only
+ * returning this value or 0, we are limiting the support of the H_BLOCK_REMOVE
+ * buffer size to 8 size block.
+ */
+#define HBLKRM_SUPPORTED_BLOCK_SIZE 8
+
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 static u8 dtl_mask = DTL_LOG_PREEMPT;
 #else
@@ -993,6 +1000,17 @@ static void pSeries_lpar_hpte_invalidate(unsigned long slot, unsigned long vpn,
 #define HBLKR_CTRL_ERRNOTFOUND	0x8800000000000000UL
 #define HBLKR_CTRL_ERRBUSY	0xa000000000000000UL
 
+/*
+ * Returned true if we are supporting this block size for the specified segment
+ * base page size and actual page size.
+ *
+ * Currently, we only support 8 size block.
+ */
+static inline bool is_supported_hlbkrm(int bpsize, int psize)
+{
+	return (hblkrm_size[bpsize][psize] == HBLKRM_SUPPORTED_BLOCK_SIZE);
+}
+
 /**
  * H_BLOCK_REMOVE caller.
  * @idx should point to the latest @param entry set with a PTEX.
@@ -1152,7 +1170,8 @@ static inline void __pSeries_lpar_hugepage_invalidate(unsigned long *slot,
 	if (lock_tlbie)
 		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
 
-	if (firmware_has_feature(FW_FEATURE_BLOCK_REMOVE))
+	/* Assuming THP size is 16M */
+	if (is_supported_hlbkrm(psize, MMU_PAGE_16M))
 		hugepage_block_invalidate(slot, vpn, count, psize, ssize);
 	else
 		hugepage_bulk_invalidate(slot, vpn, count, psize, ssize);
@@ -1469,7 +1488,7 @@ static void pSeries_lpar_flush_hash_range(unsigned long number, int local)
 	if (lock_tlbie)
 		spin_lock_irqsave(&pSeries_lpar_tlbie_lock, flags);
 
-	if (firmware_has_feature(FW_FEATURE_BLOCK_REMOVE)) {
+	if (is_supported_hlbkrm(batch->psize, batch->psize)) {
 		do_block_remove(number, batch, param);
 		goto out;
 	}
-- 
2.23.0

