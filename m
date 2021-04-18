Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6673634D1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 13:21:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNSFw4dVbz3byl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 21:21:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n705a9a7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=ilias.apalodimas@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=n705a9a7; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNSFV5yYTz301p
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 21:21:31 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id g9so15022083wrx.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 04:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yHuFjlT5rtKQaeRAFhvfUQECvltMrb+hYlCuEQGxGSA=;
 b=n705a9a7qdxMFuWE1zX7H+Gwn7R1Ph/HxlJsBZM2OwmgI8on3YCAfTIJ9VILLpPGVN
 U6Ei9bgVBs4WU0tgRYPLY73PulXN7X8T9DnS/lfiOp0hi2PY7rBteW4MAz4+5uRDWIzC
 tVQA+Ijyf20lSUQ31OC6X057HKNOPi+pz6Nzkf8RmSCB7uub+bAFeTOPAvt2BEhTUPA9
 e95vVEysgGXjcAyKsinTriFeM9DFcYVac9rU5mO+CY2n1SfMhFTrdb724lZinw5eig/R
 DWL2UVgqLZFgwGhAmloMkMPTn1qsrnfB8ZvGBiW/SI8QnW3O/4TL6LEClDzNGo9C+X4Y
 G8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yHuFjlT5rtKQaeRAFhvfUQECvltMrb+hYlCuEQGxGSA=;
 b=gPSgi/N3LR8L9EqgwfdXovN5DfSoh3vrdmoD+FuDe5EOqnuV59MmNKr/EjO2zH/hJI
 bUVVOZS5BS+Aj1SCC91UxzKbTVgyMwO9iH+Ajjw1CMZ6rIxFy2eOP8V2DRBpLsry9LBa
 Klr0Z5qtMIOzwONZir9YCGsmt0ouGJVH5AQdkGH9SokacY2mklcJGul60dRn1UCYsWq/
 EZ0zlsK0Vlh0qZ4CHGcMb9aOx2/NRlj5RTr8yFEhYpPaeIMfRQ5aL6CLaOf7BaTLZ0Sk
 W613ej2jqT/AWyRcbBLUk9T7B/et5BvtE8QlzuKiga8OWw9hgW/iECqLU5v4Vgmi4yr9
 lmcg==
X-Gm-Message-State: AOAM531TzsDXoSfhH17sjO7FD8bdjSLglEZA4lwwPXu/z6afzYKClQGc
 H+1arwQSyBfimwwCvgWTsRigCg==
X-Google-Smtp-Source: ABdhPJy/WC+K/XtmqLOKo5IrEBVbL+R26kxzPf1pRpKWFGvT15zr5cY0imTHGxHtMkaaPLJEz/z5Qw==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr8768015wrt.408.1618744885216; 
 Sun, 18 Apr 2021 04:21:25 -0700 (PDT)
Received: from apalos.home (ppp-94-65-92-88.home.otenet.gr. [94.65.92.88])
 by smtp.gmail.com with ESMTPSA id i12sm17113748wrm.77.2021.04.18.04.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 04:21:24 -0700 (PDT)
Date: Sun, 18 Apr 2021 14:21:21 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Message-ID: <YHwWMfgqiRaKS2y6@apalos.home>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <YHspptFx+T588KcG@apalos.home>
 <20210417202240.GS2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210417202240.GS2531743@casper.infradead.org>
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
Cc: arnd@kernel.org, grygorii.strashko@ti.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, mhocko@kernel.org,
 linux-mm@kvack.org, mgorman@suse.de, brouer@redhat.com,
 mcroce@linux.microsoft.com, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 17, 2021 at 09:22:40PM +0100, Matthew Wilcox wrote:
> On Sat, Apr 17, 2021 at 09:32:06PM +0300, Ilias Apalodimas wrote:
> > > +static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
> > > +{
> > > +	page->dma_addr[0] = addr;
> > > +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> > > +		page->dma_addr[1] = addr >> 16 >> 16;
> > 
> > The 'error' that was reported will never trigger right?
> > I assume this was compiled with dma_addr_t as 32bits (so it triggered the
> > compilation error), but the if check will never allow this codepath to run.
> > If so can we add a comment explaining this, since none of us will remember why
> > in 6 months from now?
> 
> That's right.  I compiled it all three ways -- 32-bit, 64-bit dma, 32-bit long
> and 64-bit.  The 32/64 bit case turn into:
> 
> 	if (0)
> 		page->dma_addr[1] = addr >> 16 >> 16;
> 
> which gets elided.  So the only case that has to work is 64-bit dma and
> 32-bit long.
> 
> I can replace this with upper_32_bits().
> 

Ok up to you, I don't mind either way and thanks for solving this!

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
