Return-Path: <linuxppc-dev+bounces-13925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D96EC3F166
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 10:10:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2tZQ5wXFz3054;
	Fri,  7 Nov 2025 20:10:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762506638;
	cv=none; b=jodgT4aHix914RMh8atSV8vPrNbEmwbeNcDdzS0DX0a4bSivYT+8yT1cucyzLketJF83c96uwmcx2GbluvowAmIgjYEq+IjVvbpHypWNiUYvt3S5JwyMThXtH/yL/pVxUofVoI0K0C2mAXUx2XG5vonSdK4rpqf6fAK88h+hb/xKlVwWl6jFMct/q95/DztNd8ZTYK4jvDr7os1dt46QpG6bAKYZcsLH/ldMhBgkPVMh37z3kGGoNJjwOzKGMt4sU0uL9Q+b4ow7Dj84PSZrOc3A52REPAGlQYqiXZsTvR/H9depHzvPp7EKZ/IAJ4uMihDbIGf8KPvWE3QWW2nyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762506638; c=relaxed/relaxed;
	bh=3JZuC3hQattySl6aFuHevMp7DeBcJA234Jrs7LaOEYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mCf9K1I1dDnmWYu8uSucNaDJJf/0MiNUruoNbMR9uPK6tEurEXEcYJ9ghTHQogCOQsPwc0D1mCEJCAexASa03D+ZAbPwf2TnCXPkMHFESwQqdTi1CIVi4kn2XZhilJsPbcV3j66u1ff+XN5PmCFaPXsdcIJOjqRsdHmVK0I9O/yAT+KPHgVgIEjidT1VvNqWsNVjXYSqduC/bgpU8VcGfLgdZWxnSuZK9wz4mss5mfgUenctZDKLTVDMy872jePoiZn84oXUQGQL1DV3lqOE6coe/Sl1obFKKPI9ic9WhRBPXb1QnX2vReI9Wh5UjRTLwiOXsbA4AOW58f4BR3joGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KZWqYMlm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KZWqYMlm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2tZQ0Zqwz2yjm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 20:10:37 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A74x2Jx026450;
	Fri, 7 Nov 2025 09:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=3JZuC3hQattySl6aFuHevMp7DeBcJA234Jrs7LaOE
	YM=; b=KZWqYMlm5cT6+okbmUWeyn84MfYJlcCXbCDNbyol7N+DDsQWMpBoU0ska
	eQXEKrnJLVye3MZWhMM+MvTOegGynqbE95kKT48zNAgxYrgY8J+4cJPbqh2GDX6D
	n3G/POP9XxoErYCvXoCVImgJGrp3cjJPMxd2A2vQP8khEv82t6MmLScEfwflYfL8
	/CJ3pdAvgMJR9K2WcVWw4Tweyw50HeiFkFNTHFJ0JoXUcheqt2bCkPARqLLXtB++
	SnlgQE9XXEBB7pLLdGYKx89rETflkKeqHKAD/+EzEI1uL3Wrj4ior19fPTrdrU4Z
	gYX1hWxrYbbA0sxizYWe+oEhLmk3w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59q9bvcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 09:10:26 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A792tuE027203;
	Fri, 7 Nov 2025 09:10:25 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59q9bvc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 09:10:25 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A777KZM027375;
	Fri, 7 Nov 2025 09:10:24 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5vwyt1sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 09:10:24 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A79AMAs66322830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 09:10:23 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D128258054;
	Fri,  7 Nov 2025 09:10:22 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFBA45803F;
	Fri,  7 Nov 2025 09:10:21 +0000 (GMT)
Received: from ltc-wspoon17.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Nov 2025 09:10:21 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, mahesh@linux.ibm.com, oohall@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        tyreld@linux.ibm.com, gregkh@linuxfoundation.org,
        vaibhav@linux.ibm.com, sbhat@linux.ibm.com, ganeshgr@linux.ibm.com
