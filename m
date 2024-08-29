Return-Path: <linuxppc-dev+bounces-767-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3D2964D74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 20:10:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvq7T6QJJz2yxN;
	Fri, 30 Aug 2024 04:09:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724954997;
	cv=none; b=YQUCtRoJaNYPAaB3C9KhUlYB7JyfPKOLEeHFEpljhrlfdCmbkRzIUVbriwOke4xIo4O0feJx1reZo30ogFMXS6jFdzgML0+a6DuVQY9w7vfLQejewnHBYRabCUXTzIGbZChWLONg5o3dNRQQp/t659pnohrrMrNl7jvkHwRgC9S20hK/YTZrj6gtw6SOpHFkjJLEHtv8ts41Kx7Xk5NMju3N2VD7v9t8ZDXZbjjMlbgasxFdHLO4ceYqoSla+Pk43r1v1VCjTTibxBN4tIDkcMyS5R0gtE9Tndc4PBzOGfiAa9/WRLKlPBNZ9zy01Zk9gDse8T35z85iLohevFneSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724954997; c=relaxed/relaxed;
	bh=M2EXF4QOW7B4s/ekQXjuln9WzllK4pkYg0nLXXL7tBw=;
	h=Received:Received:X-Authentication-Warning:Date:From:To:Cc:
	 Subject:Message-ID:References:Mime-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 User-Agent; b=d82/KHu/FaroVvpO2sqaqECdDv4WWSOyUgRrbQr3AWVrLmWj1d//uiEy+yhzQ0y+q57LDqwLsiFUocWiS9EdFCS0ZsQChJDiP/pr8uE3TZ2ipsNmpmjjMeBJMQudiwm5kgIoVUw1k9PGPOmeIp6WAzpVH5u9ziDlPn2ce16St2GVnhB8Kc3VtcSX6MhKlrdpGiTkNue6B013jZciZ2VAY/LZQglDeWver9WwdZMmse7TZyOjIN8X3E+S15BeGh+wTMbcpFcwPnMkeoniXHjcrtRbeoskDjAqo2innuUsIUusFjl7FXwUD6Ia8aS2mnI+W72cZmmIjafXOTKXq/EKvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wvq7S6kMnz2yxL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 04:09:56 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 47TI2hac000933;
	Thu, 29 Aug 2024 13:02:44 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 47TI2fBi000932;
	Thu, 29 Aug 2024 13:02:41 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 29 Aug 2024 13:02:41 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, "Theodore Ts'o" <tytso@mit.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        shuah <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Linux-Arch <linux-arch@vger.kernel.org>, linux-mm@kvack.org,
        linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
Message-ID: <20240829180241.GJ29862@gate.crashing.org>
References: <20240827180819.GB2049@sol.localdomain> <20240827225330.GC29862@gate.crashing.org> <Zs8HirKLk-SrwTIu@zx2c4.com> <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com> <20240828124519.GE29862@gate.crashing.org> <CAMj1kXGmDmxy75eP=rf_fzKmg0g_FeKV43jk2G_gibnKZBtVww@mail.gmail.com> <20240828162025.GG29862@gate.crashing.org> <CAMj1kXHZPfr2Sz78UrgsdX-2uBp0D1sCnznQnz5ZyMdiJq6rAA@mail.gmail.com> <20240828172538.GI29862@gate.crashing.org> <e5a36d98-c880-4d33-954a-2a05240ef02f@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5a36d98-c880-4d33-954a-2a05240ef02f@csgroup.eu>
User-Agent: Mutt/1.4.2.3i

On Thu, Aug 29, 2024 at 07:36:38PM +0200, Christophe Leroy wrote:
> 
> 
> Le 28/08/2024 à 19:25, Segher Boessenkool a écrit :
> >
> >>Not sure about static binaries, though: do those even use the VDSO?
> >
> >With "static binary" people usually mean "a binary not using any DSOs",
> >I think the VDSO is a DSO, also in this respect?  As always, -static
> >builds are *way* less problematic (and faster and smaller :-) )
> >
> 
> AFAIK on powerpc even static binaries use the vDSO, otherwise signals 
> don't work.

How can that work?  Non-dynamic binaries do not use ld.so (that is the
definition of a dynamic binary, even).  So they cannot link (at runtime)
to any DSO (unless that is done manually?!)

Maybe there is something at a fixed offset in the vDSO, or something
like that?  Is this documented somewhere?


Segher

