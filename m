Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BEA344F19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 19:52:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F43Wk5Qscz30Dt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 05:52:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ZVhuah8Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=ZVhuah8Q; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F43WK1ywvz2xfj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 05:51:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=KqWlvhAGgyStdJLBW78wBFkvyCWpxBzSVDDJlh/HL90=; b=ZVhuah8QLyHaRfi5DaIMP+8KR3
 Rqz0HEJy5GOMs+GeP5oX15a2ApgBEEtJ5l/Xcpa2ohrvqfCk77QvwTgYfH3nwC3Q9vGzsBAlim8Fn
 3Z3Ose0MR0e11E9FdlpoEXmMdX4/56dhDC29xFgo7rDnzJG0eyFxoupZq9EwKo68A49zvT+JZLWoc
 W1nGwUIeAOW5GBJ+GppY4UIkVVa1UpTvZgbNLGRxezMu88Vc1epNpO6Qju9IGJsvyexskEWiDEWer
 9bg5+Qo71NGFCsToH24ewMwFMThUrKK1Xb79QfOnyLoFmb9hZXLCCWxQLbe8a/zZ0pju4QwhUgOh3
 cLem4M2Q==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lOPdX-008wJa-Pl; Mon, 22 Mar 2021 18:51:07 +0000
Subject: Re: [PATCH] powerpc: kernel: Trivial spelling fixes throughout the
 file head_fsl_booke.S
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, rppt@kernel.org,
 akpm@linux-foundation.org, christophe.leroy@csgroup.eu, oss@buserror.net,
 npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20210315033732.4173500-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3b2e038c-6c17-0b53-0b96-8795ee32c09b@infradead.org>
Date: Mon, 22 Mar 2021 11:50:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315033732.4173500-1-unixbhaskar@gmail.com>
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

On 3/14/21 8:37 PM, Bhaskar Chowdhury wrote:
> s/virutal/virtual/
> s/mismach/mismatch/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  As Randy pointed out I was changing the predefined macro name,so, reverted
>  or leave it alone.
>  Michael,sorry to run down a cold weave in your spine with my stupdity,this is
>  okay.
> 
>  arch/powerpc/kernel/head_fsl_booke.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
> index 3f4a40cccef5..a955403247f1 100644
> --- a/arch/powerpc/kernel/head_fsl_booke.S
> +++ b/arch/powerpc/kernel/head_fsl_booke.S
> @@ -113,7 +113,7 @@ _ENTRY(_start);
> 
>  1:
>  	/*
> -	 * We have the runtime (virutal) address of our base.
> +	 * We have the runtime (virtual) address of our base.
>  	 * We calculate our shift of offset from a 64M page.
>  	 * We could map the 64M page we belong to at PAGE_OFFSET and
>  	 * get going from there.
> @@ -497,7 +497,7 @@ END_BTB_FLUSH_SECTION
>  #endif
>  #endif
> 
> -	bne	2f			/* Bail if permission/valid mismach */
> +	bne	2f			/* Bail if permission/valid mismatch */
> 
>  	/* Jump to common tlb load */
>  	b	finish_tlb_load
> @@ -592,7 +592,7 @@ END_BTB_FLUSH_SECTION
>  #endif
>  #endif
> 
> -	bne	2f			/* Bail if permission mismach */
> +	bne	2f			/* Bail if permission mismatch */
> 
>  	/* Jump to common TLB load point */
>  	b	finish_tlb_load
> --
> 2.30.2
> 


-- 
~Randy

