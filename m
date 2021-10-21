Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FB7435FFD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 13:09:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZl9M4qP5z3cSM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 22:09:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZl8Z1ZG6z2yZf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 22:08:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZl8X2Zmpz4xbT;
 Thu, 21 Oct 2021 22:08:28 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211015173902.2278118-1-nathanl@linux.ibm.com>
References: <20211015173902.2278118-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/smp: do not decrement idle task preempt count
 in CPU offline
Message-Id: <163481445875.3437586.10466955312828450807.b4-ty@ellerman.id.au>
Date: Thu, 21 Oct 2021 22:07:38 +1100
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
Cc: srikar@linux.vnet.ibm.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, mingo@kernel.org, clg@kaod.org,
 valentin.schneider@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Oct 2021 12:39:02 -0500, Nathan Lynch wrote:
> With PREEMPT_COUNT=y, when a CPU is offlined and then onlined again, we
> get:
> 
> BUG: scheduling while atomic: swapper/1/0/0x00000000
> no locks held by swapper/1/0.
> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.15.0-rc2+ #100
> Call Trace:
>  dump_stack_lvl+0xac/0x108
>  __schedule_bug+0xac/0xe0
>  __schedule+0xcf8/0x10d0
>  schedule_idle+0x3c/0x70
>  do_idle+0x2d8/0x4a0
>  cpu_startup_entry+0x38/0x40
>  start_secondary+0x2ec/0x3a0
>  start_secondary_prolog+0x10/0x14
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/smp: do not decrement idle task preempt count in CPU offline
      https://git.kernel.org/powerpc/c/787252a10d9422f3058df9a4821f389e5326c440

cheers
