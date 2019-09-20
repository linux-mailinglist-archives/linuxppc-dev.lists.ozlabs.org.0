Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30741B9070
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 15:14:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZZ1S4sHnzF3FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 23:14:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZYr90Q3fzF39n
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 23:06:16 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8KD6A58088837
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 09:06:11 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v4xd62g1v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 09:06:10 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Fri, 20 Sep 2019 14:05:30 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Sep 2019 14:05:28 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8KD5QVb52363346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 13:05:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A339011C064;
 Fri, 20 Sep 2019 13:05:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA71811C04C;
 Fri, 20 Sep 2019 13:05:25 +0000 (GMT)
Received: from pomme.com (unknown [9.145.3.52])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Sep 2019 13:05:25 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] powperc/mm: read TLB Block Invalidate Characteristics
Date: Fri, 20 Sep 2019 15:05:22 +0200
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190920130523.20441-1-ldufour@linux.ibm.com>
References: <20190920130523.20441-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092013-0020-0000-0000-0000036F8F43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092013-0021-0000-0000-000021C54293
Message-Id: <20190920130523.20441-2-ldufour@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200126
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

The PAPR document specifies the TLB Block Invalidate Characteristics which
tells for each pair of segment base page size, actual page size, the size
of the block the hcall H_BLOCK_REMOVE supports.

These characteristics are loaded at boot time in a new table hblkr_size.
The table is separate from the mmu_psize_def because this is specific to
the pseries platform.

A new init function, pseries_lpar_read_hblkrm_characteristics() is added to
read the characteristics. It is called from pSeries_setup_arch().

Fixes: ba2dd8a26baa ("powerpc/pseries/mm: call H_BLOCK_REMOVE")
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c    | 139 +++++++++++++++++++++++
 arch/powerpc/platforms/pseries/pseries.h |   1 +
 arch/powerpc/platforms/pseries/setup.c   |   1 +
 3 files changed, 141 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 36b846f6e74e..8dad8d9c9e76 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -56,6 +56,15 @@ EXPORT_SYMBOL(plpar_hcall);
 EXPORT_SYMBOL(plpar_hcall9);
 EXPORT_SYMBOL(plpar_hcall_norets);
 
+/*
+ * H_BLOCK_REMOVE supported block size for this page size in segment who's base
+ * page size is that page size.
+ *
+ * The first index is the segment base page size, the second one is the actual
+ * page size.
+ */
+static int hblkrm_size[MMU_PAGE_COUNT][MMU_PAGE_COUNT] __ro_after_init;
+
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 static u8 dtl_mask = DTL_LOG_PREEMPT;
 #else
@@ -1311,6 +1320,136 @@ static void do_block_remove(unsigned long number, struct ppc64_tlb_batch *batch,
 		(void)call_block_remove(pix, param, true);
 }
 
