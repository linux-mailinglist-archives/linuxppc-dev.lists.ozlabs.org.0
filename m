Return-Path: <linuxppc-dev+bounces-17712-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AN1tAJABqGkRnQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17712-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:55:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A96AE1FDF45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:55:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQp212kSPz3bp0;
	Wed, 04 Mar 2026 20:55:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772618121;
	cv=none; b=lbYweOkW/1XoWEa891GqexCqgWrGuzmc5KwkmTJGHjZ04YIBofA21X3a2m/Be6h1BeIuIj5gsh85jK1jjOepH4BotTKmRnOVAFzoBmqjgoicBsHQGwuMy5lnOigknlqyKjI2kAWBYNgXxo1q9+1anPKkdT5RvheKGXR5B0mwf9i25BpagXj36E5YSTvy8TEVN//s7Md9E/k5c4OQ5x99WnMinK/7xL8nJ/HNIugsDNvnt87Wq0iGcIb8udNjcfoWfSw5EgFaBPEjc/ZL1E+pKq3Sn84c+cc4uOp3pVgO5x8ODlst4QA06zLpRI/psN7ujjxeQbqdDuk0Fy09QxvKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772618121; c=relaxed/relaxed;
	bh=SihOPOO1Wh84UAzdFYWoNZP2ZOlBrgZQ/QhEkAEyAFA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgBiSCp69BBM+Qq4Km7ceCvwNY4u0nsDaeQwOjPBheEJ4z+9Cudioiw913V+lkUsNydv6pEQogZzdEZcbDLdBPbWboQl3LgU6sK/kvrRAJo50G6HW/p0m4ePXTM3p+0/i5aswFVj77lUMb0lLs0kZ18xyF03yL5+okELXUs1zWi8qlKRllJpwBd5qUrK3eH7iMtZO7ixzfSaecyydb6tGqm2xWxTMRuZQ2nsbI7L3Ing9AeNYV3NkTYst5OoCi7Tn+wc6RXo/j0yC2E/3f+FpXNQ8SWqc/31JDMBL2YDoVZtCKNe20GcUnMviU/KndMoYWS/TvMgPu9UZdjhrqgvjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IDXN7gmv; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IDXN7gmv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQp201ZZXz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 20:55:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A8294472D
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2026 09:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B77C2BCB3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2026 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772618118;
	bh=g7rT5pzmvMWMQmalMKqVnAHzQr5G/tKv45hmbKvwObA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=IDXN7gmvS9xa2vrKN++cCjK7d/KvXRb8Ik0WHfWNMmet7lpWxZGOi/26+b9OM7+D7
	 jkyHHARrjVqQ2XdR15cJxU7/YrIaJgEl/o1N+z9S4sph2NDNuRNtXEAEV+iYiuJPYL
	 AlbzlzVW0NNL6Gk2MLDe8MnTnzokO3kRjwZtLUWqGGY9CRfn0Fp14dkym+JrKsDYBw
	 /Yj93DNrLfKKLV3Rxo3MnjOXo/0wNJGwHDYwVSC1hL5gSaFNPhKi1d21p4AuSzWMn9
	 rlqIfOI6OOVSL4MYR10JjAzenjWnefs3y8N2nZJHyhOsEE1p5F9FhahSOVCLOvtA0p
	 vMTF4c2zJ9rlw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a3066b68bso1958551fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 01:55:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNW9LFNxhHq2A16QoalFd1/MzMgxy1sDnqX89ECfQ6KsIJ6CEhOod5j1Gkp4QqFd5zrB3IcxVlaeZhP6M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyeos8XnHYX0kiV+SKpx0hgaA8BJQMSUZGY1qQ8ASvY19Z8QjIq
	0G2HYX1AEKAukZM/vHQUgr8GBFtiz/isWbGdd9XYdm5x8LcIZvSAdVvKI6C/kRZ9Y86JZCa/ZxH
	p7B6B5KtXQwzE4wK3uOe9yVmO+GX+Rs09WnOR5crpXg==
X-Received: by 2002:a2e:a4d0:0:b0:38a:18e0:6433 with SMTP id
 38308e7fff4ca-38a2c7bf182mr10049121fa.37.1772618116458; Wed, 04 Mar 2026
 01:55:16 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Mar 2026 01:55:14 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Mar 2026 01:55:14 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aacE-27iaYneKCJi@hovoldconsulting.com>
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
 <aacE-27iaYneKCJi@hovoldconsulting.com>
Date: Wed, 4 Mar 2026 01:55:14 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
X-Gm-Features: AaiRm53mBePX3Vk4_MZn1-cdblcn8U2NxlCqWwVL6LjJiipLfY2kXBxQWFn1FB4
Message-ID: <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
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
	linux-actions@lists.infradead.org, linux-media@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: A96AE1FDF45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17712-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:wsa+renesas@sang-engineering.com,m:bartosz.golaszewski@oss.qualcomm.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:linux-media@vger.kernel.org,m:brgl@kernel.org,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 4:57=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Mon, Mar 02, 2026 at 12:03:19PM -0600, Bartosz Golaszewski wrote:
