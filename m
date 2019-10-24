Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C034E3D19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 22:23:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zdwx2jS8zDqfH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 07:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zdTd64D0zDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 07:03:17 +1100 (AEDT)
Received: by mail-oi1-f196.google.com with SMTP id 83so21778022oii.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 13:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=igey018oqO3qwGLtBSWMuY/lWCADIgWzGXzdJ93djzQ=;
 b=f6wp6acnAM7SSmFNzt91zPxOwa3ZbK806fmipWztgTnaYEHMxdDe/kEtFzYaq9HznD
 x6w1vU6jbSOqwY+rDojIi2fZE9ndhvewvYl2o8TyyMYd9FsNZcMAbmLLyqtqdWhWCoCD
 h6iIKFeNXfFkR6ymaFNncULo99ZdrfqOi0vTlOptdVqGQsgDba82U7N9g9xTyuWz2U+V
 52ZHkv4QeI0X3hvfxNiZ1TGpxtCWWka6Dlc0+gvBaM/X4wyhj3bJBsVya/x8BeQDFB0R
 lICuY8msl+t33OEI1Zx8SeiaGEklMJ/9LHgKF65vzIJP18ZdiwfpJE5AFJXUJvgI05P3
 wjOA==
X-Gm-Message-State: APjAAAVvkkHO3oFllyirDSh+/A6zHBqu2ZS1wGwaUbycNfo8hbjOrIsN
 ENHYeiIBhb8i7jsCkDo3nzV65I5sm1c=
X-Google-Smtp-Source: APXvYqw/5TbpPc+F5TWC0Z/RA4NcQGpy/Jif0N9JDL72B+0i91YTFXLVDR9iwUhx7ZWRHgYlDezPKA==
X-Received: by 2002:aca:62d5:: with SMTP id w204mr6375415oib.136.1571947392355; 
 Thu, 24 Oct 2019 13:03:12 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com.
 [209.85.167.179])
 by smtp.gmail.com with ESMTPSA id 21sm6749564oin.26.2019.10.24.13.03.10
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 13:03:10 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id o205so21736649oib.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 13:03:10 -0700 (PDT)
X-Received: by 2002:aca:d88b:: with SMTP id p133mr6042557oig.51.1571947390375; 
 Thu, 24 Oct 2019 13:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <VE1PR04MB6687DA0268FAF03D3E77A23B8F6C0@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <e02fa027-9c78-3272-d2d7-7ad2b0ed3ab0@rasmusvillemoes.dk>
 <CADRPPNREUK1SVxO4P5qb2COn+T04dtYgpVEzrveKUt16hBqAtQ@mail.gmail.com>
 <679bf33b-8c05-b77a-0cb2-d79dc5bfbe75@rasmusvillemoes.dk>
 <CADRPPNSiMUy77Dhxjg03sHDxyZzWf_BP8a5+fCncbynyO_cNGg@mail.gmail.com>
 <VE1PR04MB676825D5709839AEF75ED44C91680@VE1PR04MB6768.eurprd04.prod.outlook.com>
 <43033011-1a2a-dea3-e3c9-75895f997407@rasmusvillemoes.dk>
 <VE1PR04MB6768D3023802D62AB9FE2F6E916B0@VE1PR04MB6768.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6768D3023802D62AB9FE2F6E916B0@VE1PR04MB6768.eurprd04.prod.outlook.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 24 Oct 2019 15:02:59 -0500
X-Gmail-Original-Message-ID: <CADRPPNRnOH9OgJC7VNYxj5tj87PQzHcvtofqK2xb4Uc7eNCkMg@mail.gmail.com>
Message-ID: <CADRPPNRnOH9OgJC7VNYxj5tj87PQzHcvtofqK2xb4Uc7eNCkMg@mail.gmail.com>
Subject: Re: [PATCH 0/7] towards QE support on ARM
To: Qiang Zhao <qiang.zhao@nxp.com>
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
Cc: Timur Tabi <timur@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jslaby@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 22, 2019 at 9:54 PM Qiang Zhao <qiang.zhao@nxp.com> wrote:
>
> On 22/10/2019 18:18, Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:
> > -----Original Message-----
> > From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > Sent: 2019=E5=B9=B410=E6=9C=8822=E6=97=A5 18:18
> > To: Qiang Zhao <qiang.zhao@nxp.com>; Leo Li <leoyang.li@nxp.com>
> > Cc: Timur Tabi <timur@kernel.org>; Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org>; linux-kernel@vger.kernel.org;
> > linux-serial@vger.kernel.org; Jiri Slaby <jslaby@suse.com>;
> > linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH 0/7] towards QE support on ARM
> >
> > On 22/10/2019 04.24, Qiang Zhao wrote:
> > > On Mon, Oct 22, 2019 at 6:11 AM Leo Li wrote
> >
> > >> Right.  I'm really interested in getting this applied to my tree and
> > >> make it upstream.  Zhao Qiang, can you help to review Rasmus's
> > >> patches and comment?
> > >
> > > As you know, I maintained a similar patchset removing PPC, and someon=
e
> > told me qe_ic should moved into drivers/irqchip/.
> > > I also thought qe_ic is a interrupt control driver, should be moved i=
nto dir
> > irqchip.
> >
> > Yes, and I also plan to do that at some point. However, that's orthogon=
al to
> > making the driver build on ARM, so I don't want to mix the two. Making =
it
> > usable on ARM is my/our priority currently.
> >
> > I'd appreciate your input on my patches.
>
> Yes, we can put this patchset in first place, ensure it can build and wor=
k on ARM, then push another patchset to move qe_ic.

Right.  I would only accept a patch series that can really build and
work on ARM.  At least the current out-of-tree patches can make it
work on ARM.  If we accept partial changes, there is no way to make it
work on the latest kernel on ARM then.

Regards,
Leo
