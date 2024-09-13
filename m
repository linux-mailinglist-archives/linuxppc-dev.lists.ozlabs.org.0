Return-Path: <linuxppc-dev+bounces-1305-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E18977678
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 03:42:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4cVs64Fjz2xPL;
	Fri, 13 Sep 2024 11:42:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726191733;
	cv=none; b=SXkLYx5VDQ5pIS0tefZe8wtn58/BpVuZVq99cIqWsIP3j0+y9jQdMpbuQ7HwmmY21HPVwxZrzaUv2sJiMZb2FaqTttaA/76bjgvZ4VTC2sdBADBNNq5vsJ6fsHdpUo2GkeeOeBuNeEDz45MbneeQ8xWOOIrhsA3ZyOMzFLwqx1qrhR87VrMEpvyMpmywGJ8XwmbwJY249MVyjpcd7OBV95a28DjJFXet4G4w6JP48IrvGsXLWi0Awmc8qCLya9czILHxni669gS0zR21LqZdpwWztAOsZgaADfpI8rFxv8I0wFCiw13E2QxSjOI1UEHEr0EFH5xpeH4aANzV5s08Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726191733; c=relaxed/relaxed;
	bh=dbBU4TjLlR7bNNlJPiUXBvxgWoaRAeufG4qG5fX0Zlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJBNEBsnpVw0w9H5zYcnzNtHa5McO7S2J3OqC5f71CtDwTdaYJc5yIp7ggGJfSe6RtVmeGcWIUpGFnlY+BZQ5+P59SMkOF8a1zaxYQexP4nY1mDdp8BowqlE+Byi+64Mm8uDWgrFMPQPclwoh9zQk8jVJKoPljAaNqr4S8tLkP/ZvajMm7DiL1dH9KnfRvhzo+CjHCDKpzrzDeL4pl9fSkJqOm+XztS2STxqOlOyK9H9fI/sJjGip8aUlkfVQ2x59bIhXmdQM1b2UljSTzbDY2oy4aLo7sSx0D7OClLn6GfYpnRCtc+JjRlOsMgcaBtpn6tQRAff+9cNc8tPnVzmQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=54.243.244.52; helo=smtpbguseast3.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=54.243.244.52; helo=smtpbguseast3.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 62139 seconds by postgrey-1.37 at boromir; Fri, 13 Sep 2024 11:42:12 AEST
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4cVr0G15z2xKQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 11:42:00 +1000 (AEST)
X-QQ-mid: bizesmtpsz10t1726191665tzs1mm
X-QQ-Originating-IP: ntUUR5HCbH45R31EnJtFXoJQJMPf/PsHyejSfRzk1nE=
Received: from HX09040029.powercore.com.cn ( [180.171.104.254])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Sep 2024 09:40:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6794888667536814964
Date: Fri, 13 Sep 2024 09:40:29 +0800
From: Luming Yu <luming.yu@shingroup.cn>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au, npiggin@gmail.com, jialong.yang@shingroup.cn,
	luming.yu@gmail.com
Subject: Re: [PATCH 1/2] powerpc/entry: convert to common and generic entry
Message-ID: <153FD6B5CE4F97D9+ZuOYDQ-iHIIwJjbh@HX09040029.powercore.com.cn>
References: <B4ABABEA5F13B86A+20240912082500.1469-1-luming.yu@shingroup.cn>
 <fc509bcd-5ca0-4dc2-962e-766a01cbe4fb@csgroup.eu>
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
In-Reply-To: <fc509bcd-5ca0-4dc2-962e-766a01cbe4fb@csgroup.eu>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1

On Thu, Sep 12, 2024 at 12:23:29PM +0200, Christophe Leroy wrote:
> 
> 
> Le 12/09/2024 à 10:24, Luming Yu a écrit :
> > From: Yu Luming <luming.yu@gmail.com>
> > 
> > convert powerpc entry code in syscall and fault to use syscall_work
> > and irqentry_state as well as common calls from generic entry infrastructure.
> > 
> > Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> > ---
> >   arch/powerpc/Kconfig                   | 1 +
> >   arch/powerpc/include/asm/hw_irq.h      | 5 +++++
> >   arch/powerpc/include/asm/processor.h   | 6 ++++++
> >   arch/powerpc/include/asm/syscall.h     | 5 +++++
> >   arch/powerpc/include/asm/thread_info.h | 1 +
> >   arch/powerpc/kernel/syscall.c          | 6 +++++-
> >   arch/powerpc/mm/fault.c                | 5 +++++
> >   7 files changed, 28 insertions(+), 1 deletion(-)
> 
> There is another build problem:
> 
>   CC      kernel/entry/common.o
> kernel/entry/common.c: In function 'irqentry_exit':
> kernel/entry/common.c:335:21: error: implicit declaration of function
> 'regs_irqs_disabled'; did you mean 'raw_irqs_disabled'?
> [-Werror=implicit-function-declaration]
>   335 |         } else if (!regs_irqs_disabled(regs)) {
>       |                     ^~~~~~~~~~~~~~~~~~
>       |                     raw_irqs_disabled
> 
> 
> You have put regs_irqs_disabled() in a section dedicated to PPC64, so it
> fails on PPC32.
> 
> 
> After fixing this problem and providing an empty asm/entry-common.h it is
> now possible to build the kernel. But that's not enough, the board is stuck
> after:
> 
> ...
> [    2.871391] Freeing unused kernel image (initmem) memory: 1228K
> [    2.877990] Run /init as init process

Thanks for these questions. :-)
I haven't gotten chance to run it in ppc32 qemu.
the common syscall trace enter lost this hunk
-       if (!is_32bit_task())
-               audit_syscall_entry(regs->gpr[0], regs->gpr[3], regs->gpr[4],
-                                   regs->gpr[5], regs->gpr[6]);
-       else
-               audit_syscall_entry(regs->gpr[0],
-                                   regs->gpr[3] & 0xffffffff,
-                                   regs->gpr[4] & 0xffffffff,
-                                   regs->gpr[5] & 0xffffffff,
-                                   regs->gpr[6] & 0xffffffff);
which I don't understand whether we need a arch callbacks for it.

Before I sent out the RFC patch set, the very limited compile and boot test goes well with a ppc64 qemu VM. Surely, there will be a lot of test, debug and following up patch set update that is necessary to make it a complete convert.

And the patch set should really be re-named to RFC and v1. 

Cheers  

> 
> 
> Christophe
> 


