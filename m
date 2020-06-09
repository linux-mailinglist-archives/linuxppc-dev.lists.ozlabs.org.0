Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 568591F341F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:32:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h0fk4BvpzDqBj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:32:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFn66c5zDqRm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49gzFX2df1z9sVK; Tue,  9 Jun 2020 15:29:20 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFX0KD0z9sVL; Tue,  9 Jun 2020 15:29:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200511125825.3081305-1-mpe@ellerman.id.au>
References: <20200511125825.3081305-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v4 1/2] powerpc/64s/hash: Add stress_slb kernel boot
 option to increase SLB faults
Message-Id: <159168031419.1381411.8472597556422768570.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:19 +1000 (AEST)
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 11 May 2020 22:58:24 +1000, Michael Ellerman wrote:
> This option increases the number of SLB misses by limiting the number
> of kernel SLB entries, and increased flushing of cached lookaside
> information. This helps stress test difficult to hit paths in the
> kernel.
> 
> [mpe: Relocate the code into arch/powerpc/mm, s/torture/stress/]

Applied to powerpc/next.

[1/1] powerpc/64s/hash: Add stress_slb kernel boot option to increase SLB faults
      https://git.kernel.org/powerpc/c/82a1b8ed5604cccf30b6ff03bcd61640cd26369b

cheers
