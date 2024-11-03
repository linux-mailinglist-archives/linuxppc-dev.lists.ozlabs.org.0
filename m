Return-Path: <linuxppc-dev+bounces-2783-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D77519BA733
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 18:13:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhLlN530Fz2xJK;
	Mon,  4 Nov 2024 04:13:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730653984;
	cv=none; b=UY9XyMK39XFMJSd2XNzslR+kRTnU9zdFFzrjG2EZgkQqUKjUnchRIIgIGHSu+HhoKjDDJGrKr/ILRRx59WWI1d07fNuvbEpQLaBzSTex/+Lul0OOLeOwcPRkunZVtlp4kRlCqo6O8Z9ux4AUQvpjd6QIb1JBmupXzoKCO3uzDYVCqFLP3xm1ERVzEMSngCm10uM9yQWASMROCRJM1u/LY+l8cQN9tMHvNdbkGB5XPCYrW1duvau1lplmjw4schMSYqNG2ClcGG2rM4CUQY1Wc+XWwJsF4FyZ4Er6vQNOqJm8huHPeB4elrj/Iqt0oWvB/lo82rl7FOaw/MhU4NMQiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730653984; c=relaxed/relaxed;
	bh=T8l6z48q9bYISuiRg19AafLwiXCv6B4N9G/d1Py2ax0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AIAPOi2EjGvRFwowgkGld9/ReNIr+Hz9ucYDXwNdoBEcDXLDjmxm+nhXV79AKB+0zwHYLmDBE3JZWb457Ks7hQlI6MRPcFe1ZcIQtG2NEkTNexnl8nr8lU1VH7iJgZSMIWFDlOHS0CFjyYjVF9BLX1nwjQilltB263XeJgq3tXk8T7w76B8d0ZEyVqcgSEmu7K8Zr4WLIJeGn19QVTMmsNg8jdEpucraz6lf/LFKdvCR8DYvekk/mbUDPlDzjLDOm3T3i9DIetE1+iYzpp6JTbheX9W6cw6C8yVSFyngYRySMNdgEM7d+tDxtEseOiz/azjxFTyZS2YTTG3/W2tWXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=eJ/MCRqo; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=eJ/MCRqo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 487 seconds by postgrey-1.37 at boromir; Mon, 04 Nov 2024 04:12:55 AEDT
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhLlC2hPqz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 04:12:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653478;
	bh=HJxCu3XdHEjI8+lqBeecXqpkPvzbQYLMTL9gfIshZu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eJ/MCRqoF9Rqe3KaW2ShUA9/IYs2ictVXaJRROkHjxolYm/HneFO9JpZW0gFLD5sq
	 eJMWG+muBZiQNKpeD5GYOx57gwIVygWUhDQpNmatBQN/rfCMWVgd8Ig2F+0Qb7gccl
	 lHL/yru1/vu3kEMje+fV5ituej+a5j8n8Omi4eU4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:34 +0000
Subject: [PATCH v2 05/10] sysfs: treewide: constify attribute callback of
 bin_is_visible()
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
Message-Id: <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=10037;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=HJxCu3XdHEjI8+lqBeecXqpkPvzbQYLMTL9gfIshZu0=;
 b=q526adB7X5IWu5oD3aHXgNapKbQ68pIt0vtJJys1mqg9dJ5C24gfhoXCe8E0XMtccXzh7sleK
 t+OZuYX5ZorAZD3oVis4dvraeO9iEpIZNu3TrJnncQ08r3TMeL2GZ7J
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The is_bin_visible() callbacks should not modify the struct
bin_attribute passed as argument.
Enforce this by marking the argument as const.

As there are not many callback implementers perform this change
throughout the tree at once.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/cxl/port.c                      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c |  2 +-
 drivers/infiniband/hw/qib/qib_sysfs.c   |  2 +-
 drivers/mtd/spi-nor/sysfs.c             |  2 +-
 drivers/nvmem/core.c                    |  3 ++-
 drivers/pci/pci-sysfs.c                 |  2 +-
 drivers/pci/vpd.c                       |  2 +-
 drivers/platform/x86/amd/hsmp.c         |  2 +-
 drivers/platform/x86/intel/sdsi.c       |  2 +-
 drivers/scsi/scsi_sysfs.c               |  2 +-
 drivers/usb/core/sysfs.c                |  2 +-
 include/linux/sysfs.h                   | 30 +++++++++++++++---------------
 12 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/cxl/port.c b/drivers/cxl/port.c
