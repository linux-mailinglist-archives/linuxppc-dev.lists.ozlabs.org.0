Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763CB5336B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 08:24:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Lcn0Pqrz3bmH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 16:24:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DiEqRXuQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=ritesh.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DiEqRXuQ; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Kvd57KDz3bYG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 15:51:56 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id gz24so781074pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 22:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sGMC9J3i2A0JEMEBRMvIAV6dTYRQjIEP1weGgAQj+xI=;
 b=DiEqRXuQ0GoU9KOzRPRrrP85Totp4N3hDUUUgE0VkGyrk02TPDqDfZBf70fDXvngz0
 mRai2GwSRPKbCa31jEvrNpaxeYx36xCanlyV1jjlbx98ff9RWsD6vnYfgrUPrtW7T7kt
 42JTkzlNn1glDLKL3mN5I69G1L1fgFFgtjELNHlXMA9xZkSV5ip/IzmXs8EG2kRn/BV4
 k+u4LL7A/ObwbTk+/E5XNX82YHAVXOMHdR0sGY0oaBIJEk6sw415oGineHm28+2MAsy+
 jz1lMhLLi6AEbMMo26XkRoKRnvYWV1OYi1nNcCotDO2m78AXiwHkYO1Z4hpj0hR1xiUI
 LfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sGMC9J3i2A0JEMEBRMvIAV6dTYRQjIEP1weGgAQj+xI=;
 b=WcDjqLtmxcyldbSKURSI8st5RKlp5lXSFwoJcY6ejv0GtHTgWqyw2ESN8uE2inH30T
 IKaCSSiyymqOgTlkYgIRAV1ZDKpYVp4etr1kMt+1oNak7WCzUbNfsvAJtc1eYcmQWLLc
 KUYpcXFXg9gtpHi3pAMLStv2jwveewqXxpQLX+h7OR0mL9wMYBl3/oIgHUMn54XCCV/n
 pRtw1ZHGRFnhV6J8lbMxou2Ms4zgy3LGG54uFuIuVMTj2G65+6os+6oaVWmR08sHD8Nj
 cwqKmYmTHUw9YnomW5uT4qrfYMB83zQIil1yPRF/95+V1I2n8O63TwOEB1ntLppz2CvP
 C1Vg==
X-Gm-Message-State: AOAM5323KWEZH6YSHfveuxgCEyoGWBth/8VUiUe7oS2SwcvRjdPPkD/I
 Kn6hVRlvLTBPzKCkfotv6o8=
X-Google-Smtp-Source: ABdhPJxNwMIEFHQuS5DfF434R//xq5CeNTJMpPj7HDMaFR3KodwuH3+S+ROhhzxSfE9XyFoU1wt8SA==
X-Received: by 2002:a17:90b:1e46:b0:1e0:10de:f8e4 with SMTP id
 pi6-20020a17090b1e4600b001e010def8e4mr8587987pjb.7.1653457914739; 
 Tue, 24 May 2022 22:51:54 -0700 (PDT)
Received: from localhost ([2406:7400:63:4576:a782:286b:de51:79ce])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a170902821100b0015e8d4eb2a8sm8134043pln.242.2022.05.24.22.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 22:51:54 -0700 (PDT)
Date: Wed, 25 May 2022 11:21:49 +0530
From: Ritesh Harjani <ritesh.list@gmail.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v2] of: check previous kernel's ima-kexec-buffer against
 memory bounds
Message-ID: <20220525055149.f4nqx2ocnh3pqnpr@riteshh-domain>
References: <20220524055042.1527968-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524055042.1527968-1-vaibhav@linux.ibm.com>
X-Mailman-Approved-At: Wed, 25 May 2022 16:23:36 +1000
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Just a minor nit which I noticed.

