Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7752FD789
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 18:54:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLY7H2g9zzDqlw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 04:54:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=FjAfLsSy; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLY4f4FNszDqjQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 04:52:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=+PVp3ta0WjC0TXJF4d2xbzQfNDYRHuF/qzM1UrQhb/w=; b=FjAfLsSy+2CNVXeEZwe03ra1jt
 B6QHrL6tVmursLRUvc76d9gLKVlK2YgI+kpun4cBfpiMG9k/Gon0ZV47qeqHCGLjhbEN+wDQT7GT9
 YPyVqPHgQhChPn/VfXGEYZFArkb847ZTjY0UikX5H93R1uGnChmgCixSfXDoWRx4XTwODA9KwW8+d
 m9/tdlyth1m5q9e/6qk+MUCyujVVyRO1HY5/cJ/yclrdD117cyWCkdO8LrNSTONI1kcOtpf1x0h0z
 p2ocncmN4nviDKPr9gVriFMeUmY9MaNtTRhUQxAQ5V3abodSuDDzoBrOm/qvsOK+2dH+KTRG/1MpT
 kmYC1tDQ==;
Received: from [2601:1c0:6280:3f0::9abc]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2He8-0001SU-En; Wed, 20 Jan 2021 17:51:56 +0000
Subject: Re: [PATCH] arch: powerpc: mm: book3s64: Fixed spelling architectue
 -> architecture in line number 1061
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, akpm@linux-foundation.org,
 rppt@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20210120142020.2623355-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <540548b6-a7b3-9a5b-67ee-17d18395ddb6@infradead.org>
Date: Wed, 20 Jan 2021 09:51:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210120142020.2623355-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/20/21 6:20 AM, Bhaskar Chowdhury wrote:
> s/architectue/architecture/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

Line number in $Subject is just too much.

> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 98f0b243c1ab..8b8f1451e944 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1058,7 +1058,7 @@ void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
>  		 * Book3S does not require a TLB flush when relaxing access
>  		 * restrictions when the address space is not attached to a
>  		 * NMMU, because the core MMU will reload the pte after taking
> -		 * an access fault, which is defined by the architectue.
> +		 * an access fault, which is defined by the architecture.
>  		 */
>  	}
>  	/* See ptesync comment in radix__set_pte_at */
> --
> 2.30.0
> 


-- 
~Randy
"He closes his eyes and drops the goggles.  You can't get hurt
by looking at a bitmap.  Or can you?"
(Neal Stephenson: Snow Crash)
