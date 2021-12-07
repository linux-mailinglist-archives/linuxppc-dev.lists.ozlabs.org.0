Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6846BC92
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:29:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7h3x182rz3cm5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:29:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7h2M1STCz2ypZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:28:27 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7h2M0X1Yz4xgs;
 Wed,  8 Dec 2021 00:28:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <93c9b84d6ec76aaf7b4f03468e22433a6d308674.1638267035.git.christophe.leroy@csgroup.eu>
References: <93c9b84d6ec76aaf7b4f03468e22433a6d308674.1638267035.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/modules: Don't WARN on first module allocation
 tentative
Message-Id: <163888363074.3690807.14433778326427790491.b4-ty@ellerman.id.au>
Date: Wed, 08 Dec 2021 00:27:10 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 30 Nov 2021 11:10:43 +0100, Christophe Leroy wrote:
> module_alloc() first tries to allocate module text within
> 24 bits direct jump from kernel text, and tries a wider
> allocation if first one fails.
> 
> When first allocation fails the following is observed in kernel logs:
> 
> vmap allocation for size 2400256 failed: use vmalloc=<size> to increase size
> systemd-udevd: vmalloc error: size 2395133, vm_struct allocation failed, mode:0xcc0(GFP_KERNEL), nodemask=(null)
> CPU: 0 PID: 127 Comm: systemd-udevd Tainted: G        W         5.15.5-gentoo-PowerMacG4 #9
> Call Trace:
> [e2a53a50] [c0ba0048] dump_stack_lvl+0x80/0xb0 (unreliable)
> [e2a53a70] [c0540128] warn_alloc+0x11c/0x2b4
> [e2a53b50] [c0531be8] __vmalloc_node_range+0xd8/0x64c
> [e2a53c10] [c00338c0] module_alloc+0xa0/0xac
> [e2a53c40] [c027a368] load_module+0x2ae0/0x8148
> [e2a53e30] [c027fc78] sys_finit_module+0xfc/0x130
> [e2a53f30] [c0035098] ret_from_syscall+0x0/0x28
> --- interrupt: c00 at 0x25df10
> NIP:  0025df10 LR: 00416180 CTR: 00000000
> REGS: e2a53f40 TRAP: 0c00   Tainted: G        W          (5.15.5-gentoo-PowerMacG4)
> MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 2822242c  XER: 20000000
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/modules: Don't WARN on first module allocation tentative
      https://git.kernel.org/powerpc/c/f1797e4de1146009c888bcf8b6bb6648d55394f1

cheers
