Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAD4125FD4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 11:49:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dpYD2m44zDq9m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 21:49:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zx2c4.com (client-ip=192.95.5.64; helo=frisell.zx2c4.com;
 envelope-from=jason@zx2c4.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.b="AjD211/D"; 
 dkim-atps=neutral
X-Greylist: delayed 397 seconds by postgrey-1.36 at bilbo;
 Thu, 19 Dec 2019 21:48:10 AEDT
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dpWG6QbszDq7F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 21:48:10 +1100 (AEDT)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3854f1e5;
 Thu, 19 Dec 2019 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=subject:to:cc
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=mail; bh=a1BPQtC+5hEE
 EkAeMYp4HKxJqFU=; b=AjD211/DOZy4eIxPRZRMywoytRStUf7wcBKZElKtQG1e
 oxApJ13C1o6UXOuU6IDyb9XiGmBudXXLTV/WptlaiVlrFqiKU8REq9FZmXIXwWJ3
 NrTlm6/ou2aVNBKE63PUKttnHBjJ6NMdO8ENKmzAOc9LNgKsod3W7/bdRfLfrCPO
 fd7TeqAEcGCHJJD7dhqO+htsb57hxhaLmNsT1+121CGlktmD2KfIMMOzm81CT8SD
 ApEN8tdIY3iu4JSFlrLhp2JLTICHRex4PD+6i8eT0vzNgvynyJsk2B5DN7PM3bnf
 h2BNFIgonLjYPdvbBTwrJn5mWruCeF52dpCvlOxyDQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 96e77a60
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Thu, 19 Dec 2019 09:44:45 +0000 (UTC)
Subject: Re: [Qemu-ppc] pseries on qemu-system-ppc64le crashes in
 doorbell_core_ipi()
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, qemu-ppc@nongnu.org,
 linuxppc-dev@lists.ozlabs.org
References: <20190327123615.rwhk6h3ayfurvapf@linutronix.de>
 <7d97f3c6-4614-ead7-179a-e7e223ea3997@kaod.org>
 <2bbc1490-400d-585e-d74b-924c570b4236@kaod.org>
 <1553836851.2264.2.camel@gmail.com> <1553850306.nyv11r9iej.astroid@bobo.none>
 <20190329113109.3a9bd24e@gandalf.local.home>
 <1553912871.ce5mzizoek.astroid@bobo.none>
 <20190401083827.GE11158@hirez.programming.kicks-ass.net>
 <20190406000611.GA27782@lenoir> <1554801792.ruzup3dxhe.astroid@bobo.none>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <7a5b63a0-2bf5-60bb-8678-b7b36671a29c@zx2c4.com>
Date: Thu, 19 Dec 2019 11:41:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1554801792.ruzup3dxhe.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <fweisbec@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Paul Mackerras <paulus@samba.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>, tglx@linutronix.de,
 David? Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi folks,

I'm actually still experiencing this sporadically in the WireGuard test 
suite, which you can see being run on https://build.wireguard.com/ . 
About 50% of the time the powerpc64 build will fail at a place like this:

[   65.147823] Oops: Exception in kernel mode, sig: 4 [#1]
[   65.149198] LE PAGE_SIZE=4K MMU=Hash PREEMPT SMP NR_CPUS=4 NUMA pSeries
[   65.149595] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.5.0-rc1+ #1
[   65.149745] NIP:  c000000000033330 LR: c00000000007eda0 CTR: 
c00000000007ed80
[   65.149934] REGS: c000000000a47970 TRAP: 0700   Not tainted  (5.5.0-rc1+)
[   65.150032] MSR:  800000000288b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> 
CR: 48008288  XER: 00000000
[   65.150352] CFAR: c0000000000332bc IRQMASK: 1
[   65.150352] GPR00: c000000000036508 c000000000a47c00 c000000000a4c100 
0000000000000001
[   65.150352] GPR04: c000000000a50998 0000000000000000 c000000000a50908 
000000000f509000
[   65.150352] GPR08: 0000000028000000 0000000000000000 0000000000000000 
c00000000ff24f00
[   65.150352] GPR12: c00000000007ed80 c000000000ad9000 0000000000000000 
0000000000000000
[   65.150352] GPR16: 00000000008c9190 00000000008c94a8 00000000008c92f8 
00000000008c98b0
[   65.150352] GPR20: 00000000008f2f88 fffffffffffffffd 0000000000000014 
0000000000e6c100
[   65.150352] GPR24: 0000000000e6c100 0000000000000001 0000000000000000 
c000000000a50998
[   65.150352] GPR28: c000000000a9e280 c000000000a50aa4 0000000000000002 
0000000000000000
[   65.151591] NIP [c000000000033330] doorbell_try_core_ipi+0xd0/0xf0
[   65.151750] LR [c00000000007eda0] smp_pseries_cause_ipi+0x20/0x70
[   65.151913] Call Trace:
[   65.152109] [c000000000a47c00] [c0000000000c7c9c] 
_nohz_idle_balance+0xbc/0x300 (unreliable)
[   65.152370] [c000000000a47c30] [c000000000036508] 
smp_send_reschedule+0x98/0xb0
[   65.152711] [c000000000a47c50] [c0000000000c1634] kick_ilb+0x114/0x140
[   65.152962] [c000000000a47ca0] [c0000000000c86d8] 
newidle_balance+0x4e8/0x500
[   65.153213] [c000000000a47d20] [c0000000000c8788] 
pick_next_task_fair+0x48/0x3a0
[   65.153424] [c000000000a47d80] [c000000000466620] __schedule+0xf0/0x430
[   65.153612] [c000000000a47de0] [c000000000466b04] schedule_idle+0x34/0x70
[   65.153786] [c000000000a47e10] [c0000000000c0bc8] do_idle+0x1a8/0x220
[   65.154121] [c000000000a47e70] [c0000000000c0e94] 
cpu_startup_entry+0x34/0x40
[   65.154313] [c000000000a47ea0] [c00000000000ef1c] rest_init+0x10c/0x124
[   65.154414] [c000000000a47ee0] [c000000000500004] 
start_kernel+0x568/0x594
[   65.154585] [c000000000a47f90] [c00000000000a7cc] 
start_here_common+0x1c/0x330
[   65.154854] Instruction dump:
[   65.155191] 38210030 e8010010 7c0803a6 4e800020 3d220004 39295228 
81290000 3929ffff
[   65.155498] 7d284038 7c0004ac 5508017e 65082800 <7c00411c> e94d0178 
812a0000 3929ffff
[   65.156155] ---[ end trace 6180d12e268ffdaf ]---
[   65.185452]
[   66.187490] Kernel panic - not syncing: Fatal exception

This is with "qemu-system-ppc64 -smp 4 -machine pseries" on QEMU 4.0.0.

I'm not totally sure what's going on here. I'm emulating a pseries, and 
using that with qemu's pseries model, and I see that selecting the 
pseries forces the selection of 'config PPC_DOORBELL' (twice in the same 
section, actually). Then inside the kernel there appears to be some 
runtime CPU check for doorbell support. Is this a case in which QEMU is 
advertising doorbell support that TCG doesn't have? Or is something else 
happening here?

Thanks,
Jason
