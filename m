Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BB0849EC2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 16:50:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gKnrxnX6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WJliFnJp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT9nY5gRWz3c6c
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 02:50:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gKnrxnX6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WJliFnJp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT9mm0LZ4z3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 02:49:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707148179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9roXL1sr1vvW9fu4KwPteWhWaRn2ROl15kZSb/5PdpE=;
	b=gKnrxnX6XGaSQmFclBB3WrVQwJiv6AHeX4jol2tmD4W0QJQXoHV7h5gstwNJxCyvrQIsJ9
	JGWXHb8xfE2lUboQ1YgKeusry1JDL7E4Hgv6A/IGQ8rK9Xf/p346rgYlfMIrUrgoEL17m+
	GE+wrbU6qfiJoUy7Gl+wYru+Rttesww=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707148180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9roXL1sr1vvW9fu4KwPteWhWaRn2ROl15kZSb/5PdpE=;
	b=WJliFnJpelpKePRL/q6gGF0H3vLU55ENKqx2VILLAH80QhUxOAiGB2S6uteF39xqDD+unU
	GvKQqeqmGojRfiMPUVsiq8XHm9hp5MObaM6hcNA7QztHrk5UcNMgXQjIyjQmwh1TYZrQX9
	dJIPy/4kSfjuIWAhbniyCeZ57aeWzTQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-R7JC7WUeOeqNjoYc9Xx4Rw-1; Mon, 05 Feb 2024 10:49:38 -0500
X-MC-Unique: R7JC7WUeOeqNjoYc9Xx4Rw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40e354aaf56so10694735e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Feb 2024 07:49:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707148176; x=1707752976;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PWytvdzbwNmivemu1wpy4MQP/x1HOWB6HRVe6Ea1Fio=;
        b=RQHlQSYQ9pgq1EjWb5kSeLF+/meE0EzjCVvlqDzvv2c9f7xgtyAXdRbXUBDE0VAM4U
         buRqpxtF6LbhLxZSpKe3JVgdixvLVnwDj3y/PfCvWrH5fSMcMAMuvA56Ia2nF4BCfCkJ
         S8IcAmbmfIan7Et22V0Es+myeiiqlhSN7PhSgwf+VVInkDE7LHbh0PDrTWTlGc4OqV7P
         D+SVfSwxi8Jq3Cj7J+ZjdTkHhlEJEivgICuiBtkYyyPno46miarevWWfZR0I9SvkNqLD
         A2ZuAzga9Vo+TwNKQtaS/avG1cdYI+CaAqILIcsakRe4Ok5ImvdrbGvHNdyyWjWO5v7o
         g1tw==
X-Forwarded-Encrypted: i=1; AJvYcCVPO3fQrEB2uM0p8W87I8W9KeEhEWRM7KWFWIf73h+nCgEvWatdoUkHai/qqEeKyvODw6T5YmVm+SUGTPZ7cfWP8D5jSlK8ByC+su9b5A==
X-Gm-Message-State: AOJu0Yz3biHCJG9ALv8rp31xrIQdPeCH5AH5BoUBse36fxlZeomjozvi
	iBT7jEbDDvoGr0pt4kITNP7i9avB/STNnQxCNR94EbK6/18AuMG2YA8iuTMhcEjM9GMrPYE0gjx
	AjW2/TiL+E5uUAJeCrCh4KmHs88o315IFlNNzg9SsjQIv4QFyz3lzBC40rpj7618=
X-Received: by 2002:a05:600c:1c2a:b0:40f:c996:193b with SMTP id j42-20020a05600c1c2a00b0040fc996193bmr119491wms.3.1707148176264;
        Mon, 05 Feb 2024 07:49:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1QfwhepoZnSsm4BWenzYrR0k9pfnBGVdJ1niYohNnxtZV/8O0jafaQB+rL3UlDpD1IHBOEA==
