Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DB888F871
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 08:16:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NAmN/m71;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4vwx1Wfxz3vdp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 18:16:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NAmN/m71;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4vwC6v5Rz3vbP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 18:16:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77550CE2936;
	Thu, 28 Mar 2024 07:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A23C433F1;
	Thu, 28 Mar 2024 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711610168;
	bh=r1JsHv6zvguqW90jyEY0U/U4DMDGMKwYQjCJCqIjmk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NAmN/m71xn3ib012g07l8sC+gyJIzFt9fFK3jdDigIHga4g8Fy0g4u0A9zMTn2G8y
	 Hz/ArW+aqXuqTPb2fPpftu20+1RkDRzP/XFJQhHXJMj8KYnoe5TCRWhoGwSsNg3v4T
	 H3jfZDkvrEoo5QMLri7RoQDmFW3FyBYt4qgxPfkHDpAB+8Ajo8fibnxufZyqfjrguR
	 dBNlncXj4g94p9pzTUeGHFe+ZO+Z9/1/QE5YeVvQ97AoXIN+LsdR2yhA69cvKvdLXt
	 K7hfz3k4p687HCWjsBvcGXgtiDBmENV6h+EZI1V7LNtQhQ+nyZGFPEfci2N6376cIj
	 b9N3P6mb8dHLA==
Date: Thu, 28 Mar 2024 09:15:20 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RFC 0/3] mm/gup: consistently call it GUP-fast
Message-ID: <ZgUZCBNloC-grPWJ@kernel.org>
References: <20240327130538.680256-1-david@redhat.com>
 <ZgQ5hNltQ2DHQXps@x1n>
 <3922460a-4d01-4ecb-b8c5-7c57fd46f3fd@redhat.com>
 <dc1433ea-4e59-4ab7-83fb-23b393020980@app.fastmail.com>
 <3360dba8-0fac-4126-b72b-abc036957d6a@kernel.org>
 <10da3ced-9a79-4ebb-a77d-1aa49cc61952@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10da3ced-9a79-4ebb-a77d-1aa49cc61952@app.fastmail.com>
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, Ryan Roberts <ryan.roberts@arm.com>, loongarch@lists.linux.dev, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, linux-sh@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>, linux-kernel@vger.kernel.org, peterx <peterx@redhat.com>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Vineet Gupta <vgupta@kernel.org>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Matt Turner <mattst88@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 28, 2024 at 07:09:13AM +0100, Arnd Bergmann wrote:
> On Thu, Mar 28, 2024, at 06:51, Vineet Gupta wrote:
> > On 3/27/24 09:22, Arnd Bergmann wrote:
> >> On Wed, Mar 27, 2024, at 16:39, David Hildenbrand wrote:
> >>> On 27.03.24 16:21, Peter Xu wrote:
> >>>> On Wed, Mar 27, 2024 at 02:05:35PM +0100, David Hildenbrand wrote:
> >>>>
> >>>> I'm not sure what config you tried there; as I am doing some build tests
> >>>> recently, I found turning off CONFIG_SAMPLES + CONFIG_GCC_PLUGINS could
> >>>> avoid a lot of issues, I think it's due to libc missing.  But maybe not the
> >>>> case there.
> >>> CCin Arnd; I use some of his compiler chains, others from Fedora directly. For
> >>> example for alpha and arc, the Fedora gcc is "13.2.1".
> >>> But there is other stuff like (arc):
> >>>
> >>> ./arch/arc/include/asm/mmu-arcv2.h: In function 'mmu_setup_asid':
> >>> ./arch/arc/include/asm/mmu-arcv2.h:82:9: error: implicit declaration of 
> >>> function 'write_aux_reg' [-Werro
> >>> r=implicit-function-declaration]
> >>>     82 |         write_aux_reg(ARC_REG_PID, asid | MMU_ENABLE);
> >>>        |         ^~~~~~~~~~~~~
> >> Seems to be missing an #include of soc/arc/aux.h, but I can't
> >> tell when this first broke without bisecting.
> >
> > Weird I don't see this one but I only have gcc 12 handy ATM.
> >
> >     gcc version 12.2.1 20230306 (ARC HS GNU/Linux glibc toolchain -
> > build 1360)
> >
> > I even tried W=1 (which according to scripts/Makefile.extrawarn) should
> > include -Werror=implicit-function-declaration but don't see this still.
> >
> > Tomorrow I'll try building a gcc 13.2.1 for ARC.
> 
> David reported them with the toolchains I built at
> https://mirrors.edge.kernel.org/pub/tools/crosstool/
> I'm fairly sure the problem is specific to the .config
> and tree, not the toolchain though.

This happens with defconfig and both gcc 12.2.0 and gcc 13.2.0 from your
crosstools. I also see these on the current Linus' tree:

arc/kernel/ptrace.c:342:16: warning: no previous prototype for 'syscall_trace_enter' [-Wmissing-prototypes]
arch/arc/kernel/kprobes.c:193:15: warning: no previous prototype for 'arc_kprobe_handler' [-Wmissing-prototypes]

This fixed the warning about write_aux_reg for me, probably Vineet would
want this include somewhere else...

diff --git a/arch/arc/include/asm/mmu-arcv2.h b/arch/arc/include/asm/mmu-arcv2.h
index ed9036d4ede3..0fca342d7b79 100644
--- a/arch/arc/include/asm/mmu-arcv2.h
+++ b/arch/arc/include/asm/mmu-arcv2.h
@@ -69,6 +69,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <asm/arcregs.h>
+
 struct mm_struct;
 extern int pae40_exist_but_not_enab(void);
 
 
> >>> or (alpha)
> >>>
> >>> WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
> >>> ERROR: modpost: "memcpy" [fs/reiserfs/reiserfs.ko] undefined!
> >>> ERROR: modpost: "memcpy" [fs/nfs/nfs.ko] undefined!
> >>> ERROR: modpost: "memcpy" [fs/nfs/nfsv3.ko] undefined!
> >>> ERROR: modpost: "memcpy" [fs/nfsd/nfsd.ko] undefined!
> >>> ERROR: modpost: "memcpy" [fs/lockd/lockd.ko] undefined!
> >>> ERROR: modpost: "memcpy" [crypto/crypto.ko] undefined!
> >>> ERROR: modpost: "memcpy" [crypto/crypto_algapi.ko] undefined!
> >>> ERROR: modpost: "memcpy" [crypto/aead.ko] undefined!
> >>> ERROR: modpost: "memcpy" [crypto/crypto_skcipher.ko] undefined!
> >>> ERROR: modpost: "memcpy" [crypto/seqiv.ko] undefined!
> >
> > Are these from ARC build or otherwise ?
> 
> This was arch/alpha.
> 
>       Arnd

-- 
Sincerely yours,
Mike.
