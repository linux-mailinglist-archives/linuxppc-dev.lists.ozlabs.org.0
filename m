Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE047A42D8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 08:43:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46L6J72gTPzDr9j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 16:43:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="DCHi8QuG"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46L6G71rzczDqJ2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 16:42:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46L6Fz3R1Wz9vBJj;
 Sat, 31 Aug 2019 08:41:59 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=DCHi8QuG; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EUBuxe25WhSh; Sat, 31 Aug 2019 08:41:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46L6Fz28Hvz9vBJh;
 Sat, 31 Aug 2019 08:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567233719; bh=zW5mYP4+0uS4BEBirQHJjroaEWJlF/DljKcLUZMTdno=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DCHi8QuGDB2LhXKhnAaLLmBHnV7y6OfMLcVTw0wq+eNxie2ypG4H7KN9aBNy1TYH5
 OM1Pn7gaehsWpVbo8x+c4c41xFw6vQeyLuL5lkaSdpMZfM3upnwB8+wtTLoL1stodo
 MOIjgbOAjurcrMwGpHKE5FVK1RJWWGsW6fi76zPs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 542B98B7B5;
 Sat, 31 Aug 2019 08:42:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 32vOgj1NZJqz; Sat, 31 Aug 2019 08:42:00 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 02AE88B789;
 Sat, 31 Aug 2019 08:41:58 +0200 (CEST)
Subject: Re: [PATCH v7 0/6] Disable compat cruft on ppc64le v7
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
References: <cover.1567198491.git.msuchanek@suse.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c6e61aee-7ffb-60db-ccf8-e805d2707eb5@c-s.fr>
Date: Sat, 31 Aug 2019 08:41:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1567198491.git.msuchanek@suse.de>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Diana Craciun <diana.craciun@nxp.com>, Firoz Khan <firoz.khan@linaro.org>,
 Hari Bathini <hbathini@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/08/2019 à 23:03, Michal Suchanek a écrit :
> Less code means less bugs so add a knob to skip the compat stuff.

I guess on PPC64 you have Gigabytes of memory and thousands of bogomips, 
hence you focus on bugs.

My main focus usually is kernel size and performance, which makes this 
series interesting as well.

Anyway, I was wondering, would it make sense (in a following series, not 
in this one) to make it buildable as a module, just like some of binfmt ?

Christophe

> 
> This is tested on ppc64le top of
> 
> https://patchwork.ozlabs.org/cover/1153556/
> 
> Changes in v2: saner CONFIG_COMPAT ifdefs
> Changes in v3:
>   - change llseek to 32bit instead of builing it unconditionally in fs
>   - clanup the makefile conditionals
>   - remove some ifdefs or convert to IS_DEFINED where possible
> Changes in v4:
>   - cleanup is_32bit_task and current_is_64bit
>   - more makefile cleanup
> Changes in v5:
>   - more current_is_64bit cleanup
>   - split off callchain.c 32bit and 64bit parts
> Changes in v6:
>   - cleanup makefile after split
>   - consolidate read_user_stack_32
>   - fix some checkpatch warnings
> Changes in v7:
>   - add back __ARCH_WANT_SYS_LLSEEK to fix build with llseek
>   - remove leftover hunk
>   - add review tags
> 
> Michal Suchanek (6):
>    powerpc: Add back __ARCH_WANT_SYS_LLSEEK macro
>    powerpc: move common register copy functions from signal_32.c to
>      signal.c
>    powerpc/perf: consolidate read_user_stack_32
>    powerpc/64: make buildable without CONFIG_COMPAT
>    powerpc/64: Make COMPAT user-selectable disabled on littleendian by
>      default.
>    powerpc/perf: split callchain.c by bitness
> 
>   arch/powerpc/Kconfig                   |   5 +-
>   arch/powerpc/include/asm/thread_info.h |   4 +-
>   arch/powerpc/include/asm/unistd.h      |   1 +
>   arch/powerpc/kernel/Makefile           |   7 +-
>   arch/powerpc/kernel/entry_64.S         |   2 +
>   arch/powerpc/kernel/signal.c           | 144 +++++++++-
>   arch/powerpc/kernel/signal_32.c        | 140 ---------
>   arch/powerpc/kernel/syscall_64.c       |   6 +-
>   arch/powerpc/kernel/vdso.c             |   5 +-
>   arch/powerpc/perf/Makefile             |   5 +-
>   arch/powerpc/perf/callchain.c          | 377 +------------------------
>   arch/powerpc/perf/callchain.h          |  11 +
>   arch/powerpc/perf/callchain_32.c       | 204 +++++++++++++
>   arch/powerpc/perf/callchain_64.c       | 185 ++++++++++++
>   fs/read_write.c                        |   3 +-
>   15 files changed, 566 insertions(+), 533 deletions(-)
>   create mode 100644 arch/powerpc/perf/callchain.h
>   create mode 100644 arch/powerpc/perf/callchain_32.c
>   create mode 100644 arch/powerpc/perf/callchain_64.c
> 
