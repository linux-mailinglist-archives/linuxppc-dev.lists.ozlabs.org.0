Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6284188E1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 14:52:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHQf543kVz3cGF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 22:52:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=loKi3Byl;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Dzc1jhNB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=loKi3Byl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Dzc1jhNB; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHLxy3ZHXz2yX8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Sep 2021 20:05:58 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 80880580FBE;
 Sun, 26 Sep 2021 05:59:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 26 Sep 2021 05:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=eDm2w0r9qdgIL
 osKDjxLOSNSl2XVh+4nrRVQCj+3Zbg=; b=loKi3BylPqTFC87PBvT1beyL5AI3a
 9oJICsw/yvFiFn7dZ+kDGmryQJ9VBPB34mw7OVDyvgBAWl+wFqA6ZGvrprsWhj/q
 tCxS4J9zxxlTbm29lYKOPcVqGpuW1ikQqDUWkrg/7rQ3srGoZMMEV5y1Z027ADEJ
 JmA6hdEgIt4kPLJYYJ6xd+nEVmxIIUowxvEjXVIJoIJL7nwzjhCJYQRzWwP1Elre
 5nbvr1IZTXHycYf1daUNpoD5xJ5ExOOTRorbPcMroI7sGtZVHycm/HBRxm9gQcWq
 8C5+IvmGC06grdkFb8TW+320n9VQyirzr5igOTLCTZdMxhBovjBS/S1xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=eDm2w0r9qdgILosKDjxLOSNSl2XVh+4nrRVQCj+3Zbg=; b=Dzc1jhNB
 fWkJWAQ+pgASl5fF5XLxl4RqcO4B1G8A6ILOjmF4zORhzR+aOtUUvIqbmffoXH+V
 5dXsu2pDvl4AZk8LHP7DAIbcOSyf/gLe//4HkOXoAVtPwzsw0YG+wuTwbcIapMQl
 tJu/7G4oRZxkIuPr1EXhn6VzqE4yWQzuRnMXmhNvZwDOvpBEX7BsJdd1hOlRpSRr
 FEreJOzRLo+bOYxLLFT9HNiw89z9PGbsp88qI++9O14sl2Gza4P1O6eL0Wly/PLX
 fC6gtsbxjEZUcDz/w3anl/E5ACRublM4b1NmtrDkulOCF40/cHHyD+u1mQZk4I4G
 6P7WizXTlOup0w==
X-ME-Sender: <xms:j0RQYcqrZnBcxttskVyjdKTQ03P_1orXIjJ0yZeMd42utXTah_fBIA>
 <xme:j0RQYSq9POwDLLt-ec99LiNKnHSHSMODmwSEeyd6K5giIIi7ikRBjKXGZamXU8fGw
 -eKjrsWyD_CAZ9WNSc>
X-ME-Received: <xmr:j0RQYROf6O3met_OxrGfBC_6dr1Qdst-16gpKPhI4G1nq13QyIPyTvkgKJBs4Y9yLB17RJXigws8zGDMvmHARr8f3zMzaWG5P2A37ZcpLITYK47n8otCgdI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
 rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
 hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
 hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:j0RQYT45Xq_9pS3GWl4P63KxHjAWQy3Q1EPz3eTwg2qV7P_u9teIZg>
 <xmx:j0RQYb7X9xdPJOzz3UE7zwgiIgneHPdAP9t9pA5w3yJ1F3D4Eww0UQ>
 <xmx:j0RQYTgsaggYGIu8x8w7yjXnGqL0IPAhAVW6qFfnwkLdSMQzXKaQjQ>
 <xmx:j0RQYSISO-O6BU8E5H5k7xSQJ4dRj8_jvOt1fza-McyDBbJ1qvBpDA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:41 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH 02/10] i2c: pasemi: Use io{read,write}32
Date: Sun, 26 Sep 2021 11:58:39 +0200
Message-Id: <20210926095847.38261-3-sven@svenpeter.dev>
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

In preparation for splitting this driver up into a platform_driver
and a pci_driver, replace outl/inl usage with ioport_map and
ioread32/iowrite32.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi.c b/drivers/i2c/busses/i2c-pasemi.c
index 20f2772c0e79..dd31d902a621 100644
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
 
+	smbus->ioaddr = ioport_map(smbus->base, smbus->size);
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
+	ioport_unmap(smbus->ioaddr);
  out_release_region:
 	release_region(smbus->base, smbus->size);
  out_kfree:
@@ -384,6 +393,7 @@ static void pasemi_smb_remove(struct pci_dev *dev)
 	struct pasemi_smbus *smbus = pci_get_drvdata(dev);
 
 	i2c_del_adapter(&smbus->adapter);
+	ioport_unmap(smbus->ioaddr);
 	release_region(smbus->base, smbus->size);
 	kfree(smbus);
 }
-- 
2.25.1

