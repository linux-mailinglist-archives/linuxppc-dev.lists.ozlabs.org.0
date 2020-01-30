Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBDB14DE86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 17:11:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487lhW5pRszDqTT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 03:11:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=FQUlvhVm; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487ldh15dqzDqSY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 03:08:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 487ldY3xydz9v6KM;
 Thu, 30 Jan 2020 17:08:33 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=FQUlvhVm; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wIEqw9oDIA6F; Thu, 30 Jan 2020 17:08:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 487ldY2t0xz9v6KL;
 Thu, 30 Jan 2020 17:08:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580400513; bh=4gy05PHuez6bivrIGkJNuEVnZ24TDpRGy3B+DHczM3E=;
 h=From:Subject:To:Cc:Date:From;
 b=FQUlvhVmZKvZxXxg7cK4U5Cfll3ntifWapTKxoZctIQ9egTmZuqdjZGKPp9nTug6Y
 SFhbCQOntoMGKsAkvyYbYKF1dVGaz47UChW4nIF7Q8ug/ClNbVsLD3QigiDc3CoiJ3
 0QSsV+tT2aHX7KbBaYenl5hgYHuwpiiX8gCCS4LI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E0CFD8B87B;
 Thu, 30 Jan 2020 17:08:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id paLKA8Pe3ank; Thu, 30 Jan 2020 17:08:34 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C3CD8B877;
 Thu, 30 Jan 2020 17:08:34 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2FE7465283; Thu, 30 Jan 2020 16:08:34 +0000 (UTC)
Message-Id: <cover.1580399657.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 0/6] powerpc: switch VDSO to C implementation.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 nathanl@linux.ibm.com, arnd@arndb.de, tglx@linutronix.de,
 vincenzo.frascino@arm.com, luto@kernel.org
Date: Thu, 30 Jan 2020 16:08:34 +0000 (UTC)
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

This is a fifth version of a series to switch powerpc VDSO to generic
C implementation. All previous where RFCs. This one has reached a
mature status.

It is tested on PPC32 (mpc885 and mpc8321E).
It is build tested on kisskb
(http://kisskb.ellerman.id.au/kisskb/head/abf15916bd65f808b07fe9a2377db965a37071e4/)
In PPC64 mode it now builds both VDSO64 and VDSO32.

The two first patches are optimisation around the way vdso datapage is
handled. They are worth merging now even if we want to wait a little
more for the entire series.

The next three patches are optimisations to the GENERIC C VDSO code.
Without them, the performance of the VDSO time functions are too
degraded compared to the current ASM version to be worth switching
the C VDSO.

This series applies on today's powerpc/merge branch.

See the last patch for details on changes and performance.

Christophe Leroy (6):
  powerpc/vdso64: Switch from __get_datapage() to get_datapage inline
    macro
  powerpc/vdso: Remove __kernel_datapage_offset and simplify
    __get_datapage()
  lib/vdso: Allow architectures to provide the vdso data pointer
  lib/vdso: Allow fixed clock mode
  lib/vdso: Allow architectures to override the ns shift operation
  powerpc/vdso: Switch VDSO to generic C implementation.

 arch/powerpc/Kconfig                         |   2 +
 arch/powerpc/include/asm/vdso/gettimeofday.h | 158 ++++++++++
 arch/powerpc/include/asm/vdso/vsyscall.h     |  25 ++
 arch/powerpc/include/asm/vdso_datapage.h     |  51 ++--
 arch/powerpc/kernel/asm-offsets.c            |  49 +---
 arch/powerpc/kernel/time.c                   |  90 ------
 arch/powerpc/kernel/vdso.c                   |  58 +---
 arch/powerpc/kernel/vdso32/Makefile          |  32 +-
 arch/powerpc/kernel/vdso32/cacheflush.S      |   2 +-
 arch/powerpc/kernel/vdso32/config-fake32.h   |  34 +++
 arch/powerpc/kernel/vdso32/datapage.S        |   7 +-
 arch/powerpc/kernel/vdso32/gettimeofday.S    | 291 +------------------
 arch/powerpc/kernel/vdso32/vdso32.lds.S      |   7 +-
 arch/powerpc/kernel/vdso32/vgettimeofday.c   |  29 ++
 arch/powerpc/kernel/vdso64/Makefile          |  23 +-
 arch/powerpc/kernel/vdso64/cacheflush.S      |   9 +-
 arch/powerpc/kernel/vdso64/datapage.S        |  31 +-
 arch/powerpc/kernel/vdso64/gettimeofday.S    | 243 +---------------
 arch/powerpc/kernel/vdso64/vdso64.lds.S      |   7 +-
 arch/powerpc/kernel/vdso64/vgettimeofday.c   |  29 ++
 lib/vdso/gettimeofday.c                      |  98 +++++--
 21 files changed, 467 insertions(+), 808 deletions(-)
 create mode 100644 arch/powerpc/include/asm/vdso/gettimeofday.h
 create mode 100644 arch/powerpc/include/asm/vdso/vsyscall.h
 create mode 100644 arch/powerpc/kernel/vdso32/config-fake32.h
 create mode 100644 arch/powerpc/kernel/vdso32/vgettimeofday.c
 create mode 100644 arch/powerpc/kernel/vdso64/vgettimeofday.c

-- 
2.25.0

