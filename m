Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E204193F5E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:58:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p4mQ38ybzDqL4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:58:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3cx2ZydzDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:06:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3cw3lcxz9sT3; Thu, 26 Mar 2020 23:06:55 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 850507f30c38dff21ed557cb98ab16db26c32bbc
In-Reply-To: <20200318060004.10685-1-po-hsu.lin@canonical.com>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>, linux-kselftest@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCHv2] selftests/powerpc: Turn off timeout setting for
 benchmarks, dscr, signal, tm
Message-Id: <48p3cw3lcxz9sT3@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:55 +1100 (AEDT)
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
Cc: paulus@samba.org, shuah@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-03-18 at 06:00:04 UTC, Po-Hsu Lin wrote:
> Some specific tests in powerpc can take longer than the default 45
> seconds that added in commit 852c8cbf34d3 ("selftests/kselftest/runner.sh:
> Add 45 second timeout per test") to run, the following test result was
> collected across 2 Power8 nodes and 1 Power9 node in our pool:
>   powerpc/benchmarks/futex_bench - 52s
>   powerpc/dscr/dscr_sysfs_test - 116s
>   powerpc/signal/signal_fuzzer - 88s
>   powerpc/tm/tm_unavailable_test - 168s
>   powerpc/tm/tm-poison - 240s
> 
> Thus they will fail with TIMEOUT error. Disable the timeout setting
> for these sub-tests to allow them finish properly.
> 
> https://bugs.launchpad.net/bugs/1864642
> Fixes: 852c8cbf34d3 ("selftests/kselftest/runner.sh: Add 45 second timeout per test")
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/850507f30c38dff21ed557cb98ab16db26c32bbc

cheers
