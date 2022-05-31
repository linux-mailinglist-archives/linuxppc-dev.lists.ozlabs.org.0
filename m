Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A7A538B58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 08:22:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LC2HZ0gfQz3c8T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 16:22:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aJPovUqG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC2Gx2RR1z30gd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 16:21:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aJPovUqG;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LC2Gx1THNz4xZK;
	Tue, 31 May 2022 16:21:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1653978089;
	bh=hA2+qCVUaFsRK+tIdoI5KcdEVKaUAZx6jHnZdgtOsS0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aJPovUqGJyFQMKLvaOHzCEypjq6J9Vv9uY5xeGiynouWyQWsdZYEfFY+n3Djz+DEG
	 lf1ECLLKMQMSeADGdUOcyAI1iRRBNbMXOfdlfjJkE2BtI7vlHjAY2UUabdo/G9ijDd
	 o+dn03kk6TnW87eVazGwWnaBmukxFvlcorSFk4pGOlCebiwWwH6KWfbi86anlC3wfd
	 MyfTKip7I1BvGoc4VKhIi3NJQQhCxbnQcBKpE1gz1N9D7iOsPmQ5tvH7Xq7HXa6Y6T
	 DxxNXYYacA8jQmLG74Z6TVx2uFmvQ7pH1XXaKh+HzUKPgfRplBDMA1riUZ/4LbKiWW
	 /R0duKJbDg26g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/irq: Increase stack_overflow detection limit
 when KASAN is enabled
