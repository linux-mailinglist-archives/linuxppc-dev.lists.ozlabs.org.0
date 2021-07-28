Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8BA3D9462
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 19:36:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZgn436PVz3ccN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 03:36:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DT4jVR33;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DT4jVR33; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZgmX1T0lz30FM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 03:35:40 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BFC916103E;
 Wed, 28 Jul 2021 17:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627493736;
 bh=Dd5+s2KkNCc4fOScdHWL03hrtCdA/vqdiUXce7gQov4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DT4jVR33VjkDxlTcx4mFdRVbMKV0SwbakzDTTSn8m3wG1bNTwGtCw3eAiOBDHk4js
 gBtZdbFBMA/MQlehtcvUO38qj7sAKD0cQmrNCgX2F7qiPaFhN6VlIBTfX1JEiUUtug
 D66LjOl8Z6M9snQlNPzd3dWtzE8f8HSL4x0XcYUCj+KSfsXWh6tNK1PchWkUlXDb9j
 mBDpB5xciM6JTDDirU/EO4XDc48XTWap5NHRhOLeq1QQxOlvh+nYcqT3hgmFOq4w/Y
 Ssr+t+ndCBw/OlODG9bza0kfb3OT4PLzz84gIVSri3tcEg4866ofDAkFh4tnRtYqYO
 Be4vpNfkun+3w==
Date: Wed, 28 Jul 2021 10:35:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [powerpc][next-20210727] Boot failure - kernel BUG at
 arch/powerpc/kernel/interrupt.c:98!
Message-ID: <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
References: <1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com>
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
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 linux-next@vger.kernel.org, Claire Chang <tientzu@chromium.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 28, 2021 at 01:31:06PM +0530, Sachin Sant wrote:
> linux-next fails to boot on Power server (POWER8/POWER9). Following traces
> are seen during boot
> 
> [    0.010799] software IO TLB: tearing down default memory pool
> [    0.010805] ------------[ cut here ]------------
> [    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!
> [    0.010812] Oops: Exception in kernel mode, sig: 5 [#1]
> [    0.010816] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> [    0.010820] Modules linked in:
> [    0.010824] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc3-next-20210727 #1
> [    0.010830] NIP:  c000000000032cfc LR: c00000000000c764 CTR: c00000000000c670
> [    0.010834] REGS: c000000003603b10 TRAP: 0700   Not tainted  (5.14.0-rc3-next-20210727)
> [    0.010838] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28000222  XER: 00000002
> [    0.010848] CFAR: c00000000000c760 IRQMASK: 3 
> [    0.010848] GPR00: c00000000000c764 c000000003603db0 c0000000029bd000 0000000000000001 
> [    0.010848] GPR04: 0000000000000a68 0000000000000400 c000000003603868 ffffffffffffffff 
> [    0.010848] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000003 
> [    0.010848] GPR12: ffffffffffffffff c00000001ec9ee80 c000000000012a28 0000000000000000 
> [    0.010848] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [    0.010848] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [    0.010848] GPR24: 000000000000f134 0000000000000000 ffffffffffffffff c000000003603868 
> [    0.010848] GPR28: 0000000000000400 0000000000000a68 c00000000202e9c0 c000000003603e80 
> [    0.010896] NIP [c000000000032cfc] system_call_exception+0x8c/0x2e0
> [    0.010901] LR [c00000000000c764] system_call_common+0xf4/0x258
> [    0.010907] Call Trace:
> [    0.010909] [c000000003603db0] [c00000000016a6dc] calculate_sigpending+0x4c/0xe0 (unreliable)
> [    0.010915] [c000000003603e10] [c00000000000c764] system_call_common+0xf4/0x258
> [    0.010921] --- interrupt: c00 at kvm_template_end+0x4/0x8
> [    0.010926] NIP:  c000000000092dec LR: c000000000114fc8 CTR: 0000000000000000
> [    0.010930] REGS: c000000003603e80 TRAP: 0c00   Not tainted  (5.14.0-rc3-next-20210727)
> [    0.010934] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28000222  XER: 00000000
> [    0.010943] IRQMASK: 0 
> [    0.010943] GPR00: c00000000202e9c0 c000000003603b00 c0000000029bd000 000000000000f134 
> [    0.010943] GPR04: 0000000000000a68 0000000000000400 c000000003603868 ffffffffffffffff 
> [    0.010943] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [    0.010943] GPR12: 0000000000000000 c00000001ec9ee80 c000000000012a28 0000000000000000 
> [    0.010943] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [    0.010943] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [    0.010943] GPR24: c0000000020033c4 c00000000110afc0 c000000002081950 c000000003277d40 
> [    0.010943] GPR28: 0000000000000000 c00000000a680000 0000000004000000 00000000000d0000 
> [    0.010989] NIP [c000000000092dec] kvm_template_end+0x4/0x8
> [    0.010993] LR [c000000000114fc8] set_memory_encrypted+0x38/0x60
> [    0.010999] --- interrupt: c00
> [    0.011001] [c000000003603b00] [c00000000000c764] system_call_common+0xf4/0x258 (unreliable)
> [    0.011008] Instruction dump:
> [    0.011011] 694a0003 312affff 7d495110 0b0a0000 60000000 60000000 e87f0108 68690002 
> [    0.011019] 7929ffe2 0b090000 68634000 786397e2 <0b030000> e93f0138 792907e0 0b090000 
> [    0.011029] ---[ end trace a20ad55589efcb10 ]---
> [    0.012297] 
> [    1.012304] Kernel panic - not syncing: Fatal exception
> 
> next-20210723 was good. The boot failure seems to have been introduced with next-20210726.
> 
> I have attached the boot log.

I noticed this with OpenSUSE's ppc64le config [1] and my bisect landed on
commit ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()"). That
series just keeps on giving... Adding some people from that thread to
this one. Original thread:
https://lore.kernel.org/r/1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com/

[1]: https://github.com/openSUSE/kernel-source/raw/master/config/ppc64le/default

Cheers,
Nathan
