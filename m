Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD033241FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 17:24:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dm1Tw1gdjz3cZk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 03:24:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=XOtvB//P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dm1TM30V9z30Ny
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 03:24:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=XDaX4omTjZoiDYDyauuQ0b/yWEWf9Flu16sKDshulWc=; b=XOtvB//PMhdv4BX9kKtzYr8ZxI
 91yBE42T7mJIqmn0dY6NROQBdGmyEI/Cb0E3mkt6JEtamNbXtdHvt3lWXAD+6+Uzlj7CYTAN+swuB
 duLQlU6n+UXbRK+92Y7kFN/oYNdtfgWbBUw9TTumKrtZnu4/cAehhuvlYbIHJyvNVPsj34GXF225w
 2zqOxQAR4Mj41zVxbCq/uZ5uJAtey3Jua16A1Cw1MnFbOylJkwR45VnJ36D6qlRB426TmlUuhNwI1
 acDi7D6/2KWm3MiKrfUhsKvqbQ1IBFlEAhIOLzk9EUZ4yypSRvBvOypN9Rto9GSW5LRDFCOmA16dC
 +PKxB7QA==;
Received: from [2601:1c0:6280:3f0::d05b]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEwxS-0002rR-MM; Wed, 24 Feb 2021 16:24:15 +0000
Subject: Re: [PATCH] arch: powerpc: kernel: Change droping to dropping in the
 file traps.c
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, christophe.leroy@csgroup.eu,
 npiggin@gmail.com, jniethe5@gmail.com, alistair@popple.id.au,
 mikey@neuling.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20210224075547.763063-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7b810bb2-4704-4882-79ce-3e41efc9ea55@infradead.org>
Date: Wed, 24 Feb 2021 08:24:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224075547.763063-1-unixbhaskar@gmail.com>
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

On 2/23/21 11:55 PM, Bhaskar Chowdhury wrote:
> 
> s/droping/dropping/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  arch/powerpc/kernel/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 1583fd1c6010..83a53b67412a 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -405,7 +405,7 @@ void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
>  	 * Now test if the interrupt has hit a range that may be using
>  	 * HSPRG1 without having RI=0 (i.e., an HSRR interrupt). The
>  	 * problem ranges all run un-relocated. Test real and virt modes
> -	 * at the same time by droping the high bit of the nip (virt mode
> +	 * at the same time by dropping the high bit of the nip (virt mode
>  	 * entry points still have the +0x4000 offset).
>  	 */
>  	nip &= ~0xc000000000000000ULL;
> --
> 2.30.1
> 


-- 
~Randy

