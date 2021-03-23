Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAB5346B90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 23:01:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4lhM5K4Jz30DQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 09:01:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Kcj1d5rL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=Kcj1d5rL; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4lgt57dtz30D3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 09:01:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=ssQLO61WHzovjKdnPCoQmV/RGBUr6XLqwV8AQTum3tk=; b=Kcj1d5rLpAV7WflXzEaGjSTP+G
 d2J5YGat7mhoq73KQEBTp3/FSD2FSZ2q0ObEXdF07h1i4JWGCxRHOsQCJi9/+X+vurzmx2EI1xBgb
 /eqxBFXYjohMRhrTcBPwPwvHKM1T7/z3IDcB5a+bf8uYbtyCUh0FmR04W/9XARi7VNZxGQZIpdHGJ
 pe4GN3IlhX28Ci9qbKM3ZWDqPn3jKEt23XOXaHWiZP/Dzu0/MHe/SpiqXHOlfJ/awELtSVV13Z9N+
 J7QHMdw4qTc6/KMKn092+atTxpkf86H33+gpNQdd4JQxVFnewZYbTQTmOX6k4Bx5JuHFOqY7v2WsD
 DyZN7dQA==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lOp5Q-00FohT-6E; Tue, 23 Mar 2021 22:01:17 +0000
Subject: Re: [PATCH] macintosh: A typo fix
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, benh@kernel.crashing.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20210323204652.23059-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d01060e9-8986-c23b-71d3-ada645500186@infradead.org>
Date: Tue, 23 Mar 2021 15:01:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323204652.23059-1-unixbhaskar@gmail.com>
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

On 3/23/21 1:46 PM, Bhaskar Chowdhury wrote:
> 
> s/coment/comment/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/macintosh/windfarm_smu_controls.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/macintosh/windfarm_smu_controls.c b/drivers/macintosh/windfarm_smu_controls.c
> index 79cb1ad09bfd..75966052819a 100644
> --- a/drivers/macintosh/windfarm_smu_controls.c
> +++ b/drivers/macintosh/windfarm_smu_controls.c
> @@ -94,7 +94,7 @@ static int smu_set_fan(int pwm, u8 id, u16 value)
>  		return rc;
>  	wait_for_completion(&comp);
> 
> -	/* Handle fallback (see coment above) */
> +	/* Handle fallback (see comment above) */
>  	if (cmd.status != 0 && smu_supports_new_fans_ops) {
>  		printk(KERN_WARNING "windfarm: SMU failed new fan command "
>  		       "falling back to old method\n");
> --


-- 
~Randy

