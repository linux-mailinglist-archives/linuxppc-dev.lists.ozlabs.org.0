Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B00538C0DB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 09:43:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmdr438hbz3bvF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 17:43:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=hu+Rh4Hf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=hu+Rh4Hf; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmdqc2dCBz301k
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 17:42:34 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 493D761163;
 Fri, 21 May 2021 07:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621582951;
 bh=cnSCVJ7/n3My2yNLmHEPhkdhOVoAxhx7WZMlAs//3PA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hu+Rh4Hf52BJ4jFmOSPsfQxgKn3SMltfq6bu3pu6JJXJAonQZFaKt6RWkAEotk3yB
 HPDhmwRSkaC6rmeSoQKGv89CmYJdQ7O0gvnIVQRkw4Y3kUwNcnPtr9VRWlx0RWUbMJ
 EMtB2LF/XHn3wJtnaiV+QhzKvTBu+xzBeT7Ioibs=
Date: Fri, 21 May 2021 09:42:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/16] Rid W=1 warnings from Char
Message-ID: <YKdkZdvN+uu6lu0g@kroah.com>
References: <20210520121347.3467794-1-lee.jones@linaro.org>
 <CAK8P3a0VujuG8eU_CEVSvzbk4nAJz8fStedM5eMUrLAr9EJxDQ@mail.gmail.com>
 <20210521072236.GX2549456@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521072236.GX2549456@dell>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, David Airlie <airlied@linux.ie>,
 Clemens Ladisch <clemens@ladisch.de>,
 "C. Scott Ananian" <cananian@alumni.princeton.edu>,
 Paul Mackerras <paulus@samba.org>, Kylene Hall <kjhall@us.ibm.com>,
 Jerome Glisse <j.glisse@gmail.com>, Peter Huewe <peterhuewe@gmx.de>,
 Michael Neuling <mikey@neuling.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Dave Safford <safford@watson.ibm.com>, Harald Welte <laforge@gnumonks.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kanoj Sarcar <kanoj@sgi.com>,
 Bob Picco <robert.picco@hp.com>, Arnd Bergmann <arnd@arndb.de>,
 Thirupathaiah Annapureddy <thiruan@microsoft.com>,
 "cs.c" <support.linux@omnikey.com>, Lijun Pan <ljp@linux.ibm.com>,
 Reiner Sailer <sailer@watson.ibm.com>, Matt Mackall <mpm@selenic.com>,
 van Doorn <leendert@watson.ibm.com>, Theodore Ts'o <tytso@mit.edu>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Fulghum <paulkf@microgate.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 21, 2021 at 08:22:36AM +0100, Lee Jones wrote:
> On Thu, 20 May 2021, Arnd Bergmann wrote:
> 
> > On Thu, May 20, 2021 at 2:13 PM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > This set is part of a larger effort attempting to clean-up W=1
> > > kernel builds, which are currently overwhelmingly riddled with
> > > niggly little warnings.
> > >
> > > Lee Jones (16):
> > >   char: pcmcia: cm4000_cs: Remove unused variable 'tmp'
> > >   char: pcmcia: cm4040_cs: Remove unused variable 'uc'
> > >   char: random: Include header containing our prototypes
> > >   char: pcmcia: synclink_cs: Fix a bunch of kernel-doc issues
> > >   char: pcmcia: synclink_cs: Fix a bunch of kernel-doc issues
> > >   char: applicom: Remove 3 unused variables 'ret' and 2 instances of
> > >     'byte_reset_it'
> > >   char: tpm: tpm1-cmd: Fix a couple of misnamed functions
> > >   char: tpm: tpm_ftpm_tee: Fix a couple of kernel-doc misdemeanours
> > >   char: agp: backend: Demote some non-conformant kernel-doc headers
> > >   char: agp: frontend: Include header file containing our prototypes
> > >   char: agp: via-agp: Remove unused variable 'current_size'
> > >   char: hpet: Remove unused variable 'm'
> > >   char: agp: generic: Place braces around optimised out function in if()
> > >   char: agp: uninorth-agp: Remove unused variable 'size'
> > >   char: hw_random: pseries-rng: Demote non-conformant kernel-doc header
> > >   char: mem: Provide local prototype for non-static function
> > 
> > Thanks a lot!
> > 
> > I've looked all the patches now and commented on patches 6 and 16.
> > With my comments addressed
> > 
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> Thanks Arnd.
> 
> Would it be possible for the remaining 14 patches to be taken in
> please?  I will work on the 2 Arnd commented on in due course and
> resubmit them independently.

Yes, I can queue them up, thanks.

greg k-h
