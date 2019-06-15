Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9B747037
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 15:40:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QzBp3lbhzDrQL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 23:40:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Qz5G1pgKzDrfy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 23:36:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45Qz5D53Mrz9sDX; Sat, 15 Jun 2019 23:35:59 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 934bda59f286d0221f1a3ebab7f5156a996cc37d
X-Patchwork-Hint: ignore
In-Reply-To: <20190603065657.7986-1-dja@axtens.net>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: pseries/hvconsole: fix stack overread via udbg
Message-Id: <45Qz5D53Mrz9sDX@ozlabs.org>
Date: Sat, 15 Jun 2019 23:35:59 +1000 (AEST)
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
Cc: Dmitry Vyukov <dvyukov@google.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-06-03 at 06:56:57 UTC, Daniel Axtens wrote:
> While developing kasan for 64-bit book3s, I hit the following stack
> over-read.
> 
> It occurs because the hypercall to put characters onto the terminal
> takes 2 longs (128 bits/16 bytes) of characters at a time, and so
> hvc_put_chars would unconditionally copy 16 bytes from the argument
> buffer, regardless of supplied length. However, udbg_hvc_putc can
> call hvc_put_chars with a single-byte buffer, leading to the error.
> 
> [    0.001931] ==================================================================                                                  [150/819]
> [    0.001933] BUG: KASAN: stack-out-of-bounds in hvc_put_chars+0xdc/0x110
> [    0.001934] Read of size 8 at addr c0000000023e7a90 by task swapper/0
> [    0.001934]
> [    0.001935] CPU: 0 PID: 0 Comm: swapper Not tainted 5.2.0-rc2-next-20190528-02824-g048a6ab4835b #113
> [    0.001935] Call Trace:
> [    0.001936] [c0000000023e7790] [c000000001b4a450] dump_stack+0x104/0x154 (unreliable)
> [    0.001937] [c0000000023e77f0] [c0000000006d3524] print_address_description+0xa0/0x30c
> [    0.001938] [c0000000023e7880] [c0000000006d318c] __kasan_report+0x20c/0x224
> [    0.001939] [c0000000023e7950] [c0000000006d19d8] kasan_report+0x18/0x30
> [    0.001940] [c0000000023e7970] [c0000000006d4854] __asan_report_load8_noabort+0x24/0x40
> [    0.001941] [c0000000023e7990] [c0000000001511ac] hvc_put_chars+0xdc/0x110
> [    0.001942] [c0000000023e7a10] [c000000000f81cfc] hvterm_raw_put_chars+0x9c/0x110
> [    0.001943] [c0000000023e7a50] [c000000000f82634] udbg_hvc_putc+0x154/0x200
> [    0.001944] [c0000000023e7b10] [c000000000049c90] udbg_write+0xf0/0x240
> [    0.001945] [c0000000023e7b70] [c0000000002e5d88] console_unlock+0x868/0xd30
> [    0.001946] [c0000000023e7ca0] [c0000000002e6e00] register_console+0x970/0xe90
> [    0.001947] [c0000000023e7d80] [c000000001ff1928] register_early_udbg_console+0xf8/0x114
> [    0.001948] [c0000000023e7df0] [c000000001ff1174] setup_arch+0x108/0x790
> [    0.001948] [c0000000023e7e90] [c000000001fe41c8] start_kernel+0x104/0x784
> [    0.001949] [c0000000023e7f90] [c00000000000b368] start_here_common+0x1c/0x534
> [    0.001950]
> [    0.001950]
> [    0.001951] Memory state around the buggy address:
> [    0.001952]  c0000000023e7980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [    0.001952]  c0000000023e7a00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1
> [    0.001953] >c0000000023e7a80: f1 f1 01 f2 f2 f2 00 00 00 00 00 00 00 00 00 00
> [    0.001953]                          ^
> [    0.001954]  c0000000023e7b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [    0.001954]  c0000000023e7b80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [    0.001955] ==================================================================
> 
> Document that a 16-byte buffer is requred, and provide it in udbg.
> 
> CC: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/934bda59f286d0221f1a3ebab7f5156a

cheers
