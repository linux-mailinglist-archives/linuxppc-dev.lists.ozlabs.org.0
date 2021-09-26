Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7A4188E4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 14:54:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HHQgy3K2Vz3dYt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Sep 2021 22:54:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=qUZpi53z;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nyyiw9q+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=qUZpi53z; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=nyyiw9q+; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HHLxy3WhQz2yWH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Sep 2021 20:05:58 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id C4B8A580FD1;
 Sun, 26 Sep 2021 05:59:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 26 Sep 2021 05:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=KbpD7QDsVxr0s
 hguUMq4LBuqqbF0i6Fnb7YHPNOz3ek=; b=qUZpi53zHUD80M8nqu661ADs8im9g
 H6m6Mzdi6cRJ8NlT1f0sYVYv/7lnNa2vam1C9M7qUXc8Ze1S2wScKJYYiXIBtbM+
 QX9LBZ0yXEU0nvI+Q7rC5udRfhf3J5gP1P/0lPDZ7xxosHFLeMy/EWkdXxIVqBsk
 ngsa4Mn/NZxRACP15t3rrjxZAA0GEAWqa/EYorxkfXUAtrcf1tNumgUwDbOOFlvm
 0WEHWpi0Fi4WZSJGz4PVhkxdG415DFVMyqjNM9RFzHQgqtAU9+hl7QI+aamn2gJY
 BSr2rOUriYt/cj+aYQC/EfTuDwOSyeWmuyx7kmk+StJQCFDEI5jXbJHRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=KbpD7QDsVxr0shguUMq4LBuqqbF0i6Fnb7YHPNOz3ek=; b=nyyiw9q+
 Cp+FfyGYWwkGuV6q61ImTxR7ybE9CossQWXltL7CYV5fGrBJ8NFESWwQFhv0sQKn
 yuHHHMX6NBQ7sk6gG+nw6ASpr7tp0GbvsaWoWgUaesN2hQB38Yo1TRS+T9H6bGbo
 Y4MKz8rpd065L+5YcYsOxm1LsUQ5WOkEEcsa22z23nzGPH40fZZu7/ltJ8c6/BC2
 BG7akP526ty4d6wHShl2bFyQBxMLUr7JXIen9yhOW/w1vP/RM3YHLcycZ5XpRLsn
 JLDV+Pqc0/C2pe/RHrNueacCEoMgbfy+HfJLDFBRaa/Ngbz7bW7XmW1tz266n168
 y5bbkaYgxCtr8Q==
X-ME-Sender: <xms:mkRQYcGXwuhaRUvEmZRtsxt-DcPkwKCJGjM2FuazJDANj49lWSG7pw>
 <xme:mkRQYVUfFHvMx_oqde4HWaPwaYLSnnDq6Mh2dIuHGC_1kQvvEjrHWj6-5V5Az43yT
 wvbbpsStkQIUKRuhuA>
X-ME-Received: <xmr:mkRQYWINdAsd491lSj1sxKX1kcuLygitrE7qn3lcqdMLxImm3h-HheOj1vpASPybPoL_lFUfJqT-qNfpelU8CbgBAhXzhp_8MP8ff2no-GE9H5a3a5OAGgU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejiedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcu
 rfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvg
 hrnheptedvkeetleeuffffhfekteetffeggffgveehieelueefvddtueffveevlefhfeej
 necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepshhvvg
 hnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:mkRQYeEqq7vPywGJxFw1B_Dmfp-rcN8_A29LRsWdzn6eFD9a8xOOcw>
 <xmx:mkRQYSUsF5JptwPyJPt0aKdDykdMPYcL0E-KX655jVMCQippbcjLsA>
 <xmx:mkRQYROmiU6Yd7WtM_I22qP789qdsRA9xyjFbjMVsv7jqcLkITpoNg>
 <xmx:mkRQYbV1lji43E9w4x5B4fwEhxE6pjyKlgLPyjtLdrfxi-uHGnTsmQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Sep 2021 05:59:52 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>
Subject: [PATCH 07/10] i2c: pasemi: Allow to configure bus frequency
Date: Sun, 26 Sep 2021 11:58:44 +0200
Message-Id: <20210926095847.38261-8-sven@svenpeter.dev>
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

Right now the bus frequency has always been hardcoded as
100 KHz with the specific reference clock used in the PASemi
PCI controllers. Make this configurable to prepare for the
platform driver.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 8 +++-----
 drivers/i2c/busses/i2c-pasemi-core.h | 1 +
 drivers/i2c/busses/i2c-pasemi-pci.c  | 4 ++++
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 7c6715f5dbb8..a39e3258b162 100644
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
index 9a19df31866b..7405e0b48514 100644
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

