Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCD7426F41
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 18:43:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQvBq3ZDGz3ddr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 03:43:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=BYqjHu4P;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=OnW4a3lJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=BYqjHu4P; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OnW4a3lJ; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQv3G1pvhz3bfl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 03:36:42 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 58614581019;
 Fri,  8 Oct 2021 12:36:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 08 Oct 2021 12:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=7/ewSHwHFvXHV
 z7zgXaLq5m2XodTDUuxa+TeH6oVjzo=; b=BYqjHu4PRKriuBz3uQTVvnUPpDbu6
 8SGgVy7YSXcpiK10zNcHDJ10SY2bjj+rBLn+qH7LXe7eBCcp7wdrIEA3WkJmYLR0
 PD2L9Zy4K5cUl2W6tC9rxlayr+NhjMznB9IR4XnuukqbNr7du0SkjGW/9ioo7jfy
 LjvzbI1auzM8GjzMMUZP10DkOLuGDrMPMxKiJYCBuNENUzS0uUaxqvJE00Ppw2Md
 c2QnpzgRF7/OvsHDJDusuOIuuaU+9z7huoEENGyiDcblJGoJDK/ddXKGGme1FZuK
 7FtCIvKrora0bIAMDx/u59cvXUzpz8iUxOSLK7dRML9CcbnnzOTqQUFKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=7/ewSHwHFvXHVz7zgXaLq5m2XodTDUuxa+TeH6oVjzo=; b=OnW4a3lJ
 QBOfnFuWH2S86+kyLA/BewPgDvMnkcz3ooZ4r5zKA+1PJ1B3VDmlh7Wkz/mHwK3S
 s8jG/OovqnoNqPhxn8JIiB7YCJNHs8tJrolWJSAn3GWc6zCz8j8Mzh9jxufCrDdv
 HAeUBUPC6rK7/+VeiBfmWWr8kIu9WbvGvxLwDFofggW7Wzls0BBFmO6DyNo2LaLz
 caTRg7i6mi5eRQ4i21ceMUSUuS54O6Xz9BkhKyDzaex4EnWWyroNuiNuNlE2dB+S
 OrSRaltpikJkCq50+eWplzcm6zmqdFxrc0+zi3Nqf6iAy2BMLSaeh+8KLpWJFVJC
 sYiizhNeLLBeRA==
X-ME-Sender: <xms:mHNgYYuOj2K_Q_lO7uh6Tm85vgztLsXydc8Ghp6c1R1xkx207dNSFw>
 <xme:mHNgYVevSiuQDcRRUvrxp9rAyX6aID4ZZzEqT9O5xbBwqW-KQw4Ixb_osg5DCAhQx
 1XavGzLET-nnA3cqMU>
X-ME-Received: <xmr:mHNgYTwq6ZVNzwRDOyMr7qQx3VnYAzxOyjPjO7fKlk4QAjeqA0uZZnMURel_EwAKmiP2nKGgYpFGufL4XPwU3b8B1KUBnHLut3MvG1HEmv-ZuJnWOKiVx4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
 ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
 gvrhhnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfef
 jeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
 gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:mHNgYbNPbIw64VwAJFGfxzXL4BsqKFQbuSRrvWqatHhg6piwMmmA6Q>
 <xmx:mHNgYY-FAAnFqoON-uIclNw1lr0ce-7GBAToJcIlQ6a8JIb1V_y1bQ>
 <xmx:mHNgYTX08e8pd8ZbVnHbtRiVe9yyCoNrRdMcLIRMhUXBJgYXInvRag>
 <xmx:mHNgYbcA9jsWfL4cX2R_KxUHpVdEqQIfkqz8DWyoKSFSozkE_KY8jQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:38 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 09/11] i2c: pasemi: Refactor _probe to use devm_*
Date: Fri,  8 Oct 2021 18:35:30 +0200
Message-Id: <20211008163532.75569-10-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211008163532.75569-1-sven@svenpeter.dev>
References: <20211008163532.75569-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>, linuxppc-dev@lists.ozlabs.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Using managed device resources means there's nothing left to be done in
pasemi_smb_pci_remove and also allows to remove base and size from
struct pasemi_smbus.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: no changes

 drivers/i2c/busses/i2c-pasemi-core.c |  8 ++---
 drivers/i2c/busses/i2c-pasemi-core.h |  2 --
 drivers/i2c/busses/i2c-pasemi-pci.c  | 45 ++++++++--------------------
 3 files changed, 15 insertions(+), 40 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 9fb8fac53f2b..3d87b64dd9f7 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -41,8 +41,7 @@
 
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
-	dev_dbg(smbus->dev, "smbus write reg %lx val %08x\n",
-		smbus->base + reg, val);
+	dev_dbg(smbus->dev, "smbus write reg %x val %08x\n", reg, val);
 	iowrite32(val, smbus->ioaddr + reg);
 }
 
