Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2CA18B3B0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 13:48:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jmsf0NRNzDrMK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 23:48:06 +1100 (AEDT)
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
 header.s=mail header.b=qPKgnd8p; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jmd572jyzDqxD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 23:37:12 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48jmcx72fhz9txpt;
 Thu, 19 Mar 2020 13:37:05 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qPKgnd8p; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 73Jdkf_Zz9r3; Thu, 19 Mar 2020 13:37:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48jmcx5r95z9txn7;
 Thu, 19 Mar 2020 13:37:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584621425; bh=1l8seTHHmExwEDOIcnw6yPPOnKc59tjApU1N0ParQfA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qPKgnd8pWHAz0ALEh0DXg6kUaXlRtuCDj39r0To7+ErwNFGf2pV6MacAucHN+F7u2
 A5AWzbgfYDKjjoOIk6Ym4cu/bJsjEvuJYH+NkkLsOi/fQuhkPlf7nH+YnPljevNc8P
 ZQfJ8SdwY7WktUk9WiQ8Nn8BN/SHGVmZxEU+hkXE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 255868B84E;
 Thu, 19 Mar 2020 13:37:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BHYaNWr09YCd; Thu, 19 Mar 2020 13:37:07 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 028D78B769;
 Thu, 19 Mar 2020 13:37:04 +0100 (CET)
Subject: Re: [PATCH v11 0/8] Disable compat cruft on ppc64le v11
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <c5f30914-4d0c-5437-e8c4-9d62d08061e1@c-s.fr>
Date: Thu, 19 Mar 2020 13:36:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1584620202.git.msuchanek@suse.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Eric Richter <erichte@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

You sent it twice ? Any difference between the two dispatch ?

Christophe

Le 19/03/2020 à 13:19, Michal Suchanek a écrit :
> Less code means less bugs so add a knob to skip the compat stuff.
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
> Changes in v8:
>   - consolidate valid_user_sp to fix it in the split callchain.c
>   - fix build errors/warnings with PPC64 !COMPAT and PPC32
> Changes in v9:
>   - remove current_is_64bit()
> Chanegs in v10:
>   - rebase, sent together with the syscall cleanup
> Changes in v11:
>   - rebase
>   - add MAINTAINERS pattern for ppc perf
> 
> Michal Suchanek (8):
>    powerpc: Add back __ARCH_WANT_SYS_LLSEEK macro
>    powerpc: move common register copy functions from signal_32.c to
>      signal.c
>    powerpc/perf: consolidate read_user_stack_32
>    powerpc/perf: consolidate valid_user_sp
>    powerpc/64: make buildable without CONFIG_COMPAT
>    powerpc/64: Make COMPAT user-selectable disabled on littleendian by
>      default.
>    powerpc/perf: split callchain.c by bitness
>    MAINTAINERS: perf: Add pattern that matches ppc perf to the perf
>      entry.
> 
>   MAINTAINERS                            |   2 +
>   arch/powerpc/Kconfig                   |   5 +-
>   arch/powerpc/include/asm/thread_info.h |   4 +-
>   arch/powerpc/include/asm/unistd.h      |   1 +
>   arch/powerpc/kernel/Makefile           |   6 +-
>   arch/powerpc/kernel/entry_64.S         |   2 +
>   arch/powerpc/kernel/signal.c           | 144 +++++++++-
>   arch/powerpc/kernel/signal_32.c        | 140 ----------
>   arch/powerpc/kernel/syscall_64.c       |   6 +-
>   arch/powerpc/kernel/vdso.c             |   3 +-
>   arch/powerpc/perf/Makefile             |   5 +-
>   arch/powerpc/perf/callchain.c          | 356 +------------------------
>   arch/powerpc/perf/callchain.h          |  20 ++
>   arch/powerpc/perf/callchain_32.c       | 196 ++++++++++++++
>   arch/powerpc/perf/callchain_64.c       | 174 ++++++++++++
>   fs/read_write.c                        |   3 +-
>   16 files changed, 556 insertions(+), 511 deletions(-)
>   create mode 100644 arch/powerpc/perf/callchain.h
>   create mode 100644 arch/powerpc/perf/callchain_32.c
>   create mode 100644 arch/powerpc/perf/callchain_64.c
> 
