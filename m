Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 067681E871B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 21:01:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YYny0yD1zDqWY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 05:01:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YYhq3hLLzDqhn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 May 2020 04:57:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49YYhg2V5Bz9v2Td;
 Fri, 29 May 2020 20:57:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uT3_SGAy8cdX; Fri, 29 May 2020 20:57:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49YYhg1NrPz9v2Tc;
 Fri, 29 May 2020 20:57:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E7238B886;
 Fri, 29 May 2020 20:57:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id g5wPUXHwNnhl; Fri, 29 May 2020 20:57:07 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 864B18B7A8;
 Fri, 29 May 2020 20:57:06 +0200 (CEST)
Subject: Re: [PATCH v8 0/8] powerpc: switch VDSO to C implementation
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 nathanl@linux.ibm.com
References: <cover.1588079622.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <438ce3d7-aa0f-0284-7518-6c6339742aab@csgroup.eu>
Date: Fri, 29 May 2020 20:56:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1588079622.git.christophe.leroy@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Le 28/04/2020 à 15:16, Christophe Leroy a écrit :
> This is the seventh version of a series to switch powerpc VDSO to
> generic C implementation.
> 
> Main changes since v7 are:
> - Added gettime64 on PPC32
> 
> This series applies on today's powerpc/merge branch.
> 
> See the last patches for details on changes and performance.

Do you have any plans for this series ?

Even if you don't feel like merging it this cycle, I think patches 1 to 
3 are worth it.

Christophe

> 
> Christophe Leroy (8):
>    powerpc/vdso64: Switch from __get_datapage() to get_datapage inline
>      macro
>    powerpc/vdso: Remove __kernel_datapage_offset and simplify
>      __get_datapage()
>    powerpc/vdso: Remove unused \tmp param in __get_datapage()
>    powerpc/processor: Move cpu_relax() into asm/vdso/processor.h
>    powerpc/vdso: Prepare for switching VDSO to generic C implementation.
>    powerpc/vdso: Switch VDSO to generic C implementation.
>    lib/vdso: force inlining of __cvdso_clock_gettime_common()
>    powerpc/vdso: Provide __kernel_clock_gettime64() on vdso32
> 
>   arch/powerpc/Kconfig                         |   2 +
>   arch/powerpc/include/asm/clocksource.h       |   7 +
>   arch/powerpc/include/asm/processor.h         |  10 +-
>   arch/powerpc/include/asm/vdso/clocksource.h  |   7 +
>   arch/powerpc/include/asm/vdso/gettimeofday.h | 175 +++++++++++
>   arch/powerpc/include/asm/vdso/processor.h    |  23 ++
>   arch/powerpc/include/asm/vdso/vsyscall.h     |  25 ++
>   arch/powerpc/include/asm/vdso_datapage.h     |  50 ++--
>   arch/powerpc/kernel/asm-offsets.c            |  49 +--
>   arch/powerpc/kernel/time.c                   |  91 +-----
>   arch/powerpc/kernel/vdso.c                   |  58 +---
>   arch/powerpc/kernel/vdso32/Makefile          |  32 +-
>   arch/powerpc/kernel/vdso32/cacheflush.S      |   2 +-
>   arch/powerpc/kernel/vdso32/config-fake32.h   |  34 +++
>   arch/powerpc/kernel/vdso32/datapage.S        |   7 +-
>   arch/powerpc/kernel/vdso32/gettimeofday.S    | 300 +------------------
>   arch/powerpc/kernel/vdso32/vdso32.lds.S      |   8 +-
>   arch/powerpc/kernel/vdso32/vgettimeofday.c   |  35 +++
>   arch/powerpc/kernel/vdso64/Makefile          |  23 +-
>   arch/powerpc/kernel/vdso64/cacheflush.S      |   9 +-
>   arch/powerpc/kernel/vdso64/datapage.S        |  31 +-
>   arch/powerpc/kernel/vdso64/gettimeofday.S    | 243 +--------------
>   arch/powerpc/kernel/vdso64/vdso64.lds.S      |   7 +-
>   arch/powerpc/kernel/vdso64/vgettimeofday.c   |  29 ++
>   lib/vdso/gettimeofday.c                      |   2 +-
>   25 files changed, 460 insertions(+), 799 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/clocksource.h
>   create mode 100644 arch/powerpc/include/asm/vdso/clocksource.h
>   create mode 100644 arch/powerpc/include/asm/vdso/gettimeofday.h
>   create mode 100644 arch/powerpc/include/asm/vdso/processor.h
>   create mode 100644 arch/powerpc/include/asm/vdso/vsyscall.h
>   create mode 100644 arch/powerpc/kernel/vdso32/config-fake32.h
>   create mode 100644 arch/powerpc/kernel/vdso32/vgettimeofday.c
>   create mode 100644 arch/powerpc/kernel/vdso64/vgettimeofday.c
> 
