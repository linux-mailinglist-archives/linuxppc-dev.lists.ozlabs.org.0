Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A2D2771AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 14:56:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxw5Y6kNRzDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 22:56:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxvT25jLpzDqbD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 22:27:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BxvT233Vpz9sVd; Thu, 24 Sep 2020 22:27:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BxvT14gvSz9sVY; Thu, 24 Sep 2020 22:27:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200819015634.1974478-1-mpe@ellerman.id.au>
References: <20200819015634.1974478-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/3] powerpc: Move arch_cpu_idle_dead() into smp.c
Message-Id: <160094999992.26280.13071529311216521069.b4-ty@ellerman.id.au>
Date: Thu, 24 Sep 2020 22:27:48 +1000 (AEST)
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

On Wed, 19 Aug 2020 11:56:32 +1000, Michael Ellerman wrote:
> arch_cpu_idle_dead() is in idle.c, which makes sense, but it's inside
> a CONFIG_HOTPLUG_CPU block.
> 
> It would be more at home in smp.c, inside the existing
> CONFIG_HOTPLUG_CPU block. Note that CONFIG_HOTPLUG_CPU depends on
> CONFIG_SMP so even though smp.c is not built for SMP=n builds, that's
> fine.

Applied to powerpc/next.

[1/3] powerpc: Move arch_cpu_idle_dead() into smp.c
      https://git.kernel.org/powerpc/c/1ea21ba231f248034e8c794aa675869ca2b97d42
[2/3] powerpc/smp: Fold cpu_die() into its only caller
      https://git.kernel.org/powerpc/c/bf3c1464db883a953ad7bbed64924480b8b2b244
[3/3] powerpc/smp: Move ppc_md.cpu_die() to smp_ops.cpu_offline_self()
      https://git.kernel.org/powerpc/c/39f87561454dc33efb2a3d8354d066207acac8a6

cheers
