Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6E27E9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 15:47:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458rRK0C5bzDql2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 23:47:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458rNR2ybnzDqgX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 23:45:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 458rNP4ZTkz9s5c;
 Thu, 23 May 2019 23:45:09 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 ajd@linux.ibm.com, arbab@linux.ibm.com, aik@ozlabs.ru
Subject: Re: [PATCH] powerpc/powernv: Show checkstop reason for NPU2 HMIs
In-Reply-To: <20190523122804.4801-1-fbarrat@linux.ibm.com>
References: <20190523122804.4801-1-fbarrat@linux.ibm.com>
Date: Thu, 23 May 2019 23:45:09 +1000
Message-ID: <87blztqo7u.fsf@concordia.ellerman.id.au>
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
Cc: clombard@linux.ibm.com, groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Frederic Barrat <fbarrat@linux.ibm.com> writes:

> If the kernel is notified of an HMI caused by the NPU2, it's currently
> not being recognized and it logs the default message:
>
>     Unknown Malfunction Alert of type 3
>
> The NPU on Power 9 has 3 Fault Isolation Registers, so that's a lot of
> possible causes, but we should at least log that it's an NPU problem
> and report which FIR and which bit were raised if opal gave us the
> information.
>
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>
> Could be merged independently from (the opal-api.h change is already
> in the skiboot tree), but works better with, the matching skiboot
> change:
> http://patchwork.ozlabs.org/patch/1104076/

Well it *must* work with or without the skiboot change, because old/new
kernels will run on old/new skiboots.

It looks like it will work fine, we just won't get any extra information
in xstop_reason, right?

cheers

> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
> index e1577cfa7186..2492fe248e1e 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -568,6 +568,7 @@ enum OpalHMI_XstopType {
>  	CHECKSTOP_TYPE_UNKNOWN	=	0,
>  	CHECKSTOP_TYPE_CORE	=	1,
>  	CHECKSTOP_TYPE_NX	=	2,
> +	CHECKSTOP_TYPE_NPU	=	3
>  };
>  
>  enum OpalHMI_CoreXstopReason {
> diff --git a/arch/powerpc/platforms/powernv/opal-hmi.c b/arch/powerpc/platforms/powernv/opal-hmi.c
> index 586ec71a4e17..de12a240b477 100644
> --- a/arch/powerpc/platforms/powernv/opal-hmi.c
> +++ b/arch/powerpc/platforms/powernv/opal-hmi.c
> @@ -149,6 +149,43 @@ static void print_nx_checkstop_reason(const char *level,
>  					xstop_reason[i].description);
>  }
>  
> +static void print_npu_checkstop_reason(const char *level,
> +					struct OpalHMIEvent *hmi_evt)
> +{
> +	uint8_t reason, reason_count, i;
> +
> +	/*
> +	 * We may not have a checkstop reason on some combination of
> +	 * hardware and/or skiboot version
> +	 */
> +	if (!hmi_evt->u.xstop_error.xstop_reason) {
> +		printk("%s	NPU checkstop on chip %x\n", level,
> +			be32_to_cpu(hmi_evt->u.xstop_error.u.chip_id));
> +		return;
> +	}
> +
> +	/*
> +	 * NPU2 has 3 FIRs. Reason encoded on a byte as:
> +	 *   2 bits for the FIR number
> +	 *   6 bits for the bit number
> +	 * It may be possible to find several reasons.
> +	 *
> +	 * We don't display a specific message per FIR bit as there
> +	 * are too many and most are meaningless without the workbook
> +	 * and/or hw team help anyway.
> +	 */
> +	reason_count = sizeof(hmi_evt->u.xstop_error.xstop_reason) /
> +		sizeof(reason);
> +	for (i = 0; i < reason_count; i++) {
> +		reason = (hmi_evt->u.xstop_error.xstop_reason >> (8 * i)) & 0xFF;
> +		if (reason)
> +			printk("%s	NPU checkstop on chip %x: FIR%d bit %d is set\n",
> +				level,
> +				be32_to_cpu(hmi_evt->u.xstop_error.u.chip_id),
> +				reason >> 6, reason & 0x3F);
> +	}
> +}
> +
>  static void print_checkstop_reason(const char *level,
>  					struct OpalHMIEvent *hmi_evt)
>  {
> @@ -160,6 +197,9 @@ static void print_checkstop_reason(const char *level,
>  	case CHECKSTOP_TYPE_NX:
>  		print_nx_checkstop_reason(level, hmi_evt);
>  		break;
> +	case CHECKSTOP_TYPE_NPU:
> +		print_npu_checkstop_reason(level, hmi_evt);
> +		break;
>  	default:
>  		printk("%s	Unknown Malfunction Alert of type %d\n",
>  		       level, type);
> -- 
> 2.21.0
