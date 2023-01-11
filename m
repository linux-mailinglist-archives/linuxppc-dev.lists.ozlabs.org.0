Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0A9666429
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 20:56:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsdjH0z3Gz3fBZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 06:56:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=astralinux.ru (client-ip=217.74.38.119; helo=mail.astralinux.ru; envelope-from=eesina@astralinux.ru; receiver=<UNKNOWN>)
Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nsdhg711Mz303P
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 06:55:46 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id AF4D318631FE;
	Wed, 11 Jan 2023 22:55:39 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id v5ixd9kkAFuB; Wed, 11 Jan 2023 22:55:39 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 5EB981863D8C;
	Wed, 11 Jan 2023 22:55:39 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id k3e5njk-Uncm; Wed, 11 Jan 2023 22:55:39 +0300 (MSK)
Received: from ekaterina-MACHD-WXX9.. (host-189-224.skynet-msk.ru [91.227.189.224])
	by mail.astralinux.ru (Postfix) with ESMTPSA id 98CC418631FE;
	Wed, 11 Jan 2023 22:55:38 +0300 (MSK)
From: Esina Ekaterina <eesina@astralinux.ru>
To: Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH v4] net: wan: Add checks for NULL for utdm in  undo_uhdlc_init and unmap_si_regs
Date: Wed, 11 Jan 2023 22:55:33 +0300
Message-Id: <20230111195533.82519-1-eesina@astralinux.ru>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111102848.44863b9c@kernel.org>
References: 
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
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Esina Ekaterina <eesina@astralinux.ru>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If uhdlc_priv_tsa !=3D 1 then utdm is not initialized.
And if ret !=3D NULL then goto undo_uhdlc_init, where
utdm is dereferenced. Same if dev =3D=3D NULL.

Found by Astra Linux on behalf of Linux Verification Center
(linuxtesting.org) with SVACE.

Signed-off-by: Esina Ekaterina <eesina@astralinux.ru>
  ---
v4: Fix style
v3: Remove braces
v2: Add check for NULL for unmap_si_regs
---
 drivers/net/wan/fsl_ucc_hdlc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdl=
c.c
index 22edea6ca4b8..1c53b5546927 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -1243,9 +1243,11 @@ static int ucc_hdlc_probe(struct platform_device *=
pdev)
 free_dev:
 	free_netdev(dev);
 undo_uhdlc_init:
-	iounmap(utdm->siram);
+	if (utdm)
+		iounmap(utdm->siram);
 unmap_si_regs:
-	iounmap(utdm->si_regs);
+	if (utdm)
+		iounmap(utdm->si_regs);
 free_utdm:
 	if (uhdlc_priv->tsa)
 		kfree(utdm);
--=20
2.39.0

