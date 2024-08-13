Return-Path: <linuxppc-dev+bounces-63-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F7950853
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 16:59:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eH410bYa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjvgR5S9Vz2xs0;
	Wed, 14 Aug 2024 00:59:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eH410bYa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjvgR2qdQz2x9W
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 00:59:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F39F8CE13DF;
	Tue, 13 Aug 2024 14:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2948BC4AF09;
	Tue, 13 Aug 2024 14:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723561184;
	bh=qSfuUarH+bTINxI+kIHMwUvIA0drlUi4ImBMCpFBLUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eH410bYaPNBZz5UB7LoYId/0HGq6u6pa5CK+k4sL4pHLBSi8JgCU+dMQWzS6mYSTh
	 e2S5zxVPMclRjcZ19Msj58Zqe0wP0mo+5I86jGYfgmyr1vXRP1/z4bUddxJnKCP+wu
	 b5Ug8gLtA2cfMUCzyjD6jWWEN+vhayPCu8luW2u/pcI4wH9F2GK4DXGZp9Eqs5FQO4
	 hH1x853y/aMAcmy4wTC5VI4zbRYBslxRR+QFCdp5w3KGsS3ogn2cZmnPKwNS0nuPvP
	 4RMMpvca6Zr+eHG2F2b4Ecq94uJ4GkLsrY0n4TwOEjcRv658OmoRBxZFUT02j+Fqeb
	 LrnxNUTcieJlw==
Date: Tue, 13 Aug 2024 16:59:39 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: =?utf-8?B?S29sYmrDuHJu?= Barmen <linux-ppc@kolla.no>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	=?utf-8?B?Sm9uw6HFoQ==?= Vidra <vidra@ufal.mff.cuni.cz>,
	Christoph Hellwig <hch@lst.de>, linux@roeck-us.net
Subject: Re: Since 6.10 - kernel oops/panics on G4 macmini due to change in
 drivers/ata/pata_macio.c
Message-ID: <Zrt028rSVT5hVPbU@ryzen.lan>
References: <62d248bb-e97a-25d2-bcf2-9160c518cae5@kolla.no>
 <3b6441b8-06e6-45da-9e55-f92f2c86933e@ufal.mff.cuni.cz>
 <Zrstcei9WN9sRfdX@x1-carbon.wireless.wdc>
 <87sev81u3f.fsf@mail.lhotse>
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
In-Reply-To: <87sev81u3f.fsf@mail.lhotse>

Hello Michael,

On Tue, Aug 13, 2024 at 10:32:36PM +1000, Michael Ellerman wrote:
> Niklas Cassel <cassel@kernel.org> writes:
> > Hello Jonáš, Kolbjørn,
> >
> > thank you for the report.
> >
> > On Tue, Aug 13, 2024 at 07:49:34AM +0200, Jonáš Vidra wrote:
> >> On Tue 13. Aug 2024 0:32:37 CEST, Kolbjørn Barmen wrote:
> >> > Ever since 6.10, my macmini G4 behaved unstable when dealing with lots of
> >> > I/O activity, such as sync'ing of Gentoo portage tree, unpacking kernel
> >> > source tarball, building large software packages (or kernel) etc.
> >> > 
> >> > After a bit of testing, and patient kernel rebuilding (while crashing) I
> >> > found the cuplit to be this commit/change
> >> > 
> >> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/?id=09fe2bfa6b83f865126ce3964744863f69a4a030
> >> 
> >> I've been able to reproduce this pata_macio bug on a desktop PowerMac G4
> >> with the 6.10.3 kernel version. Reverting the linked change
> >> ("ata: pata_macio: Fix max_segment_size with PAGE_SIZE == 64K") makes
> >> the errors go away.
> >
> > Michael, as the author of the this commit, could you please look into
> > this issue?
> 
> I can. My commit was really just working around the warning in the SCSI
> core which appeared after afd53a3d8528, it was supposed to just fix the
> warning without changing behaviour. Though obviously it did for 4KB
> PAGE_SIZE kernels.
> 
> I don't have easy access to my mac-mini so it would be helpful if you
> can test changes Jonáš and/or Kolbjørn.
> 
> > We could revert your patch, which appears to work for some users,
> > but that would again break setups with PAGE_SIZE == 64K.
> > (I assume that Jonáš and Kolbjørn are not building with PAGE_SIZE == 64K.)
> 
> Yes they are using 4K, it says so in the oops.
> 
> >> ------------[ cut here ]------------
> >> kernel BUG at drivers/ata/pata_macio.c:544!
> >
> > https://github.com/torvalds/linux/blob/v6.11-rc3/drivers/ata/pata_macio.c#L544
> >
> > It seems that the
> > while (sg_len) loop does not play nice with the new .max_segment_size.
> 
> Right, but only for 4KB kernels for some reason. Is there some limit
> elsewhere that prevents the bug tripping on 64KB kernels, or is it just
> luck that no one has hit it?

Have your tried running fio (flexible I/O tester), with reads with a very
large block sizes?

I would be surprised if it isn't possible to trigger the same bug with
64K page size.

max segment size = 64K
MAX_DCMDS = 256
256 * 64K = 16 MiB
What happens if you run fio with a 16 MiB blocksize?

Something like:
$ sudo fio --name=test --filename=/dev/sdX --direct=1 --runtime=60 --ioengine=io_uring --rw=read --iodepth=4 --bs=16M


Kind regards,
Niklas

