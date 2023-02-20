Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7905C69C3E6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 02:06:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKklZ2f4Yz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 12:06:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XslnKyUE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKkcp3RGPz3bVK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 12:00:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XslnKyUE;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKkcZ5RDfz4x81;
	Mon, 20 Feb 2023 12:00:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676854853;
	bh=F/BA55hncJJcUXKiAlKImZaWKF9J7v8lLnKr9dq21p4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XslnKyUEjBPQ1U1pxlZfaOackH5Uc53v2LGKi4H/fZCzwS12mRxSKUo5Y0d1NKeZn
	 awyroz/jmv/ppUpYp1TDhtbm3Xr2UbxbQ7SLm7HpIZR367un5O+1m6RO8MFNGLc4tN
	 bOsgsJ/QSRuN9qLOaQNEAnGHLCgJYRh2AmA+hh1/q0GxiYmMbgWuXckkgvhyXESi3z
	 pkyDk+R2FxF/Bbq8WxwITYwB8LWISeRkdVED0wYKG14B7OppQx/VBH6ejWIfX4nrhf
	 +DPFJJxnIwj6xY4eD5/CyK6ZQt6qJeWIa8XOq0dKk/I3y+LAhnFdM5gYPtu4P26I4l
	 sm8Hu7By7kuYg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>, x86@kernel.org, "H . Peter
 Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski
 <luto@kernel.org>, Balbir Singh <bsingharora@gmail.com>, Borislav Petkov
 <bp@alien8.de>, Cyrill Gorcunov <gorcunov@gmail.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Eugene Syromiatnikov <esyr@redhat.com>,
 Florian Weimer <fweimer@redhat.com>, "H . J . Lu" <hjl.tools@gmail.com>,
 Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, Kees Cook
 <keescook@chromium.org>, Mike Kravetz <mike.kravetz@oracle.com>, Nadav
 Amit <nadav.amit@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Pavel Machek
 <pavel@ucw.cz>, Peter Zijlstra <peterz@infradead.org>, Randy Dunlap
 <rdunlap@infradead.org>, Weijiang Yang <weijiang.yang@intel.com>, "Kirill
 A . Shutemov" <kirill.shutemov@linux.intel.com>, John Allen
 <john.allen@amd.com>, kcc@google.com, eranian@google.com, rppt@kernel.org,
 jamorris@linux.microsoft.com, dethoma@microsoft.com,
 akpm@linux-foundation.org, Andrew.Cooper3@citrix.com,
 christina.schimpe@intel.com, david@redhat.com, debug@rivosinc.com
Subject: Re: [PATCH v6 13/41] mm: Make pte_mkwrite() take a VMA
In-Reply-To: <20230218211433.26859-14-rick.p.edgecombe@intel.com>
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-14-rick.p.edgecombe@intel.com>
Date: Mon, 20 Feb 2023 12:00:46 +1100
Message-ID: <875ybxywu9.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 20 Feb 2023 12:06:04 +1100
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
Cc: linux-s390@vger.kernel.org, Michal Simek <monstr@monstr.eu>, rick.p.edgecombe@intel.com, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rick Edgecombe <rick.p.edgecombe@intel.com> writes:
> The x86 Control-flow Enforcement Technology (CET) feature includes a new
> type of memory called shadow stack. This shadow stack memory has some
> unusual properties, which requires some core mm changes to function
> properly.
...
> ---
> Hi Non-x86 Arch=E2=80=99s,
>
> x86 has a feature that allows for the creation of a special type of
> writable memory (shadow stack) that is only writable in limited specific
> ways. Previously, changes were proposed to core MM code to teach it to
> decide when to create normally writable memory or the special shadow stack
> writable memory, but David Hildenbrand suggested[0] to change
> pXX_mkwrite() to take a VMA, so awareness of shadow stack memory can be
> moved into x86 code.
>
> Since pXX_mkwrite() is defined in every arch, it requires some tree-wide
> changes. So that is why you are seeing some patches out of a big x86
> series pop up in your arch mailing list. There is no functional change.
> After this refactor, the shadow stack series goes on to use the arch
> helpers to push shadow stack memory details inside arch/x86.
...
> ---
>  Documentation/mm/arch_pgtable_helpers.rst    |  9 ++++++---
>  arch/alpha/include/asm/pgtable.h             |  6 +++++-
>  arch/arc/include/asm/hugepage.h              |  2 +-
>  arch/arc/include/asm/pgtable-bits-arcv2.h    |  7 ++++++-
>  arch/arm/include/asm/pgtable-3level.h        |  7 ++++++-
>  arch/arm/include/asm/pgtable.h               |  2 +-
>  arch/arm64/include/asm/pgtable.h             |  4 ++--
>  arch/csky/include/asm/pgtable.h              |  2 +-
>  arch/hexagon/include/asm/pgtable.h           |  2 +-
>  arch/ia64/include/asm/pgtable.h              |  2 +-
>  arch/loongarch/include/asm/pgtable.h         |  4 ++--
>  arch/m68k/include/asm/mcf_pgtable.h          |  2 +-
>  arch/m68k/include/asm/motorola_pgtable.h     |  6 +++++-
>  arch/m68k/include/asm/sun3_pgtable.h         |  6 +++++-
>  arch/microblaze/include/asm/pgtable.h        |  2 +-
>  arch/mips/include/asm/pgtable.h              |  6 +++---
>  arch/nios2/include/asm/pgtable.h             |  2 +-
>  arch/openrisc/include/asm/pgtable.h          |  2 +-
>  arch/parisc/include/asm/pgtable.h            |  6 +++++-
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  4 ++--
>  arch/powerpc/include/asm/nohash/32/pgtable.h |  2 +-
>  arch/powerpc/include/asm/nohash/32/pte-8xx.h |  2 +-
>  arch/powerpc/include/asm/nohash/64/pgtable.h |  2 +-

Looks like you discovered the joys of ppc's at-least 5 different MMU
implementations, sorry :)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
