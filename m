Return-Path: <linuxppc-dev+bounces-11884-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E48FB49606
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 18:48:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLCZL6qWfz30DX;
	Tue,  9 Sep 2025 02:48:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757350106;
	cv=none; b=dHmOgMsbfGjGiapu1nsy1f1w68V+eRwGesv6q5e72d8Yyp1GPERNzJZ7YGLWir4k5Rw/irUBl46O2LOy914hiZ4NBg/OInDpgPvC3CPwT9wyLwxYDgQJk8PdwJCqwCipTOCjtYQdLRz3YFhnH1MoP3FEu4RAt5QI4UahhXa9S70oGy9jWRwpML+mHryhCry60V1HzmlUEwBze6gVeI2M0ZnyxKaZlcVgI3K++vocWl3OiaIgpChvwsTuRAWeaD11RAv8WDBfyGgvst1HAdhmgNc5QPNGMzOIdrRYN/Me61wt/6bPeeE3fCugPE7MOldPvQWdAlZen1qtVvEsFB7RrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757350106; c=relaxed/relaxed;
	bh=bEDyurSVkEEgaG+aWPBLXsNNKgorcG4Yu6vrLBcD5x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6vUtr8Nz2iwlYeVaqkFcDjhqUSAqDErVTl2Rp5f5y8isKckJby40tYAlH8rDZJY4a3QxzGnnvsHF7F/w7GUXnGjbOQZKtVQ7iglW1/B5h2bqnuaFYPgZVIFqwhZfDV6YX+LWn0K+6dlrl74eyK/yNvD5gEqfBQEwPWvry3Kzas/kc0tCOi/xHF2J1Dl0FLDRkr+ZU0NNnd6A6r2Lr06XtohFl+qzOQIINy0bEVIZ6BSKoWnTPiW0QDvwEIl9fbkwidnYnvFGNGwIN5AJbuFJwhZ+ohxU+hwVw0IxQBZcFgXxpon+orAH+cjhW/6CeoJNpt4WIdwmqsgfl8ZTDSCfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OvVeuPPl; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OvVeuPPl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLCZL1YDVz2yMw
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 02:48:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3B80601D4;
	Mon,  8 Sep 2025 16:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E08FC4CEF5;
	Mon,  8 Sep 2025 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757350103;
	bh=s02kopzJSlYiqLDMIOwawddi1A/EA0OWXDvYYK5KGXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvVeuPPlqrgkwm4Pwfx2gBHC5PxzGc63nQRmK+0toXwiytOzIAQ4MkK7bBNEulbzg
	 rLqfUwrk0xPM7YLnH+wBIxkurrkEZ4StvdPFDqeq1QNfzBHusy1WuUoZTo6II6CF4W
	 J8gDrH5Bildq1JqbhzEXWsFG7q17Mw/EFt1OeF/GGDRMGX62WH2k+eIGhn8uJ4ZLvd
	 bHlQByov+zZ5mLeHJqNB1EPHKspjAGQoHkzuI75fDGydkYku3i2Brjccrn32M+H4fx
	 QD6C6N+YzGYrlZqVMOpZxhPdT/uBjp7zcvQxMY89q3ADIUfUjO2Qj5MLSCyj2QQJ5e
	 K+99E/YRZhmAA==
Date: Mon, 8 Sep 2025 09:47:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 12/12] wireguard: kconfig: Simplify crypto kconfig
 selections
Message-ID: <20250908164706.GA1331@sol>
References: <20250906213523.84915-1-ebiggers@kernel.org>
 <20250906213523.84915-13-ebiggers@kernel.org>
 <CAHmME9qyfbn539Um9xoFJu2Mm9mM0zuOxyLgeOjF-R5nktbz4w@mail.gmail.com>
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
In-Reply-To: <CAHmME9qyfbn539Um9xoFJu2Mm9mM0zuOxyLgeOjF-R5nktbz4w@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 08, 2025 at 06:35:04PM +0200, Jason A. Donenfeld wrote:
> Hi Eric,
> 
> Just a small nit -- would you commit this with the subject line all
> lower case, like the other wireguard commits?

Done.

> By the way, I have been reading every single one of your patches. It
> didn't seem like it'd be useful for me to respond endlessly with
> Acked-by/Reviewed-by, so I haven't. But I have quite actively been
> looking through these series. Thanks for doing these cleanups and
> reorganizations. This patch here especially is quite the relief...

Thanks!  I think Acks/Reviews would still be helpful, as it shows that
someone else really read the patches.  Maybe you'd at least like to send
those for the cleanups for the algorithms used by WireGuard?

- Eric