Subject: [RFC PATCH 1/1] powerpc/pseries: Add RTAS-based error injection support via pseries_eeh_err_inject()
Date: Fri,  7 Nov 2025 04:10:09 -0500
Message-ID: <20251107091009.43034-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=StmdKfO0 c=1 sm=1 tr=0 ts=690db782 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=-shJg61wUtsRUGQVQrwA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: rOxn40USt2TvQy9g84TwCbq1OjJGV_LU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAxOCBTYWx0ZWRfX57fIqcNSSLuC
 +dcHnQUQe+la/5c0wMMkygNpq80rMDKAECdyrOA2vPDRLfdqDcxzcWdj04x9GEhUjdv4MprPbJ9
 aYZtAS/plETFTrSu9+DZROpz9f35gkVbaD/fEPs32Zw3sqdAy4HIvmwQRxjvyhwJnKn06/jiYaW
 ZdnaChOj53ktqI0B839NmEg91GzsePtdK3OCHrrW7ZjDcx+OjPqaSQByl4+t1Ad7xn391ctNH2o
 Tt5Ik1syywcCMVHnWa3UIgT/rXCpGL5ifQxKHVcrMQhJaVtCez4GsuX7Xe9/nVJEdt1k07Sz3Sm
 iZgzb0uZ4MziY9w+CC9ylr70tm9fpvNp07rsvUvOM8FamOj0E2JIVJq9B+ZeEpQ+gjE+5dn7ege
 +Ul95Pff42rV6doFICvoFmLKTUCzEw==
X-Proofpoint-GUID: I-r2OKYdjhntzOIf0n4hBJE8AwLiRxE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010018
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch add support for RTAS-based error injection on pseries platforms
using a new implementation in the pseries_eeh_err_inject() function. The
feature allows controlled injection of synthetic hardware errors for
testing and validation purposes, such as PCI and memory faults.

Highlights of the implementation:

- Dynamically acquires RTAS tokens for ibm,open-errinjct, ibm,errinjct,
  and ibm,close-errinjct services. A complete open-call-close session is
  managed as per the platform firmware interface.

- A 1KB aligned and zero-initialized working buffer is allocated and
  filled according to the specified error type. Buffer layouts strictly
  follow PAPR documentation.

- Supports multiple error types:
  * 0x03 - recovered-special-event
  * 0x04 - corrupted-page
  * 0x07 - ioa-bus-error (32-bit)
  * 0x0F - ioa-bus-error-64 (64-bit)
  * 0x09 - corrupted-dcache-start
  * 0x0A - corrupted-dcache-end
  * 0x0B - corrupted-icache-start
  * 0x0C - corrupted-icache-end
  * 0x0D - corrupted-tlb-start
  * 0x0E - corrupted-tlb-end

- All RTAS parameters are passed in big-endian format using cpu_to_be32().

- Proper status code handling and detailed debug output via printk.
  Handles special conditions like already open sessions and unsupported
  operations.

- The error-specific buffer population logic is refactored into a helper
  for maintainability and clarity.

Tested on a PowerVM guest with firmware support for RTAS error injection.
Includes tracing support via bpftrace and in-kernel printk debugging.

Note : error injection from guest tested with the qemu patches
https://lore.kernel.org/all/20251029150618.186803-1-nnmlinux@linux.ibm.com/

Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h              |   4 +
 arch/powerpc/include/uapi/asm/eeh.h          |  18 +
 arch/powerpc/kernel/rtas.c                   |   6 +
 arch/powerpc/platforms/pseries/eeh_pseries.c | 424 ++++++++++++++++++-
 4 files changed, 434 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index d046bbd5017d..cb5f6475747c 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -519,6 +519,10 @@ int rtas_get_error_log_max(void);
 extern spinlock_t rtas_data_buf_lock;
 extern char rtas_data_buf[RTAS_DATA_BUF_SIZE];
 
+#define RTAS_ERRINJCT_BUF_SIZE 1024
+extern spinlock_t rtas_errinjct_buf_lock;
+extern char rtas_errinjct_buf[RTAS_ERRINJCT_BUF_SIZE];
+
 /* RMO buffer reserved for user-space RTAS use */
 extern unsigned long rtas_rmo_buf;
 
