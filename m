Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E31726DB17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:07:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsbM90P7nzDqWR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:07:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSd71t9zDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSc5kpsz9sTq; Thu, 17 Sep 2020 21:27:28 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200819094700.493399-1-npiggin@gmail.com>
References: <20200819094700.493399-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/powernv/idle: add a basic stop 0-3 driver for
 POWER10
Message-Id: <160034201715.3339803.9372079054370890796.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:28 +1000 (AEST)
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, Ryan P Grimm <rgrimm@us.ibm.com>,
 Pratik Rajesh Sampat <psampat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 19 Aug 2020 19:47:00 +1000, Nicholas Piggin wrote:
> This driver does not restore stop > 3 state, so it limits itself
> to states which do not lose full state or TB.
> 
> The POWER10 SPRs are sufficiently different from P9 that it seems
> easier to split out the P10 code. The POWER10 deep sleep code
> (e.g., the BHRB restore) has been taken out, but it can be re-added
> when stop > 3 support is added.

Applied to powerpc/next.

[1/1] powerpc/powernv/idle: add a basic stop 0-3 driver for POWER10
      https://git.kernel.org/powerpc/c/ffd2961bb41f797eb00b58e019b707555197275e

cheers
