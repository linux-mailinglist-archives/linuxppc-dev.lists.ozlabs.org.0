Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A35B426DA3D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 13:32:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsZYx1xX6zDqX7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 21:32:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSL5vJ9zDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSL5D8hz9sTS; Thu, 17 Sep 2020 21:27:14 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
In-Reply-To: <20200608070904.387440-1-aneesh.kumar@linux.ibm.com>
References: <20200608070904.387440-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] powerpc/percpu: Update percpu bootmem allocator
Message-Id: <160034201204.3339803.8692189219843655423.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:14 +1000 (AEST)
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
Cc: cam@neo-zeon.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 8 Jun 2020 12:39:01 +0530, Aneesh Kumar K.V wrote:
> This update the ppc64 version to be closer to x86/sparc.

Applied to powerpc/next.

[1/4] powerpc/percpu: Update percpu bootmem allocator
      https://git.kernel.org/powerpc/c/2a32abac8860aa1c3a1fc99973ce67179575b36c
[2/4] powerpc/64/mm: implement page mapping percpu first chunk allocator
      https://git.kernel.org/powerpc/c/eb553f16973ade990d05946af9ae191394712c8a
[3/4] powerpc/book3s64/hash/4k: Support large linear mapping range with 4K
      https://git.kernel.org/powerpc/c/7746406baa3bc9e23fdd7b7da2f04d86e25ab837
[4/4] powerpc/mm/book3s: Split radix and hash MAX_PHYSMEM limit
      https://git.kernel.org/powerpc/c/b32d5d7e920a364287f6206af2d20179978a617d

cheers
