Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D1232DD02
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 23:29:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ds5CJ5TZNz3d9w
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 09:29:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XQfwlPeo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XQfwlPeo; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ds5Bs54jDz3cKh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 09:29:25 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A29B564FF9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 22:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614896962;
 bh=ANwgarss26fhnHtMQx6kZPDetgPDjR7bGCtYWahlg/Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XQfwlPeoowQ9soQkxXtQOpFfuiwnfosGn+xFjVB8aJ/JGgfx5BhuMvaCj9VfRg9d2
 iIHF4gmkfIG2J0MEi1JhYjHQOFzqUadDKl40wvUBLfo+p1yFeDd1hNee5c4YdBd3Jf
 pUgDk65LdRHx5tP6CKcQOKReQMH2xqLWjqYKhBNl/sw786tXNG3BJIqTWHgMPtcxtx
 4XfF3xGUlx36SoifC5FZVxJscC7ODiBgtiHz9mT8mJelMlrf3tQOybZDB6tjRk94dl
 V5wjlX3EttoInTx779Z/h59tyjyz3ulpQMJrbghFayktiBRMFkW9h225/BFgt5sqZp
 ipSzxlBDS4eKQ==
Received: by mail-qt1-f171.google.com with SMTP id j3so210912qtj.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 14:29:22 -0800 (PST)
X-Gm-Message-State: AOAM532Ks3bl4HQPCA3OIHKsGzDSZ5aZtQwC3bweUFGzqDilDHNzYiBD
 E/kkObLc5Sxz80+FXITQhUntzDjRIF2BKfEMtQ==
X-Google-Smtp-Source: ABdhPJwx4d2wXbZtiOIhYLW9N+mjHTb19kz32s7JL6vHEGvP1Uq0fZcqmIA0CUEdGaXWw2o4QMKiAj+2ULAXXb0oCsE=
X-Received: by 2002:ac8:70d1:: with SMTP id g17mr4802329qtp.380.1614896961860; 
 Thu, 04 Mar 2021 14:29:21 -0800 (PST)
MIME-Version: 1.0
References: <20210304044803.812204-2-danielwa@cisco.com>
 <2b0081aa-52af-a4ab-7481-6e125bd103d6@csgroup.eu>
 <20210304212448.GK109100@zorba>
In-Reply-To: <20210304212448.GK109100@zorba>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Mar 2021 16:29:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJphExyTqEejMnM07NOgPyZ5hGLJunY6yXYm16WT+PGCQ@mail.gmail.com>
Message-ID: <CAL_JsqJphExyTqEejMnM07NOgPyZ5hGLJunY6yXYm16WT+PGCQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] CMDLINE: drivers: of: ifdef out cmdline section
To: Daniel Walker <danielwa@cisco.com>
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
Cc: devicetree@vger.kernel.org, Ruslan Ruslichenko <rruslich@cisco.com>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Frank Rowand <frowand.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, X86 ML <x86@kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 xe-linux-external@cisco.com, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 4, 2021 at 3:24 PM Daniel Walker <danielwa@cisco.com> wrote:
>
> On Thu, Mar 04, 2021 at 08:09:52AM +0100, Christophe Leroy wrote:
> >
> >
> > Le 04/03/2021 =C3=A0 05:47, Daniel Walker a =C3=A9crit :
> > > It looks like there's some seepage of cmdline stuff into
> > > the generic device tree code. This conflicts with the
> > > generic cmdline implementation so I remove it in the case
> > > when that's enabled.
> > >
> > > Cc: xe-linux-external@cisco.com
> > > Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> > > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > > ---
> > >   drivers/of/fdt.c | 12 ++++++++++++
> > >   1 file changed, 12 insertions(+)
> > >
> > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > index feb0f2d67fc5..cfe4f8d3c9f5 100644
> > > --- a/drivers/of/fdt.c
> > > +++ b/drivers/of/fdt.c
> > > @@ -25,6 +25,7 @@
> > >   #include <linux/serial_core.h>
> > >   #include <linux/sysfs.h>
> > >   #include <linux/random.h>
> > > +#include <linux/cmdline.h>
> > >   #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
> > >   #include <asm/page.h>
> > > @@ -1048,8 +1049,18 @@ int __init early_init_dt_scan_chosen(unsigned =
long node, const char *uname,
> > >     early_init_dt_check_for_initrd(node);
> > > +#ifdef CONFIG_GENERIC_CMDLINE
> > >     /* Retrieve command line */
> > >     p =3D of_get_flat_dt_prop(node, "bootargs", &l);
> > > +
> > > +   /*
> > > +    * The builtin command line will be added here, or it can overrid=
e
> > > +    * with the DT bootargs.
> > > +    */
> > > +   cmdline_add_builtin(data,
> > > +                       ((p !=3D NULL && l > 0) ? p : NULL), /* This =
is sanity checking */
> >
> > Can we do more simple ? If p is NULL, p is already NULL, so (l > 0 ? p =
: NULL) should be enough.
>
>
> I believe Rob gave me this line. Maybe he can comment on it.

It's an obvious improvement and LGTM.
