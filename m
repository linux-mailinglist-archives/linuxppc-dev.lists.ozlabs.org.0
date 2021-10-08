Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3D8426F31
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 18:39:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQv6j1nYHz3cRq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 03:39:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=QvPZ9kFU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=C21NNuGW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=QvPZ9kFU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=C21NNuGW; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQv2z3vtSz2ywg
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 03:36:27 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9F525580FF3;
 Fri,  8 Oct 2021 12:36:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 08 Oct 2021 12:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fr6ByaE9Vg0E3
 Hjmq3os9yydpuvF8PLVujJlpVytji8=; b=QvPZ9kFUqLD2gOtUiSCrVo8UoSRh9
 SN9jBtRJl45cFujqA5nxD0AowPEFieJdzXEKFHGhg5emXZUN3P0WmlVMJkeqreIf
 w/9ZPFjamFDoVE86yN2VarcTt28aCIxkoPJoUMnENf7JzqAjC8lClwhe0Cu/8rc/
 dKAP44ph34NHuxd5b1DDxagLehQaRFTqToIplATROrKQ59pG6HUjnYZWc0/zm0j2
 AMqnyPzpKcWqbtvk9OkW+Dr0niSY/f8sKYgnjzei8WmKrmJNFWl2fnUMz41CJAC4
 XMCycyJpwmq3Gq6qZZDGEw5eESXxVADGZQsYel09rRVoepMg6LB9x+9RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=fr6ByaE9Vg0E3Hjmq3os9yydpuvF8PLVujJlpVytji8=; b=C21NNuGW
 eJ4JfSPezr7JVeTopivj+JKLYNkjciYwopmMR1F36nN7wPJ/aUOTr0vN7LWAtYEn
 4Fw3TJB8qa2ITfVxNrknSNc3EAd0EbAqX9MacHuy3mNRRvQQrSwLTcAISjsxVnR8
 l72KMat/efHuyJ2dKUgsmqlTFULB3f8MNNdjFNVVz3Hw2vlHDRC5BMhQDv7Gt0WO
 +Kj3opwJXlle1I+p6lNDUXcVVFe+Yd2dnIODcsxMqc6JjD2yiWYJXv03bWsdfpyY
 17bLokQ976il4qspCHAG40ReX4gFv6gH+7yKbUuHU/TVtkrstDfsDf5iHBnHfDDc
 xd1Ko7fOFLRS6Q==
X-ME-Sender: <xms:iHNgYYFt39YhSACNRTn46Wdai0Pv4X2GtFTUAKdI8kImkCKNC6p0cQ>
 <xme:iHNgYRWiZVLqU1vlq3HxO8vy1ks4a8AN_ofZaGRJOwPQGmVgO6Qnlndc4gcZfnIMD
 Iz-KJ_1H6brre9y6WM>
X-ME-Received: <xmr:iHNgYSI5of2-Q7zD5w8Uiq9hmWxjN6IQLF5ZB6gm6bxL3TfV67o_17v4y4f2WLY5dK2OITMtzTOXabdJYDkrbtxXRcQUxCSm8kIEcTaswbzY8RQDNnc1z3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
 rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
 hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
 hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:iHNgYaFLNUNTuEcbPb_hDUV5PsG7BJKF4IQr_OKhFMg5jrcFBUbHxQ>
 <xmx:iHNgYeWdUxLYcq5caki52FJZ4jHkLGbXdFoPoPOFhugn-1Gs7huVRw>
 <xmx:iHNgYdOUeJOFwEEtt6zouBt1fSYODiAvwLz6v3On1WZezKkqYKHmLQ>
 <xmx:iXNgYbVoLRd22risLP73Rs3Vn3j39jsd_4P7C6A9sDPOgbr0H1Y9JQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:22 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 04/11] i2c: pasemi: Remove usage of pci_dev
Date: Fri,  8 Oct 2021 18:35:25 +0200
Message-Id: <20211008163532.75569-5-sven@svenpeter.dev>
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

Prepare to create a platform driver by removing all usages of pci_dev we
can.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: no changes

 drivers/i2c/busses/i2c-pasemi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi.c b/drivers/i2c/busses/i2c-pasemi.c
index ca5a86cf53f1..a018e9376023 100644
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

