Return-Path: <linuxppc-dev+bounces-1423-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112897B0BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2024 15:25:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7Mw71RDvz2xYr;
	Tue, 17 Sep 2024 23:25:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726579511;
	cv=none; b=UaFLEohflTqjLeEb+k72/QApsDGKREHj8cJhbaSt3FiS3Ia1aX7Y0+7eNZIG2N6ryPrxb86KxMBFT0Y27ptrAEYJvBIHWbhQtyicBWpSDF4S9ILKYnnF6mn6mM4xamJjEydSYzS/QN5K78zvjXndkXS7DwLVgakdQ9XPE7MJQ68h5pn6IT4gvctSOTXTo/RnMFYqsQ3K8JoaMbx1irxVBKRdetHZbJAHbhzWZRX7kPUvDd6WxpmeFeR9Mg1QoR4R2hds3ovS3ZZnjw51JFijGRhPJRj3YGQlhMW1k5igo9S49L94rzpfpvrU6d+0VVOpdakvD+BR6I4J0jK1FXvMHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726579511; c=relaxed/relaxed;
	bh=Z769WCX4OS1KZIRuK7qzRG9PO/TL5XYkQB5PvLAPAPc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nD/4URgIvmvGNhJsyrAyrQvmJBDfiX8ltWGYs/xKGyzlXJ8t6qMsvbUCKQMMemRwKhip/cU6AEZ4gBB5t7XXyrJNZq4VKDmITtQjCBa0Q1gThF2CnKPYaU3JsycDYn9BU/qhKoguQlX6RkWIQb4ufs+FII/4yeo2ZRnMXpS64z/4XGFd2kGzQFcMKSh+YYCdnNn4o233den9tMPJAPlx7ie69SRMx5V7cpd4QbrX9g3rzt0dnQ1T+YxgtZzIyU+SwP/s1Ets3jMRKNcFkaSsFkZRG1n2PzvFd73WhSfraNoiR2kaGY4KWHQca1qmQeknpcrsEBq+zjbiGKYKlSmCDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XGZu8KDA; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XGZu8KDA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7Mw64mBYz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 23:25:09 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H8FO9B031957;
	Tue, 17 Sep 2024 13:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=Z769WCX4OS1KZIRuK7qzRG9PO/TL5XYkQB5PvLA
	PAPc=; b=XGZu8KDAexY7PMt62ocFEdx0R0/V6sFh6a7GCpxQ4GVS0X3vTx4skGF
	d0ZchNvzoB8XHgGaJRbjPLd+fhvgxP1GLCX6RpDJmHPlRlQ8zc8aVaxtGcEqiWkQ
	pmputr2u0LLe6CmSIjXBFxy080Q0yDpMkdv3NhulSpbGQP52Cq5ozb1DAJZpzLkh
	ttDHQ9pquJTq3ALP1pTANvMbjAI/B8alGiOa/CoSmTilqPBAHoVa2nAMD4R4KJ1O
	JsKJyS08iFIuFKQ3ww/ND5vw7tRvH7aYUP7DnZMaIlJw5gpO3/X2qL13zHYnu5P8
	uX+ns8HzS2JrRY0au8v8HnGtJv+L5ww==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3uj8c40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 13:24:55 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48HDOtbJ020134;
	Tue, 17 Sep 2024 13:24:55 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3uj8c3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 13:24:55 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48HAQsrI024699;
	Tue, 17 Sep 2024 13:24:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 41nq1mw5ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 13:24:54 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48HDOoDx43581880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Sep 2024 13:24:50 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77D5A20043;
	Tue, 17 Sep 2024 13:24:50 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA8D520040;
	Tue, 17 Sep 2024 13:24:48 +0000 (GMT)
Received: from ltc-wspoon17.aus.stglabs.ibm.com (unknown [9.3.101.49])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Sep 2024 13:24:48 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        linux-kernel@vger.kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, vaibhav@linux.ibm.com,
        ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: [PATCH] powerpc/pseries/eeh: move pseries_eeh_err_inject() outside CONFIG_DEBUG_FS block
Date: Tue, 17 Sep 2024 09:24:45 -0400
Message-Id: <20240917132445.3868016-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FtQ074m2Rfo7OijiNExjd6AeztopPfs4
X-Proofpoint-GUID: 0axfa_oxoiyn_dZJi0weoiAiqHLdxOI1
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
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-17_05,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170094

