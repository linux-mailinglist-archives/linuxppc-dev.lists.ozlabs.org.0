Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB8D653277
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 15:26:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcbNp1WJ7z3c9S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 01:26:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lRfbtyA5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=kbol=4t=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=lRfbtyA5;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NcbMs1Wfwz3bM7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 01:26:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B4682B81B99;
	Wed, 21 Dec 2022 14:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D712FC433D2;
	Wed, 21 Dec 2022 14:25:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lRfbtyA5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1671632752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8QQzlcDreGvKeI1pdR+V0dkEGrKkHpwe4Fd6Sw7snfM=;
	b=lRfbtyA5Ug1Tw0zhKb/BNFVoEpWyjAGCyO/CoLabvh7W3k4ANnWkdSVX9WueP0sD+6Ai0z
	fM66bagOmE4QBhCc6XTBVj7Ox6yRN+8yBHyMnexD8QI1Ge3QpORi6PmoQMnlF78mdrWHTA
	+rvAZXe36hNg+4rNK2pXFWP3l6D+F3g=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 421bb0b7 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 21 Dec 2022 14:25:52 +0000 (UTC)
Date: Wed, 21 Dec 2022 15:25:49 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v12 0/6] implement getrandom() in vDSO
Message-ID: <Y6MXbTAHBSR5WBrU@zx2c4.com>
References: <20221212185347.1286824-1-Jason@zx2c4.com>
 <86cfa465-2485-ff24-16f5-9014e25a0e98@csgroup.eu>
 <Y6IXWltScF2CI1v3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6IXWltScF2CI1v3@gmail.com>
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
Cc: Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Carlos O'Donell <carlos@redhat.com>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "patches@lists.linux.dev" <patches@lists.linux.dev>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 20, 2022 at 08:13:14PM +0000, Eric Biggers wrote:
> On Tue, Dec 20, 2022 at 05:17:52PM +0000, Christophe Leroy wrote:
> > Hi Jason,
> > 
> > Le 12/12/2022 à 19:53, Jason A. Donenfeld a écrit :
> > > Changes v11->v12:
> > > ----------------
> > > - In order to avoid mlock()ing pages, and the related rlimit and fork
> > >    inheritance issues there, Introduce VM_DROPPABLE to prevent swapping
> > >    while meeting the cache-like requirements of vDSO getrandom().
> > > 
> > >    This has some tenticles in mm/ and arch/x86/ code, so I've marked the
> > >    two patches for that as still RFC, while the rest of the series is not
> > >    RFC.
> > > 
> > > - Mandate that opaque state blobs don't straddle page boundaries, so
> > >    that VM_DROPPABLE can work on page-level granularity rather than
> > >    allocation-level granularity.
> > > 
> > > - Add compiler barriers to vDSO getrandom() to prevent theoretical
> > >    reordering potential.
> > > 
> > > - Initialize the trials loop counter in the chacha test.
> > 
> > I would have liked to give it a try on powerpc, but the series 
> > conflicts. I tried both on v6.1 and on linus/master from now:
> > 
> 
> Same here, I can't figure out how to apply this series.

Rebased v13 posted: https://lore.kernel.org/all/20221221142327.126451-1-Jason@zx2c4.com/

Jason
