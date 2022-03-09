Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966A4D2636
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 04:25:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCyHx6NJLz3bXD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 14:25:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dsKXnzSv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCyHM03X9z2yws
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 14:24:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dsKXnzSv; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCyHD0jbFz4xnG;
 Wed,  9 Mar 2022 14:24:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646796281;
 bh=jA4RiuIh/f47BYlpUkLuQwhFdbeXYuWZfOEPcAm6HhI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dsKXnzSv+MGrSkitjJwrrc5m6QQatmio+EFM0m5Z9vPAno+CM0gp/0VcWPrfT//ei
 q1mHsJuJJ/M4wYWV5pwiSJNnGbjqJJKeKb054iUY3ipTne5jXi0+5MVluNwyc+l/gT
 uImilHKvAtrhcC0kUUDw6faxUTdt9lqQPxL4rtDz9jI7Dc5fLIecCAUDfk0RbmuO5t
 XYBrrbYT6GS2XPgl95GXdfbp40KC9/fNo6ESWPRCL8Wdy8GbuuggRYdk0U31FtE49t
 KOHiIn2REEj8jIVm5WxJ7V3lqHESdTD5zSH33WISIG19yqK0U1mxW/mhVCXyBa/Dug
 zUUiPg6XWJvLg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hangyu Hua <hbh25y@gmail.com>, christophe.leroy@csgroup.eu,
 benh@kernel.crashing.org, paulus@samba.org, peng.hao2@zte.com.cn,
 wen.yang99@zte.com.cn
Subject: Re: [PATCH] powerpc: 8xx: fix a return value error in mpc8xx_pic_init
In-Reply-To: <20220223070223.26845-1-hbh25y@gmail.com>
References: <20220223070223.26845-1-hbh25y@gmail.com>
Date: Wed, 09 Mar 2022 14:24:39 +1100
Message-ID: <87o82fn6yw.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Hangyu Hua <hbh25y@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hangyu Hua <hbh25y@gmail.com> writes:
> mpc8xx_pic_init() should return -ENOMEM instead of 0 when
> irq_domain_add_linear() return NULL. This cause mpc8xx_pics_init to continue
> executing even if mpc8xx_pic_host is NULL.
>
> Fixes: cc76404feaed ("powerpc/8xx: Fix possible device node reference leak")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
>  arch/powerpc/platforms/8xx/pic.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platforms/8xx/pic.c
> index f2ba837249d6..04a6abf14c29 100644
> --- a/arch/powerpc/platforms/8xx/pic.c
> +++ b/arch/powerpc/platforms/8xx/pic.c
> @@ -153,6 +153,7 @@ int __init mpc8xx_pic_init(void)

Expanding the context:

	siu_reg = ioremap(res.start, resource_size(&res));
	if (siu_reg == NULL) {
		ret = -EINVAL;
		goto out;
	}

	mpc8xx_pic_host = irq_domain_add_linear(np, 64, &mpc8xx_pic_host_ops, NULL);
>  	if (mpc8xx_pic_host == NULL) {
>  		printk(KERN_ERR "MPC8xx PIC: failed to allocate irq host!\n");
>  		ret = -ENOMEM;
> +		goto out;
>  	}
>  
>  	ret = 0;
>  	
out:
	of_node_put(np);
	return ret;
}

Proper error cleanup should also undo the ioremap() if
irq_domain_add_linear() fails.

cheers
