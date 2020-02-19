Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E048D1644A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 13:50:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MyHc05kkzDqCG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 23:50:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48My3b5D4szDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 23:39:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48My3Z3flnz9sSP; Wed, 19 Feb 2020 23:39:53 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 50a175dd18de7a647e72aca7daf4744e3a5a81e3
In-Reply-To: <778b1a248c4c7ca79640eeff7740044da6a220a0.1581264115.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, aneesh.kumar@linux.ibm.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/hugetlb: Fix 8M hugepages on 8xx
Message-Id: <48My3Z3flnz9sSP@ozlabs.org>
Date: Wed, 19 Feb 2020 23:39:53 +1100 (AEDT)
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

On Sun, 2020-02-09 at 16:02:41 UTC, Christophe Leroy wrote:
> With HW assistance all page tables must be 4k aligned, the 8xx
> drops the last 12 bits during the walk.
> 
> Redefine HUGEPD_SHIFT_MASK to mask last 12 bits out.
> HUGEPD_SHIFT_MASK is used to for alignment of page table cache.
> 
> Fixes: 22569b881d37 ("powerpc/8xx: Enable 8M hugepage support with HW assistance")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/50a175dd18de7a647e72aca7daf4744e3a5a81e3

cheers
