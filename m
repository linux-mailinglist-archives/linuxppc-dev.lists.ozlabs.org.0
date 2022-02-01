Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AAC4A67F8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 23:28:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpKM56Ltjz30QB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 09:28:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail2 header.b=Nj2VpdP9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.41.103;
 helo=mail-41103.protonmail.ch; envelope-from=povik+lin@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail2 header.b=Nj2VpdP9; 
 dkim-atps=neutral
X-Greylist: delayed 546 seconds by postgrey-1.36 at boromir;
 Wed, 02 Feb 2022 09:04:40 AEDT
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpJr80MsMz2xKT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 09:04:39 +1100 (AEDT)
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com
 [51.77.79.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4JpJdb0srwz4wwwl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 21:55:31 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="Nj2VpdP9"
Date: Tue, 01 Feb 2022 21:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail2; t=1643752520;
 bh=91s3sGuD9seTYS3Ogxew71E+mOhxkkUpmHyteD5lQYM=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc;
 b=Nj2VpdP9IUK4HWRBFBe0ppWR8BeLgyd7zTXh2q9IK+6d+2YUPyJyv8Iic7GUrFc1k
 9eDmYS5GlnGLQLdEpQaXGoloKuW98BQLzBLxBtBCT4Ef8Ca9bT6ayuZdcIM4aRTQxF
 y89V15ex58Lo+DPUhE7kl2l5f1EvMtDMIUrFKvov9YFxW8WV5e0QwB0e9TgBZCMvW2
 qZFHJ2YScB32TyldQZNI2Lxgfo9IXFSTdETuO13GdeSzrScLpddU7mLaoBPRRzZPQs
 ddY6Xc+yTdwSA9oYKUTE6FgCFl99x/6tT6sNs5Im75YvJ+/SoFpMTVXSm0ucOD1lKr
 nhMw6v51t5rrg==
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Wolfram Sang <wsa@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@protonmail.com>
Subject: [PATCH] i2c: pasemi: Drop I2C classes from platform driver variant
Message-ID: <20220201215435.61967-1-povik+lin@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-Mailman-Approved-At: Wed, 02 Feb 2022 09:27:27 +1100
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
Reply-To: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@protonmail.com>
Cc: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@protonmail.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop I2C device-probing classes from platform variant of the PASemi
controller as it is only used on platforms where I2C devices should
be instantiated in devicetree. (The I2C_CLASS_DEPRECATED flag is not
raised as up to this point no devices relied on the old behavior.)

Fixes: d88ae2932df0 ("i2c: pasemi: Add Apple platform driver")
Signed-off-by: Martin Povi=C5=A1er <povik+lin@protonmail.com>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 1 -
 drivers/i2c/busses/i2c-pasemi-pci.c  | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-=
pasemi-core.c
index 4e161a4089d8..7728c8460dc0 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -333,7 +333,6 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
 =09smbus->adapter.owner =3D THIS_MODULE;
 =09snprintf(smbus->adapter.name, sizeof(smbus->adapter.name),
 =09=09 "PA Semi SMBus adapter (%s)", dev_name(smbus->dev));
-=09smbus->adapter.class =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;
 =09smbus->adapter.algo =3D &smbus_algorithm;
 =09smbus->adapter.algo_data =3D smbus;

diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-p=
asemi-pci.c
index 1ab1f28744fb..cfc89e04eb94 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -56,6 +56,7 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 =09if (!smbus->ioaddr)
 =09=09return -EBUSY;

+=09smbus->adapter.class =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;
 =09error =3D pasemi_i2c_common_probe(smbus);
 =09if (error)
 =09=09return error;
--
2.33.0


