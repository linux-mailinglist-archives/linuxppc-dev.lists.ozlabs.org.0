Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A267A3612A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 21:00:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLpZR3qGGz3byg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 05:00:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oJhLd5qe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oJhLd5qe; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLpZ11HwLz30HD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 05:00:09 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FFE661103
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 19:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618513206;
 bh=3QkOpXY42hFCJcjT08WY79HuNgMbSCbucp8T7Lu/Gyw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oJhLd5qeUZ2D01LaV+DBVA3WiwlJ49LzHkGhXbx20dOZyQvAonfzhKBX+7VUEkcaf
 qsAelHSFMsM6Bckn7IXf7lFQXvtaPEaQB9yID9YDYrWm+kxmyEp6eaq5rtDT5dtSCw
 Q4W6ud0pb9CAvqPXaXuohNDkORMTLNh7OYPyp3SBtn+xe39LtSI9xzgEzGeL6iBddS
 f68Ea5F7fZIGZLdZlGc+C914YKqHq/2R9l2NG3a4CpJAM60UErTZD92p9un1Ltg3Wc
 Nq8/gkaFZq/BoevmwacadhD/dtCXOeXtEflGrBV6tVbrL4dC4TOm7Osf4zOVwE/1Ig
 YbeMO3jsWZQ9A==
Received: by mail-ej1-f54.google.com with SMTP id w23so22635522ejb.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 12:00:06 -0700 (PDT)
X-Gm-Message-State: AOAM532Kf49C3juGJ9/nr68r3MnZuOVmQDx5C3ECC6T8eGKndt9eJ2G2
 MWb9Jl3bFiKxVFuFRRpkicTaL2SjrB28O0RN8g==
X-Google-Smtp-Source: ABdhPJynWSj+ZDcLUN0rDvn85g39jo1ldh5d1/4kMKUG6C+T3/POrItS5sj8VN8G5+i/NBs56pq5Zhn3RBh0Hrx6vLc=
X-Received: by 2002:a17:906:1984:: with SMTP id
 g4mr4827470ejd.525.1618513205152; 
 Thu, 15 Apr 2021 12:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210415180050.373791-1-leobras.c@gmail.com>
In-Reply-To: <20210415180050.373791-1-leobras.c@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 15 Apr 2021 13:59:52 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+WwAeziGN4EfPAWfA0fieAjfcxfi29=StOx0GeKjAe_g@mail.gmail.com>
Message-ID: <CAL_Jsq+WwAeziGN4EfPAWfA0fieAjfcxfi29=StOx0GeKjAe_g@mail.gmail.com>
Subject: Re: [PATCH 1/1] of/pci: Add IORESOURCE_MEM_64 to resource flags for
 64-bit memory addresses
To: Leonardo Bras <leobras.c@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frank Rowand <frowand.list@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 PCI <linux-pci@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+PPC and PCI lists

On Thu, Apr 15, 2021 at 1:01 PM Leonardo Bras <leobras.c@gmail.com> wrote:
>
> Many other resource flag parsers already add this flag when the input
> has bits 24 & 25 set, so update this one to do the same.

Many others? Looks like sparc and powerpc to me. Those would be the
ones I worry about breaking. Sparc doesn't use of/address.c so it's
fine. Powerpc version of the flags code was only fixed in 2019, so I
don't think powerpc will care either.

I noticed both sparc and powerpc set PCI_BASE_ADDRESS_MEM_TYPE_64 in
the flags. AFAICT, that's not set anywhere outside of arch code. So
never for riscv, arm and arm64 at least. That leads me to
pci_std_update_resource() which is where the PCI code sets BARs and
just copies the flags in PCI_BASE_ADDRESS_MEM_MASK ignoring
IORESOURCE_* flags. So it seems like 64-bit is still not handled and
neither is prefetch.

> Some devices (like virtio-net) have more than one memory resource
> (like MMIO32 and MMIO64) and without this flag it would be needed to
> verify the address range to know which one is which.
>
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  drivers/of/address.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 73ddf2540f3f..dc7147843783 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -116,9 +116,12 @@ static unsigned int of_bus_pci_get_flags(const __be32 *addr)
>                 flags |= IORESOURCE_IO;
>                 break;
>         case 0x02: /* 32 bits */
> -       case 0x03: /* 64 bits */
>                 flags |= IORESOURCE_MEM;
>                 break;
> +
> +       case 0x03: /* 64 bits */
> +               flags |= IORESOURCE_MEM | IORESOURCE_MEM_64;
> +               break;
>         }
>         if (w & 0x40000000)
>                 flags |= IORESOURCE_PREFETCH;
> --
> 2.30.2
>
