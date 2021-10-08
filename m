Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62777426F39
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 18:41:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQv971zy2z3cmq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 03:41:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm2 header.b=qHzfzmqz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NvieJBEY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=svenpeter.dev (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev
 header.a=rsa-sha256 header.s=fm2 header.b=qHzfzmqz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=NvieJBEY; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQv391rqKz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 03:36:37 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4CF92581015;
 Fri,  8 Oct 2021 12:36:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 08 Oct 2021 12:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=EqH0ZsHiaEtwh
 Gi9zyJrCeQh7KgGC2k47TQ9WU71+SM=; b=qHzfzmqzTb5HjdBSQQUrPULx3wCyo
 vkDYdYvnmjYNIRJpNS6cgV3O1A5Wd96nHW1bzrhFRSZDNS2ZN5oPebwyQzSpWthn
 e21+jAVFN/zSZ6aYqA+18Cr5XHLu4xR9lnS9za8X9quhQUjbT0BdjdzEHNuVb5pl
 77iWZx8O+x0ZuqdplbIxIFUg1GZU7GnnJ5Hf7RHwuiIVdDUkWxoVVKt3WNFhMv8C
 iTYiVUllWaTeYMg0eg40XGjNY9k+d6ARTn5p9GfUd89Y+8gR+qDIGJV7NUSdaSCl
 2c/lRnZexw6HrcKewX1AtPkLdUpPCsAErWceJuUAkXQcKHOM+75YHBk1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=EqH0ZsHiaEtwhGi9zyJrCeQh7KgGC2k47TQ9WU71+SM=; b=NvieJBEY
 AqZCkkdT9cfTcHNcfv3MrAOB8DwlF13r3rjCasDMtlNTGNy1sLqplD6iFqTR+f2B
 6CdP4+zNaycV9ENcsLtr/wNvB8b49MJzrr4gMgAcwL0Ls3HLGBLO//8duqEwRhmg
 0oalKDfWcIp6jOWoXAGcNTi62ro+OWxwFkiZdBkSUbg9dlKTIKRmYXLE3s/AreqK
 ADWSGjjA2QFpD0vgOesbE6YLG0Zgi2SPB6y/gN7tzOP0FtM0jdUrDgGbFG14Fs9c
 mD9Q5NaKufYF8fRDS1RW/PS+86yVzdDOD7EajMgbbe/EI/Q0PewOZx0PK3ZfYVSW
 9P5e4FgYqfyJeQ==
X-ME-Sender: <xms:k3NgYY4Nq65ExKaZ6SRkRVCCPIJb0rHWsKhpvU0w_mHBLNxSx52IRA>
 <xme:k3NgYZ514PeCc5k96MhLQs3abyyO9bdjcvgVSG_58mOh6q3qMaIxccKd7GoixMmLb
 XVoV5w9DGr5Oij_rdA>
X-ME-Received: <xmr:k3NgYXdgRp1qsdyU58xOZlXu01o1WmJzVgP18LKCjqQgnyXKYGwqibN2yCmj9rhRoBIS1t5ZxLY1_AP2YsGS_1J70K4WocOrGRM5OOSmprwktNsaEejues4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufhvvghn
 ucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrghtth
 gvrhhnpeetvdekteeluefffffhkeetteffgefggfevheeileeufedvtdeuffevveelhfef
 jeenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvh
 gvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:k3NgYdJoOZYzZQJ4e37ZrgXc5_cYq04CJIL8Jauurk07vuWdrS1wqg>
 <xmx:k3NgYcIReoRbNBBfE4CxTd4z9lbHlfBWoR2YwzuggpzfniB1Y96c2Q>
 <xmx:k3NgYex3rC-H4EGr_JOb79L_Wa4RI8QosgdIjgR_3kQOGH2A7M_5tw>
 <xmx:k3NgYZ4AlFG08KKEOFy8jHziMXlxJcGnJyWbzU7MjDAHjNr1HR5gcg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 12:36:33 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 07/11] i2c: pasemi: Move common reset code to own function
Date: Fri,  8 Oct 2021 18:35:28 +0200
Message-Id: <20211008163532.75569-8-sven@svenpeter.dev>
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

Split out common reset call to its own function so that we
can later add support for selecting the clock frequency
and an additional enable bit found in newer revisions.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
v1 -> v2: no changes

 drivers/i2c/busses/i2c-pasemi-core.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index d1cab11a4d50..232587c70a38 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -61,6 +61,12 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 #define TXFIFO_WR(smbus, reg)	reg_write((smbus), REG_MTXFIFO, (reg))
 #define RXFIFO_RD(smbus)	reg_read((smbus), REG_MRXFIFO)
 
+static void pasemi_reset(struct pasemi_smbus *smbus)
+{
+	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
+		  (CLK_100K_DIV & CTL_CLK_M)));
+}
+
 static void pasemi_smb_clear(struct pasemi_smbus *smbus)
 {
 	unsigned int status;
@@ -135,8 +141,7 @@ static int pasemi_i2c_xfer_msg(struct i2c_adapter *adapter,
 	return 0;
 
  reset_out:
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
+	pasemi_reset(smbus);
 	return err;
 }
 
@@ -302,8 +307,7 @@ static int pasemi_smb_xfer(struct i2c_adapter *adapter,
 	return 0;
 
  reset_out:
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
+	pasemi_reset(smbus);
 	return err;
 }
 
@@ -335,8 +339,7 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 	/* set up the sysfs linkage to our parent device */
 	smbus->adapter.dev.parent = smbus->dev;
 
-	reg_write(smbus, REG_CTL, (CTL_MTR | CTL_MRR |
-		  (CLK_100K_DIV & CTL_CLK_M)));
+	pasemi_reset(smbus);
 
 	error = i2c_add_adapter(&smbus->adapter);
 	if (error)
-- 
2.25.1

