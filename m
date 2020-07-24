Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 529EA22C8B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:02:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCsrM5BSgzDrqJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 01:02:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgh2y7QzDr9w
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:25:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgX2L8qz9sTq; Fri, 24 Jul 2020 23:24:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20200614083604.302611-1-maddy@linux.ibm.com>
References: <20200614083604.302611-1-maddy@linux.ibm.com>
Subject: Re: [PATCH] powerpc/perf: fix missing is_sier_aviable() during build
Message-Id: <159559696921.1657499.4289618072393865403.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:24:55 +1000 (AEST)
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 14 Jun 2020 14:06:04 +0530, Madhavan Srinivasan wrote:
> Compilation error:
> 
> arch/powerpc/perf/perf_regs.c:80:undefined reference to `.is_sier_available'
> 
> Currently is_sier_available() is part of core-book3s.c.
> But then, core-book3s.c is added to build based on
> CONFIG_PPC_PERF_CTRS. A config with CONFIG_PERF_EVENTS
> and without CONFIG_PPC_PERF_CTRS will have a build break
> because of missing is_sier_available(). Patch adds
> is_sier_available() in asm/perf_event.h to fix the build
> break for configs missing CONFIG_PPC_PERF_CTRS.

Applied to powerpc/next.

[1/1] powerpc/perf: Fix missing is_sier_aviable() during build
      https://git.kernel.org/powerpc/c/3c9450c053f88e525b2db1e6990cdf34d14e7696

cheers
