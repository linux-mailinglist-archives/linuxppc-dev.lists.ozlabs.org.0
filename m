Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDB88C576E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 15:54:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tn/p9SaD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdyXL1bL7z3cVl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 23:54:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tn/p9SaD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=krishnak@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdyW73DQxz30ft
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 23:53:39 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44EDOrdm009536;
	Tue, 14 May 2024 13:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=1iY0s1zZhBBAfiAKp0LrIwCzbFzKqA5oCwjB82eWjYI=;
 b=tn/p9SaD6U9JThFOUxFMCU/QUg18sjeToJY+iyTU1thf/eWX2tjN8pxtSluxWQldgYIH
 Fx7UhZftjX10G+3cHFhC9Vz76VwTa/kKbl6lDtUPnVi71hOt2HwkZSpa/IVVgBxhfYPE
 22W8vVDM02SCVqZzBTJdQqYYTXu4S1U2p+hdcWHwVuuKtnN5ATC6QdSes2j21nF/X82G
 GwOEdSupaG0ZqzsqPSz8CEmX1xgr2/4i0FOT0/L4e5Xj3UHfOo1ED9bYrdMt+TCEyx6S
 Pi/hH3a2uORvg3BiNF41nU47v617J2Slz7+L9nxeZliL7zFm9ypmMtK8kaFnX1Rep+dU PA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y44fr0ra1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 13:53:27 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44EDrR6S021012;
	Tue, 14 May 2024 13:53:27 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y44fr0r9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 13:53:27 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44ECgWM2006769;
	Tue, 14 May 2024 13:53:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2mgmdk6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 13:53:26 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44EDrKKe56885598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 May 2024 13:53:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A7CA20040;
	Tue, 14 May 2024 13:53:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA51D2004D;
	Tue, 14 May 2024 13:53:14 +0000 (GMT)
