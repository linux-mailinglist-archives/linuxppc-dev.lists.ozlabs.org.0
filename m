Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C629CC7A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 23:59:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLRwY0x8zzDqNC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 09:59:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=3FiB4+F2; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=rv75+kug; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRr845qxzDqMC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:55:36 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603839328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F4e1jj7WEPocePjy6Hywu9Wq8qr5VByL3erxk5CNuaA=;
 b=3FiB4+F2Ct0QcIJOw0tfFlETx8PA8cgs958H2wTMHeIYNJ0RRxXGs6tAH11rNFnAQDRqXv
 DiV3e6ZVQjCp2kVh+2lqXgAnbKEsoByqjy4HPuMPpPBT+xCjx48lfoOPYGXyL0DGxE5kdj
 Pt8LZvzDp0EniVd+Vjb8qp4JtRGjXpvJNPJfY2HwJvxfIpKTEmy0caMxpZMx7FCNsI/+bq
 gTGW0uTlWOJqLxt/aDjI84arJJ44P90+8mLVO0Hqe1ps2OAY0MlpASYJOeMb8RZ3lPetwz
 PS86UoN0H14FK5bv+UVykEyZ+2DxHYCHpB6sea87Jg4b4sskoPBvobapEA047Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603839328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F4e1jj7WEPocePjy6Hywu9Wq8qr5VByL3erxk5CNuaA=;
 b=rv75+kugraFffbq7nLw3mAS8i1Mg3dMERU51OgwfdltVGaW1rfmkPNdjlHkVLTVjhar4Ts
 4Kor9NM6UXqalcDw==
To: netdev@vger.kernel.org
Subject: [PATCH net-next 01/15] net: orinoco: Remove BUG_ON(in_interrupt/irq())
Date: Tue, 27 Oct 2020 23:54:40 +0100
Message-Id: <20201027225454.3492351-2-bigeasy@linutronix.de>
In-Reply-To: <20201027225454.3492351-1-bigeasy@linutronix.de>
References: <20201027225454.3492351-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Zhu Yanjun <zyjzyj2000@gmail.com>, Samuel Chessman <chessman@tux.org>,
 Ping-Ke Shih <pkshih@realtek.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
 linux-rdma@vger.kernel.org, Rain River <rain.1986.08.12@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Ulrich Kunitz <kune@deine-taler.de>,
 Jouni Malinen <j@w1.fi>, Daniel Drake <dsd@gentoo.org>,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Leon Romanovsky <leon@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, linux-crypto@vger.kernel.org,
 Jon Mason <jdmason@kudzu.us>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The usage of in_irq()/in_interrupt() in drivers is phased out and the
BUG_ON()'s based on those are not covering all contexts in which these
functions cannot be called.

Aside of that BUG_ON() should only be used as last resort, which is clearly
not the case here.

A broad variety of checks in the invoked functions (always enabled or debug
option dependent) cover these conditions already, so the BUG_ON()'s do not
really provide additional value.

Just remove them.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
---
 drivers/net/wireless/intersil/orinoco/orinoco_usb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/intersil/orinoco/orinoco_usb.c b/drivers/=
net/wireless/intersil/orinoco/orinoco_usb.c
index b849d27bd741e..046f2453ad5d9 100644
--- a/drivers/net/wireless/intersil/orinoco/orinoco_usb.c
+++ b/drivers/net/wireless/intersil/orinoco/orinoco_usb.c
@@ -859,8 +859,6 @@ static int ezusb_access_ltv(struct ezusb_priv *upriv,
 	int retval =3D 0;
 	enum ezusb_state state;
=20
-	BUG_ON(in_irq());
-
 	if (!upriv->udev) {
 		retval =3D -ENODEV;
 		goto exit;
@@ -1349,7 +1347,6 @@ static int ezusb_init(struct hermes *hw)
 	struct ezusb_priv *upriv =3D hw->priv;
 	int retval;
=20
-	BUG_ON(in_interrupt());
 	if (!upriv)
 		return -EINVAL;
=20
@@ -1448,7 +1445,6 @@ static inline void ezusb_delete(struct ezusb_priv *up=
riv)
 	struct list_head *tmp_item;
 	unsigned long flags;
=20
-	BUG_ON(in_interrupt());
 	BUG_ON(!upriv);
=20
 	mutex_lock(&upriv->mtx);
--=20
2.28.0

