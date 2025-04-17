Return-Path: <linuxppc-dev+bounces-7749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1301BA922BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 18:32:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zdk2M53C5z2yrX;
	Fri, 18 Apr 2025 02:32:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744907547;
	cv=none; b=OT++kEgv8Z6gi+007t2dHpdRC97OoXk8xt4kgMJQ3qhWmhymuUnYZOhQZ2xgnULNAywAtL2uDnrXZjtWMAf+zO2dACCA724hThKM2HG36/I24doAAKNDU1Qo+8Fp+MZHe0Yh7yjGsJMC+BA5Y4xevmapz6P9N75m0j9RODkl/P+VLUAx81+UWJUai257zt40kFAsC91NdI8LAyQNoqewYV4OiVeJ2AvjoE4SNIvTb56J0cSNJLW1ijDj52KyqO+0a9pXckv32bR6mMi0KU0Yd/T56ftpoMrs+nPb+hGF6QRlm9VviOhH0OWDTRfa8u1AKu01IMwcu7EpHGEIviflbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744907547; c=relaxed/relaxed;
	bh=9NWrz+uGXp/skKrGJXcyNkb6DdoWaNPehr7XIbL91e8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPmjCyn+VvRf8UNubN4VVL9agPRM91XCDnST1POL5WHApXEKrbfe44YUx5M82m1hEHlxsDJ5nSR1RVo6iWSL19+UjZxJ16lHqMiVehF6uyuXVgkAheikywAD/zDWElA4PG7YeFIGG2r2Hsj5qUI+eBcCgD1BeLGtdU/iLcRQ70UAoB5OWZ5Lb+1Pu4g6i6T3TQjVYHGURZDN5vKV2VAvuLrJLbpDk3SVvM7oTBFMGyGIvDh426i7rSUyvjlY6GsbhTa1QV5z/BMh+D76B79PnDFexbORApaELBIz2FtVaAn2R46DKlQ9D1xXOIiYiHejYAr8q0JONYos+jOjtfVLtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ttluGruo; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ttluGruo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zdk2L6Z30z2ydx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 02:32:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 430BF4A174;
	Thu, 17 Apr 2025 16:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CD8C4CEE4;
	Thu, 17 Apr 2025 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744907544;
	bh=IV/xW+QXt1ASDi8c6AGAf/97Q00BOAQgySjKp6oRkGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttluGruoonakRWVv2QadlsnXULVOzog0Vv6+AUNJs7eFI4QI1pV/no4q9xkLONAHa
	 ND3JGSYH6nxKKbmxpfAk3lZRxnxlKtOzXZZkoplp5mWvGpuC2Hvnh8byO5PQmx1hNB
	 J6Y/H5VBxTyZTegf4X6qSAylixrad/WfU/iej79TEbLb4+jS16TT1JgnyCM3NBRBJl
	 H8VmM+L/sGPSbtsZWrNRfaqDOr3siGDYmXV59DFk5upNBZclqmvezjF3RTSLQisHR5
	 XCt6eaEq5R/CGobkqTZEIrgkFklo0zUaJigiUCOQTG8NcZjLX5p9LhBDfFIbTuRRaV
	 06/JbYgKkSMYQ==
Date: Thu, 17 Apr 2025 09:32:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH] lib/crc: make the CPU feature static keys __ro_after_init
Message-ID: <20250417163221.GA800@quark.localdomain>
References: <20250413154350.10819-1-ebiggers@kernel.org>
 <20250417125318.12521F12-hca@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417125318.12521F12-hca@linux.ibm.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 17, 2025 at 02:53:18PM +0200, Heiko Carstens wrote:
> On Sun, Apr 13, 2025 at 08:43:50AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > All of the CRC library's CPU feature static_keys are initialized by
> > initcalls and never change afterwards, so there's no need for them to be
> > in the regular .data section.  Put them in .data..ro_after_init instead.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> > 
> > I'm planning to take this via the crc tree.
> > 
> >  arch/arm/lib/crc-t10dif-glue.c       | 4 ++--
> >  arch/arm/lib/crc32-glue.c            | 4 ++--
> >  arch/arm64/lib/crc-t10dif-glue.c     | 4 ++--
> >  arch/loongarch/lib/crc32-loongarch.c | 2 +-
> >  arch/mips/lib/crc32-mips.c           | 2 +-
> >  arch/powerpc/lib/crc-t10dif-glue.c   | 2 +-
> >  arch/powerpc/lib/crc32-glue.c        | 2 +-
> >  arch/s390/lib/crc32-glue.c           | 2 +-
> 
> 
> Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390
> 
> I just realized that we can get rid of the static key in the s390
> piece and end up with slightly better code. Could you add the patch
> below to your tree, please? If this would go via the s390 tree this
> would result in a merge conflict, which is unnecessary.
> 
> From 6c4c0ca6fe87e43acf6192f1afc0a6346db994f4 Mon Sep 17 00:00:00 2001
> From: Heiko Carstens <hca@linux.ibm.com>
> Date: Thu, 17 Apr 2025 14:30:56 +0200
> Subject: [PATCH] s390/crc32: Remove have_vxrs static key
> 
> Replace the have_vxrs static key with a cpu_has_vx() call.  cpu_has_vx()
> resolves into a compile time constant (true) if the kernel is compiled for
> z13 or newer. Otherwise it generates an unconditional one instruction
> branch, which is patched based on CPU alternatives.
> 
> In any case the generated code is at least as good as before and avoids
> static key handling.
> 
> Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
> ---
>  arch/s390/lib/crc32-glue.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Thanks!  Applied to
https://web.git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

- Eric

