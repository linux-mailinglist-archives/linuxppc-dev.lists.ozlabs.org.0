Return-Path: <linuxppc-dev+bounces-2787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5259BA737
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 18:14:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhLlS0pCQz2yNB;
	Mon,  4 Nov 2024 04:13:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730653988;
	cv=none; b=R93L6vjlDsb7BAEun6sfTlD2BJgSfw65atYo7UOLc/WANSsZ2+O6lwZef8eyJyf5Nnm9DYOO9Y28DE0ss0EKP+qdIIJhb6UMvY6P3+5K6CQ3R/jhNfuuafBFNCXMvoMfImboae1+ycHaUUikl+0gNzyRuC0N1+LH92CWC+Mi2+tqfAgPjgsKfvkJB81oHKS1A1jWl08VG3clW6BXY7xCfJKVHXjNnQCB0MDGVMT66CTqHF6GAFkBMc39z9XrMtOWVaOhBzcRt5dNhxhFfHkA0prvR8ZSPHNh3D903uVaCyCP9NBwjh3kCM1UwemcW5WO5zs3EskXou42BoMAjbq27w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730653988; c=relaxed/relaxed;
	bh=10K/pHYuHRvcb/hQtEfLwKyPC0O5Gkg5XgxShtGh7Kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XeUgRpGUl8lyM2G2RoSTnYMNe5glIu+qiy4onOn6yWurDmUGxNJSjFDUaG+OmJ2jgwNWcl24wN6fKk/YPhVKVxsjLzYaIa14TRRCFcScOLe08HwDFrhlR8ssUzalqFqth9b13mXD27sGZn+g5L82Yw6tXS4nDFKeYhsPeomDf2HbA23x2Ta8D41Liyvyt/SXNiwHpoHAaFQwG9nmWt6HyvTTM0VDn8RvzHIDC2cobBWRA+UnQgql/yRvqUVrohGYi1ZvJjSPN80ln8Hze66w7WsUqEwwZ3o3wW4AxJoebioS8KC71AqO6vdyhrhkpkQV9dccz64VsksvhcN49juobA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=NgM/ElQm; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=NgM/ElQm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhLlP4vLZz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 04:13:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653481;
	bh=Knwg+Z2CkMm4IK1d+HsEFrKnqSyqDlXFkrBwo+TwWXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NgM/ElQmvf59/YWbjDqRbVuMEl0pDjY+ObTO6d8h7LUcSEHYmSbo42n8NiaNsD+YV
	 W/SF6kIvUGW+OWHAuixbbmiWBTAsGaJ1bUJJ75TWxvkGrAhk2IGeTOWoy2uiVdU/7n
	 BT8O0X22pGVKUUwyGIBh7YJIs16haYaygPErOxWs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:36 +0000
Subject: [PATCH v2 07/10] sysfs: treewide: constify attribute callback of
 bin_attribute::llseek()
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
Content-Transfer-Encoding: 8bit
Message-Id: <20241103-sysfs-const-bin_attr-v2-7-71110628844c@weissschuh.net>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "David E. Box" <david.e.box@linux.intel.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Logan Gunthorpe <logang@deltatee.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org, 
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=1737;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Knwg+Z2CkMm4IK1d+HsEFrKnqSyqDlXFkrBwo+TwWXc=;
 b=7BBy1cB2402AMdsGbWDhocbKrbJW2MgG/pXJPZgbbTP5a7oCuUuoE2vbVvQiK5iVSTaOOfRv6
 UmT00qXCNvtDaYwwoMp7tKP4VGZJJQhLqLk6CjFCbnS/F84qc7ejcEm
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The llseek() callbacks should not modify the struct
bin_attribute passed as argument.
Enforce this by marking the argument as const.

As there are not many callback implementers perform this change
throughout the tree at once.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/pci/pci-sysfs.c | 2 +-
 include/linux/sysfs.h   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 0ad3427228b12aa95325c6fc00e9686740559238..49bee70f7d375bca056476acd6528d19ead2c419 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -841,7 +841,7 @@ static const struct attribute_group pci_dev_config_attr_group = {
 static __maybe_unused loff_t
 pci_llseek_resource(struct file *filep,
 		    struct kobject *kobj __always_unused,
-		    struct bin_attribute *attr,
+		    const struct bin_attribute *attr,
 		    loff_t offset, int whence)
 {
 	return fixed_size_llseek(filep, offset, whence, attr->size);
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 9fcdc8cd3118f359742bfd8b708d5c3eff511042..cb2a5e277c2384f2e8add8fbf2907e8a819576ec 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -307,7 +307,7 @@ struct bin_attribute {
 			char *, loff_t, size_t);
 	ssize_t (*write)(struct file *, struct kobject *, struct bin_attribute *,
 			 char *, loff_t, size_t);
-	loff_t (*llseek)(struct file *, struct kobject *, struct bin_attribute *,
+	loff_t (*llseek)(struct file *, struct kobject *, const struct bin_attribute *,
 			 loff_t, int);
 	int (*mmap)(struct file *, struct kobject *, const struct bin_attribute *attr,
 		    struct vm_area_struct *vma);

-- 
2.47.0


