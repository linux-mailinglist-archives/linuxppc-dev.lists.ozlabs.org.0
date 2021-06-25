Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 814EE3B4372
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 14:36:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBGj52VPjz3c1c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 22:36:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=OeYxvhga;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=OeYxvhga; dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBGhZ40Bqz2yyx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 22:36:29 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id EA2CB1FE8E;
 Fri, 25 Jun 2021 12:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624624584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7WwlFfjzZ1Gum+16nGRv3muCKcaRSIAsgxa6F7g7/oU=;
 b=OeYxvhgasMbs1C4iwauKBACmiNMDd0tSDrThewMZ6zKe8VPNyBLvZJimgJIfLDGStY1fqD
 cKyIFjs+gpxRK0TUi+Gke3O3gFGVIw0Rt1k/bWtzIqhFZubH0mQn+FRw5U5DcmjHyChpKo
 ktEb3ho5wyguj6B2R30GozD0getgIAM=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B92B4A3BB4;
 Fri, 25 Jun 2021 12:36:23 +0000 (UTC)
Date: Fri, 25 Jun 2021 14:36:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH printk v3 4/6] printk: remove NMI tracking
Message-ID: <YNXNx68CXrI9QpHD@alley>
References: <20210624111148.5190-1-john.ogness@linutronix.de>
 <20210624111148.5190-5-john.ogness@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624111148.5190-5-john.ogness@linutronix.de>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 Paul Mackerras <paulus@samba.org>, Marc Zyngier <maz@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Sami Tolvanen <samitolvanen@google.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Terrell <terrelln@fb.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2021-06-24 13:17:46, John Ogness wrote:
> All NMI contexts are handled the same as the safe context: store the
> message and defer printing. There is no need to have special NMI
> context tracking for this. Using in_nmi() is enough.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> ---
>  arch/arm/kernel/smp.c       |  2 --
>  arch/powerpc/kexec/crash.c  |  3 ---
>  include/linux/hardirq.h     |  2 --
>  include/linux/printk.h      | 12 ------------
>  init/Kconfig                |  5 -----
>  kernel/printk/internal.h    |  6 ------
>  kernel/printk/printk_safe.c | 37 +------------------------------------
>  kernel/trace/trace.c        |  2 --
>  8 files changed, 1 insertion(+), 68 deletions(-)
> 
> diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
> index 74679240a9d8..0dd2d733ad62 100644
> --- a/arch/arm/kernel/smp.c
> +++ b/arch/arm/kernel/smp.c
> @@ -668,9 +668,7 @@ static void do_handle_IPI(int ipinr)
>  		break;
>  
>  	case IPI_CPU_BACKTRACE:
> -		printk_nmi_enter();
>  		nmi_cpu_backtrace(get_irq_regs());
> -		printk_nmi_exit();

It looks to me that in_nmi() returns false here. As a result,
nmi_cpu_backtrace() might newly call consoles immediately.

If I recall correctly, arm does not have a proper NMI.
And this is just some special case of a "normal" IRQ.

And indeed, nmi_enter() is called only from handle_fiq_as_nmi()
and it is just a boiler plate.

If I am right, we should replace printk_nmi_enter() with
printk_safe_enter_irqsave(flags) or so.

Even better solution might be to call this within
nmi_enter()/nmi_exit(). But I am not sure if this is what
the arm people want.

Best Regards,
Petr

PS: Sigh, I have skipped this patch yesterday because it already had
my Reviewed-by. And I missed it before...
