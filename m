Return-Path: <linuxppc-dev+bounces-4334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8879F6A54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 16:46:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCyhj4md8z30RS;
	Thu, 19 Dec 2024 02:46:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734536789;
	cv=none; b=BaUQpRqmbuOkh204X4+RCF7C5sC+7CfKr9shEVEAjWP+M0XwNjqBs05L/F76w+7fCnesSF/Rzf7cNgbFNXGVeuI9E/zG2cx4da/bpNNKfOHRzBpwqEFdHvt3x/EVYOF248wGpdBaKNQakPnYDMa3gdu6aG9I02vUIbGr8SRDKWwJ4ooNvlXX2358li7e1etculinHePPQIp7BB88UtIdH6eEGYiHCE3Y8Yo2XOMLuBvxZ2dR0FxnItd7MDTv9/s/k1jbeav5LMlAPjRE9exAa56b0b5Vt12XxH94mqxnzZoA75MD62PqFmkkJNvH3SYZZ7TbCiHXFG9VLbjN/3tGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734536789; c=relaxed/relaxed;
	bh=2PCfBV+N+0D5I2Uv7/hn0t8iMmZx5bcl62I6AxJsW8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/2xQ+t9gUs4TimoUEm0DpcxQPSweZMSg6j2/v11RTb+b7v33C8mY4RovNVHybxThHPHqO4VMELI5peDe/LhRbk+k9EithvUsy+v1KWuZm2m2KKRufK5ZeT5rey3Saxe3NofDYLnnzhy+kWa6PtqohxIUDrtEmVA0SiyZxv0XIJkVZY3IyMcYCZnAdYRS6O2u3DYWhDopabyuUXt3cJTCCYK5+0pSADLevxbVWzLR4gM2QyhWiFG4XdOS7UuOmyuOGh1uHkIOwEKFHeKY1qAGEn6kM3B6QEmsHxTKG1IEpBR/WkixesiBtl7/kuSjIKMuToGyssEgm7iqKoXNpHcvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pJxxVRCM; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wbyFSBHC; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pJxxVRCM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wbyFSBHC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCyhh1CtSz2yYf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 02:46:28 +1100 (AEDT)
Date: Wed, 18 Dec 2024 16:46:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734536777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2PCfBV+N+0D5I2Uv7/hn0t8iMmZx5bcl62I6AxJsW8A=;
	b=pJxxVRCMHJdngSkzFgGSzBMnBJkDpDuzYyVQMMKK8s3jy4v88LTqHGSsTUFgwaCSaDtpLZ
	9Hz+NSXpB8buHGBeis4umt1p6y1gfXS+W/AM4nWblrH5gJgmsDTKEmgPHIxrL1TURvlt99
	aT2WVnX2bYOlW3X+S+Mecm0lX7V/SRbRpNstAWH6PZljh+0jmjttXmJWtOpxsaQWnDaeRw
	l9mFBpQQhDK9hywRLcUiS2JorNnttHGskIcqaBxCKPMKpA3hMQ9YEKUiIRZnZzY8m8Wfok
	kefZk2jPlkA3QweN8xWEXObFI0S9FXUHUoYjCf486xhj3+SxKW3ibx1LPjcCaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734536777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2PCfBV+N+0D5I2Uv7/hn0t8iMmZx5bcl62I6AxJsW8A=;
	b=wbyFSBHCt2AOMp8iwQLVuUtFnc5a3Q7N/OLe/EpksL5g0UriFWxndXCsQj4joqste9Sv6B
	7KCkZHwqquxkbHBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 07/17] riscv: vdso: Switch to generic storage
 implementation
Message-ID: <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
 <20241218-action-matchbook-571b597b7f55@spud>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218-action-matchbook-571b597b7f55@spud>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Conor,

