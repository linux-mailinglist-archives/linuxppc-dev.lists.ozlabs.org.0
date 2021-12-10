Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0874470693
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 17:59:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9cZr378Cz3cTl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 03:59:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qehFagyg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=qehFagyg; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9cZ80v64z2yPs
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 03:59:11 +1100 (AEDT)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BCDB8B827FA;
 Fri, 10 Dec 2021 16:59:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0827A60C4B;
 Fri, 10 Dec 2021 16:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1639155545;
 bh=kRdyzfTbRlA8Q6o9ozYIflNqTTqb1/yyQ+Zhl1bc2hI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qehFagygXXv8bbpl27U/7B/DcP1tIA/U/cWnuj39slg4mxEcbhuXFsss1NddlzBIE
 6PkBZYce8BgviUP9YWNtqY/WCPQTLOyw84eVboaBBjEOQla5+S27wj9ObPzqFGeOTI
 VhCCu+m1sjz5CsY/rSDNoqZ/fnHwKR72obNaOkn8=
Date: Fri, 10 Dec 2021 08:59:03 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH 1/2] kdump: vmcore: move copy_to() from vmcore.c to
 uaccess.h
Message-Id: <20211210085903.e7820815e738d7dc6da06050@linux-foundation.org>
In-Reply-To: <1639143361-17773-2-git-send-email-yangtiezhu@loongson.cn>
References: <1639143361-17773-1-git-send-email-yangtiezhu@loongson.cn>
 <1639143361-17773-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, Baoquan He <bhe@redhat.com>,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 kexec@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vivek Goyal <vgoyal@redhat.com>,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Dave Young <dyoung@redhat.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 10 Dec 2021 21:36:00 +0800 Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> In arch/*/kernel/crash_dump*.c, there exist similar code about
> copy_oldmem_page(), move copy_to() from vmcore.c to uaccess.h,
> and then we can use copy_to() to simplify the related code.
> 
> ...
>
> --- a/fs/proc/vmcore.c
> +++ b/fs/proc/vmcore.c
> @@ -238,20 +238,6 @@ copy_oldmem_page_encrypted(unsigned long pfn, char *buf, size_t csize,
>  	return copy_oldmem_page(pfn, buf, csize, offset, userbuf);
>  }
>  
> -/*
> - * Copy to either kernel or user space
> - */
> -static int copy_to(void *target, void *src, size_t size, int userbuf)
> -{
> -	if (userbuf) {
> -		if (copy_to_user((char __user *) target, src, size))
> -			return -EFAULT;
> -	} else {
> -		memcpy(target, src, size);
> -	}
> -	return 0;
> -}
> -
>  #ifdef CONFIG_PROC_VMCORE_DEVICE_DUMP
>  static int vmcoredd_copy_dumps(void *dst, u64 start, size_t size, int userbuf)
>  {
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index ac03940..4a6c3e4 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -201,6 +201,20 @@ copy_to_user(void __user *to, const void *from, unsigned long n)
>  	return n;
>  }
>  
> +/*
> + * Copy to either kernel or user space
> + */
> +static inline int copy_to(void *target, void *src, size_t size, int userbuf)
> +{
> +	if (userbuf) {
> +		if (copy_to_user((char __user *) target, src, size))
> +			return -EFAULT;
> +	} else {
> +		memcpy(target, src, size);
> +	}
> +	return 0;
> +}
> +

Ordinarily I'd say "this is too large to be inlined".  But the function
has only a single callsite per architecture so inlining it won't cause
bloat at present.

But hopefully copy_to() will get additional callers in the future, in
which case it shouldn't be inlined.  So I'm thinking it would be best
to start out with this as a regular non-inlined function, in
lib/usercopy.c.

Also, copy_to() is a very poor name for a globally-visible helper
function.  Better would be copy_to_user_or_kernel(), although that's
perhaps a bit long.

And the `userbuf' arg should have type bool, yes?

