Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B76378E540
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 06:05:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbndJ3l2Xz3dDH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 14:05:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbncH0kq3z2xdb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 14:04:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbncG10wsz4wy4;
	Thu, 31 Aug 2023 14:04:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <5e0f97d5cbcd05238b56b4424ab096468296824d.1692684461.git.christophe.leroy@csgroup.eu>
References: <5e0f97d5cbcd05238b56b4424ab096468296824d.1692684461.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/64e: Fix circular dependency with CONFIG_SMP disabled
Message-Id: <169345455027.11824.17933728050023011677.b4-ty@ellerman.id.au>
Date: Thu, 31 Aug 2023 14:02:30 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 22 Aug 2023 08:07:50 +0200, Christophe Leroy wrote:
> asm/percpu.h includes asm/paca.h which needs struct tlb_core_data
> which is defined in mmu-e500.h
> 
> asm/percpu.h is included from asm/mmu.h in a #ifdef CONFIG_E500
> before the inclusion of mmu-e500.h
> 
> To fix that, move the inclusion of asm/percpu.h into mmu-e500.h
> after the definition of struct tlb_core_data
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64e: Fix circular dependency with CONFIG_SMP disabled
      https://git.kernel.org/powerpc/c/0e2a34c467a0de2b0309d033e2700ce608e3fbf4

cheers
