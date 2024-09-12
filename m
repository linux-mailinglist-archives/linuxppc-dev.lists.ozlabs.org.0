Return-Path: <linuxppc-dev+bounces-1288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B79976887
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 14:02:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4GJk3cqdz2yLg;
	Thu, 12 Sep 2024 22:02:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726142534;
	cv=none; b=bxqusMKIMCmSom6AxjEJtUEQVOZ/C4bUxTndV9VdsfTJYvnxEHVG9qDnvI1E9QJUeMSUPqrSWsf8RJBUZJE33ieLyxd+YiXjvuVg/9Fv4UzSigU1K0Ox//uYr4h+3bQZEz5gw1ADi8TfVQ5dwqFavNKYnZUq0UwLPlfPqKsHjt5QQHV0xk9zsDT3f4U4N6LFt//Yp8D01PD4FEyCjEn9lMxZ6L3QOpUIqaGKkbVRfgCkN3g680wKxYFtky4fQrTrBUA0a6l2vqr+wwq72v9LswGkaN1qrq99ZENfLYK2Ep5KYc3CpIoxk/S0h6Dibf5Ymh+6ijy8nAGSwQ2N/Jn4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726142534; c=relaxed/relaxed;
	bh=BMGO0Q5c6i08GrxSwq0x1WRfiK8gP9JXFevm1J/Ncdk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WTDBRh+JQK+IWToq29Sv91nretr/crzzoKjnT/pDxzWyxOSzoySndb+Xr6Is/PtMkjP8wQdK/hf4yvOFS6LICM2tKwLWl4xFNkcMoH9WPdwkE4w/s3Fe5CkrmtufFwCJqZZl4HVTQVhjEXIx4mFIblrzgBC4gJ/h8FyyR6sryjC9WVcKo3Xp+3HiyDX8P1aZK1JEQR1SHmNVb6VSogE3KqmRoYi2/ar4Ia5v15tXbRh7dmlLK1ta/q1bOyiTHJ6Lfed5mhjeUp09ApnrCJcGvoXFvVq9BT9OPdDihNoe8pcgkG3KFahTuQhebUb7CcFFMKTPPo1hBz4ACbYDheGDSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h2tOyOeK; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h2tOyOeK;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4GJj3BN8z2yHL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 22:02:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726142533;
	bh=BMGO0Q5c6i08GrxSwq0x1WRfiK8gP9JXFevm1J/Ncdk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h2tOyOeKw28shchITfPuRD1sFkbC0sy57QsN/hN1iNUDdiH/y6AFd6CjHbMFxiz/z
	 x2Wg2QAGkfkPv7yhK/BlOf/RPo/e0KJ71kJV74vYfHTE1mCMjel3956OPLUGhR2fFm
	 /BGzU+C9uNSF9Ge7ntEePz90Wp/twtcIT26u2jdb91w95r8PRZLXnZewTMWTz22rF0
	 +mh4YDpRnUc1VgicXvcN5Aj5EM9for68ZqztHrUDBhPpYI3rYg0EmRy5uLKd+Tga/m
	 olQ+R0e+VreNcabK1iYG4VzMGBuplYj9KXF/3TsXiSwCVhA3PfdW7NTqkezVo9+2y1
	 8QF0dzxECzD1Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4GJj1GY1z4wb5;
	Thu, 12 Sep 2024 22:02:13 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, shuah@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
In-Reply-To: <20240812094152.418586-1-maddy@linux.ibm.com>
References: <20240812094152.418586-1-maddy@linux.ibm.com>
Subject: Re: [PATCH v2] selftest/powerpc/benchmark: remove requirement libc-dev
Message-Id: <172614240959.1297852.18225617540845109128.b4-ty@ellerman.id.au>
Date: Thu, 12 Sep 2024 22:00:09 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Mon, 12 Aug 2024 15:11:52 +0530, Madhavan Srinivasan wrote:
> Currently exec-target.c file is linked as static and this
> post a requirement to install libc dev package to build.
> Without it, build-break when compiling selftest/powerpc/benchmark.
> 
>   CC       exec_target
> /usr/bin/ld: cannot find -lc: No such file or directory
> collect2: error: ld returned 1 exit status
> 
> [...]

Applied to powerpc/next.

[1/1] selftest/powerpc/benchmark: remove requirement libc-dev
      https://git.kernel.org/powerpc/c/8c9c01ce695eea84d19482e7429e3d54ceb7585c

cheers