> > On Fri, Feb 27, 2026 at 5:41=E2=80=AFPM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > On Fri, Feb 27, 2026 at 04:42:09PM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Feb 27, 2026 at 11:06=E2=80=AFAM Johan Hovold <johan@kernel=
.org> wrote:
> > >
> > > > > It seems all that is needed is to decouple the struct i2c_adapter=
 from
> > > > > the driver data and have core manage the lifetime of the former u=
sing
> > > > > the reference count of the embedded struct device.
> > >
> > > > This is a weird pattern you sometimes see where a driver allocates
> > > > something and passes the ownership to the subsystem.
> > >
> > > It's not weird at all, this is the standard way to handle this. We ha=
ve
> > > these things called reference counts for a reason.
> > >
> >
> > I wouldn't say it's *the* standard way. There are at least several diff=
erent
> > ways driver subsystems handle resource ownership. And even so: the fact=
 that
> > something's done a lot does not make it automatically correct.
>
> It's the way the driver model works.
>

No, it does not impose any specific pattern to use for subsystems other tha=
n
requiring each device that's been *initialized* to provide a .release() cal=
lback
called when the last reference is dropped.

> > > > This often
> > > > causes confusion among driver authors, who logically assume that if
> > > > you allocate something, you are responsible for freeing it.Since th=
is
> > > > is C and not Rust (where such things are tracked by the compiler), =
I
> > > > strongly believe we should strive to keep ownership consistent: the
> > > > driver should free resources it allocated within the bounds of the
> > > > lifetime of the device it controls. The subsystem should manage the
> > > > data it allocated - in this case the i2c adapter struct device.
> > >
> > > Drivers are responsible for dropping *their* reference, it doesn't me=
an
> > > that the resource is necessarily freed immediately as someone else ma=
y
> > > be holding a reference. Anyone surprised by this should not be doing
> > > kernel development.
> >
> > I disagree. For some reason, you're defending a suboptimal programming
> > interface. I'm all for reference counting but mixing reference-counted =
data
> > with non-counted is simply not a good idea. An API should be easy to us=
e and
> > hard to misuse. Given the amount of issues, this approach is definitely=
 easy
> > to misuse.
> >
> > I'm advocating for a hard split between the subsystem data (reference-c=
ounted)
> > and driver data (living from probe() until remove()). A logical struct =
device
> > managed entirely by the subsystem should live in a separate structure t=
han
> > driver data and be allocated - and freed - by the subsystem module.
>
> It doesn't really matter what you think. You can't just go around
> making up new subsystem specific rules at your whim. The linux driver
> model uses reference counting and that's what developers expect to be
> used.
>

And I've never said that it should not use reference counting. I'm not sure
what you're implying here.

> > Let's put aside kernel code for a minute and work with an abstract C ex=
ample,
> > where the equivalent of what you're proposing would look like this:
> >
> > struct bar {
> >	   struct foo foo;
> >	   ...
> > };
> >
> > struct bar *bar =3D malloc(sizeof(*bar));
> >
> > ret =3D foo_register(&bar->foo);
> >
> > And the corresponding free() lives who knows where because foo_register=
()
> > automagically introduces reference counting (nevermind the need to calc=
ulate
> > where bar is in relations to foo).
>
> No, that's not what I'm suggesting here, but it would be compatible with
> the driver model (ever heard of struct device which works exactly like
> this?).
>

I know how struct device works. I'm pointing out that this is a bad API (ju=
st
to be absolutely clear: not the reference counting of struct device itself =
but
using it in a way tha looks like it's not refcounted but becomes so after a=
n
API call) because it's confusing. I'm not buying the argument that if it
confuses you then you should not be doing kernel development because it's n=
ot
the goal of API design to make it as complex and confusing as possible - qu=
ite
the contrary. And it *is* confusing given the amount of misuse present. I'v=
e
heard Greg KH say on multiple occasions during his talks that we try to off=
load
complex code to subsystems so that drivers can remain fairly simple. I agre=
e
with that.

> > I strongly believe that this makes more sense:
> >
> > struct bar {
> >	   ...
> > };
> >
> > struct bar *bar =3D malloc();
> >
> > struct foo *foo =3D foo_register(bar);
> >
> > // foo is reference counted and allocated in the provider of foo_regist=
er()
> >
> > foo_put(foo);
> > free(bar);
> >
> > The equivalent of which is moving struct device out of struct i2c_adapt=
er.
>
> No, it's not.
>
> > In fact: I would love to see i2c_adapter become a truly reference-count=
ed
> > object detached from driver data but due to it being embedded in every =
bus
> > driver data structure it realistically won't happen.
>
> And this is what I've been suggesting all along, separating the driver
> data and making the adapter reference counted.
>
> The idiomatic way to handle this is:
>
>		 xyz_probe()
>		 {
>				 adap =3D i2c_adapter_alloc();
>				 // initialise driver data, store pointer in adap
>				 i2c_adapter_register(adap);
>		 }
>
>		 xyz_remove()
>		 {
>				 i2c_adapter_deregister(adap);
>				 i2c_adapter_put(adap);
>		 }
>
> Exactly where the driver data is stored is secondary, it could be memory
> allocated by core or by the driver.
>
> But the adapter is reference counted and kept around until all users are
> gone.
>

