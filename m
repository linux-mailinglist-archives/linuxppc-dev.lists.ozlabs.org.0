Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 520AE4188E3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 14:53:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHQg90wXWz3c8h
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 22:53:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=n/bwUgzw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=p+g75wOz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=n/bwUgzw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=p+g75wOz; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHLxy3ZXnz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Sep 2021 20:05:58 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0325E580FC0;
 Sun, 26 Sep 2021 05:59:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 26 Sep 2021 05:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=lp+XUp7mIfXq3
 15prP8VbwTOoD7Xg/G3KhTR4HgHB0I=; b=n/bwUgzw0kmotuC8bjksXKblzHPTY
 5Z+L3BQ/jcwneG/mmwJoN+8F6M9gy6oHdqaz9QfN3RoTy4mk6WP4Drxan7UepCF+
 fM0juN6F67kV+eYkrR3yv4kYZVdO1QSRUnXGR7L+tVL47a7GeEWxWmWB4DjCrMOV
 dvami0204CRFW5KY0BYo7SIdEHTkpLK9kJ0n2Lv1JwBgycqtxD1hNpzNMxvDgJVq
 AxI86GIp85zbWPC2ohNofJx50w0ivWXF1ssqD2bZcfaRQnbH4ycZsRxpHBQk4D04
 1GQ3yjvR6SaP1JJm9KkDht2ZKYIhqZhVMPU9DQpFPVa4EneL7QiQtCEyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=lp+XUp7mIfXq315prP8VbwTOoD7Xg/G3KhTR4HgHB0I=; b=p+g75wOz
 QmwLuZ4yyIEva+90iJlSIj2jdKz/OkpP70yUTuXP8u9NsiBS8C9BdDBNwWdAA8Oi
 Mt2rPlrnq0I60VNhpHQRQ1wEC/H0PLSlphxOpz89oiaHM1z6pMHNn+5E5BEOB8ip
 7X18rYwIGDW/4quvHj0EBeQ6t3tI4L2cIDzGMlxK+25IyphCip54CxCVMYgoMVjS
 buTOcs/w0jkpKAqps50HoxbOUwNTdzQoeffP4cmitLW80CYKuRzoXKOo0LEXkoDt
 iIChz+cgTJGHFRcmfkR7PUC5/Iq5e+t36q0SftL+4ycY+fHhHPQlgbjew/tzBM47
 VBAY6n4kY9DZSQ==
X-ME-Sender: <xms:kURQYX2J0XyigC2dqdsYsRM3jhRCaZkARuXnK8v7Nnb65FVAoEB58A>
 <xme:kURQYWH079MdbiFZF_9RgY-InorHg5_WkLItLZV4_hJy1t8JtOJNHyBS_NwCcbF9Q
 q06VeQxABNYZtcmDcA>
X-ME-Received: <xmr:kURQYX6LhjEblI9uySoFgiLVO82aFA9LWdOtIOh0NXFs2eKSE1hxpfzDgkvzkB8UM3nzUQbSFuyeBeRc6hUymKH8TGeUn7_3JGe--NMdkY3TFSphD6O-ahc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
 rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
 hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
 hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:kURQYc0EqBihZloO8NX0l86cEr1qbvadJcZ9ndDXdmKh8IM8W0TpFQ>
 <xmx:kURQYaH9GeOpyQlWHDxz4OJcKtW_w3nRL2eldZrG9RY6-u6N0Hp_JQ>
 <xmx:kURQYd8_Qvvl-nyOOue6a1RHbG9D31wB2z8wAK_efDgpLdfCJ_lQpQ>
 <xmx:kURQYWEFHKGAMlEk80zSEKe_KpszEoliC1PdDx_QCN_SjzC3D9BGoQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:43 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH 03/10] i2c: pasemi: Remove usage of pci_dev
Date: Sun, 26 Sep 2021 11:58:40 +0200
Message-Id: <20210926095847.38261-4-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210926095847.38261-1-sven@svenpeter.dev>
References: <20210926095847.38261-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Sep 2021 22:47:12 +1000
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

Prepare to create a platform driver by removing all usages of pci_dev we
can.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi.c b/drivers/i2c/busses/i2c-pasemi.c
index dd31d902a621..5a25c2e54b9e 100644
--- a/drivers/i2c/busses/i2c-pasemi.c
+++ b/drivers/i2c/busses/i2c-pasemi.c
@@ -18,7 +18,7 @@
 static struct pci_driver pasemi_smb_driver;
 
 struct pasemi_smbus {
-	struct pci_dev		*dev;
+	struct device           *dev;
 	struct i2c_adapter	 adapter;
 	void __iomem		*ioaddr;
 	unsigned long		 base;
@@ -52,7 +52,7 @@ struct pasemi_smbus {
 
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
-	dev_dbg(&smbus->dev->dev, "smbus write reg %lx val %08x\n",
+	dev_dbg(smbus->dev, "smbus write reg %lx val %08x\n",
 		smbus->base + reg, val);
 	iowrite32(val, smbus->ioaddr + reg);
 }
@@ -61,7 +61,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 {
 	int ret;
 	ret = ioread32(smbus->ioaddr + reg);
-	dev_dbg(&smbus->dev->dev, "smbus read reg %lx val %08x\n",
+	dev_dbg(smbus->dev, "smbus read reg %lx val %08x\n",
 		smbus->base + reg, ret);
 	return ret;
 }
@@ -94,7 +94,7 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 		return -ENXIO;
 
 	if (timeout < 0) {
-		dev_warn(&smbus->dev->dev, "Timeout, status 0x%08x\n", status);
+		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
 		reg_write(smbus, REG_SMSTA, status);
 		return -ETIME;
 	}
@@ -342,7 +342,7 @@ static int pasemi_smb_probe(struct pci_dev *dev,
 	if (!smbus)
 		return -ENOMEM;
 
-	smbus->dev = dev;
+	smbus->dev = &dev->dev;
 	smbus->base = pci_resource_start(dev, 0);
 	smbus->size = pci_resource_len(dev, 0);
 
@@ -366,7 +366,7 @@ static int pasemi_smb_probe(struct pci_dev *dev,
 	smbus->adapter.algo_data = smbus;
 
 	/* set up the sysfs linkage to our parent device */
-	smbus->adapter.dev.parent = &dev->dev;
+	smbus->adapter.dev.parent = smbus->dev;
 
 	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
 		  (CLK_100K_DIV & CTL_CLK_M)));
-- 
2.25.1

