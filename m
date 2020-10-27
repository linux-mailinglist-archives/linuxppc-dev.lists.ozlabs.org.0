Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC17C29CC9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 00:11:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLS9y1kvBzDqDl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 10:11:02 +1100 (AEDT)
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
 header.s=2020 header.b=g9gqclAg; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=3pu8A+mw; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRrd4cYtzDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:56:01 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603839353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHsm8MJPK4Ur0LbpXXnCUbJyu0caOerJrH2+ye+Subo=;
 b=g9gqclAgDAf3eJ1BzG/Tjo6c3Wjzvg/2fO6fd0T8GBNT+WzPxY2DVEYi+F9Gvd+ktf+TEC
 WZu1xS6DQTgKQ6xtk5aRay4F1JP5dovJNmHPK/Jd/iC5z2TbEqpBOXFGIA6gGP1UD3DlBn
 rPtlUrfNxA1kPVS1Jto98k1ccQzCwJ4D7PSTpzfyXH+r463MHvnIryOV7bKk9tCEWkYXLd
 RR5zVi1h7i7bGbbI5c2HQPyzKxbOfTy6Hmj7lfCVkajbWk+v/hmoCUyU//Be0NoBUEgNIq
 nDVhsDeb8kv7uGwK7UZh5McvCCDUdQSqx0foVktzkZ98kiWEDi2kv8nVlws46Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603839353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHsm8MJPK4Ur0LbpXXnCUbJyu0caOerJrH2+ye+Subo=;
 b=3pu8A+mwxh3mhIXxUiir7K7vb09NmYUGtA31VB2CEtZ6pEKV8Cnze51kmc1BQ9Ksoyw8ug
 oP8DR7dDU3HBjKBQ==
To: netdev@vger.kernel.org
Subject: [PATCH net-next 07/15] net: airo: Always use JOB_STATS and JOB_EVENT
Date: Tue, 27 Oct 2020 23:54:46 +0100
Message-Id: <20201027225454.3492351-8-bigeasy@linutronix.de>
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

issuecommand() is using in_atomic() to decide if it is safe to invoke
schedule() while waiting for the command to be accepted.

Usage of in_atomic() for this is only half correct as it can not detect all
condition where it is not allowed to schedule(). Also Linus clearly
requested that code which changes behaviour depending on context should
either be seperated or the context be conveyed in an argument passed by the
caller, which usually knows the context.

Chasing the call chains leading up to issuecommand() is straight forward,
but airo_link() and airo_get_stats() would require to pass the context
through a quite large amount of functions.

As this is ancient hardware, avoid the churn and enforce the invocation of
those functions through the JOB machinery.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
---
 drivers/net/wireless/cisco/airo.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/cisco/airo.c b/drivers/net/wireless/cisco=
/airo.c
index ca423f3b6b3ea..369a6ca44d1ff 100644
--- a/drivers/net/wireless/cisco/airo.c
+++ b/drivers/net/wireless/cisco/airo.c
@@ -2286,12 +2286,8 @@ static struct net_device_stats *airo_get_stats(struc=
t net_device *dev)
 	struct airo_info *local =3D  dev->ml_priv;
=20
 	if (!test_bit(JOB_STATS, &local->jobs)) {
-		/* Get stats out of the card if available */
-		if (down_trylock(&local->sem) !=3D 0) {
-			set_bit(JOB_STATS, &local->jobs);
-			wake_up_interruptible(&local->thr_wait);
-		} else
-			airo_read_stats(dev);
+		set_bit(JOB_STATS, &local->jobs);
+		wake_up_interruptible(&local->thr_wait);
 	}
=20
 	return &dev->stats;
@@ -3277,11 +3273,9 @@ static void airo_handle_link(struct airo_info *ai)
 		set_bit(FLAG_UPDATE_UNI, &ai->flags);
 		set_bit(FLAG_UPDATE_MULTI, &ai->flags);
=20
-		if (down_trylock(&ai->sem) !=3D 0) {
-			set_bit(JOB_EVENT, &ai->jobs);
-			wake_up_interruptible(&ai->thr_wait);
-		} else
-			airo_send_event(ai->dev);
+		set_bit(JOB_EVENT, &ai->jobs);
+		wake_up_interruptible(&ai->thr_wait);
+
 		netif_carrier_on(ai->dev);
 	} else if (!scan_forceloss) {
 		if (auto_wep && !ai->expires) {
--=20
2.28.0

