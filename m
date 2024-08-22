Return-Path: <linuxppc-dev+bounces-344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 865BA95B479
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 14:01:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqMHV4CgZz2yVB;
	Thu, 22 Aug 2024 22:01:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lH262RGk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqGY26MvKz2yR3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 18:27:49 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M2Tcr2014551;
	Thu, 22 Aug 2024 08:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=PTAb5d4Vpd++S+Dv5zEYlfGd0bYQOo+j+VNFeS4
	uFgU=; b=lH262RGkd0pTiff5WST6bOEAdBm9oco2i+/stiMQrqYmlkmsM7bxmnG
	wmuicP5CfX4C6MpjOoPZOfiTZA4uk69FTQV/Zj084xhgCm3KcJ8X+3f/2IFrFUdT
	vt48YKS8wOfyc5sNF7yrVjBdRiHOWYpdLn/sJ8Z8iYz0xLRGyIqcKZkkQuZcdFIu
	5OVA/LvfrCqLwnQHmm1MPESKhG2ZCwKsJkl7l4G59qCG2JblVbD2VPuJamJxwmag
	UZLRgbbU3Efvnl0Tw+Zcde1q2Jol8my5fUiVxhq2RA9BbEcNHavGrQW3F6pAqjZN
	a7MQLIU1yp9YbyRu/29dxOClhLoxtXA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mcyp5ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 08:27:37 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47M8RbTY032156;
	Thu, 22 Aug 2024 08:27:37 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mcyp5b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 08:27:37 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47M5VfA9013499;
	Thu, 22 Aug 2024 08:27:36 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 41366uc2b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 08:27:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47M8RV3K35062418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 08:27:33 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4047520043;
	Thu, 22 Aug 2024 08:27:31 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FEE620040;
	Thu, 22 Aug 2024 08:27:29 +0000 (GMT)
Received: from ltcrain34-lp2.aus.stglabs.ibm.com (unknown [9.3.101.41])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Aug 2024 08:27:29 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        linux-kernel@vger.kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, vaibhav@linux.ibm.com,
        ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: [PATCH v1] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
Date: Thu, 22 Aug 2024 03:27:13 -0500
Message-ID: <20240822082713.529982-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V0tSynJ_D0JzD_QQbc2ORwkwYdlvxKIN
X-Proofpoint-GUID: vq96KG1Zr96WURlRY5Cc3UkdQDAYYqmz
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
 definitions=2024-08-22_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408220059

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
-------
vfio-test [1] by Alex Willamson, was forked and updated to add
support inject error on pSeries guest and used to test this
patch[2].

References:
----------
[1] https://github.com/awilliam/tests
[2] https://github.com/nnmwebmin/vfio-ppc-tests/tree/vfio-ppc-ex
---
 arch/powerpc/include/asm/eeh.h               |  1 +
 arch/powerpc/kernel/eeh.c                    |  6 +--
 arch/powerpc/platforms/pseries/eeh_pseries.c | 39 +++++++++++++++++++-
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 91a9fd53254f..96445e1eb28e 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -308,6 +308,7 @@ int eeh_pe_reset(struct eeh_pe *pe, int option, bool include_passed);
 int eeh_pe_configure(struct eeh_pe *pe);
 int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
 		      unsigned long addr, unsigned long mask);
+int eeh_debugfs_break_device(struct pci_dev *pdev);
 
 /**
  * EEH_POSSIBLE_ERROR() -- test for possible MMIO failure.
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index d03f17987fca..8db11edd65fb 100644
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
@@ -1731,7 +1727,7 @@ static const struct file_operations eeh_dev_check_fops = {
 	.read   = eeh_debugfs_dev_usage,
 };
 
-static int eeh_debugfs_break_device(struct pci_dev *pdev)
+int eeh_debugfs_break_device(struct pci_dev *pdev)
 {
 	struct resource *bar = NULL;
 	void __iomem *mapped;
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index b1ae0c0d1187..5ce1e11ca42f 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -782,6 +782,43 @@ static int pseries_notify_resume(struct eeh_dev *edev)
 
 	return 0;
 }
+
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
+			eeh_debugfs_break_device(pdev->pdev);
+		pci_unlock_rescan_remove();
+		break;
+	default:
+		return -ERANGE;
+	}
+
+	return 0;
+}
 #endif
 
 static struct eeh_ops pseries_eeh_ops = {
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


