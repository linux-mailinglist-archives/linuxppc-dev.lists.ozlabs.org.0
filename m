Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F5D1717EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 13:56:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48St3R4DVkzDqYX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 23:56:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SsVJ49GNzDqvH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 23:31:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48SsVH2qCSz9sRY; Thu, 27 Feb 2020 23:31:34 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: e08658a657f974590809290c62e889f0fd420200
In-Reply-To: <20200222082049.330435-1-ravi.bangoria@linux.ibm.com>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/watchpoint: Don't call dar_within_range() for
 Book3S
Message-Id: <48SsVH2qCSz9sRY@ozlabs.org>
Date: Thu, 27 Feb 2020 23:31:34 +1100 (AEDT)
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-02-22 at 08:20:49 UTC, Ravi Bangoria wrote:
> DAR is set to the first byte of overlap between actual access and
> watched range at DSI on Book3S processor. But actual access range
> might or might not be within user asked range. So for Book3S, it
> must not call dar_within_range().
> 
> This revert portion of commit 39413ae00967 ("powerpc/hw_breakpoints:
> Rewrite 8xx breakpoints to allow any address range size.").
> 
> Before patch:
>   # ./tools/testing/selftests/powerpc/ptrace/perf-hwbreak
>   ...
>   TESTED: No overlap
>   FAILED: Partial overlap: 0 != 2
>   TESTED: Partial overlap
>   TESTED: No overlap
>   FAILED: Full overlap: 0 != 2
>   failure: perf_hwbreak
> 
> After patch:
>   TESTED: No overlap
>   TESTED: Partial overlap
>   TESTED: Partial overlap
>   TESTED: No overlap
>   TESTED: Full overlap
>   success: perf_hwbreak
> 
> Fixes: 39413ae00967 ("powerpc/hw_breakpoints: Rewrite 8xx breakpoints to allow any address range size.")
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/e08658a657f974590809290c62e889f0fd420200

cheers
