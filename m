Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AF8426F3A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 18:42:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQv9v4bp5z3db2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 03:42:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=PVRXKF1M;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GWgCb98T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=PVRXKF1M; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=GWgCb98T; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQv3C5pzjz309K
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 03:36:39 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id BF049581017;
 Fri,  8 Oct 2021 12:36:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 08 Oct 2021 12:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=wjaNOvoPfH5mR
 fPiYoh4MKVRamUagf3VG7kW7qVwEyI=; b=PVRXKF1MDnHNQ8uwHshftgIhfsaJI
 aPYojnjSAysotdtPE4uG4rVqDSwkfNWxMo0/MPrfOE2OkDcMyf7a87Nv8CRaFAuj
 brQ0MvI/CpTX1eS1ZBMf6e0Eu9DDj8Vm0pxG+mqf/PRiqidH0CASutdviTeHV1Dd
 D5egebv34yjpOFFxcdQZknWCh/mtJz2ZdaFqVyXKlPT34DXoax4eJKDwKpP0JUNQ
 TdtXu2Q1xv2aMaPCQYQESdr+kilumrM4wdThImE8b9LXPFV7dO5DGDcr+TXdrv/T
 9O5eHymO84HmljQx81CkFy/dy8Um3EuXGOvD8Pdds+g7RvjfDaUd64zsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=wjaNOvoPfH5mRfPiYoh4MKVRamUagf3VG7kW7qVwEyI=; b=GWgCb98T
 q6hh5DECoOk+pLf5s6cxti9ythS78R2SrH4KZpfzpp5jpYeglh8sCj157as5lqrN
 yDBy9+jnipIB7gruh5Mbdhw2jss+vPpEvzGu/aK1z07EH2mZaKI28ezjTuz/ccfU
 ox9ALfGBfIons666iCFICd7metvKeHiY4yxl04QITuXwKUo+hyLbrzDLwMk4oAtR
 INDuuB6qhMhADBEKHQVCcpWVVpEsaGJGkG/W6812C5PhIH76YfKyDEfwtyKJVwCC
 2I+3G6Sv780CHuKqhGyW0DsesBMOlL/4KhvgaWTGSrHf30hy0PZ+2HK3u1aTyTNG
 se1zZ0jUd4pXEA==
X-ME-Sender: <xms:lXNgYU52B-kzluMh4yrUtqf6bsLdz0HTnenUZ0MCOy1seZxO6as9YQ>
 <xme:lXNgYV6PVejOmsy9XjlZO2sZdsV4ouUMnxsVY7B9eRvX0E76GtpqtvAYBNYxGbSqH
 kHT5bEuDD03zGMQCBk>
X-ME-Received: <xmr:lXNgYTfXRHFK9UD49ZhhpSfeMIa_BUJtJxbiTmKlStZKG420XzSBDrDTd9rtGPuxjdCqYiojG36CfgaGeOMslMvTali7cliuoPt2vHlSQTdFLFHau-k595o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
 ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
 gvrhhnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfef
 jeenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
 gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:lXNgYZJ4QnEBFJsyTVqtymxw9zAwLAnQPSLMD0gIKa0BI3CHWo8Osg>
 <xmx:lXNgYYJGfPCbD6IAra3HYa4et8KQlrQO4kDY6mTHW6bYPDMH0vTxjA>
 <xmx:lXNgYaxtAUmJ7u6YM8Y_oNUBuFRYHrS1AZyZ75eUkfaIaaDKGPwCBg>
 <xmx:lXNgYV6CMnK6p61SFJNw8GFT--E8HibQvJWtLLM6Cf8-8jo4kSv1DQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:35 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 08/11] i2c: pasemi: Allow to configure bus frequency
Date: Fri,  8 Oct 2021 18:35:29 +0200
Message-Id: <20211008163532.75569-9-sven@svenpeter.dev>
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

Right now the bus frequency has always been hardcoded as
100 KHz with the specific reference clock used in the PASemi
PCI controllers. Make this configurable to prepare for the
platform driver.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: no changes

 drivers/i2c/busses/i2c-pasemi-core.c | 8 +++-----
 drivers/i2c/busses/i2c-pasemi-core.h | 1 +
 drivers/i2c/busses/i2c-pasemi-pci.c  | 4 ++++
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 232587c70a38..9fb8fac53f2b 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -39,9 +39,6 @@
 #define CTL_MTR		0x00000200
 #define CTL_CLK_M	0x000000ff
 
-#define CLK_100K_DIV	84
-#define CLK_400K_DIV	21
-
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
 	dev_dbg(smbus->dev, "smbus write reg %lx val %08x\n",
@@ -63,8 +60,9 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
+	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+
+	reg_write(smbus, REG_CTL, val);
 }
 
 static void pasemi_smb_clear(struct pasemi_smbus *smbus)
diff --git a/drivers/i2c/busses/i2c-pasemi-core.h b/drivers/i2c/busses/i2c-pasemi-core.h
index 7acc33de6ce1..30a7990825ef 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.h
+++ b/drivers/i2c/busses/i2c-pasemi-core.h
@@ -14,6 +14,7 @@ struct pasemi_smbus {
 	void __iomem		*ioaddr;
 	unsigned long		 base;
 	int			 size;
+	unsigned int		 clk_div;
 };
 
 int pasemi_i2c_common_probe(struct pasemi_smbus *smbus);
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index 644656e28012..96585bbf8c24 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -17,6 +17,9 @@
 
 #include "i2c-pasemi-core.h"
 
+#define CLK_100K_DIV	84
+#define CLK_400K_DIV	21
+
 static struct pci_driver pasemi_smb_pci_driver;
 
 static int pasemi_smb_pci_probe(struct pci_dev *dev,
@@ -35,6 +38,7 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 	smbus->dev = &dev->dev;
 	smbus->base = pci_resource_start(dev, 0);
 	smbus->size = pci_resource_len(dev, 0);
+	smbus->clk_div = CLK_100K_DIV;
 
 	if (!request_region(smbus->base, smbus->size,
 			    pasemi_smb_pci_driver.name)) {
-- 
2.25.1

