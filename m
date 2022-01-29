Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE4F4A2E12
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 12:15:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmBZY3BYjz3cSW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 22:15:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmBZ65ttcz2ymv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 22:15:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JmBZ44CnLz4xcH;
 Sat, 29 Jan 2022 22:15:08 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220122033429.25395-1-atrajeev@linux.vnet.ibm.com>
References: <20220122033429.25395-1-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] powerpc/perf: Fix power_pmu_disable to call
 clear_pmi_irq_pending only if PMI is pending
Message-Id: <164345486591.1545234.3866440099321840393.b4-ty@ellerman.id.au>
Date: Sat, 29 Jan 2022 22:14:25 +1100
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 22 Jan 2022 09:04:29 +0530, Athira Rajeev wrote:
> Running selftest with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG enabled in kernel
> triggered below warning:
> 
> [  172.851380] ------------[ cut here ]------------
> [  172.851391] WARNING: CPU: 8 PID: 2901 at arch/powerpc/include/asm/hw_irq.h:246 power_pmu_disable+0x270/0x280
> [  172.851402] Modules linked in: dm_mod bonding nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables rfkill nfnetlink sunrpc xfs libcrc32c pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp fuse
> [  172.851442] CPU: 8 PID: 2901 Comm: lost_exception_ Not tainted 5.16.0-rc5-03218-g798527287598 #2
> [  172.851451] NIP:  c00000000013d600 LR: c00000000013d5a4 CTR: c00000000013b180
> [  172.851458] REGS: c000000017687860 TRAP: 0700   Not tainted  (5.16.0-rc5-03218-g798527287598)
> [  172.851465] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48004884  XER: 20040000
> [  172.851482] CFAR: c00000000013d5b4 IRQMASK: 1
> [  172.851482] GPR00: c00000000013d5a4 c000000017687b00 c000000002a10600 0000000000000004
> [  172.851482] GPR04: 0000000082004000 c0000008ba08f0a8 0000000000000000 00000008b7ed0000
> [  172.851482] GPR08: 00000000446194f6 0000000000008000 c00000000013b118 c000000000d58e68
> [  172.851482] GPR12: c00000000013d390 c00000001ec54a80 0000000000000000 0000000000000000
> [  172.851482] GPR16: 0000000000000000 0000000000000000 c000000015d5c708 c0000000025396d0
> [  172.851482] GPR20: 0000000000000000 0000000000000000 c00000000a3bbf40 0000000000000003
> [  172.851482] GPR24: 0000000000000000 c0000008ba097400 c0000000161e0d00 c00000000a3bb600
> [  172.851482] GPR28: c000000015d5c700 0000000000000001 0000000082384090 c0000008ba0020d8
> [  172.851549] NIP [c00000000013d600] power_pmu_disable+0x270/0x280
> [  172.851557] LR [c00000000013d5a4] power_pmu_disable+0x214/0x280
> [  172.851565] Call Trace:
> [  172.851568] [c000000017687b00] [c00000000013d5a4] power_pmu_disable+0x214/0x280 (unreliable)
> [  172.851579] [c000000017687b40] [c0000000003403ac] perf_pmu_disable+0x4c/0x60
> [  172.851588] [c000000017687b60] [c0000000003445e4] __perf_event_task_sched_out+0x1d4/0x660
> [  172.851596] [c000000017687c50] [c000000000d1175c] __schedule+0xbcc/0x12a0
> [  172.851602] [c000000017687d60] [c000000000d11ea8] schedule+0x78/0x140
> [  172.851608] [c000000017687d90] [c0000000001a8080] sys_sched_yield+0x20/0x40
> [  172.851615] [c000000017687db0] [c0000000000334dc] system_call_exception+0x18c/0x380
> [  172.851622] [c000000017687e10] [c00000000000c74c] system_call_common+0xec/0x268
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/perf: Fix power_pmu_disable to call clear_pmi_irq_pending only if PMI is pending
      https://git.kernel.org/powerpc/c/fb6433b48a178d4672cb26632454ee0b21056eaa

cheers
