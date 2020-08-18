Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EEF247CC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 05:28:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVxFf4tn1zDqZR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 13:28:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVx5S0ptMzDqXM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 13:21:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BVx5R476bz9sRK; Tue, 18 Aug 2020 13:21:15 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Sandipan Das <sandipan@linux.ibm.com>
In-Reply-To: <a4956d838bf59b0a71a2553c5ca81131ea8b49b9.1596561758.git.sandipan@linux.ibm.com>
References: <a4956d838bf59b0a71a2553c5ca81131ea8b49b9.1596561758.git.sandipan@linux.ibm.com>
Subject: Re: [PATCH v4] selftests/powerpc: Fix pkey syscall redefinitions
Message-Id: <159772076159.1537671.9788542551591591295.b4-ty@ellerman.id.au>
Date: Tue, 18 Aug 2020 13:21:15 +1000 (AEST)
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
Cc: sachinp@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 David Laight <david.laight@aculab.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Aug 2020 23:01:37 +0530, Sandipan Das wrote:
> On distros using older glibc versions, the pkey tests
> encounter build failures due to redefinition of the
> pkey syscall numbers.
> 
> For compatibility, commit 743f3544fffb added a wrapper
> for the gettid() syscall and included syscall.h if the
> version of glibc used is older than 2.30. This leads
> to different definitions of SYS_pkey_* as the ones in
> the pkey test header set numeric constants where as the
> ones from syscall.h reuse __NR_pkey_*. The compiler
> complains about redefinitions since they are different.
> 
> [...]

Applied to powerpc/fixes.

[1/1] selftests/powerpc: Fix pkey syscall redefinitions
      https://git.kernel.org/powerpc/c/a7aaa2f26bfd932a654706b19859e7adf802bee2

cheers