diff --git a/arch/powerpc/include/uapi/asm/eeh.h b/arch/powerpc/include/uapi/asm/eeh.h
index 3b5c47ff3fc4..86645cab2827 100644
--- a/arch/powerpc/include/uapi/asm/eeh.h
+++ b/arch/powerpc/include/uapi/asm/eeh.h
@@ -41,4 +41,22 @@
 #define EEH_ERR_FUNC_DMA_WR_TARGET	19
 #define EEH_ERR_FUNC_MAX		19
 
+/* RTAS PCI Error Injection Token Types */
+#define RTAS_ERR_TYPE_FATAL                     0x1
+#define RTAS_ERR_TYPE_RECOVERED_RANDOM_EVENT    0x2
+#define RTAS_ERR_TYPE_RECOVERED_SPECIAL_EVENT   0x3
+#define RTAS_ERR_TYPE_CORRUPTED_PAGE            0x4
+#define RTAS_ERR_TYPE_CORRUPTED_SLB             0x5
+#define RTAS_ERR_TYPE_TRANSLATOR_FAILURE        0x6
+#define RTAS_ERR_TYPE_IOA_BUS_ERROR             0x7
+#define RTAS_ERR_TYPE_PLATFORM_SPECIFIC         0x8
+#define RTAS_ERR_TYPE_CORRUPTED_DCACHE_START    0x9
+#define RTAS_ERR_TYPE_CORRUPTED_DCACHE_END      0xA
+#define RTAS_ERR_TYPE_CORRUPTED_ICACHE_START    0xB
+#define RTAS_ERR_TYPE_CORRUPTED_ICACHE_END      0xC
+#define RTAS_ERR_TYPE_CORRUPTED_TLB_START       0xD
+#define RTAS_ERR_TYPE_CORRUPTED_TLB_END         0xE
+#define RTAS_ERR_TYPE_IOA_BUS_ERROR_64          0xF
+#define RTAS_ERR_TYPE_UPSTREAM_IO_ERROR         0x10
+
 #endif /* _ASM_POWERPC_EEH_H */
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 8d81c1e7a8db..04c707100dab 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -769,6 +769,12 @@ EXPORT_SYMBOL_GPL(rtas_data_buf);
 
 unsigned long rtas_rmo_buf;
 
