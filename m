Return-Path: <linuxppc-dev+bounces-15615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE26D17E03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 11:10:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr4k847pZz2xWP;
	Tue, 13 Jan 2026 21:10:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768299008;
	cv=none; b=CbRhjxTmQOZzB801HVY9cF9PTBUnLzARRVRYk4jQeb8xgC+53M3W//RaVQxunPnObM+/W6NLTPKjtUKfBJfaTtY1XE4xwZ1TsT5xDf1KFC62A7wWl6Hf0I+t45rGeZ8Xz1jFj6AkBrsTizEd0T49W9v0Z9YrnyYfxUhbbuDi8HthUkk1UbuzHhXbelZ4DUwSbsT+NsKFoXVqTz9Cqs78BgQg4kpN/pDjkZenglStKuNpjzdaLSxTjMVICxmYIva4E9B5wOibu0wFuQGgbAGbwpQeHiyc68MjP0rCwL9lKUSvZvGUjE1kZOSDtS6reWSjkvuzWlobT8bkDXP0JcZIig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768299008; c=relaxed/relaxed;
	bh=YwgYABMUC2TvlP+jRUvO7d92limdvKOaBOk3hHKu1Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxvdUhDTHJMFd3aDd/mx8YeKlDdvbhakrW8AnmFHjEyWs8bOiHQ+z4DEL9O3bHc3cIz5Nvl5A2iX8+c1OO+5RxSmPoqIU5r7cW4EQA/2rmYn+XObh6atkDZi6wGhxJgyzT9ciVTzSB/vUbGhk3Xn5WYb+5r+0QDir0S5bBmWO33oh4+9+xC24CGg5Zy5tzFpevRwcHzYap5hpCjyYzEN+aYLHdYFMv6Np776AoJjl/P22EHSiDPsUQG4B1MKggwcErIfukQ4T9Ucq7irqL3ZIvkMea+wo5cvWuLcdCPb72BZrjWLSEcIaSTsrCLU+nVXLkZH6t2lLcGjJbS7rKqsCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=InDqdP/y; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=InDqdP/y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 397 seconds by postgrey-1.37 at boromir; Tue, 13 Jan 2026 21:10:02 AEDT
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr4k24zr0z2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 21:10:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YwgY
	ABMUC2TvlP+jRUvO7d92limdvKOaBOk3hHKu1Ho=; b=InDqdP/yV0uKcw4qWt90
	GgKu/Zem8CaPzrKy7P3o5LDdvi4II9brMZQCjCafrEDy2yGt4/P4m4hbEd2TX71a
	pHTSM1tbS4cfhrIsENI/JynCBuLOT8G/OoQyKdjvN/eywkBidnxr8j7howQwISq4
	A21WgAzIUN2ydHMBddIu55ZkFnAwL591j1EDXGC3TppcCQM/Tsu76K4LcPKjJh4G
	bXrnki9aTIHPR7OgISJt0W3gMKwOw7b15rV5E42mOtFyHUkMRpiOuieMO38rVMfZ
	pEZe6QYyoyPpVTOHnN5d3k1w46SpuaPheVVxniG0Rt4S06PyiY3QqExmS6DeJyxu
	XA==
Received: (qmail 1631988 invoked from network); 13 Jan 2026 11:03:16 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 11:03:16 +0100
X-UD-Smtp-Session: l3s3148p1@sbW2GUJIiN4ujnvx
Date: Tue, 13 Jan 2026 11:03:16 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
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
	linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Big I2C core changes coming up this year (was: Re: [PATCH 00/12]
 i2c: add and start using i2c_adapter-specific printk helpers
Message-ID: <aWYYZEPX-_1GfQtL@ninjato>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
 <aUql_tZisfH8E1bq@hovoldconsulting.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUql_tZisfH8E1bq@hovoldconsulting.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Johan, (and all future readers I have pointed to this mail)

> No, this is not the way to do it. You start with designing and showing
> what the end result will look like *before* you start rewriting world
> like you are doing here.

In general, this is correct. It does not apply here, though. I will
describe it in detail, so I can also point other people to this mail who
wonder about quite some intrusive changes to I2C core this year.

> We should not be making driver code less readable just to address some
> really niche corner cases like hot pluggable i2c controllers.

It is not a niche-case for hot-plugging. Hot-plugging (which still
should be avoided for I2C) just makes a subsystem-inherent lifecycle
problem more obvious. All of Bart's patch series basically prepare to
tackle this comment from the I2C core:

1805         /* wait until all references to the device are gone
1806          *
1807          * FIXME: This is old code and should ideally be replaced by an
1808          * alternative which results in decoupling the lifetime of the struct
1809          * device from the i2c_adapter, like spi or netdev do. Any solution
1810          * should be thoroughly tested with DEBUG_KOBJECT_RELEASE enabled!
1811          */
1812         init_completion(&adap->dev_released);
1813         device_unregister(&adap->dev);
1814         wait_for_completion(&adap->dev_released);

This has been in the I2C core since switching to the driver model and
the underlying problem applies to *all* i2c adapters. Simply unbind an
I2C controller while you still have a reference to its i2c-dev
counterpart and you are right in the problem space.

The problem is known for decades(!) and nobody dared to touch it, so
far. Even worse, the above pattern is not only present in I2C but also
other subsystems. Bart and I have been talking about potential solutions
for three years now. Bart brought in SRCU as a generic solution and at a
Plumbers 2024 session with many experienced maintainers present, it was
decided that this path is worth exploring. Greg suggested to try SRCU
with GPIO and I2C subsystems, and if this works well, we can try to
abstract it into something useful for other canidates as well. Now,
recently, the 'revocable' patch series was introduced which might be
helpful in our case. I am *extremly* thankful that Bartosz took the
initiative to prepare the I2C core for the SRCU approach so we can
research 'revocable'. I currently have zero time for implementing any of
this. At least, from now on, I can reserve time for discussing, testing,
reviewing patches.

It is also perfectly okay to work incrementally here, in my book. It is
such an intrusive change that we need to touch a lot of drivers in any
case. Yet, with the I2C core being a moving target, all the I2C drivers,
the 'revocable' patch series, and Linux in general, I think requesting a
fully complete patch series now is neither efficient nor maintainable.

Bartosz and I do have a plan. We are happy to discuss it with other
interested people, of course. Still, despite all our efforts it might be
a bumpy ride. Because it is such a crucial and deep-inside change to the
subsystem core. This is part of development, though. If something
breaks, we will fix or revert. The alternative is stagnation which I
don't want. The above code was fine back in the days but now we have
better mechanisms to handle lifecycle issues. And I really do not want
Linux to have lifecycle issues. Especially not ones we *know of*.

And who knows, maybe it is not a bumpy ride after all...

> But in any case, don't get ahead of things by posting changes that we
> most likely don't want in the end anyway.

We want helpers accessing that specific 'struct device', so we have
central place to implement access to a protected version of it.

Happy hacking,

   Wolfram


