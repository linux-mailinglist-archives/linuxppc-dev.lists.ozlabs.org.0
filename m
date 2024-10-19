Return-Path: <linuxppc-dev+bounces-2419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4739A4B2C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2024 06:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVpDz0Z99z30PD;
	Sat, 19 Oct 2024 15:17:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729311427;
	cv=none; b=geTeWXixa+KEUCjE/+RmWGLc4l6daOPcEaflsuFvi06W/r+R5p9FqgMpO8FhRuj9m5zxL9MZKXSlwVEagaCqMFcakGBW6HgTL9THYzSZd34Jkb8LhJJXVPhV+1REB+NgHAw1QcIwQZ6VpGq325oRdMTG7w+kzHqiIzeoVU73cRBvS0p9JV+j6bfJpWBnLdMZw5OChz4IbdsrYeBf3uoQaizbOHI/u+OODu2KVqH9QGT8Bif7JLACMfKYnTVX4XnhxSNMAI7HhYeZCkzjlr2jojz3Je74keILQEaR4aaLKreLnpfSnkJ1lBpZDnpsKZRAwT0AfKdEEUCS949BEam+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729311427; c=relaxed/relaxed;
	bh=K0VfTJEjJnsRHN+/435BXLvwgNk09EuZPOANkRBxmhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q613hNjwI79JQIs2C/uFeVGpruEQWydBJiXaDPuG8LGwsIEj5zdmfbSd6nTcMkZEYg+/ZmOaKyWpVT/RYeCSDC4CLxtI2VWUGAmYSkadAQlB9sW4q8nec7BpbZrkMIowbDbL59wsBq6dHZfz9bw096f+23jEclZA1yPg+3brMb1WqmErzfA6aXdyvI4ibDP2vECSDNtRPCReRyK2wZNuLFpTunrHP3iZV09Gua56GN1kafggjC5ktdZ/T2EeEWsvSTC2W+MWPqx9l7HVqsZFxl7ycPxvl8irijrtJ30nJx/yPlwiOQbA+pYm3vazpNVFvLBCiwMVwR+v3RbHGFhMXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVpDx0gRkz2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 15:17:03 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 49J4DXwK031623;
	Fri, 18 Oct 2024 23:13:33 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 49J4DTL3031612;
	Fri, 18 Oct 2024 23:13:29 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 18 Oct 2024 23:13:29 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, maddy@linux.ibm.com, arnd@arndb.de,
        chentao@kylinos.cn, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] powerpc/spufs: Replace snprintf() with the safer scnprintf() variant
Message-ID: <20241019041329.GL29862@gate.crashing.org>
References: <ZxIcI0QRFGZLCNRl@mail.google.com> <20241018153843.GJ29862@gate.crashing.org> <ZxL0U6bziCxhySUO@mail.google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxL0U6bziCxhySUO@mail.google.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi!

On Sat, Oct 19, 2024 at 12:50:43PM +1300, Paulo Miguel Almeida wrote:
> On Fri, Oct 18, 2024 at 10:38:43AM -0500, Segher Boessenkool wrote:
> > On Fri, Oct 18, 2024 at 09:28:19PM +1300, Paulo Miguel Almeida wrote:
> > > The C99 standard specifies that {v}snprintf() returns the length of the
> > > data that *would have been* written if there were enough space.
> > 
> > Not including the trailing zero byte, and it can also return negative if
> > there was an encoding error.  Yes.
> > 
> > Not that this matters at all for your patch, so why mention it?
> > 
> > 
> > Segher
> 
> Thanks for taking the time to review this patch.
> 
> Is the objection with the change in itself or just the commit message?

Mostly the commit message.  But because it is confusing, it makes the
patch itself uncertain as well.

The patch is probably fine fwiw, as far as I can see.  But the commit
message is not. And the commit message is by far the most important
part of any patch!

> If it's the later, I'm happy to tweak it to what you would like see.

It is not about what I want to see.  It is about what you want to say
to justify the patch!

In this case, just leave out all the irrelevant stuff, just say why you
think scnprintf is better than what you replace?

Everythihng you did say is about why what you are removing was good.
Not a great patch justification :-)


Segher

