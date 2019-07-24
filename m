Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1978D72BAC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 11:47:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tr9h649XzDqNK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 19:47:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eZZvz8MU"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tr8252YbzDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 19:46:08 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id o9so88302460iom.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 02:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NRFjHFE35FB4uBSwYwCu/PcwL63Fp8i9zWsUbuLLhZg=;
 b=eZZvz8MUDDvscWAJp5URtRj7R64vdVPSsQzexiV44aZ/dAsvvgDxUig8LVWn77lQYd
 Mx6Zt+ROmH9gnZrRPbrtFydwYrPxRdxWa8dxwyICaOwby2570vL1PUMAA/z5nTwcthL9
 VAPNDAEXLGJA6UzfNYxH/qVLbkU6C7UBcUmOn2jqfbEbktGL7I5wFDuK9qM162m4qee/
 xsedwTv21w8SWOGwWMFAOL9KVkhZC4OMGDx4AUvvXmpofH9rntTgBa5BXzl9c31h5Mt4
 XwfD1xp2F1BxUDuLu6fVRzCuE9zWyoDRvgTrzjzWvCxu3QWzt1CaHqcCa4d0wjxTTowV
 OL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NRFjHFE35FB4uBSwYwCu/PcwL63Fp8i9zWsUbuLLhZg=;
 b=t2A1JwaUZ6KOFWoJXqZLVwpYbQZA6Q5dQp19mw+jLflOm31wVAuNlrsU0xxfVrrf1x
 3Idg9LrdhE+7KsvL2lLWPj6XyvoWxtARJ26tHRlDmeHR/4KdwkQ4twk5bXMSKKcX0+MU
 wawxKzF7s7XIlxKC9KnDxeE+MLUOc0G32QGu8M3+YO/ihYAdMfM4DMiYRXn04eOdph3N
 zlSJWoyF5BA7htPMlyxAthXPAK2oYb0FRkqxBrupBlNiI6l8hYVOVRckFNvMvq8sOF5M
 dwTOgG0dBMkiLSq55iJiMQjjasJrMML5bWuy72huDUOn4xME+GmX17JL37AN950aMuMK
 hVQg==
X-Gm-Message-State: APjAAAUgHj0/LORMOVUkzorOXOjhQ7MAeqisf48iT1koJHZgfk1Mpl5c
 Y4+pKXUlFwCbSQhF4rExnpCd1q8OYX8k5r2zeos=
X-Google-Smtp-Source: APXvYqxY0n6k2Mly30f0xzGLMM2w4qXnmJpnhtjFzxOGcJdfuDO/kg96aWAmVa7MLSP/nIevYC/YqGPHMLEAFzwlx6Q=
X-Received: by 2002:a6b:c98c:: with SMTP id
 z134mr37161446iof.276.1563961565409; 
 Wed, 24 Jul 2019 02:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190723161357.26718-1-vaibhav@linux.ibm.com>
 <20190723161357.26718-5-vaibhav@linux.ibm.com>
 <fa75968e-1417-ef02-4f5e-5ba34c778377@linux.vnet.ibm.com>
 <CAOSf1CFA14eRY66J0gHAvNnWGzFTFmb3-RKQ3+XjrqdG0jxk6g@mail.gmail.com>
 <ee9b6b91-3e43-9436-6e3a-b0dc73179dd1@linux.vnet.ibm.com>
In-Reply-To: <ee9b6b91-3e43-9436-6e3a-b0dc73179dd1@linux.vnet.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 24 Jul 2019 19:45:54 +1000
Message-ID: <CAOSf1CEYMDeasS9kxcoA47Sqt3yvE399AOop3kSzrZ6aOMVPMw@mail.gmail.com>
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

On Wed, Jul 24, 2019 at 7:27 PM Laurent Dufour
<ldufour@linux.vnet.ibm.com> wrote:
>
> Le 24/07/2019 =C3=A0 11:24, Oliver O'Halloran a =C3=A9crit :
> > On Wed, Jul 24, 2019 at 7:17 PM Laurent Dufour
> > <ldufour@linux.vnet.ibm.com> wrote:
> >>
> >> Le 23/07/2019 =C3=A0 18:13, Vaibhav Jain a =C3=A9crit :
> >>> *snip*
> >>> @@ -404,6 +409,14 @@ static int papr_scm_probe(struct platform_device=
 *pdev)
> >>>
> >>>        /* request the hypervisor to bind this region to somewhere in =
memory */
> >>>        rc =3D drc_pmem_bind(p);
> >>> +
> >>> +     /* If phyp says drc memory still bound then force unbound and r=
etry */
> >>> +     if (rc =3D=3D -EBUSY) {
> >>> +             dev_warn(&pdev->dev, "Retrying bind after unbinding\n")=
;
> >>> +             drc_pmem_unbind(p);
> >>> +             rc =3D drc_pmem_bind(p);
> >>
> >> In the unlikely case where H_SCM_BIND_MEM is returning H_OVERLAP once =
the
> >> unbinding has been done, the error would be silently processed. That s=
ounds
> >> really unlikely, but should an error message be displayed in this
> >> particular case ?
> >
> > drc_pmem_bind() prints the h-call error code if we get one, so it's not=
 silent
>
> That's no more the case whith this patch, H_OVERLAP is handled before
> writing the error message, which would make sense for the first try.
>
> For the record, the patch introduces:
>
> @@ -65,6 +66,10 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
>         } while (rc =3D=3D H_BUSY);
>
>         if (rc) {
> +               /* H_OVERLAP needs a separate error path */
> +               if (rc =3D=3D H_OVERLAP)
> +                       return -EBUSY;
> +
>                 dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
>                 return -ENXIO;
>         }

Ah, good point. Getting H_OVERLAP is still an error case so I think
it's reasonable to still print the message in that case.
