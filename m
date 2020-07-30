Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 975ED2332EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:24:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHWNk03FNzDqFw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:24:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4BHVcz5625zDqyx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:50:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BHVcz1HSGz9sSy; Thu, 30 Jul 2020 22:50:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200726035155.1424103-1-npiggin@gmail.com>
References: <20200726035155.1424103-1-npiggin@gmail.com>
Subject: Re: [PATCH v3 0/3] powerpc/pseries: IPI doorbell improvements
Message-Id: <159611327055.1601380.101656478526695975.b4-ty@ellerman.id.au>
Date: Thu, 30 Jul 2020 22:50:26 +1000 (AEST)
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
Cc: Anton Blanchard <anton@linux.ibm.com>, Cédric Le Goater <clg@kaod.org>, kvm-ppc@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 26 Jul 2020 13:51:52 +1000, Nicholas Piggin wrote:
> Since v2:
> - Fixed ppc32 compile error
> - Tested-by from Cedric
> 
> Nicholas Piggin (3):
>   powerpc: inline doorbell sending functions
>   powerpc/pseries: Use doorbells even if XIVE is available
>   powerpc/pseries: Add KVM guest doorbell restrictions
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc: Inline doorbell sending functions
      https://git.kernel.org/powerpc/c/1f0ce497433f8944045ee1baae218e31a0d295ee
[2/3] powerpc/pseries: Use doorbells even if XIVE is available
      https://git.kernel.org/powerpc/c/5b06d1679f2fe874ef49ea11324cd893ec9e2da8
[3/3] powerpc/pseries: Add KVM guest doorbell restrictions
      https://git.kernel.org/powerpc/c/107c55005fbd5243ee31fb13b6f166cde9e3ade1

cheers
