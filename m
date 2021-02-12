Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCF5319776
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:30:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcDtK4B89zDwpj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:30:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDf51PJZzDvZ2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:19:57 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDf40prGz9sVr; Fri, 12 Feb 2021 11:19:55 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, msuchanek@suse.de,
 Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612796617.git.christophe.leroy@csgroup.eu>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v5 00/22] powerpc/32: Implement C syscall entry/exit
Message-Id: <161308904681.3606979.5796787680805325099.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:19:55 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 8 Feb 2021 15:10:19 +0000 (UTC), Christophe Leroy wrote:
> This series implements C syscall entry/exit for PPC32. It reuses
> the work already done for PPC64.
> 
> This series is based on today's merge-test (b6f72fc05389e3fc694bf5a5fa1bbd33f61879e0)
> 
> In terms on performance we have the following number of cycles on an
> 8xx running null_syscall benchmark:
> - mainline: 296 cycles
> - after patch 4: 283 cycles
> - after patch 16: 304 cycles
> - after patch 17: 348 cycles
> - at the end of the series: 320 cycles
> 
> [...]

Patches 1-15 and 21 applied to powerpc/next.

[01/22] powerpc/32s: Add missing call to kuep_lock on syscall entry
        https://git.kernel.org/powerpc/c/57fdfbce89137ae85cd5cef48be168040a47dd13
[02/22] powerpc/32: Always enable data translation on syscall entry
        https://git.kernel.org/powerpc/c/eca2411040c1ee15b8882c6427fb4eb5a48ada69
[03/22] powerpc/32: On syscall entry, enable instruction translation at the same time as data
        https://git.kernel.org/powerpc/c/76249ddc27080b6b835a89cedcc4185b3b5a6b23
[04/22] powerpc/32: Reorder instructions to avoid using CTR in syscall entry
        https://git.kernel.org/powerpc/c/2c59e5104821c5720e88bafa9e522f8bea9ce8fa
[05/22] powerpc/irq: Add helper to set regs->softe
        https://git.kernel.org/powerpc/c/fb5608fd117a8b48752d2b5a7e70847c1ed33d33
[06/22] powerpc/irq: Rework helpers that manipulate MSR[EE/RI]
        https://git.kernel.org/powerpc/c/08353779f2889305f64e04de3e46ed59ed60f859
[07/22] powerpc/irq: Add stub irq_soft_mask_return() for PPC32
        https://git.kernel.org/powerpc/c/6650c4782d5788346a25a4f698880d124f2699a0
[08/22] powerpc/syscall: Rename syscall_64.c into interrupt.c
        https://git.kernel.org/powerpc/c/ab1a517d55b01b54ba70f5d54f926f5ab4b18339
[09/22] powerpc/syscall: Make interrupt.c buildable on PPC32
        https://git.kernel.org/powerpc/c/344bb20b159dd0996e521c0d4c131a6ae10c322a
[10/22] powerpc/syscall: Use is_compat_task()
        https://git.kernel.org/powerpc/c/72b7a9e56b25babfe4c90bf3ce88285c7fb62ab9
[11/22] powerpc/syscall: Save r3 in regs->orig_r3
        https://git.kernel.org/powerpc/c/8875f47b7681aa4e4484a9b612577b044725f839
[12/22] powerpc/syscall: Change condition to check MSR_RI
        https://git.kernel.org/powerpc/c/c01b916658150e98f00a4981750c37a3224c8735
[13/22] powerpc/32: Always save non volatile GPRs at syscall entry
        https://git.kernel.org/powerpc/c/fbcee2ebe8edbb6a93316f0a189ae7fcfaa7094f
[14/22] powerpc/syscall: implement system call entry/exit logic in C for PPC32
        https://git.kernel.org/powerpc/c/6f76a01173ccaa363739f913394d4e138d92d718
[15/22] powerpc/32: Remove verification of MSR_PR on syscall in the ASM entry
        https://git.kernel.org/powerpc/c/4d67facbcbdb3d9e3c9cb82e4ec47fc63d298dd8
[21/22] powerpc/32: Remove the counter in global_dbcr0
        https://git.kernel.org/powerpc/c/eb595eca74067b78d36fb188b555e30f28686fc7

cheers
