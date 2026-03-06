Return-Path: <linuxppc-dev+bounces-17843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OfhHEkQq2kRZwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 18:35:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F2622645D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 18:35:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSD7T0kzNz3bfV;
	Sat, 07 Mar 2026 04:35:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772818500;
	cv=none; b=W5gRTE9aokn7nHWrtE+t5apxOPFnkdqCxGAg0B8R10/m901XEY58Kxp0WMitn8rILg+mT7sRidrTooOPAs39GaB3J2wIEUDZbTr18fdp4AQ7u81IjJElmUp1bRemK2l7Q9o0t5WhzodCXMwukTBHNmw5p2Shiz4YEkUqCaOxxAwC1Lo1pQ9KfjLUOyFOeJo+lq9+h5KPSh0AoNzzYLa1B/ktRpPJw1N+cwgeIxpi5z3Ud0Tdd1qQj46XY6HflvfX7u8OTTDR6tNlqA8/acp5P5b/JmVhNnsdKyMfb7qpH0RXse5SbONj7kpX2vB0M+4i4PeRRpJTl9Fm6xJxibTutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772818500; c=relaxed/relaxed;
	bh=v5CiRKQ0iFjb+yZmoCiuGH5ayfkkNl11+lDvC+/dz2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LirVOFfbcjgQq71hNE77i4JkWrAqdgHZuC0s0jeOYQcd86aLhfznPJ2NeyS6PkveUp3Ue9FiCKyd+/tIDBRJH/0daD9dwQiblR9z6le7cKLNRvyovHaO519sYAv69V/umkxXe5mGhPMMkorwaQxKFm39J6hRyabyTzaJ5DpGlnqvg59VAzNRwgdoC3p9Nb8x/FuX7EPhh6fZDZBo/XQRLhyHcCuRjQh7ezkpuu0C9PSq/ErReC0BednDxkty8cykM+edyl7+d49bgYlwx6U01o40qJlZPp65DT+6Ewp+Tp0rEgXUuZ/9EcGxhyyavnKMZC8VvVIjD9OE/ZwIF7gbjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IsUF/XTy; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IsUF/XTy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSD7S1BXSz2xT4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 04:35:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DBB36001D
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2026 17:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDD6C2BCB1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2026 17:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772818497;
	bh=SR+mdgLhlOhUS2wbF1s2i9ovITikFxXdvE5yE1P9YdI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IsUF/XTycn0CKydUrnqYikvqNO9ZMczOJtjO7TCzrOjWyt7xzMh8RLVcJR9Kcb+5q
	 p1bmm3B7gLT9FCdqdxb2Mh4JrPsGdbFgezfpW2UGKyugg6Nmr2CsN753l7cMgg+0G8
	 H97kSflQSfMoro7L5rGmLF+7FdVRGSAANOX0sfJI0pd/isMPuBj6paL/J0Tc1PmQiW
	 x+SUG5lzK1HO6XXo9imEvaZGYe5GqG5j85GzWaIbRqlE/hAJybSxzOI+gdUO33z6WM
	 I11kDz4Q6EEuhM7PS6k8a4ub5XAvMDUtyeRl66FGf1nxsF1KbxA7IjCRs4GuM0pJw3
	 KpEjmfBqp9QNQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a33a542aeso21621621fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 09:34:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwkIuijt+6Py7WlTayKF49Sl9mtOlK1dN8haNnq7pJRhv2zw5lMEfO2euA4ZVuxpweAEPywT44RRWR45Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxKawPMYLj9XdFbtIiVEJrkovVvbk7WQWinPBS8yGzhUdnPoVbC
	m57VnSd+qO9tb1Ryay0plz6lKcYpB1WC5a6CV8WrVecFzkYp0PVICyAFXlR4vWkqrHWahYNHhqq
	ufEHp+s95rnjTJGDnTpKfWo52/ydPIePn2n83miI0fw==
X-Received: by 2002:a05:651c:893:b0:38a:519:f788 with SMTP id
 38308e7fff4ca-38a40b388d2mr12029891fa.2.1772818495778; Fri, 06 Mar 2026
 09:34:55 -0800 (PST)
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
Precedence: list
MIME-Version: 1.0
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com> <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com> <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com> <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com> <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
 <aar1PDUB2t7DgEP6@hovoldconsulting.com>
