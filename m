Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D6401934
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 11:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H33Y0600Kz2yZc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 19:50:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P4EEqLXb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=P4EEqLXb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H33XK3wzyz2xYv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Sep 2021 19:49:37 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1869Y0BG063343; Mon, 6 Sep 2021 05:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Zp/hKbHxmVJIjen8PsqG35YaaJmd5NOaxBF0c/5Vh14=;
 b=P4EEqLXbzFHsyqICmRHA0qjhh8DdkH5du5msFh88ZhIePXhpQdTqvoFDhgvfxn+KBNU0
 hrePIYZCYLRCb6DqUOoHoHB0mNsB6xsqbwFgi+fbk9oidbxhiQ8PJDUueyiv8zhxy5PF
 yU7vuGUZHdItBXr0jOJu1iefi8vHIajLT2BkBYXOI4I3+jzcP8fK2g51teQBmd+XyICO
 NS6+HRS1CwEwtyWUVBdQ5TXQLmAlp53qhv1zgSG+6xHYWFtfiSVX/yJnTTqW6qmX5784
 8gyMhVO3+Pwbn24yKQ08lLlP8bXjpqtbFfEj8VpmPBFUN2b5jWKlrLKXzwzDAxCjulrS Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3awfyd14h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 05:49:34 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1869Y2Mc063575;
 Mon, 6 Sep 2021 05:49:33 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3awfyd14gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 05:49:33 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1869lNaS022341;
 Mon, 6 Sep 2021 09:49:32 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3av0e91w7u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 09:49:31 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1869nShf46530834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Sep 2021 09:49:28 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 852D542049;
 Mon,  6 Sep 2021 09:49:28 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D66B4203F;
 Mon,  6 Sep 2021 09:49:28 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Sep 2021 09:49:28 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 1/5] s390/pci: refresh function handle in iomap
Date: Mon,  6 Sep 2021 11:49:23 +0200
Message-Id: <20210906094927.524106-2-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210906094927.524106-1-schnelle@linux.ibm.com>
References: <20210906094927.524106-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ikp-rEgA3uulDFrfX70vSh3-lQgClUAr
X-Proofpoint-ORIG-GUID: j-W58HU9k9Th5eBgCvTXhPw33rheMzUG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_05:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1011 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060060
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
Cc: linux-s390@vger.kernel.org, Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, Linas Vepstas <linasvepstas@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The function handle of a PCI function is updated when disabling or
enabling it as well as when the function's availability changes or it
enters the error state.

Until now this only occurred either while there is no struct pci_dev
associated with the function yet or the function became unavailable.
This meant that leaving a stale function handle in the iomap either
didn't happen because there was no iomap yet or it lead to errors on PCI
access but so would the correct disabled function handle.

In the future a CLP Set PCI Function Disable/Enable cycle during PCI
device recovery may be done while the device is bound to a driver.  In
this case we must update the iomap associated with the now-stale
function handle to ensure that the resulting zPCI instruction references
an accurate function handle.

Since the function handle is accessed by the PCI accessor helpers
without locking use READ_ONCE()/WRITE_ONCE() to mark this access and
prevent compiler optimizations that would move the load/store.

With that infrastructure in place let's also properly update the
function handle in the existing cases. This makes sure that in the
future debugging of a zPCI function access through the handle will
show an up to date handle reducing the chance of confusion. Also it
makes sure we have one single place where a zPCI function handle is
updated after initialization.

Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 arch/s390/include/asm/pci.h |  1 +
 arch/s390/pci/pci.c         | 36 ++++++++++++++++++++++++++++++++----
 arch/s390/pci/pci_event.c   |  6 +++---
 arch/s390/pci/pci_insn.c    |  4 ++--
 4 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/arch/s390/include/asm/pci.h b/arch/s390/include/asm/pci.h
index e4803ec51110..5e6cba22a801 100644
--- a/arch/s390/include/asm/pci.h
+++ b/arch/s390/include/asm/pci.h
@@ -211,6 +211,7 @@ int zpci_deconfigure_device(struct zpci_dev *zdev);
 int zpci_register_ioat(struct zpci_dev *, u8, u64, u64, u64);
 int zpci_unregister_ioat(struct zpci_dev *, u8);
 void zpci_remove_reserved_devices(void);
+void zpci_update_fh(struct zpci_dev *zdev, u32 fh);
 
 /* CLP */
 int clp_setup_writeback_mio(void);
diff --git a/arch/s390/pci/pci.c b/arch/s390/pci/pci.c
index e7e6788d75a8..af22778551c1 100644
--- a/arch/s390/pci/pci.c
+++ b/arch/s390/pci/pci.c
@@ -481,6 +481,34 @@ static void zpci_free_iomap(struct zpci_dev *zdev, int entry)
 	spin_unlock(&zpci_iomap_lock);
 }
 
