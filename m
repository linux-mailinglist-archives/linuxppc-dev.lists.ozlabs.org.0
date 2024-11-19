Return-Path: <linuxppc-dev+bounces-3439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA3F9D2D0F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 18:53:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtBtf6Bg9z2xyG;
	Wed, 20 Nov 2024 04:53:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732038810;
	cv=none; b=eeIQg7C/B74JL+WG+XNySR80AscL7D2siA+k446PAeNfQg8zeGyvDvgroJKMXYQ23LT0BultN1rX/S58ecjEJtro+doAn138a1sydYmuyWcCA1toPNqi7Zo+f03PRZjpv3CsP0BIiINlWknqS3p78AyqRYFQefUlf/kBYtRXi3zhz709JRzv0kOwlKMa2Ljbo6OT+fIfY3JPnBRpDBzcdA/Upcl/6beSGEmFkNOZGA/Q2SObvJ8G87va0vtq0xbEAkNA2wau7YdURfvsnh8IdNh1N+1CFjhK+rC3WxqhLwpVglDjf/4gqA5kvtujDOxNFvfSG7N4LzYgFhYK9UI35A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732038810; c=relaxed/relaxed;
	bh=sr9L5/9uMLYoOCbtjpfQCh02kNZLNfjp7kspe4awzRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyiVv0NnnxacRoh5rvdp2M9ABFdDAx+nGq6ZNuultzzXgFdhohg4tuggSD4korGLfbZ1gQF8th8eKoDv0bj0XBOHsb7KPDd6Ynb+nF6KbpioR6MvmnJmN//EN42mDm/iQrlay40c/833u9gKOmVr/k6XjY/l92kr0hVL8RDW4e8geYWLLUPkZYfuwwirLZDV1cV6cH0zGwLEFFgTp0JVWfIvu1ep6om8KsmlkOnnObKqioggT/20E1cqEsHYA4b64iKTdWvJ8eNR+waCVRbV2HyIqYS09lqaoBkDAHaSc/4y9hzRCse11mOKfn74t2Vryv3X6pjNhMf3X9wsNhyV5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dgq5vDPY; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dgq5vDPY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtBtd7029z2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2024 04:53:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B0C5E5C57C9;
	Tue, 19 Nov 2024 17:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A786C4CECF;
	Tue, 19 Nov 2024 17:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732038807;
	bh=xHBKbFoZ07Ku7Y6Que2kbEg3CxhDB6sSiE/pmczIBCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgq5vDPYfQEAp9QcRlppUahsKWsHleIu2nooD2vWUTECini7qwskFf71OtQlAgHob
	 VgwbxcfTrGcj6SaEE0IA3KEVSJVN8o4buBI87cUyTlsrNa829jFX3FU+5LZ4z9dhQq
	 q6cDXdYeeLPq+875LdXusF+1Tdk/dUSpHerioqelqy+4g0QhpIBJX399a7cdJLXkZD
	 6pgVXWvXdZzIwmUu3NbsF9WYzW1YemgHn9pcK3UbbCT0WEWvTXNFg7dC+guUY8i+xq
	 PXnxAuCla2s+P3m8m0/Vmg800NCXq6a16c5ZNJy6umQgOI/GxDr2MKprgwfgns6Q7i
	 /E/BHKcA5Fe2A==
Date: Tue, 19 Nov 2024 17:53:25 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 00/11] Wire up CRC-T10DIF library functions to
 arch-optimized code
Message-ID: <20241119175325.GB3833976@google.com>
References: <20241117002244.105200-1-ebiggers@kernel.org>
 <860a6acc-2c39-4eb1-8113-a3753f6531fc@gmail.com>
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
In-Reply-To: <860a6acc-2c39-4eb1-8113-a3753f6531fc@gmail.com>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Zhihang,

On Tue, Nov 19, 2024 at 06:05:58PM +0800, Zhihang Shao wrote:
> 
> I still want to submit an optimization patchabout CRC-T10DIFfor RISC-V.
> 
> I don't know if it would be more appropriate for me to rewrite a patch after
> your patch is officially applied.
> 
> What do you think?

Please go ahead and rebase your patch on top of this patchset, i.e. on top of
the git branch I gave at the beginning of the cover letter.  You'll need to move
your code into arch/riscv/lib/ and drop the shash stuff.  You can test it using
the new KUnit test I added (CONFIG_CRC_KUNIT_TEST=y).

After that I'll be glad to apply your patch when I apply this patchset for 6.14.

Thanks!

- Eric

