Return-Path: <linuxppc-dev+bounces-1313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3980A9779D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 09:40:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4mSN36bDz2yM6;
	Fri, 13 Sep 2024 17:40:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.154.197.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726213236;
	cv=none; b=FqwvVJ3vaNoiu1cB+LY64DT1CzkKZHbUHahdCoBKPTsUckSE9pnMtAMERmRbhCerkyPjwJ67a2ml5hiGa3rvarv00MBtGMD2MUShass7kUGXV7YaJoKIgCjIZGnoWrVI6MUekaW+XcE4BNBUH0ZPLG0tAzYU/Hf+Nupj42d+Fu2ipTck60ojV0E336U8E79qNNFEWoOJ9yVFZhjPxJJTrITTQ/vj/O6oKKPtGJxn4dvxUa0EqvfiC5Egxwme6EL8UT0XB4v5PX+DQOPrNWzumbXCoRpwc0F2NJ6LAOhTrUGCOtcZpgRodSoWNyb7hOeXJ26kZaH4DfH2RM3T48eSJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726213236; c=relaxed/relaxed;
	bh=POEiOPc78kqJiRjNi9g/iMS36+6n7FFv4j6LlVdp5rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zn8O/Eahnikrw515T6KIYo29fl1TvHqTeBj/7dCuFt5PkiTwp+zvwpSQ09jH8SPaUpg40iq1qhmXlOqDnBMUjroAezblNmaJhqyYlEBcUXpIBjEJlva4TNUXlFM9KymPp6+JlOO7CA+PD2dIiZ7bpE34la03uJ6Varr5wWJkvayFe6YAgXQNFlmtSVA/tvepHJj2CDWrIRpCk5Oj426puM5EiFcSXY1zi52UbYl4izY/Pds3/bTMCJZfm5sFRD0gu9JgJgdBEpTBhubMpGv/e2nBgN+24u+z7HCApn1YpL1Hjj7iyXbu3be/Or05T5nRmc8or2aafO56WhdmTg1sDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=43.154.197.177; helo=bg5.exmail.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4mSM2h8Nz2y7K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 17:40:34 +1000 (AEST)
X-QQ-mid: bizesmtpsz7t1726213162tuds4k5
X-QQ-Originating-IP: KmCwuRb/6WJmVQEoRI44lstEwjYbnExTEZvKu75TRkg=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Sep 2024 15:39:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4060486937568160866
Date: Fri, 13 Sep 2024 15:38:46 +0800
From: Luming Yu <luming.yu@shingroup.cn>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au, npiggin@gmail.com, jialong.yang@shingroup.cn,
	luming.yu@gmail.com
Subject: Re: [PATCH 1/2] powerpc/entry: convert to common and generic entry
Message-ID: <0332BAE1905768B6+ZuPsBvgv0nwmFAjW@HX09040029.powercore.com.cn>
References: <B4ABABEA5F13B86A+20240912082500.1469-1-luming.yu@shingroup.cn>
 <fc509bcd-5ca0-4dc2-962e-766a01cbe4fb@csgroup.eu>
 <153FD6B5CE4F97D9+ZuOYDQ-iHIIwJjbh@HX09040029.powercore.com.cn>
 <95ced963-b584-4ccf-ba34-8f2ba99172f4@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95ced963-b584-4ccf-ba34-8f2ba99172f4@csgroup.eu>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1

