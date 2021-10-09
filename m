Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 639134279DA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 13:56:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRNng2PvQz30R6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 22:56:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lhjEKytD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=lhjEKytD; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRNmx622vz2ynN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 22:55:57 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DF1560EE9;
 Sat,  9 Oct 2021 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633780554;
 bh=pJABJ1JzJYukeyq4nIhuXfqM6wKmGcJGn3PyObatZxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lhjEKytDQn7a443MT8nwdCQOHxRHPAAyXRJwge8eC5aRs2y+ZofQPjiMdWpAsFxsF
 H46jA6kTZJ6IUkNRs6p5Hbaqmsecjvjcrs1EJuVXtY6bDMi3gftFFMZ9srQaEed366
 Gkfsxsb6Y/hiWQD6LKl9b34DXLogfFP9xQjvlWyo=
Date: Sat, 9 Oct 2021 13:55:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH v10 2/3] tty: hvc: pass DMA capable memory to put_chars()
Message-ID: <YWGDSF04jEjc/FgJ@kroah.com>
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
> As well known, hvc backend can register its opertions to hvc backend.
> the operations contain put_chars(), get_chars() and so on.
> 
> Some hvc backend may do dma in its operations. eg, put_chars() of
> virtio-console. But in the code of hvc framework, it may pass DMA
> incapable memory to put_chars() under a specific configuration, which
> is explained in commit c4baad5029(virtio-console: avoid DMA from stack):
> 1, c[] is on stack,
>    hvc_console_print():
> 	char c[N_OUTBUF] __ALIGNED__;
> 	cons_ops[index]->put_chars(vtermnos[index], c, i);
> 2, ch is on stack,
>    static void hvc_poll_put_char(,,char ch)
>    {
> 	struct tty_struct *tty = driver->ttys[0];
> 	struct hvc_struct *hp = tty->driver_data;
> 	int n;
> 
> 	do {
> 		n = hp->ops->put_chars(hp->vtermno, &ch, 1);
> 	} while (n <= 0);
>    }
> 
> Commit c4baad5029 is just the fix to avoid DMA from stack memory, which
> is passed to virtio-console by hvc framework in above code. But I think
> the fix is aggressive, it directly uses kmemdup() to alloc new buffer
> from kmalloc area and do memcpy no matter the memory is in kmalloc area
> or not. But most importantly, it should better be fixed in the hvc
> framework, by changing it to never pass stack memory to the put_chars()
> function in the first place. Otherwise, we still face the same issue if
> a new hvc backend using dma added in the furture.
> 
> In this patch, add 'char cons_outbuf[]' as part of 'struct hvc_struct',
> so hp->cons_outbuf is no longer the stack memory, we can use it in above
> case 1. Add 'char outchar' as part of 'struct hvc_struct', we can use it
> in above case 2. We also add lock for each above buf to protect them
> separately instead of using the global lock of hvc.
> 
> Introduce another array(cons_hvcs[]) for hvc pointers next to the
> cons_ops[] and vtermnos[] arrays. With the array, we can easily find
> hvc's cons_outbuf and its lock.
> 
> With the patch, we can revert the fix c4baad5029.
> 
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
> ---
>  drivers/tty/hvc/hvc_console.c | 37 +++++++++++++++++++++--------------
>  drivers/tty/hvc/hvc_console.h | 24 +++++++++++++++++++++--
>  2 files changed, 44 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
> index 5bb8c4e44..4d8f112f2 100644
> --- a/drivers/tty/hvc/hvc_console.c
> +++ b/drivers/tty/hvc/hvc_console.c
> @@ -41,16 +41,6 @@
>   */
>  #define HVC_CLOSE_WAIT (HZ/100) /* 1/10 of a second */
>  
> -/*
> - * These sizes are most efficient for vio, because they are the
> - * native transfer size. We could make them selectable in the
> - * future to better deal with backends that want other buffer sizes.
> - */
> -#define N_OUTBUF	16
> -#define N_INBUF		16
> -
> -#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))
> -

Are you sure this applies on top of patch 1/3 here?

> +/*
> + * These sizes are most efficient for vio, because they are the
> + * native transfer size. We could make them selectable in the
> + * future to better deal with backends that want other buffer sizes.
> + */
> +#define N_OUTBUF	16
> +#define N_INBUF		16
> +
> +#define __ALIGNED__ __attribute__((__aligned__(sizeof(long))))

Again, are you sure this is correct?

thanks,

greg k-h