Makes pseries_eeh_err_inject() available even when debugfs
is disabled (CONFIG_DEBUG_FS=n). It moves eeh_debugfs_break_device()
and eeh_pe_inject_mmio_error() out of the CONFIG_DEBUG_FS block
and renames it as eeh_break_device().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409170509.VWC6jadC-lkp@intel.com/
Fixes: b0e2b828dfca ("powerpc/pseries/eeh: Fix pseries_eeh_err_inject")
Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
---
 arch/powerpc/kernel/eeh.c | 198 +++++++++++++++++++-------------------
 1 file changed, 99 insertions(+), 99 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 49ab11a287a3..0fe25e907ea6 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1574,6 +1574,104 @@ static int proc_eeh_show(struct seq_file *m, void *v)
 }
 #endif /* CONFIG_PROC_FS */
 
+static int eeh_break_device(struct pci_dev *pdev)
+{
+	struct resource *bar = NULL;
+	void __iomem *mapped;
+	u16 old, bit;
+	int i, pos;
+
+	/* Do we have an MMIO BAR to disable? */
+	for (i = 0; i <= PCI_STD_RESOURCE_END; i++) {
+		struct resource *r = &pdev->resource[i];
+
+		if (!r->flags || !r->start)
+			continue;
+		if (r->flags & IORESOURCE_IO)
+			continue;
+		if (r->flags & IORESOURCE_UNSET)
+			continue;
+
+		bar = r;
+		break;
+	}
+
+	if (!bar) {
+		pci_err(pdev, "Unable to find Memory BAR to cause EEH with\n");
+		return -ENXIO;
+	}
+
+	pci_err(pdev, "Going to break: %pR\n", bar);
+
+	if (pdev->is_virtfn) {
+#ifndef CONFIG_PCI_IOV
+		return -ENXIO;
+#else
+		/*
+		 * VFs don't have a per-function COMMAND register, so the best
+		 * we can do is clear the Memory Space Enable bit in the PF's
+		 * SRIOV control reg.
+		 *
+		 * Unfortunately, this requires that we have a PF (i.e doesn't
+		 * work for a passed-through VF) and it has the potential side
+		 * effect of also causing an EEH on every other VF under the
+		 * PF. Oh well.
+		 */
+		pdev = pdev->physfn;
+		if (!pdev)
+			return -ENXIO; /* passed through VFs have no PF */
+
+		pos  = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
+		pos += PCI_SRIOV_CTRL;
+		bit  = PCI_SRIOV_CTRL_MSE;
+#endif /* !CONFIG_PCI_IOV */
+	} else {
+		bit = PCI_COMMAND_MEMORY;
+		pos = PCI_COMMAND;
+	}
+
+	/*
+	 * Process here is:
+	 *
+	 * 1. Disable Memory space.
+	 *
+	 * 2. Perform an MMIO to the device. This should result in an error
+	 *    (CA  / UR) being raised by the device which results in an EEH
+	 *    PE freeze. Using the in_8() accessor skips the eeh detection hook
+	 *    so the freeze hook so the EEH Detection machinery won't be
+	 *    triggered here. This is to match the usual behaviour of EEH
+	 *    where the HW will asynchronously freeze a PE and it's up to
+	 *    the kernel to notice and deal with it.
+	 *
+	 * 3. Turn Memory space back on. This is more important for VFs
+	 *    since recovery will probably fail if we don't. For normal
+	 *    the COMMAND register is reset as a part of re-initialising
+	 *    the device.
+	 *
+	 * Breaking stuff is the point so who cares if it's racy ;)
+	 */
+	pci_read_config_word(pdev, pos, &old);
+
+	mapped = ioremap(bar->start, PAGE_SIZE);
+	if (!mapped) {
+		pci_err(pdev, "Unable to map MMIO BAR %pR\n", bar);
+		return -ENXIO;
+	}
+
+	pci_write_config_word(pdev, pos, old & ~bit);
+	in_8(mapped);
+	pci_write_config_word(pdev, pos, old);
+
+	iounmap(mapped);
+
+	return 0;
+}
+
+int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
+{
+	return eeh_break_device(pdev);
+}
+
 #ifdef CONFIG_DEBUG_FS
 
 
