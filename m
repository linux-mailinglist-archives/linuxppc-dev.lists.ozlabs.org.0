Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 409B635F07B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 11:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKxXx1bdfz3c3k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 19:11:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKxXZ47rTz2yhq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 19:10:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FKxXQ05PXz9txRC;
 Wed, 14 Apr 2021 11:10:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0zeBA9ZPccDQ; Wed, 14 Apr 2021 11:10:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FKxXP4rdvz9ttBY;
 Wed, 14 Apr 2021 11:10:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE0B88B7BC;
 Wed, 14 Apr 2021 11:10:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QZ2BMSlNARn7; Wed, 14 Apr 2021 11:10:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 098558B7BA;
 Wed, 14 Apr 2021 11:10:44 +0200 (CEST)
Subject: Re: [PATCH] init: consolidate trap_init()
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
References: <20210414165808.458a3d11@xhacker.debian>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <44bdf1f1-117d-0f10-fc59-9edd32d1ad61@csgroup.eu>
Date: Wed, 14 Apr 2021 11:10:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414165808.458a3d11@xhacker.debian>
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-parisc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/04/2021 à 10:58, Jisheng Zhang a écrit :
> Many architectures implement the trap_init() as NOP, since there is
> no such default for trap_init(), this empty stub is duplicated among
> these architectures. Provide a generic but weak NOP implementation
> to drop the empty stubs of trap_init() in these architectures.

You define the weak function in the __init section.

Most but not all architectures had it in __init section.

And the remaining ones may not be defined in __init section. For instance look at the one in alpha 
architecture.

Have you checked that it is not a problem ? It would be good to say something about it in the commit 
description.


> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
>   arch/arc/kernel/traps.c      |  5 -----
>   arch/arm/kernel/traps.c      |  5 -----
>   arch/h8300/kernel/traps.c    | 13 -------------
>   arch/hexagon/kernel/traps.c  |  4 ----
>   arch/nds32/kernel/traps.c    |  5 -----
>   arch/nios2/kernel/traps.c    |  5 -----
>   arch/openrisc/kernel/traps.c |  5 -----
>   arch/parisc/kernel/traps.c   |  4 ----
>   arch/powerpc/kernel/traps.c  |  5 -----
>   arch/riscv/kernel/traps.c    |  5 -----
>   arch/um/kernel/trap.c        |  4 ----
>   init/main.c                  |  2 ++
>   12 files changed, 2 insertions(+), 60 deletions(-)
> 
> diff --git a/init/main.c b/init/main.c
> index 53b278845b88..4bdbe2928530 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -790,6 +790,8 @@ static inline void initcall_debug_enable(void)
>   }
>   #endif
>   
> +void __init __weak trap_init(void) { }
> +

I think in a C file we don't try to save space as much as in a header file.

I would prefer something like:


void __init __weak trap_init(void)
{
}


>   /* Report memory auto-initialization states for this boot. */
>   static void __init report_meminit(void)
>   {
> 
