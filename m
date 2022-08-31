Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 895CD5A7E65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 15:13:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHl3c3Jlbz3c5p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 23:13:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHl2t2rT1z3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 23:12:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHl2s5cH8z4xGH;
	Wed, 31 Aug 2022 23:12:37 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Pali Rohár <pali@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <20220820115113.30581-1-pali@kernel.org>
References: <20220820115113.30581-1-pali@kernel.org>
Subject: Re: [PATCH] powerpc/pci: Enable PCI domains in /proc when PCI bus numbers are not unique
Message-Id: <166195152193.42804.17969929640404291895.b4-ty@ellerman.id.au>
Date: Wed, 31 Aug 2022 23:12:01 +1000
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 20 Aug 2022 13:51:13 +0200, Pali Rohár wrote:
> On 32-bit powerpc systems with more PCIe controllers and more PCI domains,
> where on more PCI domains are same PCI numbers, when kernel is compiled
> with CONFIG_PROC_FS=y and CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT=y
> options, kernel prints "proc_dir_entry 'pci/01' already registered" error
> message.
> 
>   [    1.708861] ------------[ cut here ]------------
>   [    1.713429] proc_dir_entry 'pci/01' already registered
>   [    1.718595] WARNING: CPU: 0 PID: 1 at fs/proc/generic.c:377 proc_register+0x1a8/0x1ac
>   [    1.726361] Modules linked in:
>   [    1.729404] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.19.0-rc5-0caacb197b677410bdac81bc34f05235+ #109
>   [    1.740183] NIP:  c02846e8 LR: c02846e8 CTR: c0015154
>   [    1.745225] REGS: c146fc90 TRAP: 0700   Tainted: G        W          (5.19.0-rc5-0caacb197b677410bdac81bc34f05235+)
>   [    1.755657] MSR:  00029000 <CE,EE,ME>  CR: 28000822  XER: 00000000
>   [    1.761829]
>   [    1.761829] GPR00: c02846e8 c146fd80 c14a8000 0000002a 3fffefff c146fc40 c146fc38 00000000
>   [    1.761829] GPR08: 3fffefff 00000000 00000000 c10ac04c 24000824 00000000 c0004548 00000000
>   [    1.761829] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000007
>   [    1.761829] GPR24: c10000d0 c167da54 c167da00 c1120000 c167dd6c c10b4abc c167dc58 c167dd00
>   [    1.796707] NIP [c02846e8] proc_register+0x1a8/0x1ac
>   [    1.801663] LR [c02846e8] proc_register+0x1a8/0x1ac
>   [    1.806532] Call Trace:
>   [    1.808966] [c146fd80] [c02846e8] proc_register+0x1a8/0x1ac (unreliable)
>   [    1.815659] [c146fdb0] [c028481c] _proc_mkdir+0x78/0xa4
>   [    1.820875] [c146fdd0] [c05a92e4] pci_proc_attach_device+0x11c/0x168
>   [    1.827221] [c146fe10] [c101f7a4] pci_proc_init+0x80/0x98
>   [    1.832611] [c146fe30] [c0004150] do_one_initcall+0x80/0x284
>   [    1.838262] [c146fea0] [c10011a8] kernel_init_freeable+0x1f4/0x2a0
>   [    1.844434] [c146fee0] [c000456c] kernel_init+0x24/0x150
>   [    1.849737] [c146ff00] [c001326c] ret_from_kernel_thread+0x5c/0x64
>   [    1.855910] Instruction dump:
>   [    1.858866] 83810020 83a10024 83c10028 83e1002c 38210030 4e800020 809a0064 3c60c0a8
>   [    1.866602] 7f85e378 3863af28 4cc63182 4bdb8155 <0fe00000> 9421ffe0 39200000 7c0802a6
>   [    1.874513] ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pci: Enable PCI domains in /proc when PCI bus numbers are not unique
      https://git.kernel.org/powerpc/c/0382a35bef70ecc074db67192ff8d37737d02b21

cheers
