Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9172D59E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 13:00:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsCCH6TdjzDqwJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 22:59:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXN03WNzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:29:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXM1nbcz9sWk; Thu, 10 Dec 2020 22:29:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1606814880-1720-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1606814880-1720-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/perf: Invoke per-CPU variable access with
 disabled interrupts
Message-Id: <160756606088.1313423.7680198073032760397.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:29:38 +1100 (AEDT)
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
Cc: bigeasy@linutronix.de, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Dec 2020 04:28:00 -0500, Athira Rajeev wrote:
> The power_pmu_event_init() callback access per-cpu variable
> (cpu_hw_events) to check for event constraints and Branch Stack
> (BHRB). Current usage is to disable preemption when accessing the
> per-cpu variable, but this does not prevent timer callback from
> interrupting event_init. Fix this by using 'local_irq_save/restore'
> to make sure the code path is invoked with disabled interrupts.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Invoke per-CPU variable access with disabled interrupts
      https://git.kernel.org/powerpc/c/f66de7ac4849eb42a7b18e26b8ee49e08130fd27

cheers
