Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 593D629CC8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 00:05:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLS3c0MwPzDqLZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 10:05:32 +1100 (AEDT)
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
 header.s=2020 header.b=ras1ZN9p; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=v4kTPiwV; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRrV1DGTzDqPK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:55:53 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603839347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NCh5w9ecP7hR6Lh6yrwLcXDxY3S9AS4A8O59ClkmQuc=;
 b=ras1ZN9p/0s71wAw6BiBK7tQahnylR+TBxJ5FU+RyyAUd654I45XroAagmXNcOhZGwycQU
 JuB4srVEeq8JEdNYcazZGYxW43kHEWBW5olkexuNTx+ROG4rW4+lIg6oh7RjFfnmiYIMSa
 wja8WVkTfnwqG5yCdjniR3JYvVzyFeZ5xY4gUgFa/48uACynrZzW+jFjl7+Gm1Ak37HK8p
 i/LKjYW8uioJWsvMjaEFv0DOxsaAb1xs+tCGlkELjceM3XFKR9pZVfCoL3oL63qwaBCct1
 uDLBmNS2D4JG5AgIEUYeAmWi2edcivpTlNAp8bjFhFJaHoQh3tvbl3SKJ1tFdA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603839347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NCh5w9ecP7hR6Lh6yrwLcXDxY3S9AS4A8O59ClkmQuc=;
 b=v4kTPiwVtn0BHjC1H1qdUC0DOW5ocQSNsfxbnR+jglqhT5b2wBt7em4IRx8CX07gIiVoDE
 zxqH636veSWAMICg==
To: netdev@vger.kernel.org
Subject: [PATCH net-next 03/15] net: forcedeth: Replace context and lock check
 with a lockdep_assert()
Date: Tue, 27 Oct 2020 23:54:42 +0100
Message-Id: <20201027225454.3492351-4-bigeasy@linutronix.de>
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

nv_update_stats() triggers a WARN_ON() when invoked from hard interrupt
context because the locks in use are not hard interrupt safe. It also has
an assert_spin_locked() which was the lock check before the lockdep era.

Lockdep has way broader locking correctness checks and covers both issues,
so replace the warning and the lock assert with lockdep_assert_held().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Rain River <rain.1986.08.12@gmail.com>
Cc: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org
---
 drivers/net/ethernet/nvidia/forcedeth.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/nvidia/forcedeth.c b/drivers/net/ethernet=
/nvidia/forcedeth.c
index 2fc10a36afa4a..7e85cf943be11 100644
--- a/drivers/net/ethernet/nvidia/forcedeth.c
+++ b/drivers/net/ethernet/nvidia/forcedeth.c
@@ -1666,11 +1666,7 @@ static void nv_update_stats(struct net_device *dev)
 	struct fe_priv *np =3D netdev_priv(dev);
 	u8 __iomem *base =3D get_hwbase(dev);
=20
-	/* If it happens that this is run in top-half context, then
-	 * replace the spin_lock of hwstats_lock with
-	 * spin_lock_irqsave() in calling functions. */
-	WARN_ONCE(in_irq(), "forcedeth: estats spin_lock(_bh) from top-half");
-	assert_spin_locked(&np->hwstats_lock);
+	lockdep_assert_held(&np->hwstats_lock);
=20
 	/* query hardware */
 	np->estats.tx_bytes +=3D readl(base + NvRegTxCnt);
--=20
2.28.0

