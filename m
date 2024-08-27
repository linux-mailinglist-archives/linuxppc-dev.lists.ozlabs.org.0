Return-Path: <linuxppc-dev+bounces-627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFA8961A30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 01:00:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtjgp1BCgz2yQj;
	Wed, 28 Aug 2024 09:00:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724799638;
	cv=none; b=lw6QnIn/RIOJxGyT6xI0hXQWXgCiH3S6X2tNRT/H5JYnhoX4f+fuXCP86sEZSGn9TSixoWwHzDixYJpgcl8y1hAtjFxPX576IFm2aW5xa483qK+JugKaZQ0CnGZFpenrQJA+q68WhrSub2uraF/NsZ/uK6hLlnmLLzJCh6QkN+HXRv6HYT+rndasQiHXZkrjRgL1es4fLkwahA8wA2pqRnjgE4QT6R1x4HuHWcSVinxWb28+rYDcqpcaAD/+gV3MIxdVKDJmtIzuw1hp7zZHJm256HVCe4F8QoO6wIEdmexs8YXaZlDv9enxvmHT/LRInl0gHHpCRnHh43Y8pI8i0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724799638; c=relaxed/relaxed;
	bh=Z72GF+4m8o7arXZKerpWLPf9I3/Jl2YWddN3COzPwAE=;
	h=Received:Received:X-Authentication-Warning:Date:From:To:Cc:
	 Subject:Message-ID:References:Mime-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent; b=KSmQkZB/8XvV+E/GwVNa+fsEquKxNc7DpxNCnzm9eXfsXchEXgNKJi85j1Rt1fcQ0m+UTtKRq4rHOzxYHXmnSVb8EUSET4fE4WjcxSwAZ5Qh6VDgMu7voKTIL1Jbx45n8ZvolqoS4J6LF9Dz2gJjC1W+xB1ZAZ4BtbsLh/oRibTnia6iysW4ZnVgJwZDi+V4l8uF6HVcB8XwYfrqtwCxLJk03EZy82A3xHltL8wl6eKvU13Bl7ERhnA/9J505Uyd2KYCmHdyH37w1P8JxVzPls6rW4reyOPaWfcERhHxzqRJeiWKJF/WpnvyM0rfQ8Hh1auNGgNwicLlDkxiJXQ59A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtjgm1HMjz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 09:00:35 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 47RMrWeM032045;
	Tue, 27 Aug 2024 17:53:32 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 47RMrUKh032044;
	Tue, 27 Aug 2024 17:53:30 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 27 Aug 2024 17:53:30 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, "Theodore Ts'o" <tytso@mit.edu>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>, Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <20240827225330.GC29862@gate.crashing.org>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu> <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu> <20240827180819.GB2049@sol.localdomain>
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
In-Reply-To: <20240827180819.GB2049@sol.localdomain>
User-Agent: Mutt/1.4.2.3i

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

-fno-tree-loop-distribute-patterns .  But, as always, read up on it, see
what it actually does (and how it avoids your problem, and mostly: learn
what the actual problem *was*!)

Have fun,


Segher

