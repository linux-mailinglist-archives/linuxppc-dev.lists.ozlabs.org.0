Return-Path: <linuxppc-dev+bounces-14603-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4672CA4885
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 17:36:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMgB92sgGz2xHG;
	Fri, 05 Dec 2025 03:36:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764866177;
	cv=none; b=kp+U8Ba3USxcmlCgJOVp2lwqZ3VTcmUpsaZVdVWp1s+NKZYjB9XrOfKFnAy+rfbS66p47pWWBhJ0f2V0bQQ4HU7Eg1eCorQwzmV4bwYLjJV/JlLn1EVRDxzrWURfZQYHBpChkRoBMRbshXBnOQZFiCQYpHvIcJ4aDXucT49AgJ6O9VkMyX3zES2JUbf0KZ8sHzP36fuHyAAvCWJQlyKt4GU5HC7EMpDxQXLVtVsySAr9SdQhaqKMiqz0ajkvX9HYDZEpjnZFinZiam1jMXuZF1/8jVnQ8HSC7z0N6DmC2qgrF3vp3kVh6+oXg4MwlBBZB7PDprn0xPZC5+pTUVyS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764866177; c=relaxed/relaxed;
	bh=wEnaJ2bwcpq5GfBa2tIEIZ5eZ6XHpU8jdKAfkTMbcjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=De/7Gdxuym1lM6vmGfjmTarEDvDG4RPw2KJ1/Ak8sGbjvx5nmQO/Ajj0N8LNkr0oAvd12n04J2+rmjG8AieL9vtE8jCdXgh51LtlxiRiEyemOPst+N2VgfIgiCzyZpX7ZuzQo6D3SLY3rECwBo5l0vrt7ypqEkTrWirsoJ5t9Iv7WL7KnoSXtcjwJoK8SgZ70b2dbkreXnou/66KqgeCB0pr/dy8vw/uMlE0ZeN0bLMbpdwrSNmM9Bjf1bEjU5Mo8xJ/j96ZkKlguBGwz1F4G/nSApumU1EBkCEYTt/oCC5lAzUxcjoe8KtdqE8AeWJ82cqI9wUYlMftZHjI9a5spg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=OVvsT/qR; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=OVvsT/qR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMgB76Jgsz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 03:36:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CE3D43FF2;
	Thu,  4 Dec 2025 16:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955C6C4CEFB;
	Thu,  4 Dec 2025 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764866173;
	bh=QLA4FZzgbXjsYI+l2C36P4TGIK8Zp5+dxYpW28/AI3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVvsT/qRwMLLko60/eJAuCFaJbfoMhmF08IrWhinJQIFVfoBSYtAltxLtDskYOR6M
	 Kfi6FiExQTIC4qUNeyXmEJjG58nnGGvCoHEG8cyVWl3AyHYWsaqL77CQrcG1jDrtMl
	 kM0KgwOU4sChXd3oN0qu+gYgY5L5E7TH6Fsl3SJU=
Date: Thu, 4 Dec 2025 17:36:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org, achill@achill.org,
	sr@sladewatkins.com, Vlastimil Babka <vbabka@suse.cz>,
	"Fabio M. De Francesco" <fabio.maria.de.francesco@linux.intel.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>,
	Ian Rogers <irogers@google.com>, linux-mips@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 5.15 000/392] 5.15.197-rc1 review
Message-ID: <2025120428-manly-squatting-f3eb@gregkh>
References: <20251203152414.082328008@linuxfoundation.org>
 <CA+G9fYvmhQs9qx-XpLiaOUZQKj=gR=-X5MoJ1auRmbC7cC+AXw@mail.gmail.com>
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
In-Reply-To: <CA+G9fYvmhQs9qx-XpLiaOUZQKj=gR=-X5MoJ1auRmbC7cC+AXw@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 04, 2025 at 02:08:24PM +0530, Naresh Kamboju wrote:
> On Wed, 3 Dec 2025 at 21:27, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.15.197 release.
> > There are 392 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Fri, 05 Dec 2025 15:23:16 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.197-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> The arm, mips and powerpc builds failed on the stable-rc 5.15.197-rc1.
> 
> Build regressions: arm, fuse-tegra30.c:250:10: error: 'const struct
> tegra_fuse_soc' has no member named 'cells'
> Build regressions: arm, fuse-tegra30.c:250:18: error: initialization
> of 'const struct attribute_group *' from incompatible pointer type
> 'const struct nvmem_cell_info *' [-Werror=incompatible-pointer-types]
> Build regressions: arm, fuse-tegra30.c:251:10: error: 'const struct
> tegra_fuse_soc' has no member named 'num_cells'
> 
> Build regressions: mips, tlb-r4k.c:591:31: error: passing argument 1
> of 'memblock_free' makes integer from pointer without a cast
> [-Werror=int-conversion]
> 
> Build regressions: powerpc, mm/mempool.c:68:17: error: 'for' loop
> initial declarations are only allowed in C99 or C11 mode
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ARM build regressions are due to,
> 
>   soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups
>   [ Upstream commit b9c01adedf38c69abb725a60a05305ef70dbce03 ]

dropped.

> MIPS build regressions are due to,
> 
>   MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
>   commit 841ecc979b18d3227fad5e2d6a1e6f92688776b5 upstream.

dropped.

> Powerpc build regressions are due to,
> 
>   mm/mempool: replace kmap_atomic() with kmap_local_page()
>   [ Upstream commit f2bcc99a5e901a13b754648d1dbab60f4adf9375 ]

dropped.

thanks!

greg k-h

