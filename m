Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA40565724
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 15:29:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc69P4RQKz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 23:29:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iNI+7Qkp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iNI+7Qkp;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc68n537Yz2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 23:29:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E4448B80F00;
	Mon,  4 Jul 2022 13:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67378C3411E;
	Mon,  4 Jul 2022 13:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656941347;
	bh=LxOgaJ9LSgEjVEuMAJUhVF/q8JAFuDeLHwegeV8kA+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iNI+7QkpC3aLbGataolyMpLPtKEu8CKuclbUHURo1BxSe9EZvBggWafe9cc7MntHS
	 EMXFp45e3B0esnlKzSsBiW3ed0jhCGDmo3KCthIzh61k9EzvgMF0OAu3TBirp9WDzv
	 qKmmMeyZzkMcPqWemgD4B+BO3qIKEt7fKKtPENF+zmLJhQG4oGayeg93wrcaylA8Px
	 1s3SsNTho80QD/W9+MGqts9ub7DIDaBszIxuTfzX2IUDAKP3sRq6EzHdUwopwLOh7W
	 HxtreIXlyRUprjsnBINdTS60JYEuFsXqpSybaqjCWyRVvTCba314q8tTWzLy4hES8w
	 ZticA7DiamrvA==
Received: by pali.im (Postfix)
	id BBEE46E8; Mon,  4 Jul 2022 15:29:04 +0200 (CEST)
Date: Mon, 4 Jul 2022 15:29:04 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Message-ID: <20220704132904.irvs4xefu4esgw6c@pali>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
 <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
 <20220704131358.fy3z7tjcmk2m6pfh@pali>
 <CAK8P3a2hfnt+tHiqHrHAVyagSm73LJe4OV8ig=CKFcycfk4Zag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a2hfnt+tHiqHrHAVyagSm73LJe4OV8ig=CKFcycfk4Zag@mail.gmail.com>
User-Agent: NeoMutt/20180716
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 04 July 2022 15:22:03 Arnd Bergmann wrote:
> On Mon, Jul 4, 2022 at 3:13 PM Pali Rohár <pali@kernel.org> wrote:
> > On Monday 04 July 2022 14:07:10 Arnd Bergmann wrote:
> 
> > > CFLAGS_CPU-$(CONFIG_PPC_BOOK3S_32) := -mcpu=powerpc
> > > CFLAGS_CPU-$(CONFIG_PPC_85xx) := -mcpu=8540
> > > CFLAGS_CPU-$(CONFIG_PPC8xx) := -mcpu=860
> > > CFLAGS_CPU-$(CONFIG_PPC44x) := -mcpu=440
> > > CFLAGS_CPU-$(CONFIG_PPC40x) := -mcpu=405
> > > ifdef CONFIG_CPU_LITTLE_ENDIAN
> > > CFLAGS_CPU-$(CONFIG_BOOK3S_64) := -mcpu=power8
> > > else
> > > CFLAGS_CPU-$(CONFIG_BOOK3S_64) := -mcpu=power5
> > > endif
> > > CFLAGS_CPU-$(CONFIG_BOOK3E_64) := -mcpu=powerpc64
> >
> > Yes, this is something I would expect that in Makefile should be.
> >
> > But what to do with fallback value?
> 
> Most of the fallback values can just be removed because we don't support
> building with gcc versions older than 5.1.0 any more. The only one
> that I think still needs a fallback is mtune=power9, which requires gcc-6.1
> or higher. CONFIG_POWER9_CPU could similarly use a
> "depends on GCC_VERSION > 60100".
> 
>         Arnd

And still what to do with 4bf4f42a2feb ("powerpc/kbuild: Set default
generic machine type for 32-bit compile")? I'm somehow lost there...
