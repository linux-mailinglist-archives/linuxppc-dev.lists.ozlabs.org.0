Return-Path: <linuxppc-dev+bounces-596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 235239605F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 11:42:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtMys4hYhz2yR5;
	Tue, 27 Aug 2024 19:42:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724751749;
	cv=none; b=ELiCJAaDUObLNjAZDV+ZvZzLkLL4Sy9bprcN+28yifBpomavu9NDCU+9U3qpZDNROGrcIt8YyWMlmngjru4wtXbdw1z67i3oINNA+U8VufK/4ChHmkEj4eYkHICjKtG/4CFxkf4jT1EnPPLCNkvayMirvW1jkm+N2rm9HbVjCsRxylFHTHU2gFMf5baeH9/IstMQ/Tc0MiHY8OzxBiUdnTcA/ahpSszmw4bDlwAEgvV/VfHIUI3dWB/p5hmgTLX0wxHXBhwxontbibWn/LUFiSp9yaPMROMdgno8zW9bOz0YIybHD7TU+BNyZLhdRfrzaCmsC+4Z5Z4xWFMmYImipA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724751749; c=relaxed/relaxed;
	bh=JdIowXx5hArmXp0irpZ89oIJDLeZuVLuZPGcLtq5hgU=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PZDLMxuVi0Pff40u4hPrKDP86sGGGrnqCuLgYP2OSlJ23TL05foHcTQke8RtrPSJyI7vza0L0GFdgYIB9aIGdjMYw6HU+ByYHE0nVB5+bkk3BXo19HL2fF16v7P0RIFKst4RmlOB+AcUM/I/FZXOCDyTXhQaIu6MDgE27hIL7Jh3YnIs5moE4twK3HelGpiu0/d6708IBFS9KyKVtLg+yTGyI+i695c2GB9SS1CzgQNWE/Dg0fS7KvJrtDcq9OvleSVtrk5QzSDm5lZlsgAXvwo37SG6+hzA0vtkhFMTnuar1+t36sRHS3BfHmfn20Tjr9ZT1QLlPBxVyWoezBNOWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=DxHa9hxJ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=xpq3=p2=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=DxHa9hxJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=xpq3=p2=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtMyq4rk0z2yR1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 19:42:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2DB45A41790;
	Tue, 27 Aug 2024 09:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94408C8B7CD;
	Tue, 27 Aug 2024 09:31:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="DxHa9hxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724751112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JdIowXx5hArmXp0irpZ89oIJDLeZuVLuZPGcLtq5hgU=;
	b=DxHa9hxJdBbjx/iowG23VxSZyG/CGmRspd62YsjFHqw0za1fqkq/Nd7+a80kDZL2Tm7peD
	o/We6F+5fwEzQZMoosma4XFBPFOH2qWxrLQ/P73o66d8kChstBj6lF3d8wi2fZxcpqCXkw
	uIFnWdSd9qKW1JqXm2PC/smuCa0IZ5c=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ecb5f7c9 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 27 Aug 2024 09:31:50 +0000 (UTC)
Date: Tue, 27 Aug 2024 11:31:43 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Xi Ruoyao <xry111@xry111.site>,
	Jinyang He <hejinyang@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Theodore Ts'o <tytso@mit.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev
Subject: getrandom() vDSO archs (arm64, ppc, loongarch) for 6.12 [Was: Re:
 [PATCH v2 00/17] Wire up getrandom() vDSO implementation on powerpc]
Message-ID: <Zs2c_9Z6sFMNJs1O@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <Zswsennpw6fvigVh@zx2c4.com>
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
In-Reply-To: <Zswsennpw6fvigVh@zx2c4.com>

Hey again,

On Mon, Aug 26, 2024 at 09:19:22AM +0200, Jason A. Donenfeld wrote:
> Thanks for this series. There are quite a few preliminary patches in it,
> before you get to the PPC part, which fix up general build system or test
> harness correctness issues. Since some of those affect all architectures
> that are adding vDSO getrandom() support for 6.12, I'm going to take
> those into my random.git tree as a fix for 6.11 now, in hopes that the
> new archs can mostly go into arch trees without too many tree
> interdependencies.
> 
> So I'll reply to individual patches for that, mentioning which ones I
> extract.

Seeing the volume of these and the amount of ground they touch, I'm now
having second thoughts about rushing this into 6.11. Particularly with
the header changes, I think it might be smart to let it cook in
linux-next for a bit before sending it to Linus.

  $ git --no-pager diff --name-only linus/master
  arch/x86/entry/vdso/vma.c
  arch/x86/include/asm/pvclock.h
  arch/x86/include/asm/vdso/vsyscall.h
  drivers/char/random.c
  include/asm-generic/unaligned.h
  include/vdso/helpers.h
  include/vdso/unaligned.h
  lib/vdso/Makefile
  lib/vdso/getrandom.c
  tools/arch/x86/vdso
  tools/include/linux/linkage.h
  tools/testing/selftests/vDSO/Makefile
  tools/testing/selftests/vDSO/vdso_config.h
  tools/testing/selftests/vDSO/vdso_test_getrandom.c

So I think what I'll do is, for 6.11-rc6, send in the real bug fixes,
which right now amount to:

  - random: vDSO: reject unknown getrandom() flags
  - random: vDSO: don't use 64-bit atomics on 32-bit architectures

  $ git --no-pager diff --name-only linus/master..a90592ab7cad
  drivers/char/random.c
  lib/vdso/getrandom.c

And then for the pending aarm64, ppc64(/32?), and loongarch enablement
patches for 6.12, I'll just take those through my random.git tree, which
have all of these build-system preliminaries. And then we'll obviously
require acks from the maintainers of the archs for each of those arch
enablement patches.

If that sounds like an acceptable plan, you might want to mention in the
cover letter that you're basing your arch-specific patches on
https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git/ and
want an ack from the arch maintainer, etc.

Jason

