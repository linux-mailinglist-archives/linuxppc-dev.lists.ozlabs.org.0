Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB7524BF2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 15:42:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXQnr3GJszDqmJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 23:42:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXQXl0DWZzDr1P
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 23:31:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BXQXj4vy3z9sTy; Thu, 20 Aug 2020 23:31:27 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1596717992-7321-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1596717992-7321-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/perf: Account for interrupts during PMC overflow
 for an invalid SIAR check
Message-Id: <159793027448.2366922.17263399145655268415.b4-ty@ellerman.id.au>
Date: Thu, 20 Aug 2020 23:31:27 +1000 (AEST)
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
Cc: aik@ozlabs.ru, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 Aug 2020 08:46:32 -0400, Athira Rajeev wrote:
> Performance monitor interrupt handler checks if any counter has overflown
> and calls `record_and_restart` in core-book3s which invokes
> `perf_event_overflow` to record the sample information.
> Apart from creating sample, perf_event_overflow also does the interrupt
> and period checks via perf_event_account_interrupt.
> 
> Currently we record information only if the SIAR valid bit is set
> ( using `siar_valid` check ) and hence the interrupt check.
> But it is possible that we do sampling for some events that are not
> generating valid SIAR and hence there is no chance to disable the event
> if interrupts is more than max_samples_per_tick. This leads to soft lockup.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/perf: Fix soft lockups due to missed interrupt accounting
      https://git.kernel.org/powerpc/c/17899eaf88d689529b866371344c8f269ba79b5f

cheers