X-Received: by 2002:a05:600c:1c2a:b0:40f:c996:193b with SMTP id j42-20020a05600c1c2a00b0040fc996193bmr119462wms.3.1707148175413;
        Mon, 05 Feb 2024 07:49:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVM+JqNW7xABzLXF7DpTuWOZU2IwSHM/xrdq3euK6JABlo8NIBuWK94socug0n3Fa/D3Nh/u4TYDq3G4gVembzMh2rTT8lSYO6FCAhkt96ZTbE0mGmtBa8izxmZVIzFFh/ifxUT49T9l2exDogN6ifLW+16c8CoARVMvwyE7TO0MaafEkTqKL0CXNw4xXQALObId3roWpfM7rA8uOWaydfq5XvR4EgxtA+V7DSEBQr93iWJgrdnzEtIQERBWm0v7XIbUGlscAVrO9l/EFCPbIdRuvgMbH5pJaBhPU4+OKcdMkwpak7ozL3G7z9Zw14LVL6MyyAfYS2KS2NzGqiJ7mJHLa5R0Mh4PTgB6pTgUBzvBKQZELda7ScOg/O4qcY=
Received: from gerbillo.redhat.com (146-241-230-60.dyn.eolo.it. [146.241.230.60])
        by smtp.gmail.com with ESMTPSA id t18-20020a05600c199200b0040ecdd672fasm213707wmq.13.2024.02.05.07.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 07:49:34 -0800 (PST)