+/*
+ * TLB Block Invalidate Characteristics
+ *
+ * These characteristics define the size of the block the hcall H_BLOCK_REMOVE
+ * is able to process for each couple segment base page size, actual page size.
+ *
+ * The ibm,get-system-parameter properties is returning a buffer with the
+ * following layout:
+ *
+ * [ 2 bytes size of the RTAS buffer (excluding these 2 bytes) ]
+ * -----------------
+ * TLB Block Invalidate Specifiers:
+ * [ 1 byte LOG base 2 of the TLB invalidate block size being specified ]
+ * [ 1 byte Number of page sizes (N) that are supported for the specified
+ *          TLB invalidate block size ]
+ * [ 1 byte Encoded segment base page size and actual page size
+ *          MSB=0 means 4k segment base page size and actual page size
+ *          MSB=1 the penc value in mmu_psize_def ]
+ * ...
+ * -----------------
+ * Next TLB Block Invalidate Specifiers...
+ * -----------------
+ * [ 0 ]
+ */
+static inline void set_hblkrm_bloc_size(int bpsize, int psize,
+					unsigned int block_size)
+{
+	if (block_size > hblkrm_size[bpsize][psize])
+		hblkrm_size[bpsize][psize] = block_size;
+}
+
+/*
+ * Decode the Encoded segment base page size and actual page size.
+ * PAPR specifies:
+ *   - bit 7 is the L bit
+ *   - bits 0-5 are the penc value
+ * If the L bit is 0, this means 4K segment base page size and actual page size
+ * otherwise the penc value should be read.
+ */
+#define HBLKRM_L_MASK		0x80
+#define HBLKRM_PENC_MASK	0x3f
+static inline void __init check_lp_set_hblkrm(unsigned int lp,
+					      unsigned int block_size)
+{
+	unsigned int bpsize, psize;
+
+	/* First, check the L bit, if not set, this means 4K */
+	if ((lp & HBLKRM_L_MASK) == 0) {
+		set_hblkrm_bloc_size(MMU_PAGE_4K, MMU_PAGE_4K, block_size);
+		return;
+	}
+
+	lp &= HBLKRM_PENC_MASK;
+	for (bpsize = 0; bpsize < MMU_PAGE_COUNT; bpsize++) {
+		struct mmu_psize_def *def = &mmu_psize_defs[bpsize];
+
+		for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
+			if (def->penc[psize] == lp) {
+				set_hblkrm_bloc_size(bpsize, psize, block_size);
+				return;
+			}
+		}
+	}
+}
+
+#define SPLPAR_TLB_BIC_TOKEN		50
+/*
+ * The size of the TLB Block Invalidate Characteristics is variable. But at the
+ * maximum it will be the number of possible page sizes *2 + 10 bytes.
+ * Currently MMU_PAGE_COUNT is 16, which means 42 bytes. Use a cache line size
+ * (128 bytes) for the buffer to get plenty of space.
+ */
+#define SPLPAR_TLB_BIC_MAXLENGTH	128
+//#warning revoir ce define mpe voudrait que ce soit cach size aligned
+void __init pseries_lpar_read_hblkrm_characteristics(void)
+{
+	unsigned char local_buffer[SPLPAR_TLB_BIC_MAXLENGTH];
+	int call_status, len, idx, bpsize;
+
+	spin_lock(&rtas_data_buf_lock);
+	memset(rtas_data_buf, 0, RTAS_DATA_BUF_SIZE);
+	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
+				NULL,
+				SPLPAR_TLB_BIC_TOKEN,
+				__pa(rtas_data_buf),
+				RTAS_DATA_BUF_SIZE);
+	memcpy(local_buffer, rtas_data_buf, SPLPAR_TLB_BIC_MAXLENGTH);
+	local_buffer[SPLPAR_TLB_BIC_MAXLENGTH - 1] = '\0';
+	spin_unlock(&rtas_data_buf_lock);
+
+	if (call_status != 0) {
+		pr_warn("%s %s Error calling get-system-parameter (0x%x)\n",
+			__FILE__, __func__, call_status);
+		return;
+	}
+
+	/*
+	 * The first two (2) bytes of the data in the buffer are the length of
+	 * the returned data, not counting these first two (2) bytes.
+	 */
+	len = be16_to_cpu(*((u16 *)local_buffer)) + 2;
+	if (len > SPLPAR_TLB_BIC_MAXLENGTH) {
+		pr_warn("%s too large returned buffer %d", __func__, len);
+		return;
+	}
+
+	idx = 2;
+	while (idx < len) {
+		u8 block_shift = local_buffer[idx++];
+		u32 block_size;
+		unsigned int npsize;
+
+		if (!block_shift)
+			break;
+
+		block_size = 1 << block_shift;
+
+		for (npsize = local_buffer[idx++];
+		     npsize > 0 && idx < len; npsize--)
+			check_lp_set_hblkrm((unsigned int) local_buffer[idx++],
+					    block_size);
+	}
+
+	for (bpsize = 0; bpsize < MMU_PAGE_COUNT; bpsize++)
+		for (idx = 0; idx < MMU_PAGE_COUNT; idx++)
+			if (hblkrm_size[bpsize][idx])
+				pr_info("H_BLOCK_REMOVE supports base psize:%d psize:%d block size:%d",
+					bpsize, idx, hblkrm_size[bpsize][idx]);
+}
+
 /*
  * Take a spinlock around flushes to avoid bouncing the hypervisor tlbie
  * lock.
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index a6624d4bd9d0..13fa370a87e4 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -112,5 +112,6 @@ static inline unsigned long cmo_get_page_size(void)
 int dlpar_workqueue_init(void);
 
 void pseries_setup_rfi_flush(void);
+void pseries_lpar_read_hblkrm_characteristics(void);
 
 #endif /* _PSERIES_PSERIES_H */
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index f8adcd0e4589..0a40201f315f 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -744,6 +744,7 @@ static void __init pSeries_setup_arch(void)
 
 	pseries_setup_rfi_flush();
 	setup_stf_barrier();
+	pseries_lpar_read_hblkrm_characteristics();
 
 	/* By default, only probe PCI (can be overridden by rtas_pci) */
 	pci_add_flags(PCI_PROBE_ONLY);
-- 
2.23.0