+static void zpci_do_update_iomap_fh(struct zpci_dev *zdev, u32 fh)
+{
+	int bar, idx;
+
+	spin_lock(&zpci_iomap_lock);
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (!zdev->bars[bar].size)
+			continue;
+		idx = zdev->bars[bar].map_idx;
+		if (!zpci_iomap_start[idx].count)
+			continue;
+		WRITE_ONCE(zpci_iomap_start[idx].fh, zdev->fh);
+	}
+	spin_unlock(&zpci_iomap_lock);
+}
+
+void zpci_update_fh(struct zpci_dev *zdev, u32 fh)
+{
+	if (!fh || zdev->fh == fh)
+		return;
+
+	zdev->fh = fh;
+	if (zpci_use_mio(zdev))
+		return;
+	if (zdev->has_resources && zdev_enabled(zdev))
+		zpci_do_update_iomap_fh(zdev, fh);
+}
+
 static struct resource *__alloc_res(struct zpci_dev *zdev, unsigned long start,
 				    unsigned long size, unsigned long flags)
 {
@@ -668,7 +696,7 @@ int zpci_enable_device(struct zpci_dev *zdev)
 	if (clp_enable_fh(zdev, &fh, ZPCI_NR_DMA_SPACES))
 		rc = -EIO;
 	else
-		zdev->fh = fh;
+		zpci_update_fh(zdev, fh);
 	return rc;
 }
 
@@ -679,14 +707,14 @@ int zpci_disable_device(struct zpci_dev *zdev)
 
 	cc = clp_disable_fh(zdev, &fh);
 	if (!cc) {
-		zdev->fh = fh;
+		zpci_update_fh(zdev, fh);
 	} else if (cc == CLP_RC_SETPCIFN_ALRDY) {
 		pr_info("Disabling PCI function %08x had no effect as it was already disabled\n",
 			zdev->fid);
 		/* Function is already disabled - update handle */
 		rc = clp_refresh_fh(zdev->fid, &fh);
 		if (!rc) {
-			zdev->fh = fh;
+			zpci_update_fh(zdev, fh);
 			rc = -EINVAL;
 		}
 	} else {
@@ -768,7 +796,7 @@ int zpci_scan_configured_device(struct zpci_dev *zdev, u32 fh)
 {
 	int rc;
 
-	zdev->fh = fh;
+	zpci_update_fh(zdev, fh);
 	/* the PCI function will be scanned once function 0 appears */
 	if (!zdev->zbus->bus)
 		return 0;
diff --git a/arch/s390/pci/pci_event.c b/arch/s390/pci/pci_event.c
index c856f80cb21b..e868d996ec5b 100644
--- a/arch/s390/pci/pci_event.c
+++ b/arch/s390/pci/pci_event.c
@@ -76,7 +76,7 @@ void zpci_event_error(void *data)
 
 static void zpci_event_hard_deconfigured(struct zpci_dev *zdev, u32 fh)
 {
-	zdev->fh = fh;
+	zpci_update_fh(zdev, fh);
 	/* Give the driver a hint that the function is
 	 * already unusable.
 	 */
@@ -117,7 +117,7 @@ static void __zpci_event_availability(struct zpci_ccdf_avail *ccdf)
 		if (!zdev)
 			zpci_create_device(ccdf->fid, ccdf->fh, ZPCI_FN_STATE_STANDBY);
 		else
-			zdev->fh = ccdf->fh;
+			zpci_update_fh(zdev, ccdf->fh);
 		break;
 	case 0x0303: /* Deconfiguration requested */
 		if (zdev) {
@@ -126,7 +126,7 @@ static void __zpci_event_availability(struct zpci_ccdf_avail *ccdf)
 			 */
 			if (zdev->state != ZPCI_FN_STATE_CONFIGURED)
 				break;
-			zdev->fh = ccdf->fh;
+			zpci_update_fh(zdev, ccdf->fh);
 			zpci_deconfigure_device(zdev);
 		}
 		break;
diff --git a/arch/s390/pci/pci_insn.c b/arch/s390/pci/pci_insn.c
index 2e43996159f0..28d863aaafea 100644
--- a/arch/s390/pci/pci_insn.c
+++ b/arch/s390/pci/pci_insn.c
@@ -163,7 +163,7 @@ static inline int zpci_load_fh(u64 *data, const volatile void __iomem *addr,
 			       unsigned long len)
 {
 	struct zpci_iomap_entry *entry = &zpci_iomap_start[ZPCI_IDX(addr)];
-	u64 req = ZPCI_CREATE_REQ(entry->fh, entry->bar, len);
+	u64 req = ZPCI_CREATE_REQ(READ_ONCE(entry->fh), entry->bar, len);
 
 	return __zpci_load(data, req, ZPCI_OFFSET(addr));
 }
@@ -244,7 +244,7 @@ static inline int zpci_store_fh(const volatile void __iomem *addr, u64 data,
 				unsigned long len)
 {
 	struct zpci_iomap_entry *entry = &zpci_iomap_start[ZPCI_IDX(addr)];
-	u64 req = ZPCI_CREATE_REQ(entry->fh, entry->bar, len);
+	u64 req = ZPCI_CREATE_REQ(READ_ONCE(entry->fh), entry->bar, len);
 
 	return __zpci_store(data, req, ZPCI_OFFSET(addr));
 }
-- 
2.25.1

