Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F40C2D5EB8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 15:56:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsH6Y5nlCzDqRs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 01:56:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBYH39RXzDqgM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBYF1ksbz9shj; Thu, 10 Dec 2020 22:30:24 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20201202050456.164005-1-srikar@linux.vnet.ibm.com>
References: <20201202050456.164005-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/4] Powerpc: Better preemption for shared processor
Message-Id: <160756606176.1313423.10082301769067590963.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:24 +1100 (AEDT)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Phil Auld <pauld@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Waiman Long <longman@redhat.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Dec 2020 10:34:52 +0530, Srikar Dronamraju wrote:
> Currently, vcpu_is_preempted will return the yield_count for
> shared_processor. On a PowerVM LPAR, Phyp schedules at SMT8 core boundary
> i.e all CPUs belonging to a core are either group scheduled in or group
> scheduled out. This can be used to better predict non-preempted CPUs on
> PowerVM shared LPARs.
> 
> perf stat -r 5 -a perf bench sched pipe -l 10000000 (lesser time is better)
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc: Refactor is_kvm_guest() declaration to new header
      https://git.kernel.org/powerpc/c/92cc6bf01c7f4c5cfefd1963985c0064687ebeda
[2/4] powerpc: Rename is_kvm_guest() to check_kvm_guest()
      https://git.kernel.org/powerpc/c/16520a858a995742c2d2248e86a6026bd0316562
[3/4] powerpc: Reintroduce is_kvm_guest() as a fast-path check
      https://git.kernel.org/powerpc/c/a21d1becaa3f17a97b933ffa677b526afc514ec5
[4/4] powerpc/paravirt: Use is_kvm_guest() in vcpu_is_preempted()
      https://git.kernel.org/powerpc/c/ca3f969dcb111d35674b66bdcb72beb2c426b9b5

cheers
