Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A880A7F5B87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 10:44:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=b4vWsEzq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbY9S4P3Yz3dLB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 20:44:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=b4vWsEzq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbY8d0hkFz3cVS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 20:43:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6E1A1CE1C20;
	Thu, 23 Nov 2023 09:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DA5C433C7;
	Thu, 23 Nov 2023 09:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700732617;
	bh=7AO36pcPwM7Yerei+BySWxe8GlzHgN7XBTJn/OJg4eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4vWsEzqapyJvagQQ7JKCDgL9TwPHTZJ0qokp/EcABOred9x4CEyvwCDTTec4sNCA
	 Mf2EXMgtJ6LMdFihLS0/YM55JQ0+Awdieq+gybvO3TeALrcA7YKehM2/eKv8oj+yAS
	 I8Ok5q580ZHA6inF1VHacaiVjdhnBPC/nWQai1lY=
Date: Thu, 23 Nov 2023 09:43:33 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhao Ke <ke.zhao@shingroup.cn>
Subject: Re: [PATCH v1] powerpc: Add PVN support for HeXin C2000 processor
Message-ID: <2023112317-ebook-dreamless-0cfe@gregkh>
References: <20231123093611.98313-1-ke.zhao@shingroup.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123093611.98313-1-ke.zhao@shingroup.cn>
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
Cc: luming.yu@shingroup.cn, ajd@linux.ibm.com, arnd@arndb.de, dawei.li@shingroup.cn, linux-kernel@vger.kernel.org, shenghui.qu@shingroup.cn, npiggin@gmail.com, kvm@vger.kernel.org, fbarrat@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 23, 2023 at 05:36:11PM +0800, Zhao Ke wrote:
> HeXin Tech Co. has applied for a new PVN from the OpenPower Community
> for its new processor C2000. The OpenPower has assigned a new PVN
> and this newly assigned PVN is 0x0066, add pvr register related
> support for this PVN.
> 
> Signed-off-by: Zhao Ke <ke.zhao@shingroup.cn>
> Link: https://discuss.openpower.foundation/t/how-to-get-a-new-pvr-for-processors-follow-power-isa/477/10
> ---
> 	v0 -> v1:
> 	- Fix .cpu_name with the correct description
> ---
> ---
>  arch/powerpc/include/asm/reg.h            |  1 +
>  arch/powerpc/kernel/cpu_specs_book3s_64.h | 15 +++++++++++++++
>  arch/powerpc/kvm/book3s_pr.c              |  1 +
>  arch/powerpc/mm/book3s64/pkeys.c          |  3 ++-
>  arch/powerpc/platforms/powernv/subcore.c  |  3 ++-
>  drivers/misc/cxl/cxl.h                    |  3 ++-
>  6 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 4ae4ab9090a2..7fd09f25452d 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -1361,6 +1361,7 @@
>  #define PVR_POWER8E	0x004B
>  #define PVR_POWER8NVL	0x004C
>  #define PVR_POWER8	0x004D
> +#define PVR_HX_C2000	0x0066
>  #define PVR_POWER9	0x004E
>  #define PVR_POWER10	0x0080
>  #define PVR_BE		0x0070

Why is this not in sorted order?

thanks,

greg k-h
