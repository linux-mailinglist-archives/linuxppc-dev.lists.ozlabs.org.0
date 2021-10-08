Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6167B426F32
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 18:40:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQv7Q2LWlz3cYP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 03:40:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=g/mGXOsN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=a2QlUY+z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=g/mGXOsN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=a2QlUY+z; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQv320hP9z308v
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 03:36:30 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3295658100F;
 Fri,  8 Oct 2021 12:36:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 08 Oct 2021 12:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=/S0U916Xy3glZ
 0Q5IEN1sZKwKLqmq+2EH0xdy9c4VPo=; b=g/mGXOsNNPSkcKLg3fxV18wZEifDg
 6tW0WCcZ57MK/SfsQL1tFxESrNE/xMfGmKKkDsYF5NSoVfk8DUymIlhtoWATrkvk
 hQLr2MGP4POoyNy9+7vrCKYcnA1gEgSVAsu0LvpnTHjMCZdatnQIF/eGwwitv3Ny
 vBFBU9Al0R2Xrj7V6gGl+xYMK6WuGkKxFHEPvfRUaZiowkBBWd4GGlVXEFMTSQRj
 NLmMxVPgvduIhkVrQisIae3UqoKmMuBlDFNJWyS9L2yXo1KSs0mprCcsCQ2iZz8z
 ksI9kuyE9FZaoZjCD1xT25cwvZbNE3TJMzTGtfGhqk6tMxsMDm+IOXZNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=/S0U916Xy3glZ0Q5IEN1sZKwKLqmq+2EH0xdy9c4VPo=; b=a2QlUY+z
 PByvQYOIlM16mP2IaM4qD+kKdJiAjPxqL8zOGZOvOMXGCURQi+WZg7SOfDJ1v3+e
 9yiuEwoFJrEuxEF6tGPflrzO/TMgoZR8w+RtrFQisTeVAYzqbmsurG5K4kE7zULe
 kynkchKjONg3AdNa/nuWb+Iw1eGSvfjjdapdxS5FHZU1a8fFo2cDRO/ubQyb7F5b
 P5D4SEbb9qeYGqLsHXQ7TAgpMStnT/eftgrrFkyW+Jv9nq4PQQBgMrSTgLYTe6UZ
 szL8vDS19PdfNrXLESTGRmZm63EUiprZKm+WVv30/mpHlCq3RotheiCBcclTcoSx
 tI1YdbakqWbOdQ==
X-ME-Sender: <xms:i3NgYWo5L6Jv0DCG4N3b48J97ISnUKAp15oheCJlA5eqpFNu7tjoMA>
 <xme:i3NgYUrKXp2CUTqLRzMjAZ52YfZzdB1SuymV3ZkXFziXtbKPqH458814BD9uahcb_
 xjpZqrtmvN3e0lb9tE>
X-ME-Received: <xmr:i3NgYbP1ssoBtC48ep_23vw9PriTjYXhK96_lbdkZRMOXr-OvZsad5omB992g2sk8IB-oAs7upW3bsdUMp_QUMQNjRJNhCbHBO2ZxxF3MRywsquiZ8lQQAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
 ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
 gvrhhnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfef
 jeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
 gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:i3NgYV7b2BZeHyTki69zNwu2ltOOn-UDETTy5XA0zDPTAXnucRSPjQ>
 <xmx:i3NgYV6fV4rEg6iZYI24Ki0DhlL7kmXYVuj8xiXuyWOqTNPwFlAsmg>
 <xmx:i3NgYVjrC5BGIqDj5k_3iVGIac4UTUzQnvF6VOq2fdNbIXMWdQ8q5A>
 <xmx:jHNgYcqhq4ASbK0scxerpPUqsSOTqdqR2pjnzHhkcWQnDgIWsVwCsg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:25 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 05/11] i2c: pasemi: Split off common probing code
Date: Fri,  8 Oct 2021 18:35:26 +0200
Message-Id: <20211008163532.75569-6-sven@svenpeter.dev>
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

Split off common probing code that will be used by both the PCI and the
platform device.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: no changes

 drivers/i2c/busses/i2c-pasemi.c | 39 +++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi.c b/drivers/i2c/busses/i2c-pasemi.c
index a018e9376023..baf338149673 100644
--- a/drivers/i2c/busses/i2c-pasemi.c
+++ b/drivers/i2c/busses/i2c-pasemi.c
@@ -329,6 +329,30 @@ static const struct i2c_algorithm smbus_algorithm = {
 	.functionality	= pasemi_smb_func,
 };
 
+static int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
+{
+	int error;
+
+	smbus->adapter.owner = THIS_MODULE;
+	snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
+		 "PA Semi SMBus adapter (%s)", dev_name(smbus->dev));
+	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	smbus->adapter.algo = &smbus_algorithm;
+	smbus->adapter.algo_data = smbus;
+
+	/* set up the sysfs linkage to our parent device */
+	smbus->adapter.dev.parent = smbus->dev;
+
+	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
+		  (CLK_100K_DIV & CTL_CLK_M)));
+
+	error = i2c_add_adapter(&smbus->adapter);
+	if (error)
+		return error;
+
+	return 0;
+}
+
 static int pasemi_smb_probe(struct pci_dev *dev,
 				      const struct pci_device_id *id)
 {
@@ -358,20 +382,7 @@ static int pasemi_smb_probe(struct pci_dev *dev,
 		goto out_release_region;
 	}
 
-	smbus->adapter.owner = THIS_MODULE;
-	snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
-		 "PA Semi SMBus adapter (%s)", dev_name(smbus->dev));
-	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
-	smbus->adapter.algo = &smbus_algorithm;
-	smbus->adapter.algo_data = smbus;
-
-	/* set up the sysfs linkage to our parent device */
-	smbus->adapter.dev.parent = smbus->dev;
-
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
-
-	error = i2c_add_adapter(&smbus->adapter);
+	int error = pasemi_i2c_common_probe(smbus);
 	if (error)
 		goto out_ioport_unmap;
 
-- 
2.25.1

