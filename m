Return-Path: <linuxppc-dev+bounces-13721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1608BC30196
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 09:58:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d12SB2Kkyz3bfN;
	Tue,  4 Nov 2025 19:58:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762246730;
	cv=none; b=WZ4s0Q7wwilsh1aTQHhNt0uoXBnXC2ilKnDfoh6YXsRnUySkMsgNn1VM5cfAo2BO5PXp3QUT5pBUJzPW2OCuGhrciGdtP2DBup+u/gKNRq4CuthLARWFHt4ljbQa/NOI6Y2w8XvqSciAve1Mu7yptK7fCGH7+KRJyY9y0bWJrP5DTUGihXl1xrbebsOQUcBQX5y3d99W9NewDHPqhp0r7BftwJ2qtcX6tQKIXG5czAx5yrHz5qQjw68xgwhjnI/4sUyN6xPMpOc9TAAAfbZdcCMizq8tX9/+0eGs06d+KkCusU/xlwFkYto0ZHWRljN5xPEuxtxmK/5i0CHRNdw1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762246730; c=relaxed/relaxed;
	bh=C0LvKOhhmgkPbAnJv9RUevotOR4DI1Uoh5ENCeo7njA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmF9K/w9vS+A00VZI518CvOvoN4lSPie5vz6Yv9gHT3ap5BYUGZ3ZW2tByxg8CljMPqREBWIBxTivX74dlTBmt96fY1sr7QP1Pc2sNRV8PsMkDmHSc75FbEiMAXH0IE/Cf3FCQVg4z2VCOAa34b6oZFHrczZ6WZ9YNQbLCB9TtLlbHIUH+rUvC41LkkFdyLoBvCbVdHS6Cs9tpcVeXV3N8W/iZXindk3LiddQujysQiAV71iO/hn18vbc5StB2KzHUA3MvRsTE80XEZ9HHVKEOpqRsoxjmgd8fOG9One8LdBYxlPFGCeuVriHZMgItWPLPcwHUBVhVy5sNRkQNkcew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PCKNJxul; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AYbRVmwT; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PCKNJxul;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AYbRVmwT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d12S83CHkz2yjq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 19:58:48 +1100 (AEDT)
Date: Tue, 4 Nov 2025 09:58:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762246719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C0LvKOhhmgkPbAnJv9RUevotOR4DI1Uoh5ENCeo7njA=;
	b=PCKNJxulpg/PvsGYBz8V1FU4pIkAMexataoGH0wB1Wq12nZZHH8f2DwldZBJQaarAJVsP8
	yusjtIDWmV+OdYsTjKunNaFJcWiiyhHX6oDRiKaBNw6mbt6vWYMefNn74zwVvtcQNanAb/
	sFKjzpbAdgHOKh9I1DfB1uxqKlG9OH5OjQWRzQk9ok7MeccZ7XACWEaO4CMbje+8IR5FNE
	ksy6MxBeFin8cOh8nSGbd7sgJ1u4+BFBLgtkTy0AC0nIyqKnVIQCZ0PrgpFKDWnHjNm1K5
	thTLlUN+ZyklfklQSZjodwcMM1QHkniqB323QaFPf3lG/gDXH1KQ8B2yVTGLvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762246719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C0LvKOhhmgkPbAnJv9RUevotOR4DI1Uoh5ENCeo7njA=;
	b=AYbRVmwTnBF9DHCl3zSORA5EBbeymIDmU5LN0MCGPkSaFq3DfisSLGnmVmNwMSYywgJ4+e
	uTDyt4qZNgxw5dDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
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
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <20251104095555-ed009488-3aa8-43c5-b39f-066f04dee5a3@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
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
In-Reply-To: <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Marek,

On Tue, Nov 04, 2025 at 09:44:38AM +0100, Marek Szyprowski wrote:
> On 03.11.2025 16:24, Mark Brown wrote:
> > On Tue, Oct 14, 2025 at 08:49:09AM +0200, Thomas Weißschuh wrote:
> >
> >> An upcoming change will allocate the datapages dynamically instead of as
> >> part of the kernel image. Such pages can only be mapped through
> >> 'struct page' and not through PFNs.
> > I'm seeing some boot failures on some arm64 platforms in -next which are
> > bisecting to this patch in -next.  Unfortunately the diagnostics aren't
> > super useful, we seem to just stop making progress in userspace with no
> > obvious output.  One sample log from the FVP is:

(...)

> Then I've tested it on ARM64bit (RaspberrryPi3b+ board) and got the 
> following panic on 6a011a228293 ("vdso/datastore: Map pages through 
> struct page") commit:
> 
> VFS: Mounted root (ext4 filesystem) on device 179:3. Trying to move old 
> root to /initrd ... okay devtmpfs: mounted Freeing unused kernel memory: 
> 12672K Run /sbin/init as init process Unable to handle kernel paging 
> request at virtual address ffffffffc20b5d48 Mem abort info: ESR = 
> 0x0000000096000006 EC = 0x25: DABT (current EL), IL = 32 bits SET = 0, 
> FnV = 0 EA = 0, S1PTW = 0 FSC = 0x06: level 2 translation fault Data 
> abort info: ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000 CM = 0, WnR = 
> 0, TnD = 0, TagAccess = 0 GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0 
> swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000000230b000 
> [ffffffffc20b5d48] pgd=0000000000000000, p4d=0000000003618403, 
> pud=0000000003619403, pmd=0000000000000000 Internal error: Oops: 
> 0000000096000006 [#1] SMP Modules linked in: CPU: 2 UID: 0 PID: 1 Comm: 
> init Tainted: G W 6.18.0-rc1+ #16136 PREEMPT Tainted: [W]=WARN Hardware 
> name: Raspberry Pi 3 Model B (DT) pstate: 80000005 (Nzcv daif -PAN -UAO 
> -TCO -DIT -SSBS BTYPE=--) pc : vvar_fault+0x7c/0x17c lr : 
> vvar_fault+0x24/0x17c ... Call trace: vvar_fault+0x7c/0x17c (P) 
> special_mapping_fault+0x24/0xd0 __do_fault+0x3c/0x238 
> __handle_mm_fault+0xaa0/0x19e0 handle_mm_fault+0xcc/0x384 
> do_page_fault+0x1a0/0x720 do_translation_fault+0x60/0x6c 
> do_mem_abort+0x44/0x94 el0_da+0x54/0x230 el0t_64_sync_handler+0xd0/0xe4 
> el0t_64_sync+0x198/0x19c Code: f2d83fe0 8b010063 d34cfc63 8b031803 
> (f9400461) ---[ end trace 0000000000000000 ]--- Kernel panic - not 
> syncing: Attempted to kill init! exitcode=0x0000000b SMP: stopping 
> secondary CPUs Kernel Offset: disabled CPU features: 
> 0x000000,00180000,40004000,0400421b Memory Limit: none ---[ end Kernel 
> panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
> 
> Reverting "clocksource: Remove ARCH_CLOCKSOURCE_DATA", "vdso/datastore: 
> Allocate data pages dynamically" and "vdso/datastore: Map pages through 
> struct page" on top of linux-next fixes booting on all tested boards.

Thanks for the report. I have a Raspberry Pi 3 Model B V1.2 here and will try
to reproduce the issue with it.
Can you send me your kernel configuration?
Which line is vvar_fault+0x7c/0x17c?


Thomas

