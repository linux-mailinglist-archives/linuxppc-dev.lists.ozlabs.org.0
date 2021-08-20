Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D393B3F2711
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 08:50:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrXMc4b9Wz3cZS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 16:50:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=nTPXXxyl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=nTPXXxyl; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrXLv3Zgkz305t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 16:49:56 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id y11so7778933pfl.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 23:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=gouExDkcyZl3ijmObUC+G2ORUVV3VspK7d7Fu2DyAHg=;
 b=nTPXXxylyEXDYBekIaAIzp+BtlWfWK9uk9zQ2AZQeRrD58IjWAI3Xax0m2/WDtnBA4
 HZXtXcI8R8qZ1MFS7Th4L0ULWT98saZd4j8GUX7yb4Jj7ven42yOiobysolY2N2Pdsqz
 rTgPY50k0Ct1FbBLrkGUtgBJMg9FdJMBML7aQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=gouExDkcyZl3ijmObUC+G2ORUVV3VspK7d7Fu2DyAHg=;
 b=pstwHmFRY1hOuPdpqpgIwiySheBlg1Y1KfUcWy20bdLmAA20baWWgitvA1KXKby8Cr
 n151P5PMmeQK+L3fR/FxgvHxZkAXMo/T019ffCL8Nzxz5UyVt0s8tdL+QVUiRQ+SIh/w
 Z5/BNYiz42NR+8uuBt5aKWEV1pnc2K6O+DiIcSscPwVOQOeFtS8OlQYgzmrunF1Jvm3l
 WF8+v25gy2wSu3E89O/8pCSjS85m6rDlC3GXxGisEwiGCpMsyPIhZHZ+l46SJlXKdUpB
 ojfYBi4+FfhbzAblc5q4rxI40NZ/yQ/628cuxkpFlnnxR9gPyE/lp4BDE4yTs4lsQwLP
 VoMA==
X-Gm-Message-State: AOAM533hmyjK3Ayv/FKMaVVZYvIDO5v/xSqlmMvM3/NaX/AgZSns9cP+
 uz2qPhJteS5b0c5zYpBJPQLxIA==
X-Google-Smtp-Source: ABdhPJxWz/9TmQnG6a6Du0TX4lp94P5/KwicmwvaBeBO644dQYvRpxIV+9458y43F5RM9soOs6IFHQ==
X-Received: by 2002:a63:3245:: with SMTP id y66mr17150880pgy.443.1629442191180; 
 Thu, 19 Aug 2021 23:49:51 -0700 (PDT)
Received: from localhost ([2001:4479:e000:e400:a926:b5e4:f61:cefa])
 by smtp.gmail.com with ESMTPSA id 22sm6475251pgn.88.2021.08.19.23.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 23:49:50 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Xianting Tian <xianting.tian@linux.alibaba.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, amit@kernel.org, arnd@arndb.de, osandov@fb.com
Subject: Re: [PATCH v8 2/3] tty: hvc: pass DMA capable memory to put_chars()
In-Reply-To: <20210818082122.166881-3-xianting.tian@linux.alibaba.com>
References: <20210818082122.166881-1-xianting.tian@linux.alibaba.com>
 <20210818082122.166881-3-xianting.tian@linux.alibaba.com>
Date: Fri, 20 Aug 2021 16:49:47 +1000
Message-ID: <87pmu8ehkk.fsf@linkitivity.dja.id.au>
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
Cc: Xianting Tian <xianting.tian@linux.alibaba.com>,
 shile.zhang@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Xianting Tian <xianting.tian@linux.alibaba.com> writes:

> As well known, hvc backend driver(eg, virtio-console) can register its
> operations to hvc framework. The operations can contain put_chars(),
> get_chars() and so on.
>
> Some hvc backend may do dma in its operations. eg, put_chars() of
> virtio-console. But in the code of hvc framework, it may pass DMA
> incapable memory to put_chars() under a specific configuration, which
> is explained in commit c4baad5029(virtio-console: avoid DMA from stack):

We could also run into issues on powerpc where Andrew is working on
adding vmap-stack but the opal hvc driver assumes that it is passed a
buffer which is not in vmalloc space but in the linear mapping. So it
would be good to fix this (or more clearly document what drivers can
expect).

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
> a new hvc backend using dma added in the future.
>
> In this patch, we make 'char out_buf[N_OUTBUF]' and 'chat out_ch' part
> of 'struct hvc_struct', so both two buf are no longer the stack memory.
> we can use it in above two cases separately.
>
> Introduce another array(cons_outbufs[]) for buffer pointers next to
> the cons_ops[] and vtermnos[] arrays. With the array, we can easily find
> the buffer, instead of traversing hp list.
>
> With the patch, we can remove the fix c4baad5029.
>
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> Reviewed-by: Shile Zhang <shile.zhang@linux.alibaba.com>

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
> @@ -48,6 +56,10 @@ struct hvc_struct {
>  	struct work_struct tty_resize;
>  	struct list_head next;
>  	unsigned long flags;
> +	char out_ch;
> +	char out_buf[N_OUTBUF] __ALIGNED__;
> +	int outbuf_size;
> +	char outbuf[0] __ALIGNED__;

I'm trying to understand this patch but I am finding it very difficult
to understand what the difference between `out_buf` and `outbuf`
(without the underscore) is supposed to be. `out_buf` is statically
sized and the size of `outbuf` is supposed to depend on the arguments to
hvc_alloc(), but I can't quite figure out what the roles of each one are
and their names are confusingly similiar!

I looked briefly at the older revisions of the series but it didn't make
things much clearer.

Could you give them clearer names?

Also, looking at Documentation/process/deprecated.rst, it looks like
maybe we want to use a 'flexible array member' instead:

.. note:: If you are using struct_size() on a structure containing a zero-length
        or a one-element array as a trailing array member, please refactor such
        array usage and switch to a `flexible array member
        <#zero-length-and-one-element-arrays>`_ instead.

I think we want:

> +	char outbuf[] __ALIGNED__;

Kind regards,
Daniel
