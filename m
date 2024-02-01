Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 287878456BB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 13:02:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ge8Jnwgy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ge8Jnwgy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQcwj0Spbz3cXv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 23:02:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ge8Jnwgy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ge8Jnwgy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQcvt6HW4z3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 23:02:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706788917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VXorcTispEdVTbJkYF6HYzYShARMqt/1Hjrtv5amQP4=;
	b=ge8JnwgyI/LB7vN01Qkwe35tA9WmVF5kHhK9+nIVjZJBUyY7s01Qs93xZ4pXgkgvq2+Poy
	nGx3TcfwovjlSdnchwUkDymRRoRz1lOUTATNoyFouNR90xKO5c4unk73flhFXC3Kb/RUz0
	FkHBA8ToWx3Xv7UwXNAJ294BNC1y2Pg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706788917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VXorcTispEdVTbJkYF6HYzYShARMqt/1Hjrtv5amQP4=;
	b=ge8JnwgyI/LB7vN01Qkwe35tA9WmVF5kHhK9+nIVjZJBUyY7s01Qs93xZ4pXgkgvq2+Poy
	nGx3TcfwovjlSdnchwUkDymRRoRz1lOUTATNoyFouNR90xKO5c4unk73flhFXC3Kb/RUz0
	FkHBA8ToWx3Xv7UwXNAJ294BNC1y2Pg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-U4vD6Vy0ONCNTs9Z72Rp7Q-1; Thu, 01 Feb 2024 07:01:56 -0500
X-MC-Unique: U4vD6Vy0ONCNTs9Z72Rp7Q-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40ef6441d1aso918005e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Feb 2024 04:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706788914; x=1707393714;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcEUKdi4uiysteQLExSEli88YMa6cGV3bas2H1wcmjE=;
        b=QPTGmMk8RTv4Tcb4/Gx0CqfYKrh7bxq5rgbClVPpQRR1r6DehzdoL2jUXQl+worWc0
         2cuToaTnnYlBr9YldN3Fe8ZD0/7BSu9fVyHII/XGtRT2BU0uC2rBYeB/JmxrsPsTHg15
         qfF10cU/n6L7/b45hVvxaYjcSDcnP+j92jtJlTtJSmVRlTZS8efLiEdkRIbamF/MFVMo
         jFQ9qpTWFV3SChKQQgMy10aNJg4n++j7R4uZd+dK9AHxy+BaxSRRM2Kd5ZFoZ9tGOmkf
         3Mpi7LgzrLaf2pjRXkAW5m6yAXZlo0ZV4pr6j1xJAMwUxRnaSfWdv1DIDtT+I1jKNYQs
         KIEg==
X-Forwarded-Encrypted: i=0; AJvYcCVxTYAFAmRPPXbZmxLOGGZ+Wsrml5nSvGpDENmmxrybvXah839JU/7CK6aHQTUqNJnOME+gxPnYYxEajlubGxj9ZJosk4ZvloZk7ad0cw==
X-Gm-Message-State: AOJu0YzEudPy9sikhIPBX+nKEhjNbxvYSDQer2bnwV4sDnrkSMvPkae+
	gCKkPkBwBwWcDkLGT+hFhWYZjxTklDVKCK0O2CNgBpRVb3jDOvTrWJ7/dMVWfD1lYF3/Pku8M9B
	fHPCGc2lgeb9h66Fe7pi/q988ZvtMkceJNDzx7NtyfrEcAz95ilmoFOb4PQgKCjw=
X-Received: by 2002:a5d:43ce:0:b0:33b:1a51:733c with SMTP id v14-20020a5d43ce000000b0033b1a51733cmr520669wrr.6.1706788913782;
        Thu, 01 Feb 2024 04:01:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSzFdSnCWWh8DuX2kOUaKPmifpX1BGRedx6WDhyPSJ5Aa+E7ADsiOr/z2Uydt9bsS+//LAHQ==
