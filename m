Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E807F7A669B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 16:25:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqkV66XgWz3cPf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 00:25:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=astralinux.ru (client-ip=217.74.38.119; helo=mail.astralinux.ru; envelope-from=adiupina@astralinux.ru; receiver=lists.ozlabs.org)
Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqkTY2mPfz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 00:25:19 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id CF242186686B;
	Tue, 19 Sep 2023 17:25:12 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id txwk927cRQHZ; Tue, 19 Sep 2023 17:25:12 +0300 (MSK)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 72C471866AFE;
	Tue, 19 Sep 2023 17:25:12 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id HIkNsWFKyl_9; Tue, 19 Sep 2023 17:25:12 +0300 (MSK)
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.235.105])
	by mail.astralinux.ru (Postfix) with ESMTPSA id DE370186681B;
	Tue, 19 Sep 2023 17:25:10 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH v5] drivers/net: process the result of hdlc_open() and add call of hdlc_close() in uhdlc_close()
Date: Tue, 19 Sep 2023 17:25:02 +0300
Message-Id: <20230919142502.13898-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <c1437313a3fea94a66d33f7bf97f363c77838359.camel@redhat.com>
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
Cc: Alexandra Diupina <adiupina@astralinux.ru>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, lvc-project@linuxtesting.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Process the result of hdlc_open() and call uhdlc_close()
in case of an error. It is necessary to pass the error
code up the control flow, similar to a possible
error in request_irq().
Also add a hdlc_close() call to the uhdlc_close()
because the comment to hdlc_close() says it must be called
by the hardware driver when the HDLC device is being closed

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: c19b6d246a35 ("drivers/net: support hdlc function for QE-UCC")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
v5: do some refactoring as Paolo Abeni <pabeni@redhat.com> and=20
Christophe Leroy <christophe.leroy@csgroup.eu> suggested
v4: undo all the things done prior to hdlc_open() as=20
Jakub Kicinski <kuba@kernel.org> suggested,=20
add hdlc_close() call to the uhdlc_close() to match the function comment,=
=20
add uhdlc_close() declaration to the top of the file not to put the=20
uhdlc_close() function definition before uhdlc_open()
v3: Fix the commits tree
v2: Remove the 'rc' variable (stores the return value of the=20
hdlc_open()) as Christophe Leroy <christophe.leroy@csgroup.eu> suggested
 drivers/net/wan/fsl_ucc_hdlc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdl=
c.c
index 47c2ad7a3e42..fd50bb313b92 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -34,6 +34,8 @@
 #define TDM_PPPOHT_SLIC_MAXIN
 #define RX_BD_ERRORS (R_CD_S | R_OV_S | R_CR_S | R_AB_S | R_NO_S | R_LG_=
S)
=20
+static int uhdlc_close(struct net_device *dev);
+
 static struct ucc_tdm_info utdm_primary_info =3D {
 	.uf_info =3D {
 		.tsa =3D 0,
@@ -708,6 +710,7 @@ static int uhdlc_open(struct net_device *dev)
 	hdlc_device *hdlc =3D dev_to_hdlc(dev);
 	struct ucc_hdlc_private *priv =3D hdlc->priv;
 	struct ucc_tdm *utdm =3D priv->utdm;
+	int rc =3D 0;
=20
 	if (priv->hdlc_busy !=3D 1) {
 		if (request_irq(priv->ut_info->uf_info.irq,
@@ -731,10 +734,13 @@ static int uhdlc_open(struct net_device *dev)
 		napi_enable(&priv->napi);
 		netdev_reset_queue(dev);
 		netif_start_queue(dev);
-		hdlc_open(dev);
+
+		rc =3D hdlc_open(dev);
+		if (rc)
+			uhdlc_close(dev);
 	}
=20
-	return 0;
+	return rc;
 }
=20
 static void uhdlc_memclean(struct ucc_hdlc_private *priv)
@@ -824,6 +830,8 @@ static int uhdlc_close(struct net_device *dev)
 	netdev_reset_queue(dev);
 	priv->hdlc_busy =3D 0;
=20
+	hdlc_close(dev);
+
 	return 0;
 }
=20
--=20
2.30.2

