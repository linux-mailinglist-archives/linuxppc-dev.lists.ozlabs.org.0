Return-Path: <linuxppc-dev+bounces-12223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4720B57D5C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 15:34:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQQxd2xY3z3dWG;
	Mon, 15 Sep 2025 23:34:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757943285;
	cv=none; b=n7ZS2dLVlgFXeXko/hqwVzqBu04H448XLCBcBrQHzv2FLVkaTkkeNqIZOflGImMhy41qn4wgHMbK/HsPmgpHnXq8W4XFmkTjOr47XPhEiRcH2fvP/HXkEyi2s5Y3jIiMaj6vXmkGKIztYGXUGeYv+dGMvdoeZPoJ9aP5QAzo0ZObnJApHr6YZmvFosp+r51YLicMAE7T6K6ODddfAKRysr4pkx/YNFn9i4EqbmY8C+e5GE0rlEPROuqsIGL0pztKdnGaHwVl+Tb1taZdblqy+YI0hYi2bQXuMh4dIN7OhG54EHKAYh+xOYU0q/lZYO2mAi+bWNdko6r2OO422aL5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757943285; c=relaxed/relaxed;
	bh=G1pxbFOuDJsJnBF0m+5CY6Xwwfubv5cFdvznrZJvWPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2O5mPcr8RyDT7IoVxTHmO594qriOQSqaNukSOgkdYDQOAi+9GUZI39LMHAEFSEq7HQdrDxN3Lmj8JT9IZ7R/BS34HndLDIR79DnAmlPGv7SK9IkB/hC+Q7HyXS8O+9xEbl+5OYmjwwyD8zfihqWY4RqV0mQr0AZj3MJ2kCm0/IyrVbaAtqlJPwy++/m3KURr6ebWUNpEM99CALX5kNl9AjX9Czbx/d9vW7AfkV5l5YtsyG/ri4iaHesDHbi3MFgKQ65ZSKWJ/0h0GNgl9YyzIb0kIPSG5nafcCv1rbueZsZdA517Usy+dhty3qarK8dsdgWnEOl4RWZ3DXMJA6+ZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BJGZ1vBQ; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BJGZ1vBQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQQxb6qFpz3dVv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 23:34:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9585860237;
	Mon, 15 Sep 2025 13:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06662C4CEF5;
	Mon, 15 Sep 2025 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757943280;
	bh=G1pxbFOuDJsJnBF0m+5CY6Xwwfubv5cFdvznrZJvWPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJGZ1vBQTvO1OLFpsKgtQvIkjtAVvJey56ZqhZxYzVB3EDoeucwA9j3Ikra0r96a5
	 jQw9/XHjAdC85R6jORBqXH6OkpLRRmI0UaRxSBMlJTyGu8sObrPf6EYsRHYnpzWABK
	 4guOhpliPb5aYSSJ1cikDCiA9fl38O9CJLfhWdf/1FUDPbaUHhsgjd/BUigP/DwSAR
	 ZgzXa5kZ1LN2Vwu2d8y8wxYWU6XMdt47ld5N4t1CFweo+0HtUX4GHSNgmsq7QjI/jF
	 wghZzlNvaq7LpEjMzkOqler37Pf0I1gD2UiJKUJFEipxphTk6d9TTXloxjbYPhi7oP
	 Dxi908vsrFrMg==
Date: Mon, 15 Sep 2025 15:34:26 +0200
From: Christian Brauner <brauner@kernel.org>
To: Askar Safin <safinaskar@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	x86@kernel.org, Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, 
	initramfs@vger.kernel.org, linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>, 
	linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, devicetree@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Message-ID: <20250915-modebranche-marken-fc832a25e05d@brauner>
References: <20250913003842.41944-1-safinaskar@gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Sep 13, 2025 at 12:37:39AM +0000, Askar Safin wrote:
> Intro
> ====
> This patchset removes classic initrd (initial RAM disk) support,
> which was deprecated in 2020.

This is a good idea but the patchset does a bit too much and it's pretty
convoluted and mixes cleanups with the removal of initrd support and so
it's not that great to review let alone merge especially considering
that a revert might be needed.

Split it up into multiple patch series. Send a first series that
focusses only on removing the generic infrastructure keeping it as
contained as possible. Only do non-generic cleanups that are absolutely
essential for the removal. Then the cleanups can go in separate series
later.

As usual I'm happy to try to shed old code but I wouldn't be too
optimistic that we'll get away with this and if so it needs to be
surgical.

