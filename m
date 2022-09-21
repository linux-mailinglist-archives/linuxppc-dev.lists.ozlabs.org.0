Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3805E5360
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 20:53:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXnbw0kKCz3cS8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 04:53:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXnbV1pLZz3bbj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 04:52:36 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28LIoW47025340;
	Wed, 21 Sep 2022 13:50:32 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 28LIoVcL025339;
	Wed, 21 Sep 2022 13:50:31 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 21 Sep 2022 13:50:31 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s: Fix GENERIC_CPU build flags for PPC970 / G5
Message-ID: <20220921185031.GE25951@gate.crashing.org>
References: <20220921014103.587954-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921014103.587954-1-npiggin@gmail.com>
User-Agent: Mutt/1.4.2.3i
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 21, 2022 at 11:41:02AM +1000, Nicholas Piggin wrote:
> Big-endian GENERIC_CPU supports 970, but builds with -mcpu=power5.
> POWER5 is ISA v2.02 whereas 970 is v2.01 plus Altivec. 2.02 added
> the popcntb instruction which a compiler might use.
> 
> Use -mcpu=power4.
> 
> Fixes: 471d7ff8b51b ("powerpc/64s: Remove POWER4 support")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

Thank you!

Maybe superfluous, but some more context: GCC's -mcpu=power4 means
POWER4+, ISA 2.01, according to our documentation.  There is no
difference with ISA 2.00 (what plain POWER4 implements) for anything
GCC does.


Segher
