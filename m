Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0EC7A1B9E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 12:01:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PKpIyJXf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn8q76g3Qz3dDp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 20:01:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PKpIyJXf;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn00M62Ljz3cJW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 13:24:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694748242;
	bh=6XG3B0FzXsmvZoKkkhm5wOJHB7Zd1TpS1JWjBGpTusE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PKpIyJXfdhJr2Sk2XiFpR9ouUJal5nD2tBGYvkTi+yQRsa9ZIvCgirZ5+6besrqBL
	 UlCTRNeIti/3HlXKC5s/hNh/zWDyp0CAj38ooZCtURDec0zV29n1q0vvHWP8LzC/8u
	 j+BMCh8sirKL/ZLOdFgRYAJwTicvGuLLCgCMve6s4NNE6G+YTeu3xI1X+6WSPiiUmJ
	 53dID1WgSubZVw/xkbEC18yiNd+dsH+sCiTIMfNZ4C0SAAbyPBEWD+PT1gDHirRJ7I
	 e1Oe/pJXxiN5V+sroGp3Ed6zutx8sxe3J/0iaG/Wx6C4lA/ghdRZcbu2waY0Piauup
	 ceLVj/+K8GSVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rn0045DDWz4wxR;
	Fri, 15 Sep 2023 13:23:48 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sohil Mehta <sohil.mehta@intel.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: Re: [PATCH v2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
In-Reply-To: <20230914185804.2000497-1-sohil.mehta@intel.com>
References: <20230914185804.2000497-1-sohil.mehta@intel.com>
Date: Fri, 15 Sep 2023 13:23:43 +1000
Message-ID: <878r986rwg.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 15 Sep 2023 20:00:57 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, "Eric W . Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com
 >, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei Trofimovich <slyich@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Mark Brown <broonie@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Sohil Mehta <sohil.mehta@intel.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Deepak Gupta <debug@rivosinc.com>, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Randy Dunlap <rdunlap@infradead.org>,
  Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sohil Mehta <sohil.mehta@intel.com> writes:
> commit c35559f94ebc ("x86/shstk: Introduce map_shadow_stack syscall")
> recently added support for map_shadow_stack() but it is limited to x86
> only for now. There is a possibility that other architectures (namely,
> arm64 and RISC-V), that are implementing equivalent support for shadow
> stacks, might need to add support for it.
>
> Independent of that, reserving arch-specific syscall numbers in the
> syscall tables of all architectures is good practice and would help
> avoid future conflicts. map_shadow_stack() is marked as a conditional
> syscall in sys_ni.c. Adding it to the syscall tables of other
> architectures is harmless and would return ENOSYS when exercised.
>
> Note, map_shadow_stack() was assigned #453 during the merge process
> since #452 was taken by fchmodat2().
>
> For Powerpc, map it to sys_ni_syscall() as is the norm for Powerpc
> syscall tables.

Mapping it to sys_map_shadow_stack() would work fine, but I'm happy with
sys_ni_syscall as I don't see powerpc implementing map_shadow_stack()
any time soon.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
