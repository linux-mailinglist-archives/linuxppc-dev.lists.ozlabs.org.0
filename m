Return-Path: <linuxppc-dev+bounces-3690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA1D9E0F13
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 23:56:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2K023PGyz2yHL;
	Tue,  3 Dec 2024 09:56:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733180178;
	cv=none; b=bE50uVm4YCJcU5Xxku83032bptlt3mTOjT+gmBIaUcZCS7OpoBma8SCMNd16nOd044dMf5ZAR0EZcXw/06CP2r0JshFsQXPk77uWl8x9MdW0YKZ8N8EoS8o3lSuranAYuBmcde5mbJsmf8uaVDjzRIvgkXsfGqx8dWQeTJr0fyhUYHZ9g9RVFCAHMce/4Wb/L/qx1i166/noBokSiwad0hKdUSn1gku91VLbtwZwugV9mMyKdBFXgeXkPeuDF+VqC5rCFoRKvtMMjmLqinuTRVHYdfl7p+ZTFVhQ+K6VPClE6DFLVPpYv1d8CyymwDgOs+sLHL5nRmLpBbj5PnY6mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733180178; c=relaxed/relaxed;
	bh=xAx3A7ve6q9wwo1QGJyUvWsLjGxUz9/VFlRD9VxAmFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ks9JBZBPYkqNRbHeOeofHxdx+iacd0OWRL5dlE4itsZRkTXtRYyOke5AaJbKB6hcbFn3LHMRWTJXV26a/zsRHIknMUNhSmXY4/1McCIHjp5daO4PEjMpaEL2brQ9qnN+c08Y8xD4y+186go3Wnl1stdL3Dc3+c34AJQlJiBbGkIiDZNsnWVSB6cjdwNXOXO4RoBmXkSgndC9Bc6Vgv8YdPjX1sALz3P+fb7yhUMI2vs8neyeV14MbjvVGF5gucnA+nKz0+9X/wewxr477ksBIQ1YKuP0aRUO57Oset8/drgPJ1CnbSLrvEWvRiBX0ZG9CwMV8+a39nDsLzz7x5sGgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r/5rJHri; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r/5rJHri;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2Jzy4Pxzz2yFP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 09:56:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B82C95C697E
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 22:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FC1C4CED6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 22:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733180170;
	bh=C390/U3lQIPd9DTFWuMmUpP8GWQW0gL7hXO3NhmNEoc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r/5rJHriXWguekh0f3N3wpCM6DHd8Febo2Z89o3XFa+sqg6Sc5mw1sdkIpBVPJIjP
	 fPeVZSKVqzt8dAJTyzb+SX4+90hzsWu5mhWINAOB7Qu/gjF6dTj1FBtYmHFqsGZ3S6
	 AyiMKR39vdB31rXhQwNq1ASmb3nY4MhLv2Lz/PFYZZqHHJDMs0wokItOiSEAzEAvXC
	 EFZVQno86P0pHvhArboKTcZ+OKZjLD2/4WKaJoDGr2xcNQWEwGz3AlsD7OQFRnBdno
	 kiT2j7Ry5pt86rVvFb/nf/4U52g+DMvRRZw3KKkjDdW6XADxUaKHN2ie/TmOqwAXXF
	 vln9XWzgVCAZQ==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e3984b1db09so3436958276.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2024 14:56:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXY/Euyl+mhIaSoKM02EULxb1OTOcfWfgVXuUifvNGudM1+vV8uIAtUKeJ2iMx1crvlFk626O7jIGbu3Nk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwpAzVtUFGDuOm0Co74dHQWUJe9CV1Jy3p/72tHc0Bczk5M1vva
	AXKavCwmcvAQ4PwACmd16r8Yr0HoIUhEPHzv993ENmcVyVXHGfBUD89JlBryk0Xr7oHtqETwza4
	ZEbaP4VppxTQAPZQiekRG/1u9LQ==
X-Google-Smtp-Source: AGHT+IEqo9P4Zr3/vlhz9V+X1UM634ot9hRB2b4JJ5/kLZJov8aEvuWuPHXqi5ULgy6Qx9wsrwTqWQ6sVwGERMSPO/I=
X-Received: by 2002:a05:6902:338a:b0:e38:87bf:8e65 with SMTP id
 3f1490d57ef6-e39d35a8631mr282616276.0.1733180169551; Mon, 02 Dec 2024
 14:56:09 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241106171028.3830266-1-robh@kernel.org> <87jzdfcm3l.fsf@mpe.ellerman.id.au>
 <87plmi7jjz.fsf@mpe.ellerman.id.au> <20241127214232.GQ29862@gate.crashing.org>
 <CAL_JsqKhp8bW66koP8JPSkXmrCjA+oQh6NZte_uphiLTC_=7Rw@mail.gmail.com> <20241202220434.GU29862@gate.crashing.org>
