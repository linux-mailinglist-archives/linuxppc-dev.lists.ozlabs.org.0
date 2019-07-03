Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DE65E721
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 16:50:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f3tV3kl4zDq77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 00:50:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f3Mx2PhyzDqK1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 00:27:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45f3Mw3S0hz9sN4; Thu,  4 Jul 2019 00:27:08 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: aaf06665f7ea3ee9f9754e16c1a507a89f1de5b1
In-Reply-To: <20190627095940.7492-1-naveen.n.rao@linux.vnet.ibm.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/xmon: Fix disabling tracing while in xmon
Message-Id: <45f3Mw3S0hz9sN4@ozlabs.org>
Date: Thu,  4 Jul 2019 00:27:08 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-06-27 at 09:59:40 UTC, "Naveen N. Rao" wrote:
> Commit ed49f7fd6438d ("powerpc/xmon: Disable tracing when entering
> xmon") added code to disable recording trace entries while in xmon. The
> commit introduced a variable 'tracing_enabled' to record if tracing was
> enabled on xmon entry, and used this to conditionally enable tracing
> during exit from xmon.
> 
> However, we are not checking the value of 'fromipi' variable in
> xmon_core() when setting 'tracing_enabled'. Due to this, when secondary
> cpus enter xmon, they will see tracing as being disabled already and
> tracing won't be re-enabled on exit. Fix the same.
> 
> Fixes: ed49f7fd6438d ("powerpc/xmon: Disable tracing when entering xmon")
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/aaf06665f7ea3ee9f9754e16c1a507a89f1de5b1

cheers
