Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C46247CBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 05:26:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVxCT1KNNzDqZL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 13:26:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVx5R0JzXzDqXM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 13:21:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BVx5Q6v9hz9sTX; Tue, 18 Aug 2020 13:21:14 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Michael Neuling <mikey@neuling.org>
In-Reply-To: <20200803035600.1820371-1-mikey@neuling.org>
References: <20200803035600.1820371-1-mikey@neuling.org>
Subject: Re: [PATCH] powerpc: Fix P10 PVR revision in /proc/cpuinfo for SMT4
 cores
Message-Id: <159772076140.1537671.7948201442853663666.b4-ty@ellerman.id.au>
Date: Tue, 18 Aug 2020 13:21:14 +1000 (AEST)
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
Cc: grimm@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 3 Aug 2020 13:56:00 +1000, Michael Neuling wrote:
> On POWER10 bit 12 in the PVR indicates if the core is SMT4 or
> SMT8. Bit 12 is set for SMT4.
> 
> Without this patch, /proc/cpuinfo on a SMT4 DD1 POWER10 looks like
> this:
>     cpu             : POWER10, altivec supported
>     revision        : 17.0 (pvr 0080 1100)

Applied to powerpc/fixes.

[1/1] powerpc: Fix P10 PVR revision in /proc/cpuinfo for SMT4 cores
      https://git.kernel.org/powerpc/c/030a2c689fb46e1690f7ded8b194bab7678efb28

cheers
