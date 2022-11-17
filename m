Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D040062E772
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 22:58:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCv1D4ZFKz3f35
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 08:58:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PJZ6jbnQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PJZ6jbnQ;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCv0K3Kvsz3bhn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 08:57:18 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso3283529pjc.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 13:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IIh+nGIerLfk4ZB9SpoRZWMODmjSUqXiyhjydKb0Cds=;
        b=PJZ6jbnQhQq9tru88c3QcgjfZaJDnoJRCzzf1bX0/gWQf6BO1kYnGuZiAkcQbfZxF1
         wVZdaktXE7y7G0iGR9w0mDib97tK+9Z1KEN4DGKZzUJEwZpO/1SRERjEZW4dZS1lSmQm
         6pLSDQke2I1tY0Rbt7braOr4eQDXUxJpKb4Zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIh+nGIerLfk4ZB9SpoRZWMODmjSUqXiyhjydKb0Cds=;
        b=wB3e2q37b+knDe+5dvesPDFo0o2ywdBwm59l5ZQORmlsD9L/RM8qcoNi2d1l+FNsoi
         QqDxpqfllq5YvGNTph+atoAYK0nilI3aT0aixRXK8Li09DbqArrLoSG3zN4lDYDglUtj
         fSCbB/elcsse+r6NUiovOG+IB4Ss7xYfjf4rPw9ZCClpIIwHS066dx81h9A1Usi9+5cv
         QfNrmEJ2prcuwPkUmrT6uRSyxIponsVNiOfAEPv+xEhnvRpVt5SCIdx28h1DRXCvGBGS
         sNBu40UjYmZSeO8USY0HOOhXU/W7fekY7FRCkPzLtf5nWsPITpLJawVjq8cz3uMg3oLU
         lDSg==
X-Gm-Message-State: ANoB5plRmiBW/DSBC4hIE7aK0T6uY6K0tcjAsktnHzTnqmBU9YJEt/vr
	oljf10f9aW+tB6eT/7TIHV94Mg==
X-Google-Smtp-Source: AA0mqf5F2mDePv/SsUAusLJAu22vdbKLGH3peZOY+MZBhXcyEG7NIlWlaGpyKLA4kx4t011dWowR5A==
X-Received: by 2002:a17:90a:dd82:b0:212:fdb1:720b with SMTP id l2-20020a17090add8200b00212fdb1720bmr10785160pjv.66.1668722234748;
        Thu, 17 Nov 2022 13:57:14 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a28-20020aa795bc000000b0056beae3dee2sm1674860pfk.145.2022.11.17.13.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 13:57:14 -0800 (PST)
Date: Thu, 17 Nov 2022 13:57:13 -0800
From: Kees Cook <keescook@chromium.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v3 3/3] treewide: use get_random_u32_inclusive() when
 possible
Message-ID: <202211171349.F42BA5B0@keescook>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221117202906.2312482-1-Jason@zx2c4.com>
 <20221117202906.2312482-4-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117202906.2312482-4-Jason@zx2c4.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "Darrick J . Wong" <djwong@kernel.org>, patches@lists.linux.dev, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org, linux-media@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Chr
 istoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 17, 2022 at 09:29:06PM +0100, Jason A. Donenfeld wrote:
> These cases were done with this Coccinelle:
> 
> @@
> expression H;
> expression L;
> @@
> - (get_random_u32_below(H) + L)
> + get_random_u32_inclusive(L, H + L - 1)
> 
> @@
> expression H;
> expression L;
> expression E;
> @@
>   get_random_u32_inclusive(L,
>   H
> - + E
> - - E
>   )
> 
> @@
> expression H;
> expression L;
> expression E;
> @@
>   get_random_u32_inclusive(L,
>   H
> - - E
> - + E
>   )
> 
> @@
> expression H;
> expression L;
> expression E;
> expression F;
> @@
>   get_random_u32_inclusive(L,
>   H
> - - E
>   + F
> - + E
>   )
> 
> @@
> expression H;
> expression L;
> expression E;
> expression F;
> @@
>   get_random_u32_inclusive(L,
>   H
> - + E
>   + F
> - - E
>   )
> 
> And then subsequently cleaned up by hand, with several automatic cases
> rejected if it didn't make sense contextually.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com> # for infiniband
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/x86/kernel/module.c                      |  2 +-
>  crypto/rsa-pkcs1pad.c                         |  2 +-
>  crypto/testmgr.c                              | 10 ++++----
>  drivers/bus/mhi/host/internal.h               |  2 +-
>  drivers/dma-buf/st-dma-fence-chain.c          |  2 +-
>  drivers/infiniband/core/cma.c                 |  2 +-
>  drivers/infiniband/hw/hns/hns_roce_ah.c       |  5 ++--
>  drivers/mtd/nand/raw/nandsim.c                |  2 +-
>  drivers/net/wireguard/selftest/allowedips.c   |  8 +++---
>  .../broadcom/brcm80211/brcmfmac/p2p.c         |  2 +-
>  .../net/wireless/intel/iwlwifi/mvm/mac-ctxt.c |  2 +-
>  fs/f2fs/segment.c                             |  6 ++---
>  kernel/kcsan/selftest.c                       |  2 +-
>  lib/test_hexdump.c                            | 10 ++++----
>  lib/test_printf.c                             |  2 +-
>  lib/test_vmalloc.c                            |  6 ++---
>  mm/kasan/kasan_test.c                         |  6 ++---
>  mm/kfence/kfence_test.c                       |  2 +-
>  mm/swapfile.c                                 |  5 ++--
>  net/bluetooth/mgmt.c                          |  5 ++--
>  net/core/pktgen.c                             | 25 ++++++++-----------
>  net/ipv4/tcp_input.c                          |  2 +-
>  net/ipv6/addrconf.c                           |  6 ++---
>  net/netfilter/nf_nat_helper.c                 |  2 +-
>  net/xfrm/xfrm_state.c                         |  2 +-
>  25 files changed, 56 insertions(+), 64 deletions(-)

Even the diffstat agrees this is a nice clean-up. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

The only comment I have is that maybe these cases can just be left as-is
with _below()?

> -             size_t len = get_random_u32_below(rs) + gs;
> +             size_t len = get_random_u32_inclusive(gs, rs + gs - 1);

It seems like writing it in the form of base plus [0, limit) is clearer?

		size_t len = gs + get_random_u32_below(rs);

But there is only a handful, so *shrug*

All the others are much cleaner rewritten as _inclusive().

-- 
Kees Cook
