Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE01153DA2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 04:36:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Ckd05Jp4zDqYY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 14:36:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CkBp6WSCzDqSM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Feb 2020 14:17:35 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0163FrO1005057
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Feb 2020 22:17:33 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xyhmyc55g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Feb 2020 22:17:32 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Thu, 6 Feb 2020 03:17:29 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Feb 2020 03:17:28 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0163HROY47775860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Feb 2020 03:17:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3881E4203F;
 Thu,  6 Feb 2020 03:17:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7DEF42041;
 Thu,  6 Feb 2020 03:17:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Feb 2020 03:17:26 +0000 (GMT)
Received: from osmium.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AB959A00EE;
 Thu,  6 Feb 2020 14:17:22 +1100 (AEDT)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1] vfio-pci/nvlink2: Allow fallback to ibm,mmio-atsd[0]
Date: Thu,  6 Feb 2020 14:17:25 +1100
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20020603-0028-0000-0000-000003D7D5E5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020603-0029-0000-0000-0000249C365F
Message-Id: <426f75e09ac1a6879a6d51f592bf683c698b4bda.1580959044.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-05_06:2020-02-04,
 2020-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002060023
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
Cc: aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Older versions of skiboot only provide a single value in the device
tree property "ibm,mmio-atsd", even when multiple Address Translation
Shoot Down (ATSD) registers are present. This prevents NVLink2 devices
(other than the first) from being used with vfio-pci because vfio-pci
expects to be able to assign a dedicated ATSD register to each NVLink2
device.

However, ATSD registers can be shared among devices. This change
allows vfio-pci to fall back to sharing the register at index 0 if
necessary.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
 drivers/vfio/pci/vfio_pci_nvlink2.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_nvlink2.c b/drivers/vfio/pci/vfio_pci_nvlink2.c
index f2983f0f84be..851ba673882b 100644
--- a/drivers/vfio/pci/vfio_pci_nvlink2.c
+++ b/drivers/vfio/pci/vfio_pci_nvlink2.c
@@ -420,8 +420,17 @@ int vfio_pci_ibm_npu2_init(struct vfio_pci_device *vdev)
 
 	if (of_property_read_u64_index(hose->dn, "ibm,mmio-atsd", nvlink_index,
 			&mmio_atsd)) {
-		dev_warn(&vdev->pdev->dev, "No available ATSD found\n");
-		mmio_atsd = 0;
+		dev_warn(&vdev->pdev->dev,
+			 "No ibm,mmio-atsd[%d] found: trying ibm,mmio-atsd[0]\n",
+			 nvlink_index);
+		if (of_property_read_u64_index(hose->dn, "ibm,mmio-atsd", 0,
+				&mmio_atsd)) {
+			dev_warn(&vdev->pdev->dev, "No available ATSD found\n");
+			mmio_atsd = 0;
+		} else {
+			dev_warn(&vdev->pdev->dev,
+				 "Using fallback ibm,mmio-atsd[0] for ATSD.\n");
+		}
 	}
 
 	if (of_property_read_u64(npu_node, "ibm,device-tgt-addr", &tgt)) {
-- 
2.22.0.216.g00a2a96fc9