On Wed, Dec 18, 2024 at 03:08:28PM +0000, Conor Dooley wrote:
> On Mon, Dec 16, 2024 at 03:10:03PM +0100, Thomas Weiﬂschuh wrote:
> > The generic storage implementation provides the same features as the
> > custom one. However it can be shared between architectures, making
> > maintenance easier.
> > 
> > Co-developed-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  arch/riscv/Kconfig                                 |  3 +-
> >  arch/riscv/include/asm/vdso.h                      |  2 +-
> >  .../include/asm/vdso/{time_data.h => arch_data.h}  |  8 +-
> >  arch/riscv/include/asm/vdso/gettimeofday.h         | 14 +---
> >  arch/riscv/include/asm/vdso/vsyscall.h             |  9 ---
> >  arch/riscv/kernel/sys_hwprobe.c                    |  3 +-
> >  arch/riscv/kernel/vdso.c                           | 90 +---------------------
> >  arch/riscv/kernel/vdso/hwprobe.c                   |  6 +-
> >  arch/riscv/kernel/vdso/vdso.lds.S                  |  7 +-
> >  9 files changed, 18 insertions(+), 124 deletions(-)
> 
> Fails to build:
> Patch 7/17: Test 1/12: .github/scripts/patches/tests/build_rv32_defconfig.sh
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:11:33: warning: declaration of 'struct riscv_hwprobe' will not be visible outside of this function [-Wvisibility]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:15:41: warning: declaration of 'struct riscv_hwprobe' will not be visible outside of this function [-Wvisibility]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:19:37: error: call to undeclared function '__arch_get_vdso_u_arch_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:19:31: error: incompatible integer to pointer conversion initializing 'const struct vdso_arch_data *' with an expression of type 'int' [-Wint-conversion]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:22:36: error: arithmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:30:40: error: incomplete definition of type 'const struct vdso_arch_data'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:31:24: error: incompatible pointer types passing 'struct riscv_hwprobe *' to parameter of type 'struct riscv_hwprobe *' [-Werror,-Wincompatible-pointer-types]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:35:7: error: call to undeclared function 'riscv_hwprobe_key_is_valid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:35:35: error: incomplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:5: error: incomplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:18: error: incomplete definition of type 'const struct vdso_arch_data'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:44: error: incomplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:39:5: error: incomplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:40:5: error: incomplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:43:4: error: arithmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:49:39: warning: declaration of 'struct riscv_hwprobe' will not be visible outside of this function [-Wvisibility]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:53:37: error: call to undeclared function '__arch_get_vdso_u_arch_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:53:31: error: incompatible integer to pointer conversion initializing 'const struct vdso_arch_data *' with an expression of type 'int' [-Wint-conversion]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:55:36: error: arithmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:71:61: error: incomplete definition of type 'const struct vdso_arch_data'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:71:29: error: use of undeclared identifier 'RISCV_HWPROBE_WHICH_CPUS'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:72:24: error: incompatible pointer types passing 'struct riscv_hwprobe *' to parameter of type 'struct riscv_hwprobe *' [-Werror,-Wincompatible-pointer-types]
>   fatal error: too many errors emitted, stopping now [-ferror-limit=]
> 
> Might be a clang thing, allmodconfig with clang doesn't build either.

The proposed generic storage infrastructure currently expects that all
its users also use HAVE_GENERIC_VDSO.
I missed rv32 when checking this assumption.

I can add a bunch of ifdefs into the storage code to handle this.

Or we re-add the time vDSO functions which were removed in commit
d4c08b9776b3 ("riscv: Use latest system call ABI").
Today there are upstream ports of musl and glibc which can use them.
(currently musl even tries to use __vdso_clock_gettime() as 64-bit only
on rv32 due to a copy-and-paste error from its rv64 code)

There is precedence in providing 64bit only vDSO functions, for example
__vdso_clock_gettime64() in arm.
I do have a small, so far untested, proof-of-concept patch for it.
This would even be less code than the ifdefs.

What do you think about it?


Thomas

