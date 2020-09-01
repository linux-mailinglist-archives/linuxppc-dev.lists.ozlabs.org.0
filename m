Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F8F25A03F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 22:56:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgzrf0XNQzDqQj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 06:56:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eELfQzbS; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgzpC1NJFzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 06:54:25 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id f18so1531886pfa.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 13:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FRTR1pQ5xaQZ2uOprnJ9rvvshbUxSZlhlKoxnO7URRM=;
 b=eELfQzbSGjuv8KyOMVHl+sTrzSe3ziixFesUVCgWOu7/Z9muIvFP7Bi4DRJZMs6RcJ
 uhMvWISw8EQN1/7gxRmFAFsNBG5Sh9QbZV6QgcFDjmSpu/uuHUY9boYcGOBpACpZ2QKm
 2xrLnc3Zu6wcDZtzf6kTWiFrA/YhL2qcA9RPBXgRzmQs/uy/H7Jn+SzylyQeVuoHjASv
 vAVeYbXCILJrBBwG1cAuMAGgHRm6simSr4if2kYJM3hqSroABMSvzIJAMe0A2WueufHt
 t5wBEp5mZqpgLu3vzcoJLecspOTik/9RM6BJkEqtdcJgnSSWtV2vjAN/aVdEovSHd2Tj
 jceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FRTR1pQ5xaQZ2uOprnJ9rvvshbUxSZlhlKoxnO7URRM=;
 b=Ua0Mxn2g6MV0q4J8qLWyhFX6fRc0QjWdfSpePLCLOcGqFfa+MpijI/ZsndH89lwBbQ
 uwzIzFOOR9LGRNEB+bxfqMzQGMP78EWqnbR4UzUPy8P2U9Ix7vKmyDpro9rT2SuZ5F8d
 BubYhtf0f/oC2CCMTaomJ3vSdDtNh6m8czmy1Qnqqp8caFMuF9E/E2tY8LyYc4QRr3cN
 zn+nAO1vwdDGZ+JuPi4l3wWFujX1cr/TB4wwYvEkb3uyBM12vDTr/OyAJ2ReeO1FsNzD
 A8DXfEeKE63gM5tKJg3MOo1Y7nI0dNB1Ra7fML6UeDVX4tYGMxrnPyX4IMSANaC7CfEd
 c8Xw==
X-Gm-Message-State: AOAM530iHbCKo/f0Z+GRvSaqeUVGHFLkoOoeFGXTk/CMnlz5OmmNLFiI
 hmUhFo7H/oNO0Y9+9gsAESo=
X-Google-Smtp-Source: ABdhPJybz8lKswfhAONDTigR0brpOOZSb0wvBo43ZZyZYaJi6PxdmqR6MUqDZmJI2ioaYEYqLLibGw==
X-Received: by 2002:a63:384b:: with SMTP id h11mr3124012pgn.113.1598993661459; 
 Tue, 01 Sep 2020 13:54:21 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id y1sm3016263pgr.3.2020.09.01.13.54.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 01 Sep 2020 13:54:21 -0700 (PDT)
Date: Tue, 1 Sep 2020 13:53:47 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RESEND][PATCH 1/7] powerpc/iommu: Avoid overflow at boundary_size
Message-ID: <20200901205346.GA17362@Asurada-Nvidia>
References: <20200831203811.8494-1-nicoleotsuka@gmail.com>
 <20200831203811.8494-2-nicoleotsuka@gmail.com>
 <87lfht1vav.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lfht1vav.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-ia64@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org, hch@lst.de,
 sfr@canb.auug.org.au, deller@gmx.de, x86@kernel.org, borntraeger@de.ibm.com,
 mingo@redhat.com, mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com,
 schnelle@linux.ibm.com, hca@linux.ibm.com, ink@jurassic.park.msu.ru,
 tglx@linutronix.de, gerald.schaefer@linux.ibm.com, rth@twiddle.net,
 tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 01, 2020 at 11:27:36PM +1000, Michael Ellerman wrote:
> Nicolin Chen <nicoleotsuka@gmail.com> writes:
> > The boundary_size might be as large as ULONG_MAX, which means
> > that a device has no specific boundary limit. So either "+ 1"
> > or passing it to ALIGN() would potentially overflow.
> >
> > According to kernel defines:
> >     #define ALIGN_MASK(x, mask) (((x) + (mask)) & ~(mask))
> >     #define ALIGN(x, a)	ALIGN_MASK(x, (typeof(x))(a) - 1)
> >
> > We can simplify the logic here:
> >   ALIGN(boundary + 1, 1 << shift) >> shift
> > = ALIGN_MASK(b + 1, (1 << s) - 1) >> s
> > = {[b + 1 + (1 << s) - 1] & ~[(1 << s) - 1]} >> s
> > = [b + 1 + (1 << s) - 1] >> s
> > = [b + (1 << s)] >> s
> > = (b >> s) + 1
> >
> > So fixing a potential overflow with the safer shortcut.
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > ---
> >  arch/powerpc/kernel/iommu.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> Are you asking for acks, or for maintainers to merge the patches
> individually?

I was expecting that but Christoph just suggested me to squash them
into one so he would merge it: https://lkml.org/lkml/2020/9/1/159

Though I feel it'd be nice to get maintainers' acks before merging.

> > diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> > index 9704f3f76e63..c01ccbf8afdd 100644
> > --- a/arch/powerpc/kernel/iommu.c
> > +++ b/arch/powerpc/kernel/iommu.c
> > @@ -236,15 +236,14 @@ static unsigned long iommu_range_alloc(struct device *dev,
> >  		}
> >  	}
> >  
> > -	if (dev)
> > -		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
> > -				      1 << tbl->it_page_shift);
> > -	else
> > -		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
> >  	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
> > +	boundary_size = dev ? dma_get_seg_boundary(dev) : U32_MAX;
> 
> Is there any path that passes a NULL dev anymore?
> 
> Both iseries_hv_alloc() and iseries_hv_map() were removed years ago.
> See:
>   8ee3e0d69623 ("powerpc: Remove the main legacy iSerie platform code")
> 
> 
> So maybe we should do a lead-up patch that drops the NULL dev support,
> which will then make this patch simpler.

The next version of this change will follow Christoph's suggestion
by having a helper function that takes care of !dev internally.

Thanks
Nic

> 
> 
> > +	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
> > +	boundary_size = (boundary_size >> tbl->it_page_shift) + 1;
> >  
> >  	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
> > -			     boundary_size >> tbl->it_page_shift, align_mask);
> > +			     boundary_size, align_mask);
> >  	if (n == -1) {
> >  		if (likely(pass == 0)) {
> >  			/* First try the pool from the start */
> > -- 
> > 2.17.1
