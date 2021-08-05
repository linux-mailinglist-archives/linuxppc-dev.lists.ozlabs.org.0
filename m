Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A1D3E1121
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:18:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgNLY6sBMz3d8B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 19:17:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=elvis.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de;
 envelope-from=tsbogend@alpha.franken.de; receiver=<UNKNOWN>)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GgNL866smz307n
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 19:17:34 +1000 (AEST)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1mBZV8-0005ti-03; Thu, 05 Aug 2021 11:17:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id D48DCC052F; Thu,  5 Aug 2021 11:12:18 +0200 (CEST)
Date: Thu, 5 Aug 2021 11:12:18 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2] arch: vdso: remove if-conditionals of
 $(c-gettimeofday-y)
Message-ID: <20210805091218.GD5979@alpha.franken.de>
References: <20210731060020.12913-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210731060020.12913-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Russell King <linux@armlinux.org.uk>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-arm-kernel@lists.infradead.org, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 31, 2021 at 03:00:20PM +0900, Masahiro Yamada wrote:
> arm, arm64, csky, mips, powerpc always select GENERIC_GETTIMEOFDAY,
> hence $(gettimeofday-y) never becomes empty.
> 
> riscv conditionally selects GENERIC_GETTIMEOFDAY when MMU=y && 64BIT=y,
> but arch/riscv/kernel/vdso/vgettimeofday.o is built only under that
> condition. So, you can always define CFLAGS_vgettimeofday.o
> 
> Remove all the meaningless conditionals.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v2:
>   - Fix csky as well
> 
>  [..]
>  arch/mips/vdso/Makefile             |  2 --

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
