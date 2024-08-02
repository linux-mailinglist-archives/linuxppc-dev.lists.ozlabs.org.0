Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF29946342
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 20:34:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eOIY2KL0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbDyB6Pclz3fVv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 04:34:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eOIY2KL0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbDxW5VZfz3cY0
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2024 04:33:51 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472FS5im012496;
	Fri, 2 Aug 2024 18:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pp1; bh=elPlBGjEdya+l
	t9bcuYyxNIb4Z4d3rD7n1uLu0NB8MI=; b=eOIY2KL0XU6G1Re5XYppob5wkQq9u
	92974YGGFR11dOgk3SGoU4hxX/aT+IT+mrmfMaucLIb1kWJH5HXeFF6X9SjmYVWJ
	tC8ZogXWlj3ZukRKUPpCQ4nlGl7mXmbN6SJj/aFrsuy4Lu78T/u/tZOJJZhA15Ym
	E+VIVPLlsoX/2xGcGY6Y3j+zHZ6o0Jkce/Fi1WeRmiZHS4D60Khu1VsunrARcZCv
	QKR7YvTfzRLhr573zyjVb8dZ7ovXfbYZo8JmPlAdSfTh2rPauw31c36PdjmvY7GT
	H7U2BIB3UplonQAz9MbY9Y9V3J7QSt8SxkCd0SqRo+YZzOK0Dpprt0NvQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40s1pf0f3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 18:33:41 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 472IXe8L015002;
	Fri, 2 Aug 2024 18:33:40 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40s1pf0f3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 18:33:40 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 472FwQBw011151;
	Fri, 2 Aug 2024 18:33:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40ncqn8hp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 18:33:39 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 472IXXiV34144994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Aug 2024 18:33:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6889C20040;
	Fri,  2 Aug 2024 18:33:33 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3C8420043;
	Fri,  2 Aug 2024 18:33:29 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com.com (unknown [9.195.47.40])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Aug 2024 18:33:29 +0000 (GMT)
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3] PCI: Fix crash during pci_dev hot-unplug on pseries KVM guest
Date: Sat,  3 Aug 2024 00:03:25 +0530
Message-ID: <20240802183327.1309020-1-amachhiw@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ooe2HdKMnjn5F104fmgW3kHKYsawc1RM
X-Proofpoint-GUID: Uwml1BHK5GZUEjBjn1qqDSk0ZCJ_GEeZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_14,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxlogscore=822 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408020127
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
Cc: Stefan Bader <stefan.bader@canonical.com>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Lukas Wunner <lukas@wunner.de>, Kowshik Jois B S <kowsjois@linux.ibm.com>, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Lizhi Hou <lizhi.hou@amd.com>, kernel-team@lists.ubuntu.com, Amit Machhiwal <amachhiw@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
of a PCI device attached to a PCI-bridge causes following kernel Oops on
a pseries KVM guest:

 RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
 Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
 BUG: Unable to handle kernel data access on read at 0x10ec00000048
 Faulting instruction address: 0xc0000000012d8728
 Oops: Kernel access of bad area, sig: 11 [#1]
 LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
<snip>
 NIP [c0000000012d8728] __of_changeset_entry_invert+0x10/0x1ac
 LR [c0000000012da7f0] __of_changeset_revert_entries+0x98/0x180
 Call Trace:
 [c00000000bcc3970] [c0000000012daa60] of_changeset_revert+0x58/0xd8
 [c00000000bcc39c0] [c000000000d0ed78] of_pci_remove_node+0x74/0xb0
 [c00000000bcc39f0] [c000000000cdcfe0] pci_stop_bus_device+0xf4/0x138
 [c00000000bcc3a30] [c000000000cdd140] pci_stop_and_remove_bus_device_locked+0x34/0x64
 [c00000000bcc3a60] [c000000000cf3780] remove_store+0xf0/0x108
 [c00000000bcc3ab0] [c000000000e89e04] dev_attr_store+0x34/0x78
 [c00000000bcc3ad0] [c0000000007f8dd4] sysfs_kf_write+0x70/0xa4
 [c00000000bcc3af0] [c0000000007f7248] kernfs_fop_write_iter+0x1d0/0x2e0
 [c00000000bcc3b40] [c0000000006c9b08] vfs_write+0x27c/0x558
 [c00000000bcc3bf0] [c0000000006ca168] ksys_write+0x90/0x170
 [c00000000bcc3c40] [c000000000033248] system_call_exception+0xf8/0x290
 [c00000000bcc3e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
<snip>

A git bisect pointed this regression to be introduced via [1] that added
a mechanism to create device tree nodes for parent PCI bridges when a
PCI device is hot-plugged.

The Oops is caused when `pci_stop_dev()` tries to remove a non-existing
device-tree node associated with the pci_dev that was earlier
hot-plugged and was attached under a pci-bridge. The PCI dev header
`dev->hdr_type` being 0, results a conditional check done with
`pci_is_bridge()` into false. Consequently, a call to
`of_pci_make_dev_node()` to create a device node is never made. When at
a later point in time, in the device node removal path, a memcpy is
attempted in `__of_changeset_entry_invert()`; since the device node was
never created, results in an Oops due to kernel read access to a bad
address.

To fix this issue, the patch introduces a new flag OF_CREATE_WITH_CSET
to keep track of device nodes created via `of_pci_make_dev_node()` and
later attempt to destroy only such device nodes which have this flag
set.

[1] commit 407d1a51921e ("PCI: Create device tree node for bridge")

Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
---
Changes since v2:
    * Drop v2 changes and introduce a different approach from Lizhi discussed
      over the v2 of this patch
    * V2: https://lore.kernel.org/all/20240715080726.2496198-1-amachhiw@linux.ibm.com/
Changes since v1:
    * Included Lizhi's suggested changes on V1
    * Fixed below two warnings from Lizhi's changes and rearranged the cleanup
      part a bit in `of_pci_make_dev_node`
	drivers/pci/of.c:611:6: warning: no previous prototype for ‘of_pci_free_node’ [-Wmissing-prototypes]
	  611 | void of_pci_free_node(struct device_node *np)
	      |      ^~~~~~~~~~~~~~~~               
	drivers/pci/of.c: In function ‘of_pci_make_dev_node’:
	drivers/pci/of.c:696:1: warning: label ‘out_destroy_cset’ defined but not used [-Wunused-label]
	  696 | out_destroy_cset:       
	      | ^~~~~~~~~~~~~~~~  
    * V1: https://lore.kernel.org/all/20240703141634.2974589-1-amachhiw@linux.ibm.com/

 drivers/pci/of.c   | 3 ++-
 include/linux/of.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index dacea3fc5128..bc455370143e 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -653,7 +653,7 @@ void of_pci_remove_node(struct pci_dev *pdev)
 	struct device_node *np;
 
 	np = pci_device_to_OF_node(pdev);
-	if (!np || !of_node_check_flag(np, OF_DYNAMIC))
+	if (!np || !of_node_check_flag(np, OF_CREATE_WITH_CSET))
 		return;
 	pdev->dev.of_node = NULL;
 
@@ -712,6 +712,7 @@ void of_pci_make_dev_node(struct pci_dev *pdev)
 	if (ret)
 		goto out_free_node;
 
+	of_node_set_flag(np, OF_CREATE_WITH_CSET);
 	np->data = cset;
 	pdev->dev.of_node = np;
 	kfree(name);
diff --git a/include/linux/of.h b/include/linux/of.h
index 85b60ac9eec5..5faa5a1198c6 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -153,6 +153,7 @@ extern struct device_node *of_stdout;
 #define OF_POPULATED_BUS	4 /* platform bus created for children */
 #define OF_OVERLAY		5 /* allocated for an overlay */
 #define OF_OVERLAY_FREE_CSET	6 /* in overlay cset being freed */
+#define OF_CREATE_WITH_CSET	7 /* Created by of_changeset_create_node */
 
 #define OF_BAD_ADDR	((u64)-1)
 

base-commit: 948752d2e010e11b56a877975e7e9158d6d31823
-- 
2.45.2

