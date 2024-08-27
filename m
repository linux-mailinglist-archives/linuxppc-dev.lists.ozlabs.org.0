Return-Path: <linuxppc-dev+bounces-620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD8A9616DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 20:23:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtbWV2Ysrz2yDS;
	Wed, 28 Aug 2024 04:23:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724782982;
	cv=none; b=cerPjTPdYWn0oTHBjWl3wdj7HLhHcJRCiotIVTZxBuS/1BEFenDzlvhyq9GxTBYBriAirikzyEyckjTlPpNu1VAz7Ji7MKczV440m0ODmQjEmZVqKpxTtaFb5aV82b7aDFveAX3yx1W76Kd55DSSVTS77AjTC4qWSdVCIqA3cvss3DUYzfO+DWlSxmElxhwV5SrQrd6YPvXvuSmv5lrx5w8F3/lwQChBGMynjzQXXcGJ/KaWY8v+H2algsaKK2L7v1zuZ1N8cmab5W9DFMHWNDWPxcdVKaNtE++mqKTbfUbo1mwjQQhjZFS945alLSTEjGzBsWXtIVI0vRYf1AE8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724782982; c=relaxed/relaxed;
	bh=6IIlC4dKeX0MR+87wiXBKWBHYPvMuntBVfDv8HHvaKU=;
	h=X-Greylist:Received:Received:DKIM-Signature:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CKY66PTxO37DH/hECsrU09cuh58DueBIApmIqTv0cOg1nluGIKgtM1Kh3jT42YzovtML3Qy2pw1WiDAgIYWFtpWsNDSof0schAfAXsiYpHc6lU94J69cXHhDZe/lLaEpwJsFLsNxOsLaCRzakYnUnoZ7OuyvdjKhTG0wYPrJBxp7QfA+ujlD8XfwKyMcbmBxBj+TKcF8HLh5kwivZn8uwSrQiKVsltMOcwljvlzXOVucPmGJ2+Qcu07RtgzwPm5LnD7H4T1dDIsQxrYckYue0WnfzBppvOcVyPlHYAFSpQgVs1675KI7Y7kxGB19oa/Njt/j3Vb1R6e5m3b4uwOl6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=aRXc2LCc; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=xpq3=p2=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=aRXc2LCc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=xpq3=p2=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 37967 seconds by postgrey-1.37 at boromir; Wed, 28 Aug 2024 04:23:00 AEST
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtbWS0QW5z2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 04:22:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85FFAA404F4;
	Tue, 27 Aug 2024 18:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2858C4AF09;
	Tue, 27 Aug 2024 18:22:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="aRXc2LCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724782970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6IIlC4dKeX0MR+87wiXBKWBHYPvMuntBVfDv8HHvaKU=;
	b=aRXc2LCcclXS0jZM2Er3xb+9/MC6tyTrnANQKQqiX8JchcC5Hct3PDriYN6bmQyyvpVrZu
	SoRTJ7lKlZu8bysVWJFpmMCUsDdL0JJSqO5l7LQ2QGh4MGWrRpFxxzDVBg/4dd6rTXgykh
	bzknrtr7GCDH1d4bP7p3h1ixzFFzzvI=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 82078a25 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 27 Aug 2024 18:22:50 +0000 (UTC)
Date: Tue, 27 Aug 2024 20:22:44 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
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
Message-ID: <Zs4ZdAtnm2UEr5cd@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu>
 <20240827180819.GB2049@sol.localdomain>
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
In-Reply-To: <20240827180819.GB2049@sol.localdomain>

On Tue, Aug 27, 2024 at 11:08:19AM -0700, Eric Biggers wrote:
> On Thu, Aug 22, 2024 at 09:13:13AM +0200, Christophe Leroy wrote:
> > With the current implementation, __cvdso_getrandom_data() calls
> > memset(), which is unexpected in the VDSO.
> > 
> > Rewrite opaque data initialisation to avoid memset().
> > 
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> >  lib/vdso/getrandom.c | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> > index cab153c5f9be..4a56f45141b4 100644
> > --- a/lib/vdso/getrandom.c
> > +++ b/lib/vdso/getrandom.c
> > @@ -4,6 +4,7 @@
> >   */
> >  
> >  #include <linux/minmax.h>
> > +#include <linux/array_size.h>
> >  #include <vdso/datapage.h>
> >  #include <vdso/getrandom.h>
> >  #include <vdso/unaligned.h>
> > @@ -74,11 +75,15 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_info, void *buffer, size_
> >  	u32 counter[2] = { 0 };
> >  
> >  	if (unlikely(opaque_len == ~0UL && !buffer && !len && !flags)) {
> > -		*(struct vgetrandom_opaque_params *)opaque_state = (struct vgetrandom_opaque_params) {
> > -			.size_of_opaque_state = sizeof(*state),
> > -			.mmap_prot = PROT_READ | PROT_WRITE,
> > -			.mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS
> > -		};
> > +		struct vgetrandom_opaque_params *params = opaque_state;
> > +		int i;
> > +
> > +		params->size_of_opaque_state = sizeof(*state);
> > +		params->mmap_prot = PROT_READ | PROT_WRITE;
> > +		params->mmap_flags = MAP_DROPPABLE | MAP_ANONYMOUS;
> > +		for (i = 0; i < ARRAY_SIZE(params->reserved); i++)
> > +			params->reserved[i] = 0;
> > +
> >  		return 0;
> >  	}
> 
> Is there a compiler flag that could be used to disable the generation of calls
> to memset?

Apparently not: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90701

-ffreestanding disables the most but still can generate calls to memcpy
and memset, and the bug was closed as "RESOLVED INVALID". Surprising,
but maybe it's one of those "functions are part of language" things.

