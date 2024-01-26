Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC52683DDA5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 16:38:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nTuUh1to;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TM20p5jMSz3cYv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 02:38:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nTuUh1to;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TM20355zmz3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 02:38:10 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3bd6581bc66so564041b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 07:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1706283488; x=1706888288; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DHXnx8afQv16BuE8CvDhlcpu6wVrXL3+T1JQxNtzp2I=;
        b=nTuUh1tofHGygOErCW4KYagEibhhFqXgevZsGr6O2fSxoAcj1WBn3hymCghjwLk/IU
         oNf+4Qu8rOy+nX8toeUGTeRYqnouN8ETYEqacZ+fm0UzsCQ9C/PUrlzxKypJhM8+54/l
         DYv1/vDRfE6BSVfdVKBWAqSK5SL2DXNwzVyEphWUYoY+y8Xrtz3tfmvhZhmO+9tw73ow
         U60OeGsDClePHafO2rfddY/joFU8T0yDLN0eonC4EXyt67ybV7jMXNRVGevI6LM+a12y
         kp1Ee5dkxcugtbPBaA1XEKcEB5bjQNMGJphXhzx3/rtIqIID5ba3w0PFdDusTl+F6xF4
         ifJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706283488; x=1706888288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHXnx8afQv16BuE8CvDhlcpu6wVrXL3+T1JQxNtzp2I=;
        b=bqW7wzH0dsnxOlWIQQtUx2nAGfASTfWMxBG22jKoesqQ7g/Wa3+BSHGoovgWM/SEoI
         wDQZZ5o/PUwH58qbOI5thjFRmN14A1dUWpN64GtEcBhoP46tvYeg2o4st+uZmgPOTF0I
         b5tI/y9oFEq5mDtvSwItSmGtx8li9dODAS5+iLrB247fuFwOZvq/2gsw6okNNl8HO2vT
         3uODxhogJFGnW6NRcGCi7IxEOZR1BhfaSnZuAezijkooo04vcjalFyxrHdtPB7bYfMzF
         pVv3QCJjzWQW0y2axXQgDQaCrnmGuibLQK5Lbjff8D5+MRjChZEaQiHGkCIQtKELx9jj
         iLbA==
X-Gm-Message-State: AOJu0Yw+NZsZE6dX/vPb5USnzOxsMRT8DQLoNqJU7PHzYCuI/gWoz0ry
	B6GnvqKyV5Sb94N8Dim0Owy4ThCChjm5hlzu2sa9okWDy1uol0uKO7ehdbUZV5k=
X-Google-Smtp-Source: AGHT+IEVGCeD2tM9LcGFGHmBJ+r7/F8U5I6RxMP8MFLTO92PxPlyG1PzNUzs0fbA+dDD2wknC9vMZg==
X-Received: by 2002:a05:6808:169f:b0:3bd:727f:9624 with SMTP id bb31-20020a056808169f00b003bd727f9624mr1825667oib.2.1706283487883;
        Fri, 26 Jan 2024 07:38:07 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id u19-20020a056808151300b003be012c9e19sm71884oiw.17.2024.01.26.07.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 07:38:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rTOHO-009S9B-F8;
	Fri, 26 Jan 2024 11:38:06 -0400
Date: Fri, 26 Jan 2024 11:38:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Timothy Pearson <tpearson@raptorengineering.com>
Subject: Re: [PATCH 1/2] powerpc: iommu: Bring back table group
 release_ownership() call
Message-ID: <20240126153806.GA50608@ziepe.ca>
References: <170618450592.3805.8216395093813382208.stgit@ltcd48-lp2.aus.stglab.ibm.com>
 <170618451433.3805.9015493852395837391.stgit@ltcd48-lp2.aus.stglab.ibm.com>
 <20240125155017.GW50608@ziepe.ca>
 <b825dd04-3d32-4fbd-91e3-523ddf96fc7a@linux.ibm.com>
 <20240126151701.GZ50608@ziepe.ca>
 <392247278.10124607.1706282995795.JavaMail.zimbra@raptorengineeringinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <392247278.10124607.1706282995795.JavaMail.zimbra@raptorengineeringinc.com>
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
Cc: jroedel@suse.de, gbatra@linux.vnet.ibm.com, Shivaprasad G Bhat <sbhat@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, npiggin <npiggin@gmail.com>, aneesh kumar <aneesh.kumar@kernel.org>, iommu@lists.linux.dev, bgray@linux.ibm.com, naveen n rao <naveen.n.rao@linux.ibm.com>, vaibhav@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 26, 2024 at 09:29:55AM -0600, Timothy Pearson wrote:
> > On Fri, Jan 26, 2024 at 08:43:12PM +0530, Shivaprasad G Bhat wrote:
> >> > Also, is there any chance someone can work on actually fixing this to
> >> > be a proper iommu driver? I think that will become important for power
> >> > to use the common dma_iommu code in the next year...
> >> We are looking into it.
> > 
> > Okay, let me know, I can possibly help make parts of this happen
> > 
> > power is the last still-current architecture to be outside the modern
> > IOMMU and DMA API design and I'm going to start proposing things that
> > will not be efficient on power because of this.
> 
> I can get development resources on this fairly rapidly, including
> testing.  We should figure out the best way forward and how to deal
> with the VFIO side of things, even if that's a rewrite at the end of
> the day the machine-specific codebase isn't *that* large for our two
> target flavors (64-bit PowerNV and 64-bit pSeries).

I have a feeling the way forward is to just start a power driver under
drivers/iommu/ and use kconfig to make the user exclusively select
either the legacy arch or the modern iommu.

Get that working to a level where dma_iommu is happy.

Get iommufd support in the new driver good enough to run your
application.

Just forget about the weird KVM and SPAPR stuff, leave it under the
kconfig of the old code and nobody will run it. Almost nobody already
runs it, apparently.

Remove it in a few years

From what I remember the code under the arch directory is already very
nearly almost an iommu driver. I think someone could fairly quickly
get to something working and using dma_iommu.c. If s390 is any
experience there is some benchmarking and tweaking to get performance
equal to the arch's tweaked dma_iommu copy.

Jason
