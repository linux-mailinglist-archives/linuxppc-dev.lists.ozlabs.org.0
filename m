Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858803E1125
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:18:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgNLw388Lz3dHS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 19:18:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=elvis.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de;
 envelope-from=tsbogend@alpha.franken.de; receiver=<UNKNOWN>)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GgNLR0FQLz3cl1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 19:17:50 +1000 (AEST)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1mBZV8-0005ti-04; Thu, 05 Aug 2021 11:17:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 92188C052F; Thu,  5 Aug 2021 11:16:03 +0200 (CEST)
Date: Thu, 5 Aug 2021 11:16:03 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] arch: Export machine_restart() instances so they can
 be called from modules
Message-ID: <20210805091603.GE5979@alpha.franken.de>
References: <20210805075032.723037-1-lee.jones@linaro.org>
 <20210805075032.723037-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805075032.723037-2-lee.jones@linaro.org>
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
Cc: Rich Felker <dalias@libc.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Sebastian Reichel <sre@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-snps-arc@lists.infradead.org,
 Jeff Dike <jdike@addtoit.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, John Crispin <john@phrozen.org>,
 Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 linux-mips@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 05, 2021 at 08:50:30AM +0100, Lee Jones wrote:
> A recent attempt to convert the Power Reset Restart driver to tristate
> failed because of the following compile error (reported once merged by
> Stephen Rothwell via Linux Next):
> 
>   ERROR: "machine_restart" [drivers/power/reset/restart-poweroff.ko] undefined!
> 
> This error occurs since some of the machine_restart() instances are
> not currently exported for use in modules.  This patch aims to rectify
> that.
> 
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Brian Cain <bcain@codeaurora.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: John Crispin <john@phrozen.org>
> Cc: Ley Foon Tan <ley.foon.tan@intel.com>
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> Cc: Stafford Horne <shorne@gmail.com>
> Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Rich Felker <dalias@libc.org>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: uclinux-h8-devel@lists.sourceforge.jp
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: openrisc@lists.librecores.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-xtensa@linux-xtensa.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
> 
> The 2 patches this change supports have the required Acks already.
> 
> NB: If it's safe to omit some of these, let me know and I'll revise the patch.
> 
>  [...]
>  arch/mips/kernel/reset.c           | 1 +
>  arch/mips/lantiq/falcon/reset.c    | 1 +
>  arch/mips/sgi-ip27/ip27-reset.c    | 1 +

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
