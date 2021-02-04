Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBCE30F052
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 11:17:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWZHP3cjczDwsl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 21:17:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWZFJ1SDfzDwsD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 21:15:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aR7VCcAj; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWZFH0rX1z9sXV;
 Thu,  4 Feb 2021 21:15:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612433747;
 bh=/pWbKp4hK4W/cgomf544KO4KWwVsmk0YD5yox1Tkn4w=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aR7VCcAjjiOvhl5nNor34iM2jZ6sINbvmTbZWWmxMtfKByxz6dcgD2Z2GmC4ekt4t
 PhqWDCP9BtX2nbYjTLF2s0oPUl/k+xiMQ3upw4hBP1OdM+kSsLP5nye+p2ULFnt+y2
 EqEIksgW/80zi/mp3G5DuH9SYtgP9nZrBfN+pWHvfvi+cdMZ3brRxBQC/xwNk/ZHiz
 Hdvb4rQehl5FzUI5zARCFpp3bJHiH5IXjhKb9/rouzJyTwRFkDifMj66utp+sCSoIp
 O7g0slzGWQWa7CwWeNio0QuFrlArYCyelq6VmGJ4Qv1+M5HqAWRfz8aJWFEQ8AJUHb
 XxIAPPTyd9S8Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 39/42] powerpc: move NMI entry/exit code into wrapper
In-Reply-To: <20210130130852.2952424-40-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-40-npiggin@gmail.com>
Date: Thu, 04 Feb 2021 21:15:41 +1100
Message-ID: <87k0rop29e.fsf@mpe.ellerman.id.au>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> This moves the common NMI entry and exit code into the interrupt handler
> wrappers.
>
> This changes the behaviour of soft-NMI (watchdog) and HMI interrupts, and
> also MCE interrupts on 64e, by adding missing parts of the NMI entry to
> them.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/interrupt.h | 28 ++++++++++++++++++++++
>  arch/powerpc/kernel/mce.c            | 11 ---------
>  arch/powerpc/kernel/traps.c          | 35 +++++-----------------------
>  arch/powerpc/kernel/watchdog.c       | 10 ++++----
>  4 files changed, 38 insertions(+), 46 deletions(-)