X-Received: by 2002:a5d:43ce:0:b0:33b:1a51:733c with SMTP id v14-20020a5d43ce000000b0033b1a51733cmr520651wrr.6.1706788913413;
        Thu, 01 Feb 2024 04:01:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW/u2BuRjHWFot74Lj/r29L7EOgPRqNFE85eGX5C7PoWgKVQlIrBa3Va6N4OMLsqKyR0BgziOAv4N6/mLX5HXTlBR58ZXYn51MY/GFcp7f9uJQgwtYQ8xWmRXYNlBRlPR0hlrEtko2qybOvs7TeFt6zejyNgaDWUx/rZidOu9kVjsVaJvPwKawz/1LaGmp0exN97A5NYcsDCxa8BHmJwUY34bffEpQ46sOVhRLa+07YcQ8MNpUCVdA39W1YgjQbUvEbIdX0obteS9Jiu40aF56QW2Ji4OJGElU9jGzcwIyGKMS/Nt3JFbvf/T0z0Xn7O9RQdrQpjZAVeJ91Lmk4UWwwUC21gfvFJvK91ND+cC9cLmPEWBSUvKKE548=
Received: from gerbillo.redhat.com (146-241-238-90.dyn.eolo.it. [146.241.238.90])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d4e8d000000b0033b08b9cd9dsm3083916wru.79.2024.02.01.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 04:01:52 -0800 (PST)
Message-ID: <a8845eca2d9bab5d7805c19a16811820671c41f2.camel@redhat.com>
Subject: Re: [PATCH v2 5/6] net: wan: fsl_qmc_hdlc: Add runtime timeslots
 changes support
From: Paolo Abeni <pabeni@redhat.com>
To: Herve Codina <herve.codina@bootlin.com>, Vadim Fedorenko
	 <vadim.fedorenko@linux.dev>, "David S. Miller" <davem@davemloft.net>, Eric
	Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 01 Feb 2024 13:01:51 +0100
In-Reply-To: <20240130084035.115086-6-herve.codina@bootlin.com>
References: <20240130084035.115086-1-herve.codina@bootlin.com>
	 <20240130084035.115086-6-herve.codina@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2024-01-30 at 09:40 +0100, Herve Codina wrote:
> QMC channels support runtime timeslots changes but nothing is done at
> the QMC HDLC driver to handle these changes.
>=20
> Use existing IFACE ioctl in order to configure the timeslots to use.
>=20
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  drivers/net/wan/fsl_qmc_hdlc.c | 155 ++++++++++++++++++++++++++++++++-
>  1 file changed, 154 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wan/fsl_qmc_hdlc.c b/drivers/net/wan/fsl_qmc_hdl=
c.c
> index e7b2b72a6050..8316f2984864 100644
> --- a/drivers/net/wan/fsl_qmc_hdlc.c
> +++ b/drivers/net/wan/fsl_qmc_hdlc.c
> @@ -7,6 +7,7 @@
>   * Author: Herve Codina <herve.codina@bootlin.com>
>   */
> =20
> +#include <linux/bitmap.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/hdlc.h>
>  #include <linux/module.h>
> @@ -32,6 +33,7 @@ struct qmc_hdlc {
>  =09struct qmc_hdlc_desc tx_descs[8];
>  =09unsigned int tx_out;
>  =09struct qmc_hdlc_desc rx_descs[4];
> +=09u32 slot_map;
>  };
> =20
>  static inline struct qmc_hdlc *netdev_to_qmc_hdlc(struct net_device *net=
dev)
> @@ -202,6 +204,147 @@ static netdev_tx_t qmc_hdlc_xmit(struct sk_buff *sk=
b, struct net_device *netdev)
>  =09return NETDEV_TX_OK;
>  }
> =20
> +static int qmc_hdlc_xlate_slot_map(struct qmc_hdlc *qmc_hdlc,
> +=09=09=09=09   u32 slot_map, struct qmc_chan_ts_info *ts_info)
> +{
> +=09DECLARE_BITMAP(ts_mask_avail, 64);
> +=09DECLARE_BITMAP(ts_mask, 64);
> +=09DECLARE_BITMAP(map, 64);
> +=09u32 array32[2];
> +
> +=09/* Tx and Rx available masks must be identical */
> +=09if (ts_info->rx_ts_mask_avail !=3D ts_info->tx_ts_mask_avail) {
> +=09=09dev_err(qmc_hdlc->dev, "tx and rx available timeslots mismatch (0x=
%llx, 0x%llx)\n",
> +=09=09=09ts_info->rx_ts_mask_avail, ts_info->tx_ts_mask_avail);
> +=09=09return -EINVAL;
> +=09}
> +
> +=09bitmap_from_arr64(ts_mask_avail, &ts_info->rx_ts_mask_avail, 64);
> +=09array32[0] =3D slot_map;
> +=09array32[1] =3D 0;
> +=09bitmap_from_arr32(map, array32, 64);

What about using bitmap_from_u64 everywhere ?

Cheers,

Paolo

