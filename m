Return-Path: <linuxppc-dev+bounces-12597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFF3BA702C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 13:58:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZNBw1GZZz3cYx;
	Sun, 28 Sep 2025 21:58:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759060728;
	cv=none; b=NBetRdX24/daAPqkezfgi3BSjjS8gqKeM80p5eflsTHC2yqp07h0LrNZx6UOM0wsdjKOIU3w+e5CAhGJwWxgcKDeB5bYyPYV8f7hgboAxEPhI8fWBV0kX76d3mi714Oka7r5hZkuJwnHm2yU1StqusA4s2IxCePUdrjm3VUJiXPOnRrX/JcDgbBkAlc23DrdJGiSoEpo+9pd3zHltZEeF3t62BIuSdAKcg2D+yrH1cMwLNS3QwxOZxlQ2daCqP0QC7nxfq2XpXdkrRo4PYFYL4toAd6CKPXkh00RmzHmzUI8SapoDxQ6+5kCj0rZMwf/c3POHiy9oafM6ipeKxrfWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759060728; c=relaxed/relaxed;
	bh=8erfzqVMCfKPWmM8OQR0dCUWNW/3KaqBvFmdbxfy56o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aB3Sn8PPWH5tAjOQMGISAadvCRnEEudeSV2UAOWyBLL0oq62FfH+slelH+VnTXRz21tMgDTHYuvE3i50P0UmHVMRElSOcSHjMb3Lglcl7PJb3oX+2mgujftoNycGStEpVr0llTpJ1GidWeHcS0QiS08DctGgVI/P/K5xo/CPtVmfxWs7T11c4VglHR4wKuFBrhaPanQpEejie8OramGMt3AqA9fKTo0LYNTvYpDL3B27VUXmMQXR1lhXywx8BWdm1aI/R5CIbBpieF9i/XtelJf5HA0qYkA3AicxnLASFLriqdSiMD9DngSxotPkiYKlw//yfmMg4F55KUrqlEBuWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U3I0kHgX; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U3I0kHgX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZNBv2BPHz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Sep 2025 21:58:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5115341742;
	Sun, 28 Sep 2025 11:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A70C4CEF0;
	Sun, 28 Sep 2025 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759060724;
	bh=ckjBiIEK8WR9Yy3qbX0tVHWjgl/Q5LNywAArQuLUpqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3I0kHgXcdhzV3J3cNm+QKWfB7QdY/mTy0ouL3HOv+J3sqJIvuS62SQl+z8PL8YWd
	 qfUAdkBs6D1YVhXVJ6bRrI78Xzyj0CsANEvMURlDviJn8dx5FGPrwxmhdVbcvknSpY
	 WdO4NFZz1RZzNrsKib9CkR4lkxgnoFLn75s77V+99fxEfk9i3VsSTBqugUgy80mDqz
	 s7XhyMEqmiXf1xj53ZxtEanbtM7nq83+tdm/Us5QkUfCxJcUjJXNQqj0gYs2gvwuDO
	 7AiJl/EpeN0s5CHrA/1lJBsV9nH+GOe/f6lIQ8rlBPFFhXVhSL5WKAz8toK1YCzvbK
	 VIIytYUCCbdng==
Date: Sun, 28 Sep 2025 14:58:38 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>, iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jason Wang <jasowang@redhat.com>, Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev, x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical
 address
Message-ID: <20250928115838.GF12165@unreal>
References: <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal>
 <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com>
 <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
 <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
 <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com>
 <20250928105413.GE12165@unreal>
 <CA+=Fv5Rnk5RaGU9R_65izNOJOns9w_eEzetH9kBF_MaRgdhLAA@mail.gmail.com>
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
In-Reply-To: <CA+=Fv5Rnk5RaGU9R_65izNOJOns9w_eEzetH9kBF_MaRgdhLAA@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Sep 28, 2025 at 01:27:12PM +0200, Magnus Lindholm wrote:
> > Thanks for the effort.
> >
> > Can you please check the following change instead of reverting the patches?
> >
> 
> No problem, happy to assist. I think this did the trick! preliminary
> testing shows
> that this now works on alpha! I guess the offset information in paddr was lost
> by doing "paddr &= PAGE_MASK" before retrieving the offset, well spotted!
> 
> I'll keep running the system with some load to make sure there is nothing else
> we haven't spotted yet, but so far so good. I'll keep you posted.
> 
> Will you be putting out a v2 of this patchset with these updates?

Yes, will try to send today. 

Thanks again for your help.

> 
> Regards
> 
> Magnus Lindholm

