Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F4617B2FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 01:32:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YT8Q6hnrzDqqK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 11:32:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YT382QnSzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 11:27:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48YT381z9Zz9sRY; Fri,  6 Mar 2020 11:27:32 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c4b78169e3667413184c9a20e11b5832288a109f
In-Reply-To: <20191223060351.26359-1-aik@ozlabs.ru>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH kernel v3] powerpc/book3s64: Fix error handling in
 mm_iommu_do_alloc()
Message-Id: <48YT381z9Zz9sRY@ozlabs.org>
Date: Fri,  6 Mar 2020 11:27:32 +1100 (AEDT)
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Jan Kara <jack@suse.cz>,
 kvm-ppc@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-12-23 at 06:03:51 UTC, Alexey Kardashevskiy wrote:
> The last jump to free_exit in mm_iommu_do_alloc() happens after page
> pointers in struct mm_iommu_table_group_mem_t were already converted to
> physical addresses. Thus calling put_page() on these physical addresses
> will likely crash.
> 
> This moves the loop which calculates the pageshift and converts page
> struct pointers to physical addresses later after the point when
> we cannot fail; thus eliminating the need to convert pointers back.
> 
> Fixes: eb9d7a62c386 ("powerpc/mm_iommu: Fix potential deadlock")
> Reported-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c4b78169e3667413184c9a20e11b5832288a109f

cheers
