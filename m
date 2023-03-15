Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE666BA5A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 04:31:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pbwt86PKsz3f3f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 14:31:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y4Xfb9GP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbwsF69DFz3c34
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 14:30:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y4Xfb9GP;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PbwsD5yWpz4x84;
	Wed, 15 Mar 2023 14:30:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678851057;
	bh=C7o8lZh3la+ARp61z8zX6UlIB4h8fhIN+XU5tYi7KB0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y4Xfb9GPvbRw5uGbXL63+VlFYKqkhM0em93sqrwXQ3jtjVdQG7I5/RRzdywXnxaLv
	 Qs86OVOrG4x2xmskRRROfNwCbWG+f+WYsRgHdGoA61lhSC7syfhItgq1J4OPpu+N05
	 xgrEkm1H8u41Gaa01iPVxR01SoQPyk/z6pAsgUCIfGG2nnMY9lx0bzjt1ZioQRhxkj
	 BK5mNLbp68pLzx9GdxsBIBatRkWEi35qjme6bdZclGD3j46IZT7Dai3oE+iNXDgFoa
	 2AIqdYbkJ56scPzCt0U4ps1z4d5/4TU3CqQtfrN3YoWWg8vycJqF6uPKZQUAJISHKR
	 jpBKKO4r0ih6A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrea Righi <andrea.righi@canonical.com>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: boot regression on ppc64 with linux 6.2
In-Reply-To: <ZA7oJr1/Z4vzWy4N@righiandr-XPS-13-7390>
References: <ZA7oJr1/Z4vzWy4N@righiandr-XPS-13-7390>
Date: Wed, 15 Mar 2023 14:30:53 +1100
Message-ID: <878rfyofma.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrea Righi <andrea.righi@canonical.com> writes:
> I'm triggering the following bug when booting my qemu powerpc VM:

I'm not seeing that here :/

Can you give a bit more detail?
 - qemu version
 - qemu command line
 - what userspace are you using?
 - full dmesg of the failing case

> event-sources: Unable to request interrupt 23 for /event-sources/hot-plug-events
> WARNING: CPU: 0 PID: 1 at arch/powerpc/platforms/pseries/event_sources.c:26 request_event_sources_irqs+0xbc/0xf0
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.2.2-kc #1
> Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1200 0xf000005 of:SLOF,HEAD pSeries
> NIP:  c000000002022eec LR: c000000002022ee8 CTR: 0000000000000000
> REGS: c000000003483910 TRAP: 0700   Tainted: G        W           (6.2.2-kc)
> MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24483200  XER: 00000000
> CFAR: c000000000180838 IRQMASK: 0 
> GPR00: c000000002022ee8 c000000003483bb0 c000000001a5ce00 0000000000000050 
> GPR04: c000000002437d78 c000000002437e28 0000000000000001 0000000000000001 
> GPR08: c000000002437d00 0000000000000001 0000000000000000 0000000044483200 
> GPR12: 0000000000000000 c000000002720000 c000000000012758 0000000000000000 
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> GPR24: 0000000000000000 c0000000020033fc cccccccccccccccd c0000000000e07f0 
> GPR28: c000000000db0520 0000000000000000 c0000000fff92ac0 0000000000000017 
> NIP [c000000002022eec] request_event_sources_irqs+0xbc/0xf0
> LR [c000000002022ee8] request_event_sources_irqs+0xb8/0xf0
> Call Trace:
> [c000000003483bb0] [c000000002022ee8] request_event_sources_irqs+0xb8/0xf0 (unreliable)
> [c000000003483c40] [c000000002022fa0] __machine_initcall_pseries_init_ras_hotplug_IRQ+0x80/0xb0
> [c000000003483c70] [c0000000000121b8] do_one_initcall+0x98/0x300
> [c000000003483d50] [c000000002004b28] kernel_init_freeable+0x2ec/0x370
> [c000000003483df0] [c000000000012780] kernel_init+0x30/0x190
> [c000000003483e50] [c00000000000cf5c] ret_from_kernel_thread+0x5c/0x64
> --- interrupt: 0 at 0x0
>
> I did a bisect it and it seems that the offending commit is:
> baa49d81a94b ("powerpc/pseries: hvcall stack frame overhead")
>
> Reverting that and also dfecd06bc552 ("powerpc: remove
> STACK_FRAME_OVERHEAD"), because we need to re-introduce
> STACK_FRAME_OVERHEAD, seems to fix everything.

That function doesn't make a hcall, so presumably there was some earlier
problem which we only detect here.

cheers
