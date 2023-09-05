Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 246E97921F4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 12:47:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KD7OKCzt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KD7OKCzt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rg2JT64zcz3c92
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 20:47:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KD7OKCzt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KD7OKCzt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rg2Hc0Y9hz2yh6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 20:46:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693910791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XvdSD6hqsdMWfJ0xlfibNNBXEgCBaYXTF4ZPfAkxeV0=;
	b=KD7OKCztMeGlEYqXu8XWXwfF2ft8lBTwF8as60Hg+dvpOzerMqVwxJz3grNCtbZCOqtTgp
	KFl+8eXl8Ai9oUQhaLauRBKjAdLFlZ+lM8PEkuO1pwhrErkK6uCNqwrY92fPmrHDlPbECg
	M0RTKs4pYzXrX8AfonK+KyH7A5MJDc8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693910791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XvdSD6hqsdMWfJ0xlfibNNBXEgCBaYXTF4ZPfAkxeV0=;
	b=KD7OKCztMeGlEYqXu8XWXwfF2ft8lBTwF8as60Hg+dvpOzerMqVwxJz3grNCtbZCOqtTgp
	KFl+8eXl8Ai9oUQhaLauRBKjAdLFlZ+lM8PEkuO1pwhrErkK6uCNqwrY92fPmrHDlPbECg
	M0RTKs4pYzXrX8AfonK+KyH7A5MJDc8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-FcXkpWDsPT6ixR_B-38mNw-1; Tue, 05 Sep 2023 06:46:29 -0400
X-MC-Unique: FcXkpWDsPT6ixR_B-38mNw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9a1be1e2b63so38951766b.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Sep 2023 03:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693910788; x=1694515588;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KDobuVmsHf6VbTCDGPgqLnhe8HEWnYtAH71GRAdCw84=;
        b=iLZeoq0W35/XRKaMHpxT4qke8U25Rpetcx+8RiH2IS6cskZ4g0tJuhqG7LjslQ+TRO
         qEYBGQ1xrCGhQHC1KXTPMPi6YoPXbgs7AJwpRgah8qAEUUhojxh9Ft5k8kmWbVRre7tD
         Yk3s9J728yZhSXzdsWx3V+M0zQWgH4PiuMxhFzREsNxakenqtTVHhGEUvdJVgV3w5bm0
         nMH14saBUw5Xf2rlyjkrcQ6GUsO2VM44JhmCww46CyljdOfer/DwRn6h3WTqHsFi/M56
         ZIZZoW0t4aHQRHDgkwJ0HpGvr+6nlndfM4lyvL+Fp6H0weKwbSlRwOh5aK3ccRSnetoH
         Y97w==
X-Gm-Message-State: AOJu0YxRz1cifGD8wlHwhvP68UVHWpaON98w2v/A8IiufnbdyZ4UJCWK
	1rlkPMg7aVRXc9l2d/oyfB4YOlQ03L8DrqXBCdbApIKIr/n/yPjG92IFAEfIKMTAB8t3GE69ISp
	8G3EffKMGKfTlq0abmVKHuq3SDQ==
X-Received: by 2002:a17:906:1d9:b0:9a5:ce62:6e1a with SMTP id 25-20020a17090601d900b009a5ce626e1amr9074529ejj.1.1693910788544;
        Tue, 05 Sep 2023 03:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVP0e7U+C7DkOymIDEKc3tYHSdF8TqbQ0M/RyNmnZKDwX7FgEegi976Dw6DLG26KofkHwMIg==
X-Received: by 2002:a17:906:1d9:b0:9a5:ce62:6e1a with SMTP id 25-20020a17090601d900b009a5ce626e1amr9074509ejj.1.1693910788209;
        Tue, 05 Sep 2023 03:46:28 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-254-194.dyn.eolo.it. [146.241.254.194])
        by smtp.gmail.com with ESMTPSA id qw17-20020a170906fcb100b0099d798a6bb5sm7469193ejb.67.2023.09.05.03.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 03:46:27 -0700 (PDT)
Message-ID: <c1437313a3fea94a66d33f7bf97f363c77838359.camel@redhat.com>
Subject: Re: [PATCH v4] drivers/net: process the result of hdlc_open() and
 add call of hdlc_close() in uhdlc_close()
From: Paolo Abeni <pabeni@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Alexandra Diupina
	 <adiupina@astralinux.ru>, Zhao Qiang <qiang.zhao@nxp.com>
