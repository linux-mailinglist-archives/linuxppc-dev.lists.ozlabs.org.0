Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 246D372B4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 11:26:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tqhw68RvzDqLj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 19:26:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O1NiosuQ"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tqfx5JJSzDqDK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 19:24:23 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id q22so88087585iog.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 02:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FJZCL3xRtUg0EpIeUNQQG4Pt69r3FEdlM0Fzb8K7yWo=;
 b=O1NiosuQXbqWy0NqTXhzkVuw/HasaD4TNYLPeoCKlX9LCJYe19g3Ew9ZIZMNx/RvtK
 9MYz7FM740Ui4bDU3KmY6dPte3tx2R3gMnpRpCFqFkSTp9zEGt5JmGPYIzmaAg4gQFfQ
 LAwFDPsDVWMZ6kx1homgwkaA9TZ3To3MQezIYXvEonASssfGWYLSF9lS2g2Mq+U/REry
 LrsIGuhpQMvPKbfPZyWj49LTkQKO9VqV6j3+OvjEFV2wtlI1aamfMmRsTobpq7DLBEJf
 e7uM0eB9Vr+pGki2mOpIJZEVxiutt6EoScROyW/neKhvfGcy32Ano68ecRfN947m1elR
 atCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FJZCL3xRtUg0EpIeUNQQG4Pt69r3FEdlM0Fzb8K7yWo=;
 b=QjTkdewObz9gdm+WcQ/RtloWz+2SS2VR2Uny0V2eeAbh+QQgfp5PW6Ry97UNOT2xe9
 nP3TpYVrlQjkH+2PxXK9pxJuspG76juUYAROuvNr9nQrXuN1Yc7a0uUM1T2AnJPWCnwt
 Z7NwIgKu0jDwm9KbP+j9bF62QlJk1qvrjY/C7aIJ60FHU04HGFSyrmoWSLNG+SmLydAK
 AJgpvhYn880/WNRejw6DbRO+NmRUr54t4kG4DB2DOtqv+To1GlaksOQkxuIOj/R7HR7W
 1FoSuU+ObUVYnZVGJ4JnVq2GvxCahlo/dkOhL4Jz+kj+getA0fiAi5NyowD2dDumLJSr
 r0kA==
X-Gm-Message-State: APjAAAU4LkUClj/K50nfnlS/3aXD7I1OoIEkvTWX8Z4L6ymdMpIIxPEs
 oXoBTE6+/ua1CQW03DWYxAhH0EZ8uTVzcYG16Vausqaj7r0=
X-Google-Smtp-Source: APXvYqxN8S56N0jwv6hqnNU3+3QxFHxXxpZS+H/uuCxIoC1RTqhlfm60lROLVpuAO45xdPsl2qBHQPJvuttMKvA4fFE=
X-Received: by 2002:a5e:c70c:: with SMTP id f12mr33046665iop.293.1563960259199; 
 Wed, 24 Jul 2019 02:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190723161357.26718-1-vaibhav@linux.ibm.com>
 <20190723161357.26718-5-vaibhav@linux.ibm.com>
 <fa75968e-1417-ef02-4f5e-5ba34c778377@linux.vnet.ibm.com>
In-Reply-To: <fa75968e-1417-ef02-4f5e-5ba34c778377@linux.vnet.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 24 Jul 2019 19:24:08 +1000
Message-ID: <CAOSf1CFA14eRY66J0gHAvNnWGzFTFmb3-RKQ3+XjrqdG0jxk6g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] powerpc/papr_scm: Force a scm-unbind if initial
 scm-bind fails
To: Laurent Dufour <ldufour@linux.vnet.ibm.com>
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2019 at 7:17 PM Laurent Dufour
<ldufour@linux.vnet.ibm.com> wrote:
>
> Le 23/07/2019 =C3=A0 18:13, Vaibhav Jain a =C3=A9crit :
> > *snip*
> > @@ -404,6 +409,14 @@ static int papr_scm_probe(struct platform_device *=
pdev)
> >
> >       /* request the hypervisor to bind this region to somewhere in mem=
ory */
> >       rc =3D drc_pmem_bind(p);
> > +
> > +     /* If phyp says drc memory still bound then force unbound and ret=
ry */
> > +     if (rc =3D=3D -EBUSY) {
> > +             dev_warn(&pdev->dev, "Retrying bind after unbinding\n");
> > +             drc_pmem_unbind(p);
> > +             rc =3D drc_pmem_bind(p);
>
> In the unlikely case where H_SCM_BIND_MEM is returning H_OVERLAP once the
> unbinding has been done, the error would be silently processed. That soun=
ds
> really unlikely, but should an error message be displayed in this
> particular case ?

drc_pmem_bind() prints the h-call error code if we get one, so it's not sil=
ent
