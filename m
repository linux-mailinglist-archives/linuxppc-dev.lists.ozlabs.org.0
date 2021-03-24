Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E44347425
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 10:09:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F52Vs6G30z3bsB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 20:09:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 36218 seconds by postgrey-1.36 at boromir;
 Wed, 24 Mar 2021 20:09:24 AEDT
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F52VX5qK1z30Bc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 20:09:21 +1100 (AEDT)
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr
 [90.65.108.55]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id BE7824000B;
 Wed, 24 Mar 2021 09:09:14 +0000 (UTC)
Date: Wed, 24 Mar 2021 10:09:14 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 -next] powerpc: kernel/time.c - cleanup warnings
Message-ID: <YFsBusiJWW3o7eNQ@piout.net>
References: <20210323091257.90054-1-heying24@huawei.com>
 <YFppJkpZRHMJFay0@piout.net>
 <CAMuHMdWfFtJOQQf0b-2QJRd1EMLSW7rDsjNYzjjZhg6=JNZ0AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWfFtJOQQf0b-2QJRd1EMLSW7rDsjNYzjjZhg6=JNZ0AA@mail.gmail.com>
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Zijlstra <peterz@infradead.org>, frederic@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 kernelfans@gmail.com, Thomas Gleixner <tglx@linutronix.de>,
 Michal Suchanek <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, He Ying <heying24@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/03/2021 09:19:58+0100, Geert Uytterhoeven wrote:
> Hi Alexandre,
> 
> On Tue, Mar 23, 2021 at 11:18 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > On 23/03/2021 05:12:57-0400, He Ying wrote:
> > > We found these warnings in arch/powerpc/kernel/time.c as follows:
> > > warning: symbol 'decrementer_max' was not declared. Should it be static?
> > > warning: symbol 'rtc_lock' was not declared. Should it be static?
> > > warning: symbol 'dtl_consumer' was not declared. Should it be static?
> > >
> > > Declare 'decrementer_max' and 'rtc_lock' in powerpc asm/time.h.
> > > Rename 'rtc_lock' in drviers/rtc/rtc-vr41xx.c to 'vr41xx_rtc_lock' to
> > > avoid the conflict with the variable in powerpc asm/time.h.
> > > Move 'dtl_consumer' definition behind "include <asm/dtl.h>" because it
> > > is declared there.
> > >
> > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > Signed-off-by: He Ying <heying24@huawei.com>
> > > ---
> > > v2:
> > > - Instead of including linux/mc146818rtc.h in powerpc kernel/time.c, declare
> > >   rtc_lock in powerpc asm/time.h.
> > >
> >
> > V1 was actually the correct thing to do. rtc_lock is there exactly
> > because chrp and maple are using mc146818 compatible RTCs. This is then
> > useful because then drivers/char/nvram.c is enabled. The proper fix
> > would be to scrap all of that and use rtc-cmos for those platforms as
> > this drives the RTC properly and exposes the NVRAM for the mc146818.
> >
> > Or at least, if there are no users for the char/nvram driver on those
> > two platforms, remove the spinlock and stop enabling CONFIG_NVRAM or
> > more likely rename the symbol as it seems to be abused by both chrp and
> > powermac.
> 
> IIRC, on CHRP LongTrail, NVRAM was inherited from CHRP's Mac ancestry,
> not from CHRP's PC ancestry, and thus NVRAM is not the one in the
> mc146818-compatible RTC.
> 
> http://users.telenet.be/geertu/Linux/PPC/DeviceTree.html confirms that,
> showing that nvram is a different device node than rtc.
> 

Yes, what I missed was the ifdefery in drivers/char/nvram.c that makes
it a completely different driver on both platforms. I tend to forget
about that as reading this driver is not a pleasant experience. I would
really like to get rid of the x86 part which would in turn allow to
remove the global rtc_lock spinlock on all architectures.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
