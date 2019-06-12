Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 568EF41B72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 07:04:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NvtL49QMzDqvd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 15:04:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NvmH6xLGzDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 14:59:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45NvmH6CQKz9sDB; Wed, 12 Jun 2019 14:59:11 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 33258a1db165cf43a9e6382587ad06e9b7f8187c
X-Patchwork-Hint: ignore
In-Reply-To: <20190607035636.5446-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/64s: Fix THP PMD collapse serialisation
Message-Id: <45NvmH6CQKz9sDB@ozlabs.org>
Date: Wed, 12 Jun 2019 14:59:11 +1000 (AEST)
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-06-07 at 03:56:35 UTC, Nicholas Piggin wrote:
> Commit 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion
> in pte helpers") changed the actual bitwise tests in pte_access_permitted
> by using pte_write() and pte_present() helpers rather than raw bitwise
> testing _PAGE_WRITE and _PAGE_PRESENT bits.
> 
> The pte_present change now returns true for ptes which are !_PAGE_PRESENT
> and _PAGE_INVALID, which is the combination used by pmdp_invalidate to
> synchronize access from lock-free lookups. pte_access_permitted is used by
> pmd_access_permitted, so allowing GUP lock free access to proceed with
> such PTEs breaks this synchronisation.
> 
> This bug has been observed on HPT host, with random crashes and corruption
> in guests, usually together with bad PMD messages in the host.
> 
> Fix this by adding an explicit check in pmd_access_permitted, and
> documenting the condition explicitly.
> 
> The pte_write() change should be okay, and would prevent GUP from falling
> back to the slow path when encountering savedwrite ptes, which matches
> what x86 (that does not implement savedwrite) does.
> 
> Fixes: 1b2443a547f9 ("powerpc/book3s64: Avoid multiple endian conversion in pte helpers")
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/33258a1db165cf43a9e6382587ad06e9

cheers