On Fri, Sep 13, 2024 at 08:54:12AM +0200, Christophe Leroy wrote:
> 
> 
> Le 13/09/2024 à 03:40, Luming Yu a écrit :
> > On Thu, Sep 12, 2024 at 12:23:29PM +0200, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 12/09/2024 à 10:24, Luming Yu a écrit :
> > > > From: Yu Luming <luming.yu@gmail.com>
> > > > 
> > > > convert powerpc entry code in syscall and fault to use syscall_work
> > > > and irqentry_state as well as common calls from generic entry infrastructure.
> > > > 
> > > > Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> > > > ---
> > > >    arch/powerpc/Kconfig                   | 1 +
> > > >    arch/powerpc/include/asm/hw_irq.h      | 5 +++++
> > > >    arch/powerpc/include/asm/processor.h   | 6 ++++++
> > > >    arch/powerpc/include/asm/syscall.h     | 5 +++++
> > > >    arch/powerpc/include/asm/thread_info.h | 1 +
> > > >    arch/powerpc/kernel/syscall.c          | 6 +++++-
> > > >    arch/powerpc/mm/fault.c                | 5 +++++
> > > >    7 files changed, 28 insertions(+), 1 deletion(-)
> > > 
> > > There is another build problem:
> > > 
> > >    CC      kernel/entry/common.o
> > > kernel/entry/common.c: In function 'irqentry_exit':
> > > kernel/entry/common.c:335:21: error: implicit declaration of function
> > > 'regs_irqs_disabled'; did you mean 'raw_irqs_disabled'?
> > > [-Werror=implicit-function-declaration]
> > >    335 |         } else if (!regs_irqs_disabled(regs)) {
> > >        |                     ^~~~~~~~~~~~~~~~~~
> > >        |                     raw_irqs_disabled
> > > 
> > > 
> > > You have put regs_irqs_disabled() in a section dedicated to PPC64, so it
> > > fails on PPC32.
> > > 
> > > 
> > > After fixing this problem and providing an empty asm/entry-common.h it is
> > > now possible to build the kernel. But that's not enough, the board is stuck
> > > after:
> > > 
> > > ...
> > > [    2.871391] Freeing unused kernel image (initmem) memory: 1228K
> > > [    2.877990] Run /init as init process
> > 
> > Thanks for these questions. :-)
> > I haven't gotten chance to run it in ppc32 qemu.
> > the common syscall trace enter lost this hunk
> > -       if (!is_32bit_task())
> > -               audit_syscall_entry(regs->gpr[0], regs->gpr[3], regs->gpr[4],
> > -                                   regs->gpr[5], regs->gpr[6]);
> > -       else
> > -               audit_syscall_entry(regs->gpr[0],
> > -                                   regs->gpr[3] & 0xffffffff,
> > -                                   regs->gpr[4] & 0xffffffff,
> > -                                   regs->gpr[5] & 0xffffffff,
> > -                                   regs->gpr[6] & 0xffffffff);
> > which I don't understand whether we need a arch callbacks for it.
> 
> I don't thing so.
> 
> As far as I can see, audit_syscall_entry() is called by
> syscall_enter_audit() in kernel/entry/common.c
> 
> And the masking of arguments based on is_32bit_task() is done in
> syscall_get_arguments() with is called by
> syscall_enter_audit() just before calling audit_syscall_entry() and which is
> an arch callback that does the same as the removed hunk.
so, syscall_get_arguments is the ppc arch callback. thanks. :-)
> > 
> > Before I sent out the RFC patch set, the very limited compile and boot test goes well with a ppc64 qemu VM. Surely, there will be a lot of test, debug and following up patch set update that is necessary to make it a complete convert.
> 
> Even on ppc64 it doesn't build, at the first place because
> arch/powerpc/include/asm/entry-common.h is missing in your patch. Did you
> forget to 'git add' it ?
oh, I forget that I was testing this patch on top of the early user notifier patch:
https://github.com/linuxppc/issues/issues/477, https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1FD36D52828D2506+20231218031309.2063-1-luming.yu@shingroup.cn/ 
and the entry-common.h is as follows:
[root@localhost linux]# cat arch/powerpc/include/asm/entry-common.h
/* SPDX-License-Identifier: GPL-2.0 */
#ifndef ARCH_POWERPC_ENTRY_COMMON_H
#define ARCH_POWERPC_ENTRY_COMMON_H

#include <linux/user-return-notifier.h>

static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
                                                  unsigned long ti_work)
{
        if (ti_work & _TIF_USER_RETURN_NOTIFY)
                fire_user_return_notifiers();
}

#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare

#endif

As you could see , it looks irrelevant.
> 
> And same as with PPC32, when I build PPC64 with an empty asm/entry-common.h,
> it doesn't work. So, I guess you had some needed code in that file and you
> have to send it.

please send me your kernel config and let me reproduce and double check 
if there could be another bit of code make the difference. My test p8 64bit VM boots
an unmodified fedora 38 user space just fine with the patch. 
After boot, the only difference is make install of kernel could hang for a while, that 
I'm not sure how that could happen yet. and I plan to do some unit test for many common
features like : lockdep, ptrace, rcu, audit...
> 


