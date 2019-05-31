Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C47F230F5A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 15:54:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FmCM74L7zDqSc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 23:54:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Fm961zlYzDqGC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 23:52:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45Fm950sQNz9s3Z;
 Fri, 31 May 2019 23:52:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-next@vger.kernel.org
Subject: Re: [next-20190530] Boot failure on PowerPC
In-Reply-To: <79EEB945-661A-41AD-8B26-2FD3B3F84697@linux.vnet.ibm.com>
References: <79EEB945-661A-41AD-8B26-2FD3B3F84697@linux.vnet.ibm.com>
Date: Fri, 31 May 2019 23:52:21 +1000
Message-ID: <87h89aohnu.fsf@concordia.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
> Latest next fails to boot with a kernel panic on POWER9.
>
> [   33.689332] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: write_irq_affinity.isra.5+0x15c/0x160
> [   33.689346] CPU: 35 PID: 4907 Comm: irqbalance Not tainted 5.2.0-rc2-next-20190530-autotest-autotest #1
> [   33.689352] Call Trace:
> [   33.689356] [c0000018d974bab0] [c000000000b5328c] dump_stack+0xb0/0xf4 (unreliable)
> [   33.689364] [c0000018d974baf0] [c000000000120694] panic+0x16c/0x408
> [   33.689370] [c0000018d974bb80] [c00000000012010c] __stack_chk_fail+0x2c/0x30
> [   33.689376] [c0000018d974bbe0] [c0000000001b859c] write_irq_affinity.isra.5+0x15c/0x160
> [   33.689383] [c0000018d974bd30] [c0000000004d6f30] proc_reg_write+0x90/0x110
> [   33.689388] [c0000018d974bd60] [c00000000041453c] __vfs_write+0x3c/0x70
> [   33.689394] [c0000018d974bd80] [c000000000418650] vfs_write+0xd0/0x250
> [   33.689399] [c0000018d974bdd0] [c000000000418a2c] ksys_write+0x7c/0x130
> [   33.689405] [c0000018d974be20] [c00000000000b688] system_call+0x5c/0x70
>
> Machine boots till login prompt and then panics few seconds later.
>
> Last known next build was May 24th. Will attempt few builds till May 30 to
> narrow down this problem.

My CI was fine with next-20190529 (9a15d2e3fd03e3).

cheers
