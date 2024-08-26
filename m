Return-Path: <linuxppc-dev+bounces-537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0595F2E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 15:27:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wss144wCXz2yNc;
	Mon, 26 Aug 2024 23:27:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724678856;
	cv=none; b=afOA0XQ2bRlKlu0/ixR36rIcRpXuSEJvJ6UsWCBjQ5E+YnaqRnUxVCaI4bGazAKfCRk9S1zT2SjoNutREso0jI3uEeVJ5m8rrvyJ6OqP6d2RpGr2inpCwSfGNpcXntZEQSTUo8QI0NVGQ3vaHxktmpKfYNamN0rbHI3aEcifzwceH5b+f/Rh4nTge1OwdSiQOIorQTlZCU321Z6TGvcpuEv01wDkeq72pKRN1xH4Yb5to3Agv1n5QVZPqJOB5IICr2Zg/3gaRCM6S3zRY7NRKskDzyKTbcN27ZC37INEzrhq4vyZ89rrmWVQcWH75L7L0nQNOE0eZv2gsGNyGvpCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724678856; c=relaxed/relaxed;
	bh=OUCY//gcsGifesZ1olnZEnGellJ2FsUj9xgqUPmJgSw=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To; b=cucqUeJOA5i99VSF9zwXjXnQ2q4OL4LQ0xAwycQZfkLqBLvnWKbzrlcKr0ugMKsZIpSKJe91ql6hrZ6mUtxaydwq2aGY8Mta9Da39dZ0W5pgzaXjkk7CbGzZYF9wVZvztBPssDau7BeoHqn4Ox/VmYpOBaViP5D8Fc3Q5fHBJjywSMhSSlfqd0JyPLo3YMv06YWFBcG4EVtGzWxYkyDaY53Vrx5KEeM3oEsT27AGCtVfol/mahV1IggS6PMcQY6c17iiT7awuflOakk5KBfEl4SKPrM+51za/iF7siUj4oOYLz/psGnytKPiVze+Xe0VARQW0Htfij+HUlhbuRLcfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Wa823DeW; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Wa823DeW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wss125RNWz2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 23:27:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6DBAA4281F;
	Mon, 26 Aug 2024 13:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCF2C581A8;
	Mon, 26 Aug 2024 13:17:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Wa823DeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724678254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OUCY//gcsGifesZ1olnZEnGellJ2FsUj9xgqUPmJgSw=;
	b=Wa823DeWZM9H6FLazF9Mr7TU1lpT7Ca2BQGMHRpVMu5+STfZJ5yOG7/csTW2UT9kZ/KBWj
	m4Pcyxf1F3yWLOjqfmxbtEC+RXdMlDtMhdJ18zwVpt75LqV+IwhUjmTamCySjlInVeSQ2M
	Z/Qj8HfmknEyBTYjbzrvjxsG25vCJRA=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7d5cb29d (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 13:17:33 +0000 (UTC)
Date: Mon, 26 Aug 2024 15:17:32 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
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
Subject: Re: [PATCH v2 02/17] vdso: Clean header inclusion in getrandom
Message-ID: <ZsyAbP4GOP1eCSI8@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <2a081f1fff5e40f496153f8e0162fc7ec5adab2e.1724309198.git.christophe.leroy@csgroup.eu>
 <Zsw3xMoX2EI5UUs1@zx2c4.com>
 <7e519ba2-0293-4320-84bf-44f930fc286d@csgroup.eu>
 <ZsxDssNPbLkcPetJ@zx2c4.com>
 <51adbe91-3c3a-4baa-bb39-29df98a6eea5@csgroup.eu>
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
In-Reply-To: <51adbe91-3c3a-4baa-bb39-29df98a6eea5@csgroup.eu>

On Mon, Aug 26, 2024 at 12:45:40PM +0200, Christophe Leroy wrote:
> 
> 
> Le 26/08/2024 à 10:58, Jason A. Donenfeld a écrit :
> > On Mon, Aug 26, 2024 at 10:37:49AM +0200, Christophe Leroy wrote:
> >>
> >>
> >> Le 26/08/2024 à 10:07, Jason A. Donenfeld a écrit :
> >>> On Thu, Aug 22, 2024 at 09:13:10AM +0200, Christophe Leroy wrote:
> >>>>    
> >>>> +#define _PAGE_SIZE (1UL << CONFIG_PAGE_SHIFT)
> >>>> +#define _PAGE_MASK (~(_PAGE_SIZE - 1))
> >>>
> >>> If PAGE_SIZE isn't defined at this point, why not just call it PAGE_SIZE
> >>> instead of _PAGE_SIZE? But if that's the case, why not put the vdso
> >>> definition of PAGE_SIZE into some vdso header included by this file?
> >>
> >> It was working ok on powerpc but on x86 I got:
> > 
> > Seems like there might be some more fiddling to do, then? Or did you
> > conclude it's impossible?
> 
> Maybe someone who knows x86 in details could helps but after a first 
> look I gave up because it looks very x86 specific, indeed that's 
> x86/asm/vdso/gettimeofday.h that pulls several x86/asm/ headers , and 
> the same type of issue might arise for any new architecture coming in.
> 
> For me it looked cleaner to just do as commit cffaefd15a8f ("vdso: Use 
> CONFIG_PAGE_SHIFT in vdso/datapage.h") and not use PAGE_SIZE at all. But 
> I didn't want to directly use (1UL << CONFIG_PAGE_SHIFT) and (~(1UL << 
> (CONFIG_PAGE_SHIFT - 1))) in the code directly hence the new macros with 
> a leading underscore to avoid any conflict with existing macros.

If that's the case and you can't sort it out or it's impossible, then it
seems like adding #ifndef PAGE_SIZE, #define... inside of some vdso header
(not inside getrandom.c) would make sense.

Jason

