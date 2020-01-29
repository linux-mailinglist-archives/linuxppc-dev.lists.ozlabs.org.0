Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E80D14C608
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 06:46:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486stC6SzHzDqNF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:46:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sDl4hf2zDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sDl09qNz9sRh; Wed, 29 Jan 2020 16:17:26 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 736bcdd3a9fc672af33fb83230ecd0570ec38ec6
In-Reply-To: <20191206031722.25781-1-jniethe5@gmail.com>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc/mm: Remove kvm radix prefetch workaround for
 Power9 DD2.2
Message-Id: <486sDl09qNz9sRh@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:26 +1100 (AEDT)
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
Cc: Jordan Niethe <jniethe5@gmail.com>, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-12-06 at 03:17:22 UTC, Jordan Niethe wrote:
> Commit a25bd72badfa ("powerpc/mm/radix: Workaround prefetch issue with
> KVM") introduced a number of workarounds as coming out of a guest with
> the mmu enabled would make the cpu would start running in hypervisor
> state with the PID value from the guest. The cpu will then start
> prefetching for the hypervisor with that PID value.
> 
> In Power9 DD2.2 the cpu behaviour was modified to fix this. When
> accessing Quadrant 0 in hypervisor mode with LPID != 0 prefetching will
> not be performed. This means that we can get rid of the workarounds for
> Power9 DD2.2 and later revisions. Add a new cpu feature
> CPU_FTR_P9_RADIX_PREFETCH_BUG to indicate if the workarounds are needed.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/736bcdd3a9fc672af33fb83230ecd0570ec38ec6

cheers
