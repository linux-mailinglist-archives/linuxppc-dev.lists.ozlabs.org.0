Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E18663E69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 11:40:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrnQk4Hnyz3cdp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 21:40:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=astralinux.ru (client-ip=217.74.38.119; helo=mail.astralinux.ru; envelope-from=eesina@astralinux.ru; receiver=<UNKNOWN>)
Received: from mail.astralinux.ru (mail.astralinux.ru [217.74.38.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrj0j3C0Pz3c79
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 18:21:23 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 986351863A9E;
	Tue, 10 Jan 2023 10:21:17 +0300 (MSK)
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id NQPKK78CKEwH; Tue, 10 Jan 2023 10:21:17 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id 204B01863E33;
	Tue, 10 Jan 2023 10:21:17 +0300 (MSK)
X-Virus-Scanned: amavisd-new at astralinux.ru
Received: from mail.astralinux.ru ([127.0.0.1])
	by localhost (rbta-msk-vsrv-mail01.astralinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MWA1XFwlqi4T; Tue, 10 Jan 2023 10:21:16 +0300 (MSK)
Received: from rbta-msk-vsrv-mail01.astralinux.ru (localhost [127.0.0.1])
	by mail.astralinux.ru (Postfix) with ESMTP id A21311863A9E;
	Tue, 10 Jan 2023 10:21:16 +0300 (MSK)
Date: Tue, 10 Jan 2023 10:21:16 +0300 (MSK)
From: =?utf-8?B?0JXQutCw0YLQtdGA0LjQvdCwINCV0YHQuNC90LA=?= <eesina@astralinux.ru>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Zhao Qiang <qiang.zhao@nxp.com>
Message-ID: <1596946964.348463848.1673335276356.JavaMail.zimbra@astralinux.ru>
In-Reply-To: <1b6326fa-69b3-0ef0-2927-60f6fbd6ce28@csgroup.eu>
References: <20221223143225.23153-1-eesina@astralinux.ru> <1b6326fa-69b3-0ef0-2927-60f6fbd6ce28@csgroup.eu>
Subject: Re: [PATCH] net-wan: Add check for NULL for utdm in ucc_hdlc_probe
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="=_6c7fd5d1-372a-4043-93cb-aabb5b11055b"
X-Originating-IP: [10.177.177.35]
X-Mailer: Zimbra 9.0.0_GA_4258 (ZimbraXWebClient - yandexbrowser22 (Linux)/9.0.0_GA_4258)
Thread-Topic: net-wan: Add check for NULL for utdm in ucc_hdlc_probe
Thread-Index: AQHZFxzZzxDc+uM14kSkvyuO7aEPOq6WVamAf1NcbTo=
X-Mailman-Approved-At: Tue, 10 Jan 2023 21:40:19 +1100
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
Cc: lvc-project@linuxtesting.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_6c7fd5d1-372a-4043-93cb-aabb5b11055b
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

 =20
=C2=A0=20
=C2=A0 =20
  =20

-----Original Message-----

From: Christophe <christophe.leroy@csgroup.eu>
To: Ekaterina <eesina@astralinux.ru>; Zhao <qiang.zhao@nxp.com>
Cc: lvc-project <lvc-project@linuxtesting.org>; netdev <netdev@vger.kernel.=
org>; linux-kernel <linux-kernel@vger.kernel.org>; Eric <edumazet@google.co=
m>; Jakub <kuba@kernel.org>; Paolo <pabeni@redhat.com>; linuxppc-dev <linux=
ppc-dev@lists.ozlabs.org>; David <davem@davemloft.net>
Date: Monday, 9 January 2023 6:49 PM MSK
Subject: Re: [PATCH] net-wan: Add check for NULL for utdm in ucc_hdlc_probe



Le 23/12/2022 =C3=A0 15:32, Ekaterina Esina a =C3=A9crit=C2=A0:=20
> [Vous ne recevez pas souvent de courriers de eesina@astralinux.ru. D=C3=
=A9couvrez pourquoi ceci est important =C3=A0 https://aka.ms/LearnAboutSend=
erIdentification ]=20
>=20
> If uhdlc_priv_tsa !=3D 1 then utdm is not initialized.=20
> And if ret !=3D NULL then goto undo_uhdlc_init, where utdm is dereference=
d.=20
> Same if dev =3D=3D NULL.=20
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.=20
>=20
> Signed-off-by: Ekaterina Esina <eesina@astralinux.ru>=20
> ---=20
> drivers/net/wan/fsl_ucc_hdlc.c | 4 +++-=20
> 1 file changed, 3 insertions(+), 1 deletion(-)=20
>=20
> diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdl=
c.c=20
> index 22edea6ca4b8..2ddb0f71e648 100644=20
> --- a/drivers/net/wan/fsl_ucc_hdlc.c=20
> +++ b/drivers/net/wan/fsl_ucc_hdlc.c=20
> @@ -1243,7 +1243,9 @@ static int ucc_hdlc_probe(struct platform_device *p=
dev)=20
> free_dev:=20
> free_netdev(dev);=20
> undo_uhdlc_init:=20
> - iounmap(utdm->siram);=20
> + if (utdm !=3D NULL) {=20
> + iounmap(utdm->siram);=20
> + }=20

If utdm being NULL is a problem here, isn't it also a problem in the=20
iounmap below ?=20


> unmap_si_regs:=20
> iounmap(utdm->si_regs);=20
> free_utdm:=20
> --=20
> 2.30.2=20
> Yes, below the check is also needed. I guess I should send a new patch wi=
th both checks Best wishes, Ekaterina Esina   =20

--=_6c7fd5d1-372a-4043-93cb-aabb5b11055b
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-size: 12pt; font-family: arial, helvetica, s=
ans-serif; color: rgb(0, 0, 0);"><div style=3D"font-size: 12pt; font-family=
: 'arial' , 'helvetica' , sans-serif; color: #000000;">
<div style=3D"font-size: 12pt; font-family: 'arial' , 'helvetica' , sans-se=
rif; color: #000000;">
<div>&nbsp;</div>
<div>&nbsp;</div>
<div id=3D"signature-content-no-signature"></div>
<div>

<div id=3D"OLK_SRC_BODY_SECTION">
<div id=3D"OLK_SRC_BODY_SECTION">
<blockquote style=3D"margin: 0 0 0 0.8em; border-left: 1px #ccc solid; padd=
ing-left: 1em;"><hr id=3D"MESSAGE_DATA_MARKER"><strong>From: </strong>Chris=
tophe &lt;christophe.leroy@csgroup.eu&gt;<br><strong>To: </strong>Ekaterina=
 &lt;eesina@astralinux.ru&gt;; Zhao &lt;qiang.zhao@nxp.com&gt;<br><strong>C=
c: </strong>lvc-project &lt;lvc-project@linuxtesting.org&gt;; netdev &lt;ne=
tdev@vger.kernel.org&gt;; linux-kernel &lt;linux-kernel@vger.kernel.org&gt;=
; Eric &lt;edumazet@google.com&gt;; Jakub &lt;kuba@kernel.org&gt;; Paolo &l=
t;pabeni@redhat.com&gt;; linuxppc-dev &lt;linuxppc-dev@lists.ozlabs.org&gt;=
; David &lt;davem@davemloft.net&gt;<br><strong>Date: </strong>Monday, 9 Jan=
uary 2023 6:49 PM MSK<br><strong>Subject: </strong>Re: [PATCH] net-wan: Add=
 check for NULL for utdm in ucc_hdlc_probe<br><br><br><br>Le 23/12/2022 =C3=
=A0 15:32, Ekaterina Esina a =C3=A9crit&nbsp;: <br>&gt; [Vous ne recevez pa=
s souvent de courriers de eesina@astralinux.ru. D=C3=A9couvrez pourquoi cec=
i est important =C3=A0 https://aka.ms/LearnAboutSenderIdentification ] <br>=
&gt; <br>&gt; If uhdlc_priv_tsa !=3D 1 then utdm is not initialized. <br>&g=
t; And if ret !=3D NULL then goto undo_uhdlc_init, where utdm is dereferenc=
ed. <br>&gt; Same if dev =3D=3D NULL. <br>&gt; <br>&gt; Found by Linux Veri=
fication Center (linuxtesting.org) with SVACE. <br>&gt; <br>&gt; Signed-off=
-by: Ekaterina Esina &lt;eesina@astralinux.ru&gt; <br>&gt; --- <br>&gt; dri=
vers/net/wan/fsl_ucc_hdlc.c | 4 +++- <br>&gt; 1 file changed, 3 insertions(=
+), 1 deletion(-) <br>&gt; <br>&gt; diff --git a/drivers/net/wan/fsl_ucc_hd=
lc.c b/drivers/net/wan/fsl_ucc_hdlc.c <br>&gt; index 22edea6ca4b8..2ddb0f71=
e648 100644 <br>&gt; --- a/drivers/net/wan/fsl_ucc_hdlc.c <br>&gt; +++ b/dr=
ivers/net/wan/fsl_ucc_hdlc.c <br>&gt; @@ -1243,7 +1243,9 @@ static int ucc_=
hdlc_probe(struct platform_device *pdev) <br>&gt; free_dev: <br>&gt; free_n=
etdev(dev); <br>&gt; undo_uhdlc_init: <br>&gt; - iounmap(utdm-&gt;siram); <=
br>&gt; + if (utdm !=3D NULL) { <br>&gt; + iounmap(utdm-&gt;siram); <br>&gt=
; + } <br><br>If utdm being NULL is a problem here, isn't it also a problem=
 in the <br>iounmap below ? <br><br><br>&gt; unmap_si_regs: <br>&gt; iounma=
p(utdm-&gt;si_regs); <br>&gt; free_utdm: <br>&gt; -- <br>&gt; 2.30.2 <br>&g=
t;</blockquote>
<blockquote style=3D"margin: 0 0 0 0.8em; border-left: 1px #ccc solid; padd=
ing-left: 1em;">Yes, below the check is also needed. I guess I should send =
a new patch with both checks</blockquote>
<blockquote style=3D"margin: 0 0 0 0.8em; border-left: 1px #ccc solid; padd=
ing-left: 1em;">Best wishes,</blockquote>
<blockquote style=3D"margin: 0 0 0 0.8em; border-left: 1px #ccc solid; padd=
ing-left: 1em;">Ekaterina Esina</blockquote>
</div>
</div></div>
</div>
</div></div></body></html>
--=_6c7fd5d1-372a-4043-93cb-aabb5b11055b--
