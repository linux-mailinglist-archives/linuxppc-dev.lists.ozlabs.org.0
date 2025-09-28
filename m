Return-Path: <linuxppc-dev+bounces-12612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C391BA763F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Sep 2025 20:33:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZXyp4J38z3cYR;
	Mon, 29 Sep 2025 04:33:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:2350:5:403::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759084434;
	cv=none; b=g0z/1HeNoukPmKFJDvCJpdyKYPDyMGAcwq+LAxA2jWXCtX3MD1kaGrcKWX43jEDI+bWaXszaN9PlceFlWgVHrBn626mzZPsI+fXPnfP6jIpEZtMVOY0d+Nhn0pXeQ5Og0tRTWqui01RWY2nkNWEKqIsV1UjcoXlmeKFu6QpmphBU6tSmW/S3vYqRsDPjt4dTMoItNJ4Z7W1z83bBvfEH4z3En+XD0BUMqvt/L+ysW6aW5ywaRgjM7u7CNuGC3xKPqY/GJx0h6uT1+eL0z8MFpfsjET/ddaxzJFyFF8O494md5KIN/MG3UgtjpepkCkKkekWYL5rsNOFNNqFNKOziqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759084434; c=relaxed/relaxed;
	bh=/Q5hJNgUVt5SsKvfCGB08N5MVmcUGqA0PZ6u8vFRIRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEP+vlp/LyTI2Yq95q7wQkhQ3JU0g+G6YxCwMKCnaZdZho6Cl8a/U9D5hZ3+Urd5he1RqrHR7Q0MP+OY6WZOGSeIT7uCbtweiGUIO+5IlZZfkB2CNwY/GOD6Q3nqat6lr4e993CuTlaJK1QutI2J6zNDmvcxD/RwOh4kcA0FEbku5bcQ+eVw7gJArSa4snn0/vm7BT7lH1xAL/2nVBgKwTNajzP4hEVE2GYXXHuEqnp2uFbP+7wBBsCnggMYLu1XRXMOSi8FmUh8wHHFSrQgYcqXqSGTNhBrLeg6p9v7pOIGOVu4iFA9SHs35xIMPGpLUqPQYGZ0UbEkLR8DExmqbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; dkim=pass (2048-bit key; secure) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=XDrJz48O; dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=2W7jKc5o; dkim-atps=neutral; spf=pass (client-ip=2a02:2350:5:403::1; helo=mailrelay-egress4.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=lists.ozlabs.org) smtp.helo=mailrelay-egress4.pub.mailoutpod2-cph3.one.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=XDrJz48O;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=2W7jKc5o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay-egress4.pub.mailoutpod2-cph3.one.com (client-ip=2a02:2350:5:403::1; helo=mailrelay-egress4.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=lists.ozlabs.org)
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:403::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZXyk2GBrz2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 04:33:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1759072648; x=1759677448;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=/Q5hJNgUVt5SsKvfCGB08N5MVmcUGqA0PZ6u8vFRIRA=;
	b=XDrJz48OIBYo3Q7svVdb5rADtr4uzPeBqjzvjdBidN0feLc/fG5FyC6+FiXnHOkn55ys5B7oUM9TU
	 wNSnamick0obcSvJhF96XXEZuoST1AXGIm/ETF3M+aEeXyHZD/Uy94xCWNukoXKrPvaVVSyuR/mSdp
	 KB96525b2afYqAiKmysXETY5dzfEWAwGX0eJNU7vM+m4GXoo64rXvhOnauh357csMR2l9engULsyz3
	 5PXk1+lrLbhu0QL4HC7CtjxC4UA5AqK0Qya1KK4CYFDrDKU3YZgpLD4h/rFGJ9D+9noDpVHH5zdKCH
	 rr1+z6bhES67FvuiiyDFZXKzWF0+L1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1759072648; x=1759677448;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=/Q5hJNgUVt5SsKvfCGB08N5MVmcUGqA0PZ6u8vFRIRA=;
	b=2W7jKc5o1qHQ2HRmyzqFqhAdPo7FUm8FqIPGGW/HvkJ0QqhXxxc9Hji379Sr1nafpwrNl2oS4qsP7
	 wU9ELx/Ag==
X-HalOne-ID: 3c50089e-9c7e-11f0-840e-494313b7f784
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net [2.105.16.150])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 3c50089e-9c7e-11f0-840e-494313b7f784;
	Sun, 28 Sep 2025 15:17:27 +0000 (UTC)
Date: Sun, 28 Sep 2025 17:17:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
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
	xen-devel@lists.xenproject.org, Magnus Lindholm <linmag7@gmail.com>
Subject: Re: [PATCH v1 9/9] dma-mapping: remove unused map_page callback
Message-ID: <20250928151725.GA135708@ravnborg.org>
References: <cover.1759071169.git.leon@kernel.org>
 <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
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
In-Reply-To: <27727b8ef9b3ad55a3a28f9622a62561c9988335.1759071169.git.leon@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Leon.

On Sun, Sep 28, 2025 at 06:02:29PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> After conversion of arch code to use physical address mapping,
> there are no users of .map_page() and .unmap_page() callbacks,
> so let's remove them.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  include/linux/dma-map-ops.h |  7 -------
>  kernel/dma/mapping.c        | 12 ------------
>  kernel/dma/ops_helpers.c    |  8 +-------
>  3 files changed, 1 insertion(+), 26 deletions(-)

It looks like you missed a few sparc32 bits:
mm/iommu.c:
static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
#ifdef CONFIG_SBUS
        .alloc                  = sbus_iommu_alloc,
        .free                   = sbus_iommu_free,
#endif
        .map_page               = sbus_iommu_map_page_gflush,
        .unmap_page             = sbus_iommu_unmap_page,
        .map_sg                 = sbus_iommu_map_sg_gflush,

mm/io-unit.c:
static const struct dma_map_ops iounit_dma_ops = {
#ifdef CONFIG_SBUS
        .alloc                  = iounit_alloc,
        .free                   = iounit_free,
#endif
        .map_page               = iounit_map_page,
        .unmap_page             = iounit_unmap_page,
        .map_sg                 = iounit_map_sg,

I did not compile test, but from a quick look they need to be updated.

	Sam

