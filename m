Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A74FB6527A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 21:14:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nc7863hSTz3bgm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 07:14:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BNIgEyD2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BNIgEyD2;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nc7745gchz2xWg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 07:13:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A6E606159E;
	Tue, 20 Dec 2022 20:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2276C433EF;
	Tue, 20 Dec 2022 20:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671567196;
	bh=Gv7ILarnqG6VXDv1zDoq4dXMcpli2fdU3fYWtrhD7CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNIgEyD2b/kwnXbaR5eP2QBP6UOPAvQD/zXFajZWt6RT74gXhm2s6OW4N4KlIDYfC
	 Wxj/cb6C47OFZnLUTyNjRVTrtsstBCz34eSTcFuSh8xOdIJfvtKJ0/S3YG8qtuZO+h
	 LVw/GM01Blb4idgGSfUfT/5N9ejTRXvuE5Mw1vrfiD3+t4k4Xbat5lWBMHcLkl/46L
	 MZPNmMJsegfvf0rTSEXW5sH0CokCzOrUgUPmh+IzXUqga3I07y9uao2n9w8QT5IQiS
	 MZzetOEpR2Sv47PnKm1OJ3NaodmMfXpe4ekWd75YuDtjccDI1UPYcXzuqMblveH5rR
	 DHTVp2kedMNHw==
Date: Tue, 20 Dec 2022 20:13:14 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v12 0/6] implement getrandom() in vDSO
Message-ID: <Y6IXWltScF2CI1v3@gmail.com>
References: <20221212185347.1286824-1-Jason@zx2c4.com>
 <86cfa465-2485-ff24-16f5-9014e25a0e98@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86cfa465-2485-ff24-16f5-9014e25a0e98@csgroup.eu>
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
Cc: Florian Weimer <fweimer@redhat.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Carlos O'Donell <carlos@redhat.com>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "patches@lists.linux.dev" <patches@lists.linux.dev>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 20, 2022 at 05:17:52PM +0000, Christophe Leroy wrote:
> Hi Jason,
> 
> Le 12/12/2022 à 19:53, Jason A. Donenfeld a écrit :
> > Changes v11->v12:
> > ----------------
> > - In order to avoid mlock()ing pages, and the related rlimit and fork
> >    inheritance issues there, Introduce VM_DROPPABLE to prevent swapping
> >    while meeting the cache-like requirements of vDSO getrandom().
> > 
> >    This has some tenticles in mm/ and arch/x86/ code, so I've marked the
> >    two patches for that as still RFC, while the rest of the series is not
> >    RFC.
> > 
> > - Mandate that opaque state blobs don't straddle page boundaries, so
> >    that VM_DROPPABLE can work on page-level granularity rather than
> >    allocation-level granularity.
> > 
> > - Add compiler barriers to vDSO getrandom() to prevent theoretical
> >    reordering potential.
> > 
> > - Initialize the trials loop counter in the chacha test.
> 
> I would have liked to give it a try on powerpc, but the series 
> conflicts. I tried both on v6.1 and on linus/master from now:
> 

Same here, I can't figure out how to apply this series.

It would help if people always used the --base option to git format-patch...

- Eric
