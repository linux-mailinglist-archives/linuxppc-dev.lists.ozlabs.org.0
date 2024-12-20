Return-Path: <linuxppc-dev+bounces-4355-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24369F94B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2024 15:43:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YF9Bq56JBz303K;
	Sat, 21 Dec 2024 01:43:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734705795;
	cv=none; b=nMRAiN6Wl17veQvBhlwxWR/WR+QaH0DtVuRW9d3rzo1nEFB2I1HgI6KR6YaIF+vmnSLW3PiZ8na5GRs3tYw8ZKMnOufaDNjr7cT0Zgans90NiG3RqIJgmGu1f4xCqOd96MlcpZpTKY/vIOpUNndxS1dmisVEPIbKEIqUbobSQaeIOwIRQd+ciKrLopDgB7FsO1IxWCgxL4MLLW4agRhRz57bVi3lsjdi2SfDjQjU20Ius2VsBYAQn+kUI/v+YtLYfneOuzZ+25eN73CqSpG6EYcEB5o1XlKNQOtHOhd+zpBmgrRC4nVsWdzCaFE3yVmcYxQUi557R3+ECBwgXTpm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734705795; c=relaxed/relaxed;
	bh=bN7/LC4OfI6mHgatVMhnDTYPvxro/Lz5vE8lxIdsk3Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LTqNlTnxqQ4OtyLvdfq+RQHbFo/czr7UDHU3k0vhiDkWz+J6nqp5BMHs4y5jzOBBYuEN11u4b238HlJkX5RanYpF5yUCEoH6G0CPBmncs1tNrfBoLdSY/W8fZSch5bdnPSN2DhOcZ3on8xGMk3JGbMWb6KZZl92ln0MLUWkTX9pk3GL+mPYfr2y6nAiGmdLuXMSAHj2uh982D86qLOatdPijCk5nc4sXrdVRCtI/vrE47Xz4HShaRmxjw4vYhT17TS9zYTwwhrK8m2Un9k+cEKttPWoqzuFJUuTlsugG7ByDs1HzJMDz+/ppZFK3wuejb24CWrgGLblHXB/2ySlNgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HFYezXmV; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HFYezXmV;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YF9Bn0nhvz2yL0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 01:43:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734705786;
	bh=bN7/LC4OfI6mHgatVMhnDTYPvxro/Lz5vE8lxIdsk3Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HFYezXmV8dUTNShbpN0V7/U5d5shG5nvZH4AlA4HDr0EG9PCJsv9ytBgCjq1cwe2e
	 +MARbFQ6wVHm+kewYHGrrJ2FTZFnaFtunAe2pWJ0rkiU7rgl7nn4WsjSYsQNCRtuBV
	 oLvzMzxV7/CmFL+DZQ9wPfvjOsW2JmoOQIsm5TY1Jh2zzA9EJi8vzJfco5T8404/rr
	 EkpwGwX5P8Z2FMksHhpGENGm2zYQ28poAEDUp6zRuN+h5n442m1F9DYN0ZS19rZV7/
	 bbvP2Q9cAa+1H2aWoF4tDVssQeI+VK/NtV8yzlkZrsh7DFhkCApn4XVhkJioYsjJ0N
	 g1vwYo/jsBeuA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YF9Bf4Y7bz4wyw;
	Sat, 21 Dec 2024 01:43:06 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, arnd@arndb.de, jk@ozlabs.org,
 segher@kernel.crashing.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 24/25] net: spider_net: Remove powerpc Cell driver
In-Reply-To: <20241218175954.3d0487c1@kernel.org>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
 <20241218105523.416573-24-mpe@ellerman.id.au>
 <20241218175917.74a404c1@kernel.org> <20241218175954.3d0487c1@kernel.org>
Date: Sat, 21 Dec 2024 01:43:08 +1100
Message-ID: <87r0621klf.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Jakub Kicinski <kuba@kernel.org> writes:
> On Wed, 18 Dec 2024 17:59:17 -0800 Jakub Kicinski wrote:
>> On Wed, 18 Dec 2024 21:55:12 +1100 Michael Ellerman wrote:
>> > This driver can no longer be built since support for IBM Cell Blades was
>> > removed, in particular PPC_IBM_CELL_BLADE.
>> > 
>> > Remove the driver and the documentation.
>> > Remove the MAINTAINERS entry, and add Ishizaki and Geoff to CREDITS.  
>> 
>> Yay! Please let us know if you'd like us to take these, otherwise I'll
>> assume you'll take them via powerpc.
>
> I meant to say:
>
> Acked-by: Jakub Kicinski <kuba@kernel.org>

Thanks. Yeah I think it makes most sense for them to go via the powerpc
tree with the rest of the series.

cheers

