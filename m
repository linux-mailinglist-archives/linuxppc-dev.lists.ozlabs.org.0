Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B525B6CB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 14:05:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRhww48v4z3c6s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 22:05:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FWxcF1Dr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FWxcF1Dr;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRhwH221wz2yPm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 22:04:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hEpCORyj+0B2c8CSokQtAfftL9v4UKhuX8e0O4W42lQ=; b=FWxcF1DrWGJmcDkJwK+fQLssK7
	kzli3Bcih+3hYnzsYAbqx8RS29oYfkZ1GR+cwP63aQzyleFAg4VQ2QGuB+hOWD9erml6yV904Jwsq
	vJDdpzlVckA9yRQJHKdQ7qzaGGJGGZFQ4lg8NWOH+H/uuEuGB/eITA5uSaJGTmG8KF8JyI1wN6Z3W
	1ufnjneB9DVqHIDEWw0puNvo11F+Th85EKkfLsikg/6BnbO3ES5mYsCbo3b9Rrm7BUu8vyppOyS/l
	+jR+7gUWly1XUmDriX/1l4xBE5G3BjkD7b5i86qSePdtWmjtmS9WUvK1C3BwC95LWcX+lkNwE3cXa
	A6n9Mxkw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4dx-00C4OO-Co; Tue, 13 Sep 2022 12:03:57 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BFDAF30030F;
	Tue, 13 Sep 2022 14:03:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 974E220282DC8; Tue, 13 Sep 2022 14:03:54 +0200 (CEST)
Date: Tue, 13 Sep 2022 14:03:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH v3 02/16] powerpc: Override __ALIGN and __ALIGN_STR macros
Message-ID: <YyBxqjtC0DAhmQrT@hirez.programming.kicks-ass.net>
References: <20220912082020.226755-1-sv@linux.ibm.com>
 <20220912082020.226755-3-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912082020.226755-3-sv@linux.ibm.com>
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
Cc: aik@ozlabs.ru, chenzhongjin@huawei.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, mingo@redhat.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 12, 2022 at 01:50:06PM +0530, Sathvika Vasireddy wrote:
> In a subsequent patch, we would want to annotate powerpc assembly functions
> with SYM_FUNC_START_LOCAL macro. This macro depends on __ALIGN macro.
> 
> The default expansion of __ALIGN macro is:
>         #define __ALIGN      .align 4,0x90
> 
> So, override __ALIGN and __ALIGN_STR macros to use the same alignment as
> that of the existing _GLOBAL macro. Also, do not pad with 0x90, because
> repeated 0x90s are not a nop or trap on powerpc.
> 
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/linkage.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/linkage.h b/arch/powerpc/include/asm/linkage.h
> index b71b9582e754..b88d1d2cf304 100644
> --- a/arch/powerpc/include/asm/linkage.h
> +++ b/arch/powerpc/include/asm/linkage.h
> @@ -4,6 +4,9 @@
>  
>  #include <asm/types.h>
>  
> +#define __ALIGN		.align 2
> +#define __ALIGN_STR	".align 2"

Like mentioned last time; I'm fixing this (but you're right to not wait
on that), that said, would it make sense to write it like:

#define __ALIGN		.balign 4
#define __ALIGN_STR	__stringify(__ALIGN)

That said; with power instructions being 4 bytes, the above alignment is
basically no-alignment, right?


