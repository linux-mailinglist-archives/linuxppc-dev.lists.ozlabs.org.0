Return-Path: <linuxppc-dev+bounces-15282-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C97CF56F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 20:53:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlQ340vGfz2yF1;
	Tue, 06 Jan 2026 06:53:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767616403;
	cv=none; b=GyC+J+bkpXykU42RfRvZ8DPFmBQoJRkfKOdltwTyDJppGTxk91zV1M9hT04vosyMRZX6r7Vko84rlntQJNT80gRH7FjBSvdbzhSh0jIcfuiUHMPVX+KoDbTZdRmRhSnnetd0z2u38pfnM+VtibggIGxnICnGng3ziYSRD1xjEkGmtyJRoAjYIp8WlpNcubdwFBZBBXUu1xNdm+0b09m2/oEpPAcHqHEWJeioiSYZDIBuin1Pinq+ySVcvISnSmHXDoKehLDPUVR/J7zuzVN+qxbhkXlgbdIOM1amNc42E+7R60FAdOXYfD2n7e9PaMzc3JBw++4Y63uxb6zQxGVvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767616403; c=relaxed/relaxed;
	bh=HAJ50QDzcNGq8LvMiguZDX4QYKgW6XNq4PfpmpJ7fsI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GtAkIQNf5drfbDmLhqv/43xjMTSS48ni8eRfFQd9x3Sx/kAdV4q+F6SYvVkmt27m4jMQtWffz0uOULvaOEyqq3ZMsQSKRxXaWJ/X8dIHSJANNY1nHvMBrAMxWvH333WGNYDA5ICD5CVDTMVVrNYwg/YpG5k7Ohf5iQWGLL08NGWburjkHkU4W70eoBveKyLaQizGGHwh8J9qZQK8J6SNJ8rVb65FmU/GC+zA8My0KYxy/vZTPENZCL4wxrHb8aqit5HojDXg9lAoHeLjVhG6n38uKezrSVcEHacPRMxZLOglbgaKKOphvrKAiG/AuCgkxf9ZN5/0cJ7EjDdoQN0g7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QiR84lM3; dkim-atps=neutral; spf=pass (client-ip=95.215.58.182; helo=out-182.mta1.migadu.com; envelope-from=sunliming@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QiR84lM3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.182; helo=out-182.mta1.migadu.com; envelope-from=sunliming@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 398 seconds by postgrey-1.37 at boromir; Mon, 05 Jan 2026 23:33:20 AEDT
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlDH42xTrz2x9W
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 23:33:19 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767615952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HAJ50QDzcNGq8LvMiguZDX4QYKgW6XNq4PfpmpJ7fsI=;
	b=QiR84lM3TZB4l+3xFAitFbeO9zeHAOpLNHAtziktyk5eD/4piimyWCNMsgcWzw1q2r5yg5
	EqMXve8AXKAI+q/VAaonszFQzyYB4DeuJ7ay2oNGuM1ZHfEFON1jJEsD5yOP4u1zCVj3dF
	XetPVVHB25SXhFSHkH8LPmg2k50XLH0=
From: sunliming@linux.dev
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au
Cc: npiggin@gmail.com,
	chleroy@kernel.org,
	bhelgaas@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunliming <sunliming@kylinos.cn>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] PCI: pnv_php: Fix smatch warnings about "address of NULL pointer"
Date: Mon,  5 Jan 2026 20:23:45 +0800
Message-Id: <20260105122345.157991-1-sunliming@linux.dev>
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
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: sunliming <sunliming@kylinos.cn>

Fix below smatch warnings:
drivers/pci/hotplug/pnv_php.c:710 pnv_php_alloc_slot() warn: address of NULL pointer
'php_slot->bus'

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202601050123.5JEZ4Znh-lkp@intel.com/
Signed-off-by: sunliming <sunliming@kylinos.cn>
---
 drivers/pci/hotplug/pnv_php.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index c5345bff9a55..a22b8d69a479 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -801,6 +801,9 @@ static struct pnv_php_slot *pnv_php_alloc_slot(struct device_node *dn)
 		return NULL;
 	}
 
+	php_slot->bus	                = bus;
+	php_slot->pdev	                = bus->self;
+
 	/* Allocate workqueue for this slot's interrupt handling */
 	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot->name);
 	if (!php_slot->wq) {
@@ -818,8 +821,6 @@ static struct pnv_php_slot *pnv_php_alloc_slot(struct device_node *dn)
 	kref_init(&php_slot->kref);
 	php_slot->state	                = PNV_PHP_STATE_INITIALIZED;
 	php_slot->dn	                = dn;
-	php_slot->pdev	                = bus->self;
-	php_slot->bus	                = bus;
 	php_slot->id	                = id;
 	php_slot->power_state_check     = false;
 	php_slot->slot.ops              = &php_slot_ops;
-- 
2.25.1


