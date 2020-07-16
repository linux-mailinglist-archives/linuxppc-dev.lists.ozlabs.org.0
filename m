Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63095222404
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:36:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6wJ64vcHzDqll
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:36:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vPr3jyLzDql9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPk4Yqpz9sV5; Thu, 16 Jul 2020 22:55:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200626164737.21943-1-desnesn@linux.ibm.com>
References: <20200626164737.21943-1-desnesn@linux.ibm.com>
Subject: Re: [PATCH] selftests/powerpc: Purge extra count_pmc() calls of ebb
 selftests
Message-Id: <159490400479.3805857.6584199354470520618.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:55:53 +1000 (AEST)
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
Cc: shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 26 Jun 2020 13:47:37 -0300, Desnes A. Nunes do Rosario wrote:
> An extra count on ebb_state.stats.pmc_count[PMC_INDEX(pmc)] is being per-
> formed when count_pmc() is used to reset PMCs on a few selftests. This
> extra pmc_count can occasionally invalidate results, such as the ones from
> cycles_test shown hereafter. The ebb_check_count() failed with an above
> the upper limit error due to the extra value on ebb_state.stats.pmc_count.
> 
> Furthermore, this extra count is also indicated by extra PMC1 trace_log on
> the output of the cycle test (as well as on pmc56_overflow_test):
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/powerpc: Purge extra count_pmc() calls of ebb selftests
      https://git.kernel.org/powerpc/c/3337bf41e0dd70b4064cdf60acdfcdc2d050066c

cheers
