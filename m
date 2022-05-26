Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E923534861
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 03:53:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7rYd2Lmwz3bqt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 11:53:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.54; helo=mail-ot1-f54.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7rYB3mdtz2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 11:52:44 +1000 (AEST)
Received: by mail-ot1-f54.google.com with SMTP id 30-20020a9d0121000000b0060ae97b9967so140456otu.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 18:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nIzC1T+B7FDF0YpbJTKwhnFmPynXYVhFmPj3hCsebHQ=;
        b=N31oKgvaCGHurRGM/QL9KnPm5UL7X0jFT/xJb3RjRTyG63DkhbY8sS1JBHPSEo0Jlr
         6/oQGVBEbNf673qKMhPysWJDCEcgtn7PELhKjVU85EFcNLrANFuDDIVuKSRI03BYRZVN
         ptJIJg01lYC96bBNvExm6MExTUOjlRCRDm5D6ihUOUuoV+W9lKHgCwo8Nm9FTlGfDf/Z
         AJ8vxiVhjX1T3WVedB7kIO3U4vKHxfSKhCzldewAV2kOSeK3KHqTA/GrMckWDlgtBd48
         kLdG0ydeJ2ci9N4z+Pqq92jHrWv6vhlsVu9IyU7+YkIQy0x0dHeZdZCD6lpHwQR/hE+U
         cByg==
X-Gm-Message-State: AOAM533BYKrJnots+AIdGV+Bx4+K8C4nw3bkbiJGPJO+1v+j9Ra1GK9Z
	DMuuzEF5026GQkV8TB5DnA==
X-Google-Smtp-Source: ABdhPJyGLVz2XIk37MGgjfeDK1wCmyQfKDhVcWU1Z8taSkD/ZTIqKmAE+ecAPywpSuZCqzBNd8ypNA==
X-Received: by 2002:a05:6830:164d:b0:60b:3d2a:42de with SMTP id h13-20020a056830164d00b0060b3d2a42demr830293otr.373.1653529962148;
        Wed, 25 May 2022 18:52:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s3-20020a056808208300b0032ba39d8be6sm202565oiw.14.2022.05.25.18.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 18:52:41 -0700 (PDT)
Received: (nullmailer pid 2888797 invoked by uid 1000);
	Thu, 26 May 2022 01:52:40 -0000
Date: Wed, 25 May 2022 20:52:40 -0500
From: Rob Herring <robh@kernel.org>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v2] of: check previous kernel's ima-kexec-buffer against
 memory bounds
Message-ID: <20220526015240.GA2884362-robh@kernel.org>
References: <20220524055042.1527968-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524055042.1527968-1-vaibhav@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, Prakhar Srivastava <prsriva@linux.microsoft.com>, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 11:20:42AM +0530, Vaibhav Jain wrote:
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

pfn_valid() isn't necessarily RAM, only that you have a struct page 
AIUI. Maybe page_is_ram() instead?

Thanks to Robin for this.

Rob
