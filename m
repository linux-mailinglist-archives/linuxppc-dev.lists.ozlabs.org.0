Return-Path: <linuxppc-dev+bounces-86-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C748B951C95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 16:06:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g2QHk+DR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkVRs4ZBVz2yV3;
	Thu, 15 Aug 2024 00:06:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g2QHk+DR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkVRs2jxKz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 00:06:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 29180CE193C;
	Wed, 14 Aug 2024 14:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66242C116B1;
	Wed, 14 Aug 2024 14:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723644407;
	bh=AGZAKlecmLZEHhHdoIyuP0KBetIGYeA3xA2HQiMjzTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g2QHk+DRt80uEPNhETIusk1gqul5VFfpYKmiwNTv/2DSjRyOqW8VwzEYXb7fKYxF9
	 JZ+KIvwRoiy7xp6WFksJqrGJndtiHUHHytT09pVvb9yFsvg8xkDnt4ta+V6mVmuD1l
	 yBTs/sm9UMaP7ODoPV7JkCEOf7TepnO0APbnd7dVCp4EUpGHfPIaIU1RLUtbwqlgnt
	 ohDdOzHsLGc6H1ffnQhwkaSGg5nwoWpIWUSXgeTwW0nkMK5yBcc7JljkQB3LskKBLa
	 IVnjIu2fGvxOFWXKwDuvfq1b99Vte6IGI0xfAufOXfJkEYry93JSae+1iFEO2/QaA9
	 Ck5+tS4eyQLLA==
Date: Wed, 14 Aug 2024 16:06:42 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: =?utf-8?B?S29sYmrDuHJu?= Barmen <linux-ppc@kolla.no>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	=?utf-8?B?Sm9uw6HFoQ==?= Vidra <vidra@ufal.mff.cuni.cz>,
	Christoph Hellwig <hch@lst.de>, linux@roeck-us.net
Subject: Re: Since 6.10 - kernel oops/panics on G4 macmini due to change in
 drivers/ata/pata_macio.c
Message-ID: <Zry58qB80V80uS38@ryzen.lan>
References: <62d248bb-e97a-25d2-bcf2-9160c518cae5@kolla.no>
 <3b6441b8-06e6-45da-9e55-f92f2c86933e@ufal.mff.cuni.cz>
 <Zrstcei9WN9sRfdX@x1-carbon.wireless.wdc>
 <87sev81u3f.fsf@mail.lhotse>
 <Zrt028rSVT5hVPbU@ryzen.lan>
 <87jzgj1ejc.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jzgj1ejc.fsf@mail.lhotse>

On Wed, Aug 14, 2024 at 10:20:55PM +1000, Michael Ellerman wrote:
> Niklas Cassel <cassel@kernel.org> writes:
> > On Tue, Aug 13, 2024 at 10:32:36PM +1000, Michael Ellerman wrote:
> >> Niklas Cassel <cassel@kernel.org> writes:
> >> > On Tue, Aug 13, 2024 at 07:49:34AM +0200, Jonáš Vidra wrote:
> ...
> >> >> ------------[ cut here ]------------
> >> >> kernel BUG at drivers/ata/pata_macio.c:544!
> >> >
> >> > https://github.com/torvalds/linux/blob/v6.11-rc3/drivers/ata/pata_macio.c#L544
> >> >
> >> > It seems that the
> >> > while (sg_len) loop does not play nice with the new .max_segment_size.
> >> 
> >> Right, but only for 4KB kernels for some reason. Is there some limit
> >> elsewhere that prevents the bug tripping on 64KB kernels, or is it just
> >> luck that no one has hit it?
> >
> > Have your tried running fio (flexible I/O tester), with reads with a very
> > large block sizes?
> >
> > I would be surprised if it isn't possible to trigger the same bug with
> > 64K page size.
> >
> > max segment size = 64K
> > MAX_DCMDS = 256
> > 256 * 64K = 16 MiB
> > What happens if you run fio with a 16 MiB blocksize?
> >
> > Something like:
> > $ sudo fio --name=test --filename=/dev/sdX --direct=1 --runtime=60 --ioengine=io_uring --rw=read --iodepth=4 --bs=16M
> 
> Nothing interesting happens, fio succeeds.
> 
> The largest request that comes into pata_macio_qc_prep() is 1280KB,
> which results in 40 DMA list entries.
> 
> I tried with a larger block size but it doesn't change anything. I guess
> there's some limit somewhere else in the stack?
> 
> That was testing on qemu, but I don't think it should matter?
> 
> I guess there's no way to run the fio test against a file, ie. without a
> raw partition? My real G5 doesn't have any spare disks/partitions in it.


You can definitely run fio against a file.

e.g.
$ dd if=/dev/random of=/tmp/my_file bs=1M count=1024

$ sudo fio --name=test --filename=/tmp/my_file --direct=1 --runtime=60 --ioengine=io_uring --rw=read --iodepth=4 --bs=16M


Perhaps try with 32M block size, so that it is larger than
max segment size = 64K
MAX_DCMDS = 256
256 * 64K = 16 MiB

Perhaps also try with and without --direct.
It could be interesting to use the page cache if you do --rw=readwrite
that might possibly result in larger bios.


Kind regards,
Niklas

