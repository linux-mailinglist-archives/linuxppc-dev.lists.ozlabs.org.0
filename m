Return-Path: <linuxppc-dev+bounces-685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8E09625D2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 13:18:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv23Z2W26z2xs8;
	Wed, 28 Aug 2024 21:18:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=145.40.73.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724843930;
	cv=none; b=DI9h/DOnj+pIhd4sHx4mGbqiflrwAvb2GfgQqWIbb+TL2jcyQM5FkKZEncopuQ6cqc0/TEKh9v0Q52P/hsdBwHT3x8fTjGA4fbSB4iNOoeQjLbdqPPzSm8BVdjAbb6KH9jEvRxO7o0VLKjVNGqTonspH4qSUZGEtt5+WT6/Gyjo0bOscthNnqrmtE/22+l9+l9BUp0psuAB44NaKpNeNi6p6h1l4zXQZA5A7AtqNCMKvhwMLHnnLWn6XO5d3SgcS9coWKdRh89kCWvEoP9JysYT21afbl2epxL/rHiPUAjSVns1gp7X+Drf3hiIOnEgNomjfNgQEO72L+qyL7YOEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724843930; c=relaxed/relaxed;
	bh=TaIlxacxM0cvax8nGT0Wo3sn3OzyvoPLEHrLd84XeNU=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NXQ6Wmo3fmN2xYxLy8oh8UDSMAI7p2aIyIFmLjUS1tCsrzBtToLAkO/HDCXQz+B7Ps1itznDseD9tqBcOAUYJ6bF/Ud4cqpwbYRaA6Ubzzzg+Y6jpu+cFkOj4wemtiEYPk5MfMMK1LqX0VGOi20lIebHmtLpJg4Nd/pFkSuW9h4ceu/tleHEhB56h94fEhnHzT77hcRACwcRYh83Kw2wzbEmtc5l9D/OOLtAsfa50shdf4Cq2ycXPl0JvZs3PbUtSKZOl/0uPlJoFVY4ic7YhmkwfJRg/3ZfdU67S/V8iOiJ6CL7eFn8Zcz9GHwVFWCi1j6fJ7KFxhsdMi+jE2Mocw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ie1ZgaJb; dkim-atps=neutral; spf=pass (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=8w/7=p3=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=ie1ZgaJb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=8w/7=p3=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv23X3gzqz2xr2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 21:18:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9BEABCE1774;
	Wed, 28 Aug 2024 11:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F77C98EC1;
	Wed, 28 Aug 2024 11:18:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ie1ZgaJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724843916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TaIlxacxM0cvax8nGT0Wo3sn3OzyvoPLEHrLd84XeNU=;
	b=ie1ZgaJbmdO0NFZiWnbQxMHvES+WVoJwzMG9ptpU3Emt2rn3BokeH+49oxcj4dV6dn2A7R
	OZIoYXalY4Ws4iv74BUjZGRKqr/jYLeyEjR6fhELEgh04xz8/D5eJuiLFmdCA7UTqCRd8K
	hMYFoVGZZlHMLnB3FsT4kBzzeg3/4HU=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8e8b7172 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 28 Aug 2024 11:18:35 +0000 (UTC)
Date: Wed, 28 Aug 2024 13:18:34 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
Message-ID: <Zs8HirKLk-SrwTIu@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu>
 <20240827180819.GB2049@sol.localdomain>
 <20240827225330.GC29862@gate.crashing.org>
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
In-Reply-To: <20240827225330.GC29862@gate.crashing.org>

On Tue, Aug 27, 2024 at 05:53:30PM -0500, Segher Boessenkool wrote:
> On Tue, Aug 27, 2024 at 11:08:19AM -0700, Eric Biggers wrote:
> > On Thu, Aug 22, 2024 at 09:13:13AM +0200, Christophe Leroy wrote:
> > > With the current implementation, __cvdso_getrandom_data() calls
> > > memset(), which is unexpected in the VDSO.
> > > 
> > > Rewrite opaque data initialisation to avoid memset().
> > > 
> > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > ---
> > >  lib/vdso/getrandom.c | 15 ++++++++++-----
> > >  1 file changed, 10 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> > > index cab153c5f9be..4a56f45141b4 100644
> > > --- a/lib/vdso/getrandom.c
> > > +++ b/lib/vdso/getrandom.c
> > > @@ -4,6 +4,7 @@
> > >   */
> > >  
> > >  #include <linux/minmax.h>
> > > +#include <linux/array_size.h>
> > >  #include <vdso/datapage.h>
> > >  #include <vdso/getrandom.h>
> > >  #include <vdso/unaligned.h>
> > > @@ -74,11 +75,15 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
> > >  	u32 counter[2] = { 0 };
> > >  
> > >  	if (unlikely(opaque_len == ~0UL && !buffer && !len && !flags)) {
> > > -		*(struct vgetrandom_opaque_params *)opaque_state = (struct vgetrandom_opaque_params) {
> > > -			.size_of_opaque_state = sizeof(*state),
> > > -			.mmap_prot = PROT_READ | PROT_WRITE,
> > > -			.mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS
> > > -		};
> > > +		struct vgetrandom_opaque_params *params = opaque_state;
> > > +		int i;
> > > +
> > > +		params->size_of_opaque_state = sizeof(*state);
> > > +		params->mmap_prot = PROT_READ | PROT_WRITE;
> > > +		params->mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS;
> > > +		for (i = 0; i < ARRAY_SIZE(params->reserved); i++)
> > > +			params->reserved[i] = 0;
> > > +
> > >  		return 0;
> > >  	}
> > 
> > Is there a compiler flag that could be used to disable the generation of calls
> > to memset?
> 
> -fno-tree-loop-distribute-patterns .  But, as always, read up on it, see
> what it actually does (and how it avoids your problem, and mostly: learn
> what the actual problem *was*!)

This might help with various loops, but it doesn't help with the matter
that this patch fixes, which is struct initialization. I just tried it
with the arm64 patch to no avail.

