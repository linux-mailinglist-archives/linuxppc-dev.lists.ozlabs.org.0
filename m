Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356729CC95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 00:09:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLS7b1Zv2zDqQb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 10:08:59 +1100 (AEDT)
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
 header.s=2020 header.b=3kp7YDf0; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=xGAdgcHv; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRrX3D3jzDqNJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:55:56 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603839348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApwQCgaMixcuC9eYB2lgT0F8OtvMn3mKtyMgUXQslP0=;
 b=3kp7YDf0JW3dUiXKR/lIkGaq9IUzvbof2U+ioaOEM0BXZ25zKHZ3VvKuUCeYh6GTrBpfNm
 GRwCN13HX21o0SlkuNx5V3Vsv+ceb2O2cK7q2g/9RWMajdYHHyg7LbgRGpePukCXT+FW94
 zxSs77FFszQUu3jBPzmNd0L9yWdS1ctJhQZJ4aPxrjFcMaUZeiA2uxMMbxrKJxSMeMh8cO
 r/f2cAZmd40765LdmanfOcBrvIuywbt8AXl2532QDscJylvxZHgZvGB4lysvx4ioXvLOX1
 thtT1pxIN/tGyj/2hDhPGcArtzXTAydNZAuzy7DpYVeva9MxWbS2OrkDypdpFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603839348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApwQCgaMixcuC9eYB2lgT0F8OtvMn3mKtyMgUXQslP0=;
 b=xGAdgcHvBjsBbyq8waqxdv8AKE7ZVadlKCP9fhj2yu2LxgTB7Lwz1WNyHMgs1SQY6+RaF0
 /TJFp2upKtsb3RBQ==
To: netdev@vger.kernel.org
Subject: [PATCH net-next 04/15] net: mlx5: Replace in_irq() usage.
Date: Tue, 27 Oct 2020 23:54:43 +0100
Message-Id: <20201027225454.3492351-5-bigeasy@linutronix.de>
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

mlx5_eq_async_int() uses in_irq() to decide whether eq::lock needs to be
acquired and released with spin_[un]lock() or the irq saving/restoring
variants.

The usage of in_*() in drivers is phased out and Linus clearly requested
that code which changes behaviour depending on context should either be
seperated or the context be conveyed in an argument passed by the caller,
which usually knows the context.

mlx5_eq_async_int() knows the context via the action argument already so
using it for the lock variant decision is a straight forward replacement
for in_irq().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Saeed Mahameed <saeedm@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linux-rdma@vger.kernel.org
---
 drivers/net/ethernet/mellanox/mlx5/core/eq.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eq.c b/drivers/net/eth=
ernet/mellanox/mlx5/core/eq.c
index 8ebfe782f95e5..3800e9415158b 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eq.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eq.c
@@ -189,19 +189,21 @@ u32 mlx5_eq_poll_irq_disabled(struct mlx5_eq_comp *eq)
 	return count_eqe;
 }
=20
-static void mlx5_eq_async_int_lock(struct mlx5_eq_async *eq, unsigned long=
 *flags)
+static void mlx5_eq_async_int_lock(struct mlx5_eq_async *eq, bool recovery,
+				   unsigned long *flags)
 	__acquires(&eq->lock)
 {
-	if (in_irq())
+	if (!recovery)
 		spin_lock(&eq->lock);
 	else
 		spin_lock_irqsave(&eq->lock, *flags);
 }
=20
-static void mlx5_eq_async_int_unlock(struct mlx5_eq_async *eq, unsigned lo=
ng *flags)
+static void mlx5_eq_async_int_unlock(struct mlx5_eq_async *eq, bool recove=
ry,
+				     unsigned long *flags)
 	__releases(&eq->lock)
 {
-	if (in_irq())
+	if (!recovery)
 		spin_unlock(&eq->lock);
 	else
 		spin_unlock_irqrestore(&eq->lock, *flags);
@@ -222,12 +224,14 @@ static int mlx5_eq_async_int(struct notifier_block *n=
b,
 	struct mlx5_core_dev *dev;
 	struct mlx5_eqe *eqe;
 	unsigned long flags;
+	bool recovery;
 	int num_eqes =3D 0;
=20
 	dev =3D eq->dev;
 	eqt =3D dev->priv.eq_table;
=20
-	mlx5_eq_async_int_lock(eq_async, &flags);
+	recovery =3D action =3D=3D ASYNC_EQ_RECOVER;
+	mlx5_eq_async_int_lock(eq_async, recovery, &flags);
=20
 	eqe =3D next_eqe_sw(eq);
 	if (!eqe)
@@ -249,9 +253,9 @@ static int mlx5_eq_async_int(struct notifier_block *nb,
=20
 out:
 	eq_update_ci(eq, 1);
-	mlx5_eq_async_int_unlock(eq_async, &flags);
+	mlx5_eq_async_int_unlock(eq_async, recovery, &flags);
=20
-	return unlikely(action =3D=3D ASYNC_EQ_RECOVER) ? num_eqes : 0;
+	return unlikely(recovery) ? num_eqes : 0;
 }
=20
 void mlx5_cmd_eq_recover(struct mlx5_core_dev *dev)
--=20
2.28.0

