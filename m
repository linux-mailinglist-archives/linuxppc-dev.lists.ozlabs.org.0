Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D683EB172
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 09:27:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmFWq1prJz3cRd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 17:27:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=G1ht4dmK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=G1ht4dmK; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmFW52gk0z30Bm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 17:27:12 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8FC560F91;
 Fri, 13 Aug 2021 07:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628839628;
 bh=cqWgiVvN0VhZq4Q+Qyorw5Qi3WgDQ3u3yidJG4DZyvM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G1ht4dmKxC0V4yDLoxhtf7dp2k4NizhLBtVs+MKw0bYAjzZvIuMizpCeP5HDPsQor
 ZsrBQNMMqP54xBGuaoA8s5NUS5mQMBuXwJU60d1/qE5bIyhtU0CrePWhl/QzKMxxVf
 grU3fK/RmN6tqm45e//7lkSmiZud9DgbfEkJve50=
Date: Fri, 13 Aug 2021 09:27:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH v6 1/2] tty: hvc: pass DMA capable memory to put_chars()
Message-ID: <YRYeyeZ/22rR26u7@kroah.com>
References: <20210812094532.145497-1-xianting.tian@linux.alibaba.com>
 <20210812094532.145497-2-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812094532.145497-2-xianting.tian@linux.alibaba.com>
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
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, osandov@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 12, 2021 at 05:45:31PM +0800, Xianting Tian wrote:
> As well known, hvc backend can register its opertions to hvc backend.
> the opertions contain put_chars(), get_chars() and so on.
> 
> Some hvc backend may do dma in its opertions. eg, put_chars() of
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
> We make 'char c[N_OUTBUF]' part of 'struct hvc_struct', so hp->c is no
> longer the stack memory. we can use it in above two cases.
> 
> Other fix is use L1_CACHE_BYTES as the alignment, use 'sizeof(long)' as
> dma alignment is wrong. And use struct_size() to calculate size of
> hvc_struct.
> 
> Introduce another array(cons_outbuf[]) for the hp->c pointers next to
> the cons_ops[] and vtermnos[] arrays.
> 
> With the patch, we can remove the fix c4baad5029.
> 
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> Tested-by: Xianting Tian <xianting.tian@linux.alibaba.com>

As the build shows, you obviously did not test this code :(

Also, no need to add a tested-by line as that should be implicit if you
wrote and signed off on it.

I am going to ask you to get some help from some other developers at
your company, and get them to test and sign off on this series before
sending it out again, as there seems to be a bit of a disconnect as to
what is actually needed to do when sending a patch for us to review.

That is now a requirement for us to be able to take your changes here.

thanks,

greg k-h
