Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE142D549
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 10:41:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVNDd5q1Sz305B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 19:41:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=TsvQCRJ7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=TsvQCRJ7; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVNCz4Zs0z2yPS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 19:41:18 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1338D60F9E;
 Thu, 14 Oct 2021 08:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634200875;
 bh=rY9vGtlLDIvkDgY0wX20Oxpih5WsKZMgiPYMwz/VsXE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TsvQCRJ72G2+iekhh/WK3vT5lHlv7ZD6YNQNgAj3L2thXFnBxsGvyUNRW7BamuMqV
 1IPExSgJeQI9q0Wym4ATW8HhvO4Aw4CJX4+DsF+KHwMiO6IDjMMu0SjL/bAsfi1hLh
 r4jkVd+UWyWv+rIV5buFUYY+dM3WYR0t5NCyZNCs=
Date: Thu, 14 Oct 2021 10:41:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH v10 2/3] tty: hvc: pass DMA capable memory to put_chars()
Message-ID: <YWftKQ3fTb8QlM6/@kroah.com>
References: <20211009114829.1071021-1-xianting.tian@linux.alibaba.com>
 <20211009114829.1071021-3-xianting.tian@linux.alibaba.com>
 <YWGD8y9VfBIQBu2h@kroah.com>
 <3516c58c-e8e6-2e5a-2bc8-ad80e2124d37@linux.alibaba.com>
 <YWJ7NuapWOZ4QirJ@kroah.com>
 <4dbeddb9-1068-d282-2758-55d0f788ea61@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4dbeddb9-1068-d282-2758-55d0f788ea61@linux.alibaba.com>
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

On Thu, Oct 14, 2021 at 04:34:59PM +0800, Xianting Tian wrote:
> 
> 在 2021/10/10 下午1:33, Greg KH 写道:
> > On Sat, Oct 09, 2021 at 11:45:23PM +0800, Xianting Tian wrote:
> > > 在 2021/10/9 下午7:58, Greg KH 写道:
> > > > Did you look at the placement using pahole as to how this structure now
> > > > looks?
> > > thanks for all your commnts. for this one, do you mean I need to remove the
> > > blank line?  thanks
> > > 
> > No, I mean to use the tool 'pahole' to see the structure layout that you
> > just created and determine if it really is the best way to add these new
> > fields, especially as you are adding huge buffers with odd alignment.
> 
> thanks,
> 
> Based on your comments, I removed 'char outchar',  remian the position of
> 'int outbuf_size' unchanged to keep outbuf_size and lock in the same cache
> line.  Now hvc_struct change as below,
> 
>  struct hvc_struct {
>         struct tty_port port;
>         spinlock_t lock;
>         int index;
>         int do_wakeup;
> -       char *outbuf;
>         int outbuf_size;
>         int n_outbuf;
>         uint32_t vtermno;
> @@ -48,6 +57,16 @@ struct hvc_struct {
>         struct work_struct tty_resize;
>         struct list_head next;
>         unsigned long flags;
> +
> +       /*
> +        * the buf is used in hvc console api for putting chars,
> +        * and also used in hvc_poll_put_char() for putting single char.
> +        */
> +       char cons_outbuf[N_OUTBUF] __ALIGNED__;
> +       spinlock_t cons_outbuf_lock;
> +
> +       /* the buf is used for putting chars to tty */
> +       char outbuf[] __ALIGNED__;
>  };
> 
> pahole for above hvc_struct as below,  is it ok for you?  do we need to pack
> the hole? thanks
> 
> struct hvc_struct {
>     struct tty_port            port;                 /*     0 352 */
>     /* --- cacheline 5 boundary (320 bytes) was 32 bytes ago --- */
>     spinlock_t                 lock;                 /*   352 4 */
>     int                        index;                /*   356 4 */
>     int                        do_wakeup;            /*   360 4 */
>     int                        outbuf_size;          /*   364 4 */
>     int                        n_outbuf;             /*   368 4 */
>     uint32_t                   vtermno;              /*   372 4 */
>     const struct hv_ops  *     ops;                  /*   376 8 */
>     /* --- cacheline 6 boundary (384 bytes) --- */
>     int                        irq_requested;        /*   384 4 */
>     int                        data;                 /*   388 4 */
>     struct winsize             ws;                   /*   392 8 */
>     struct work_struct         tty_resize;           /*   400 32 */
>     struct list_head           next;                 /*   432 16 */
>     /* --- cacheline 7 boundary (448 bytes) --- */
>     long unsigned int          flags;                /*   448 8 */
> 
>     /* XXX 56 bytes hole, try to pack */
> 
>     /* --- cacheline 8 boundary (512 bytes) --- */
>     char                       cons_outbuf[16];      /*   512 16 */
>     spinlock_t                 cons_outbuf_lock;     /*   528 4 */
> 
>     /* XXX 44 bytes hole, try to pack */

Why not move the spinlock up above the cons_outbuf?  Will that not be a
bit better?

Anyway, this is all fine, and much better than before, thanks.

greg k-h
