Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0025AF86A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 01:33:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMhXN6FKLz3c63
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 09:33:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LRj2zLU7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LRj2zLU7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMhWn33dWz2xJ9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 09:32:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97E9361595;
	Tue,  6 Sep 2022 23:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D0EC433C1;
	Tue,  6 Sep 2022 23:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662507167;
	bh=VSbsodn32Me/TB6K6eplLjOszQKC8B+zCTblViWR7YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRj2zLU7S0ku2c8uSQ4JavQr7F3lqx3X3iA8IxX3dtJ3PF9y5PbR/Os4AFMmP+DIQ
	 xnJXS+8qYttCV2P96XjirbDo6Ru8SVLDpx7fr87pvpzhKdyqps8dfEnBH653AYm+m4
	 m++1BshTGP1TbiObcwrogtqT2OYgvgMKe1Bwb+iEt2oo/WiDzQXQwiQgowObXtfys+
	 yrHHGHYhPJD8QioMOj7YsYSqhmWT1PjZXXMk+pxGM+T1NhFLENBUo9IvsQf1ryPCQj
	 r7uS3s4iSQg4KNyvSxUjZ8A/4Lq33jgBeA9Lh9oqWGj8942QR9deDuljPvWXdJFk6s
	 gACiP9gE0ms5A==
Date: Tue, 6 Sep 2022 16:32:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/3] powerpc/pseries: define driver for Platform
 KeyStore
Message-ID: <YxfYnLw6R30pvZ8l@dev-arch.thelio-3990X>
References: <20220723113048.521744-1-nayna@linux.ibm.com>
 <20220723113048.521744-2-nayna@linux.ibm.com>
 <Yxe06fbq18Wv9y3W@dev-arch.thelio-3990X>
 <875yi0t7e1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yi0t7e1.fsf@mpe.ellerman.id.au>
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
Cc: bjking1@us.ibm.com, gjoyce@linux.vnet.ibm.com, erichte@linux.ibm.com, Nayna Jain <nayna@linux.ibm.com>, npiggin@gmail.com, muriloo@linux.ibm.com, George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 07, 2022 at 09:23:02AM +1000, Michael Ellerman wrote:
> Nathan Chancellor <nathan@kernel.org> writes:
> > Hi all,
> >
> > On Sat, Jul 23, 2022 at 07:30:46AM -0400, Nayna Jain wrote:
> >> PowerVM provides an isolated Platform Keystore(PKS) storage allocation
> >> for each LPAR with individually managed access controls to store
> >> sensitive information securely. It provides a new set of hypervisor
> >> calls for Linux kernel to access PKS storage.
> >> 
> >> Define POWER LPAR Platform KeyStore(PLPKS) driver using H_CALL interface
> >> to access PKS storage.
> >> 
> >> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> >
> > This commit is now in mainline as commit 2454a7af0f2a ("powerpc/pseries:
> > define driver for Platform KeyStore") and I just bisected a crash while
> > boot testing Fedora's configuration [1] in QEMU to it. I initially
> > noticed this in ClangBuiltLinux's CI but this doesn't appear to be clang
> > specific since I can reproduce with GCC 12.2.1 from Fedora. I can
> > reproduce with just powernv_defconfig + CONFIG_PPC_PSERIES=y +
> > CONFIG_PSERIES_PLPKS=y. Our firmware and rootfs are available in our
> > boot-utils repository [2].
> 
> Thanks, classic bug I should have spotted.
> 
> I didn't catch it in my testing because PLPKS isn't enabled in
> our defconfigs.
> 
> Does your CI enable new options by default? Or are you booting
> allyesconfig?

Neither actually. We just test a bunch of in-tree and distribution
configurations. The distribution configurations are fetched straight
from their URLs on gitweb so we get any updates that they do, which is
how we noticed this (CONFIG_PSERIES_PLPKS was recently enabled in
Fedora):

https://src.fedoraproject.org/rpms/kernel/c/a73f6858a2cbd16bbcc6d305d6c43aab6f59d0b1

> I'll send a fix.

Thanks for the quick response!

Cheers,
Nathan
