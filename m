Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E37ED3F585E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 08:40:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtzyQ2PYZz2yLX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 16:40:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WLu+SR/r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=WLu+SR/r; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gtzxk05VVz2xqy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 16:40:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gtzxb3dWYz9sXk;
 Tue, 24 Aug 2021 16:40:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629787203;
 bh=vCuiZFSJ6cWBv+pHZHkJiirLDqi57AbEb2sqYmRf84Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WLu+SR/r3TeUbm9uCVDcIyHKv0SFDsyfeGVmd8TTePK1SDGcYydUIgwGoklwXPZvB
 6nosheQoq+tqeHmtqAV0lBUQheIkqVv53P/6fIe0eknIZ9M+Ete1cm3bn9/bozzxhe
 hdcNkptQR4bWcaa5NWEJHT4XUP6tfhPZX+a8rif9wBhmaEbD8pKsyP29xZgF/jQ7kc
 lhl9ROtekSK6xOlhnPMVmafFm1ock4Q1vNgqccnNPi6cwfFwT+k9rYc0v1UbJxpZ/V
 hAp8zj3W9ODOIm804R4h63H6dCnVx3wRNX6QWdGc1FvRPy1IVzXj7cDohUFQCkmU8r
 PihwvB9LAx/gA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/3] powerpc/pseries: Parse control memory access error
In-Reply-To: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
References: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
Date: Tue, 24 Aug 2021 16:39:57 +1000
Message-ID: <87eeajcpmq.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ganesh,

Some comments below ...

Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
> Add support to parse and log control memory access
> error for pseries.
>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
> v2: No changes in this patch.
> ---
>  arch/powerpc/platforms/pseries/ras.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index 167f2e1b8d39..608c35cad0c3 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -80,6 +80,7 @@ struct pseries_mc_errorlog {
>  #define MC_ERROR_TYPE_TLB		0x04
>  #define MC_ERROR_TYPE_D_CACHE		0x05
>  #define MC_ERROR_TYPE_I_CACHE		0x07
> +#define MC_ERROR_TYPE_CTRL_MEM_ACCESS	0x08
...
>  
> +#define MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK	0
> +#define MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS	1


Where do the above values come from?

> +
>  static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
>  {
>  	switch (mlog->error_type) {
> @@ -112,6 +116,8 @@ static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
>  	case	MC_ERROR_TYPE_ERAT:
>  	case	MC_ERROR_TYPE_TLB:
>  		return (mlog->sub_err_type & 0x03);
> +	case	MC_ERROR_TYPE_CTRL_MEM_ACCESS:
> +		return (mlog->sub_err_type & 0x70) >> 4;

Can you add to the comment above sub_err_type explaining what these bits are.

>  	default:
>  		return 0;
>  	}
> @@ -699,6 +705,21 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
>  	case MC_ERROR_TYPE_I_CACHE:
>  		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
>  		break;
> +	case MC_ERROR_TYPE_CTRL_MEM_ACCESS:
> +		mce_err.error_type = MCE_ERROR_TYPE_RA;
> +		if (mce_log->sub_err_type & 0x80)

This appears many times in the file.

Can we add eg. MC_EFFECTIVE_ADDR_PROVIDED?

> +			eaddr = be64_to_cpu(mce_log->effective_address);
> +		switch (err_sub_type) {
> +		case MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK:
> +			mce_err.u.ra_error_type =
> +				MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN;

That name is ridiculously long, but I guess that's not your fault :)
We can fix it up in a later patch.

> +			break;
> +		case MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS:
> +			mce_err.u.ra_error_type =
> +				MCE_RA_ERROR_LOAD_STORE_FOREIGN;
> +			break;
> +		}
> +		break;

cheers
