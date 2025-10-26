Return-Path: <linuxppc-dev+bounces-13304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 459B9C0A430
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Oct 2025 08:38:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cvT5n3lYkz30V7;
	Sun, 26 Oct 2025 18:38:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761464317;
	cv=none; b=ZvpbelVL+mx5YLc9YG1VcyAmc7Gy0jbWV7gulKTB8ffPm9o6Yc+hNe569HKE+eex9l2rawAnoF7nLbKIhybEq94hs9g+rBU+XF3biZTa9AjjV474vC6taMrFSWB7oeswZCwaQp/7/SO3mMWZkLd98EkgXD1jlVLXveYp9Y92QKh5b6/eC3RnxowFWyU7LTsVLo9hTGRFnWmICGJInIAf/FWcpAtVECAVLY798fJqR0I8yvWnZMLod9BrlNoR4T1FmefFOMBgW+6VOZgz9kvUHZ8LuLRqEG0mg/RGDq+kx1Fe3vk4fwmtfslueXKy83NpRW++jIsxCiPJjq4OvsgvMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761464317; c=relaxed/relaxed;
	bh=dr/rzi95WLg/Q0IBg7hU4+KdgBC8XDqy387/vcjoEfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8YsmqlmTtIvTXtZ4OG5MTw3phYQMErFiABHvP4LVUSt0LiO0ET2LWyyhxNMR+CEVoIYnCSzTL6MQS1ojwypVKOzY0u5gbrO4604tfU74MvYrQxgN9hCo2lmz/KuSJdtvh3WaAGUPn31i1WZDK6d8a+0lGqXhaRqHqBS/fW3k8BZ7YotXkCR8XlFAZWPBD8mXC7tH/4CGasZDXIZlW0vkqlhlmegf9EpXjbassIJiglmeqgBS5dRy+CfruIsXdjyujuioti2zi1rnpnbx+bACQRruDmzoCHKZvFQzpVeGyRIlkrF2XFJ4h8g6GONxna+LFz16Ycq8XpZ6fSerkFikQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m+Fmvy/T; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m+Fmvy/T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cvT5m5sYcz300F
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Oct 2025 18:38:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10582602B6;
	Sun, 26 Oct 2025 07:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEC0C4CEE7;
	Sun, 26 Oct 2025 07:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761464312;
	bh=tE6duDWkMhf/izPfcVJAu0QGF5RniuWMZJNurHMPV4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+Fmvy/TkbKsHE/ly3nNuV5cMvplX6wPfLQ8hDaDmyX3wLacnUE7JOG/nZvuUxvmv
	 CczVISfw5M2fl/jL4dxMpQZjR+1heTwgUYiFF7wTs743d7UeCv0GILFXzjGlxgVBC0
	 oE76qdMbU/6QmYSolZLhh/1ehXnuAH4Wfx1TxENucSoXAohh6TFciSEQZaKMP7NYm1
	 JNqz8+TYhassoC4ST69Mi5FA0Qr+hRmr+2UhbjR5EKFyOegX19oAs4ZZ/0v57u0VQ0
	 /l9R6yk8RlGVj+rmA/30TcaUiEVUwLELSxYEgJrK1wn3ZV8WITcnHNlOkzodvgsSHW
	 uuxeQvWuJFb7A==
Date: Sun, 26 Oct 2025 09:38:28 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	Magnus Lindholm <linmag7@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v5 00/14] Remove DMA map_page/map_resource and their
 unmap callbacks
Message-ID: <20251026073828.GC12554@unreal>
References: <CGME20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d@eucas1p2.samsung.com>
 <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <4a47088d-6542-45f2-917b-c91f7dd1eb1a@samsung.com>
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
In-Reply-To: <4a47088d-6542-45f2-917b-c91f7dd1eb1a@samsung.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 20, 2025 at 06:27:32PM +0200, Marek Szyprowski wrote:
> Dear All,
> 
> On 15.10.2025 11:12, Leon Romanovsky wrote:
> > This series is a combination of previous two steps [1, 2] to reduce
> > number of accesses to struct page in the code "below" DMA layer.
> >
> > In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
> > callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.
> 
> I would like to have some acks from respective arch maintainers before 
> applying this patchset.

If to judge by git log and lore for some of these arch (didn't check all),
you won't get any response and will need to make a call by yourself.

Thanks

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

