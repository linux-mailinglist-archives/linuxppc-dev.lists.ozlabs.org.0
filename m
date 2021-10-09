Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D24279E8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 13:59:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRNrn3p9Hz3bhC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 22:59:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mkCpX97D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=mkCpX97D; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRNr81kqRz2yp1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 22:58:48 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C90860EE9;
 Sat,  9 Oct 2021 11:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633780726;
 bh=+OEjWjipj45LByfaax3IC8mrbba3ydp9JA4U4ynR9rI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mkCpX97DtP87MbbFXKOvS+YAu0qSRrD74iQqaPGxGyRJsrY10jekAwJKiGtJtApBB
 8UsomooHdrFybbbw4FL03YwBS2WRVf5XZ8pKF6VT2/S7LswA8yWPInqdbx6WgjcrhD
 ANdNm19s2lwdoEvrbjE/5Ldyv7GuJviBkfcNo8mg=
Date: Sat, 9 Oct 2021 13:58:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH v10 2/3] tty: hvc: pass DMA capable memory to put_chars()
Message-ID: <YWGD8y9VfBIQBu2h@kroah.com>
References: <20211009114829.1071021-1-xianting.tian@linux.alibaba.com>
 <20211009114829.1071021-3-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211009114829.1071021-3-xianting.tian@linux.alibaba.com>
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
Cc: arnd@arndb.de, amit@kernel.org, jirislaby@kernel.org,
 shile.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 osandov@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 09, 2021 at 07:48:28PM +0800, Xianting Tian wrote:
> --- a/drivers/tty/hvc/hvc_console.h
> +++ b/drivers/tty/hvc/hvc_console.h
> @@ -32,13 +32,21 @@
>   */
>  #define HVC_ALLOC_TTY_ADAPTERS	8
>  
> +/*
> + * These sizes are most efficient for vio, because they are the
> + * native transfer size. We could make them selectable in the
> + * future to better deal with backends that want other buffer sizes.
> + */
> +#define N_OUTBUF	16
> +#define N_INBUF		16
> +
> +#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))

Does this conflict with what is in hvcs.c?

> +
>  struct hvc_struct {
>  	struct tty_port port;
>  	spinlock_t lock;
>  	int index;
>  	int do_wakeup;
> -	char *outbuf;
> -	int outbuf_size;
>  	int n_outbuf;
>  	uint32_t vtermno;
>  	const struct hv_ops *ops;
> @@ -48,6 +56,18 @@ struct hvc_struct {
>  	struct work_struct tty_resize;
>  	struct list_head next;
>  	unsigned long flags;
> +
> +	/* the buf is used in hvc console api for putting chars */
> +	char cons_outbuf[N_OUTBUF] __ALIGNED__;
> +	spinlock_t cons_outbuf_lock;

Did you look at the placement using pahole as to how this structure now
looks?

> +
> +	/* the buf is for putting single char to tty */
> +	char outchar;
> +	spinlock_t outchar_lock;

So you have a lock for a character and a different one for a longer
string?  Why can they not just use the same lock?  Why are 2 needed at
all, can't you just use the first character of cons_outbuf[] instead?
Surely you do not have 2 sends happening at the same time, right?

> +
> +	/* the buf is for putting chars to tty */
> +	int outbuf_size;
> +	char outbuf[0] __ALIGNED__;

I thought we were not allowing [0] anymore in kernel structures?

thanks,

greg k-h
