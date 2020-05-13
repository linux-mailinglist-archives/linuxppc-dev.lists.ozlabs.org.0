Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC6B1D05BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 06:02:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MLc064DJzDqq7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 14:02:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MLYR1ZcjzDqCB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 14:00:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=m7cvVUU/; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49MLYP40yxz9sSW;
 Wed, 13 May 2020 14:00:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589342426;
 bh=sh82LwVUQBWzo4DGjemROA2YW4sZvRmQ0Wh5kVhlPxs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=m7cvVUU/d6GfsojEfn1dmd1edFyjClrbxvfxvEVF4Mot9bPv3iHbgPNot86TxUXtP
 Pvmyd623oi4B8xEQxBOlm72ixfpKUZF+/PQHWe1EHviaPDMcMjyRIKnSfRHPGr+8tl
 qrMWclEu13Y1Gec4uQZY8Fr5r3Zz5jPtSlhbU5z37zi8JngBU+WHEidUxrvTMkGn+T
 K8vrZ0iGF4zjjGexfSnRQLZJzAJZl/q+ymPSvDCqrU2DGJEdaCGS90uaWbXUQ0bBVg
 EnXsxjajfCMb2FmHdBA9NRWD3+h1tdADO361XdGVW73DjXW3BWUDlK2ATBybeuj2Sq
 MbOwWS85ITR5g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] powerpc/kvm: silence kmemleak false positives
In-Reply-To: <20200511112829.GB19176@gaia>
References: <20200509015538.3183-1-cai@lca.pw>
 <87y2pybu38.fsf@mpe.ellerman.id.au> <20200511112829.GB19176@gaia>
Date: Wed, 13 May 2020 14:00:44 +1000
Message-ID: <87k11gbi1f.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Catalin Marinas <catalin.marinas@arm.com> writes:
> On Mon, May 11, 2020 at 09:15:55PM +1000, Michael Ellerman wrote:
>> Qian Cai <cai@lca.pw> writes:
>> > kvmppc_pmd_alloc() and kvmppc_pte_alloc() allocate some memory but then
>> > pud_populate() and pmd_populate() will use __pa() to reference the newly
>> > allocated memory. The same is in xive_native_provision_pages().
>> >
>> > Since kmemleak is unable to track the physical memory resulting in false
>> > positives, silence those by using kmemleak_ignore().
>> 
>> There is kmemleak_alloc_phys(), which according to the docs can be used
>> for tracking a phys address.
>
> This won't help. While kmemleak_alloc_phys() allows passing a physical
> address, it doesn't track physical address references to this object. It
> still expects VA pointing to it, otherwise the object would be reported
> as a leak.

OK, thanks for clarifying that.

> We currently only call this from the memblock code with a min_count of
> 0, meaning it will not be reported as a leak if no references are found.
>
> We don't have this issue with page tables on other architectures since
> most of them use whole page allocations which aren't tracked by
> kmemleak. These powerpc functions use kmem_cache_alloc() which would be
> tracked automatically by kmemleak. While we could add a phys alias to
> kmemleak (another search tree), I think the easiest is as per Qian's
> patch, just ignore those objects.

Agreed.

cheers
