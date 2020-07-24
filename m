Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EFA22C8E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:22:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCtHZ5vvkzDrR6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 01:22:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgr24zZzDrgq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:25:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgq46Hrz9sTd; Fri, 24 Jul 2020 23:25:11 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200703011958.1166620-1-npiggin@gmail.com>
References: <20200703011958.1166620-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 0/3] remove PROT_SAO support and disable
Message-Id: <159559696901.1657499.15799900734438878764.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:25:11 +1000 (AEST)
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
Cc: linux-api@vger.kernel.org, kvm-ppc@vger.kernel.org, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 3 Jul 2020 11:19:55 +1000, Nicholas Piggin wrote:
> It was suggested that I post this to a wider audience on account of
> the change to supported userspace features in patch 2 particularly.
> 
> Thanks,
> Nick
> 
> Nicholas Piggin (3):
>   powerpc: remove stale calc_vm_prot_bits comment
>   powerpc/64s: remove PROT_SAO support
>   powerpc/64s/hash: disable subpage_prot syscall by default
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc: Remove stale calc_vm_prot_bits() comment
      https://git.kernel.org/powerpc/c/f4ac1774f2cba44994ce9ac0a65772e4656ac2df
[2/3] powerpc/64s: Remove PROT_SAO support
      https://git.kernel.org/powerpc/c/5c9fa16e8abd342ce04dc830c1ebb2a03abf6c05
[3/3] powerpc/64s/hash: Disable subpage_prot syscall by default
      https://git.kernel.org/powerpc/c/63396ada804c676e070bd1b8663046f18698ab27

cheers
