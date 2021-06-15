Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C79463A8142
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:45:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G48jK2nGQz3hlC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 23:45:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XrN4Q23i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XrN4Q23i; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G48gL5xcHz3h0H
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:44:14 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G48gF6cHCz9sWM;
 Tue, 15 Jun 2021 23:44:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623764649;
 bh=xtqwwSoQU2GXY007fuUsGyMlkT0RqYD5zWipvBOk7Zw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XrN4Q23iSaU1BcOVZXGAkNLY9+aaza8MHreWFZ0UrEYk6FJo4sTQ+UESeF0jGD/7Y
 se9zpuiYVoyHS3fuU9rpJU1xF0E7J8erI6Kj221fA86/AMUHtYq8a/5EGl5VKrxfWd
 PPnIP/LQ0PeL0vggs/NKDl3PmZTGHsrRYJ8YBaAZqFrEZAs2DQ5gMckQSk+aDozLDI
 OaXWk/Fc4AyLWjWGplmpMjoyF++Mzp4Y720AIlh3IRc3b6ecq0X/G6H0WY2DmVzwRE
 No1b6ND8iBovbMj+A6rHOSH3GYUtD4d6cuelBWIEIu14uHpcQK+C/cMZQ8iUGZrsPF
 UH9efWYk9xHSw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 11/11] powerpc/64: use interrupt restart table to
 speed up return from interrupt
In-Reply-To: <20210610130921.706938-12-npiggin@gmail.com>
References: <20210610130921.706938-1-npiggin@gmail.com>
 <20210610130921.706938-12-npiggin@gmail.com>
Date: Tue, 15 Jun 2021 23:44:09 +1000
Message-ID: <87bl87tf86.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
> index fe26f2fa0f3f..fbe94e2d5011 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -412,12 +430,19 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
>  	stop_machine(__do_entry_flush_fixups, &types, NULL);
>  }
>  
> -void do_rfi_flush_fixups(enum l1d_flush_type types)
> +static int __do_rfi_flush_fixups(void *data)
>  {
> +	enum l1d_flush_type types = *(enum l1d_flush_type *)data;
>  	unsigned int instrs[3], *dest;
>  	long *start, *end;
>  	int i;
>  
> +	if (types & L1D_FLUSH_FALLBACK)
> +		rfi_exit_not_reentrant = true;
> +	else
> +		rfi_exit_not_reentrant = false;
> +	update_interrupt_exit();

This is not happy:

[    0.000000][    T0] ============================================
[    0.000000][    T0] WARNING: possible recursive locking detected
[    0.000000][    T0] 5.13.0-rc2-00118-gca433a3a44e3 #1 Not tainted
[    0.000000][    T0] --------------------------------------------
[    0.000000][    T0] swapper/0 is trying to acquire lock:
[    0.000000][    T0] c00000000252fa10 (cpu_hotplug_lock){....}-{0:0}, at: static_key_enable+0x24/0x50
[    0.000000][    T0]
[    0.000000][    T0] but task is already holding lock:
[    0.000000][    T0] c00000000252fa10 (cpu_hotplug_lock){....}-{0:0}, at: stop_machine+0x2c/0x60
[    0.000000][    T0]
[    0.000000][    T0] other info that might help us debug this:
[    0.000000][    T0]  Possible unsafe locking scenario:
[    0.000000][    T0]
[    0.000000][    T0]        CPU0
[    0.000000][    T0]        ----
[    0.000000][    T0]   lock(cpu_hotplug_lock);
[    0.000000][    T0]   lock(cpu_hotplug_lock);
[    0.000000][    T0]
[    0.000000][    T0]  *** DEADLOCK ***
[    0.000000][    T0]
[    0.000000][    T0]  May be due to missing lock nesting notation
[    0.000000][    T0]
[    0.000000][    T0] 1 lock held by swapper/0:
[    0.000000][    T0]  #0: c00000000252fa10 (cpu_hotplug_lock){....}-{0:0}, at: stop_machine+0x2c/0x60
[    0.000000][    T0]
[    0.000000][    T0] stack backtrace:
[    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.0-rc2-00118-gca433a3a44e3 #1
[    0.000000][    T0] Call Trace:
[    0.000000][    T0] [c0000000027db8f0] [c00000000093dd28] dump_stack+0xec/0x144 (unreliable)
[    0.000000][    T0] [c0000000027db940] [c0000000001ed5b4] __lock_acquire+0x1744/0x28b0
[    0.000000][    T0] [c0000000027dba70] [c0000000001ef338] lock_acquire+0x128/0x600
[    0.000000][    T0] [c0000000027dbb70] [c00000000015035c] cpus_read_lock+0x4c/0x170
[    0.000000][    T0] [c0000000027dbba0] [c0000000003c2594] static_key_enable+0x24/0x50
[    0.000000][    T0] [c0000000027dbbd0] [c0000000000ae87c] __do_rfi_flush_fixups+0x7c/0x300
[    0.000000][    T0] [c0000000027dbc80] [c0000000002ab7e4] stop_machine_cpuslocked+0xe4/0x200
[    0.000000][    T0] [c0000000027dbcf0] [c0000000002ab940] stop_machine+0x40/0x60
[    0.000000][    T0] [c0000000027dbd30] [c0000000000aef30] do_rfi_flush_fixups+0x30/0x50
[    0.000000][    T0] [c0000000027dbd60] [c000000000040890] setup_rfi_flush+0xa0/0x140
[    0.000000][    T0] [c0000000027dbdd0] [c00000000201c6c4] pnv_setup_arch+0x304/0x4ac
[    0.000000][    T0] [c0000000027dbe60] [c00000000200a31c] setup_arch+0x374/0x3c4
[    0.000000][    T0] [c0000000027dbee0] [c000000002003d08] start_kernel+0xb0/0x790
[    0.000000][    T0] [c0000000027dbf90] [c00000000000d79c] start_here_common+0x1c/0x600
[    0.000000][    T0] rfi-flush: patched 12 locations (fallback displacement flush)


cheers
