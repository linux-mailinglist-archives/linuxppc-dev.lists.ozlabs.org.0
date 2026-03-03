Return-Path: <linuxppc-dev+bounces-17594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEahAwUFp2k7bgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:57:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5B1F3159
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:57:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQL6n2d4bz3bnr;
	Wed, 04 Mar 2026 02:57:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772553473;
	cv=none; b=bTByjmwHCaBv60j+Vxez5ZvHl37a3ChgiZOL3j+Ic6KyYwf3pNuDSEtbEDvytZ11IPaTyPRlybfJytdldRQhMT630PVF8dGj2CkX7NVSROr9rRhqt7Ho1SCz4zVrDs77NyR39LtNmMsWrFViHMXv8dckwExmFFlrXj1BPorQ4FZsrJfcOELJ26LIyWPsxkRVXP3h2gYxmq91EyBf5Ut8P5G/xytg8nI0R5ditmHibsQC4ix7cIymbcDmB5C0FnwPUbYTkuXE0Cq7xavcNCCY6jQCMO/lxSb9xWjCpgFwSTjRFSBC+dIltcwLD8j04oGE3tFajpuAqvxOX5N2kqFlVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772553473; c=relaxed/relaxed;
	bh=fknkIDPnX9yvUUxDQk3Uq4zMFR0+YqB9sxfzCCJ1ryE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrW7uRLEjPyuFAWADns4byoKGiDw+GgEv1w8EYeJM8otWvtLl5pNPwzS9gSGgfVtxJ6QS8DmWyvmD1aNGSwNEdD0DyCz/BXEhmm/zvV6RCR5akGhdshReF78Ro8sLv0eXf+LvYFnGjPPSELhsuyDHw+xxN/wOvQTi78SKNGgQydX4xw/xTsYRXK1rtJRt9FxbiZWtZYTeczFi3GfuochhjfY0nwIi8t4Xu4fJeMlP62tgxaHOGaoZ2mFeTWHDPX4B/BvESLmqL0XOY2eK0psn9ddQg2S4MO3uUM0PcXTe0GbL33YEAhWgw3SfVtPKelRj7ICXpLSPR/Nb7V+FdKRdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t7Gb1Ccm; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t7Gb1Ccm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQL6m3dssz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 02:57:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81C4E60053;
	Tue,  3 Mar 2026 15:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0863FC116C6;
	Tue,  3 Mar 2026 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772553470;
	bh=7wnmUVJYz31ztCiGKAzjwdnFCaEeyvoYoDHodVWWhOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7Gb1CcmG3mQHFd+prxFW6iEuOe+P6JnjIxvh6iepVeRugk7VrzgXF6XTaJhoe/Qs
	 S6yrYamuMMDh+xPCNlQ7kZi1h1LWQ3kzPZK2Ax6Rz5lDORwIJ9AZI/VIHEIqRk3eLa
	 P/m1lno3hmNdo24vovY1c/w1olKbkkHhoJdZ+Z+1P1CmPBfTa0tpQ+j69wb5XkoYBi
	 I2jmibQclRi+seToB5vI/R18HBWaeMj4d0Piao2pTO/gj7dFbO/Pl2oR9sgdaBcW6x
	 sZ74UOiOemSucZb0IEztzKBPw7XFvhGBi8yjGc8aIcoqLXJZCxpr5sItUOANMLmR4j
	 w1/j45YkWhccw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vxS83-000000004sw-0okG;
	Tue, 03 Mar 2026 16:57:47 +0100
