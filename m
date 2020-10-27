Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C3329CC9C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 00:12:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLSD06kDWzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 10:12:48 +1100 (AEDT)
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
 header.s=2020 header.b=IrVDFjU5; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=1hcOJSQq; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRrd58C4zDqN7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:56:01 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603839357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjmStdTYpXx0Q5cgHBNYgoGt1xQMDGvpBhIAE5x62bo=;
 b=IrVDFjU5wiUh3/1b+EWqAdpLz9jEaa0feaxAB0seewu3KP62xQWrIDIDRFVfJR88akb5V8
 pixqewfSpPphy6wjIpk84kuwnoRmYibI+WPGXbSjRtkxqKuGHv479c5O+07RtRHzWP9EyO
 /XS2O6gq02ndIa9jvIju3YeZBwPe7jdNPpcZYA5f5c/yCRKzmmvrHi/lomT6/LJwNTuzDq
 79tALLYTDN3HvBlJ21WplNePz/PcB96jD/urLc/mb0VXNxgXdrKoOYIKtApY4oS3NuMRJx
 udPmRn5otfroi+DJXX7goaPxUdhrmyFNBJYKUfaap+PqN/QIS+Vy6OoaWTLFrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603839357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjmStdTYpXx0Q5cgHBNYgoGt1xQMDGvpBhIAE5x62bo=;
 b=1hcOJSQqWKvZ0z3m9yg8HSR6q16whMj9tbVFBVxwm9sIAnvgysjdR0EPOnpijehHN6jTXv
 eMzOMmrlvWnhypDQ==
To: netdev@vger.kernel.org
Subject: [PATCH net-next 10/15] net: zd1211rw: Remove in_atomic() usage.
Date: Tue, 27 Oct 2020 23:54:49 +0100
Message-Id: <20201027225454.3492351-11-bigeasy@linutronix.de>
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

The usage of in_atomic() in driver code is deprecated as it can not
always detect all states where it is not allowed to sleep.

All callers are in premptible thread context and all functions invoke core
functions which have checks for invalid calling contexts already.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Daniel Drake <dsd@gentoo.org>
Cc: Ulrich Kunitz <kune@deine-taler.de>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
---
 drivers/net/wireless/zydas/zd1211rw/zd_usb.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/net/wireless/zydas/zd1211rw/zd_usb.c b/drivers/net/wir=
eless/zydas/zd1211rw/zd_usb.c
index 66367ab7e4c1e..5c4cd0e1adebb 100644
--- a/drivers/net/wireless/zydas/zd1211rw/zd_usb.c
+++ b/drivers/net/wireless/zydas/zd1211rw/zd_usb.c
@@ -1711,11 +1711,6 @@ int zd_usb_ioread16v(struct zd_usb *usb, u16 *values,
 			 count, USB_MAX_IOREAD16_COUNT);
 		return -EINVAL;
 	}
-	if (in_atomic()) {
-		dev_dbg_f(zd_usb_dev(usb),
-			 "error: io in atomic context not supported\n");
-		return -EWOULDBLOCK;
-	}
 	if (!usb_int_enabled(usb)) {
 		dev_dbg_f(zd_usb_dev(usb),
 			  "error: usb interrupt not enabled\n");
@@ -1882,11 +1877,6 @@ int zd_usb_iowrite16v_async(struct zd_usb *usb, cons=
t struct zd_ioreq16 *ioreqs,
 			count, USB_MAX_IOWRITE16_COUNT);
 		return -EINVAL;
 	}
-	if (in_atomic()) {
-		dev_dbg_f(zd_usb_dev(usb),
-			"error: io in atomic context not supported\n");
-		return -EWOULDBLOCK;
-	}
=20
 	udev =3D zd_usb_to_usbdev(usb);
=20
@@ -1966,11 +1956,6 @@ int zd_usb_rfwrite(struct zd_usb *usb, u32 value, u8=
 bits)
 	int i, req_len, actual_req_len;
 	u16 bit_value_template;
=20
-	if (in_atomic()) {
-		dev_dbg_f(zd_usb_dev(usb),
-			"error: io in atomic context not supported\n");
-		return -EWOULDBLOCK;
-	}
 	if (bits < USB_MIN_RFWRITE_BIT_COUNT) {
 		dev_dbg_f(zd_usb_dev(usb),
 			"error: bits %d are smaller than"
--=20
2.28.0

