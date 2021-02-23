Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5405322931
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 12:04:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlGQm577xz3cVM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 22:04:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ueRAMRwn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlGQH2dktz30NM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 22:04:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fLqMJJTDKeAQfo7wJvXPyPNOGmlT2MLT3OGO1EV6sZY=; b=ueRAMRwnbQkSVAS4OSTz8qnbwt
 DEf/ELoi911297inWepdVV0zaSlv3xNa2NTw207aLRVu6R0s7aOXVt+QkhPbA1bGjrW7i8/8oUAnO
 n6s3ZW4R66Jis19zDCEDamsNEYis0wgAEZtn6KV1sMpiBzk9dCA6oVHEC6l5xrXz0FKjMESzRv7LM
 DGRcAEO7d2rzVBZ1uzXxYDemu63/zi1H+x0bStfkhXHG7flsjjwnxtITNNJtW2nM9rlzjY0mmBREu
 2Yy3rOkBbDdfU4vKFGNTv7P4qYMT+rPxEcgnLatUcccYG6sY42XgVUZICR8MKDAaii9eCG9DfbRzl
 VF05qfOg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lEVTO-007rch-SX; Tue, 23 Feb 2021 11:03:26 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 12B5E300DB4;
 Tue, 23 Feb 2021 12:03:19 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D3CD92013B7C2; Tue, 23 Feb 2021 12:03:19 +0100 (CET)
Date: Tue, 23 Feb 2021 12:03:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/perf: Fix handling of privilege level checks in
 perf interrupt context
Message-ID: <YDTg99xsVolE+sv+@hirez.programming.kicks-ass.net>
References: <1614061909-1734-1-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614061909-1734-1-git-send-email-atrajeev@linux.vnet.ibm.com>
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
Cc: maddy@linux.ibm.com, omosnace@redhat.com, acme@kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 23, 2021 at 01:31:49AM -0500, Athira Rajeev wrote:
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
> [c00000000fd477d0] [c00000000002d0fc] performance_monitor_exception+0x4c/0x60
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
> The above trace shows that while the CPU was handling a performance
> monitor exception, there was a call to "security_perf_event_open"
> function. In powerpc core-book3s, this function is called from
> 'perf_allow_kernel' check during recording of data address in the sample
> via perf_get_data_addr().
> 
> Commit da97e18458fb ("perf_event: Add support for LSM and SELinux checks")
> introduced security enhancements to perf. As part of this commit, the new
> security hook for perf_event_open was added in all places where perf
> paranoid check was previously used. In powerpc core-book3s code, originally
> had paranoid checks in 'perf_get_data_addr' and 'power_pmu_bhrb_read'. So
> 'perf_paranoid_kernel' checks were replaced with 'perf_allow_kernel' in
> these pmu helper functions as well.
> 
> The intention of paranoid checks in core-book3s is to verify privilege
> access before capturing some of the sample data. Along with paranoid
> checks, 'perf_allow_kernel' also does a 'security_perf_event_open'. Since
> these functions are accessed while recording sample, we end up in calling
> selinux_perf_event_open in PMI context. Some of the security functions
> use spinlock like sidtab_sid2str_put(). If a perf interrupt hits under
> a spin lock and if we end up in calling selinux hook functions in PMI
> handler, this could cause a dead lock.
> 
> Since the purpose of this security hook is to control access to
> perf_event_open, it is not right to call this in interrupt context.
> But in case of powerpc PMU, we need the privilege checks for specific
> samples from branch history ring buffer and sampling register values.

I'm confused... why would you need those checks at event time? Either
the event has perf_event_attr::exclude_kernel and it then isn't allowed
to expose kernel addresses, or it doesn't and it is.

There should never be an event-time question of permission like this. If
you allow creation of an event, you're allowing the data it generates.
