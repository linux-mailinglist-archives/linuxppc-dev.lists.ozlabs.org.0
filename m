Return-Path: <linuxppc-dev+bounces-62-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C221D9507C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 16:34:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjv5s4c3zz2y66;
	Wed, 14 Aug 2024 00:34:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=kolla.no
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kolla.no (client-ip=217.144.76.212; helo=melduny.fyrkat.no; envelope-from=linux-ppc@kolla.no; receiver=lists.ozlabs.org)
X-Greylist: delayed 57673 seconds by postgrey-1.37 at boromir; Wed, 14 Aug 2024 00:34:09 AEST
Received: from melduny.fyrkat.no (melduny.fyrkat.no [217.144.76.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wjv5s2RdBz2xpp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 00:34:07 +1000 (AEST)
Received: by melduny.fyrkat.no (Postfix) with ESMTPSA id 6924C7B5F;
	Tue, 13 Aug 2024 14:34:00 +0000 (UTC)
Date: Tue, 13 Aug 2024 16:33:59 +0200 (CEST)
From: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-ppc@kolla.no>
To: Michael Ellerman <mpe@ellerman.id.au>
cc: Niklas Cassel <cassel@kernel.org>, 
    =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-ppc@kolla.no>, 
    linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
    linux-ide@vger.kernel.org, 
    =?UTF-8?Q?Jon=C3=A1=C5=A1_Vidra?= <vidra@ufal.mff.cuni.cz>, 
    Christoph Hellwig <hch@lst.de>, linux@roeck-us.net
Subject: Re: Since 6.10 - kernel oops/panics on G4 macmini due to change in
 drivers/ata/pata_macio.c
In-Reply-To: <87sev81u3f.fsf@mail.lhotse>
Message-ID: <972fdf28-df68-682c-c5f3-2df33a0ca578@kolla.no>
References: <62d248bb-e97a-25d2-bcf2-9160c518cae5@kolla.no> <3b6441b8-06e6-45da-9e55-f92f2c86933e@ufal.mff.cuni.cz> <Zrstcei9WN9sRfdX@x1-carbon.wireless.wdc> <87sev81u3f.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 13 Aug 2024, Michael Ellerman wrote:

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

I applied your patch (to 6.10.4 sources) and built a kernel, and did some stress
testing (tarring adnd untarring large archives) and so far it looks good.


Thanks! :)


-- kolla

