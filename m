Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C9252EA5E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 12:56:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4NvD6gccz3blH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 20:56:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X0TJNuKw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Ntf3tyCz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 20:55:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=X0TJNuKw; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L4Ntf1bPXz4xXj;
 Fri, 20 May 2022 20:55:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1653044154;
 bh=J55Hn2tykJEUIRkRu78ewdq+wYVweia4VHuCAM7nNzw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=X0TJNuKwS4dkPzFdW/sDDQvOcUaixy+oKF3FMslKdTLtrvP8cf9d81Isk1OuVtC1s
 unNiZWKTB7VPpYyX8O0+0l203KTozTtbVpTGmd8jRkDsQ4vyGffGlGmklw/ppPXbB5
 j6/+fNXF5C4+MCP7twy5aT6iGpro4vd19XXHg3rmgML/9afJrn0oI5ICcBn5IL6Vks
 t2GP7kFXHlZS0dMFK61UF3nxSzJ8seXPNtWe19qgybe2zQeDkCwEg7DAvY2DfNStAf
 j3xEELTkDM3cFk+k4I3Vf0rS8LLqU7xcqTpnbQs17ort1kEaFOXROAY6G5GsPcw3XK
 loR5lS7Tt6pfg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: check previous kernel's ima-kexec-buffer
 against memory bounds
In-Reply-To: <20220518200547.655788-1-vaibhav@linux.ibm.com>
References: <20220518200547.655788-1-vaibhav@linux.ibm.com>
Date: Fri, 20 May 2022 20:55:53 +1000
Message-ID: <87k0agmq12.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Rob Herring <robh@kernel.org>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Frank Rowand <frowand.list@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>
> [PATCH] powerpc: check previous kernel's ima-kexec-buffer against memory bounds

This isn't a powerpc patch, the subject should start with "of:".

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

Not all arches keep the memblock info around after boot.

I think this will be called too late, but I'd have to check the exact
timing to be sure.

I think you can use pfn_valid() instead?

cheers

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
