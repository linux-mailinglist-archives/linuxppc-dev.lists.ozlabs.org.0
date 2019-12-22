Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D66128D49
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2019 10:40:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47gcsn5LxRzDqV4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2019 20:40:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47gcr06SCWzDqSl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2019 20:38:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="n85fiOsG"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47gcqy2GwPz9sP3;
 Sun, 22 Dec 2019 20:38:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1577007536;
 bh=RBJy1kWVsZo+T0mOhiHBES+O0CcNsNgVcU5WlbLQWmM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=n85fiOsGjyE40GQx5qgQMAjJ72/x75ab6jJ4DhMaAzrWUnyr+knviOsVQYWWvUeMl
 bHn/UM5iga7H2xrW3isgGyzFJ2kDrWl4hl9PpK6hAi1i30QEclv9W/83h+/ikyYGcN
 /LZipv2d1vGWY1pd5WAPdJPrTpO5SDp0C/RgEs7x2GBRQQ+IJLrg42vyvIT9Gp5QC/
 4Ev2BmWmHQDvhkJJUmOssgg/0djtJzZ8lZz7+JHSXf1miWf2ktntHvctMvDWmNPai8
 MVZmetUU6J3dVXmvG6yAudqAtEpnYzIX+oC1oWl7dSLpfSS24vFo10AZzhJzyWksXU
 n8W/qByHIWFkQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: yingjie_bai@126.com, Scott Wood <oss@buserror.net>,
 Kumar Gala <galak@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/mpc85xx: also write addr_h to spin table for
 64bit boot entry
In-Reply-To: <1574694943-7883-1-git-send-email-yingjie_bai@126.com>
References: <1574694943-7883-1-git-send-email-yingjie_bai@126.com>
Date: Sun, 22 Dec 2019 20:38:51 +1100
Message-ID: <87pngglmxg.fsf@mpe.ellerman.id.au>
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
Cc: Bai Yingjie <byj.tea@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

yingjie_bai@126.com writes:
> From: Bai Yingjie <byj.tea@gmail.com>
>
> CPU like P4080 has 36bit physical address, its DDR physical
> start address can be configured above 4G by LAW registers.
>
> For such systems in which their physical memory start address was
> configured higher than 4G, we need also to write addr_h into the spin
> table of the target secondary CPU, so that addr_h and addr_l together
> represent a 64bit physical address.
> Otherwise the secondary core can not get correct entry to start from.
>
> This should do no harm for normal case where addr_h is all 0.
>
> Signed-off-by: Bai Yingjie <byj.tea@gmail.com>
> ---
>  arch/powerpc/platforms/85xx/smp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
> index 8c7ea2486bc0..f12cdd1e80ff 100644
> --- a/arch/powerpc/platforms/85xx/smp.c
> +++ b/arch/powerpc/platforms/85xx/smp.c
> @@ -252,6 +252,14 @@ static int smp_85xx_start_cpu(int cpu)
>  	out_be64((u64 *)(&spin_table->addr_h),
>  		__pa(ppc_function_entry(generic_secondary_smp_init)));
>  #else
> +	/*
> +	 * We need also to write addr_h to spin table for systems
> +	 * in which their physical memory start address was configured
> +	 * to above 4G, otherwise the secondary core can not get
> +	 * correct entry to start from.
> +	 * This does no harm for normal case where addr_h is all 0.
> +	 */
> +	out_be32(&spin_table->addr_h, __pa(__early_start) >> 32);
>  	out_be32(&spin_table->addr_l, __pa(__early_start));

This breaks the corenet32_smp_defconfig build:

  /linux/arch/powerpc/platforms/85xx/smp.c: In function 'smp_85xx_start_cpu':
  /linux/arch/powerpc/platforms/85xx/smp.c:262:52: error: right shift count >= width of type [-Werror=shift-count-overflow]
    262 |  out_be32(&spin_table->addr_h, __pa(__early_start) >> 32);
        |                                                    ^~
  cc1: all warnings being treated as errors

cheers