index 9dc394295e1fcd1610813837b2f515b66995eb25..24041cf85cfbe6c54c467ac325e48c775562b938 100644
--- a/drivers/cxl/port.c
+++ b/drivers/cxl/port.c
@@ -173,7 +173,7 @@ static ssize_t CDAT_read(struct file *filp, struct kobject *kobj,
 static BIN_ATTR_ADMIN_RO(CDAT, 0);
 
 static umode_t cxl_port_bin_attr_is_visible(struct kobject *kobj,
-					    struct bin_attribute *attr, int i)
+					    const struct bin_attribute *attr, int i)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct cxl_port *port = to_cxl_port(dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 0b28b2cf1517d130da01989df70b9dff6433edc4..c1c329eb920b52af100a93bdf00df450e25608c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -3999,7 +3999,7 @@ static umode_t amdgpu_flash_attr_is_visible(struct kobject *kobj, struct attribu
 }
 
 static umode_t amdgpu_bin_flash_attr_is_visible(struct kobject *kobj,
-						struct bin_attribute *attr,
+						const struct bin_attribute *attr,
 						int idx)
 {
 	struct device *dev = kobj_to_dev(kobj);
diff --git a/drivers/infiniband/hw/qib/qib_sysfs.c b/drivers/infiniband/hw/qib/qib_sysfs.c
index 53ec7510e4ebfb144e79884ca7dd7d0c873bd8a7..ba2cd68b53e6c240f1afc65c64012c75ccf488e0 100644
--- a/drivers/infiniband/hw/qib/qib_sysfs.c
+++ b/drivers/infiniband/hw/qib/qib_sysfs.c
@@ -283,7 +283,7 @@ static struct bin_attribute *port_ccmgta_attributes[] = {
 };
 
 static umode_t qib_ccmgta_is_bin_visible(struct kobject *kobj,
-				 struct bin_attribute *attr, int n)
+				 const struct bin_attribute *attr, int n)
 {
 	struct qib_pportdata *ppd = qib_get_pportdata_kobj(kobj);
 
diff --git a/drivers/mtd/spi-nor/sysfs.c b/drivers/mtd/spi-nor/sysfs.c
index 96064e4babf01f6950c81586764386e7671cbf97..5e9eb268073d18e0a46089000f18a3200b4bf13d 100644
--- a/drivers/mtd/spi-nor/sysfs.c
+++ b/drivers/mtd/spi-nor/sysfs.c
@@ -87,7 +87,7 @@ static umode_t spi_nor_sysfs_is_visible(struct kobject *kobj,
 }
 
 static umode_t spi_nor_sysfs_is_bin_visible(struct kobject *kobj,
-					    struct bin_attribute *attr, int n)
+					    const struct bin_attribute *attr, int n)
 {
 	struct spi_device *spi = to_spi_device(kobj_to_dev(kobj));
 	struct spi_mem *spimem = spi_get_drvdata(spi);
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 63370c76394ee9b8d514da074779617cef67c311..73e44d724f90f4cd8fe8cafb9fa0c0fb23078e61 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -298,7 +298,8 @@ static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
 }
 
 static umode_t nvmem_bin_attr_is_visible(struct kobject *kobj,
-					 struct bin_attribute *attr, int i)
+					 const struct bin_attribute *attr,
+					 int i)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 040f01b2b999175e8d98b05851edc078bbabbe0d..13912940ed2bb66c0086e5bea9a3cb6417ac14dd 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1326,7 +1326,7 @@ static struct bin_attribute *pci_dev_rom_attrs[] = {
 };
 
 static umode_t pci_dev_rom_attr_is_visible(struct kobject *kobj,
-					   struct bin_attribute *a, int n)
+					   const struct bin_attribute *a, int n)
 {
 	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
 
diff --git a/drivers/pci/vpd.c b/drivers/pci/vpd.c
index e4300f5f304f3ca55a657fd25a1fa5ed919737a7..a469bcbc0da7f7677485c7f999f8dfb58b8ae8a3 100644
--- a/drivers/pci/vpd.c
+++ b/drivers/pci/vpd.c
@@ -325,7 +325,7 @@ static struct bin_attribute *vpd_attrs[] = {
 };
 
 static umode_t vpd_attr_is_visible(struct kobject *kobj,
-				   struct bin_attribute *a, int n)
+				   const struct bin_attribute *a, int n)
 {
 	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
 
diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 8fcf38eed7f00ee01aade6e3e55e20402458d5aa..8f00850c139fa8d419bc1c140c1832bf84b2c3bd 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -620,7 +620,7 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
 }
 
 static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
