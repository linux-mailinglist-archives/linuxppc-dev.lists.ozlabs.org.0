Return-Path: <linuxppc-dev+bounces-2987-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB2E9C0AA2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 16:59:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkmwl30gmz3bmS;
	Fri,  8 Nov 2024 02:59:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730995175;
	cv=none; b=UvyAMvFuUuBuGN+Rz4DXl0j4t05/tjUtkq5yKx2tLyImQu4S5dTXon9qYXWFnRCd+MH5FfzeWVZr6pmw8O0nbmXCLDqbgZ5SRWNa+VV6PJAZeIJPOs5MuYAPQCil6EUTEWm7EMdywbD3Iw8JAOHykQzztoQjfPISaNOY6hqeF+BIpTunvYXgjveBhoAjLFnagmB62RgaFHFvA4lvlfkoU8jMh6ITdxvFg5Csl0fRyndu9Hb+88W6J5N19gpEI8wzk50+jQ13NOtSF8Jt2PJtMWNC5hLg3FHuiBXrofDbonrTPgCa0tw+Gsx9XRgZv0C9QhH4daztYE6QFCZdNVeuqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730995175; c=relaxed/relaxed;
	bh=DWa59i0YnfIsSkNMO4yMQvDB34SD7gZLLM6c999aC8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGoVJh3YVdfRaf0Ybfem+dDBC0b3yDNSRVNU2F6bvSE/hb8DXYT1TNJEWMyZr6U5cakCUP5yokMRPMjzohF4FX0K7DL/rZs6+RKJW5Y85NXUfLLea/v4cDtriOGNqFGRhd3sjWNw4cPNGmJ/7XYyjqP0tx7FqqXNJiTqBQS2vge1G66RPTbyRYmJtbiISCKs2g9SemUipr2hYMte676SR81BGXiY8fYCI4MtxxwLrsfI1C3+ralG30ez8EGFwRN7j8UKSJOVhnb187SOOXRephYzZeBHs6Zkk0iBPoQcNo9HjBEsm9F8/2ZPWkDVlqv47nDHukRKQWh9qug6hrrecA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rgBBwYSn; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rgBBwYSn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkmwj5QGnz3bmC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 02:59:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31C3E5C5479;
	Thu,  7 Nov 2024 15:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60631C4CECC;
	Thu,  7 Nov 2024 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730995165;
	bh=EY9bRUE7pktK1ylVK13Q0axY1miNx65wET8k5SsvSYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgBBwYSng15I1Sj9CukemsB8r92eeFNBu9UjOzjVelqyl+on+q7BOE9BfGXxrCg3C
	 cFuhr/Dg0Bc8ndaWjoD7aPFzlYKLHrY9aIseyUra+dYylkrfgUrfPFCuOU5BMa6A7F
	 Aqe3rIOTDqgXniwsdQXWPTdEv3aCMPFc5DUVJIhA2mCGEf3cnLkpM3sTg0iTnGEMEP
	 ZW6/cH0bEH0V/fxft/hZ3X9DnnN1TOLaoud22Od5ccjuUjr67GoCNA0ZtI3EPumnre
	 YMJtE52eqaqSvTur9DqroifGPDIsJuRuT9apQEdSA41ms/lzfu+OgDQfUpIL9EmeJM
	 JZ3MEVrEMofMA==
Date: Thu, 7 Nov 2024 09:59:23 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abhinav Saxena <xandfury@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/2] Documentation: dt-bindings: Remove trailing
 whitespace
Message-ID: <20241107155923.GA2770783-robh@kernel.org>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-3-xandfury@gmail.com>
 <gjxevyovxhymwm2ps37hfq3vmpmmr4pqmohq67llxrb2plb5zz@pvsmkqmhemx7>
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
In-Reply-To: <gjxevyovxhymwm2ps37hfq3vmpmmr4pqmohq67llxrb2plb5zz@pvsmkqmhemx7>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 12:07:46PM +0100, Krzysztof Kozlowski wrote:
> On Wed, Nov 06, 2024 at 11:11:24PM -0700, Abhinav Saxena wrote:
> > Remove trailing whitespace from devicetree binding documentation files:
> > - regulator/regulator-max77620.txt
> > - interrupt-controller/nvidia,tegra20-ictlr.txt
> > - interrupt-controller/msi.txt
> > 
> > No functional changes. Issues detected using checkpatch.pl script.
> 
> Instead I would prefer these files to be converted to DT schema which
> would result in their full removal.

Yes. I don't take fixes for .txt bindings.

Rob

