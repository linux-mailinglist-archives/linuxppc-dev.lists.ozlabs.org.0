Return-Path: <linuxppc-dev+bounces-464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8137C95D117
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 17:12:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr3TX6qwMz2yy9;
	Sat, 24 Aug 2024 01:12:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724425952;
	cv=none; b=EiNKNAckaT+1+xFR8x1ysQitgqnUXvlCtZk9asU8xmXNJDnvea6GVVyO0Ex5/fZCVcntWxpVx7Q2S2RnGeA0uJCRzaF7MCAIKl1zqTXXvaFGz9aeS/lssuHj+qACPQRGQLKaHPj48xJUj3aw+09F3z7CsaPfRqg2vqBwBULj28hExUUamKrFW5upCGhBTBS0jZaGUhH/ieYHTviHshjZ64lxW/nEr6PrAeLYOvfaMj0N9SBc/0XVTiy2fDHou5IYWDAkDqYeOd/9WgcIsYDliENKVv+k2D26V49eJ2gzt7QATf3KNgxkThFTPFLMMGvNt7aYYSmdQXfwMgS4nBwe6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724425952; c=relaxed/relaxed;
	bh=ehYtOPwpL+7EbLCFZzDY05S020zqMOSSQsxSjNu1MTM=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:X-TM-AS-GCONF:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:Content-Transfer-Encoding:X-Proofpoint-UnRewURL:
	 MIME-Version:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	b=l7sHpS/EMDdge/XFaBmpfynVN9S3ta6f/ZUMlj4a5Vj/U4TkNWJne7696tvbsvXvBteBnVCyS9agL+fFnWxztMS0YBdmcneLZ75OT8paAEvpb8PJAnlL/7VXlGy77somA3m35RwuuJWkLAheGUiyiRHY6l952OBqlNCBQ5AvtrPIy3euVHZKD8VAE8e25zgbFRJsg85LDoe+UFfDsDCD9CtC3kwbPyWTxH9dV5MyRUU4/P8lWH+0jZiQQMTF7JqgYo6ypuncSLyjWCUdF4iVYcBMr2yeQfF4zZsBoQhvliv8oJ7NW8/1y+a448HZFC9qfBWNjNIOvGilKqgdC/HOyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=huwcS2DW; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=huwcS2DW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr3TX2QFtz2ysc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2024 01:12:31 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NF9JlA014479;
	Fri, 23 Aug 2024 15:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=ehYtOPwpL+7EbLCFZzDY05S020zqMOSSQsxSjNu
	1MTM=; b=huwcS2DW6JqyaAwfbX9wJs/oKXRhu0bN5NqTOPQ3UaQ3Ljhhc14zLZw
	+mx8v69wPcP9hBSJOhLuGQ6le//fTMOkOX5JVbf8KtFs2aALwZ97Twje+5Yx+Cr7
	PttqSK3XxWsc+4mCOBZrboUwbjyxCijkTfuWZDdPq04cknbDx6todkBj0glc+4t8
	uo34iM3xLY9baeLamMh62r4M4/idTXHo3SnQoBOX4SniFInV1HjjgX7ipInQ84WC
	/33BImRDP45lNvg3dTZyqzkqKxzx0hXhXKtkmvWhu2nUWbUP8ZfdMyHGUXY7GPLk
	ZrlVGzMZ9ShaDQYJBFArt/jAzwv45Ww==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 416vtj80ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 15:12:19 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47NFCJbf020043;
	Fri, 23 Aug 2024 15:12:19 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 416vtj80a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 15:12:19 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47NBHc0i019050;
	Fri, 23 Aug 2024 15:12:18 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41376qae0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 15:12:18 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47NFCBCu53477710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Aug 2024 15:12:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85E9A2004F;
	Fri, 23 Aug 2024 15:12:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B251520043;
	Fri, 23 Aug 2024 15:12:09 +0000 (GMT)
Received: from ltcrain34-lp2.aus.stglabs.ibm.com (unknown [9.3.101.41])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Aug 2024 15:12:09 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        linux-kernel@vger.kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, vaibhav@linux.ibm.com,
        ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: [PATCH v2] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
Date: Fri, 23 Aug 2024 10:11:58 -0500
Message-ID: <20240823151158.92602-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vWGBd6PpRxzd7zd1iZIda1yibW-5n0xf
X-Proofpoint-GUID: B6dA0RuJ8B3SvHhveRONLaaB-VQYHN9u
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_11,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230111

VFIO_EEH_PE_INJECT_ERR ioctl is currently failing on pseries
due to missing implementation of err_inject eeh_ops for pseries.
This patch implements pseries_eeh_err_inject in eeh_ops/pseries
eeh_ops. Implements support for injecting MMIO load/store error
for testing from user space.

