Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13008301A50
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 08:36:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNlCw6xfwzDqYP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 18:35:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FxP/GSt6; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNlBH2yPLzDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 18:34:31 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E537422CB9;
 Sun, 24 Jan 2021 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611473668;
 bh=l26cadTrzC6oT1xvBvVwDxUyuOKNwCRzA4NrTS5KmJ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FxP/GSt6Nu/NaO08sLfRDvYXj8tVW5hBVmYO/tm7FebCncZoAwX4ExNTcimu1j35Z
 ns/okx4cRyvfmGdn1cYdNaAbZ5OWQgsU6xsnB2531nlb4fFNQqSawN4qZEm7k0ic4p
 XJbuKgUSwELlk1mqU/+R+3wtPN7/fVSYndf742xaE23TKnVgMkWyLTLppSY34WJLOK
 AWHImsMpxblrvI+l3JRYUR4nlZYmDWUF4vfUmZSpTEnUhlmBDUzvvfuhunjFc7qWto
 Uvhnp0vNuR7k2s8NX89kr7bv++Gz16fMI1fDltsqexgEzoeSu+KMsTWoIASbvhbPyg
 eniG0w7KGjlBA==
Date: Sun, 24 Jan 2021 09:34:21 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 2/2] memblock: do not start bottom-up allocations with
 kernel_end
Message-ID: <20210124073421.GG6332@kernel.org>
References: <20201220064959.GB392325@kernel.org>
 <20210122043714.266075-1-bauerman@linux.ibm.com>
 <20210123180911.aafa8404a3a7a30779713456@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210123180911.aafa8404a3a7a30779713456@linux-foundation.org>
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
Cc: riel@surriel.com, kernel-team@fb.com, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, mhocko@kernel.org, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Konrad Rzeszutek Wilk <konrad@darnok.org>, iamjoonsoo.kim@lge.com,
 linuxppc-dev@lists.ozlabs.org, guro@fb.com,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 23, 2021 at 06:09:11PM -0800, Andrew Morton wrote:
> On Fri, 22 Jan 2021 01:37:14 -0300 Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
> 
> > Mike Rapoport <rppt@kernel.org> writes:
> > 
> > > > Signed-off-by: Roman Gushchin <guro@fb.com>
> > > 
> > > Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > I've seen a couple of spurious triggers of the WARN_ONCE() removed by this
> > patch. This happens on some ppc64le bare metal (powernv) server machines with
> > CONFIG_SWIOTLB=y and crashkernel=4G, as described in a candidate patch I posted
> > to solve this issue in a different way:
> > 
> > https://lore.kernel.org/linuxppc-dev/20201218062103.76102-1-bauerman@linux.ibm.com/
> > 
> > Since this patch solves that problem, is it possible to include it in the next
> > feasible v5.11-rcX, with the following tag?
> 
> We could do this, if we're confident that this patch doesn't depend on
> [1/2] "mm: cma: allocate cma areas bottom-up"?  I think it is...

A think it does not depend on cma bottom-up allocation, it's rather the other
way around: without this CMA bottom-up allocation could fail with KASLR
enabled.

Still, this patch may need updates to the way x86 does early reservations:

https://lore.kernel.org/lkml/20210115083255.12744-1-rppt@kernel.org
 
> > Fixes: 8fabc623238e ("powerpc: Ensure that swiotlb buffer is allocated from low memory")
> 
> I added that.
> 
> 

-- 
Sincerely yours,
Mike.
