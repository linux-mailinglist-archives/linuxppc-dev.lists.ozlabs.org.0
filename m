Return-Path: <linuxppc-dev+bounces-625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2962961A15
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 00:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtjDj41Gfz2y65;
	Wed, 28 Aug 2024 08:40:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=173.37.86.75
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724778228;
	cv=none; b=lfL+/K594yrtTD/bpj9Jwr2SvEFOSjLnf+u+BLn2yQq4GLN8iB7qYRTiYOYDAqJGtDSrGpamoNgg6bzbGxe5IHpEfS0eYqM8h/EjdDiz3FlK5r//46+1RFjqeEG2HMFBOBcs04ybegN0zAfCmNxZsGWSUep6OWwuGmkB78ewvAbi/nlupTWTI/eVPl1Ty9Adozn6kEZabxpybv0kqa/+ptrOHCLJbBG0sVkW+SeEiMj/pWUH2ISOPK2gxrJgSWrfERnoRHLgKsk8Ax8EXp5RxUq4L1qRqzjlA4dPLSqVEPTHBiDTru7vesf6mV+ooaP+Ai8BNkF1ti4bwVuv9uqGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724778228; c=relaxed/relaxed;
	bh=RfG56hGqjnMogAQ1kemhMsBw/PeTnTehLen/hEWIk60=;
	h=X-Greylist:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:From:To:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Auto-Response-Suppress:X-Outbound-SMTP-Client:X-Outbound-Node;
	b=RJK27hLLUXPfa/R07cGEhmMHrPVlDM5nPgoXzx2eHTASTsSPlCyU92SG0hTttnnGT/UeYXPGlmp6GiVBnPJCHHSS5WtWOVKLNr5hkZee4M+fDAb3mYJHAY/3GJLexcfUJfCIkx6eqdHu8mHtQfmOg1TIjIwDuNTXz9sC9TGamVPZbjMHonNCD0eVVdBewznCHLzsssMIY/HvDn6O6H9NsUY0l3DhVlpuHqUauXYiXZZUXVBhn0PQW0ObfCWZNRay+QSpvRZFdkVmw64hpy3o5Ym5jSZ3mLgfONLnEtIeE9qq5QRpGQ3qNlDM1O8WMBJXGIVOcO5FBAMYr8X9XZDXig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=JWQMskvV; dkim-atps=neutral; spf=pass (client-ip=173.37.86.75; helo=rcdn-iport-4.cisco.com; envelope-from=oocheret@cisco.com; receiver=lists.ozlabs.org) smtp.mailfrom=cisco.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=JWQMskvV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.75; helo=rcdn-iport-4.cisco.com; envelope-from=oocheret@cisco.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 123 seconds by postgrey-1.37 at boromir; Wed, 28 Aug 2024 03:03:43 AEST
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtYlz0ZGNz2xwH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 03:03:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1897; q=dns/txt; s=iport;
  t=1724778223; x=1725987823;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RfG56hGqjnMogAQ1kemhMsBw/PeTnTehLen/hEWIk60=;
  b=JWQMskvV1f/X+PmL7rGSCLIxyuHf8JMFI05H96wktpghyb92Hmhijf/z
   vRXMEajpoVshNvdW4DakQtRJpmwbMGgDA9GyAzQ8mBFf28O0ODkmQdyYI
   QjUC2T+P6G0PoOdymedrqRX+mpgkEMVU0AZbVZL5KzFwuOwWOc3qWlP6n
   w=;
X-CSE-ConnectionGUID: oo54NwhnS2aKVTzum9nITQ==
X-CSE-MsgGUID: /f30QSFiQTGLLcRexs+ZgA==
X-IronPort-AV: E=Sophos;i="6.10,180,1719878400"; 
   d="scan'208";a="251946415"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 17:00:22 +0000
Received: from sjc-ads-3421.cisco.com (sjc-ads-3421.cisco.com [171.68.249.119])
	by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTP id 47RH0LmO008603;
	Tue, 27 Aug 2024 17:00:21 GMT
From: Oleksandr Ocheretnyi <oocheret@cisco.com>
To: xe-linux-external@cisco.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Oleksandr Ocheretnyi <oocheret@cisco.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] powerpc/pci: restore LSI mappings on card present state change
Date: Tue, 27 Aug 2024 09:57:35 -0700
Message-Id: <20240827165738.1083422-1-oocheret@cisco.com>
X-Mailer: git-send-email 2.35.6
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.249.119, sjc-ads-3421.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com

Commit 450be4960a0f ("powerpc/pci: Remove LSI mappings on device
teardown") frees irq descriptors on PCIe hotplug link change event
(Link Down), but the disposed mappings are not restored back on PCIe
hotplug link change event (Card present).

This change restores IRQ mappings disposed earlier when pcieport
link's gone down. So, the call pci_read_irq_line is invoked again
on pcieport's state change (Card present).

Fixes 450be4960a0f ("powerpc/pci: Remove LSI mappings on device teardown")
Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
---
 arch/powerpc/kernel/pci-common.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index eac84d687b53..a0e7cab2baa7 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -390,22 +390,32 @@ static void ppc_pci_intx_release(struct kref *kref)
 	kfree(vi);
 }
 
+static int pci_read_irq_line(struct pci_dev *pci_dev);
+
 static int ppc_pci_unmap_irq_line(struct notifier_block *nb,
 			       unsigned long action, void *data)
 {
 	struct pci_dev *pdev = to_pci_dev(data);
 
-	if (action == BUS_NOTIFY_DEL_DEVICE) {
-		struct pci_intx_virq *vi;
-
-		mutex_lock(&intx_mutex);
-		list_for_each_entry(vi, &intx_list, list_node) {
-			if (vi->virq == pdev->irq) {
-				kref_put(&vi->kref, ppc_pci_intx_release);
-				break;
+	switch (action) {
+		case BUS_NOTIFY_DEL_DEVICE:
+			{
+				struct pci_intx_virq *vi;
+
+				mutex_lock(&intx_mutex);
+				list_for_each_entry(vi, &intx_list, list_node) {
+					if (vi->virq == pdev->irq) {
+						kref_put(&vi->kref, ppc_pci_intx_release);
+						break;
+					}
+				}
+				mutex_unlock(&intx_mutex);
 			}
-		}
-		mutex_unlock(&intx_mutex);
+			break;
+
+		case BUS_NOTIFY_ADD_DEVICE:
+			pci_read_irq_line(pdev);
+			break;
 	}
 
 	return NOTIFY_DONE;
-- 
2.39.3


