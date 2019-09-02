Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61323A4D77
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 05:14:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MFYh31sZzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 13:14:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MFN80vflzDqYk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 13:06:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46MFN75NkJz9sNx; Mon,  2 Sep 2019 13:06:15 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 35872480da47ec714fd9c4f2f3d2d83daf304851
In-Reply-To: <20190829085252.72370-2-aik@ozlabs.ru>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH kernel v3 1/5] powerpc/powernv/ioda: Split out TCE
 invalidation from TCE updates
Message-Id: <46MFN75NkJz9sNx@ozlabs.org>
Date: Mon,  2 Sep 2019 13:06:15 +1000 (AEST)
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
Cc: kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-08-29 at 08:52:48 UTC, Alexey Kardashevskiy wrote:
> At the moment updates in a TCE table are made by iommu_table_ops::exchange
> which update one TCE and invalidates an entry in the PHB/NPU TCE cache
> via set of registers called "TCE Kill" (hence the naming).
> Writing a TCE is a simple xchg() but invalidating the TCE cache is
> a relatively expensive OPAL call. Mapping a 100GB guest with PCI+NPU
> passed through devices takes about 20s.
> 
> Thankfully we can do better. Since such big mappings happen at the boot
> time and when memory is plugged/onlined (i.e. not often), these requests
> come in 512 pages so we call call OPAL 512 times less which brings 20s
> from the above to less than 10s. Also, since TCE caches can be flushed
> entirely, calling OPAL for 512 TCEs helps skiboot [1] to decide whether
> to flush the entire cache or not.
> 
> This implements 2 new iommu_table_ops callbacks:
> - xchg_no_kill() to update a single TCE with no TCE invalidation;
> - tce_kill() to invalidate multiple TCEs.
> This uses the same xchg_no_kill() callback for IODA1/2.
> 
> This implements 2 new wrappers on top of the new callbacks similar to
> the existing iommu_tce_xchg().
> 
> This does not use the new callbacks yet, the next patches will;
> so this should not cause any behavioral change.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Series applied to powerpc topic/ppc-kvm, thanks.

https://git.kernel.org/powerpc/c/35872480da47ec714fd9c4f2f3d2d83daf304851

cheers