This is unhappy when injecting SLB multi-hits:

  root@p86-2:~# echo PPC_SLB_MULTIHIT > /sys/kernel/debug/provoke-crash/DIRECT
  [  312.496026][ T1344] kernel BUG at arch/powerpc/include/asm/interrupt.h:152!
  [  312.496037][ T1344] Oops: Exception in kernel mode, sig: 5 [#1]
  [  312.496045][ T1344] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
  [  312.496053][ T1344] Modules linked in: squashfs dm_multipath scsi_dh_rdac scsi_dh_alua pseries_rng rng_core vmx_crypto gf128mul crc32c_vpmsum ip_tables x_tables autofs4
  [  312.496085][ T1344] CPU: 19 PID: 1344 Comm: bash Not tainted 5.11.0-rc2-gcc-8.2.0-00123-g3fadced17474-dirty #638
  [  312.496096][ T1344] NIP:  c000000000ef1618 LR: c000000000ef1600 CTR: 0000000000000000
  [  312.496104][ T1344] REGS: c00000001eb4ba00 TRAP: 0700   Not tainted  (5.11.0-rc2-gcc-8.2.0-00123-g3fadced17474-dirty)
  [  312.496113][ T1344] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 48428284  XER: 00000000
  [  312.496132][ T1344] CFAR: c000000000ef28b8 IRQMASK: 3
  [  312.496132][ T1344] GPR00: c000000000ef15e4 c00000001eb4bca0 c000000001a53900 0000000000000001
  [  312.496132][ T1344] GPR04: c0000000017e7230 4000000000000000 3ffffffffffffffe 0000000000006d66
  [  312.496132][ T1344] GPR08: c00000001ec6fe80 0000000000000001 c00000000e72d380 0000000000001001
  [  312.496132][ T1344] GPR12: 0000000000000010 c00000001ec6fe80 00000100235ad1d0 000000013c2fb738
  [  312.496132][ T1344] GPR16: 000000013c210ae0 0000000000000000 0000000022000000 00000100235af740
  [  312.496132][ T1344] GPR20: 0000000000000000 0000000000000001 000000013c2a3ca0 c000000033c50040
  [  312.496132][ T1344] GPR24: c0000000100fbd80 0000000000000000 c000000001a7dc78 0000000000000001
  [  312.496132][ T1344] GPR28: c00000001eb4bd60 0000000000000001 0000000000000000 0000000000000001
  [  312.496229][ T1344] NIP [c000000000ef1618] machine_check_early+0x138/0x1f0
  [  312.496241][ T1344] LR [c000000000ef1600] machine_check_early+0x120/0x1f0
  [  312.496249][ T1344] Call Trace:
  [  312.496254][ T1344] [c00000001eb4bca0] [c000000000ef15e4] machine_check_early+0x104/0x1f0 (unreliable)
  [  312.496267][ T1344] [c00000001eb4bcf0] [c000000000008394] machine_check_early_common+0x134/0x1f0
  [  312.496279][ T1344] --- interrupt: 200 at lkdtm_PPC_SLB_MULTIHIT+0x128/0x138
  [  312.496290][ T1344] NIP:  c0000000009cfea8 LR: c0000000009cfea0 CTR: 0000000000000000
  [  312.496298][ T1344] REGS: c00000001eb4bd60 TRAP: 0200   Not tainted  (5.11.0-rc2-gcc-8.2.0-00123-g3fadced17474-dirty)
  [  312.496307][ T1344] MSR:  8000000000209033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24428284  XER: 00000000
  [  312.496326][ T1344] CFAR: 000000000000021c DAR: c008000003880000 DSISR: 00000080 IRQMASK: 0
  [  312.496326][ T1344] GPR00: c0000000009cfea0 c0000000100fbb80 c000000001a53900 c008000003880000
  [  312.496326][ T1344] GPR04: 00000000000000b0 c000000401023440 8e01c533000000c0 0000000000bf50d9
  [  312.496326][ T1344] GPR08: 000000000fffffff 0000000000000021 000000000000001c c008000004880000
  [  312.496326][ T1344] GPR12: 0000000048428222 c00000001ec6fe80 00000100235ad1d0 000000013c2fb738
  [  312.496326][ T1344] GPR16: 000000013c210ae0 0000000000000000 0000000022000000 00000100235af740
  [  312.496326][ T1344] GPR20: 0000000000000000 0000000000000001 000000013c2a3ca0 c000000033c50040
  [  312.496326][ T1344] GPR24: c0000000100fbd80 0000000000000000 0000000000000011 c000000001a2ffb8
  [  312.496326][ T1344] GPR28: 00000000000004b0 c000000033c50000 c000000001105298 c008000003880000
  [  312.496427][ T1344] NIP [c0000000009cfea8] lkdtm_PPC_SLB_MULTIHIT+0x128/0x138
  [  312.496437][ T1344] LR [c0000000009cfea0] lkdtm_PPC_SLB_MULTIHIT+0x120/0x138
  [  312.496446][ T1344] --- interrupt: 200
  [  312.496451][ T1344] [c0000000100fbbf0] [c0000000009cb530] lkdtm_do_action+0x40/0x80
  [  312.496462][ T1344] [c0000000100fbc10] [c0000000009cbdfc] direct_entry+0x16c/0x350
  [  312.496473][ T1344] [c0000000100fbcc0] [c0000000007a7590] full_proxy_write+0x90/0xe0
  [  312.496484][ T1344] [c0000000100fbd10] [c00000000046b090] vfs_write+0xf0/0x310
  [  312.496496][ T1344] [c0000000100fbd60] [c00000000046b48c] ksys_write+0x7c/0x140
  [  312.496507][ T1344] [c0000000100fbdb0] [c000000000036340] system_call_exception+0x1a0/0x2e0
  [  312.496518][ T1344] [c0000000100fbe10] [c00000000000d360] system_call_common+0xf0/0x27c
  [  312.496528][ T1344] Instruction dump:
  [  312.496534][ T1344] 7c7b1b78 e93a0000 75290040 41820008 480000a8 4800125d 60000000 e94d0968
  [  312.496552][ T1344] 812a0000 55290216 7d290034 5529d97e <0b090000> 812a0000 3d29ffef 912a0000
  [  312.496571][ T1344] ---[ end trace 1cd2275de93cc3c3 ]---
  [  312.500581][ T1344]
  [  312.500705][   C19] RTAS: event: 1, Type: Unknown (0), Severity: 3
  [  312.501068][    T0] ------------[ cut here ]------------
  [  312.501081][    T0] WARNING: CPU: 19 PID: 0 at kernel/rcu/tree.c:632 rcu_eqs_enter.isra.59+0x140/0x160
  [  312.501103][    T0] Modules linked in: squashfs dm_multipath scsi_dh_rdac scsi_dh_alua pseries_rng rng_core vmx_crypto gf128mul crc32c_vpmsum ip_tables x_tables autofs4
  [  312.501152][    T0] CPU: 19 PID: 0 Comm: swapper/19 Tainted: G      D           5.11.0-rc2-gcc-8.2.0-00123-g3fadced17474-dirty #638
  [  312.501173][    T0] NIP:  c000000000ef2830 LR: c000000000c287c0 CTR: 0000000000000000
  [  312.501187][    T0] REGS: c000000008d5fa50 TRAP: 0700   Tainted: G      D            (5.11.0-rc2-gcc-8.2.0-00123-g3fadced17474-dirty)
  [  312.501203][    T0] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 28000248  XER: 20000009
  [  312.501248][    T0] CFAR: c000000000ef2728 IRQMASK: 1
  [  312.501248][    T0] GPR00: c000000000c287c0 c000000008d5fcf0 c000000001a53900 00000048c283bf7e
  [  312.501248][    T0] GPR04: c00000000199fae0 0000000000000001 0000000000000800 4000000000000000
  [  312.501248][    T0] GPR08: c00000001ec6fe80 c0000003fdb93980 3ffffffffffffffe 000000000098967f
  [  312.501248][    T0] GPR12: 00000000ffffffff c00000001ec6fe80 0000000000000000 000000001ef2fa60
  [  312.501248][    T0] GPR16: 0000000000000000 0000000000000000 c0000007fffebff8 c000000000051ca0
  [  312.501248][    T0] GPR20: c0000007fffec628 c00000000199fae0 0000000000000001 c0000003fdb917c8
  [  312.501248][    T0] GPR24: 0000000000000001 00000048c283bf7e 0000000000000000 0000000000000001
  [  312.501248][    T0] GPR28: c0000003fdb917c8 c00000000199fae0 0000000000000001 c0000000013d3980
  [  312.501428][    T0] NIP [c000000000ef2830] rcu_eqs_enter.isra.59+0x140/0x160
  [  312.501445][    T0] LR [c000000000c287c0] cpuidle_enter_state+0x2f0/0x540
  [  312.501469][    T0] Call Trace:
  [  312.501481][    T0] [c000000008d5fcf0] [c000000008d5fd40] 0xc000000008d5fd40 (unreliable)
  [  312.501508][    T0] [c000000008d5fd20] [c0000003fdb917c8] 0xc0000003fdb917c8
  [  312.501524][    T0] [c000000008d5fd80] [c000000000c28ab0] cpuidle_enter+0x50/0x70
  [  312.501544][    T0] [c000000008d5fdc0] [c00000000019000c] call_cpuidle+0x4c/0x80
  [  312.501564][    T0] [c000000008d5fde0] [c0000000001906a0] do_idle+0x390/0x3e0
  [  312.501581][    T0] [c000000008d5fe70] [c00000000019096c] cpu_startup_entry+0x3c/0x40
  [  312.501602][    T0] [c000000008d5fea0] [c000000000054838] start_secondary+0x5b8/0x9b0
  [  312.501619][    T0] [c000000008d5ff90] [c00000000000c654] start_secondary_prolog+0x10/0x14
  [  312.501642][    T0] Instruction dump:
  [  312.501657][    T0] 60000000 e8010040 7c0803a6 e94d0030 39200000 38210030 7fff5214 f93f00f0
  [  312.501692][    T0] ebe1fff8 4bfffd14 60000000 60000000 <0fe00000> 4bfffef8 60000000 60000000
  [  312.501721][    T0] ---[ end trace 1cd2275de93cc3c4 ]---


147 static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
148 {
149 	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
150 			!firmware_has_feature(FW_FEATURE_LPAR) ||
151 			radix_enabled() || (mfmsr() & MSR_DR))
152 		nmi_exit();


So presumably it's:

#define __nmi_exit()						\
	do {							\
		BUG_ON(!in_nmi());				\


cheers
