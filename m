Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C713E1011
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 10:19:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgM2c6BFDz3cjw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 18:19:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1tfTAD2S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=1tfTAD2S; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgM2C5X1tz302C
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 18:18:42 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F0196104F;
 Thu,  5 Aug 2021 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628151520;
 bh=3Qyqz/XehSHX/KN//v96jroYOCaR+p2m3HMTILA0UBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1tfTAD2SzzVKWhuczBMWWCBkLmJujhVs6ns1DA/ZOSo0U1X148bi5U7Tw/q0OrooI
 fejyLXMwHkCrIrbtlW97iHgOA0bXRKN2IF340MROLRuSypoXuueXE/6sTbuuy6aRu+
 umdeCMGPzCKRl1oD9ddTkCi+WD9x7kM4XxVtbiqA=
Date: Thu, 5 Aug 2021 10:18:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH v3 1/2] tty: hvc: pass DMA capable memory to put_chars()
Message-ID: <YQue3tK98e6fAqwP@kroah.com>
References: <20210804025453.93543-1-xianting.tian@linux.alibaba.com>
 <0f26a1c3-53e8-9282-69e8-8d81a9cafc59@kernel.org>
 <40f78d10-0a57-4620-e7e2-f806bd61abca@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40f78d10-0a57-4620-e7e2-f806bd61abca@linux.alibaba.com>
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
Cc: arnd@arndb.de, amit@kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, osandov@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 05, 2021 at 04:08:46PM +0800, Xianting Tian wrote:
> 
> 在 2021/8/5 下午3:58, Jiri Slaby 写道:
> > Hi,
> > 
> > On 04. 08. 21, 4:54, Xianting Tian wrote:
> > > @@ -933,6 +949,16 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno,
> > > int data,
> > >       hp->outbuf_size = outbuf_size;
> > >       hp->outbuf = &((char *)hp)[ALIGN(sizeof(*hp), sizeof(long))];
> > >   +    /*
> > > +     * hvc_con_outbuf is guaranteed to be aligned at least to the
> > > +     * size(N_OUTBUF) by kmalloc().
> > > +     */
> > > +    hp->hvc_con_outbuf = kzalloc(N_OUTBUF, GFP_KERNEL);
> > > +    if (!hp->hvc_con_outbuf)
> > > +        return ERR_PTR(-ENOMEM);
> > 
> > This leaks hp, right?
> > 
> > BTW your 2 patches are still not threaded, that is hard to follow.
> 
> yes, thanks, I found the bug, I am preparing to do this in v4.
> 
> It is the first time I send series patches(number >1), I checked the method
> for sending series patch on LKML.org, I should send '0/2' which is the
> history info for series patches.

Please use 'git send-email' to send the full series all at once,
otherwise it is hard to make the emails threaded "by hand" if you do not
do so.

thanks,

greg k-h
