Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA8615D8D8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 14:56:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Jw0G1tLTzDqZF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 00:56:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=XCEyVK5P; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JvyB2rv2zDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 00:54:42 +1100 (AEDT)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 166DA206ED;
 Fri, 14 Feb 2020 13:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581688479;
 bh=wz0k6GqQmi+Fvcb/lnayt8W8UqC9MtsNkbxEZ8jAoEk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XCEyVK5Po4EwK1bFoT+cnmsZVUFhLEE6vq4GV84ShsWy/CUEOYpnwIJXRZoUqdq+m
 vkiwPvcDifpDt2UD3F00h/o18e7e0I6R8xb2+ihC9swq9bMvJyvdzV4CI4o9wC0tw6
 655SKCpWO0SwmojpMXzbdmjbeJov1Tajdi1By6Ls=
Date: Fri, 14 Feb 2020 22:54:34 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/kprobes: Fix trap address when trap happened in
 real mode
Message-Id: <20200214225434.464ec467ad9094961abb8ddc@kernel.org>
In-Reply-To: <b1451438f7148ad0e03306a1f1409f4ad1d6ec7c.1581684263.git.christophe.leroy@c-s.fr>
References: <b1451438f7148ad0e03306a1f1409f4ad1d6ec7c.1581684263.git.christophe.leroy@c-s.fr>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Paul Mackerras <paulus@samba.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 stable@kernel.vger.org, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, 14 Feb 2020 12:47:49 +0000 (UTC)
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> When a program check exception happens while MMU translation is
> disabled, following Oops happens in kprobe_handler() in the following
> test:
> 
> 		} else if (*addr != BREAKPOINT_INSTRUCTION) {

Thanks for the report and patch. I'm not so sure about powerpc implementation
but at where the MMU translation is disabled, can the handler work correctly?
(And where did you put the probe on?)

Your fix may fix this Oops, but if the handler needs special care, it is an
option to blacklist such place (if possible).

Anyway, Naveen, can you review it?

Thank you,

> 
> [   33.098554] BUG: Unable to handle kernel data access on read at 0x0000e268
> [   33.105091] Faulting instruction address: 0xc000ec34
> [   33.110010] Oops: Kernel access of bad area, sig: 11 [#1]
> [   33.115348] BE PAGE_SIZE=16K PREEMPT CMPC885
> [   33.119540] Modules linked in:
> [   33.122591] CPU: 0 PID: 429 Comm: cat Not tainted 5.6.0-rc1-s3k-dev-00824-g84195dc6c58a #3267
> [   33.131005] NIP:  c000ec34 LR: c000ecd8 CTR: c019cab8
> [   33.136002] REGS: ca4d3b58 TRAP: 0300   Not tainted  (5.6.0-rc1-s3k-dev-00824-g84195dc6c58a)
> [   33.144324] MSR:  00001032 <ME,IR,DR,RI>  CR: 2a4d3c52  XER: 00000000
> [   33.150699] DAR: 0000e268 DSISR: c0000000
> [   33.150699] GPR00: c000b09c ca4d3c10 c66d0620 00000000 ca4d3c60 00000000 00009032 00000000
> [   33.150699] GPR08: 00020000 00000000 c087de44 c000afe0 c66d0ad0 100d3dd6 fffffff3 00000000
> [   33.150699] GPR16: 00000000 00000041 00000000 ca4d3d70 00000000 00000000 0000416d 00000000
> [   33.150699] GPR24: 00000004 c53b6128 00000000 0000e268 00000000 c07c0000 c07bb6fc ca4d3c60
> [   33.188015] NIP [c000ec34] kprobe_handler+0x128/0x290
> [   33.192989] LR [c000ecd8] kprobe_handler+0x1cc/0x290
> [   33.197854] Call Trace:
> [   33.200340] [ca4d3c30] [c000b09c] program_check_exception+0xbc/0x6fc
> [   33.206590] [ca4d3c50] [c000e43c] ret_from_except_full+0x0/0x4
> [   33.212392] --- interrupt: 700 at 0xe268
> [   33.270401] Instruction dump:
> [   33.273335] 913e0008 81220000 38600001 3929ffff 91220000 80010024 bb410008 7c0803a6
> [   33.280992] 38210020 4e800020 38600000 4e800020 <813b0000> 6d2a7fe0 2f8a0008 419e0154
> [   33.288841] ---[ end trace 5b9152d4cdadd06d ]---
> 
> Check MSR and convert regs->nip to virtual address if the trap
> happened with MSR_IR cleared.
> 
> Reported-by: Larry Finger <Larry.Finger@lwfinger.net>
> Fixes: 6cc89bad60a6 ("powerpc/kprobes: Invoke handlers directly")
> Cc: stable@kernel.vger.org
> Cc: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> ---
> The bug might have existed even before that commit from Naveen.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/kprobes.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 2d27ec4feee4..f8b848aa65bd 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -23,6 +23,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/sstep.h>
>  #include <asm/sections.h>
> +#include <asm/io.h>
>  #include <linux/uaccess.h>
>  
>  DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
> @@ -264,6 +265,9 @@ int kprobe_handler(struct pt_regs *regs)
>  	if (user_mode(regs))
>  		return 0;
>  
> +	if (!(regs->msr & MSR_IR))
> +		addr = phys_to_virt(regs->nip);
> +
>  	/*
>  	 * We don't want to be preempted for the entire
>  	 * duration of kprobe processing
> -- 
> 2.25.0
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
