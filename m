Return-Path: <linuxppc-dev+bounces-526-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE4395ECB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 11:07:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WslF10Hjlz2xxx;
	Mon, 26 Aug 2024 19:07:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724663253;
	cv=none; b=Z+CkdE0OxFs3mHfUYtxiDrsGJmvJ9LntyegEdjvh0Nc55q6WQBgXtOmQ3yjoF61Nifivie9UyhYgdxm8mSlvbmAU220o38j0QfspySMqTbAS4WM0LzS+9W7mj+Of1O+BHzJZ6I+uyBWa8VULbTG9a1gIczW3aibLDPSwp8fHO+DFrfVTUXE5OcllNgKUdDC+lGFAPAh9Crd/fkcRuzwyuxD5KSD/Dv0cVRrbSMFUtwgwaGZ8RxdChgcZc6y7osHowvqVZ8BOEbMO3UyP7JPVU57ICz2JWo5OUijXkHmFfP/E+/ia2c5k+3YrQ2VizIu96tNZncKHgTV56luup0W1VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724663253; c=relaxed/relaxed;
	bh=ocYxyao+YeYVwZkJVZlNCDBZUEKM/vUAfandsZETTJ0=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To; b=Fiapy8Gp6uJbTzZw7Tz8L5THC0yJ1FMkpgz81JJ0zUVFBQlCPowEnX++mO/zma86Dpk80CD7xCw1Rtfog9M3a01ZX1XBV890ZcJHp1DcYoeE+I8Wc+O+DtgfpfnXyJ34NkdIJmu+L4ZmqO9qbGkzi8rn4anojxCuaMJb90dxsZp2mY4JRNQwfv9S1Vvbfxg/PgnmCIiIOTze8lmFvJN1roxaO4NqJgW4Ggraer3KuhvN6nf1KS800CJdaLAsaMpaXhAn5aR+EgYaMKF0burM2AD4MuQE//urxeRF6IxxaPPmiR+bKQXWmSmOGZEL3FUQ91VSDRT3Cthb1opsS0PG3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=QcZNv2yU; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=QcZNv2yU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WslF05blQz2xxw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 19:07:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06A1DA42046;
	Mon, 26 Aug 2024 09:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB46C567C1;
	Mon, 26 Aug 2024 08:58:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QcZNv2yU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724662715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ocYxyao+YeYVwZkJVZlNCDBZUEKM/vUAfandsZETTJ0=;
	b=QcZNv2yUAl78MTanT1uEILVIG0Rwr7Gq5dxZIeMULB8F3+zNHLp+iJBBgbdma6WoOLSZZm
	dyEAM4d4sn63r+0vrzUEc2Y/7Gvw6Sd+SX+9xw+3TQl5UNUPtgirmdTEW4ELU96hQQ2Ups
	B1IIgm4VbXKEFP704+R3/GvFPvQLfh0=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b99b8b23 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 08:58:35 +0000 (UTC)
Date: Mon, 26 Aug 2024 10:58:26 +0200
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
Message-ID: <ZsxDssNPbLkcPetJ@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <2a081f1fff5e40f496153f8e0162fc7ec5adab2e.1724309198.git.christophe.leroy@csgroup.eu>
 <Zsw3xMoX2EI5UUs1@zx2c4.com>
 <7e519ba2-0293-4320-84bf-44f930fc286d@csgroup.eu>
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
In-Reply-To: <7e519ba2-0293-4320-84bf-44f930fc286d@csgroup.eu>

On Mon, Aug 26, 2024 at 10:37:49AM +0200, Christophe Leroy wrote:
> 
> 
> Le 26/08/2024 à 10:07, Jason A. Donenfeld a écrit :
> > On Thu, Aug 22, 2024 at 09:13:10AM +0200, Christophe Leroy wrote:
> >>   
> >> +#define _PAGE_SIZE (1UL << CONFIG_PAGE_SHIFT)
> >> +#define _PAGE_MASK (~(_PAGE_SIZE - 1))
> > 
> > If PAGE_SIZE isn't defined at this point, why not just call it PAGE_SIZE
> > instead of _PAGE_SIZE? But if that's the case, why not put the vdso
> > definition of PAGE_SIZE into some vdso header included by this file?
> 
> It was working ok on powerpc but on x86 I got:

Seems like there might be some more fiddling to do, then? Or did you
conclude it's impossible?

