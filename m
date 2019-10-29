Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB849E91FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 22:23:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472l1l5s4hzF38r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 08:23:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="kjmJ2PRc";
 dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472kq15gFRzF34T
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 08:14:05 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id b128so2568pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=tvuo3Ns0E4Fiim71b6F+/V34tv+uW7W3PecAxYDk1kI=;
 b=kjmJ2PRco2QbnnQ6/Lb5HykXKFCW8bMSMkr+JBAd0YCZqAHZUBgyl2XlQchiLsBsZA
 VWyGFqzEFLvF5puyLHdyKCM+5hmQj5PuueBjIKUK8Jn2QPWeJZWfexDjBm6I6dRaBLQj
 uENAgaybqP2QWV47BGcYFOi14iqWSDuRPGxb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tvuo3Ns0E4Fiim71b6F+/V34tv+uW7W3PecAxYDk1kI=;
 b=iT5knx2fMzn1knmhYQXULKqmKodsTQykiUhv/FAOMps+igaPwybtnetDweaaW0zHC+
 XDc8hma+FxQJOO6pGKDZMQnqUtJNPXMHXgtjaDLtTlkj1bcI9ZfclNzZR1rSyZoxz+Is
 rAFBfjghcVDcEu7SPYnnzwOvafWbK+muDKFyQxxoMuKipidv3ltjXCOzeTLvOKyeR2x1
 KN4qxwy1ElZsAXojfb5WZ6bk/sk9AKn5S4tW+9fTBj9Kz4r0E51qhsEjrCg2JqGYlKA5
 o9L8g/fDM1WofxcKKTIuHJNFzsy5qj69C/ghh59uWATDhSkZM68ABqayVVtnFSkopdPr
 RLaw==
X-Gm-Message-State: APjAAAVXh2AJCc67N9zF9jp3pCraMAb1wnZwt9I1l6TiAsf+JcXOkACB
 SCUMWG4BJT70Eqmlh+ay8shAEg==
X-Google-Smtp-Source: APXvYqxG6K5OnJmD5FS0dzSHIwPfA6+/IkLP3MyheBThwDhBc+0h1IEDuELusvnpNyG3iWLjyHi91w==
X-Received: by 2002:a63:471b:: with SMTP id u27mr28891174pga.96.1572383642989; 
 Tue, 29 Oct 2019 14:14:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x7sm51799pff.0.2019.10.29.14.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 14:14:00 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v3 00/29] vmlinux.lds.h: Refactor EXCEPTION_TABLE and NOTES
Date: Tue, 29 Oct 2019 14:13:22 -0700
Message-Id: <20191029211351.13243-1-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Andy Lutomirski <luto@kernel.org>,
 linux-alpha@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arch maintainers: please send Acks (if you haven't already) for your
respective linker script changes; the intention is for this series to land
via -tip. See patch #1 for an extended rationale for the "note" vs "notes"
naming. If "notes" is strongly desired, we can perform that change on
top of this series. For now, I prefer to leave things as they were in v2.

v3: Add new Acks, clarify "note" vs "notes" renaming
v2: https://lore.kernel.org/lkml/20191011000609.29728-1-keescook@chromium.org
v1: https://lore.kernel.org/lkml/20190926175602.33098-1-keescook@chromium.org


This series works to move the linker sections for NOTES and
EXCEPTION_TABLE into the RO_DATA area, where they belong on most
(all?) architectures. The problem being addressed was the discovery
by Rick Edgecombe that the exception table was accidentally marked
executable while he was developing his execute-only-memory series. When
permissions were flipped from readable-and-executable to only-executable,
the exception table became unreadable, causing things to explode rather
badly. :)

Roughly speaking, the steps are:

- regularize the linker names for PT_NOTE and PT_LOAD program headers
  (to "note" and "text" respectively)
- regularize restoration of linker section to program header assignment
  (when PT_NOTE exists)
- move NOTES into RO_DATA
- finish macro naming conversions for RO_DATA and RW_DATA
- move EXCEPTION_TABLE into RO_DATA on architectures where this is clear
- clean up some x86-specific reporting of kernel memory resources
- switch x86 linker fill byte from x90 (NOP) to 0xcc (INT3), just because
  I finally realized what that trailing ": 0x9090" meant -- and we should
  trap, not slide, if execution lands in section padding

Thanks!

-Kees


