Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FE6190C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 03:56:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hpTY1DkrzDqM7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 11:56:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hng315VzzDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 11:19:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45hng26v5bz9sP6; Mon,  8 Jul 2019 11:19:42 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3fefd1cd95df04da67c83c1cb93b663f04b3324f
In-Reply-To: <20190620060040.26945-1-mikey@neuling.org>
To: Michael Neuling <mikey@neuling.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix CR0 setting in TM emulation
Message-Id: <45hng26v5bz9sP6@ozlabs.org>
Date: Mon,  8 Jul 2019 11:19:42 +1000 (AEST)
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 sjitindarsingh@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-06-20 at 06:00:40 UTC, Michael Neuling wrote:
> When emulating tsr, treclaim and trechkpt, we incorrectly set CR0. The
> code currently sets:
>     CR0 <- 00 || MSR[TS]
> but according to the ISA it should be:
>     CR0 <-  0 || MSR[TS] || 0
> 
> This fixes the bit shift to put the bits in the correct location.
> 
> Tested-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> Signed-off-by: Michael Neuling <mikey@neuling.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/3fefd1cd95df04da67c83c1cb93b663f04b3324f

cheers
