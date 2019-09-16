Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54839B37AE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 12:01:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46X1wX48YDzF4Sk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 20:01:16 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46X1r805hHzF4Mk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 19:57:27 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8G9qVe2073952
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 05:57:25 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v27j1sdah-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 05:57:24 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Mon, 16 Sep 2019 10:57:22 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 16 Sep 2019 10:57:19 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8G9vHV948693316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Sep 2019 09:57:18 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D775F4C046;
 Mon, 16 Sep 2019 09:57:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 142274C040;
 Mon, 16 Sep 2019 09:57:17 +0000 (GMT)
Received: from pomme.com (unknown [9.145.76.175])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 16 Sep 2019 09:57:16 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] powperc/mm: read TLB Block Invalidate Characteristics
Date: Mon, 16 Sep 2019 11:55:42 +0200
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916095543.17496-1-ldufour@linux.ibm.com>
References: <20190916095543.17496-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091609-0016-0000-0000-000002AC848B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091609-0017-0000-0000-0000330D21F2
Message-Id: <20190916095543.17496-2-ldufour@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909160105
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
tells for each couple segment base page size, actual page size, the size of
the block the hcall H_BLOCK_REMOVE is supporting.

These characteristics are loaded at boot time in a new table hblkr_size.
The table is appart the mmu_psize_def because this is specific to the
pseries architecture.

A new init service, pseries_lpar_read_hblkr_characteristics() is added to
read the characteristics. In that function, the size of the buffer is set
to twice the number of known page size, plus 10 bytes to ensure we have
enough place. This new init function is called from pSeries_setup_arch().

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 .../include/asm/book3s/64/tlbflush-hash.h     |   1 +
 arch/powerpc/platforms/pseries/lpar.c         | 138 ++++++++++++++++++
 arch/powerpc/platforms/pseries/setup.c        |   1 +
 3 files changed, 140 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 64d02a704bcb..74155cc8cf89 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -117,4 +117,5 @@ extern void __flush_hash_table_range(struct mm_struct *mm, unsigned long start,
 				     unsigned long end);
 extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,
 				unsigned long addr);
+extern void pseries_lpar_read_hblkr_characteristics(void);
 #endif /*  _ASM_POWERPC_BOOK3S_64_TLBFLUSH_HASH_H */
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 36b846f6e74e..98a5c2ff9a0b 100644
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
+static int hblkr_size[MMU_PAGE_COUNT][MMU_PAGE_COUNT];
+
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 static u8 dtl_mask = DTL_LOG_PREEMPT;
 #else
@@ -1311,6 +1320,135 @@ static void do_block_remove(unsigned long number, struct ppc64_tlb_batch *batch,
 		(void)call_block_remove(pix, param, true);
 }
 
+/*
+ * TLB Block Invalidate Characteristics These characteristics define the size of
+ * the block the hcall H_BLOCK_REMOVE is able to process for each couple segment
+ * base page size, actual page size.
+ *
+ * The ibm,get-system-parameter properties is returning a buffer with the
+ * following layout:
+ *
+ * [ 2 bytes size of the RTAS buffer (without these 2 bytes) ]
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
+static inline void __init set_hblk_bloc_size(int bpsize, int psize,
+					     unsigned int block_size)
+{
+	if (block_size > hblkr_size[bpsize][psize])
+		hblkr_size[bpsize][psize] = block_size;
+}
+
+/*
+ * Decode the Encoded segment base page size and actual page size.
+ * PAPR specifies with bit 0 as MSB:
+ *   - bit 0 is the L bit
+ *   - bits 2-7 are the penc value
+ * If the L bit is 0, this means 4K segment base page size and actual page size
+ * otherwise the penc value should be readed.
+ */
+#define HBLKR_L_BIT_MASK	0x80
+#define HBLKR_PENC_MASK		0x3f
+static inline void __init check_lp_set_hblk(unsigned int lp,
+					    unsigned int block_size)
+{
+	unsigned int bpsize, psize;
+
+
+	/* First, check the L bit, if not set, this means 4K */
+	if ((lp & HBLKR_L_BIT_MASK) == 0) {
+		set_hblk_bloc_size(MMU_PAGE_4K, MMU_PAGE_4K, block_size);
+		return;
+	}
+
+	lp &= HBLKR_PENC_MASK;
+	for (bpsize = 0; bpsize < MMU_PAGE_COUNT; bpsize++) {
+		struct mmu_psize_def *def =  &mmu_psize_defs[bpsize];
+
+		for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
+			if (def->penc[psize] == lp) {
+				set_hblk_bloc_size(bpsize, psize, block_size);
+				return;
+			}
+		}
+	}
+}
+
+#define SPLPAR_TLB_BIC_TOKEN		50
+#define SPLPAR_TLB_BIC_MAXLENGTH	(MMU_PAGE_COUNT*2 + 10)
+void __init pseries_lpar_read_hblkr_characteristics(void)
+{
+	int call_status;
+	unsigned char local_buffer[SPLPAR_TLB_BIC_MAXLENGTH];
+	int len, idx, bpsize;
+
+	if (!firmware_has_feature(FW_FEATURE_BLOCK_REMOVE)) {
+		pr_info("H_BLOCK_REMOVE is not supported");
+		return;
+	}
+
+	memset(local_buffer, 0, SPLPAR_TLB_BIC_MAXLENGTH);
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
+	len = local_buffer[0] * 256 + local_buffer[1] + 2;
+	if (len >= SPLPAR_TLB_BIC_MAXLENGTH) {
+		pr_warn("%s too large returned buffer %d", __func__, len);
+		return;
+	}
+
+	idx = 2;
+	while (idx < len) {
+		unsigned int block_size = local_buffer[idx++];
+		unsigned int npsize;
+
+		if (!block_size)
+			break;
+
+		block_size = 1 << block_size;
+
+		for (npsize = local_buffer[idx++];  npsize > 0; npsize--)
+			check_lp_set_hblk((unsigned int) local_buffer[idx++],
+					  block_size);
+	}
+
+	for (bpsize = 0; bpsize < MMU_PAGE_COUNT; bpsize++)
+		for (idx = 0; idx < MMU_PAGE_COUNT; idx++)
+			if (hblkr_size[bpsize][idx])
+				pr_info("H_BLOCK_REMOVE supports base psize:%d psize:%d block size:%d",
+					bpsize, idx, hblkr_size[bpsize][idx]);
+}
+
 /*
  * Take a spinlock around flushes to avoid bouncing the hypervisor tlbie
  * lock.
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index f8adcd0e4589..015b7ba13ee4 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -744,6 +744,7 @@ static void __init pSeries_setup_arch(void)
 
 	pseries_setup_rfi_flush();
 	setup_stf_barrier();
+	pseries_lpar_read_hblkr_characteristics();
 
 	/* By default, only probe PCI (can be overridden by rtas_pci) */
 	pci_add_flags(PCI_PROBE_ONLY);
-- 
2.23.0

