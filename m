Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B509B319767
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:25:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcDmL0RN6zDwvs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:25:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDf10gXHzDwkM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:19:53 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDf05xtTz9sVR; Fri, 12 Feb 2021 11:19:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210203045812.234439-1-aneesh.kumar@linux.ibm.com>
References: <20210203045812.234439-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/mm: Enable compound page check for both THP
 and HugeTLB
Message-Id: <161308904126.3606979.14177601703848587629.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:19:52 +1100 (AEDT)
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

On Wed, 3 Feb 2021 10:28:10 +0530, Aneesh Kumar K.V wrote:
> THP config results in compound pages. Make sure the kernel enables
> the PageCompound() check with CONFIG_HUGETLB_PAGE disabled and
> CONFIG_TRANSPARENT_HUGEPAGE enabled.
> 
> This makes sure we correctly flush the icache with THP pages.
> flush_dcache_icache_page only matter for platforms that don't support
> COHERENT_ICACHE.

Applied to powerpc/next.

[1/3] powerpc/mm: Enable compound page check for both THP and HugeTLB
      https://git.kernel.org/powerpc/c/c7ba2d636342093cfb842f47640e5b62192adfed
[2/3] powerpc/mm: Add PG_dcache_clean to indicate dcache clean state
      https://git.kernel.org/powerpc/c/ec94b9b23d620d40ab2ced094a30c22bb8d69b9f
[3/3] powerpc/mm: Remove dcache flush from memory remove.
      https://git.kernel.org/powerpc/c/2ac02e5ecec0cc2484d60a73b1bc6394aa2fad28

cheers