Kees Cook (29):
  powerpc: Rename "notes" PT_NOTE to "note"
  powerpc: Remove PT_NOTE workaround
  powerpc: Rename PT_LOAD identifier "kernel" to "text"
  alpha: Rename PT_LOAD identifier "kernel" to "text"
  ia64: Rename PT_LOAD identifier "code" to "text"
  s390: Move RO_DATA into "text" PT_LOAD Program Header
  x86: Restore "text" Program Header with dummy section
  vmlinux.lds.h: Provide EMIT_PT_NOTE to indicate export of .notes
  vmlinux.lds.h: Move Program Header restoration into NOTES macro
  vmlinux.lds.h: Move NOTES into RO_DATA
  vmlinux.lds.h: Replace RODATA with RO_DATA
  vmlinux.lds.h: Replace RO_DATA_SECTION with RO_DATA
  vmlinux.lds.h: Replace RW_DATA_SECTION with RW_DATA
  vmlinux.lds.h: Allow EXCEPTION_TABLE to live in RO_DATA
  x86: Actually use _etext for end of text segment
  x86: Move EXCEPTION_TABLE to RO_DATA segment
  alpha: Move EXCEPTION_TABLE to RO_DATA segment
  arm64: Move EXCEPTION_TABLE to RO_DATA segment
  c6x: Move EXCEPTION_TABLE to RO_DATA segment
  h8300: Move EXCEPTION_TABLE to RO_DATA segment
  ia64: Move EXCEPTION_TABLE to RO_DATA segment
  microblaze: Move EXCEPTION_TABLE to RO_DATA segment
  parisc: Move EXCEPTION_TABLE to RO_DATA segment
  powerpc: Move EXCEPTION_TABLE to RO_DATA segment
  xtensa: Move EXCEPTION_TABLE to RO_DATA segment
  x86/mm: Remove redundant &s on addresses
  x86/mm: Report which part of kernel image is freed
  x86/mm: Report actual image regions in /proc/iomem
  x86: Use INT3 instead of NOP for linker fill bytes

 arch/alpha/kernel/vmlinux.lds.S      | 18 +++++-----
 arch/arc/kernel/vmlinux.lds.S        |  6 ++--
 arch/arm/kernel/vmlinux-xip.lds.S    |  4 +--
 arch/arm/kernel/vmlinux.lds.S        |  4 +--
 arch/arm64/kernel/vmlinux.lds.S      | 10 +++---
 arch/c6x/kernel/vmlinux.lds.S        |  8 ++---
 arch/csky/kernel/vmlinux.lds.S       |  5 ++-
 arch/h8300/kernel/vmlinux.lds.S      |  9 ++---
 arch/hexagon/kernel/vmlinux.lds.S    |  5 ++-
 arch/ia64/kernel/vmlinux.lds.S       | 20 +++++------
 arch/m68k/kernel/vmlinux-nommu.lds   |  4 +--
 arch/m68k/kernel/vmlinux-std.lds     |  2 +-
 arch/m68k/kernel/vmlinux-sun3.lds    |  2 +-
 arch/microblaze/kernel/vmlinux.lds.S |  8 ++---
 arch/mips/kernel/vmlinux.lds.S       | 15 ++++----
 arch/nds32/kernel/vmlinux.lds.S      |  5 ++-
 arch/nios2/kernel/vmlinux.lds.S      |  5 ++-
 arch/openrisc/kernel/vmlinux.lds.S   |  7 ++--
 arch/parisc/kernel/vmlinux.lds.S     | 11 +++---
 arch/powerpc/kernel/vmlinux.lds.S    | 37 ++++---------------
 arch/riscv/kernel/vmlinux.lds.S      |  5 ++-
 arch/s390/kernel/vmlinux.lds.S       | 12 +++----
 arch/sh/kernel/vmlinux.lds.S         |  3 +-
 arch/sparc/kernel/vmlinux.lds.S      |  3 +-
 arch/um/include/asm/common.lds.S     |  3 +-
 arch/unicore32/kernel/vmlinux.lds.S  |  5 ++-
 arch/x86/include/asm/processor.h     |  2 +-
 arch/x86/include/asm/sections.h      |  1 -
 arch/x86/kernel/setup.c              | 12 ++++++-
 arch/x86/kernel/vmlinux.lds.S        | 16 ++++-----
 arch/x86/mm/init.c                   |  8 ++---
 arch/x86/mm/init_64.c                | 16 +++++----
 arch/x86/mm/pti.c                    |  2 +-
 arch/xtensa/kernel/vmlinux.lds.S     |  8 ++---
 include/asm-generic/vmlinux.lds.h    | 53 ++++++++++++++++++++--------
 35 files changed, 159 insertions(+), 175 deletions(-)

-- 
2.17.1

