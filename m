Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2952332CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:15:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHW9R5qLDzDqQg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:15:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHVcv6nClzDqxQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:50:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BHVcv4xxtz9sR4; Thu, 30 Jul 2020 22:50:23 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BHVcv38nFz9sTK; Thu, 30 Jul 2020 22:50:23 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200724131728.1643966-1-mpe@ellerman.id.au>
References: <20200724131728.1643966-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/9] powerpc/configs: Drop old symbols from
 ppc6xx_defconfig
Message-Id: <159611327887.1601380.16476900546505775598.b4-ty@ellerman.id.au>
Date: Thu, 30 Jul 2020 22:50:23 +1000 (AEST)
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

On Fri, 24 Jul 2020 23:17:20 +1000, Michael Ellerman wrote:
> ppc6xx_defconfig refers to quite a few symbols that no longer exist,
> as reported by scripts/checkkconfigsymbols.py, remove them.

Applied to powerpc/next.

[1/9] powerpc/configs: Drop old symbols from ppc6xx_defconfig
      https://git.kernel.org/powerpc/c/fbb44c9a08ef994109947c5439e649b18ad509ac
[2/9] powerpc/configs: Remove dead symbols
      https://git.kernel.org/powerpc/c/0fcce25b7743d634cc1ddce83382f51333933f76
[3/9] powerpc/52xx: Fix comment about CONFIG_BDI*
      https://git.kernel.org/powerpc/c/8cdcde5f76a42d53a50d1fc9e1fbfc9b90102323
[4/9] powerpc/64e: Drop dead BOOK3E_MMU_TLB_STATS code
      https://git.kernel.org/powerpc/c/07e571ea59eef518730f983f4203651ea413f2cf
[5/9] powerpc/32s: Fix CONFIG_BOOK3S_601 uses
      https://git.kernel.org/powerpc/c/df4d4ef22446b3a789a4efd74d34f2ec1e24deb2
[6/9] powerpc/32s: Remove TAUException wart in traps.c
      https://git.kernel.org/powerpc/c/69eeff022433b54390a359c629f6457d7d1a8e94
[7/9] powerpc/boot: Fix CONFIG_PPC_MPC52XX references
      https://git.kernel.org/powerpc/c/e5eff89657e72a9050d95fde146b54c7dc165981
[8/9] powerpc/kvm: Use correct CONFIG symbol in comment
      https://git.kernel.org/powerpc/c/157dad8678ad910ef7579c3f8ba93cc2940b014b
[9/9] powerpc: Drop old comment about CONFIG_POWER
      https://git.kernel.org/powerpc/c/ee36d867b2fefeb6fb6661b27e62e29c9ca5e7e5

cheers
