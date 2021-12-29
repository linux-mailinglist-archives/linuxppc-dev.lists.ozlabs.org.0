Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5705480E1E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Dec 2021 01:11:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNsJF4Bnsz3c65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Dec 2021 11:11:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QWt1Tcnc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QWt1Tcnc; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNsHd5YZRz2xtj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 11:10:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D84EB81752;
 Wed, 29 Dec 2021 00:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA27C36AEB;
 Wed, 29 Dec 2021 00:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640736633;
 bh=/Kys4P+ipabSvqg0bzoCo0je/2ZVTpj4063QCgXpfH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QWt1TcnctMP2I+BPI4uKgwEfH8wrYH7rTIIvRmJEAbPKuQLC6zUGN0RD7nXXugVM7
 tVArn+PQBUo2TPZcvMp7BRxmHmYaDxFZE0rkr6uXYWpsadJOlTCcpcHmskuoASsxMc
 e8o0ucS/vOHCHvhJzmvd77iXNjAJp2OOe3uwF4hJzTy9FYVFW8kGxbZyJKWhXieCcC
 y63cBjl/YxOrKgqMsAOsJHfx320s4fOdDm9IKIjrhDUuB6N5RXt/exH90rjD6n9P+N
 r2OEx21RQS0CpUfoO085XqUgqnSZe7h4y85Cl1BdoFVwowNVPPArnVjR1UIcc4yu5E
 yuKkG3Uc0Gd6w==
Date: Wed, 29 Dec 2021 02:10:31 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH] tpm: Fix kexec crash due to access to ops NULL pointer
 (powerpc)
Message-ID: <Ycund7mDOBkndOKn@iki.fi>
References: <20211212012804.1555661-1-stefanb@linux.ibm.com>
 <YcGUoJCtmqfCWER0@iki.fi>
 <8b0c9683-d29b-38a2-8dfe-8f47db6544f2@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b0c9683-d29b-38a2-8dfe-8f47db6544f2@linux.ibm.com>
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
Cc: Korrapati.Likhitha@ibm.com, pavrampu@in.ibm.com,
 linux-kernel@vger.kernel.org, jgg@ziepe.ca,
 linux-security-module@vger.kernel.org, gcwilson@us.ibm.com, peterhuewe@gmx.de,
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 21, 2021 at 09:01:06AM -0500, Stefan Berger wrote:
> 
> On 12/21/21 03:47, Jarkko Sakkinen wrote:
> > On Sat, Dec 11, 2021 at 08:28:04PM -0500, Stefan Berger wrote:
> > > Fix the following crash on kexec by checking chip->ops for a NULL pointer
> > > in tpm_chip_start() and returning an error code if this is the case.
> > > 
> > > BUG: Kernel NULL pointer dereference on read at 0x00000060
> > > Faulting instruction address: 0xc00000000099a06c
> > > Oops: Kernel access of bad area, sig: 11 [#1]
> > > ...
> > > NIP [c00000000099a06c] tpm_chip_start+0x2c/0x140
> > >   LR [c00000000099a808] tpm_chip_unregister+0x108/0x170
> > > Call Trace:
> > > [c0000000188bfa00] [c000000002b03930] fw_devlink_strict+0x0/0x8 (unreliable)
> > > [c0000000188bfa30] [c00000000099a808] tpm_chip_unregister+0x108/0x170
> > > [c0000000188bfa70] [c0000000009a3874] tpm_ibmvtpm_remove+0x34/0x130
> > > [c0000000188bfae0] [c000000000110dbc] vio_bus_remove+0x5c/0xb0
> > > [c0000000188bfb20] [c0000000009bc154] device_shutdown+0x1d4/0x3a8
> > > [c0000000188bfbc0] [c000000000196e14] kernel_restart_prepare+0x54/0x70
> > > 
> > > The referenced patch below introduced a function to shut down the VIO bus.
> > > The bus shutdown now calls tpm_del_char_device (via tpm_chip_unregister)
> > > after a call to tpm_class_shutdown, which already set chip->ops to NULL.
> > > The crash occurrs when tpm_del_char_device calls tpm_chip_start with the
> > > chip->ops NULL pointer.
> > > 
> > > Fixes: 39d0099f9439 ("powerpc/pseries: Add shutdown() to vio_driver and vio_bus")
> > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > ---
> > >   drivers/char/tpm/tpm-chip.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
> > > index ddaeceb7e109..cca1bde296ee 100644
> > > --- a/drivers/char/tpm/tpm-chip.c
> > > +++ b/drivers/char/tpm/tpm-chip.c
> > > @@ -101,6 +101,9 @@ int tpm_chip_start(struct tpm_chip *chip)
> > >   {
> > >   	int ret;
> > > +	if (!chip->ops)
> > > +		return -EINVAL;
> > This triggers to all drivers, not just tpm_ibmvtpm, i.e. the fix has
> > side-effects.
> 
> What are those side-effects?

It does change behaviour for all drivers, which is not acceptable for a
bug fix.

/Jarkko