Date: Tue, 05 Sep 2023 12:46:26 +0200
In-Reply-To: <1005f190-8c03-bb5d-214c-c7fca9dd876b@csgroup.eu>
References: <20230904123130.14099-1-adiupina@astralinux.ru>
	 <1005f190-8c03-bb5d-214c-c7fca9dd876b@csgroup.eu>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-09-04 at 17:03 +0000, Christophe Leroy wrote:
>=20
> Le 04/09/2023 =C3=A0 14:31, Alexandra Diupina a =C3=A9crit=C2=A0:
> > diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_h=
dlc.c
> > index 47c2ad7a3e42..fd999dabdd39 100644
> > --- a/drivers/net/wan/fsl_ucc_hdlc.c
> > +++ b/drivers/net/wan/fsl_ucc_hdlc.c
> > @@ -34,6 +34,8 @@
> >   #define TDM_PPPOHT_SLIC_MAXIN
> >   #define RX_BD_ERRORS (R_CD_S | R_OV_S | R_CR_S | R_AB_S | R_NO_S | R_=
LG_S)
> >  =20
> > +static int uhdlc_close(struct net_device *dev);
> > +
> >   static struct ucc_tdm_info utdm_primary_info =3D {
> >   =09.uf_info =3D {
> >   =09=09.tsa =3D 0,
> > @@ -731,7 +733,9 @@ static int uhdlc_open(struct net_device *dev)
> >   =09=09napi_enable(&priv->napi);
> >   =09=09netdev_reset_queue(dev);
> >   =09=09netif_start_queue(dev);
> > -=09=09hdlc_open(dev);
> > +
> > +=09=09int rc =3D hdlc_open(dev);
>=20
> Do not mix declarations and code. Please put all declaration at the top=
=20
> of the block.
>=20
> > +=09=09return rc =3D=3D 0 ? 0 : (uhdlc_close(dev), rc);
> >   =09}
>=20
> That's not easy to read.
>=20
> I know that's more changes, but I'd prefer something like:
>=20
> static int uhdlc_open(struct net_device *dev)
> {
> =09u32 cecr_subblock;
> =09hdlc_device *hdlc =3D dev_to_hdlc(dev);
> =09struct ucc_hdlc_private *priv =3D hdlc->priv;
> =09struct ucc_tdm *utdm =3D priv->utdm;
> =09int rc;
>=20
> =09if (priv->hdlc_busy !=3D 1)
> =09=09return 0;
>=20
> =09if (request_irq(priv->ut_info->uf_info.irq,
> =09=09=09ucc_hdlc_irq_handler, 0, "hdlc", priv))
> =09=09return -ENODEV;
>=20
> =09cecr_subblock =3D ucc_fast_get_qe_cr_subblock(
> =09=09=09=09priv->ut_info->uf_info.ucc_num);
>=20
> =09qe_issue_cmd(QE_INIT_TX_RX, cecr_subblock,
> =09=09     QE_CR_PROTOCOL_UNSPECIFIED, 0);
>=20
> =09ucc_fast_enable(priv->uccf, COMM_DIR_RX | COMM_DIR_TX);
>=20
> =09/* Enable the TDM port */
> =09if (priv->tsa)
> =09=09qe_setbits_8(&utdm->si_regs->siglmr1_h, 0x1 << utdm->tdm_port);
>=20
> =09priv->hdlc_busy =3D 1;
> =09netif_device_attach(priv->ndev);
> =09napi_enable(&priv->napi);
> =09netdev_reset_queue(dev);
> =09netif_start_queue(dev);
>=20
> =09rc =3D hdlc_open(dev);
> =09if (rc)
> =09=09uhdlc_close(dev);
>=20
> =09return rc;
> }

I agree the above is more readable, but I don't think the whole
refactor is not worthy for a -net fix. I think simply rewriting the
final statements as:

=09=09rc =3D hdlc_open(dev);
=09=09if (rc)
=09=09=09uhdlc_close(dev);

=09=09return rc;=09

would be good for -net.
=20
> >   =09return 0;
> > @@ -824,6 +828,8 @@ static int uhdlc_close(struct net_device *dev)
> >   =09netdev_reset_queue(dev);
> >   =09priv->hdlc_busy =3D 0;
> >  =20
> > +=09hdlc_close(dev);
> > +
> >   return 0;
> >    =20
>=20
> And while you are looking at the correctness of this code, is it sure=20
> that uhdlc_open() cannot be called twice in parallele ?
> If it can be called in parall=C3=A8le I think the "if (priv->hdlc_busy !=
=3D 1)"=20
> should be replaced by something using cmpxchg()

That part is safe, ndo_open() is invoked under the rtnl lock.

The other comments are IMHO relevant, @Alexandra: please address them.

Thanks!

Paolo

