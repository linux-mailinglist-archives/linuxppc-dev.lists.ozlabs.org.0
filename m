Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BBC2C3F81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:05:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch02K6GVPzDqCG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 23:05:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgzsc4JNYzDqdT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:57:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzsc03GSz9sSf; Wed, 25 Nov 2020 22:57:39 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
In-Reply-To: <20201022091115.39568-1-aneesh.kumar@linux.ibm.com>
References: <20201022091115.39568-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm: move setting pte specific flags to pfn_pmd
Message-Id: <160630539928.2174375.8364129339709602499.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:57:39 +1100 (AEDT)
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
Cc: linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 22 Oct 2020 14:41:15 +0530, Aneesh Kumar K.V wrote:
> powerpc used to set the pte specific flags in set_pte_at().  This is
> different from other architectures. To be consistent with other
> architecture powerpc updated pfn_pte to set _PAGE_PTE with
> commit 379c926d6334 ("powerpc/mm: move setting pte specific flags to pfn_pte")
> 
> The commit didn't do the same w.r.t pfn_pmd because we expect pmd_mkhuge
> to do that. But as per Linus that is a bad rule [1].
> Hence update pfn_pmd to set _PAGE_PTE.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/mm: Move setting PTE specific flags to pfn_pmd()
      https://git.kernel.org/powerpc/c/53f45ecc9cd04b4b963f3040f2a54c3baf03b229

cheers