Date: Tue, 3 Mar 2026 16:57:47 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aacE-27iaYneKCJi@hovoldconsulting.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com>
 <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
 <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com>
 <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 07E5B1F3159
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17594-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[johan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:wsa+renesas@sang-engineering.com,m:bartosz.golaszewski@oss.qualcomm.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:linux-media@vger.kernel.org,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,hovoldconsulting.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 12:03:19PM -0600, Bartosz Golaszewski wrote:
> On Fri, Feb 27, 2026 at 5:41 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Fri, Feb 27, 2026 at 04:42:09PM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Feb 27, 2026 at 11:06 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > > > It seems all that is needed is to decouple the struct i2c_adapter from
> > > > the driver data and have core manage the lifetime of the former using
> > > > the reference count of the embedded struct device.
> >
> > > This is a weird pattern you sometimes see where a driver allocates
> > > something and passes the ownership to the subsystem.
> >
> > It's not weird at all, this is the standard way to handle this. We have
> > these things called reference counts for a reason.
> >
> 
> I wouldn't say it's *the* standard way. There are at least several different
> ways driver subsystems handle resource ownership. And even so: the fact that
> something's done a lot does not make it automatically correct.

It's the way the driver model works.

> > > This often
> > > causes confusion among driver authors, who logically assume that if
> > > you allocate something, you are responsible for freeing it.Since this
> > > is C and not Rust (where such things are tracked by the compiler), I
> > > strongly believe we should strive to keep ownership consistent: the
> > > driver should free resources it allocated within the bounds of the
> > > lifetime of the device it controls. The subsystem should manage the
> > > data it allocated - in this case the i2c adapter struct device.
> >
> > Drivers are responsible for dropping *their* reference, it doesn't mean
> > that the resource is necessarily freed immediately as someone else may
> > be holding a reference. Anyone surprised by this should not be doing
> > kernel development.
> 
> I disagree. For some reason, you're defending a suboptimal programming
> interface. I'm all for reference counting but mixing reference-counted data
> with non-counted is simply not a good idea. An API should be easy to use and
> hard to misuse. Given the amount of issues, this approach is definitely easy
> to misuse.
> 
> I'm advocating for a hard split between the subsystem data (reference-counted)
> and driver data (living from probe() until remove()). A logical struct device
> managed entirely by the subsystem should live in a separate structure than
> driver data and be allocated - and freed - by the subsystem module.

It doesn't really matter what you think. You can't just go around
making up new subsystem specific rules at your whim. The linux driver
model uses reference counting and that's what developers expect to be
used.

> Let's put aside kernel code for a minute and work with an abstract C example,
> where the equivalent of what you're proposing would look like this:
> 
> struct bar {
> 	struct foo foo;
> 	...
> };
> 
> struct bar *bar = malloc(sizeof(*bar));
> 
> ret = foo_register(&bar->foo);
> 
> And the corresponding free() lives who knows where because foo_register()
> automagically introduces reference counting (nevermind the need to calculate
> where bar is in relations to foo).

No, that's not what I'm suggesting here, but it would be compatible with
the driver model (ever heard of struct device which works exactly like
this?).

> I strongly believe that this makes more sense:
> 
> struct bar {
> 	...
> };
> 
> struct bar *bar = malloc();
> 
> struct foo *foo = foo_register(bar);
> 
> // foo is reference counted and allocated in the provider of foo_register()
> 
> foo_put(foo);
> free(bar);
> 
> The equivalent of which is moving struct device out of struct i2c_adapter.

No, it's not.

> In fact: I would love to see i2c_adapter become a truly reference-counted
> object detached from driver data but due to it being embedded in every bus
> driver data structure it realistically won't happen.

And this is what I've been suggesting all along, separating the driver
data and making the adapter reference counted.

The idiomatic way to handle this is:

	xyz_probe()
	{
		adap = i2c_adapter_alloc();
		// initialise driver data, store pointer in adap
		i2c_adapter_register(adap);
	}

	xyz_remove()
	{
		i2c_adapter_deregister(adap);
		i2c_adapter_put(adap);
	}

Exactly where the driver data is stored is secondary, it could be memory
allocated by core or by the driver.

But the adapter is reference counted and kept around until all users are
gone.

> > > I know there are a lot of places where this is done in the kernel but
> > > let's not introduce new ones. This is a bad pattern.
> >
> > No, it's not. It's literally the standard way of doing this.
> >
> > > But even if you decided this is the way to go, I fail to see how it
> > > would be easier than what I'm trying to do. You would have to modify
> > > *all* I2C bus drivers as opposed to only modifying those that access
> > > the underlying struct device. Or am I missing something?
> >
> > Yes, you have to update the allocation and replace container_of() with
> > dev_get_drvdata() but it's a straight-forward transformation that brings
> > the i2c subsystem more in line with the driver model (unlike whatever it
> > is you're trying to do).
> >
> 
> No, it's not that simple. The .release() callback of struct device embedded
> in struct i2c_adapter is assigned from the bus type and only calls complete()
> (yeah, I too don't think it looks right, one would expect to see the associated
> kfree() here, right?). It relies on the bus driver freeing the data in its
> remove() path. That's why we wait until all references to said struct device
> are dropped. After your proposed change, if your new release() lives in the
> driver module, it must not be removed until all the references are dropped
> - basically where we are now. If on the other hand, the release() callback's
> functionality is moved into i2c-core, how would you handle the fact i2c_adapter
> can be embedded in a larger driver data structure? Provide yet another callback
> in i2c_adapter called from the device's .release()? Sure, can be done but I
> doubt it's a better solution.

You seem to be constructing some kind of straw man here. Obviously, the
release function would free the memory allocated for the adapter struct.

An adapter driver can free its driver data on unbind as core will
guarantee that there are no further callbacks after the adapter has been
deregistered.

Johan

