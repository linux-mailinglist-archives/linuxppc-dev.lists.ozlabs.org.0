Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA5A2CEE8D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 14:01:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnXrt0MTszDr5s
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 00:01:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnXfG1YJ1zDqHj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 23:52:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Y0kVGz7Q; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CnXfC1Jxzz9sWK;
 Fri,  4 Dec 2020 23:52:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607086323;
 bh=RU5vhtHTTgLXf+zJ6S91uu9NhL0KtnIIl9QlXXDIOVk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Y0kVGz7Q0+7DUeaHicRsX+V4p+BEsVp/s/zwxKJBntSqunXKCL1BtG8tO7qA0csTB
 WMA3FsBmkJKYGggFpT/+SQ4SYOsa11SxIahIOhjODKJhQjGbvqLCfnKNCqUYJY85LU
 DEqA32Vi7BDqcSensHfrMtWhY0AQGtbBkU6OXOIKqxOK7EjjNIfe17BLN1B9IeDTiy
 xmptWsI7tuEeM0b734JuRIpZTcDRUfwLLKYO/h2QUz2hKixFNYb2tWHcbVTBCu2Qf4
 LqTZ90wOIqnEbeUZaHOQ5ij2FhZtVkGr4/1NvhBggaqznXTwkN6nlOK78I80HX72yW
 stliWikLi5npQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 03/29] powerpc/rtas: complete ibm,suspend-me status codes
In-Reply-To: <20201030011805.1224603-4-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-4-nathanl@linux.ibm.com>
Date: Fri, 04 Dec 2020 23:52:01 +1100
Message-ID: <877dpxvimm.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> We don't completely account for the possible return codes for
> ibm,suspend-me. Add definitions for these.
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/rtas.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index 55f9a154c95d..f060181a0d32 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -23,11 +23,16 @@
>  #define RTAS_RMOBUF_MAX (64 * 1024)
>  
>  /* RTAS return status codes */
> -#define RTAS_NOT_SUSPENDABLE	-9004
>  #define RTAS_BUSY		-2    /* RTAS Busy */
>  #define RTAS_EXTENDED_DELAY_MIN	9900
>  #define RTAS_EXTENDED_DELAY_MAX	9905
>  
> +/* statuses specific to ibm,suspend-me */
> +#define RTAS_SUSPEND_ABORTED     9000 /* Suspension aborted */

This made me ... pause.

But it really is positive 9000, I checked PAPR.

cheers


> +#define RTAS_NOT_SUSPENDABLE    -9004 /* Partition not suspendable */
> +#define RTAS_THREADS_ACTIVE     -9005 /* Multiple processor threads active */
> +#define RTAS_OUTSTANDING_COPROC -9006 /* Outstanding coprocessor operations */
> +
>  /*
>   * In general to call RTAS use rtas_token("string") to lookup
>   * an RTAS token for the given string (e.g. "event-scan").
> -- 
> 2.25.4
