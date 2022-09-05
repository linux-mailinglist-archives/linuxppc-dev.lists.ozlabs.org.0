Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 443DD5AD0EF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 13:04:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLlzF0ZtSz3c34
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 21:04:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kjYVFGZ/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=kjYVFGZ/;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLlxb51b4z30Dp
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 21:03:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=39ctGYtpjBvqxaxhX+JGoXm7WH3Dsu7ZcN8472gz0/Y=; b=kjYVFGZ/kFVziLBYIGoMoHKrZ8
	P8Yol8ya84cXbFssvqZLTBK5UFChRXQvqh1ydfF9KGPzaqdvcdATm+bk90oHlc625sSQYeKzINQhq
	n0JG+MVXe6gdwqHdjAiKiZeBghmJl4FAPZ4HpsEpGKi8W2bfIL9fzjrqhc9TbOrauOKD+1ObM7CpW
	EdwVMCYhcVeLC+cBbCnKQzVu0Wc0Pn2mFvTDgPtXFYhX4klx9uueqfklaup10hkR2DX1Rd3GXXG+i
	IIs0cZztNlAxZIEcQgJ5E7qKRTCPH2345lUUopqdHN9fG0QL0WJ17QYjt3NC4BI0Hotp+F2/g+P1O
	9DZ8lhCg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9sw-009Ptv-VR; Mon, 05 Sep 2022 11:03:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 31FB83002A3;
	Mon,  5 Sep 2022 13:03:21 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 22D42209EC608; Mon,  5 Sep 2022 13:03:21 +0200 (CEST)
Date: Mon, 5 Sep 2022 13:03:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH v2 02/16] powerpc: override __ALIGN() and __ALIGN_STR()
 macros
Message-ID: <YxXXeRr0E/rSWgJe@hirez.programming.kicks-ass.net>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-3-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829055223.24767-3-sv@linux.ibm.com>
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

On Mon, Aug 29, 2022 at 11:22:09AM +0530, Sathvika Vasireddy wrote:
> Powerpc instructions must be word-aligned. Currently,
> there is an alignment of 16 bytes (by default), and it is
> much more than what is required for powerpc (4 bytes).
> 
> The default expansion of __ALIGN() macro is:
> #define __ALIGN       .align 4,0x90
> 
> Since Powerpc Linux does not require a 16 byte alignment,
> override __ALIGN() and __ALIGN_STR() macros to use required
> 4 byte alignment.
> 
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/linkage.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/linkage.h b/arch/powerpc/include/asm/linkage.h
> index b71b9582e754..8df88fe61438 100644
> --- a/arch/powerpc/include/asm/linkage.h
> +++ b/arch/powerpc/include/asm/linkage.h
> @@ -2,8 +2,12 @@
>  #ifndef _ASM_POWERPC_LINKAGE_H
>  #define _ASM_POWERPC_LINKAGE_H
>  
> +#include <linux/stringify.h>
>  #include <asm/types.h>
>  
> +#define __ALIGN			.align 2
> +#define __ALIGN_STR		__stringify(__ALIGN)


Related thread:

  https://lkml.kernel.org/r/YxXJswK9QjhCGmPN@hirez.programming.kicks-ass.net
