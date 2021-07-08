Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A993C14B5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 15:54:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLHq14jNNz3bpZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 23:54:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLHph4tWJz2ywx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 23:54:36 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GLHpc3qWRz9sWq; Thu,  8 Jul 2021 23:54:32 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Valentin Schneider <valentin.schneider@arm.com>
In-Reply-To: <20210707183831.2106509-1-valentin.schneider@arm.com>
References: <20210707183831.2106509-1-valentin.schneider@arm.com>
Subject: Re: [PATCH] powerpc: preempt: Don't touch the idle task's
 preempt_count during hotplug
Message-Id: <162575242118.20406.3966849452752169600.b4-ty@ellerman.id.au>
Date: Thu, 08 Jul 2021 23:53:41 +1000
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Ingo Molnar <mingo@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Jul 2021 19:38:31 +0100, Valentin Schneider wrote:
> Powerpc currently resets a CPU's idle task preempt_count to 0 before said
> task starts executing the secondary startup routine (and becomes an idle
> task proper).
> 
> This conflicts with commit
> 
>   f1a0a376ca0c ("sched/core: Initialize the idle task with preemption disabled")
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: preempt: Don't touch the idle task's preempt_count during hotplug
      https://git.kernel.org/powerpc/c/2c669ef6979c370f98d4b876e54f19613c81e075

cheers
