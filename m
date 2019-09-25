Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E69DBBDCE8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 13:20:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dbFF1B3PzDqZj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 21:20:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dZwP71CtzDqdf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 21:05:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46dZwP4hpLz9sPl; Wed, 25 Sep 2019 21:05:25 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 1211ee61b4a8e60d6dc77211cdcf01906915bfba
In-Reply-To: <20190920130523.20441-2-ldufour@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, benh@kernel.crashing.org,
 paulus@samba.org, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3 1/2] powperc/mm: read TLB Block Invalidate
 Characteristics
Message-Id: <46dZwP4hpLz9sPl@ozlabs.org>
Date: Wed, 25 Sep 2019 21:05:25 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-09-20 at 13:05:22 UTC, Laurent Dufour wrote:
> The PAPR document specifies the TLB Block Invalidate Characteristics which
> tells for each pair of segment base page size, actual page size, the size
> of the block the hcall H_BLOCK_REMOVE supports.
> 
> These characteristics are loaded at boot time in a new table hblkr_size.
> The table is separate from the mmu_psize_def because this is specific to
> the pseries platform.
> 
> A new init function, pseries_lpar_read_hblkrm_characteristics() is added to
> read the characteristics. It is called from pSeries_setup_arch().
> 
> Fixes: ba2dd8a26baa ("powerpc/pseries/mm: call H_BLOCK_REMOVE")
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>

Series applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/1211ee61b4a8e60d6dc77211cdcf01906915bfba

cheers
