Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F86477A9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 18:30:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFJzp6j81z3cQs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 04:30:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=stRLUHqw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=stRLUHqw; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFJz66PGPz2x9p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 04:30:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5DAB61EF1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 17:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32236C36AEF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 17:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639675804;
 bh=sZED9o+V6DY8SMm+Vs6+SPM0L4+1UTJmGboG9qTGk/k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=stRLUHqwLyT07u5d2VSxOhxZBV3bsBtZalCpfSphVcISqhzj6n+2QZ2jO7F9RKpzz
 K52ThKpirPpVakER15ZLZWx9H8cAT8Fvb6GDbFkkE5CYqIreQaW/o/otUT4+ECptvp
 oOJbZhWqcBCU51ySqa+peum2d0uxf21jEJ4f8tKM/XQri/FGW4TEhJrUxBbeK606Ba
 9x6OFMr74IiB5DpjwbVUTW5X0EpVi3zXX577GVnP3PFPqzGc+ozn/OgN8HxY3ikkG+
 0B149Sr/kicek4p+oC1uGGtGxYtz3JnV9khCPHfeF8ezURRS2sSoBaVxom+8LX8PBr
 DzbRBQxhfKAFw==
Received: by mail-wm1-f53.google.com with SMTP id
 n14-20020a7bcbce000000b00332f4abf43fso1772723wmi.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 09:30:04 -0800 (PST)
X-Gm-Message-State: AOAM533lL0AkX+Ihf5iWqJBwJaS3ZDgenyl8js+pVkcqglbmZsfoZhrk
 dQ7zFVLzcJNY05x1OB6qFrpbCBdmeU9I/luo0ec=
X-Google-Smtp-Source: ABdhPJzp0SU8actyldrvzX1x50riwocCH+uUo3Sc9tTPSiAj2RkG6W8raN6crfSV4FfRoxzwjsmq9fCJPMFefPzOiEI=
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr5945559wmq.32.1639675791707; 
 Thu, 16 Dec 2021 09:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20210514100106.3404011-1-arnd@kernel.org>
In-Reply-To: <20210514100106.3404011-1-arnd@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 16 Dec 2021 18:29:40 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG0CNomZ0aXxh_4094fT+g4bVWFCkrd7QwgTQgiqoxMWA@mail.gmail.com>
Message-ID: <CAMj1kXG0CNomZ0aXxh_4094fT+g4bVWFCkrd7QwgTQgiqoxMWA@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] Unify asm/unaligned.h around struct helper
To: Arnd Bergmann <arnd@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 johannes@sipsolutions.net, 
 Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Amitkumar Karwar <amitkarwar@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arch <linux-arch@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, X86 ML <x86@kernel.org>,
 James Morris <jmorris@namei.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Richard Russon \(FlatCap\)" <ldm@flatcap.org>,
 Jakub Kicinski <kuba@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>,
 Ganapathi Bhat <ganapathi017@gmail.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-block@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Stafford Horne <shorne@gmail.com>, Kalle Valo <kvalo@codeaurora.org>,
 Jens Axboe <axboe@kernel.dk>, John Johansen <john.johansen@canonical.com>,
 Xinming Hu <huxinming820@gmail.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-ntfs-dev@lists.sourceforge.net, linux-security-module@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

(replying to an old thread as this came up in the discussion regarding
misaligned loads and stored in siphash() when compiled for ARM
[f7e5b9bfa6c8820407b64eabc1f29c9a87e8993d])

On Fri, 14 May 2021 at 12:02, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The get_unaligned()/put_unaligned() helpers are traditionally architecture
> specific, with the two main variants being the "access-ok.h" version
> that assumes unaligned pointer accesses always work on a particular
> architecture, and the "le-struct.h" version that casts the data to a
> byte aligned type before dereferencing, for architectures that cannot
> always do unaligned accesses in hardware.
>
> Based on the discussion linked below, it appears that the access-ok
> version is not realiable on any architecture, but the struct version
> probably has no downsides. This series changes the code to use the
> same implementation on all architectures, addressing the few exceptions
> separately.
>
> I've included this version in the asm-generic tree for 5.14 already,
> addressing the few issues that were pointed out in the RFC. If there
> are any remaining problems, I hope those can be addressed as follow-up
> patches.
>

