Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 110AD2FF81D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 23:41:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMHRy65LqzDrdD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 09:41:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=tyhicks@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=Fmcd9Krw; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DM8jC2WztzDqML
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 04:37:19 +1100 (AEDT)
Received: from sequoia (162-237-133-238.lightspeed.rcsntx.sbcglobal.net
 [162.237.133.238])
 by linux.microsoft.com (Postfix) with ESMTPSA id 30AE920B7192;
 Thu, 21 Jan 2021 09:37:17 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 30AE920B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1611250637;
 bh=fbcRcp3idFFWOwiOjLdBsLqpIczhr4t2xXWIs0rFOng=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fmcd9KrwyIO9TqvZmr0jqA0gEJmzIDHUMnaPFQFbijMEsfENZEAaX5Xo++kbH58i2
 agEegx67+IM2QDODuukFUevio4kE2yxldq9dWrZ+0CmuNgv6vejrdDnHKRZRE9PLqW
 uEJDWxGe0Mz7g7InS7KFcW/oXqQJKMMVZuGT+FUw=
Date: Thu, 21 Jan 2021 11:37:15 -0600
From: Tyler Hicks <tyhicks@linux.microsoft.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH 2/2] ima: Free IMA measurement buffer after kexec syscall
Message-ID: <20210121173715.GF259508@sequoia>
References: <20210121173003.18324-1-nramas@linux.microsoft.com>
 <20210121173003.18324-2-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121173003.18324-2-nramas@linux.microsoft.com>
X-Mailman-Approved-At: Fri, 22 Jan 2021 09:37:36 +1100
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
Cc: sashal@kernel.org, dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org,
 zohar@linux.ibm.com, ebiederm@xmission.com, gregkh@linuxfoundation.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-01-21 09:30:03, Lakshmi Ramasubramanian wrote:
> IMA allocates kernel virtual memory to carry forward the measurement
> list, from the current kernel to the next kernel on kexec system call,
> in ima_add_kexec_buffer() function.  This buffer is not freed before
> completing the kexec system call resulting in memory leak.
> 
> Add ima_buffer field in "struct kimage" to store the virtual address
> of the buffer allocated for the IMA measurement list.
> Free the memory allocated for the IMA measurement list in
> kimage_file_post_load_cleanup() function.
> 
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Tyler Hicks <tyhicks@linux.microsoft.com>
> Fixes: 7b8589cc29e7 ("ima: on soft reboot, save the measurement list")

Reviewed-by: Tyler Hicks <tyhicks@linux.microsoft.com>

Tyler

> ---
>  include/linux/kexec.h              | 5 +++++
>  kernel/kexec_file.c                | 5 +++++
>  security/integrity/ima/ima_kexec.c | 2 ++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 9e93bef52968..5f61389f5f36 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -300,6 +300,11 @@ struct kimage {
>  	/* Information for loading purgatory */
>  	struct purgatory_info purgatory_info;
>  #endif
> +
> +#ifdef CONFIG_IMA_KEXEC
> +	/* Virtual address of IMA measurement buffer for kexec syscall */
> +	void *ima_buffer;
> +#endif
>  };
>  
>  /* kexec interface functions */
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index b02086d70492..5c3447cf7ad5 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -166,6 +166,11 @@ void kimage_file_post_load_cleanup(struct kimage *image)
>  	vfree(pi->sechdrs);
>  	pi->sechdrs = NULL;
>  
> +#ifdef CONFIG_IMA_KEXEC
> +	vfree(image->ima_buffer);
> +	image->ima_buffer = NULL;
> +#endif /* CONFIG_IMA_KEXEC */
> +
>  	/* See if architecture has anything to cleanup post load */
>  	arch_kimage_file_post_load_cleanup(image);
>  
> diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
> index 212145008a01..8eadd0674629 100644
> --- a/security/integrity/ima/ima_kexec.c
> +++ b/security/integrity/ima/ima_kexec.c
> @@ -130,6 +130,8 @@ void ima_add_kexec_buffer(struct kimage *image)
>  		return;
>  	}
>  
> +	image->ima_buffer = kexec_buffer;
> +
>  	pr_debug("kexec measurement buffer for the loaded kernel at 0x%lx.\n",
>  		 kbuf.mem);
>  }
> -- 
> 2.30.0
> 