In-Reply-To: <20241202220434.GU29862@gate.crashing.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Dec 2024 16:55:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL5FHPNQWGdBEz9UpD7cq3We-czPV8OmwD=0w5Eu10=kA@mail.gmail.com>
Message-ID: <CAL_JsqL5FHPNQWGdBEz9UpD7cq3We-czPV8OmwD=0w5Eu10=kA@mail.gmail.com>
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells handling
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Saravana Kannan <saravanak@google.com>, 
	linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 2, 2024 at 4:09=E2=80=AFPM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Mon, Dec 02, 2024 at 08:18:22AM -0600, Rob Herring wrote:
> > On Wed, Nov 27, 2024 at 3:47=E2=80=AFPM Segher Boessenkool
> > <segher@kernel.crashing.org> wrote:
> > > On Tue, Nov 26, 2024 at 02:36:32PM +1100, Michael Ellerman wrote:
> > > > Michael Ellerman <mpe@ellerman.id.au> writes:
> > > > > "Rob Herring (Arm)" <robh@kernel.org> writes:
> > > > >> While OpenFirmware originally allowed walking parent nodes and d=
efault
> > > > >> root values for #address-cells and #size-cells, FDT has long req=
uired
> > > > >> explicit values. It's been a warning in dtc for the root node si=
nce the
> > > > >> beginning (2005) and for any parent node since 2007. Of course, =
not all
> > > > >> FDT uses dtc, but that should be the majority by far. The variou=
s
> > > > >> extracted OF devicetrees I have dating back to the 1990s (variou=
s
> > > > >> PowerMac, OLPC, PASemi Nemo) all have explicit root node propert=
ies.
> > > > >
> > > > > I have various old device trees that have been given to me over t=
he
> > > > > years, and as far as I can tell they all have these properties (s=
ome of
> > > > > them are partial trees so it's hard to be 100% sure).
> > > > >
> > > > > So LGTM.
> > > >
> > > > Turns out I was wrong.
> > > >
> > > > The warning about #size-cells hits on some powermacs, possible fixu=
p
> > > > patch here:
> > > >
> > > >   https://lore.kernel.org/linuxppc-dev/20241126025710.591683-1-mpe@=
ellerman.id.au/
> > >
> > > The Open Firmware specification is extremely clear that a "missing"
> > > "#size-cells" property means this bus has the default value of 1.
> >
> > And the default for #address-cells is 2, but yet every architecture
> > except Sparc has that wrong.
>
> ?
>
> Almost all architectures (that run Linux) use 64-bit addressing, both
> 32-bit and 64-bit architectures.

I'm just telling you what Linux uses for defaults for at least 20 years.

> > If I have a node without #size-cells, is the default of 1 used or do
> > we check parent nodes? My read of the spec would be the former, but
> > the kernel does the latter.
>
> The former is correct.  The latter makes no sense at all!  The whole
> point of the "bus" abstraction is that you get a new addressing domain
> there.

I agree, but that's what the kernel does (again, for 20+ years).
Walking the parents is really what I want to get rid of here. My
choices were drop that behavior and see who I break, or add a warning
and see who notices. I went the nicer route of a warning.

> Yes, these days you numerically find it most often with PCI sub-domains,
> but those are boring.  In most cases you *do* have different adressing
> on your child busses, and even if the addressing is the same, addresses
> on the child bus are not normally a subset of those on the parent bus.
>
> > > https://www.openfirmware.info/data/docs/of1275.pdf (page 186).
> > >
> > > DTC or FDT might want to do things differently, but expecting decades
> > > older stuff to conform to its ill-conceived unnecessarily super wordy
> > > stuff is, well, not a plan that is likely to work very well :-)
> >
> > That is not the intention. The intention is to identify what doesn't
> > conform and exclude those systems from this check (or apply a fixup if
> > that works).
>
> So *always* use the OF definition, at least on OF systems?  Where
> everything is meant to conform, but conform to OF, not conform to this
> "OF-like-but-very-different-in-crucial-spots" thing :-)

I'm pretty sure there are OF systems that don't conform, so it is not
that simple. There's this comment in of_irq_parse_raw() for example:

        /* Look for this #address-cells. We have to implement the old linux
         * trick of looking for the parent here as some device-trees rely o=
n it
         */

Maybe that's from some system long dropped and we don't need it
anymore. I have no idea. That's what I'm trying to find out with this
patch.

We also don't really have a way to distinguish OF from FDT (where we'd
need to). It is somewhat just by arch, but PPC always passes an FDT to
the kernel for both FDT and OF systems.

Rob

