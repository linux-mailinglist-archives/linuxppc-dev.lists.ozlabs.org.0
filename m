Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91503254027
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 10:04:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcZyX5t62zDqgx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:04:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcZYs0W6TzDqd3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 17:46:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BcZYq2qrBz9sTS; Thu, 27 Aug 2020 17:46:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: pratik.r.sampat@gmail.com, linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 mikey@neuling.org, svaidy@linux.ibm.com, ego@linux.vnet.ibm.com,
 npiggin@gmail.com, Pratik Rajesh Sampat <psampat@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200826082918.89306-1-psampat@linux.ibm.com>
References: <20200826082918.89306-1-psampat@linux.ibm.com>
Subject: Re: [PATCH] Revert "powerpc/powernv/idle: Replace CPU feature check
 with PVR check"
Message-Id: <159851436179.52163.400542101081853718.b4-ty@ellerman.id.au>
Date: Thu, 27 Aug 2020 17:46:54 +1000 (AEST)
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

On Wed, 26 Aug 2020 13:59:18 +0530, Pratik Rajesh Sampat wrote:
> Cpuidle stop state implementation has minor optimizations for P10
> where hardware preserves more SPR registers compared to P9.
> The current P9 driver works for P10, although does few extra
> save-restores. P9 driver can provide the required power management
> features like SMT thread folding and core level power savings
> on a P10 platform.
> 
> [...]

Applied to powerpc/fixes.

[1/1] Revert "powerpc/powernv/idle: Replace CPU feature check with PVR check"
      https://git.kernel.org/powerpc/c/16d83a540ca4e7f1ebb2b3756869b77451d31414

cheers
