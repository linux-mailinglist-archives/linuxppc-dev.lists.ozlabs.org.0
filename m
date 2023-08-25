Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 673017893B6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 05:55:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXjdM1n3Bz3cNl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 13:55:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=astralinux.ru (client-ip=217.74.38.119; helo=mail.astralinux.ru; envelope-from=adiupina@astralinux.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 373 seconds by postgrey-1.37 at boromir; Sat, 26 Aug 2023 00:38:20 AEST
Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXMy42N5Fz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 00:38:19 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 88D0F1867F2E;
	Fri, 25 Aug 2023 17:31:59 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8GwYOjxrMV8q; Fri, 25 Aug 2023 17:31:59 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 1579C1866E63;
	Fri, 25 Aug 2023 17:31:59 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Mw8i77wbVndL; Fri, 25 Aug 2023 17:31:58 +0300 (MSK)
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.233.189])
	by mail.astralinux.ru (Postfix) with ESMTPSA id A98BD1867E38;
	Fri, 25 Aug 2023 17:31:57 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH] fsl_ucc_hdlc: add a check of the return value from hdlc_open
Date: Fri, 25 Aug 2023 17:31:12 +0300
Message-Id: <20230825143112.16184-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 26 Aug 2023 13:54:38 +1000
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
Cc: Alexandra Diupina <adiupina@astralinux.ru>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, lvc-project@linuxtesting.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Process the result of hold_open() and return it from
uhdlc_open() in case of an error
It is necessary to pass the error code up the control flow,
similar to a possible error in request_irq()

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: c19b6d246a35 ("drivers/net: support hdlc function for QE-UCC")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 drivers/net/wan/fsl_ucc_hdlc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdl=
c.c
index 47c2ad7a3e42..cdd9489c712e 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -708,6 +708,7 @@ static int uhdlc_open(struct net_device *dev)
 	hdlc_device *hdlc =3D dev_to_hdlc(dev);
 	struct ucc_hdlc_private *priv =3D hdlc->priv;
 	struct ucc_tdm *utdm =3D priv->utdm;
+	int rc =3D 0;
=20
 	if (priv->hdlc_busy !=3D 1) {
 		if (request_irq(priv->ut_info->uf_info.irq,
@@ -731,10 +732,12 @@ static int uhdlc_open(struct net_device *dev)
 		napi_enable(&priv->napi);
 		netdev_reset_queue(dev);
 		netif_start_queue(dev);
-		hdlc_open(dev);
+		rc =3D hdlc_open(dev);
+		if (rc)
+			return rc;
 	}
=20
-	return 0;
+	return rc;
 }
=20
 static void uhdlc_memclean(struct ucc_hdlc_private *priv)
--=20
2.30.2

