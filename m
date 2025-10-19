Return-Path: <linuxppc-dev+bounces-13049-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A17E1BEE9C9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Oct 2025 18:25:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqP6q2GKFz2yFT;
	Mon, 20 Oct 2025 03:25:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760891123;
	cv=none; b=M0a/9DaU1cp8l2tAvcIzuvB4hbU+9PHskZDj9TAswq+fT/pt/+UfPmo5S1MFpwQzC4wUURYo0gaoSfegb1eK2h7YO6Sj77xBHaF7P4YSwrBatnZWkAVMMuV9HQsnOpT4uxoZ+7u0cgoCoDZUs8cGJDgOSvsej9z5Ixb1BW6MRJVMG/WziZTXYr5hVBayUdRbEZ+1liX4pd5r+0IGL1FB4suM+4I9os3U8Ak1iaPWEahRiAJpjat9SFFECJ4CovjabdgKfRlrUDdkiMpgWx6I4Ps7kby42Ims/Qnb45eKc2YL70d7Vk324orleRvTaMxdPPp2It/5JqcMuU1Q8qGhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760891123; c=relaxed/relaxed;
	bh=Karn116GYjTx2H81CntcrkAvTygSq7TejQKGOkTyXIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGANejV20bPtORtmif0IdSbFIpUbcyOo/4jc6ApOj4sdzMyc07jsrC1+WdyMqm4alj6sw643dM6Aeo6tMC5oVeskkkSZvqtYJnGkC8tMfJpWWK21uyvF+5AQs2X4E2VHIrdLsc7KKt8g0ZwCtKAD1BlcOB9HBbn496LijOffrQgPr+WIwtcvskkGZSF3yIZTUSOy3RoWw/nU9HMVGPFyVGVsT5ZyfRCftqvBkDHWwLQ/Bfqh2qlRLTkpKoTonMv7AE7jb122Vi0VKRrhnL15HBiJCHA5Gxqb3tUI4DhDf/6gc6lrzj5Q1Kh/SJv3xVRBwttDh9deJP4hpCyjD19aZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F2EokHRL; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F2EokHRL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqP6p0JyXz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Oct 2025 03:25:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C9C944476;
	Sun, 19 Oct 2025 16:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7610C4CEE7;
	Sun, 19 Oct 2025 16:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760891119;
	bh=AqeDRU1eKSmQXUiCZ7pwi0Bd8BGGXBM48O4Ou5Xs+sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2EokHRLd68kZBeDRRdhxJ1rDW2elFlh8EnkyaTJnHSCfqkoujh7BohpZc68H407D
	 6bUXmBrNoq7Ww0jTMF1QQwGeMEpfXz0BrGd0k+T8PJbgWDRrKfDcnhwumf2RRZV3Tp
	 M1nqa0cZRI89OYqyvuvRWeFwctcqJgDf9nK43gHk2G3mRl3usq7ey6ziFEp5oxVwef
	 8ha/lyEniLuE2fegL9ApZJO+lst38G6OUrwAE6O/NFZ/Mz1YaBFZd+ociss1pkQv9d
	 0MzWPAoBwoLUZ5+ACw5ohULeXVrjB6+3sdA7UiNPKC79wDn4zGf7+6LA7UKkZ5vUk5
	 GbYsQCDUj5ADg==
Date: Sun, 19 Oct 2025 09:23:46 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Askar Safin <safinaskar@gmail.com>
Cc: ardb@kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
Message-ID: <20251019162346.GB1604@sol>
References: <20241202010844.144356-16-ebiggers@kernel.org>
 <20251019060845.553414-1-safinaskar@gmail.com>
 <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPnZJGAb7AM4p=HdsDhYcANCzD8=gpGjuP4wYfr2utLp3WMSNQ@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Oct 19, 2025 at 11:10:25AM +0300, Askar Safin wrote:
> On Sun, Oct 19, 2025 at 9:09 AM Askar Safin <safinaskar@gmail.com> wrote:
> >
> > Eric Biggers <ebiggers@kernel.org>:
> > > Now that the lower level __crc32c_le() library function is optimized for
> >
> > This patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to lib"))
> > solves actual bug I found in practice. So, please, backport it
> > to stable kernels.
> 
> Oops. I just noticed that this patch removes module "libcrc32c".
> And this breaks build for Debian kernel v6.12.48.
> Previously I tested minimal build using "make localmodconfig".
> Now I tried full build of Debian kernel using "dpkg-buildpackage".
> And it failed, because some of Debian files reference "libcrc32c",
> which is not available.
> 
> So, please, don't backport this patch to stable kernels.
> I'm sorry.

Right, this commit simplified the CRC library design by removing the
libcrc32c module.  initramfs build scripts that hard-coded the addition
of libcrc32c.ko into the ramdisk (which I don't think was ever necessary
in the first place, though it did used to be useful to hard-code some of
the *other* CRC modules like crc32c-intel) had to be updated to remove
it.  It looks like Debian did indeed do that, and they updated it in
https://salsa.debian.org/kernel-team/linux/-/commit/6c242c647f84bfdbdc22a6a758fa59da4e941a10#1251f9400a85485d275e1709758350aa098709a8

As for your original problem, I'd glad to see that the simplified design
is preventing problems.  There's an issue with backporting this commit
alone, though.  This was patch 15 of a 19-patch series for a good
reason: the CRC-32C implementation in lib/ wasn't architecture-optimized
until after patches 1-14 of this series.  Backporting this commit alone
would make crc32c() no longer utilize architecture-optimized code.

Now, it already didn't do so reliably (and this patch series fixed
that).  However, backporting this commit alone would make it never do
so.  So it would regress performance in some cases.

Since the errors you're actually getting are:

    [   19.619731] Invalid ELF header magic: != ELF
    modprobe: can't load module libcrc32c (kernel/lib/libcrc32c.ko.xz): unknown symbol in module, or unknown parameter

I do have to wonder if this is actually a busybox bug or
misconfiguration, where it's passing a compressed module to the kernel
without decompressing it?  And removing the module just hid the problem.

- Eric

