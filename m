Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 056141CDD1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 16:27:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LNZJ2zWdzDqMg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 00:27:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=catalin.marinas@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 49LJbW4jd1zDqgn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 21:28:39 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0B5D1FB;
 Mon, 11 May 2020 04:28:37 -0700 (PDT)
Received: from gaia (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75B2A3F305;
 Mon, 11 May 2020 04:28:36 -0700 (PDT)
Date: Mon, 11 May 2020 12:28:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kvm: silence kmemleak false positives
Message-ID: <20200511112829.GB19176@gaia>
References: <20200509015538.3183-1-cai@lca.pw>
 <87y2pybu38.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y2pybu38.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 11, 2020 at 09:15:55PM +1000, Michael Ellerman wrote:
> Qian Cai <cai@lca.pw> writes:
> > kvmppc_pmd_alloc() and kvmppc_pte_alloc() allocate some memory but then
> > pud_populate() and pmd_populate() will use __pa() to reference the newly
> > allocated memory. The same is in xive_native_provision_pages().
> >
> > Since kmemleak is unable to track the physical memory resulting in false
> > positives, silence those by using kmemleak_ignore().
> 
> There is kmemleak_alloc_phys(), which according to the docs can be used
> for tracking a phys address.

This won't help. While kmemleak_alloc_phys() allows passing a physical
address, it doesn't track physical address references to this object. It
still expects VA pointing to it, otherwise the object would be reported
as a leak.

We currently only call this from the memblock code with a min_count of
0, meaning it will not be reported as a leak if no references are found.

We don't have this issue with page tables on other architectures since
most of them use whole page allocations which aren't tracked by
kmemleak. These powerpc functions use kmem_cache_alloc() which would be
tracked automatically by kmemleak. While we could add a phys alias to
kmemleak (another search tree), I think the easiest is as per Qian's
patch, just ignore those objects.

-- 
Catalin
