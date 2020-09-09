Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CD5262FEE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 16:44:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmlCD5YrKzDqXS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 00:44:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjWL4j35zDqKV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjWK53HXz9sW0; Wed,  9 Sep 2020 23:27:56 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20200728173741.717372-1-nathanl@linux.ibm.com>
References: <20200728173741.717372-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: explicitly reschedule during drmem_lmb
 list traversal
Message-Id: <159965716536.808686.6770489962945335382.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:56 +1000 (AEST)
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jul 2020 12:37:41 -0500, Nathan Lynch wrote:
> The drmem lmb list can have hundreds of thousands of entries, and
> unfortunately lookups take the form of linear searches. As long as
> this is the case, traversals have the potential to monopolize the CPU
> and provoke lockup reports, workqueue stalls, and the like unless
> they explicitly yield.
> 
> Rather than placing cond_resched() calls within various
> for_each_drmem_lmb() loop blocks in the code, put it in the iteration
> expression of the loop macro itself so users can't omit it.

Applied to powerpc/next.

[1/1] powerpc/pseries: explicitly reschedule during drmem_lmb list traversal
      https://git.kernel.org/powerpc/c/9d6792ffe140240ae54c881cc4183f9acc24b4df

cheers
