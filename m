Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA42833A402
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 11:02:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dyw855Qmxz3dPw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 21:02:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dyw783dl1z30MX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 21:01:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Dyw7123rLz9sVt; Sun, 14 Mar 2021 21:01:16 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <1614247839-1428-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1614247839-1428-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] powerpc/perf: Fix handling of privilege level checks
 in perf interrupt context
Message-Id: <161571587178.138988.4741132711459286523.b4-ty@ellerman.id.au>
Date: Sun, 14 Mar 2021 21:01:16 +1100 (AEDT)
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
Cc: maddy@linux.ibm.com, peterz@infradead.org, omosnace@redhat.com,
 acme@kernel.org, jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Feb 2021 05:10:39 -0500, Athira Rajeev wrote:
> Running "perf mem record" in powerpc platforms with selinux enabled
> resulted in soft lockup's. Below call-trace was seen in the logs:
> 
> CPU: 58 PID: 3751 Comm: sssd_nss Not tainted 5.11.0-rc7+ #2
> NIP:  c000000000dff3d4 LR: c000000000dff3d0 CTR: 0000000000000000
> REGS: c000007fffab7d60 TRAP: 0100   Not tainted  (5.11.0-rc7+)
> <<>>
> NIP [c000000000dff3d4] _raw_spin_lock_irqsave+0x94/0x120
> LR [c000000000dff3d0] _raw_spin_lock_irqsave+0x90/0x120
> Call Trace:
> [c00000000fd471a0] [c00000000fd47260] 0xc00000000fd47260 (unreliable)
> [c00000000fd471e0] [c000000000b5fbbc] skb_queue_tail+0x3c/0x90
> [c00000000fd47220] [c000000000296edc] audit_log_end+0x6c/0x180
> [c00000000fd47260] [c0000000006a3f20] common_lsm_audit+0xb0/0xe0
> [c00000000fd472a0] [c00000000066c664] slow_avc_audit+0xa4/0x110
> [c00000000fd47320] [c00000000066cff4] avc_has_perm+0x1c4/0x260
> [c00000000fd47430] [c00000000066e064] selinux_perf_event_open+0x74/0xd0
> [c00000000fd47450] [c000000000669888] security_perf_event_open+0x68/0xc0
> [c00000000fd47490] [c00000000013d788] record_and_restart+0x6e8/0x7f0
> [c00000000fd476c0] [c00000000013dabc] perf_event_interrupt+0x22c/0x560
> [c00000000fd477d0] [c00000000002d0fc] performance_monitor_exception0x4c/0x60
> [c00000000fd477f0] [c00000000000b378] performance_monitor_common_virt+0x1c8/0x1d0
> interrupt: f00 at _raw_spin_lock_irqsave+0x38/0x120
> NIP:  c000000000dff378 LR: c000000000b5fbbc CTR: c0000000007d47f0
> REGS: c00000000fd47860 TRAP: 0f00   Not tainted  (5.11.0-rc7+)
> <<>>
> NIP [c000000000dff378] _raw_spin_lock_irqsave+0x38/0x120
> LR [c000000000b5fbbc] skb_queue_tail+0x3c/0x90
> interrupt: f00
> [c00000000fd47b00] [0000000000000038] 0x38 (unreliable)
> [c00000000fd47b40] [c00000000aae6200] 0xc00000000aae6200
> [c00000000fd47b80] [c000000000296edc] audit_log_end+0x6c/0x180
> [c00000000fd47bc0] [c00000000029f494] audit_log_exit+0x344/0xf80
> [c00000000fd47d10] [c0000000002a2b00] __audit_syscall_exit+0x2c0/0x320
> [c00000000fd47d60] [c000000000032878] do_syscall_trace_leave+0x148/0x200
> [c00000000fd47da0] [c00000000003d5b4] syscall_exit_prepare+0x324/0x390
> [c00000000fd47e10] [c00000000000d76c] system_call_common+0xfc/0x27c
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/perf: Fix handling of privilege level checks in perf interrupt context
      https://git.kernel.org/powerpc/c/5ae5fbd2107959b68ac69a8b75412208663aea88

cheers