+DEFINE_SPINLOCK(rtas_errinjct_buf_lock);
+EXPORT_SYMBOL_GPL(rtas_errinjct_buf_lock);
+
+char rtas_errinjct_buf[1024] __aligned(SZ_1K);
+EXPORT_SYMBOL_GPL(rtas_errinjct_buf);
+
 /*
  * If non-NULL, this gets called when the kernel terminates.
  * This is done like this so rtas_flash can be a module.
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index b12ef382fec7..b06fcaf7282d 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -786,6 +786,358 @@ static int pseries_notify_resume(struct eeh_dev *edev)
 }
 #endif
 
+/**
+ * validate_addr_mask_in_pe - Validate that an addr+mask fall within PE's BARs
+ * @pe:  EEH PE containing one or more PCI devices
+ * @addr: Address to validate
+ * @mask: Address mask to validate
+ *
+ * Checks that @addr is mapped into a BAR/MMIO region of any device belonging
+ * to the PE. If @mask is non-zero, ensures it is consistent with @addr.
+ *
+ * Return: 0 if valid, RTAS_INVALID_PARAMETER on failure.
+ */
+
+static int validate_addr_mask_in_pe(struct eeh_pe *pe, unsigned long addr,
+				    unsigned long mask)
+{
+	struct eeh_dev *edev, *tmp;
+	struct pci_dev *pdev;
+	int bar;
+	resource_size_t bar_start, bar_len;
+	bool valid = false;
+
+	/* nothing to validate */
+	if (addr == 0 && mask == 0)
+		return 0;
+
+	eeh_pe_for_each_dev(pe, edev, tmp) {
+		pdev = eeh_dev_to_pci_dev(edev);
+		if (!pdev)
+			continue;
+
+		for (bar = 0; bar < PCI_NUM_RESOURCES; bar++) {
+			bar_start = pci_resource_start(pdev, bar);
+			bar_len = pci_resource_len(pdev, bar);
+
+			if (!bar_len)
+				continue;
+
+			if (addr >= bar_start && addr < (bar_start + bar_len)) {
+				/* ensure mask makes sense for the addr value */
+				if ((addr & mask) != addr) {
+					pr_err("EEH: Mask 0x%lx invalid for addr 0x%lx in BAR[%d] range 0x%llx-0x%llx\n",
+					       mask, addr, bar,
+					       (unsigned long long)bar_start,
+					       (unsigned long long)(bar_start + bar_len));
+					return RTAS_INVALID_PARAMETER;
+				}
+
+				pr_debug("EEH: addr=0x%lx with mask=0x%lx validated in BAR[%d] of %s\n",
+					 addr, mask, bar, pci_name(pdev));
+				valid = true;
+			}
+		}
+	}
+
+	if (!valid) {
+		pr_err("EEH: addr=0x%lx not valid within any BAR of any device in PE\n",
+		       addr);
+		return RTAS_INVALID_PARAMETER;
+	}
+
+	return 0;
+}
+
+/**
+ * validate_err_type - Basic sanity check for RTAS error type
+ * @type: RTAS error type
+ *
+ * Ensures that the error type is within the valid RTAS error type range.
+ *
+ * Return: true if valid, false otherwise.
+ */
+
+static bool validate_err_type(int type)
+{
+	/* sanity check */
+	if (type < RTAS_ERR_TYPE_FATAL ||
+	    type > RTAS_ERR_TYPE_UPSTREAM_IO_ERROR)
+		return false;
+
+	return true;
+}
+
+/**
+ * validate_special_event - Validate parameters for special-event injection
+ * @addr: Address parameter (should be zero)
+ * @mask: Mask parameter (should be zero)
+ *
+ * Special-event error injection should not take addr/mask.  Rejects if either
+ * is set.
+ *
+ * Return: 0 if valid, RTAS_INVALID_PARAMETER otherwise.
+ */
+
+static int validate_special_event(unsigned long addr, unsigned long mask)
+{
+	if (addr || mask) {
+		pr_err("EEH: Special-event should not specify addr/mask\n");
+		return RTAS_INVALID_PARAMETER;
+	}
+	return 0;
+}
+
+/**
+ * validate_corrupted_page - Validate parameters for corrupted-page injection
+ * @pe:   EEH PE (unused here, for consistency)
+ * @addr: Physical page address (required)
+ * @mask: Address mask (ignored if non-zero)
+ *
+ * Ensures a valid non-zero page address is provided. Warns if mask is set.
+ *
+ * Return: 0 if valid, RTAS_INVALID_PARAMETER otherwise.
+ */
+
+static int validate_corrupted_page(struct eeh_pe *pe,
+				   unsigned long addr, unsigned long mask)
+{
+	if (!addr) {
+		pr_err("EEH: corrupted-page requires non-zero addr\n");
+		return RTAS_INVALID_PARAMETER;
+	}
+	/* Mask not meaningful for corrupted-page */
+	if (mask)
+		pr_warn("EEH: corrupted-page ignoring mask=0x%lx\n", mask);
+	return 0;
+}
+
+/**
+ * validate_ioa_bus_error - Validate parameters for IOA bus error injection
+ * @pe:   EEH PE whose BARs are validated against
+ * @addr: Address parameter (optional)
+ * @mask: Mask parameter (optional)
+ *
+ * For IOA bus error injections, @addr and @mask are optional. If present,
+ * they must map into the PE's MMIO/CFG space.
+ *
+ * Return: 0 if valid or addr/mask absent, RTAS_INVALID_PARAMETER otherwise.
+ */
+
+static int validate_ioa_bus_error(struct eeh_pe *pe,
+				  unsigned long addr, unsigned long mask)
+{
+	/* Must map into BAR/MMIO/CFG space of PE */
+	return validate_addr_mask_in_pe(pe, addr, mask);
+}
+
+/**
+ * prepare_errinjct_buffer - Prepare RTAS error injection work buffer
+ * @pe:   EEH PE for the target device(s)
+ * @type: RTAS error type
+ * @func: Error function selector (semantics vary by type)
+ * @addr: Address argument (type-dependent)
+ * @mask: Mask argument (type-dependent)
+ *
+ * Clears the global error injection work buffer and populates it based on
+ * the error type and parameters provided. Performs inline validation of the
+ * arguments for each supported error type.
+ *
+ * Return: 0 on success, or RTAS_INVALID_PARAMETER / -EINVAL on failure.
+ */
+
+static int prepare_errinjct_buffer(struct eeh_pe *pe, int type, int func,
+				   unsigned long addr, unsigned long mask)
+{
+	u64 *buf64;
+	u32 *buf32;
+
+	memset(rtas_errinjct_buf, 0, RTAS_ERRINJCT_BUF_SIZE);
+	buf64 = (u64 *)rtas_errinjct_buf;
+	buf32 = (u32 *)rtas_errinjct_buf;
+
+	switch (type) {
+	case RTAS_ERR_TYPE_RECOVERED_SPECIAL_EVENT:
+		/* func must be 1 = non-persistent or 2 = persistent */
+		if (func < 1 || func > 2)
+			return RTAS_INVALID_PARAMETER;
+		if (addr == 0 && mask == 0)
+			return RTAS_INVALID_PARAMETER;
+
+		if (validate_special_event(addr, mask))
+			return RTAS_INVALID_PARAMETER;
+
+		buf32[0] = cpu_to_be32(func);
+		break;
+
+	case RTAS_ERR_TYPE_CORRUPTED_PAGE:
+		/* addr required: physical page address */
+		if (addr == 0)
+			return RTAS_INVALID_PARAMETER;
+
+		if (validate_corrupted_page(pe, addr, mask))
+			return RTAS_INVALID_PARAMETER;
+
+		buf32[0] = cpu_to_be32(upper_32_bits(addr));
+		buf32[1] = cpu_to_be32(lower_32_bits(addr));
+		break;
+
+	case RTAS_ERR_TYPE_IOA_BUS_ERROR:
+		/* 32-bit IOA bus error: addr/mask optional */
+		if (func < EEH_ERR_FUNC_LD_MEM_ADDR || func > EEH_ERR_FUNC_MAX)
+			return RTAS_INVALID_PARAMETER;
+
+		if (addr || mask) {
+			if (validate_ioa_bus_error(pe, addr, mask))
+				return RTAS_INVALID_PARAMETER;
+		}
+
+		buf32[0] = cpu_to_be32((u32)addr);
+		buf32[1] = cpu_to_be32((u32)mask);
+		buf32[2] = cpu_to_be32(pe->addr);
+		buf32[3] = cpu_to_be32(BUID_HI(pe->phb->buid));
+		buf32[4] = cpu_to_be32(BUID_LO(pe->phb->buid));
+		buf32[5] = cpu_to_be32(func);
+		break;
+
+	case RTAS_ERR_TYPE_IOA_BUS_ERROR_64:
+		/* 64-bit IOA bus error: addr/mask optional */
+		if (func < EEH_ERR_FUNC_MIN || func > EEH_ERR_FUNC_MAX)
+			return RTAS_INVALID_PARAMETER;
+
+		if (addr || mask) {
+			if (validate_ioa_bus_error(pe, addr, mask))
+				return RTAS_INVALID_PARAMETER;
+		}
+
+		buf64[0] = cpu_to_be64(addr);
+		buf64[1] = cpu_to_be64(mask);
+		buf32[4] = cpu_to_be32(pe->addr);
+		buf32[5] = cpu_to_be32(BUID_HI(pe->phb->buid));
+		buf32[6] = cpu_to_be32(BUID_LO(pe->phb->buid));
+		buf32[7] = cpu_to_be32(func);
+		break;
+
+	case RTAS_ERR_TYPE_CORRUPTED_DCACHE_START:
+	case RTAS_ERR_TYPE_CORRUPTED_DCACHE_END:
+	case RTAS_ERR_TYPE_CORRUPTED_ICACHE_START:
+	case RTAS_ERR_TYPE_CORRUPTED_ICACHE_END:
+		/* addr/mask optional, no strict validation */
+		buf32[0] = cpu_to_be32(addr);
+		buf32[1] = cpu_to_be32(mask);
+		break;
+
+	case RTAS_ERR_TYPE_CORRUPTED_TLB_START:
+	case RTAS_ERR_TYPE_CORRUPTED_TLB_END:
+		/* only addr field relevant */
+		buf32[0] = cpu_to_be32(addr);
+		break;
+
+	default:
+		pr_err("EEH: Unsupported error type 0x%x\n", type);
+		return -EINVAL;
+	}
+
+	pr_debug("RTAS: errinjct buffer prepared: type=%d func=%d addr=0x%lx mask=0x%lx\n",
+		 type, func, addr, mask);
+
+	return 0;
+}
+
+/**
+ * rtas_open_errinjct_session - Open an RTAS error injection session
+ *
+ * Opens a session with the RTAS ibm,open-errinjct service.
+ *
+ * Return: Positive session token on success, negative error code on failure.
+ */
+static int rtas_open_errinjct_session(void)
+{
+	int open_token, args[2] = {0};
+	int rc, status, session_token = -1;
+
+	open_token = rtas_function_token(RTAS_FN_IBM_OPEN_ERRINJCT);
+	if (open_token == RTAS_UNKNOWN_SERVICE) {
+		pr_err("RTAS: ibm,open-errinjct not available\n");
+		return RTAS_UNKNOWN_SERVICE;
+	}
+
+	/* Call open; original code treated rtas_call return as session token */
+	rc = rtas_call(open_token, 0, 2, args);
+	status = args[0];
+	if (status != 0) {
+		pr_err("RTAS: open-errinjct failed: status=%d args[1]=%d rc=%d\n",
+		       status, args[1], rc);
+		return status ? status : -EIO;
+	}
+
+	session_token = rc;
+	pr_info("RTAS: Opened injection session: token=%d\n", session_token);
+	return session_token;
+}
+
+/**
+ * rtas_close_errinjct_session - Close an RTAS error injection session
+ * @session_token: Session token returned from open
+ *
+ * Attempts to close a previously opened error injection session. Best-effort;
+ * logs warnings if close fails or if service is unavailable.
+ */
+
+static void rtas_close_errinjct_session(int session_token)
+{
+	int close_token, args[2] = {0};
+	int rc;
+
+	if (session_token < 0)
+		return;
+
+	close_token = rtas_function_token(RTAS_FN_IBM_CLOSE_ERRINJCT);
+	if (close_token == RTAS_UNKNOWN_SERVICE) {
+		pr_warn("RTAS: close-errinjct not available\n");
+		return;
+	}
+
+	args[0] = session_token;
+	rc = rtas_call(close_token, 1, 1, args);
+	if (rc) {
+		pr_warn("RTAS: close-errinjct rc=%d, args[0]=%d, args[1]=%d\n",
+			rc, args[0], args[1]);
+	}
+}
+
+/**
+ * do_errinjct_call - Invoke the RTAS error injection service
+ * @errinjct_token: RTAS token for ibm,errinjct
+ * @type:           RTAS error type
+ * @session_token:  RTAS error injection session token
+ *
+ * Issues the RTAS ibm,errinjct call with the prepared work buffer. Logs errors
+ * on failure.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+
+static int do_errinjct_call(int errinjct_token, int type, int session_token)
+{
+	int rc, status;
+
+	if (errinjct_token == RTAS_UNKNOWN_SERVICE)
+		return -ENODEV;
+
+	/* errinjct takes: type, session_token, workbuf pointer (3 in), returns status */
+	rc = rtas_call(errinjct_token, 3, 1, &status, type, session_token,
+		       rtas_errinjct_buf);
+
+	if (rc || status) {
+		pr_err("RTAS: errinjct failed: rc=%d, status=%d\n", rc, status);
+		return status ? status : -EIO;
+	}
+
+	pr_info("RTAS: errinjct ok: rc=%d, status=%d\n", rc, status);
+	return 0;
+}
+
 /**
  * pseries_eeh_err_inject - Inject specified error to the indicated PE
  * @pe: the indicated PE
@@ -799,30 +1151,66 @@ static int pseries_notify_resume(struct eeh_dev *edev)
 static int pseries_eeh_err_inject(struct eeh_pe *pe, int type, int func,
 				  unsigned long addr, unsigned long mask)
 {
-	struct	eeh_dev	*pdev;
+	int rc = 0;
+	int session_token = -1;
+	int errinjct_token;
+
+	/* Validate type */
+	if (!validate_err_type(type)) {
+		pr_err("RTAS: invalid error type 0x%x\n", type);
+		return RTAS_INVALID_PARAMETER;
+	}
+	pr_debug("RTAS: error type 0x%x\n", type);
 