@@ -1727,99 +1825,6 @@ static const struct file_operations eeh_dev_check_fops = {
 	.read   = eeh_debugfs_dev_usage,
 };
 
-static int eeh_debugfs_break_device(struct pci_dev *pdev)
-{
-	struct resource *bar = NULL;
-	void __iomem *mapped;
-	u16 old, bit;
-	int i, pos;
-
-	/* Do we have an MMIO BAR to disable? */
-	for (i = 0; i <= PCI_STD_RESOURCE_END; i++) {
-		struct resource *r = &pdev->resource[i];
-
-		if (!r->flags || !r->start)
-			continue;
-		if (r->flags & IORESOURCE_IO)
-			continue;
-		if (r->flags & IORESOURCE_UNSET)
-			continue;
-
-		bar = r;
-		break;
-	}
-
-	if (!bar) {
-		pci_err(pdev, "Unable to find Memory BAR to cause EEH with\n");
-		return -ENXIO;
-	}
-
-	pci_err(pdev, "Going to break: %pR\n", bar);
-
-	if (pdev->is_virtfn) {
-#ifndef CONFIG_PCI_IOV
-		return -ENXIO;
-#else
-		/*
-		 * VFs don't have a per-function COMMAND register, so the best
-		 * we can do is clear the Memory Space Enable bit in the PF's
-		 * SRIOV control reg.
-		 *
-		 * Unfortunately, this requires that we have a PF (i.e doesn't
-		 * work for a passed-through VF) and it has the potential side
-		 * effect of also causing an EEH on every other VF under the
-		 * PF. Oh well.
-		 */
-		pdev = pdev->physfn;
-		if (!pdev)
-			return -ENXIO; /* passed through VFs have no PF */
-
-		pos  = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
-		pos += PCI_SRIOV_CTRL;
-		bit  = PCI_SRIOV_CTRL_MSE;
-#endif /* !CONFIG_PCI_IOV */
-	} else {
-		bit = PCI_COMMAND_MEMORY;
-		pos = PCI_COMMAND;
-	}
-
-	/*
-	 * Process here is:
-	 *
-	 * 1. Disable Memory space.
-	 *
-	 * 2. Perform an MMIO to the device. This should result in an error
-	 *    (CA  / UR) being raised by the device which results in an EEH
-	 *    PE freeze. Using the in_8() accessor skips the eeh detection hook
-	 *    so the freeze hook so the EEH Detection machinery won't be
-	 *    triggered here. This is to match the usual behaviour of EEH
-	 *    where the HW will asynchronously freeze a PE and it's up to
-	 *    the kernel to notice and deal with it.
-	 *
-	 * 3. Turn Memory space back on. This is more important for VFs
-	 *    since recovery will probably fail if we don't. For normal
-	 *    the COMMAND register is reset as a part of re-initialising
-	 *    the device.
-	 *
-	 * Breaking stuff is the point so who cares if it's racy ;)
-	 */
-	pci_read_config_word(pdev, pos, &old);
-
-	mapped = ioremap(bar->start, PAGE_SIZE);
-	if (!mapped) {
-		pci_err(pdev, "Unable to map MMIO BAR %pR\n", bar);
-		return -ENXIO;
-	}
-
-	pci_write_config_word(pdev, pos, old & ~bit);
-	in_8(mapped);
-	pci_write_config_word(pdev, pos, old);
-
-	iounmap(mapped);
-
-	return 0;
-}
-
 static ssize_t eeh_dev_break_write(struct file *filp,
 				const char __user *user_buf,
 				size_t count, loff_t *ppos)
@@ -1831,7 +1836,7 @@ static ssize_t eeh_dev_break_write(struct file *filp,
 	if (IS_ERR(pdev))
 		return PTR_ERR(pdev);
 
-	ret = eeh_debugfs_break_device(pdev);
+	ret = eeh_break_device(pdev);
 	pci_dev_put(pdev);
 
 	if (ret < 0)
@@ -1847,11 +1852,6 @@ static const struct file_operations eeh_dev_break_fops = {
 	.read   = eeh_debugfs_dev_usage,
 };
 
-int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
-{
-	return eeh_debugfs_break_device(pdev);
-}
-
 static ssize_t eeh_dev_can_recover(struct file *filp,
 				   const char __user *user_buf,
 				   size_t count, loff_t *ppos)
-- 
2.39.2