Yeah, that's awesome but that's not what's being done in i2c. We do:

struct foo_i2c_driver_data {
	struct i2c_adapter adap {
		struct device dev;
		...
	};
	...
};

instead which is a completely different story. It makes foo_i2c_driver_data
implicitly reference counted despite its lifetime being tied to the bound-s=
tate
of the device. It becomes painfully obvious in rust when the compiler start=
s
enforcing proper lifetime management.

What you showed above is totally fine. For an even simpler API, my personal
preference would be to:

xyz_probe()
{
	struct drv_data *data =3D kzalloc();
	/*
	 * ... stands for any other arguments or a config struct. In the concrete
	 * example of i2c, we'd supply the algo struct, fwnode, etc.
	 */
	struct i2c_adapter *adap =3D i2c_adapter_register(data, ...);
}

xyz_remove()
{
	kfree(data);
	i2c_adapter_unregister();
}

The reference counting of i2c_adapter happens behind the scenes in the
subsystem code. We're hiding the implementation details from the driver as =
it
has no business knowing it - it always only needs a single reference.

This way you have a kfree() corresponding with the kmalloc() and an
unregister() corresponding with the register().

But sure, your example works fine too. My point is: getting to that state w=
ould
require more churn than allowing drivers to continue allocating i2c_adapter
struct themselves with struct device being moved out of it - making referen=
ce
counting of it work properly.

And I agree: doing the above would be even better but you'd need - for ever=
y
driver - to move the i2c_adapter struct out of driver data and make it a
pointer. That's in addition to providing new APIs and using them. I2C drive=
rs
are spread treewide. There's a reason why nobody attempted it for decades. =
I'm
proposing something a bit less complex: allow drivers to free i2c_adapter a=
t
unbind but make i2c core keep a private, reference-counted structure for as
long as it's needed.

> > > > I know there are a lot of places where this is done in the kernel b=
ut
> > > > let's not introduce new ones. This is a bad pattern.
> > >
> > > No, it's not. It's literally the standard way of doing this.
> > >
> > > > But even if you decided this is the way to go, I fail to see how it
> > > > would be easier than what I'm trying to do. You would have to modif=
y
> > > > *all* I2C bus drivers as opposed to only modifying those that acces=
s
> > > > the underlying struct device. Or am I missing something?
> > >
> > > Yes, you have to update the allocation and replace container_of() wit=
h
> > > dev_get_drvdata() but it's a straight-forward transformation that bri=
ngs
> > > the i2c subsystem more in line with the driver model (unlike whatever=
 it
> > > is you're trying to do).
> > >
> >
> > No, it's not that simple. The .release() callback of struct device embe=
dded
> > in struct i2c_adapter is assigned from the bus type and only calls comp=
lete()
> > (yeah, I too don't think it looks right, one would expect to see the as=
sociated
> > kfree() here, right?). It relies on the bus driver freeing the data in =
its
> > remove() path. That's why we wait until all references to said struct d=
evice
> > are dropped. After your proposed change, if your new release() lives in=
 the
> > driver module, it must not be removed until all the references are drop=
ped
> > - basically where we are now. If on the other hand, the release() callb=
ack's
> > functionality is moved into i2c-core, how would you handle the fact i2c=
_adapter
> > can be embedded in a larger driver data structure? Provide yet another =
callback
> > in i2c_adapter called from the device's .release()? Sure, can be done b=
ut I
> > doubt it's a better solution.
>
> You seem to be constructing some kind of straw man here. Obviously, the
> release function would free the memory allocated for the adapter struct.
>
> An adapter driver can free its driver data on unbind as core will
> guarantee that there are no further callbacks after the adapter has been
> deregistered.
>

Sure, but my point all along has been that - with struct device currently
embedded in struct i2c_adapter - that's not the case. Driver data *and*
i2c_adapter are tied together. You need a major rework in either case.

I'm frustrated because I'm spending time working on an actual solution. I'v=
e
explained what I'm doing and what the end result will look like based on wh=
at
works for GPIO (struct gpio_chip's lifetime is bound to device's "bound" st=
ate,
struct gpio_device is refcounted, I want to mirror it with i2c_adapter and
whatever we eventually call its refcounted counterpart - let's say:
i2c_bus_device). If you claim you have a better alternative - will you do t=
he
work to make it happen?

Bartosz

