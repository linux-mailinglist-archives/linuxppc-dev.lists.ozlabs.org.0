Return-Path: <linuxppc-dev+bounces-7188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70294A67AF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 18:29:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHJk86C6Mz2yYf;
	Wed, 19 Mar 2025 04:29:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742318976;
	cv=none; b=evf7CkRLK2n0Mokwdqfcph4UCfiCxaI4nT6Mqd5pDHz7NWa4Jj9dUatx8nRTCynfftlbiF0FUYIJWReKjN0tnUoLPYJBg/tF9kD+O9QiosRfc6/qEl8rIi34pJGl3QPUscFPdiOzEA/mnuioEm8ImLLj/HUOnSQQLeHEWvJCBKAXAxQ2QJielN7DXd5PXAScEJZaLKwbsYxx2Xm/SQWdZBflW5pYZfOPZT2y/pPHfTTzUsDMh0f6lL0fMFMl+qwS9BSyd+S6EwwzQPlPkQQuk/C3oOb17//+gJSBh4Je3mzoC9/qYNYX79jKF8mV29zhpYswM+eosjMUzyMRV3QniA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742318976; c=relaxed/relaxed;
	bh=9ehkTcd0d43Pw/Xfl6py7gyh3x8OmdwtD261Y4DK4V8=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=RYV75byP4jbyz2zoh38k7Q7kH7jaN5F1YMjj/3nJG4rgjaSzl9iLvM4L9ovW/mW9r9rOIR2yLdt50GuPVgKKZo8MI1rr5ERA1eXTY2tEF7XTXQai/qVvuQokNgApBVZkHuYuXAchzVbmxfsm+o8UH3VVyePeGmr/Zgkrf2kaTbeqiqPzKxXcpoIruKbvqB47uLAd4odUys9hYQY/I7MHC/52zMKY6BEGY2UL7OpeCiuCWhzSxYEN9NGohLIHf+ehep7K255+nKLjBFiMsMSYIOBNhArw7eZvFLlojaKqLPC9LMRyVzJxPAZ98O9DJMjF9FYxufuZiA/DlbbzsUvn9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nZs4DP7H; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nZs4DP7H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHJk74Vvlz2ySd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 04:29:35 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IH0CmN011598;
	Tue, 18 Mar 2025 17:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=9ehkTcd0d43Pw/Xfl6py7gyh3x8O
	mdwtD261Y4DK4V8=; b=nZs4DP7HD/JYIUdO4l3LuAjn0J8SbQas17+w6+dmDR42
	u06rMHFb69K0pWq10yzAFf7DyeZIOlotlELcuGxGjEDLrgBOMmtzREQ5xAjwZGcA
	tLKPWw8/PbMzk4GIyAOkAPqexvAjbqJGisMwyd+bS3mu61t1anmm1XcTjB4Eg86L
	Wtbx/8S/MKtWhdfYi5GnXlH/VRE011GawCHuNJS/wqUOsnGEeE6md47ZuLJQIvZq
	nlOmdlpYoMqzkyW1d6xvi/pyyq+9GidPsoa7WOSukkPyUztNDdSu2AiTWU0wrYAw
	lM72HMqT8v5uqh6Rq20dtIErD60Dpng/yUgWopoATQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45eu55w7yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 17:29:28 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52IH0XNh031974;
	Tue, 18 Mar 2025 17:29:28 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dkvtdap1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 17:29:28 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52IHTOOF19202428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Mar 2025 17:29:24 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5332320043;
	Tue, 18 Mar 2025 17:29:24 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95BA120040;
	Tue, 18 Mar 2025 17:29:22 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.137])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Mar 2025 17:29:22 +0000 (GMT)
Subject: [PATCH] vfio: pci: Advertise INTx only if LINE is connected
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: alex.williamson@redhat.com, jgg@ziepe.ca, kevin.tian@intel.com
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, yi.l.liu@intel.com,
        Yunxiang.Li@amd.com, pstanner@redhat.com, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, sbhat@linux.ibm.com
Date: Tue, 18 Mar 2025 17:29:21 +0000
Message-ID: <174231895238.2295.12586708771396482526.stgit@linux.ibm.com>
User-Agent: StGit/1.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GDDIVZyl4q0rZUaHaDFiqrzscpzhIBL1
X-Proofpoint-GUID: GDDIVZyl4q0rZUaHaDFiqrzscpzhIBL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503180127
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On POWER systems, when the device is behind the io expander,
not all PCI slots would have the PCI_INTERRUPT_LINE connected.
The firmware assigns a valid PCI_INTERRUPT_PIN though. In such
configuration, the irq_info ioctl currently advertizes the
irq count as 1 as the PCI_INTERRUPT_PIN is valid.

The patch adds the additional check[1] if the irq is assigned
for the PIN which is done iff the LINE is connected.

[1]: https://lore.kernel.org/qemu-devel/20250131150201.048aa3bf.alex.williamson@redhat.com/

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Suggested-By: Alex Williamson <alex.williamson@redhat.com>
---
 drivers/vfio/pci/vfio_pci_core.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 586e49efb81b..4ce70f05b4a8 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -734,6 +734,10 @@ static int vfio_pci_get_irq_count(struct vfio_pci_core_device *vdev, int irq_typ
 			return 0;
 
 		pci_read_config_byte(vdev->pdev, PCI_INTERRUPT_PIN, &pin);
+#if IS_ENABLED(CONFIG_PPC64)
+		if (!vdev->pdev->irq)
+			pin = 0;
+#endif
 
 		return pin ? 1 : 0;
 	} else if (irq_type == VFIO_PCI_MSI_IRQ_INDEX) {