Message-ID: <d174364c12366b1f5eeb616cba078f6682d629f5.camel@redhat.com>
Subject: Re: [PATCH v2 1/6] net: wan: Add support for QMC HDLC
From: Paolo Abeni <pabeni@redhat.com>
To: Herve Codina <herve.codina@bootlin.com>
Date: Mon, 05 Feb 2024 16:49:33 +0100
In-Reply-To: <20240205152208.73535549@bootlin.com>
References: <20240130084035.115086-1-herve.codina@bootlin.com>
	 <20240130084035.115086-2-herve.codina@bootlin.com>
	 <b1968b5c7e88edd448d5f55b57dfa40257b2b06c.camel@redhat.com>
	 <20240205152208.73535549@bootlin.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39)
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2024-02-05 at 15:22 +0100, Herve Codina wrote:
> Hi Paolo,
>=20
> On Thu, 01 Feb 2024 12:41:32 +0100
> Paolo Abeni <pabeni@redhat.com> wrote:
>=20
> [...]
> > > +static inline struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device =
*netdev)
> > > +{
> > > +=09return dev_to_hdlc(netdev)->priv;
> > > +} =20
> >=20
> > Please, no 'inline' function in c files. You could move this function
> > and the struct definition into a new, local, header file.
>=20
> 'inline' function specifier will be removed in the next iteration on the =
series.
>=20
> >=20
> > > +static int qmc_hdlc_recv_queue(struct qmc_hdlc *qmc_hdlc, struct qmc=
_hdlc_desc *desc, size_t size);
> > > +
> > > +#define QMC_HDLC_RX_ERROR_FLAGS (QMC_RX_FLAG_HDLC_OVF | \
> > > +=09=09=09=09 QMC_RX_FLAG_HDLC_UNA | \
> > > +=09=09=09=09 QMC_RX_FLAG_HDLC_ABORT | \
> > > +=09=09=09=09 QMC_RX_FLAG_HDLC_CRC)
> > > +
> > > +static void qmc_hcld_recv_complete(void *context, size_t length, uns=
igned int flags)
> > > +{
> > > +=09struct qmc_hdlc_desc *desc =3D context;
> > > +=09struct net_device *netdev =3D desc->netdev;
> > > +=09struct qmc_hdlc *qmc_hdlc =3D netdev_to_qmc_hdlc(netdev);
> > > +=09int ret; =20
> >=20
> > Please, respect the reverse x-mas tree order for local variable
> > definition.
>=20
> desc depends on context, netdev depends on desc and qmc_hdlc depends on n=
etdev.
> I think the declaration order is correct here even it doesn't respect the=
 reverse
> x-mas tree.
>=20
> [...]
> > > +static netdev_tx_t qmc_hdlc_xmit(struct sk_buff *skb, struct net_dev=
ice *netdev)
> > > +{
> > > +=09struct qmc_hdlc *qmc_hdlc =3D netdev_to_qmc_hdlc(netdev);
> > > +=09struct qmc_hdlc_desc *desc;
> > > +=09unsigned long flags;
> > > +=09int ret;
> > > +
> > > +=09spin_lock_irqsave(&qmc_hdlc->tx_lock, flags);
> > > +=09desc =3D &qmc_hdlc->tx_descs[qmc_hdlc->tx_out];
> > > +=09if (WARN_ONCE(!desc->skb, "No tx descriptors available\n")) {
> > > +=09=09/* Should never happen.
> > > +=09=09 * Previous xmit should have already stopped the queue.
> > > +=09=09 */
> > > +=09=09netif_stop_queue(netdev);
> > > +=09=09spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
> > > +=09=09return NETDEV_TX_BUSY;
> > > +=09}
> > > +=09spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
> > > +
> > > +=09desc->netdev =3D netdev;
> > > +=09desc->dma_size =3D skb->len;
> > > +=09desc->skb =3D skb;
> > > +=09ret =3D qmc_hdlc_xmit_queue(qmc_hdlc, desc);
> > > +=09if (ret) {
> > > +=09=09desc->skb =3D NULL; /* Release the descriptor */
> > > +=09=09if (ret =3D=3D -EBUSY) {
> > > +=09=09=09netif_stop_queue(netdev);
> > > +=09=09=09return NETDEV_TX_BUSY;
> > > +=09=09}
> > > +=09=09dev_kfree_skb(skb);
> > > +=09=09netdev->stats.tx_dropped++;
> > > +=09=09return NETDEV_TX_OK;
> > > +=09}
> > > +
> > > +=09qmc_hdlc->tx_out =3D (qmc_hdlc->tx_out + 1) % ARRAY_SIZE(qmc_hdlc=
->tx_descs);
> > > +
> > > +=09spin_lock_irqsave(&qmc_hdlc->tx_lock, flags);
> > > +=09if (qmc_hdlc->tx_descs[qmc_hdlc->tx_out].skb)
> > > +=09=09netif_stop_queue(netdev);
> > > +=09spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags); =20
> >=20
> > The locking schema is quite bad, as the drivers acquires and releases 3
> > locks for each tx packet. You could improve that using the qmc_chan-
> > > tx_lock to protect the whole qmc_hdlc_xmit() function, factoring out =
a =20
> > lockless variant of qmc_hdlc_xmit_queue(),=C2=A0and using it here.
>=20
> I will change on next iteration and keep 2 lock/unlock instead of 3:
>   - one in qmc_hdlc_xmit()
>   - one in qmc_hdlc_xmit_complete()=20
> to protect the descriptors accesses.
>=20
> >=20
> > In general is quite bad that the existing infra does not allow
> > leveraging NAPI. Have you considered expanding the QMC to accomodate
> > such user?
>=20
> I cannot mask/unmask the 'end of transfer' interrupt.
> Indeed, other streams use this interrupt among them audio streams and so
> masking the interrupt for HDLC data will also mask the interrupt for audi=
o
> data.

Uhm... I fear the above makes the available options list empty :(

> At the HDLC driver level, the best I can to is to store a queue of comple=
te
> HDLC skbs (queue filled on interrupts) and send them to the network stack
> when the napi poll() is called.
>=20
> I am not sure that this kind of queue (additional level between always
> enabled interrupts and the network stack) makes sense.
>=20
> Do you have any opinion about this additional queue management for NAPI
> support?

With such idea in place, what HDLC-level data will be accessed by the
napi context? The RX interrupts will remain unmasked after the
interrupt and before the napi poll right? That would be
problematic/could cause drop if the ingress pkt/interrupt rate will be
higher that what the napi could process - and that in turn could bring
back old bad livelock times :(

Cheers,

Paolo