@@ -50,8 +49,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 {
 	int ret;
 	ret = ioread32(smbus->ioaddr + reg);
-	dev_dbg(smbus->dev, "smbus read reg %lx val %08x\n",
-		smbus->base + reg, ret);
+	dev_dbg(smbus->dev, "smbus read reg %x val %08x\n", reg, ret);
 	return ret;
 }
 
@@ -339,7 +337,7 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 
 	pasemi_reset(smbus);
 
-	error = i2c_add_adapter(&smbus->adapter);
+	error = devm_i2c_add_adapter(smbus->dev, &smbus->adapter);
 	if (error)
 		return error;
 
diff --git a/drivers/i2c/busses/i2c-pasemi-core.h b/drivers/i2c/busses/i2c-pasemi-core.h
index 30a7990825ef..aca4e2da9089 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.h
+++ b/drivers/i2c/busses/i2c-pasemi-core.h
@@ -12,8 +12,6 @@ struct pasemi_smbus {
 	struct device		*dev;
 	struct i2c_adapter	 adapter;
 	void __iomem		*ioaddr;
-	unsigned long		 base;
-	int			 size;
 	unsigned int		 clk_div;
 };
 
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index 96585bbf8c24..4251e7b9f177 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -26,57 +26,37 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 				      const struct pci_device_id *id)
 {
 	struct pasemi_smbus *smbus;
+	unsigned long base;
+	int size;
 	int error;
 
 	if (!(pci_resource_flags(dev, 0) & IORESOURCE_IO))
 		return -ENODEV;
 
-	smbus = kzalloc(sizeof(struct pasemi_smbus), GFP_KERNEL);
+	smbus = devm_kzalloc(&dev->dev, sizeof(*smbus), GFP_KERNEL);
 	if (!smbus)
 		return -ENOMEM;
 
 	smbus->dev = &dev->dev;
-	smbus->base = pci_resource_start(dev, 0);
-	smbus->size = pci_resource_len(dev, 0);
+	base = pci_resource_start(dev, 0);
+	size = pci_resource_len(dev, 0);
 	smbus->clk_div = CLK_100K_DIV;
 
-	if (!request_region(smbus->base, smbus->size,
-			    pasemi_smb_pci_driver.name)) {
-		error = -EBUSY;
-		goto out_kfree;
-	}
+	if (!devm_request_region(&dev->dev, base, size,
+			    pasemi_smb_pci_driver.name))
+		return -EBUSY;
 
-	smbus->ioaddr = pci_iomap(dev, 0, 0);
-	if (!smbus->ioaddr) {
-		error = -EBUSY;
-		goto out_release_region;
-	}
+	smbus->ioaddr = pcim_iomap(dev, 0, 0);
+	if (!smbus->ioaddr)
+		return -EBUSY;
 
 	error = pasemi_i2c_common_probe(smbus);
 	if (error)
-		goto out_ioport_unmap;
+		return error;
 
 	pci_set_drvdata(dev, smbus);
 
 	return 0;
-
- out_ioport_unmap:
-	pci_iounmap(dev, smbus->ioaddr);
- out_release_region:
-	release_region(smbus->base, smbus->size);
- out_kfree:
-	kfree(smbus);
-	return error;
-}
-
-static void pasemi_smb_pci_remove(struct pci_dev *dev)
-{
-	struct pasemi_smbus *smbus = pci_get_drvdata(dev);
-
-	i2c_del_adapter(&smbus->adapter);
-	pci_iounmap(dev, smbus->ioaddr);
-	release_region(smbus->base, smbus->size);
-	kfree(smbus);
 }
 
 static const struct pci_device_id pasemi_smb_pci_ids[] = {
@@ -90,7 +70,6 @@ static struct pci_driver pasemi_smb_pci_driver = {
 	.name		= "i2c-pasemi",
 	.id_table	= pasemi_smb_pci_ids,
 	.probe		= pasemi_smb_pci_probe,
-	.remove		= pasemi_smb_pci_remove,
 };
 
 module_pci_driver(pasemi_smb_pci_driver);
-- 
2.25.1