On 22/05/24 11:20AM, Vaibhav Jain wrote:
> Presently ima_get_kexec_buffer() doesn't check if the previous kernel's
> ima-kexec-buffer lies outside the addressable memory range. This can result
> in a kernel panic if the new kernel is booted with 'mem=X' arg and the
> ima-kexec-buffer was allocated beyond that range by the previous kernel.
> The panic is usually of the form below:
>
> $ sudo kexec --initrd initrd vmlinux --append='mem=16G'
>
> <snip>
>  BUG: Unable to handle kernel data access on read at 0xc000c01fff7f0000
>  Faulting instruction address: 0xc000000000837974
>  Oops: Kernel access of bad area, sig: 11 [#1]
> <snip>
>  NIP [c000000000837974] ima_restore_measurement_list+0x94/0x6c0
>  LR [c00000000083b55c] ima_load_kexec_buffer+0xac/0x160
>  Call Trace:
>  [c00000000371fa80] [c00000000083b55c] ima_load_kexec_buffer+0xac/0x160
>  [c00000000371fb00] [c0000000020512c4] ima_init+0x80/0x108
>  [c00000000371fb70] [c0000000020514dc] init_ima+0x4c/0x120
>  [c00000000371fbf0] [c000000000012240] do_one_initcall+0x60/0x2c0
>  [c00000000371fcc0] [c000000002004ad0] kernel_init_freeable+0x344/0x3ec
>  [c00000000371fda0] [c0000000000128a4] kernel_init+0x34/0x1b0
>  [c00000000371fe10] [c00000000000ce64] ret_from_kernel_thread+0x5c/0x64
>  Instruction dump:
>  f92100b8 f92100c0 90e10090 910100a0 4182050c 282a0017 3bc00000 40810330
>  7c0802a6 fb610198 7c9b2378 f80101d0 <a1240000> 2c090001 40820614 e9240010
>  ---[ end trace 0000000000000000 ]---
>
> Fix this issue by checking returned PFN range of previous kernel's
> ima-kexec-buffer with pfn_valid to ensure correct memory bounds.
>
> Fixes: 467d27824920 ("powerpc: ima: get the kexec buffer passed by the previous kernel")
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Prakhar Srivastava <prsriva@linux.microsoft.com>
> Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>
> ---
> Changelog
> ==========
>
> v2:
> * Instead of using memblock to determine the valid bounds use pfn_valid() to do
> so since memblock may not be available late after the kernel init. [ Mpe ]
> * Changed the patch prefix from 'powerpc' to 'of' [ Mpe ]
> * Updated the 'Fixes' tag to point to correct commit that introduced this
> function. [ Rob ]
> * Fixed some whitespace/tab issues in the patch description [ Rob ]
> * Added another check for checking ig 'tmp_size' for ima-kexec-buffer is > 0
> ---
>  drivers/of/kexec.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
> index 8d374cc552be..879e984fe901 100644
> --- a/drivers/of/kexec.c
> +++ b/drivers/of/kexec.c
> @@ -126,6 +126,7 @@ int ima_get_kexec_buffer(void **addr, size_t *size)
>  {
>  	int ret, len;
>  	unsigned long tmp_addr;
> +	unsigned int start_pfn, end_pfn;

^^^ Shouldn't this be unsigned long?

-ritesh

>  	size_t tmp_size;
>  	const void *prop;
>
> @@ -140,6 +141,22 @@ int ima_get_kexec_buffer(void **addr, size_t *size)
>  	if (ret)
>  		return ret;
>
> +	/* Do some sanity on the returned size for the ima-kexec buffer */
> +	if (!tmp_size)
> +		return -ENOENT;
> +
> +	/*
> +	 * Calculate the PFNs for the buffer and ensure
> +	 * they are with in addressable memory.
> +	 */
> +	start_pfn = PHYS_PFN(tmp_addr);
> +	end_pfn = PHYS_PFN(tmp_addr + tmp_size - 1);
> +	if (!pfn_valid(start_pfn) || !pfn_valid(end_pfn)) {
> +		pr_warn("IMA buffer at 0x%lx, size = 0x%zx beyond memory\n",
> +			tmp_addr, tmp_size);
> +		return -EINVAL;
> +	}
> +
>  	*addr = __va(tmp_addr);
>  	*size = tmp_size;
>
> --
> 2.35.1
>
