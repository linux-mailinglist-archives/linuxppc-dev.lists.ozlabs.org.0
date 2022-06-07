Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DCD540F68
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 21:08:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHfyK5Ctnz3c7P
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 05:08:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.44; helo=mail-io1-f44.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHfxv4dDcz3bfC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 05:07:46 +1000 (AEST)
Received: by mail-io1-f44.google.com with SMTP id a10so16502842ioe.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jun 2022 12:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FfDC8OCE89M5DmQOiwz11rqXI91cPiUhxnizP3Vecs4=;
        b=19I1I5mvwXv5syYH+DxCyfgfzlWU49q4L0Us3vXO4zxMUwBcmu0DKb6nGK1ZXgWhhH
         6P0pGaWD3hgVc6hayXnmoZyu6jacsyBUlVC3v+7vExcBN1uyUS6gkdcJjzHj5fmaayxw
         Ex9i6LkLyrly6WF2KToe1/R0bDExEd5yaJIKRJ066dGiQqSZMRhJihjtznGz/9k+Tus5
         vltLGlZLG90+n7rtU7M7YIm3Zl4/QCM1d0E2a3w7p8Pm5mLxg7pfTBpUeVmQsLV9Y2/V
         zz3MkMVhb6fBGXCpoAlolIV3GLi0i7NlCGkrtNFXBqfCDXpG8Qr/L2ueo17en1QZN4pK
         Retg==
X-Gm-Message-State: AOAM530b4uQbfmy7nNF5nOxttUzB5WgGOuG0uCi9yuh7f4gBiwydhehh
	fBIzckdTlW1ETy5xY4nh9g==
X-Google-Smtp-Source: ABdhPJyXN4BjBm3eZUFDX9fHMePl6YzIdSCERXPSC3Ydq6geCntnC7mEUdXSSQ2BbAKOjP5dYeuqbQ==
X-Received: by 2002:a05:6638:160a:b0:330:f07b:7c5d with SMTP id x10-20020a056638160a00b00330f07b7c5dmr17052629jas.222.1654628863838;
        Tue, 07 Jun 2022 12:07:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id k4-20020a926f04000000b002d52f2f5a97sm3143012ilc.35.2022.06.07.12.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 12:07:43 -0700 (PDT)
Received: (nullmailer pid 3646440 invoked by uid 1000);
	Tue, 07 Jun 2022 19:07:41 -0000
Date: Tue, 7 Jun 2022 13:07:41 -0600
From: Rob Herring <robh@kernel.org>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v3] of: check previous kernel's ima-kexec-buffer against
 memory bounds
Message-ID: <20220607190741.GA3644258-robh@kernel.org>
References: <20220531041446.3334259-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531041446.3334259-1-vaibhav@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>, linux-kernel@vger.kernel.org, Prakhar Srivastava <prsriva@linux.microsoft.com>, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 31 May 2022 09:44:46 +0530, Vaibhav Jain wrote:
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
> ima-kexec-buffer with page_is_ram() to ensure correct memory bounds.
> 
> Fixes: 467d27824920 ("powerpc: ima: get the kexec buffer passed by the previous kernel")
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Prakhar Srivastava <prsriva@linux.microsoft.com>
> Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Ritesh Harjani <ritesh.list@gmail.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog
> ==========
> v3:
> * change the type for {start,end}_pfn to unsigned long [ Ritesh ]
> * Switched to page_is_ram() from pfn_vaild() [ Rob ]
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

Applied, thanks!
