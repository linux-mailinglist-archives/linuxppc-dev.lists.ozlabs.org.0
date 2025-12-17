Return-Path: <linuxppc-dev+bounces-14836-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8BCCC78CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 13:18:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWXs265msz2yvB;
	Wed, 17 Dec 2025 23:18:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765973926;
	cv=none; b=HwvGfTFekCfDimY40mC7AuuisKd0gEroTPRBGF2Mcjm/FpbKp6SKQraIRv1WyNcKsLzwy7aFLX/G2K34D6nGeN2/A5vnF4bot3HeaLtxayBVXIzzd+lGuaj7V6ednOuVPBpqNl3BZnOV8cPSc7NR16R5qEKP47GlKHuB3jg3YVw3KF2Cs6hwd2sVMi9u0OLv8TFdhrEdz+8E6ciLxVhwdmFcFcmIUAFaF/tvb+8y39de99PKFhJWa4kVBlVOXmxfeFjxLv7aMqJcLJRaWKCbj+NXw9KXY1pefLnFKMM4RUADVRxcTPKL6/tp2gs2kMc+060JPxkuQnmDLm6Snh6SHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765973926; c=relaxed/relaxed;
	bh=TA4hyyTWjoyEecRU+tFTEv8TY8OLq5jN3IBQEP1dw+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOAPPGPmppR4Zee6zrWlsS6y+BDCJvg9+f8ji4eT41N0pqEsab/vor9ZjeJCiyVXcQXAiDJ64Yg6S0dXMpdZsdbxZDkzu0uqwWhUEgQlSe3JI1cLXI/y+HD2O2ZdYI811GCtNHmr0uu0sFNJuRvdJPElaBY8FefHHRB7CHBFcjxKOduHgR2L5i0z8xRpN+SNGNSZSaS7vWpHK6411N8502z6zbVYtvh1Xn4Kub7WjsgRjev+F7dFHPMlZl1pijuaapMqmlKGbtNJWdeY6qW5XbeqNt1yeYJwRzgo8+RX8MWHtyfG1wV3l1OneW9E1CVTkxPuVODc7ZQ4O23suJsjTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AtN8UvsG; dkim-atps=neutral; spf=pass (client-ip=74.125.82.47; helo=mail-dl1-f47.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AtN8UvsG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=74.125.82.47; helo=mail-dl1-f47.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWXs040drz2yth
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 23:18:43 +1100 (AEDT)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-11beb0a7bd6so689813c88.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 04:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765973861; x=1766578661; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TA4hyyTWjoyEecRU+tFTEv8TY8OLq5jN3IBQEP1dw+M=;
        b=AtN8UvsGWPjXLcXeaLXXqTSAlphsYRp6DU7G9ABnUhXxpEa9hvh3xuPI1DJyKDckne
         AMft00R0lnoFgJdhB2kTT7rajwJYEWBTprCdAnEWSCRd78auybJpKOpy0l3QfaADpnZk
         XFORxrJjqQn0oAdX/R/hC3rUYyrV/K+31H/WAhf7qTZUet4m7GnaeQr+7jhZxw0uSAA+
         9MnWg56IK5P2M4Ov6+aQrvVuEy6gBg6gH4B+P2wUorZW3GCFajWF6jNs9CJtldYYJM48
         8nmETw9hwyairkEoUrbe0z3Qq5zUVz+81zUoFRvpmrY4N5pLS+WoqWieJ4gSg0gX5VLS
         I3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765973861; x=1766578661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TA4hyyTWjoyEecRU+tFTEv8TY8OLq5jN3IBQEP1dw+M=;
        b=bB/E3hzQRzBQMeuMApEA/qNcxO7qiPKkfFhtHPbdhbozjmg6El2E3PtjJPD6n3xk6K
         VEjWWarv1ue58qbxGXAj4eUVh4W3I87t1WyDOHdycnw/41bgDb+lpLHZVA31sRYaqaG8
         rgtpiXrgmh9/ZE0YNIl6sHIBVjrlRSL9Sedtc2N9FCmZFDBnnRoxIa9sZGlDnf44ZcPr
         8SZU284g/46cCbcx2Q5ZtCE6mBZ8tlyrJeLSSK84V9APDuitPAQxb4eSaBuX0sgng0fE
         QRXqTAue6WL9XzpE3G9AZ3lKL4/1WkU3ejsBvowuTt9Pk8OrH01nTqY4c91nSmbVnIbA
         rMaw==
X-Forwarded-Encrypted: i=1; AJvYcCUYRlbSEBKNkOcqH+nGZgKoPOunXC+pI7ZfVc84UrUCN1RzPWyncXJCCiBOo957C/Bi3lnAVnSwZwWN7ww=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUXiFEry62NtEKiOfg146ER4wqMVWTYdCHrZeDrT+hWaE7np5I
	pOFqWIsuOy3qqhApixRtpXe3EoVCEtSoRUTjOGAp/ojKpSncWKBu/zYR
X-Gm-Gg: AY/fxX4TEb7IVCCMgMXACwMSBMJ8sMOhNhNYHl7RamQ67z8tbvvrG1m5uKxojKImSPY
	FdTQV8MGgHQ1UeO5jcN3yyL+qjUZAgg/mTwE/33CsS829chxmNufhWrEhRNTCoUILBdtNLWp8S2
	8ZpLOENR5cuvAd3A41yndj7B0XIfIBTUVLW9Q4hnEIIiL2/4e4Os22qG5ch1t2MFYuNF5cqAXM4
	DjLfvp1tBQFq3/HZAvZon09l4mR9/rqcLx0EvRGHtfhSOFwLGTPzyU9GuuEa32TIIPVStDwvxjj
	LjM6PuG+GUCxeMtuHi6HkzMl5zSKSp8C8C80ihmvBCBNzD2KQJ0s7Aa3mi3x/jaAZXAGcLUy/fe
	Kww7WcMBfRLQ2/Rjsv/YtG3dSK926wEfouHUCUk+Ai9GBssjps98orq2IbzWU5vArvEv9WYXSMI
	qMxOniH4Vpx8T5pCg3zOe9ULnm
X-Google-Smtp-Source: AGHT+IHtTckxV0BrLKUtwEMMlG/KT0X6JCzQ/eEGNn1nvrPgi11fSB7RRA3IhgmdXndE9lBsM2aS9w==
X-Received: by 2002:a05:7022:e806:b0:119:e569:f86a with SMTP id a92af1059eb24-11f34c29cefmr11289687c88.7.1765973860378;
        Wed, 17 Dec 2025 04:17:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30b799sm60713771c88.17.2025.12.17.04.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 04:17:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 17 Dec 2025 04:17:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Leon Romanovsky <leon@kernel.org>
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
Message-ID: <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
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
In-Reply-To: <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Wed, Oct 15, 2025 at 12:12:55PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Perform mechanical conversion from .map_page to .map_phys callback.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

This patch causes all my 32-bit parisc qemu tests with C3700 machine
to fail. Network interface tests fail, and all boot attempts from
any kind of hard drive (scsi, usb) fail with this patch in the tree.

Guenter

---
# bad: [8f0b4cce4481fb22653697cced8d0d04027cb1e8] Linux 6.19-rc1
# good: [7d0a66e4bb9081d75c82ec4957c50034cb0ea449] Linux 6.18
git bisect start 'HEAD' 'v6.18'
# good: [6dfafbd0299a60bfb5d5e277fdf100037c7ded07] Merge tag 'drm-next-2025-12-03' of https://gitlab.freedesktop.org/drm/kernel
git bisect good 6dfafbd0299a60bfb5d5e277fdf100037c7ded07
# good: [09cab48db950b6fb8c114314a20c0fd5a80cf990] Merge tag 'soc-arm-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 09cab48db950b6fb8c114314a20c0fd5a80cf990
# bad: [701d7d782d98242a64cdeed90750f88ff733bc39] Merge tag 'spdx-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/spdx
git bisect bad 701d7d782d98242a64cdeed90750f88ff733bc39
# good: [66a1025f7f0bc00404ec6357af68815c70dadae2] Merge tag 'soc-newsoc-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 66a1025f7f0bc00404ec6357af68815c70dadae2
# good: [c84d574698bad2c02aad506dfe712f83cbe3b771] Merge tag 'modules-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux
git bisect good c84d574698bad2c02aad506dfe712f83cbe3b771
# bad: [b0319c4642638bad4b36974055b1c0894b2c7aa9] Merge tag 'nfsd-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
git bisect bad b0319c4642638bad4b36974055b1c0894b2c7aa9
# bad: [e637b37a520513a04d00f4add07ec25f357e6c6d] Merge tag 'rproc-v6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux
git bisect bad e637b37a520513a04d00f4add07ec25f357e6c6d
# bad: [56a1a04dc9bf252641c622aad525894dadc61a07] Merge tag 'libnvdimm-for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm
git bisect bad 56a1a04dc9bf252641c622aad525894dadc61a07
# good: [d0cf6512bbcf77afb6102f886fcd7fd48b7ae043] rust: bitmap: add BitmapVec::new_inline()
git bisect good d0cf6512bbcf77afb6102f886fcd7fd48b7ae043
# bad: [936a9f0cb16b0646143f8e05afab458adc51d0a0] xen: swiotlb: Convert mapping routine to rely on physical address
git bisect bad 936a9f0cb16b0646143f8e05afab458adc51d0a0
# good: [14cb413af00c5d3950d1a339dd2b6f01ce313fce] dma-mapping: remove unused mapping resource callbacks
git bisect good 14cb413af00c5d3950d1a339dd2b6f01ce313fce
# bad: [96ddf2ef58ec070afa8275f371b619462cd8fb2c] parisc: Convert DMA map_page to map_phys interface
git bisect bad 96ddf2ef58ec070afa8275f371b619462cd8fb2c
# good: [e4e3fff66a57a7aee048e0737a16874aeaffe9f4] MIPS/jazzdma: Provide physical address directly
git bisect good e4e3fff66a57a7aee048e0737a16874aeaffe9f4
# first bad commit: [96ddf2ef58ec070afa8275f371b619462cd8fb2c] parisc: Convert DMA map_page to map_phys interface

