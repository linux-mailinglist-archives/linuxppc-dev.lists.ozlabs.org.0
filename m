Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F7A89B338
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Apr 2024 19:09:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zeopEdwY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCJcT1JNtz3dXY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 03:09:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zeopEdwY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCJbm6BW6z30dn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 03:09:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=+fxnBVhanUSoVIeyzpQeK27okAoyT0oHwXLPuW0J+sI=; b=zeopEdwYPtTXjsU6dTEoVTCB0j
	sF1dnlC1A4bHIZtRRTwyNwwGlO1AawXs3nJz6E0inBC4GRNKURR4RKdxvQcdLR3ccG7HH6r45HEVX
	MzaYTvd8OIO+soGjAwH8s3kO+Tuj5aQUKyqdfI0vfGwHNfhAZPvO66TWDHCCrVIQNgQgDw63MHaP/
	Yqd2WKWT1ajPBcExTdhy+dxjr4AFTlmi4YI8VzRhHz38aK2FUgZc0D639g2LDKMN6UyVrUOa1gCiR
	XHsNRtVoh4oQ6uyy6fe/wicRcVC5A6lavpyZRDE2JHUE+cD6IXCHTnR5JsFPcEk8muiijB2YI7Mzy
	lX4FLKrA==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtW0u-0000000D6z8-2cT9;
	Sun, 07 Apr 2024 17:09:04 +0000
Message-ID: <adbb10d5-fa43-4d58-9395-0c574e3c3d7e@infradead.org>
Date: Sun, 7 Apr 2024 10:09:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 2/3] powerpc: Fix kernel-doc comments in fsl_gtm.c
To: Yang Li <yang.lee@linux.alibaba.com>, arnd@arndb.de, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
References: <20240407063952.36270-1-yang.lee@linux.alibaba.com>
 <20240407063952.36270-2-yang.lee@linux.alibaba.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240407063952.36270-2-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/6/24 11:39 PM, Yang Li wrote:
> Fix some function names in kernel-doc comments.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  arch/powerpc/sysdev/fsl_gtm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/fsl_gtm.c b/arch/powerpc/sysdev/fsl_gtm.c
> index 39186ad6b3c3..71e07883eb48 100644
> --- a/arch/powerpc/sysdev/fsl_gtm.c
> +++ b/arch/powerpc/sysdev/fsl_gtm.c
> @@ -77,7 +77,7 @@ struct gtm {
>  static LIST_HEAD(gtms);
>  
>  /**
> - * gtm_get_timer - request GTM timer to use it with the rest of GTM API
> + * gtm_get_timer16 - request GTM timer to use it with the rest of GTM API

ack

>   * Context:	non-IRQ
>   *
>   * This function reserves GTM timer for later use. It returns gtm_timer
> @@ -110,7 +110,7 @@ struct gtm_timer *gtm_get_timer16(void)
>  EXPORT_SYMBOL(gtm_get_timer16);
>  
>  /**
> - * gtm_get_specific_timer - request specific GTM timer
> + * gtm_get_specific_timer16 - request specific GTM timer

ack

>   * @gtm:	specific GTM, pass here GTM's device_node->data
>   * @timer:	specific timer number, Timer1 is 0.
>   * Context:	non-IRQ
> @@ -276,7 +276,7 @@ EXPORT_SYMBOL(gtm_set_timer16);
>   * crop precision of the "usec" argument, thus usec is limited to 16 bits
>   * (single timer width).
>   */
> -int gtm_set_exact_timer16(struct gtm_timer *tmr, u16 usec, bool reload)
> +int gtm_set_exact_utimer16(struct gtm_timer *tmr, u16 usec, bool reload)

No, change the kernel-doc comment instead. Otherwise the caller will fail to link.

>  {
>  	/* quite obvious, frequency which is enough for µSec precision */
>  	const int freq = 1000000;

thanks.
-- 
#Randy
