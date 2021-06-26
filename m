Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 201343B4E3C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:46:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBrBl4RdJz3fyq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:46:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr5742Ffz3ddc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:41:15 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr563SHHz9srZ; Sat, 26 Jun 2021 20:41:14 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1623952506-1431-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1623952506-1431-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/perf: Fix crash with 'perf_instruction_pointer'
 when pmu is not set
Message-Id: <162470401680.3591474.3321571139140999830.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:40:16 +1000
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Jun 2021 13:55:06 -0400, Athira Rajeev wrote:
> On systems without any specific PMU driver support registered, running
> perf record causes Oops.
> 
> The relevant portion from call trace:
> 
> BUG: Kernel NULL pointer dereference on read at 0x00000040
> Faulting instruction address: 0xc0021f0c
> Oops: Kernel access of bad area, sig: 11 [#1]
> BE PAGE_SIZE=4K PREEMPT CMPCPRO
> SAF3000 DIE NOTIFICATION
> CPU: 0 PID: 442 Comm: null_syscall Not tainted 5.13.0-rc6-s3k-dev-01645-g7649ee3d2957 #5164
> NIP:  c0021f0c LR: c00e8ad8 CTR: c00d8a5c
> NIP [c0021f0c] perf_instruction_pointer+0x10/0x60
> LR [c00e8ad8] perf_prepare_sample+0x344/0x674
> Call Trace:
> [e6775880] [c00e8810] perf_prepare_sample+0x7c/0x674 (unreliable)
> [e67758c0] [c00e8e44] perf_event_output_forward+0x3c/0x94
> [e6775910] [c00dea8c] __perf_event_overflow+0x74/0x14c
> [e6775930] [c00dec5c] perf_swevent_hrtimer+0xf8/0x170
> [e6775a40] [c008c8d0] __hrtimer_run_queues.constprop.0+0x160/0x318
> [e6775a90] [c008d94c] hrtimer_interrupt+0x148/0x3b0
> [e6775ae0] [c000c0c0] timer_interrupt+0xc4/0x22c
> [e6775b10] [c00046f0] Decrementer_virt+0xb8/0xbc
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/perf: Fix crash with 'perf_instruction_pointer' when pmu is not set
      https://git.kernel.org/powerpc/c/60b7ed54a41b550d50caf7f2418db4a7e75b5bdc

cheers