The check on PCI error type code is moved to platform code, since
the eeh_pe_inject_err can be allowed to more error types depending
on platform requirement.

Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
---

Testing:
========
vfio-test [1] by Alex Willamson, was forked and updated to add
support inject error on pSeries guest and used to test this
patch[2].

References:
===========
[1] https://github.com/awilliam/tests
[2] https://github.com/nnmwebmin/vfio-ppc-tests/tree/vfio-ppc-ex

================
Changelog:
V1:https://lore.kernel.org/all/20240822082713.529982-1-nnmlinux@linux.ibm.com/
- Resolved build issues for ppc64|le_defconfig by moving the
pseries_eeh_err_inject() definition outside of the CONFIG_PCI_IOV
code block.
- New eeh_pe_inject_mmio_error wrapper function added to avoid
CONFIG_EEH is not set.
---
 arch/powerpc/include/asm/eeh.h               |  6 ++-
 arch/powerpc/kernel/eeh.c                    |  9 +++--
 arch/powerpc/platforms/pseries/eeh_pseries.c | 39 +++++++++++++++++++-
 3 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 91a9fd53254f..8da6b047a4fe 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -308,7 +308,7 @@ int eeh_pe_reset(struct eeh_pe *pe, int option, bool include_passed);
 int eeh_pe_configure(struct eeh_pe *pe);
 int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
 		      unsigned long addr, unsigned long mask);
-
+int eeh_pe_inject_mmio_error(struct pci_dev *pdev);
 /**
  * EEH_POSSIBLE_ERROR() -- test for possible MMIO failure.
  *
@@ -338,6 +338,10 @@ static inline int eeh_check_failure(const volatile void __iomem *token)
 	return 0;
 }
 
+static inline int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
+{
+	return -ENXIO;
+}
 #define eeh_dev_check_failure(x) (0)
 
 static inline void eeh_addr_cache_init(void) { }
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index d03f17987fca..49ab11a287a3 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1537,10 +1537,6 @@ int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
 	if (!eeh_ops || !eeh_ops->err_inject)
 		return -ENOENT;
 
-	/* Check on PCI error type */
-	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
-		return -EINVAL;
-
 	/* Check on PCI error function */
 	if (func < EEH_ERR_FUNC_MIN || func > EEH_ERR_FUNC_MAX)
 		return -EINVAL;
@@ -1851,6 +1847,11 @@ static const struct file_operations eeh_dev_break_fops = {
 	.read   = eeh_debugfs_dev_usage,
 };
 
+int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
+{
+	return eeh_debugfs_break_device(pdev);
+}
+
 static ssize_t eeh_dev_can_recover(struct file *filp,
 				   const char __user *user_buf,
 				   size_t count, loff_t *ppos)
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index b1ae0c0d1187..1893f66371fa 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -784,6 +784,43 @@ static int pseries_notify_resume(struct eeh_dev *edev)
 }
 #endif
 
+/**
+ * pseries_eeh_err_inject - Inject specified error to the indicated PE
+ * @pe: the indicated PE
+ * @type: error type
+ * @func: specific error type
+ * @addr: address
+ * @mask: address mask
+ * The routine is called to inject specified error, which is
+ * determined by @type and @func, to the indicated PE
+ */
+static int pseries_eeh_err_inject(struct eeh_pe *pe, int type, int func,
+				  unsigned long addr, unsigned long mask)
+{
+	struct	eeh_dev	*pdev;
+
+	/* Check on PCI error type */
+	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
+		return -EINVAL;
+
+	switch (func) {
+	case EEH_ERR_FUNC_LD_MEM_ADDR:
+	case EEH_ERR_FUNC_LD_MEM_DATA:
+	case EEH_ERR_FUNC_ST_MEM_ADDR:
+	case EEH_ERR_FUNC_ST_MEM_DATA:
+		/* injects a MMIO error for all pdev's belonging to PE */
+		pci_lock_rescan_remove();
+		list_for_each_entry(pdev, &pe->edevs, entry)
+			eeh_pe_inject_mmio_error(pdev->pdev);
+		pci_unlock_rescan_remove();
+		break;
+	default:
+		return -ERANGE;
+	}
+
+	return 0;
+}
+
 static struct eeh_ops pseries_eeh_ops = {
 	.name			= "pseries",
 	.probe			= pseries_eeh_probe,
@@ -792,7 +829,7 @@ static struct eeh_ops pseries_eeh_ops = {
 	.reset			= pseries_eeh_reset,
 	.get_log		= pseries_eeh_get_log,
 	.configure_bridge       = pseries_eeh_configure_bridge,
-	.err_inject		= NULL,
+	.err_inject		= pseries_eeh_err_inject,
 	.read_config		= pseries_eeh_read_config,
 	.write_config		= pseries_eeh_write_config,
 	.next_error		= NULL,
-- 
2.45.2