In-Reply-To: <aar1PDUB2t7DgEP6@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 6 Mar 2026 18:34:43 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mcv+ZMGaC_MD8WRH113rDuuxdiZXuW5JAXWga1V7vM_ng@mail.gmail.com>
X-Gm-Features: AaiRm50UrSeiyZ4TiR6fS-QYqCuucHSEPqczNWdyNSw2yOiisqheMyZnUWDBliw
Message-ID: <CAMRc=Mcv+ZMGaC_MD8WRH113rDuuxdiZXuW5JAXWga1V7vM_ng@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 39F2622645D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17843-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:wsa+renesas@sang-engineering.com,m:bartosz.golaszewski@oss.qualcomm.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:linux-media@vger.kernel.org,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 4:39=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Wed, Mar 04, 2026 at 01:55:14AM -0800, Bartosz Golaszewski wrote:
> > On Tue, Mar 3, 2026 at 4:57=E2=80=AFPM Johan Hovold <johan@kernel.org> =
wrote:
> > >
> > > On Mon, Mar 02, 2026 at 12:03:19PM -0600, Bartosz Golaszewski wrote:
> > > > On Fri, Feb 27, 2026 at 5:41=E2=80=AFPM Johan Hovold <johan@kernel.=
org> wrote:
> > > > >
> > > > > On Fri, Feb 27, 2026 at 04:42:09PM +0100, Bartosz Golaszewski wro=
te:
> > > > > > On Fri, Feb 27, 2026 at 11:06=E2=80=AFAM Johan Hovold <johan@ke=
rnel.org> wrote:
> > > > >
> > > > > > > It seems all that is needed is to decouple the struct i2c_ada=
pter from
> > > > > > > the driver data and have core manage the lifetime of the form=
er using
> > > > > > > the reference count of the embedded struct device.
> > > > >
> > > > > > This is a weird pattern you sometimes see where a driver alloca=
tes
> > > > > > something and passes the ownership to the subsystem.
> > > > >
> > > > > It's not weird at all, this is the standard way to handle this. W=
e have
> > > > > these things called reference counts for a reason.
> > > >
> > > > I wouldn't say it's *the* standard way. There are at least several =
different
> > > > ways driver subsystems handle resource ownership. And even so: the =
fact that
> > > > something's done a lot does not make it automatically correct.
> > >
> > > It's the way the driver model works.
> >
> > No, it does not impose any specific pattern to use for subsystems other=
 than
> > requiring each device that's been *initialized* to provide a .release()=
 callback
> > called when the last reference is dropped.
>
> Reference counting is a core part of the driver model and this is
> reflected in the way subsystems manage lifetime.
>

Seems like we've reached an agreement and can stop arguing but you
make it sound here like I'm somehow against reference counting. I've
never said anything like that and here, I just explained how reference
counting works and what it imposes on users.

> > > > I'm advocating for a hard split between the subsystem data (referen=
ce-counted)
> > > > and driver data (living from probe() until remove()). A logical str=
uct device
> > > > managed entirely by the subsystem should live in a separate structu=
re than
> > > > driver data and be allocated - and freed - by the subsystem module.
> > >
> > > It doesn't really matter what you think. You can't just go around
> > > making up new subsystem specific rules at your whim. The linux driver
> > > model uses reference counting and that's what developers expect to be
> > > used.
> > >
> >
> > And I've never said that it should not use reference counting. I'm not =
sure
> > what you're implying here.
>
> You have posted changes that will prevent driver from accessing the
> struct device of core i2c structures. This is unexpected, non-idiomatic
> and subsystem specific and therefore a bad idea.
>

That's not true, the changes provide a helper to that end.

> > > > Let's put aside kernel code for a minute and work with an abstract =
C example,
> > > > where the equivalent of what you're proposing would look like this:
> > > >
> > > > struct bar {
> > > >      struct foo foo;
> > > >      ...
> > > > };
> > > >
> > > > struct bar *bar =3D malloc(sizeof(*bar));
> > > >
> > > > ret =3D foo_register(&bar->foo);
> > > >
> > > > And the corresponding free() lives who knows where because foo_regi=
ster()
> > > > automagically introduces reference counting (nevermind the need to =
calculate
> > > > where bar is in relations to foo).
> > >
> > > No, that's not what I'm suggesting here, but it would be compatible w=
ith
> > > the driver model (ever heard of struct device which works exactly lik=
e
> > > this?).
> >
> > I know how struct device works. I'm pointing out that this is a bad API=
 (just
> > to be absolutely clear: not the reference counting of struct device its=
elf but
> > using it in a way tha looks like it's not refcounted but becomes so aft=
er an
> > API call) because it's confusing. I'm not buying the argument that if i=
t
> > confuses you then you should not be doing kernel development because it=
's not
> > the goal of API design to make it as complex and confusing as possible =
- quite
> > the contrary. And it *is* confusing given the amount of misuse present.=
 I've
> > heard Greg KH say on multiple occasions during his talks that we try to=
 offload
> > complex code to subsystems so that drivers can remain fairly simple. I =
agree
> > with that.
>
> Again, this is a core feature of the driver model. You can't just ignore
> it and come up with random ways to work around just because you disagree
> with design decisions that were made 25 years ago.
>

It absolutely *can* be done differently. There's nothing that imposes
a certain API design on susbsystems. If you design the subsystem code
well, provider drivers don't need more than one reference (taken in
probe(), released in remove(), for instance via the
register()/unregister() pair) so the counting can be hidden within the
subsystems that control them.

Bartosz

