Return-Path: <linuxppc-dev+bounces-14859-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF224CCAF2C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 09:40:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dX3yL6PDjz2xrM;
	Thu, 18 Dec 2025 19:40:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766047210;
	cv=none; b=bqX2Bzpl+7NN3YtatvVVtINttDJrjXEyQSIYi3wCrQ6OIe91UNGdTfBHCkHpw6/ZQuoWd0DxaX8UM5+4KqF4v40yd08Z1Ty6/i17J8U2FgFpZIcuc7aTvV9NfP0+9KLNrH008WkBgUS6/lBApwfGIEVgx5bpvGDFLnODAxnm2jRXQpoTZCw0EGpG/Vf/3z5/UKze/aoXprvYdsh+Aum/BzRhxoDl5sgh1NKSDlubN/AMxk0YYg+FRqP/x107wz/goNiWSPk8xxGjHhJAy0xJ/xAI8xirkjsd4zMW8iUeDm9ptX3nG1bl347gaEdyn4+DyndMn2wfa+wBiClAPXbDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766047210; c=relaxed/relaxed;
	bh=4mxIe2RWCdQyoniiqHbqT+fSW/1ncegpctg5OKn3wFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GncunJwl4hLPZw3KsxgQ/jGuWg+uBw1/T+OEfd2OeA3nMstmEibWDjpr+aqUUbWEb5LmHV6QjXgrUGFLH115BgzGsDg+BnoY1FL4sFs1pxeXRhZvgYnSNzFXWHF6EH0XdftoWa0IniKDdNJRqYRYNPC9djwckEuYUkB/TqV1pSU3fW58NozH1tjWSdmcDU/YdAYIs75NsDsdP57auHvfbGgK4cT8yHUf+Ou/7mPadM49gOiW31NaDujzz/77cYjkRs/joVnHn7CGYR4hYaGCkoMJMyqTcsWBubweirmoU0dvyOqgQpET3XqE5cgjOhLUAfsJq5qDRULxovYuR2+vkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rmVVJePJ; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rmVVJePJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dX3yL0NXCz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 19:40:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D01A4405A;
	Thu, 18 Dec 2025 08:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4B5C4CEFB;
	Thu, 18 Dec 2025 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766047207;
	bh=ofPz3WZxF0qhrxc5N6KO0WklVZWUMGP/4at4uzuCx5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmVVJePJGXR+kQkm3+r1Kbt0GyikF3QfUnymI7CCZrHKsRgARfO2o2ba2kB+bpPCT
	 UHrvTWZoxuQAIRQXxc9I5NeoAcCrZBmmcrAlJnug5BaQTQvVwVqvaJjDuY33ZMzoy6
	 BAr6jLOIpi2I8WC82e6kp81I8nrCa8WqCHQlSBTqZwv7g1LhXawg+JG4WGZSyz9t7l
	 lUOt/NCn0KCw0dStvCGVQTawL+HWAy5Lrwn0Gx39IwmYRZLbytZdLLUDYSPzigtubq
	 ZxR25apmkkEWekeoA8W1U6GFN06j4Og1ARDAkIDWxQbraNlGOfxULa77Gl1qMs8cke
	 OZqPmHVBTqbAw==
Date: Thu, 18 Dec 2025 10:40:02 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
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
	Jason Gunthorpe <jgg@ziepe.ca>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v5 09/14] parisc: Convert DMA map_page to map_phys
 interface [qemu test failure]
Message-ID: <20251218084002.GD39046@unreal>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
 <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
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
In-Reply-To: <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Dec 17, 2025 at 04:17:38AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Wed, Oct 15, 2025 at 12:12:55PM +0300, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > Perform mechanical conversion from .map_page to .map_phys callback.
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> 
> This patch causes all my 32-bit parisc qemu tests with C3700 machine
> to fail. Network interface tests fail, and all boot attempts from
> any kind of hard drive (scsi, usb) fail with this patch in the tree.

Thanks for the report. I have a fix ready; I'll clean it up and send it out
by EOD.

> 
> Guenter

