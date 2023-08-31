Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0078E5CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 07:37:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KHPrudNz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbqgc3l77z3c9t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 15:37:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KHPrudNz;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rbqfm11Mvz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 15:37:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1693460224;
	bh=mcJI19k1bYWrsUV5RrSLseHCYsvRJp714W7vtEfnAuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KHPrudNz58s2FxY40QbiANhLtETTg3IVisYvwKTSN3A26Y7DWbl7e4lQXj9sr3w+S
	 7r9x5m0OqvSIZJasmu4WwN1APOTQQUDfNXAS/8ut0mhRQk8X3dFyMuWQBUEICNyZhA
	 2xFpt1sliwhFxJUz5n9BWh9VmOG2qaaAjzqmOWPAz8S+ISKGzSnJsygTu+KqNCdR9K
	 W5COGeoRbzYAhMFM3iDi2s4bsnkzchbtmkAu0AK7m/fkYxTycrJ7A5iJ5QQUy7CJMv
	 UYT9pqgcvX2x2jYCA/h2j5VFzlDteL3enwyq6MzBHrgcke4o2q5kusK1UtTHxW6uGk
	 ikdmejXy4VZgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rbqfl3jrDz4wy0;
	Thu, 31 Aug 2023 15:37:03 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andreas Schwab <schwab@linux-m68k.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>
Subject: Re: [PATCH v2 1/2] maple_tree: Disable mas_wr_append() when other
 readers are possible
In-Reply-To: <87bkeotin8.fsf@igel.home>
References: <20230819004356.1454718-1-Liam.Howlett@oracle.com>
 <20230819004356.1454718-2-Liam.Howlett@oracle.com>
 <87bkeotin8.fsf@igel.home>
Date: Thu, 31 Aug 2023 15:37:02 +1000
Message-ID: <87y1hr22o1.fsf@mail.lhotse>
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, maple-tree@lists.infradead.org, linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andreas Schwab <schwab@linux-m68k.org> writes:
> This breaks booting on ppc32:

Does enabling CONFIG_DEBUG_ATOMIC_SLEEP fix the crash? It did for me on
qemu.

cheers

> Kernel attemptd to writ user page (1ff0) - exploit attempt? (uid: 0)
> BUG: Unable to handle kernel data access on write at 0x00001ff0
> Faulting instruction address: 0xc0009554
> Vector: 300 (Data Access) at [c0b09d10]
>     pc: c0009554: do_softirq_own_stack+0x18/0x30
>     lr: c004f480: __irq_exit_rcu+0x70/0xc0
>     sp: c0b09dd0
>    msr: 1032
>    dar: 1ff0
>  dsisr: 42000000
>   current = 0xc0a08360
>     pid   = 0, comm = swapper
> Linux version 6.5.0 ...
> enter ? for help
> [c0b09de0] c00ff480 __irq_exit_rcu+0x70/0xc0
> [c0b09df0] c0005a98 Decrementer_virt+0x108/0x10c
> --- Exception: 900 (Decrementer) at c06cfa0c __schedule+0x4fc/0x510
> [c0b09ec0] c06cf75c __schedule+0x1cc/0x510 (unreliable)
> [c0b09ef0] c06cfc90 __cond_resched+0x2c/0x54
> [c0b09f00] c06d07f8 mutex_lock_killable+0x18/0x5c
> [c0b09f10] c013c404 pcpu_alloc+0x110/0x4dc
> [c0b09f70] c000cc34 alloc_descr.isra.18+0x48/0x144
> [c0b09f90] c0988aa0 early_irq_init+0x64/0x8c
> [c0b09fa0] c097a5a4 start_kernel+0x5b4/0x7b0
> [c0b09ff0] 00003dc0
> mon>
>
> -- 
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."
