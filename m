Return-Path: <linuxppc-dev+bounces-2204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CB99C729
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 12:29:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRtkY19LYz3bgd;
	Mon, 14 Oct 2024 21:29:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728901749;
	cv=none; b=NkO2hwDaEYM/gaOJDjdpLcQumEHe7wqifdvyQbGTXvwyDeTLU9geDnqVft/x23WWKh3QaPRp82H5Dow7vGurpZb54UzAN7viar8cxs1Pe26Cv4PUlVn/tSf1KQl0mpH2T/WpHbiOxNXAX1WCdxkXoupMtB1whlWudBq+/oTg/mskkmQ40p/8eNxfNq5/aOY3wrVVCKi8BEazhnUuaxVq/qGId7KvhdbcR6xBA5TgLCGne2tqyAWQ8uYdz181shAQCGOzyfu+4rV5b/bvFmlwdBGCzjQxid/X8FYSY2CaD8N6p/zqMgekoOmlRXvUvm8gamH8s7uX2NYZTEol4ooNww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728901749; c=relaxed/relaxed;
	bh=Y345l0RrYu3JPihAF01AIOvjFsHH9rbfLkTByPcu57U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVu8dt8ofI/kEeIbyTXyG7RcBzmSZcy4prNDsZoe1SDR3vGhLJ/Z8OtML/AlG0RTF4Ze7sjHud6fpknKkHHmcRD5Or8oZI8W6brdh9hITalSUuFnwCfQtPDMgSHc6eahj92cMK45XG/o813aEHIi8CK4KZ+v/GRaymGaWq7LuVkFJM0/cB+KKm1Q6UrxPAvu/xtsHsjW4tsvEPglRp1B5Z6fjCm3PegEp9qMHKiT2259vTyX8EC75WwCEHj9RttvZF/9MuSPr1Fbq82174alLp9ouMuU16w/XPVvsP4kR7MKK1dcjjcHzXaL0G4AYNdGUqm8EJgO58MFiBjVSRkOCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ikZEIJ/q; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ikZEIJ/q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRtkX1JFmz2y64
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 21:29:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C6AE5C4CA6;
	Mon, 14 Oct 2024 10:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30349C4CEC6;
	Mon, 14 Oct 2024 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728901744;
	bh=sV4Rp0TPVdzNhXz3lQhbAY5z63glc6lEzRRa41dAlHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikZEIJ/q02U0sgjPnYZhDgFSO09fOvHPApoO/qznd/NsKTgq3fuYKg+kXdQTGNoEZ
	 ZdFP15gv+6ZSyxLOY2vpWe0MBh7ZPpkBcKv3Tb8GreZmO9kMzaoI9uwelL2IjjNl1K
	 jD+ZzMqTMRAlNrfljDijm7JGdgsjeAji5YeZ9YYpK5UaHToAZIvGR693yNbzd9d0Xr
	 QPawXFjCLH4+C1hfbNJuxRoa1chGFiuBxqD4qAa77jUYwF+rR5fGD54Qx8MvXtm6j5
	 uHpxIbm+YJW4fX2DBOBHsPjR/Q7mpg942cp4wID2LsxrsUMfgq1PY70kbK8DN5Fjbn
	 Hdfns0E4XIb0A==
Date: Mon, 14 Oct 2024 11:29:00 +0100
From: Simon Horman <horms@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: Build regressions/improvements in v6.12-rc3
Message-ID: <20241014102900.GS77519@kernel.org>
References: <CAHk-=wg061j_0+a0wen8E-wxSzKx_TGCkKw-r1tvsp5fLeT0pA@mail.gmail.com>
 <20241014072731.3807160-1-geert@linux-m68k.org>
 <711d7f6d-b785-7560-f4dc-c6aad2cce99@linux-m68k.org>
 <20241014085819.GO77519@kernel.org>
 <CAMuHMdWedOgc4S12FwQR8_80aqgRJ2pwrKWsNb5Svt6776ti3Q@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWedOgc4S12FwQR8_80aqgRJ2pwrKWsNb5Svt6776ti3Q@mail.gmail.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 14, 2024 at 11:18:14AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Oct 14, 2024 at 10:58 AM Simon Horman <horms@kernel.org> wrote:
> > On Mon, Oct 14, 2024 at 10:38:20AM +0200, Geert Uytterhoeven wrote:
> > >   + /kisskb/src/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c: error: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t {aka long long unsigned int}' [-Werror=format=]:  => 126:37
> > >   + /kisskb/src/drivers/net/ethernet/freescale/fs_enet/mii-bitbang.c: error: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Werror=format=]:  => 126:46
> >
> > I wonder what the correct string format is in these cases?
> > I didn't have a good idea the last time I looked.
> 
> "%pa" + taking the address of the resource_size_t object.
> 
> https://elixir.bootlin.com/linux/v6.11.3/source/Documentation/core-api/printk-formats.rst#L229

Thanks,

These format problems seem to have been introduced quite some time ago
by commit 9d9326d3bc0e ("phy: Change mii_bus id field to a string").
I'll send some patches to address the ones introduced by that patch
that I was able to still find in-tree.

