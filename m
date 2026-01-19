Return-Path: <linuxppc-dev+bounces-15981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E54D3A6E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 12:32:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvpGc0M38z2xjb;
	Mon, 19 Jan 2026 22:32:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768822359;
	cv=none; b=HaaFUOwVnxoNHEQpVV/jPOg+DYg/lqJMcs0B4ZSirlM7bkn3EV49cGKMdrhSsqSGT7WIpxm3Lb6L9ce7JmIc8IiiT8x7N0iVKL02uWGukaSy28za/vz5cRAxDhwQVhOyVyDi23wluwVG9il2Z7BmKgmehUohYKxTcQsEWlJPwJr/Afy+XlNRxMH6VkfI5jHBDw0Gam5+93INqpRvxtYNPe8EUlWe3h46L9cjjL8Pbawb4IBXPJA1Lv4fX52Moson+3/vbjaxYXVo1nZlsSb/dxHyZG8z+1TczjKltPgsQPL1yIpHrxgLhnTmyO+itQzxs3wdXUjJw4UBtSX+uMSMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768822359; c=relaxed/relaxed;
	bh=EdHYfSg21ACmJPB3bps9vYjXNLGEb4DLj5JUnCHrhG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdkOFjq0vGcZIclCqFV5o0zQZ8+fT+tbMvQa4iuljBmnFgoUBytV5p5yOGGsG4xUG1YAgBtjvSgNAkcOCeyvatK+J9S7R1ko/yIS6WU/szryq/Ecs2OS/kxYudbhTiZ0y0Jnie41U36qQ3RBbNUoYvDdUX/D8IJmik9Gp0TJld5YeZUBJvDygmqjgIbX9nqdVTpOujRuqGnaC2CRJQFrkdCeSoSTuvHMYXg1KN5hDEzPZagqoGImTPcvqGRxgl4Kv9DGXs8iRpAqGI89z8jOBOrufscRiivH0VMmGWz623NZLI4JbQla85+r8d8sU9iKNEPmBbZVIWntWI7/ZROUfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QklYNyBi; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QklYNyBi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvpGb1BGrz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 22:32:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DAD236014E;
	Mon, 19 Jan 2026 11:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EED2C19423;
	Mon, 19 Jan 2026 11:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768822356;
	bh=DvzlZA0wArsQBqRk/g9C45k6eQwlXTf9pRhS6v/hblE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QklYNyBiLyNbVDv5pAYHYJyk0bj7HuLxm4RdnPQlB7NM/byxMQHr6dcjpJgEUyaSi
	 vDbPmhnDe5joODlAWMctXZ6yukk52rtxus9ROOKC8+uW6Zz9rkB3U1FCbKxMAd1SLO
	 tcMS3f15BrZcp/hfGt2YzRik01eHwcVJB5ksNBnn5MI/YOz/rjlbx1xjSQmriXDJCz
	 mCC6hUD3Hbhqy5DJMwqrHBUS74BZ0nrN+jXvOj735XhdwGzxxP2lQjsRPCVP+nqvgb
	 F7/ZxhldSHFJFDx7fDy/LzwQHUbtvzJrXkvbN6+q6bXDCTsh/YCP+EhYBRPFlLXlPa
	 bc4SSKgYPThhA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vhnUi-000000001IZ-3bew;
	Mon, 19 Jan 2026 12:32:29 +0100
Date: Mon, 19 Jan 2026 12:32:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aW4WTP8ZJXIe4Mg1@hovoldconsulting.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aUql_tZisfH8E1bq@hovoldconsulting.com>
 <CAMRc=MeHL5=s=ciUjHGw_poKpeVMWVi_2LBDFY_ugvXBaaE0vA@mail.gmail.com>
 <aW4PajoKqmyjkciY@hovoldconsulting.com>
 <CAMRc=McfiKGT9RSJqZtCtHHHjwDLGPkNwA4Kot9-9frfpCGVmQ@mail.gmail.com>
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
In-Reply-To: <CAMRc=McfiKGT9RSJqZtCtHHHjwDLGPkNwA4Kot9-9frfpCGVmQ@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 19, 2026 at 12:17:49PM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 19, 2026 at 12:03 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Dec 23, 2025 at 04:11:08PM +0100, Bartosz Golaszewski wrote:
> > > On Tue, Dec 23, 2025 at 3:24 PM Johan Hovold <johan@kernel.org> wrote:
> > > >
> > > > On Tue, Dec 23, 2025 at 11:02:22AM +0100, Bartosz Golaszewski wrote:
> > > > > It's been another year of discussing the object life-time problems at
> > > > > conferences. I2C is one of the offenders and its problems are more
> > > > > complex than those of some other subsystems. It seems the revocable[1]
> > > > > API may make its way into the kernel this year but even with it in
> > > > > place, I2C won't be able to use it as there's currently nothing to
> > > > > *revoke*. The struct device is embedded within the i2c_adapter struct
> > > > > whose lifetime is tied to the provider device being bound to its driver.
> > > > >
> > > > > Fixing this won't be fast and easy but nothing's going to happen if we
> > > > > don't start chipping away at it. The ultimate goal in order to be able
> > > > > to use an SRCU-based solution (revocable or otherwise) is to convert the
> > > > > embedded struct device in struct i2c_adapter into an __rcu pointer that
> > > > > can be *revoked*. To that end we need to hide all dereferences of
> > > > > adap->dev in drivers.
> > > >
> > > > No, this is not the way to do it. You start with designing and showing
> > > > what the end result will look like *before* you start rewriting world
> > > > like you are doing here.
> > >
> > > The paragraph you're commenting under explains exactly what I propose
> > > to do: move struct device out of struct i2c_adapter and protect the
> > > pointer storing its address with SRCU. This is a well-known design
> > > that's being generalized to a common "revocable" API which will
> > > possibly be available upstream by the time we're ready to use it.
> >
> > Revocable, as presented in plumbers, is not going upstream.
> >
> 
> Oh really? :)
> 
> https://lore.kernel.org/all/2026011607-canister-catalyst-9fdd@gregkh/

Looks like a bad call as Laurent immediately pointed out:

	https://lore.kernel.org/all/20260116160454.GN30544@pendragon.ideasonboard.com/#t

Let's see where that goes.

> > > You know I can't possibly *show* the end result in a single series
> > > because - as the paragraph before explains - we need to first hide all
> > > direct dereferences of struct device in struct i2c_adapter behind
> > > dedicated interfaces so that we when do the conversion, it'll affect
> > > only a limited number of places. It can't realistically be done at
> > > once.
> >
> > You can post an RFC converting one driver with a proper description of
> > the problem you're trying to solve.
> >
> 
> It's not a one-driver problem. It's a subsystem-wide problem requiring
> a subsystem-wide solution. Wolfram explained it really well in his
> summary, I'm not going to repeat it here.

Of course it is, but you still don't have to rewrite world to post an
RFC where the problem can be discussed. A single driver is more than
enough.

> I also don't agree that i2c-specific helpers make code harder to read.
> Is device_set_node() harder to read than
> 
> dev->fwnode = fwnode;
> dev->of_node = to_of_node(fwnode);
> 
> ?
> 
> Even if you answer yes - it at least helps hide the implementation
> details of the OF layer where fwnode-level is preferred. We do it all
> the time in the kernel. This kind of helpers allows easier transitions
> when some implementation detail needs to change - as is the case here.

Magic helpers that hide what's really going on hurts readability. So
introducing them when they are not really needed should be avoided.

(But yeah, we have a problem with developers introducing esoteric
helpers while seemingly thinking all that matters is LOC count, and too
few people raising their voice against bad ideas.)

Johan