In-Reply-To: <a07c6616ea19a28e9af6008b58ff6ac6ae90efa1.1653927631.git.christophe.leroy@csgroup.eu>
References: <a07c6616ea19a28e9af6008b58ff6ac6ae90efa1.1653927631.git.christophe.leroy@csgroup.eu>
Date: Tue, 31 May 2022 16:21:28 +1000
Message-ID: <87ee0akys7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Arnd Bergmann <arnd@arndb.de>, Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> When KASAN is enabled, as shown by the Oops below, the 2k limit is not
> enough to allow stack dump after a stack overflow detection when
> CONFIG_DEBUG_STACKOVERFLOW is selected:
>
> 	do_IRQ: stack overflow: 1984
> 	CPU: 0 PID: 126 Comm: systemd-udevd Not tainted 5.18.0-gentoo-PMacG4 #1
> 	Call Trace:
> 	Oops: Kernel stack overflow, sig: 11 [#1]
> 	BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 PowerMac
> 	Modules linked in: sr_mod cdrom radeon(+) ohci_pci(+) hwmon i2c_algo_bit drm_ttm_helper ttm drm_dp_helper snd_aoa_i2sbus snd_aoa_soundbus snd_pcm ehci_pci snd_timer ohci_hcd snd ssb ehci_hcd 8250_pci soundcore drm_kms_helper pcmcia 8250 pcmcia_core syscopyarea usbcore sysfillrect 8250_base sysimgblt serial_mctrl_gpio fb_sys_fops usb_common pkcs8_key_parser fuse drm drm_panel_orientation_quirks configfs
> 	CPU: 0 PID: 126 Comm: systemd-udevd Not tainted 5.18.0-gentoo-PMacG4 #1
> 	NIP:  c02e5558 LR: c07eb3bc CTR: c07f46a8
> 	REGS: e7fe9f50 TRAP: 0000   Not tainted  (5.18.0-gentoo-PMacG4)
> 	MSR:  00001032 <ME,IR,DR,RI>  CR: 44a14824  XER: 20000000
>
> 	GPR00: c07eb3bc eaa1c000 c26baea0 eaa1c0a0 00000008 00000000 c07eb3bc eaa1c010
> 	GPR08: eaa1c0a8 04f3f3f3 f1f1f1f1 c07f4c84 44a14824 0080f7e4 00000005 00000010
> 	GPR16: 00000025 eaa1c154 eaa1c158 c0dbad64 00000020 fd543810 eaa1c0a0 eaa1c29e
> 	GPR24: c0dbad44 c0db8740 05ffffff fd543802 eaa1c150 c0c9a3c0 eaa1c0a0 c0c9a3c0
> 	NIP [c02e5558] kasan_check_range+0xc/0x2b4
> 	LR [c07eb3bc] format_decode+0x80/0x604
> 	Call Trace:
> 	[eaa1c000] [c07eb3bc] format_decode+0x80/0x604 (unreliable)
> 	[eaa1c070] [c07f4dac] vsnprintf+0x128/0x938
> 	[eaa1c110] [c07f5788] sprintf+0xa0/0xc0
> 	[eaa1c180] [c0154c1c] __sprint_symbol.constprop.0+0x170/0x198
> 	[eaa1c230] [c07ee71c] symbol_string+0xf8/0x260
> 	[eaa1c430] [c07f46d0] pointer+0x15c/0x710
> 	[eaa1c4b0] [c07f4fbc] vsnprintf+0x338/0x938
> 	[eaa1c550] [c00e8fa0] vprintk_store+0x2a8/0x678
> 	[eaa1c690] [c00e94e4] vprintk_emit+0x174/0x378
> 	[eaa1c6d0] [c00ea008] _printk+0x9c/0xc0
> 	[eaa1c750] [c000ca94] show_stack+0x21c/0x260
> 	[eaa1c7a0] [c07d0bd4] dump_stack_lvl+0x60/0x90
> 	[eaa1c7c0] [c0009234] __do_IRQ+0x170/0x174
> 	[eaa1c800] [c0009258] do_IRQ+0x20/0x34
> 	[eaa1c820] [c00045b4] HardwareInterrupt_virt+0x108/0x10c

Is this actually caused by KASAN? There's no stack frames in there that
are KASAN related AFAICS.

Seems like the 2K limit is never going to be enough even if KASAN is not
enabled. Presumably we just haven't noticed because we don't trigger the
check unless KASAN is enabled.

> ...
>
> Increase the limit to 3k when KASAN is enabled.
>
> While at it remove the 'inline' keywork for check_stack_overflow().
> This function is called only once so it will be inlined regardless.

I'd rather that was a separate change, in case it has some unintended
affect.

> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/irq.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index 873e6dffb868..5ff4cf69fc2f 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -53,6 +53,7 @@
>  #include <linux/vmalloc.h>
>  #include <linux/pgtable.h>
>  #include <linux/static_call.h>
> +#include <linux/sizes.h>
>  
>  #include <linux/uaccess.h>
>  #include <asm/interrupt.h>
> @@ -184,7 +185,7 @@ u64 arch_irq_stat_cpu(unsigned int cpu)
>  	return sum;
>  }
>  
> -static inline void check_stack_overflow(void)
> +static void check_stack_overflow(void)
>  {
>  	long sp;
>  
> @@ -193,11 +194,14 @@ static inline void check_stack_overflow(void)
>

Wouldn't it be cleaner to just do:

#ifdef CONFIG_KASAN
#define STACK_CHECK_LIMIT (3 * 1024)
#else
#define STACK_CHECK_LIMIT (2 * 1024)
#endif

>  	sp = current_stack_pointer & (THREAD_SIZE - 1);
>  
> -	/* check for stack overflow: is there less than 2KB free? */
> -	if (unlikely(sp < 2048)) {
 
+	if (unlikely(sp < STACK_CHECK_LIMIT)) {
 
And then the code could stay as it is?

cheers

> -		pr_err("do_IRQ: stack overflow: %ld\n", sp);
> -		dump_stack();
> -	}
> +	/* check for stack overflow: is there less than 2/3KB free? */
> +	if (!IS_ENABLED(KASAN) && likely(sp >= SZ_2K))
> +		return;
> +	if (IS_ENABLED(KASAN) && likely(sp >= SZ_2K + SZ_1K))
> +		return;
> +
> +	pr_err("do_IRQ: stack overflow: %ld\n", sp);
> +	dump_stack();
>  }
