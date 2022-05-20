Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D01A52F5AC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 00:30:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4hJb03lkz3cf7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 08:30:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.175;
 helo=mail-oi1-f175.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4hJ70fVZz3089
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 08:30:30 +1000 (AEST)
Received: by mail-oi1-f175.google.com with SMTP id e189so11500653oia.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 15:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yAH35NztMeTEfMFTmXwja5V6GOzT9SNXTR9iCz4tUf8=;
 b=PdDuL8MWrwaTddkzTG6RDG935OjWhbPRi7B0KIthlMdGTqVRftKtN/9X6rmxsY0DOj
 yCPJ4XuxXpkt0CrbucETlSFmHMiww9zIL6N986fpwamv9zBaYv3BxRHoyalY754iOF/r
 vJmPlgfJsKyXtCwhrth1cmidtoQDWZ6Y9ZkTo/qEkJxadhvNogNck2A6S8Vh0g76n8XJ
 6GE4cUjRQQ6LHKw4Z+2OWMZleLmVVk5Igv1Q0Igpx/LqV3aueF23RNnvibLfI4bYB9wK
 M+mFv4balvfOPORockjk/Q0gulU1ziYYLOv4n/Ones3eKlbN+LCDnZpGE/3zyXGL9zrM
 vYfg==
X-Gm-Message-State: AOAM533dfQxSLaaZ772A0lu8x44yjoc5LN+lZNsEuB5kqRMjHUhrpRcv
 RC2Ct8h3c5uYtFMQwOJT6Q==
X-Google-Smtp-Source: ABdhPJyDMR51bQl2CqTnIeEK+38p1oOztUP+uY5UJ8k5XNxsSYWu9K5hJBYWCUYyD4HgXi9B9T27oQ==
X-Received: by 2002:a05:6808:6da:b0:325:9a3d:463c with SMTP id
 m26-20020a05680806da00b003259a3d463cmr6383330oih.206.1653085826975; 
 Fri, 20 May 2022 15:30:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 61-20020a9d0c43000000b0060603221245sm1461293otr.21.2022.05.20.15.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 15:30:26 -0700 (PDT)
Received: (nullmailer pid 369508 invoked by uid 1000);
 Fri, 20 May 2022 22:30:25 -0000
Date: Fri, 20 May 2022 17:30:25 -0500
From: Rob Herring <robh@kernel.org>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH] powerpc: check previous kernel's ima-kexec-buffer
 against memory bounds
Message-ID: <20220520223025.GA359803-robh@kernel.org>
References: <20220518200547.655788-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518200547.655788-1-vaibhav@linux.ibm.com>
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
 linux-kernel@vger.kernel.org, Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linuxppc-dev@lists.ozlabs.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 19, 2022 at 01:35:47AM +0530, Vaibhav Jain wrote:
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
> Fix this issue by checking returned address/size of previous kernel's
> ima-kexec-buffer against memblock's memory bounds.
> 
> Fixes: fee3ff99bc67("powerpc: Move arch independent ima kexec functions to
> drivers/of/kexec.c")

Your mailer (and/or you) corrupted this. There should be a space between 
the commit hash and subject, and it should not be wrapped.

It should also not have a blank line here.

But more importantly, how did this commit introduce the problem? It just 
moved the code and didn't have any such check.

> 
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Prakhar Srivastava <prsriva@linux.microsoft.com>
> Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  drivers/of/kexec.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
> index b9bd1cff1793..c73007eda52d 100644
> --- a/drivers/of/kexec.c
> +++ b/drivers/of/kexec.c
> @@ -140,6 +140,13 @@ int ima_get_kexec_buffer(void **addr, size_t *size)
>  	if (ret)
>  		return ret;
>  
> +	/* if the ima-kexec-buffer goes beyond the addressable memory */
> +	if (!memblock_is_region_memory(tmp_addr, tmp_size)) {
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
> 
