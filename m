Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DADE164485
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 13:43:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48My7r3QjszDqZC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 23:43:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48My3X5FnJzDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 23:39:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48My3W5Zfyz9sSL; Wed, 19 Feb 2020 23:39:51 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: f2b67ef90b0d5eca0f2255e02cf2f620bc0ddcdb
In-Reply-To: <90ec56a2315be602494619ed0223bba3b0b8d619.1580997007.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, aneesh.kumar@linux.ibm.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/hugetlb: Fix 512k hugepages on 8xx with 16k page
 size
Message-Id: <48My3W5Zfyz9sSL@ozlabs.org>
Date: Wed, 19 Feb 2020 23:39:51 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-02-06 at 13:50:28 UTC, Christophe Leroy wrote:
> Commit 55c8fc3f4930 ("powerpc/8xx: reintroduce 16K pages with HW
> assistance") redefined pte_t as a struct of 4 pte_basic_t, because
> in 16K pages mode there are four identical entries in the
> page table. But the size of hugepage tables is calculated based
> of the size of (void *). Therefore, we end up with page tables
> of size 1k instead of 4k for 512k pages.
> 
> As 512k hugepage tables are the same size as standard page tables,
> ie 4k, use the standard page tables instead of PGT_CACHE tables.
> 
> Fixes: 3fb69c6a1a13 ("powerpc/8xx: Enable 512k hugepage support with HW assistance")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/f2b67ef90b0d5eca0f2255e02cf2f620bc0ddcdb

cheers
