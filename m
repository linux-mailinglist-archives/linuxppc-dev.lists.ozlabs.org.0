Return-Path: <linuxppc-dev+bounces-13882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794A1C3B3B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 14:33:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2NRf1HwJz2ySP;
	Fri,  7 Nov 2025 00:33:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762435982;
	cv=none; b=FI+Iseq+9eu8r8/41+g4998JY/LzdvDrgsaBxum/96tSvnilfmrfnyfg8l447GZzZ6EGHfFLXkaDx3bLiwBYFlMyJOQRfuVTdZJi/Ath41mvAnOWzUi8nesyaQT2ZJM5nyJ2I7vuRk2fcimrau/M31I7gp58gdMGVssKQ4ABp1PfCu+kp9WlHOzDTifxZMj78OaTmZp7b/w54v+wS9uIZh5R1TKuQLjWc8u1i6blAAN8AGW2LH32B0qyRr1BlqKQVKwGTXgJCdKSnBkJ7PPgshxrqCWX4ZpAspHFHcQEHByRx9FoxkkeALwpPnhgf3blvqX6lLapOTsz5qbdQrncZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762435982; c=relaxed/relaxed;
	bh=/sYkiyBWZv/gdDO2SH4rhBeTgqDXK9+UcXf3Mn8ccUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UH/oRCTf1ePl3DXXMlT3uI3W1dXCafXJEb0sgaAEzO9cJZWi+btdf08MehYnij5pTvjyGHayjsd7RAyFPpnZ254uRSL2q+Hgrb26X4yhMbBYGCZ+V/+igmyZwpFGtx2nLLYNKtNdwqu2UBEaXD2eQFE55X8KljkQxOaFOwqnaPkskCgOW6lmtk5yV04/7Eksh7cWD0Ay5QLE71kncOzX8GU/r7WOaZdT037jBMXQjgvVHW7nZlvQsxFu5n9i4lwZj4sCG8jLZqbabgsK1K8orVN7x3s6nneHHH8P6Gw5U9+ZRMt1aRcXPz4R61TUlVLfNJ113IFQarq1fKG1S26bMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XS5vcpYs; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=h2lJfuFW; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XS5vcpYs;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=h2lJfuFW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2NRd1h8Bz2xR2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 00:33:01 +1100 (AEDT)
Date: Thu, 6 Nov 2025 14:32:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762435976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sYkiyBWZv/gdDO2SH4rhBeTgqDXK9+UcXf3Mn8ccUU=;
	b=XS5vcpYsyAxNvRXOzuV5hRb/nQgFMLuPJMVo17+GbZKgOVszq7TxXwgPILyevsEeD41fRn
	qOecx6vaBm+bot7gT0OvheUUOzSI/pCShMR7tGzNjWpRHVrPUfjroThu/dYpXsZWlxaEeV
	xJ5xEAUZvXg5zU2IycYwgMGtSJLdOOxj/L6FphMysTTnqID+uvpkGIepHgdU3dYJMYHK0D
	NqmpgjE3ZZBGM791NCYCLB4PlFTInSDtb+xizEDEsMjUL1/vQ2L3uOAXQyBpRCYcmc1FsI
	2+nm2NpDf8vOD6oEAqJpBSUip2moNPpLvHwoBacGawqj3f0ZCv3Emz/VsYjdKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762435976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sYkiyBWZv/gdDO2SH4rhBeTgqDXK9+UcXf3Mn8ccUU=;
	b=h2lJfuFW33gCMREswtFH2osl5Sj9f2XsBF94AxG8++SjialvXzh6EqV+QL44v58SNQ52NN
	ToDU5p9Dbx2lwbCA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Nick Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King <linux@armlinux.org.uk>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com, 
	Ryan.Roberts@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <20251106142956-d6251eba-c696-4a2f-a3e3-af461530d932@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
 <aQyig5TNkw2YJm19@finisterre.sirena.org.uk>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQyig5TNkw2YJm19@finisterre.sirena.org.uk>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Mark,

On Thu, Nov 06, 2025 at 01:28:35PM +0000, Mark Brown wrote:
> On Tue, Nov 04, 2025 at 09:44:38AM +0100, Marek Szyprowski wrote:
> > On 03.11.2025 16:24, Mark Brown wrote:
> > > On Tue, Oct 14, 2025 at 08:49:09AM +0200, Thomas Weißschuh wrote:
> 
> Copying in Ryan Roberts who's much more likely to have some idea about
> memory management stuff for arm64 than I am (I have been poking at this
> a bit but not got anywhere notable).  Not deleting context for his
> benefit.

It turned out not even to be an mm problem.
Instead the data pages were not zeroed out on allocation.

> Given that this issue is very disruptive to userspace it's causing us to
> miss huge amounts of test coverage for -next, would it be possible to
> drop these patches until we resolve the issue?

This issue and the observed panics should be fixed in v5 of the series:
https://lore.kernel.org/lkml/20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de/

I'll ping tglx directly.

(...)


Thomas