I think this series is a huge improvement, but it does not solve the
UB problem completely. As we found, there are open issues in the GCC
bugzilla regarding assumptions in the compiler that aligned quantities
either overlap entirely or not at all. (e.g.,
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100363)

CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is used in many places to
conditionally emit code that violates C alignment rules. E.g., there
is this example in Documentation/core-api/unaligned-memory-access.rst:

bool ether_addr_equal(const u8 *addr1, const u8 *addr2)
{
#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
  u32 fold = ((*(const u32 *)addr1) ^ (*(const u32 *)addr2)) |
             ((*(const u16 *)(addr1 + 4)) ^ (*(const u16 *)(addr2 + 4)));
  return fold == 0;
#else
...

(which now deviates from its actual implementation, but the point is
the same) where CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is used in the
wrong way (IMHO).

The pattern seems to be

#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
  // ignore alignment rules, just cast to a more aligned pointer type
#else
  // use unaligned accessors, which could be either cheap or expensive,
  // depending on the architecture
#endif

whereas the following pattern makes more sense, I think, and does not
violate any C rules in the common case:

#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
  // use unaligned accessors, which are cheap or even entirely free
#else
  // avoid unaligned accessors, as they are expensive; instead, reorganize
  // the data so we don't need them (similar to setting NET_IP_ALIGN to 2)
#endif

The only remaining problem here is reinterpreting a char* pointer to a
u32*, e.g., for accessing the IP address in an Ethernet frame when
NET_IP_ALIGN == 2, which could suffer from the same UB problem again,
as I understand it.

In the 32-bit ARM case (v6+) [which is admittedly an outlier] this
makes a substantial difference, as ARMv6 does have efficient unaligned
accessors (load/store word or halfword may be used on misaligned
addresses) but requires that load/store double-word and load/store
multiple are only used on 32-bit aligned addresses. GCC does the right
thing with the unaligned accessors, but blindly casting away
misalignment may result in alignment traps if the compiler happened to
emit load-double or load-multiple instructions for the memory access
in question.

Jason already verifed that in the siphash() case, the aligned and
unaligned versions of the code actually compile to the same machine
code on x86, as the unaligned accessors just disappear. I suspect this
to be the case for many instances where
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is being used, mostly in the
networking stack.

So I intend to dig a bit deeper into this, and perhaps propose some
changes where the interpretation of
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is documented more clearly, and
tweaked according to my suggestion above (while ensuring that codegen
does not suffer, of course)

Thoughts, concerns, objections?


--
Ard.




> Link: https://lore.kernel.org/lkml/75d07691-1e4f-741f-9852-38c0b4f520bc@synopsys.com/
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100363
> Link: https://lore.kernel.org/lkml/20210507220813.365382-14-arnd@kernel.org/
> Link: git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git unaligned-rework-v2
>
>
> Arnd Bergmann (13):
>   asm-generic: use asm-generic/unaligned.h for most architectures
>   openrisc: always use unaligned-struct header
>   sh: remove unaligned access for sh4a
>   m68k: select CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
>   powerpc: use linux/unaligned/le_struct.h on LE power7
>   asm-generic: unaligned: remove byteshift helpers
>   asm-generic: unaligned always use struct helpers
>   partitions: msdos: fix one-byte get_unaligned()
>   apparmor: use get_unaligned() only for multi-byte words
>   mwifiex: re-fix for unaligned accesses
>   netpoll: avoid put_unaligned() on single character
>   asm-generic: uaccess: 1-byte access is always aligned
>   asm-generic: simplify asm/unaligned.h
>
>  arch/alpha/include/asm/unaligned.h          |  12 --
>  arch/arm/include/asm/unaligned.h            |  27 ---
>  arch/ia64/include/asm/unaligned.h           |  12 --
>  arch/m68k/Kconfig                           |   1 +
>  arch/m68k/include/asm/unaligned.h           |  26 ---
>  arch/microblaze/include/asm/unaligned.h     |  27 ---
>  arch/mips/crypto/crc32-mips.c               |   2 +-
>  arch/openrisc/include/asm/unaligned.h       |  47 -----
>  arch/parisc/include/asm/unaligned.h         |   6 +-
>  arch/powerpc/include/asm/unaligned.h        |  22 ---
>  arch/sh/include/asm/unaligned-sh4a.h        | 199 --------------------
>  arch/sh/include/asm/unaligned.h             |  13 --
>  arch/sparc/include/asm/unaligned.h          |  11 --
>  arch/x86/include/asm/unaligned.h            |  15 --
>  arch/xtensa/include/asm/unaligned.h         |  29 ---
>  block/partitions/ldm.h                      |   2 +-
>  block/partitions/msdos.c                    |   2 +-
>  drivers/net/wireless/marvell/mwifiex/pcie.c |  10 +-
>  include/asm-generic/uaccess.h               |   4 +-
>  include/asm-generic/unaligned.h             | 141 +++++++++++---
>  include/linux/unaligned/access_ok.h         |  68 -------
>  include/linux/unaligned/be_byteshift.h      |  71 -------
>  include/linux/unaligned/be_memmove.h        |  37 ----
>  include/linux/unaligned/be_struct.h         |  37 ----
>  include/linux/unaligned/generic.h           | 115 -----------
>  include/linux/unaligned/le_byteshift.h      |  71 -------
>  include/linux/unaligned/le_memmove.h        |  37 ----
>  include/linux/unaligned/le_struct.h         |  37 ----
>  include/linux/unaligned/memmove.h           |  46 -----
>  net/core/netpoll.c                          |   4 +-
>  security/apparmor/policy_unpack.c           |   2 +-
>  31 files changed, 131 insertions(+), 1002 deletions(-)
>  delete mode 100644 arch/alpha/include/asm/unaligned.h
>  delete mode 100644 arch/arm/include/asm/unaligned.h
>  delete mode 100644 arch/ia64/include/asm/unaligned.h
>  delete mode 100644 arch/m68k/include/asm/unaligned.h
>  delete mode 100644 arch/microblaze/include/asm/unaligned.h
>  delete mode 100644 arch/openrisc/include/asm/unaligned.h
>  delete mode 100644 arch/powerpc/include/asm/unaligned.h
>  delete mode 100644 arch/sh/include/asm/unaligned-sh4a.h
>  delete mode 100644 arch/sh/include/asm/unaligned.h
>  delete mode 100644 arch/sparc/include/asm/unaligned.h
>  delete mode 100644 arch/x86/include/asm/unaligned.h
>  delete mode 100644 arch/xtensa/include/asm/unaligned.h
>  delete mode 100644 include/linux/unaligned/access_ok.h
>  delete mode 100644 include/linux/unaligned/be_byteshift.h
>  delete mode 100644 include/linux/unaligned/be_memmove.h
>  delete mode 100644 include/linux/unaligned/be_struct.h
>  delete mode 100644 include/linux/unaligned/generic.h
>  delete mode 100644 include/linux/unaligned/le_byteshift.h
>  delete mode 100644 include/linux/unaligned/le_memmove.h
>  delete mode 100644 include/linux/unaligned/le_struct.h
>  delete mode 100644 include/linux/unaligned/memmove.h
>
> --
> 2.29.2
>
> Cc: Amitkumar Karwar <amitkarwar@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ganapathi Bhat <ganapathi017@gmail.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: James Morris <jmorris@namei.org>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: John Johansen <john.johansen@canonical.com>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Rich Felker <dalias@libc.org>
> Cc: "Richard Russon (FlatCap)" <ldm@flatcap.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: Sharvari Harisangam <sharvari.harisangam@nxp.com>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
> Cc: Xinming Hu <huxinming820@gmail.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: x86@kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-crypto@vger.kernel.org
> Cc: openrisc@lists.librecores.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-ntfs-dev@lists.sourceforge.net
> Cc: linux-block@vger.kernel.org
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-security-module@vger.kernel.org
>
>
