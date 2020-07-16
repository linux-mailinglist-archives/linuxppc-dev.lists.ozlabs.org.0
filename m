Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF4222395
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:08:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6vgp4y4ZzDqqW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:08:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vPS5YskzDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:55:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPR0psXz9sTS; Thu, 16 Jul 2020 22:55:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
 miltonm@us.ibm.com, Anton Blanchard <anton@ozlabs.org>
In-Reply-To: <20200715233704.1352257-1-anton@ozlabs.org>
References: <20200715233704.1352257-1-anton@ozlabs.org>
Subject: Re: [PATCH] powerpc/vdso: Fix vdso cpu truncation
Message-Id: <159490401776.3805857.11367493898860146244.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:55:38 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Jul 2020 09:37:04 +1000, Anton Blanchard wrote:
> The code in vdso_cpu_init that exposes the cpu and numa node to
> userspace via SPRG_VDSO incorrctly masks the cpu to 12 bits. This means
> that any kernel running on a box with more than 4096 threads (NR_CPUS
> advertises a limit of of 8192 cpus) would expose userspace to two cpu
> contexts running at the same time with the same cpu number.
> 
> Note: I'm not aware of any distro shipping a kernel with support for more
> than 4096 threads today, nor of any system image that currently exceeds
> 4096 threads. Found via code browsing.

Applied to powerpc/next.

[1/1] powerpc/vdso: Fix vdso cpu truncation
      https://git.kernel.org/powerpc/c/a9f675f950a07d5c1dbcbb97aabac56f5ed085e3

cheers
