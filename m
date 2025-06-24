Return-Path: <linuxppc-dev+bounces-9668-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A810AE5A34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jun 2025 04:45:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bR8Sp0CrWz2xHY;
	Tue, 24 Jun 2025 12:45:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750733129;
	cv=none; b=WEYDRNutj+Ea0Q6VI1R5DLZOGXY/4UjJUYntNlLD/V8/WDxShTsVBgWEp6GrZRvTv/avvE2HXxJ0J7VeUWNWoHY1XGnRYrhqqS2BuDYzzoPPCgSjEKDRImKss+BF9zMiH61LGmrfNSFzuTC6FgxtYdrCuQQbmpQ+sMc+IzaE2jWJ1ZOQOOVSNhui50dcnUEGe7P0BQFkD3TKtpTcJzkmEfOV/usK2JO/TJKXll8QpEfmAWDj2HGYnmNOvbrgHli5KlsaPXPHDAgpc1BCku40uNKBu/FOUa9VWLnnBAa3Bu7v2vuP0aWECf+BpEQtl8kyEKPk4FQp8jPN8jjWZW8n1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750733129; c=relaxed/relaxed;
	bh=gwAjevotn2+cLNInpCgkKPBdJ1HaetZ55em2s+ME0vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVyBNg2nesSpjeuwE8oJ6+Lkr5eLfL4wRAPVn6vHw5O1NELE826YUK+e51Q+TgvQDvrOyrMfoeAEw/qubQYrD58lCmCSwh8erMcJVr+fBX3shBltadk93mD168ixdulshX8e5lW4cP+MnTMZUJuIWuq4JuEIwb9dv6tj57VBriUDTKtiL3WC54U7HetdMp6GxmrSBankEX29IeIoObAO0t7W4W2WDQr8RkO8BE5Bb+VDJvyF6/R55Iltt3maY1McWqjaoSCpgnG6uutHbO9q4Krmv6Mza3uJv5Xp7aT2fyIkfM+40U1r5BHVaTicON9FGFsZpGqpoLGkfKbBKFvbfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oIipPcPU; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oIipPcPU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bR8Sm6gbXz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 12:45:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47CEF44AFC;
	Tue, 24 Jun 2025 02:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A0AC4CEEA;
	Tue, 24 Jun 2025 02:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750733126;
	bh=wvw4KZrFb3bDpFyljDt13+2hzP7dlyNidFKreU0+rGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIipPcPUENDbB1DVaM2klpFxZLymtMC1278ktKPXQMNZt41mnhj+ZJexStFH5JK2u
	 nFXCl0kaNRAtFSccN6WfWV998QOsGwbB+qf9yeRG2pfUiPe5aPfG7a5fiaJzXH3RE/
	 FIJSmpv+ncH9OqsDWsdaTgdlboVcC2ABX1ghnprIEbIl3QAUqvV2QqsDjZ1079FYkn
	 jPt0nzSxpOunutckTus8H/G0ofSpk6ztujnJoy+KSEri/GKc+oFI2MLNBYknXyAgdT
	 3HUYlPxE9SjpaR0UWveXbgSzRwttALUuqVwFQiG2HmGYrj+2QgHF3a3xvoxS0gN2+S
	 O5Eof0eJUCorA==
Date: Mon, 23 Jun 2025 19:44:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jason@zx2c4.com, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 5/9] lib/crypto: riscv: move arch/riscv/lib/crypto/
 into lib/crypto/
Message-ID: <20250624024451.GA7127@sol>
References: <20250619191908.134235-6-ebiggers@kernel.org>
 <mhng-8FC37478-859D-40EA-A0E9-3EA86429DC53@palmerdabbelt-mac>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-8FC37478-859D-40EA-A0E9-3EA86429DC53@palmerdabbelt-mac>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 23, 2025 at 04:23:52PM -0700, Palmer Dabbelt wrote:
> On Thu, 19 Jun 2025 12:19:04 PDT (-0700), ebiggers@kernel.org wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Move the contents of arch/riscv/lib/crypto/ into lib/crypto/riscv/.
> > 
> > The new code organization makes a lot more sense for how this code
> > actually works and is developed.  In particular, it makes it possible to
> > build each algorithm as a single module, with better inlining and dead
> > code elimination.  For a more detailed explanation, see the patchset
> > which did this for the CRC library code:
> > https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> > Also see the patchset which did this for SHA-512:
> > https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
> > 
> > This is just a preparatory commit, which does the move to get the files
> > into their new location but keeps them building the same way as before.
> > Later commits will make the actual improvements to the way the
> > arch-optimized code is integrated for each algorithm.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  arch/riscv/lib/Makefile                                         | 1 -
> >  lib/crypto/Kconfig                                              | 2 +-
> >  lib/crypto/Makefile                                             | 1 +
> >  {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig             | 0
> >  {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile            | 0
> >  .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c | 0
> >  .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S | 0
> >  .../crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S        | 0
> >  {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c            | 0
> >  9 files changed, 2 insertions(+), 2 deletions(-)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c (100%)
> 
> I'm assuming you want to keep these all together.
> 
> Acked-by: Palmer Dabbelt <palmer@dabbelt.com>
> 

Yes, I'm taking this series through libcrypto-next.  Thanks!

- Eric

