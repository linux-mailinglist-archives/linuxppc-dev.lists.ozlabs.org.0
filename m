Return-Path: <linuxppc-dev+bounces-2785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2C89BA735
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 18:13:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhLlQ2VRBz2yS0;
	Mon,  4 Nov 2024 04:13:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730653986;
	cv=none; b=TTymaqmUXIzWFK3sd3G8xeqDAL0OlKiRYeyFbRZcm1SkunOuVvHbn5RiPQjt9YGfkBh+i2wXZjl+ZtSWUhyKQxaIY+gIU2i9lwrbB17eIdo2khKW7oTgx4gsP0NbIg0BSnbpoFdMAVY2yan+6kUX6dVGSCR/BZGpAKkOzK6UeNoCDcoZwQ+TEF2PbpVPU6pE5SEccCmQIa99juNXwBYy8JBoRvJ1slphg985H+lP1GINt8hp6/E0gXd+a3dPav6O7BI9wqxUy5Vdh6R9w11cvkEh0TVNGQKVzOLica6CJCB6E1EshTCc2DNUZpUKBGNuUuHgThCqkX7uT64Dzmp3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730653986; c=relaxed/relaxed;
	bh=Sqi+9yPBwnc52qxKzE5d0ZY2IIwQxedd5SqkbLgj8uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CGD9zpwDEzK5v6YWW/L0a1wDvHfCLw525fx5flRsPhmSdiz4ZoFXdqFWuf+RWuESqPU+N5PuNzKfuU8n5rtBTSlO3mAZkVLppb7bcHcekc6LTXIr8vV8xbIhlyyHGhAz/VIBHhVBhWTN01GdmkdAHblJM0pp5jRyawWTBxyBoM83VMBsf6JhsfeFrfDZkqOk72d3h/7N8u+HOJWDhKO7PK0OtcK7EhLi9WnaDmY5pJO2cCrBqw4ptwVjaDV/uizCIislSDgD05nZR9Pgqu+DM1Anx4Ic3AcM/XUyE4pmH7ADdouXQUaYPCvaV8dY+RrzghfxurWtbzG1jC9kDd50XQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=gAex2VJy; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=gAex2VJy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhLlM4Wwhz2yNv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 04:13:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653482;
	bh=omnzY7OVUHnekZ/bUX8pXaM2rzeR5oe1Izmsxqjd69Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gAex2VJyMV+OiFkklrV8IrICkrh78EMUGYE6sgF6izsK/E9bdOLP+ue1pMfx65KEP
	 daDJhG0bHjOZvxSIVoZOVufQPlLYRdXOaAnYLf8bMNfx7N7rX5CM0q0eWD9GRIOclJ
	 PZ80lLezOY62im86G8xcV8ntzX7D+eMJVrF5nUUY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:32 +0000
Subject: [PATCH v2 03/10] PCI/sysfs: Calculate bin_attribute size through
 bin_size()
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
Message-Id: <20241103-sysfs-const-bin_attr-v2-3-71110628844c@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=2359;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=omnzY7OVUHnekZ/bUX8pXaM2rzeR5oe1Izmsxqjd69Q=;
 b=QEHmCC4IyJCPeU5OBXq34EhCHkpPKQglOlOaOSow6b0xRNSB6n8UoneN+GL6/CGyBOY6ZhYUm
 LOb4xWNOB8AC0VTvIPxtVY0ZKdQGGSIFQEaRXg1966rzLgUpCbB+31p
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Stop abusing the is_bin_visible() callback to calculate the attribute
size. Instead use the new, dedicated bin_size() one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/pci/pci-sysfs.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 5d0f4db1cab78674c5e5906f321bf7a57b742983..040f01b2b999175e8d98b05851edc078bbabbe0d 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -818,21 +818,20 @@ static struct bin_attribute *pci_dev_config_attrs[] = {
 	NULL,
 };
 
-static umode_t pci_dev_config_attr_is_visible(struct kobject *kobj,
-					      struct bin_attribute *a, int n)
+static size_t pci_dev_config_attr_bin_size(struct kobject *kobj,
+					   const struct bin_attribute *a,
+					   int n)
 {
 	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
 
-	a->size = PCI_CFG_SPACE_SIZE;
 	if (pdev->cfg_size > PCI_CFG_SPACE_SIZE)
-		a->size = PCI_CFG_SPACE_EXP_SIZE;
-
-	return a->attr.mode;
+		return PCI_CFG_SPACE_EXP_SIZE;
+	return PCI_CFG_SPACE_SIZE;
 }
 
 static const struct attribute_group pci_dev_config_attr_group = {
 	.bin_attrs = pci_dev_config_attrs,
-	.is_bin_visible = pci_dev_config_attr_is_visible,
+	.bin_size = pci_dev_config_attr_bin_size,
 };
 
 /*
@@ -1330,21 +1329,26 @@ static umode_t pci_dev_rom_attr_is_visible(struct kobject *kobj,
 					   struct bin_attribute *a, int n)
 {
 	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
-	size_t rom_size;
 
 	/* If the device has a ROM, try to expose it in sysfs. */
-	rom_size = pci_resource_len(pdev, PCI_ROM_RESOURCE);
-	if (!rom_size)
+	if (!pci_resource_end(pdev, PCI_ROM_RESOURCE))
 		return 0;
 
-	a->size = rom_size;
-
 	return a->attr.mode;
 }
 
+static size_t pci_dev_rom_attr_bin_size(struct kobject *kobj,
+					const struct bin_attribute *a, int n)
+{
+	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
+
+	return pci_resource_len(pdev, PCI_ROM_RESOURCE);
+}
+
 static const struct attribute_group pci_dev_rom_attr_group = {
 	.bin_attrs = pci_dev_rom_attrs,
 	.is_bin_visible = pci_dev_rom_attr_is_visible,
+	.bin_size = pci_dev_rom_attr_bin_size,
 };
 
 static ssize_t reset_store(struct device *dev, struct device_attribute *attr,

-- 
2.47.0


