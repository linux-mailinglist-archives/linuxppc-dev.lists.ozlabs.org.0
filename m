Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0E932656C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 17:22:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnFKw0nl4z3cxW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 03:22:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UbX00wvu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=UbX00wvu; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnFKS4qnWz30LS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 03:21:45 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id n28so8074221qkk.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 08:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wKhee+wwyY8wAQtAwhfFGxIYlymbanXy7c8d3WGe9uw=;
 b=UbX00wvuuvMEYhRJX3nCu4zXb85v13Cqv2r7hy9O+bowY1FaIbOHtDcePeLY0/B0Da
 SF2Rt/j2i5vqV+2nd6y/YV7vdWi7UcnYCo6GUDusZkQq2I/4QAMG5NnybLXlvhoAWc4E
 CB07JSKy/zS1mTJuVrl1tmyNn9/lGP5fKjyqtPqmEH+ZLIUFG0B2e4C+3p28fkRswuxC
 hFXweOu/200WMxTdg7r9jyhUcvqhegxsjllPJTsf9QRFCspOmTW4FmlmbibPyeQkxmm0
 eTduKaFz+s5eAm4qAnHn5719bNNg6/TZ7O3TMvWSTpqPFuHHbDX0UTpRpz8DWGQYjFaf
 L6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wKhee+wwyY8wAQtAwhfFGxIYlymbanXy7c8d3WGe9uw=;
 b=T7K4vVC8D+s8loCQQASYnyu+AxFg7zeUmuf4sp3YgnqhnjRKvog07DflZRMW8jHtgD
 d5Vvx2XkZwkCLXflcIsovm0NzYtN3J4QmibIIaMF4crHcRDnFgWyCNrrIEUTMGo3tcUD
 fYIhS767znERpHeKAImEn9L2V59mRw6ugrgQ3mNV7NQ0CSjzUnxyp9f7cMITZQg0oz4R
 LMHgYYcNcEGq3K1HHmhYrW9R60TYSkpW5OVnhdMJNJNJ2W7GYyzTzCIEO4ik9CrX3eZ9
 C52uLEEUy2Fazcolw6crrMn5TtbNyrgilC5Kyb5SaXHFcUa4IvDSS9cB/rAWUj1NR4ZN
 SafQ==
X-Gm-Message-State: AOAM531LkTLZ/0SaJXI6t4/sEPE+YVeA+pPib1mAKJA6UmjBz6Bs2Kyq
 JQn0of5XmL/q4Z9ShlrUgzQ3mw==
X-Google-Smtp-Source: ABdhPJwJdZL4xF23yJV09qXQ0a4Ybxm3pNDa6pceKSCI9bofx7wUXwpD/kCLchRD1oPm3hWZue3Zhg==
X-Received: by 2002:a37:dc41:: with SMTP id v62mr3158437qki.457.1614356503934; 
 Fri, 26 Feb 2021 08:21:43 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id x3sm6801311qkd.94.2021.02.26.08.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:21:43 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lFfs7-000yvy-1U; Fri, 26 Feb 2021 12:21:43 -0400
Date: Fri, 26 Feb 2021 12:21:43 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: Freeing page tables through RCU
Message-ID: <20210226162143.GW2643399@ziepe.ca>
References: <20210225205820.GC2858050@casper.infradead.org>
 <20210226144200.GV2643399@ziepe.ca>
 <20210226160354.GE2723601@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226160354.GE2723601@casper.infradead.org>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 26, 2021 at 04:03:54PM +0000, Matthew Wilcox wrote:
> On Fri, Feb 26, 2021 at 10:42:00AM -0400, Jason Gunthorpe wrote:
> > On Thu, Feb 25, 2021 at 08:58:20PM +0000, Matthew Wilcox wrote:
> > 
> > > I'd like to hear better ideas than this.
> > 
> > You didn't like my suggestion to put a sleepable lock around the
> > freeing of page tables during flushing?
> > 
> > I still don't see how you convert the sleepable page walkers to use
> > rcu??
> 
> I don't want to convert the sleepable ones to use RCU ... I want to
> convert the non-sleeping ones to use RCU.  

Why? Convert them to use the normal page table spinlocks?

It makes everything much more understandable if it is locked properly.

The lockless walks should be reserved for special places because they
are actually hard to do properly.

> A page_table_free_lock might work, but it might have its own
> problems later (eg a sleeping lock can't be acquired under RCU or
> spinlock, and it can't be a spinlock because it'd have to be held
> while we wait for IPIs).

The mmap_sem today is serving the function of the page_table_free_lock
idea, so I think a sleepable lock is already proven to work?

Jason