-	/* Check on PCI error type */
-	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
-		return -EINVAL;
+	/* For IOA bus errors we must validate err_func and addr/mask in PE.
+	 * For other types: if addr/mask present we'll still validate BAR range;
+	 * otherwise skip function checks.
+	 */
+	if (type == RTAS_ERR_TYPE_IOA_BUS_ERROR ||
+	    type == RTAS_ERR_TYPE_IOA_BUS_ERROR_64) {
+		/* Validate that addr/mask fall in the PE's BAR ranges */
+		rc = validate_addr_mask_in_pe(pe, addr, mask);
+		if (rc)
+			return rc;
+	} else if (addr || mask) {
+		/* If caller provided addr/mask for a non-IOA type, do a BAR check too */
+		rc = validate_addr_mask_in_pe(pe, addr, mask);
+		if (rc)
+			return rc;
+	}
 
-	switch (func) {
-	case EEH_ERR_FUNC_LD_MEM_ADDR:
-	case EEH_ERR_FUNC_LD_MEM_DATA:
-	case EEH_ERR_FUNC_ST_MEM_ADDR:
-	case EEH_ERR_FUNC_ST_MEM_DATA:
-		/* injects a MMIO error for all pdev's belonging to PE */
-		pci_lock_rescan_remove();
-		list_for_each_entry(pdev, &pe->edevs, entry)
-			eeh_pe_inject_mmio_error(pdev->pdev);
-		pci_unlock_rescan_remove();
-		break;
-	default:
-		return -ERANGE;
+	/* Open RTAS session */
+	session_token = rtas_open_errinjct_session();
+	if (session_token < 0)
+		return session_token;
+
+	/* get errinjct token */
+	errinjct_token = rtas_function_token(RTAS_FN_IBM_ERRINJCT);
+	if (errinjct_token == RTAS_UNKNOWN_SERVICE) {
+		pr_err("RTAS: ibm,errinjct not available\n");
+		rc = -ENODEV;
+		goto out_close;
 	}
 
-	return 0;
+	/* prepare shared buffer while holding lock */
+	spin_lock(&rtas_errinjct_buf_lock);
+	rc = prepare_errinjct_buffer(pe, type, func, addr, mask);
+	if (rc) {
+		spin_unlock(&rtas_errinjct_buf_lock);
+		goto out_close;
+	}
+
+	/* perform the errinjct RTAS call */
+	rc = do_errinjct_call(errinjct_token, type, session_token);
+	spin_unlock(&rtas_errinjct_buf_lock);
+
+out_close:
+	/* always attempt close if we opened a session */
+	rtas_close_errinjct_session(session_token);
+	return rc;
 }
 
+
 static struct eeh_ops pseries_eeh_ops = {
 	.name			= "pseries",
 	.probe			= pseries_eeh_probe,
-- 
2.50.0


