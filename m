Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D254D129785
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 15:34:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hMLJ1GWpzDqKh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 01:34:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="cfApg9sH"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hMGg6nhXzDqKh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 01:31:07 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47hMGS5T4sz9txjw;
 Mon, 23 Dec 2019 15:30:56 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cfApg9sH; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NGVhIXcP7bQ8; Mon, 23 Dec 2019 15:30:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47hMGS4B7Wz9txjv;
 Mon, 23 Dec 2019 15:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577111456; bh=yVxuGmQR051J6pETL5q29uPkTsP81kEW/OmeuvlbY/k=;
 h=From:Subject:To:Cc:Date:From;
 b=cfApg9sH1a9HHa55YFyf8L755JhqvakH05NG+R/qHkWzE5LUPrg24rswTt4CXyRyC
 2bhyW8BcRvrp/qnckgOME1s7wI6VFu8a2RSUlLqOrq/21c00ILlXV1sAzj+xe5fgf+
 5bND3VhxVxgMSsmr0NGgo6eGrLt7/vsuVuvx9Kh4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AD3658B7AB;
 Mon, 23 Dec 2019 15:31:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AbT8jpQZojIw; Mon, 23 Dec 2019 15:31:01 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C04C8B7A1;
 Mon, 23 Dec 2019 15:31:01 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 57F2B637D4; Mon, 23 Dec 2019 14:31:01 +0000 (UTC)
Message-Id: <cover.1577111363.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 00/10] powerpc/32: switch VDSO to C implementation.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
 luto@kernel.org
Date: Mon, 23 Dec 2019 14:31:01 +0000 (UTC)
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
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a second tentative to switch powerpc/32 vdso to generic C implementation.

It will likely not work on 64 bits or even build properly at the moment.

powerpc is a bit special for VDSO as well as system calls in the
way that it requires setting CR SO bit which cannot be done in C.
Therefore, entry/exit and fallback needs to be performed in ASM.

To allow that, the fallback calls are moved out of the common code
and left to the arches.

A few other changes in the common code have allowed performance improvement.

The performance has improved since first RFC, but it is still lower than
current assembly VDSO.

On a powerpc8xx, with current powerpc/32 ASM VDSO:

gettimeofday:    vdso: 737 nsec/call
clock-getres-realtime:    vdso: 475 nsec/call
clock-gettime-realtime:    vdso: 892 nsec/call
clock-getres-monotonic:    vdso: 475 nsec/call
clock-gettime-monotonic:    vdso: 1014 nsec/call

First try of C implementation:

gettimeofday:    vdso: 1533 nsec/call
clock-getres-realtime:    vdso: 853 nsec/call
clock-gettime-realtime:    vdso: 1570 nsec/call
clock-getres-monotonic:    vdso: 835 nsec/call
clock-gettime-monotonic:    vdso: 1605 nsec/call

With this series:

gettimeofday:    vdso: 1016 nsec/call
clock-getres-realtime:    vdso: 560 nsec/call
clock-gettime-realtime:    vdso: 1192 nsec/call
clock-getres-monotonic:    vdso: 560 nsec/call
clock-gettime-monotonic:    vdso: 1192 nsec/call


Changes made to other arches are untested, not even compiled.


Christophe Leroy (10):
  lib: vdso: ensure all arches have 32bit fallback
  lib: vdso: move call to fallback out of common code.
  lib: vdso: Change __cvdso_clock_gettime/getres_common() to
    __cvdso_clock_gettime/getres()
  lib: vdso: get pointer to vdso data from the arch
  lib: vdso: inline do_hres()
  lib: vdso: make do_coarse() return 0
  lib: vdso: don't use READ_ONCE() in __c_kernel_time()
  lib: vdso: Avoid duplication in __cvdso_clock_getres()
  powerpc/vdso32: inline __get_datapage()
  powerpc/32: Switch VDSO to C implementation.

 arch/arm/include/asm/vdso/gettimeofday.h          |  26 +++
 arch/arm/vdso/vgettimeofday.c                     |  32 ++-
 arch/arm64/include/asm/vdso/compat_gettimeofday.h |   2 -
 arch/arm64/include/asm/vdso/gettimeofday.h        |  26 +++
 arch/arm64/kernel/vdso/vgettimeofday.c            |  24 +-
 arch/arm64/kernel/vdso32/vgettimeofday.c          |  39 +++-
 arch/mips/include/asm/vdso/gettimeofday.h         |  28 ++-
 arch/mips/vdso/vgettimeofday.c                    |  56 ++++-
 arch/powerpc/Kconfig                              |   2 +
 arch/powerpc/include/asm/vdso/gettimeofday.h      |  45 ++++
 arch/powerpc/include/asm/vdso/vsyscall.h          |  27 +++
 arch/powerpc/include/asm/vdso_datapage.h          |  28 +--
 arch/powerpc/kernel/asm-offsets.c                 |  23 +-
 arch/powerpc/kernel/time.c                        |  92 +-------
 arch/powerpc/kernel/vdso.c                        |  19 +-
 arch/powerpc/kernel/vdso32/Makefile               |  19 +-
 arch/powerpc/kernel/vdso32/cacheflush.S           |   9 +-
 arch/powerpc/kernel/vdso32/datapage.S             |  28 +--
 arch/powerpc/kernel/vdso32/gettimeofday.S         | 265 +++-------------------
 arch/powerpc/kernel/vdso32/vgettimeofday.c        |  32 +++
 arch/x86/entry/vdso/vclock_gettime.c              |  52 ++++-
 arch/x86/include/asm/vdso/gettimeofday.h          |  28 ++-
 lib/vdso/gettimeofday.c                           | 100 +++-----
 23 files changed, 505 insertions(+), 497 deletions(-)
 create mode 100644 arch/powerpc/include/asm/vdso/gettimeofday.h
 create mode 100644 arch/powerpc/include/asm/vdso/vsyscall.h
 create mode 100644 arch/powerpc/kernel/vdso32/vgettimeofday.c

-- 
2.13.3

