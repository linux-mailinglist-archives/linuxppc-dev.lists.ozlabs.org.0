Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D75426F2E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 18:38:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQv525qMtz3bmf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 03:38:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=RmuEne/F;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=H/rd2lmy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=RmuEne/F; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=H/rd2lmy; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQv2t1MW8z2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 03:36:22 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 22692581009;
 Fri,  8 Oct 2021 12:36:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 08 Oct 2021 12:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=3gVs60z+GZXZn
 xMyWBUAI98Vy1vUJV8dXTwiEbS9uIY=; b=RmuEne/F7tjZzGUT07pkBKHFK+fpy
 1rYBUjpzvmXxhNlBOZFnET+UqwezORS9olGwXcJb3C8LNtbF5oxih77H0gmEbMyD
 1luNlUbYVlxHmELdINlNjrFr18jFaIpYl3l3yL18sM1tbKpOzZ5UhkCjgbjcFxEr
 WxqwtEs3Arp3uIcC1cvn/+uMS+QtiNLLdrTru1DxREAcp+KGlL6ESwqSeFnDBc7j
 ZFdT/25Bso7VKm3SZKoZOUWTl2Dy0o3IBi2EG2KQzZvb35Dy+dRigcZZvoVLVgS8
 7mCFOS0Bd79lmCfLhi4d6HdpmjQcU6+5pP7xzKh/zxe4ibbfJ61D55UGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=3gVs60z+GZXZnxMyWBUAI98Vy1vUJV8dXTwiEbS9uIY=; b=H/rd2lmy
 /MZXkXI0uPT9k8Jzu0qZ0lW3aFVBcGdrtY+sN7jZOzETg03URd6Ndldgv6v9YjkO
 yiYv1xLDLTxHCX44bjEQn6kw8mfPo35fLzbpyU9Ks6h1+PBQbjn6jmo63LSJFmoQ
 VW/XFvhsoo56RDuyHODkf9VoTeP72X/jf2o9/3YayamhNUW2Fst1m2+4rBGL6KAV
 eSVspKcgHrHPQeRhORSAitRgp1R1xw62t0o5zCi3m+9AALbyWWI4ehCLk7usBrqe
 byYv+eiWBiLecAL8f+d1Okf0D303+XE8eRtGwSYNMbTuV8WhdALjlGQPF06b2DAt
 peQ58/MvDGoUYg==
X-ME-Sender: <xms:g3NgYcl4qb4fb2DnGc66uGQN5p4fB8uIqzIUxoGRex5SQ9YA5Hc36Q>
 <xme:g3NgYb0f7198RKlXdp359PmQFtDGJ7_266vvIfhgzZgrwNW8pak5Ow6aIqj7C6jSb
 yIvAAzQs3LNZlExtqs>
X-ME-Received: <xmr:g3NgYaqp8M7xogGY7x_jPoQ3bh_Ohnlpj7BBE3_hjI0IM0XzenYggYiM4yXJNkkAdNuSzFhAPBb7scDOxmz_21ci7iqnksNfg8sAXJOullUmOVOjlmmP5zY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
 ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
 gvrhhnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfef
 jeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
 gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:g3NgYYllgm6C5UvPZECH3k0k_3ra92trSJaiMZyaAPxiBHzOHaXrdA>
 <xmx:g3NgYa0VTtmBnMDnWxRQDJzYU5YoFDuPdBivsmhwo13-G1Fz0ayNQQ>
 <xmx:g3NgYftEGzDjQlr6Yy1qyO1ypQhnG8xSuI5oRsfsW6XG51niwWMviA>
 <xmx:hHNgYV3tkezvN0V7k-8FV6c7RwL5xHOIAzJDP0BDVZh8nZTTleJmcw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:17 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 02/11] i2c: pasemi: Use io{read,write}32
Date: Fri,  8 Oct 2021 18:35:23 +0200
Message-Id: <20211008163532.75569-3-sven@svenpeter.dev>
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

In preparation for splitting this driver up into a platform_driver
and a pci_driver, replace outl/inl usage with pci_iomap and
ioread32/iowrite32.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: replaced ioport_map with pci_iomap 

 drivers/i2c/busses/i2c-pasemi.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi.c b/drivers/i2c/busses/i2c-pasemi.c
index 20f2772c0e79..39fcc584264a 100644
--- a/drivers/i2c/busses/i2c-pasemi.c
+++ b/drivers/i2c/busses/i2c-pasemi.c
@@ -20,6 +20,7 @@ static struct pci_driver pasemi_smb_driver;
 struct pasemi_smbus {
 	struct pci_dev		*dev;
 	struct i2c_adapter	 adapter;
+	void __iomem		*ioaddr;
 	unsigned long		 base;
 	int			 size;
 };
@@ -53,13 +54,13 @@ static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
 	dev_dbg(&smbus->dev->dev, "smbus write reg %lx val %08x\n",
 		smbus->base + reg, val);
-	outl(val, smbus->base + reg);
+	iowrite32(val, smbus->ioaddr + reg);
 }
 
 static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 {
 	int ret;
-	ret = inl(smbus->base + reg);
+	ret = ioread32(smbus->ioaddr + reg);
 	dev_dbg(&smbus->dev->dev, "smbus read reg %lx val %08x\n",
 		smbus->base + reg, ret);
 	return ret;
@@ -351,6 +352,12 @@ static int pasemi_smb_probe(struct pci_dev *dev,
 		goto out_kfree;
 	}
 
+	smbus->ioaddr = pci_iomap(dev, 0, 0);
+	if (!smbus->ioaddr) {
+		error = -EBUSY;
+		goto out_release_region;
+	}
+
 	smbus->adapter.owner = THIS_MODULE;
 	snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
 		 "PA Semi SMBus adapter at 0x%lx", smbus->base);
@@ -366,12 +373,14 @@ static int pasemi_smb_probe(struct pci_dev *dev,
 
 	error = i2c_add_adapter(&smbus->adapter);
 	if (error)
-		goto out_release_region;
+		goto out_ioport_unmap;
 
 	pci_set_drvdata(dev, smbus);
 
 	return 0;
 
+ out_ioport_unmap:
+	pci_iounmap(dev, smbus->ioaddr);
  out_release_region:
 	release_region(smbus->base, smbus->size);
  out_kfree:
@@ -384,6 +393,7 @@ static void pasemi_smb_remove(struct pci_dev *dev)
 	struct pasemi_smbus *smbus = pci_get_drvdata(dev);
 
 	i2c_del_adapter(&smbus->adapter);
+	pci_iounmap(dev, smbus->ioaddr);
 	release_region(smbus->base, smbus->size);
 	kfree(smbus);
 }
-- 
2.25.1

