Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B71743AC6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 08:50:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdjBM73mQz305B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 17:50:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=JE2IgUzD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=JE2IgUzD; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdj9n1lldz2xY6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 17:49:48 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53639603E5;
 Tue, 26 Oct 2021 06:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1635230985;
 bh=6f1WgNicKHo46BidqiQs8hGNGw8fYd/fygv8pn1WdIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JE2IgUzDQ9FhimLGtgYmJx7gfk7AbNK8FCvuy+1XpMpsYY3/phH8JvRkEQ5yDvHKL
 Fd8XM/W5vYHq+hiyfbvecJa62VcdGpzx0iI7SZIwoQM75oQELC2TAaF5xNQQswVtY3
 5+mM1WbvM6FhxDYvZtnIecqDd7+r/R6ui7u/9GjQ=
Date: Tue, 26 Oct 2021 08:49:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: Re: [PATCH v11 2/3] tty: hvc: pass DMA capable memory to put_chars()
Message-ID: <YXelB/WhWPqcIl/T@kroah.com>
References: <20211015024658.1353987-1-xianting.tian@linux.alibaba.com>
 <20211015024658.1353987-3-xianting.tian@linux.alibaba.com>
 <208f7a41-a9fa-630c-cb44-c37c503f3a72@kernel.org>
 <cd195483-93c7-23be-8f4c-9cf7f25a3065@linux.alibaba.com>
 <YXebzdZz8oN6w+T0@kroah.com>
 <8f78c1b8-c736-748d-d08b-3d6121eb5af8@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f78c1b8-c736-748d-d08b-3d6121eb5af8@linux.alibaba.com>
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
 shile.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 osandov@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 26, 2021 at 02:11:51PM +0800, Xianting Tian wrote:
> 
> 在 2021/10/26 下午2:10, Greg KH 写道:
> > On Tue, Oct 26, 2021 at 02:02:21PM +0800, Xianting Tian wrote:
> > > 在 2021/10/26 下午1:10, Jiri Slaby 写道:
> > > > On 15. 10. 21, 4:46, Xianting Tian wrote:
> > > > > @@ -151,9 +142,11 @@ static uint32_t vtermnos[MAX_NR_HVC_CONSOLES] =
> > > > >    static void hvc_console_print(struct console *co, const char *b,
> > > > >                      unsigned count)
> > > > >    {
> > > > > -    char c[N_OUTBUF] __ALIGNED__;
> > > > > +    char *c;
> > > > >        unsigned i = 0, n = 0;
> > > > >        int r, donecr = 0, index = co->index;
> > > > > +    unsigned long flags;
> > > > > +    struct hvc_struct *hp;
> > > > >          /* Console access attempt outside of acceptable console
> > > > > range. */
> > > > >        if (index >= MAX_NR_HVC_CONSOLES)
> > > > > @@ -163,6 +156,13 @@ static void hvc_console_print(struct console
> > > > > *co, const char *b,
> > > > >        if (vtermnos[index] == -1)
> > > > >            return;
> > > > >    +    hp = cons_hvcs[index];
> > > > > +    if (!hp)
> > > > > +        return;
> > > > You effectively make the console unusable until someone calls
> > > > hvc_alloc() for this device, correct? This doesn't look right. Neither
> > > > you describe this change of behaviour in the commit log.
> > > I mentioned such info in the commit log:
> > > 'Introduce another array(cons_hvcs[]) for hvc pointers next to the
> > > cons_ops[] and vtermnos[] arrays. With the array, we can easily find
> > > hvc's cons_outbuf and its lock.'
> > > 
> > > After you pointed it out, I just found what you said make sense, I checked the code hvc_console_print() can support print before hvc_alloc() is called when someone use hvc_instantiate() for an early console discovery method.
> > > I send a patch to fix the issue?  or these serial pathches reverted fisrtly then I resend new version patches? thanks
> > Let me revert these now and you can send an updated version.
> OK, thanks.

I have now reverted patches 2/3 and 3/3 in this series from my tree.
The first patch was just fine.

thanks,

greg k-h
