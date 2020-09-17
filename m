Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2832B26DA68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 13:37:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsZhJ121SzDqYW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 21:37:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSP2sKvzDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSP0kmbz9sTq; Thu, 17 Sep 2020 21:27:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <f6ea2483c2c389567b007945948f704d18cfaeea.1598862623.git.christophe.leroy@csgroup.eu>
References: <f6ea2483c2c389567b007945948f704d18cfaeea.1598862623.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/8xx: Refactor calculation of number of
 entries per PTE in page tables
Message-Id: <160034201341.3339803.11663256745878554872.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:16 +1000 (AEST)
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

On Mon, 31 Aug 2020 08:30:43 +0000 (UTC), Christophe Leroy wrote:
> On 8xx, the number of entries occupied by a PTE in the page tables
> depends on the size of the page. At the time being, this calculation
> is done in two places: in pte_update() and in set_huge_pte_at()
> 
> Refactor this calculation into a helper called
> number_of_cells_per_pte(). For the time being, the val param is
> unused. It will be used by following patch.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/8xx: Refactor calculation of number of entries per PTE in page tables
      https://git.kernel.org/powerpc/c/175a99991511fed16108dcb823f0af8e72325a1f
[2/2] powerpc/8xx: Support 16k hugepages with 4k pages
      https://git.kernel.org/powerpc/c/e47168f3d1b14af5281cf50c59561d59d28201f9

cheers