-					 struct bin_attribute *battr, int id)
+					 const struct bin_attribute *battr, int id)
 {
 	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
 		return battr->attr.mode;
diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel/sdsi.c
index 9d137621f0e6e7a23be0e0bbc6175c51c403169f..33f33b1070fdc949c1373251c3bca4234d9da119 100644
--- a/drivers/platform/x86/intel/sdsi.c
+++ b/drivers/platform/x86/intel/sdsi.c
@@ -541,7 +541,7 @@ static struct bin_attribute *sdsi_bin_attrs[] = {
 };
 
 static umode_t
-sdsi_battr_is_visible(struct kobject *kobj, struct bin_attribute *attr, int n)
+sdsi_battr_is_visible(struct kobject *kobj, const struct bin_attribute *attr, int n)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct sdsi_priv *priv = dev_get_drvdata(dev);
diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index 32f94db6d6bf5d2bd289c1a121da7ffc6a7cb2ff..f3a1ecb42128a2b221ca5c362e041eb59dba0f20 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -1274,7 +1274,7 @@ static umode_t scsi_sdev_attr_is_visible(struct kobject *kobj,
 }
 
 static umode_t scsi_sdev_bin_attr_is_visible(struct kobject *kobj,
-					     struct bin_attribute *attr, int i)
+					     const struct bin_attribute *attr, int i)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct scsi_device *sdev = to_scsi_device(dev);
diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index 61b6d978892c799e213018bed22d9fb12a19d429..b4cba23831acd2d7d395b9f7683cd3ee3a8623c8 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -925,7 +925,7 @@ static struct bin_attribute *dev_bin_attrs[] = {
 };
 
 static umode_t dev_bin_attrs_are_visible(struct kobject *kobj,
-		struct bin_attribute *a, int n)
+		const struct bin_attribute *a, int n)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct usb_device *udev = to_usb_device(dev);
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 4746cccb95898b24df6f53de9421ea7649b5568f..d1b22d56198b55ee39fe4c4fc994f5b753641992 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -101,7 +101,7 @@ struct attribute_group {
 	umode_t			(*is_visible)(struct kobject *,
 					      struct attribute *, int);
 	umode_t			(*is_bin_visible)(struct kobject *,
-						  struct bin_attribute *, int);
+						  const struct bin_attribute *, int);
 	size_t			(*bin_size)(struct kobject *,
 					    const struct bin_attribute *,
 					    int);
@@ -199,22 +199,22 @@ struct attribute_group {
  * attributes, the group visibility is determined by the function
  * specified to is_visible() not is_bin_visible()
  */
-#define DEFINE_SYSFS_BIN_GROUP_VISIBLE(name)                             \
-	static inline umode_t sysfs_group_visible_##name(                \
-		struct kobject *kobj, struct bin_attribute *attr, int n) \
-	{                                                                \
-		if (n == 0 && !name##_group_visible(kobj))               \
-			return SYSFS_GROUP_INVISIBLE;                    \
-		return name##_attr_visible(kobj, attr, n);               \
+#define DEFINE_SYSFS_BIN_GROUP_VISIBLE(name)                                   \
+	static inline umode_t sysfs_group_visible_##name(                      \
+		struct kobject *kobj, const struct bin_attribute *attr, int n) \
+	{                                                                      \
+		if (n == 0 && !name##_group_visible(kobj))                     \
+			return SYSFS_GROUP_INVISIBLE;                          \
+		return name##_attr_visible(kobj, attr, n);                     \
 	}
 
-#define DEFINE_SIMPLE_SYSFS_BIN_GROUP_VISIBLE(name)                   \
-	static inline umode_t sysfs_group_visible_##name(             \
-		struct kobject *kobj, struct bin_attribute *a, int n) \
-	{                                                             \
-		if (n == 0 && !name##_group_visible(kobj))            \
-			return SYSFS_GROUP_INVISIBLE;                 \
-		return a->mode;                                       \
+#define DEFINE_SIMPLE_SYSFS_BIN_GROUP_VISIBLE(name)                         \
+	static inline umode_t sysfs_group_visible_##name(                   \
+		struct kobject *kobj, const struct bin_attribute *a, int n) \
+	{                                                                   \
+		if (n == 0 && !name##_group_visible(kobj))                  \
+			return SYSFS_GROUP_INVISIBLE;                       \
+		return a->mode;                                             \
 	}
 
 #define SYSFS_GROUP_VISIBLE(fn) sysfs_group_visible_##fn

-- 
2.47.0


