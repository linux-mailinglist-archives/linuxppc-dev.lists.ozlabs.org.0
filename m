Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0B15AB654
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 18:13:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK2yD6t2Nz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 02:13:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GkQbfUn6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GkQbfUn6;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK2wr4nQfz2xvr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 02:11:56 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A93AA620E6;
	Fri,  2 Sep 2022 16:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3679C433D6;
	Fri,  2 Sep 2022 16:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662135110;
	bh=Z+r+C0wXesNeSLz5e3UJqk59d7HBkCsYfjmU8Ig94Nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GkQbfUn6XOZBr8nDbP6jSghq2ziGVbFCURz1EP8SImFQb0gGum6nav+0oCXZD7ca4
	 BiYWRgLJZyzHWkTYBOiZte3KsKNZWIaY7JHIgPbUTs39A/svAaTh534v3gZNz3dTpU
	 qcNBiQKyrHWmUFRJXjg5x06pHGiz0vbgXZLq03Kp8fpdRNRmnY1JlsRjNcipWw8zvC
	 ZlboecCfQFKHa5Mo57dBxwMIfOMQb8sbBwobndKOSFII3YyfG4RmjA95dFR3ekTbnC
	 ZDAck3yQCQmVYQ1lyvVjRxls+MRvckUZzmxlE5Lo1Iu6oo7fzaAQkCK9gn9I6CLAVJ
	 Moit4HTADimIA==
Date: Fri, 2 Sep 2022 09:11:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 2/2] powerpc/math-emu: Remove -w build flag and fix
 warnings
Message-ID: <YxIrRJz3+fkzogay@dev-arch.thelio-3990X>
References: <a7384eafc6a27aea15bdc9e8f9a12aac593fccb7.1662113301.git.christophe.leroy@csgroup.eu>
 <35c86b7ca823954c6cd593acc3690dc3748da9b1.1662113301.git.christophe.leroy@csgroup.eu>
 <YxIjM/jdLajq4dFk@dev-arch.thelio-3990X>
 <20220902155954.GP25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902155954.GP25951@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 02, 2022 at 10:59:54AM -0500, Segher Boessenkool wrote:
> On Fri, Sep 02, 2022 at 08:37:23AM -0700, Nathan Chancellor wrote:
> > On Fri, Sep 02, 2022 at 12:08:55PM +0200, Christophe Leroy wrote:
> > > This should have been detected by gcc at build time, but due to
> > > '-w' flag it went undetected.
> > > 
> > > Removing that flag leads to many warnings hence errors.
> 
> > Thanks for figuring out what was going on here! I took this patch for a
> > spin with clang and it has a few more errors around
> > -Wimplicit-fallthrough:
> 
> Maybe add -Wno-implicit-fallthrough?  This code is a copy from outside
> the kernel, no one has ever wanted to maintain it, if nothing else (the
> more politically correct formulation is "we cannot as easily pick up
> improvements from upstream if we modify stuff").

Sure, we could do something like this if you preferred:

diff --git a/arch/powerpc/math-emu/Makefile b/arch/powerpc/math-emu/Makefile
index 26fef2e5672e..ed775747a2a5 100644
--- a/arch/powerpc/math-emu/Makefile
+++ b/arch/powerpc/math-emu/Makefile
@@ -16,3 +16,7 @@ obj-$(CONFIG_SPE)		+= math_efp.o
 
 CFLAGS_fabs.o = -fno-builtin-fabs
 CFLAGS_math.o = -fno-builtin-fabs
+
+ifdef CONFIG_CC_IS_CLANG
+ccflags-remove-y := $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
+endif

At the same time, I see other modifications to these files that appear
to be for the kernel only so I suspect that this is already in the "we
cannot as easily pick up improvements from upstream" category,
regardless of that diff. No strong opinion from me, although I see
Christophe already included my suggestion in the most recent series:

https://lore.kernel.org/2663961738a46073713786d4efeb53100ca156e7.1662134272.git.christophe.leroy@csgroup.eu/

Cheers,
Nathan
