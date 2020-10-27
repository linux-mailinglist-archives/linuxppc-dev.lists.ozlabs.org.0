Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B135429CC9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 00:14:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLSGH63TFzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 10:14:47 +1100 (AEDT)
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
 header.s=2020 header.b=bMHlhllu; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=F+okaaPl; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRrn1MjLzDqNw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:56:09 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603839355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecxJzZtRribDKzKIiwElpzea91WJXQDRkjrSNkyvp44=;
 b=bMHlhlluCx8UyhuU9NTXFEBFBDPzmifO9O7nsSBrqtLd+vr4IXh9AiD/7K0zGUjEiHeczw
 11cc4w8mxNiAF8ibzLraKYfn9RPhxYf4MtwYhVbwMuDsFMoxLHA/DSgHVzUj4DyGyD3vPW
 E2tipXy7jDjfZE0npmPtMrXPiWTv01kHZhkmvY8bq7w3Z8ZeikEww4mvYZCUOYPqraVy1S
 gwdqr3G3BB9h9qxhCr8fJdTDRs1LYzp2vzKChp8W4yBFl2siku3YD3x2aLGnerVg7aNO60
 y45jk/Re/uruKE8kGCYWFbVhlc7ZjQL3Dk63LQoOdWHzf+Ni6Jkp2iVd0fOseQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603839355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecxJzZtRribDKzKIiwElpzea91WJXQDRkjrSNkyvp44=;
 b=F+okaaPlS1iKiuSjJd/s7xvfHx4naujCeq35xuq8TIJfx0CUcb4GntS5xPg3EjWk1mcjb2
 f+BuFsDmP7NUaeAg==
To: netdev@vger.kernel.org
Subject: [PATCH net-next 09/15] net: hostap: Remove in_atomic() check.
Date: Tue, 27 Oct 2020 23:54:48 +0100
Message-Id: <20201027225454.3492351-10-bigeasy@linutronix.de>
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

hostap_get_wireless_stats() is the iw_handler_if::get_wireless_stats()
callback of this driver. This callback was not allowed to sleep until
commit a160ee69c6a46 ("wext: let get_wireless_stats() sleep") in v2.6.32.

Remove the therefore pointless in_atomic() check.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jouni Malinen <j@w1.fi>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
---
 drivers/net/wireless/intersil/hostap/hostap_ioctl.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/net/wireless/intersil/hostap/hostap_ioctl.c b/drivers/=
net/wireless/intersil/hostap/hostap_ioctl.c
index 514c7b01dbf6f..49766b285230c 100644
--- a/drivers/net/wireless/intersil/hostap/hostap_ioctl.c
+++ b/drivers/net/wireless/intersil/hostap/hostap_ioctl.c
@@ -44,19 +44,8 @@ static struct iw_statistics *hostap_get_wireless_stats(s=
truct net_device *dev)
=20
 	if (local->iw_mode !=3D IW_MODE_MASTER &&
 	    local->iw_mode !=3D IW_MODE_REPEAT) {
-		int update =3D 1;
-#ifdef in_atomic
-		/* RID reading might sleep and it must not be called in
-		 * interrupt context or while atomic. However, this
-		 * function seems to be called while atomic (at least in Linux
-		 * 2.5.59). Update signal quality values only if in suitable
-		 * context. Otherwise, previous values read from tick timer
-		 * will be used. */
-		if (in_atomic())
-			update =3D 0;
-#endif /* in_atomic */
=20
-		if (update && prism2_update_comms_qual(dev) =3D=3D 0)
+		if (prism2_update_comms_qual(dev) =3D=3D 0)
 			wstats->qual.updated =3D IW_QUAL_ALL_UPDATED |
 				IW_QUAL_DBM;
=20
--=20
2.28.0