Received: from li-a50b8fcc-3415-11b2-a85c-f1daa4f09788.ibm.com.com (unknown [9.171.90.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 May 2024 13:53:14 +0000 (GMT)
From: Krishna Kumar <krishnak@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] pci/hotplug/pnv_php: Fix hotplug driver crash on Powernv
Date: Tue, 14 May 2024 19:22:58 +0530
Message-ID: <20240514135303.176134-2-krishnak@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240514135303.176134-1-krishnak@linux.ibm.com>
References: <20240514135303.176134-1-krishnak@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Wa3IYBqgGVAMYRkKnq7NutEkVCdIPvp5
X-Proofpoint-ORIG-GUID: 3C96E-da0-NLomBqUxb7B7QoJvy98ow5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_07,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405140098
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Gaurav Batra <gbatra@linux.ibm.com>, linux-pci@vger.kernel.org, Brian King <brking@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, mahesh@linux.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krishna Kumar <krishnak@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Description of the problem: The hotplug driver for powerpc
(pci/hotplug/pnv_php.c) gives kernel crash when we try to
hot-unplug/disable the PCIe switch/bridge from the PHB.

Root Cause of Crash: The crash is due to the reason that, though the msi
data structure has been released during disable/hot-unplug path and it
has been assigned with NULL, still during unregistartion the code was
again trying to explicitly disable the msi which causes the Null pointer
dereference and kernel crash.

Proposed Fix : The fix is to correct the check during unregistration path
so that the code should not  try to invoke pci_disable_msi/msix() if its
data structure is already freed.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Gaurav Batra <gbatra@linux.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Brian King <brking@linux.vnet.ibm.com>

Signed-off-by: Krishna Kumar <krishnak@linux.ibm.com>
---
Command used for reproducing the bug:

    echo 0 > /sys/bus/pci/slots/C5/power

where C5 is slot associated with bridge.

Snippet of Crash:

 Kernel attempted to read user page (10) - exploit attempt? (uid: 0)
 BUG: Kernel NULL pointer dereference on read at 0x00000010
 Faulting instruction address: 0xc000000000fad7d4
 Oops: Kernel access of bad area, sig: 11 [#1]
 Hardware name: 5105-22E POWER9 0x4e1203 opal:v7.0-39-g4660e63a PowerNV
 NIP [c000000000fad7d4] mutex_lock+0x34/0x88
 LR [c000000000fad7c8] mutex_lock+0x28/0x88
 Call Trace:
 [c00000017075f940] [c000000000fad7c8] mutex_lock+0x28/0x88 (unreliable)
 [c00000017075f970] [c000000000214464] msi_lock_descs+0x28/0x3c
 [c00000017075f990] [c0000000008e8be8] pci_disable_msi+0x68/0xa8
 [c00000017075f9c0] [c00000000090f0a4] pnv_php_disable_irq+0x2a0/0x2b0
 [c00000017075fab0] [c00000000090f128] pnv_php_free_slot+0x74/0xc4
 [c00000017075fb30] [c000000000912184] pnv_php_disable_slot.part.0+0x1b8/0x24c
 [c00000017075fc00] [c000000000902df0] power_write_file+0xf8/0x18c
 [c00000017075fc80] [c0000000008f84d8] pci_slot_attr_store+0x40/0x5c
 [c00000017075fca0] [c0000000006b4834] sysfs_kf_write+0x64/0x78
 [c00000017075fcc0] [c0000000006b3300] kernfs_fop_write_iter+0x1b8/0x2dc
 [c00000017075fd10] [c0000000005b3eb0] vfs_write+0x224/0x4e8
 [c00000017075fdc0] [c0000000005b44b0] ksys_write+0x88/0x150
 [c00000017075fe10] [c000000000030864] system_call_exception+0x124/0x320
 [c00000017075fe50] [c00000000000cedc] system_call_vectored_common+0x15c/0x2ec
 --- interrupt: 3000 at 0x7fffb9748774


Root-Cause: Its safe to call pci_disable_msi() if its associated data structre are
not freed (during bailout path). But when the driver code disables the
bridge during hot-unplug operation, its msi data structure becomes NULL
(php_slot->pdev->dev.msi.data:0000000000000000).  This happens before
unregistration and during disable path in function
msi_device_data_release(). In this case, its not safe to explicitly call
pci_disable_msi/msix() due to NULL pointer dereference. But since the
current code does so, the crash is happening at the line
mutex_lock(&dev->msi.data->mutex).


FIX: In the current code, there are two paths to invoke
pci_disable_msi/msix(). In the error/bailout path, first argument of the
check - if(disable_device || irq > 0), i.e. disable_device is true, so
it will always invoke pci_disable_msi/msix(), it will never depend on
second argument. In this path it's fine to call pci_disable_msi/msix().
During the slot releasing/disable/hot-unpug path the disable_device is
false, irq is having old value which is making the overall check true
and causing the crash. Of course, we should not choose the old/stale
value of irq but should choose php_slot->irq for check.  Also, since
php_slot->irq value is always 0 before the check, so it does not matter
if it will not be included into the check.  So, the check can be formed
with only one argument i.e. disable_device.  Based on its value
pci_disable_msi/msix() will be invoked and this is the fix for the
crash. During the bailout path its value will be true and during the
hot-unplug operation on the bridge slot, its value will be false.

 drivers/pci/hotplug/pnv_php.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 694349be9d0a..573a41869c15 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -40,7 +40,6 @@ static void pnv_php_disable_irq(struct pnv_php_slot *php_slot,
 				bool disable_device)
 {
 	struct pci_dev *pdev = php_slot->pdev;
-	int irq = php_slot->irq;
 	u16 ctrl;
 
 	if (php_slot->irq > 0) {
@@ -59,7 +58,7 @@ static void pnv_php_disable_irq(struct pnv_php_slot *php_slot,
 		php_slot->wq = NULL;
 	}
 
-	if (disable_device || irq > 0) {
+	if (disable_device) {
 		if (pdev->msix_enabled)
 			pci_disable_msix(pdev);
 		else if (pdev->msi_enabled)
-- 
2.45.0

