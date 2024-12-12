Return-Path: <linuxppc-dev+bounces-4063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F789EFE6B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 22:37:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8Qmg2qBGz2yLr;
	Fri, 13 Dec 2024 08:37:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734039459;
	cv=none; b=GbxuPQsvmGvyeZ5J6z3JXk2PcZBLjpl6nzvWFNIt4sAPJcGoFUEnu+lH2VPdN68yfgqd0n9MZqB0itVEEta4OVu6uCB0rHXgQuC5B0/sMuIj1lWHYm3fmAqeET+9uIvyVtkQeYHulQqzUfvndgajhC75qYrf1HXZQHfw0rAkSjWoDQAzCV1YAiOHY2ZiHpi4osJBwcWlPzSdF0KdSZCBBAE0xDOylgd86tcfFJp2d4O5hwe+N6WuSmQAJoZWEhOgaND19IPJRy33yMTNoyIVPZbOuJvhBUNGDQxtllfvQc8hqlPLLSSgY4Ynp8R8omP+osA+rr36p0jOQEDkp1m55g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734039459; c=relaxed/relaxed;
	bh=9hKZ9SY7EGr04EhqIPL6Drfty1RVOYgzWDHsZqBj3uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3Qt78S7wGtyqIeUSbNxAtxkKFdi/58iZr87o5V45b2YTmugjHa2UOmsZlo2vsbArrlVCupbfVMQnb2ZSDes+WzDgpZvFdWGeA68c3Bj6oX7tGZQVwQzyLHtRcfT6HdPnlsfYO/u9MnuEyJ98eG0GA95pDtzXlRxjhqT5GB4/ErdABJuQHX2Kx9FF6x9ga4pnTQciHdcIU1FIO3AgZLo3hjs8ZQJq+TTUmo60KP41zfSpyf/GuWwYS8H0wHFEX2dzMq8R6xZyOeWWy5bt/mUxONYC3rOMf/CBqijqB1iOqd0S7Eu52ldZ45jffBhni3ZMDCBqfAHgrWQuCHR91beuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=olHk7jG7; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=olHk7jG7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8Qmf3xctz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 08:37:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4670AA42AAE;
	Thu, 12 Dec 2024 21:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE1CC4CECE;
	Thu, 12 Dec 2024 21:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734039456;
	bh=hF4mJhnVVXZXfZmgDwcher6bwGaSHVExWyvvXFEjp2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olHk7jG7/rj4jRsPenllCQhTf5QGq/o+IXUWAK82q6pCJzN6i0SdtI7XXvHvfiYLW
	 o7Yb2dtL1CH8VNEjEG8A5mpzTFx8yH0hEIFW7L1nUsgKKc9ugXfj5gaT9OXUqTDi58
	 6N9jkLSNkjhUTqlAcmvg1HLxdVRSD5WcssiicIJ2Nxmvr9M6pJD1wQCUfPhz2WNC+t
	 2xdjNIS1+MX5kC7hdRX17/1bm7hIdvOxPxxX9hHKaS50L38XE0/FImLbSAiegVPTIq
	 VSrgB1QqyjlJeR5aTe0UIkwwE/K4CIPz765ubY7ooteF3fveq0wORNZ7ubo5V6o5Xr
	 rY71XaqihMshQ==
Date: Thu, 12 Dec 2024 13:37:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4 00/19] Wire up CRC32 library functions to
 arch-optimized code
Message-ID: <20241212213734.GB39696@sol.localdomain>
References: <20241202010844.144356-1-ebiggers@kernel.org>
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
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Dec 01, 2024 at 05:08:25PM -0800, Eric Biggers wrote:
> This patchset applies to v6.13-rc1 and is also available in git via:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v4
> 
> CRC32 is a family of common non-cryptographic integrity check algorithms
> that are fairly fast with a portable C implementation and become far
> faster still with the CRC32 or carryless multiplication instructions
> that most CPUs have.  9 architectures already have optimized code for at
> least some CRC32 variants; however, except for arm64 this optimized code
> was only accessible through the crypto API, not the library functions.
> 
> This patchset fixes that so that the CRC32 library functions use the
> optimized code.  This allows users to just use the library instead of
> the crypto API.  This is much simpler and also improves performance due
> to eliminating the crypto API overhead including an indirect call.  Some
> examples of updating users are included at the end of the patchset.

FYI, this patchset is now in linux-next via the crc-next branch in my repo.
Additional reviews and acks would always be appreciated, of course.

- Eric

