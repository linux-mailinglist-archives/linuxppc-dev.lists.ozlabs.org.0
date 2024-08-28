Return-Path: <linuxppc-dev+bounces-705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 298FA963434
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 23:59:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvJGv413rz2yhg;
	Thu, 29 Aug 2024 07:59:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724859642;
	cv=none; b=BMBhTftYyWKetvKG9v3vsrfRmkpo9eRU6ABjo2JS2Q/5zOSbX3UP+ICZNMPOK+yPdDVG0pqelLEH65RaVOhke8u1neZN1lAO880jVCVFDWLT4LRi11pts1azc1tuOucIXH/53yNmSGwHQrZROlKL4h2MRsBp4zzTwpOBlMEjtkcnPVPa1UREZjtP7oNz5EaFUjD2eV5c+sU95sWbwkrQ8PnMFc1pfAZDUVf/tyOOHLgq75pB4uoXGnanWf9aTittyNmtUEGZnVPLhIC3Anl51NhrdoofXrEYo0mvY6tK+aSczIpuaKc2v3YPDaiTGBWZDdJhH5mpSOl1SbFDMKoUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724859642; c=relaxed/relaxed;
	bh=klIv7pWG9BE2EusGcZ3vs44rN7czUHKrTo3cjwQ3jKs=;
	h=Received:Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gmail-Original-Message-ID:
	 Message-ID:Subject:To:Cc:Content-Type; b=nBl72NbyPgl7RydPZpwwqSJ30qnfwudC0h0D7EiSyCWyGaLcGMlud48Q2BLYAyftqHQkufkKvQheQghCBixn5bMiPNp6ijFhfJn/Uk8UefTjiMM02onlvj5uqUwfHqbm10PpgYN7AfChH3lBuKGAJLtlWY4tt7PDq8QnHPvkskil4GCMcrImDDp+NVWmPTJyIQbmbfGWl0nPOuqWAtdyDBmvIWfubPGr06RZKAzSixU/qhkea6VaJziFdmrVFYmNm4CRyz7AAo9eL3SOPHEvb2n8DqMf5OK88QUqtQ+86mTHWLYcEMjbpTmBdYmv0VuSmB44TMWayBFtzPD0/U4b/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hDdad5/I; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hDdad5/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv7sj6hd0z2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 01:40:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9EF75A41AC8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83488C4CECC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 15:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724859637;
	bh=+z7/VLAc5zAKqxwt9kQI0vxm8x7sulgvUDeMTRfB+wo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hDdad5/IY68zkrft/92YWfFtjDz6TFndSmnpp5pqAtaDdhgaQHXnMYujF2CwZtAvo
	 s1dVBctohqByWUo15KsHC1yXOsb3CsxrVYgXiTlMrxSNBqKSRHb2u/dgFnWDlyP45P
	 kmzBzCQlLYmgzPMvmTlIEcYXhkLufuTJDpchreYUAd0yoHp8hJGCENnAbHqZR1NUMB
	 63ZyNil+E22vWl4w+ZhugE7V8Y5RiBnHkIJ248WfFc80AZtPJMZpvtsLhvJEQmQQ7b
	 rjS4mie2g2VPxttgup163SLxFXlpDbWSy4ple6kkn/VZnDNkSEFpYi5cJmSqRwT5Qa
	 F/BVlj/jrU5iw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f4f24263acso91142451fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 08:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXY0O1Pkpm+EIWljfSnnJPMdxZLjuIrGL+llOw8BsPIuOxn8lPe93YtMQi+Tk9+9VnGAPt/0P4sdeKTpN0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywi2eJj+TmK5UoKS5QqHND5xLy6jSkr473x4qr+H64uMuy4wBhA
	o+eeDKdKg2VEyt+LEo6ooCo4O2y5fwyrek+efn543qVHf9TZf8sYX6le+kxe/7skTUGTvpysqiT
	mor22rJqwB5XScUhdDMtDEnKnCk0=
X-Google-Smtp-Source: AGHT+IHIXIHDcxvkoioWarqDfEAwvoOHHvvDveL69dLtIdivksLO7ybL0XqtoFeExKbS+796rHsbT/SXItR1tBLUGxI=
X-Received: by 2002:a2e:461a:0:b0:2f3:f182:49f3 with SMTP id
 38308e7fff4ca-2f6106e36e6mr594741fa.22.1724859635743; Wed, 28 Aug 2024
 08:40:35 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu>
 <20240827180819.GB2049@sol.localdomain> <20240827225330.GC29862@gate.crashing.org>
 <Zs8HirKLk-SrwTIu@zx2c4.com> <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com>
 <20240828124519.GE29862@gate.crashing.org>
In-Reply-To: <20240828124519.GE29862@gate.crashing.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 28 Aug 2024 17:40:23 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGmDmxy75eP=rf_fzKmg0g_FeKV43jk2G_gibnKZBtVww@mail.gmail.com>
Message-ID: <CAMj1kXGmDmxy75eP=rf_fzKmg0g_FeKV43jk2G_gibnKZBtVww@mail.gmail.com>
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Eric Biggers <ebiggers@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, "Theodore Ts'o" <tytso@mit.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, shuah <shuah@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Aug 2024 at 14:57, Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Wed, Aug 28, 2024 at 12:24:12PM +0000, Arnd Bergmann wrote:
> > On Wed, Aug 28, 2024, at 11:18, Jason A. Donenfeld wrote:
> > > On Tue, Aug 27, 2024 at 05:53:30PM -0500, Segher Boessenkool wrote:
> > >> On Tue, Aug 27, 2024 at 11:08:19AM -0700, Eric Biggers wrote:
> > >> >
> > >> > Is there a compiler flag that could be used to disable the generation of calls
> > >> > to memset?
> > >>
> > >> -fno-tree-loop-distribute-patterns .  But, as always, read up on it, see
> > >> what it actually does (and how it avoids your problem, and mostly: learn
> > >> what the actual problem *was*!)
> > >
> > > This might help with various loops, but it doesn't help with the matter
> > > that this patch fixes, which is struct initialization. I just tried it
> > > with the arm64 patch to no avail.
> >
> > Maybe -ffreestanding can help here? That should cause the vdso to be built
> > with the assumption that there is no libc, so it would neither add nor
> > remove standard library calls. Not sure if that causes other problems,
> > e.g. if the calling conventions are different.
>
> "GCC requires the freestanding
> environment provide 'memcpy', 'memmove', 'memset' and 'memcmp'."
>
> This is precisely to implement things like struct initialisation.  Maybe
> we should have a "-ffreeerstanding" or "-ffreefloating" or think of
> something funnier still environment as well, this problem has been there
> since the -ffreestanding flag has existed, but the problem is as old as
> the night.
>
> -fno-builtin might help a bit more, but just attack the problem at
> its root, like I suggested?
>

In my experience, this is likely to do the opposite: it causes the
compiler to 'forget' the semantics of memcpy() and memset(), so that
explicit trivial calls will no longer be elided and replaced with
plain loads and stores (as it can no longer guarantee the equivalence)

> (This isn't a new problem, originally it showed up as "GCC replaces
> (part of) my memcpy() implementation by a (recursive) call to memcpy()"
> and, well, that doesn't quite work!)
>

This needs to be fixed for Clang as well, so throwing GCC specific
flags at it will at best be a partial solution.

Omitting the struct assignment is a reasonable way to reduce the
likelihood that a memset() will be emitted, so for this patch

Acked-by: Ard Biesheuvel <ardb@kernel.org>

It is not a complete solution, unfortunately, and I guess there may be
other situations (compiler/arch combinations) where this might pop up
again.

