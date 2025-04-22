Return-Path: <linuxppc-dev+bounces-7930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9235A97B2B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Apr 2025 01:43:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhzM61pcLz3bmL;
	Wed, 23 Apr 2025 09:43:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::730"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745365394;
	cv=none; b=QgpWPeiUm80ZdZGSsU1WxQ0gAOe5JDZggZIQ4lWsJDgYhl3ZshCmvXzbEiHBE8YdGa6QMBiPV71XbkM6LscoWR7DMNqZn9YypDrM5KBiSNlBetxN1EMJdaYp/g3D67tVeO45K6K8yFVt81QsgeTZcQCY2hbreD8PZiZ8jVbjpFOpEjsrtoKRQ6erTjVWN00zhENDgiKCCPnTg8JZ6RvnUDeMk1N7wknCsFE7pXIxV/4cz5WSt30Ql409T2M6bElouPY8UMnOkxzpoH2DmD1TOwnEqQGiM2KQ36ApYnj/ZlDcSc4R8PnOHjUZDON9OK8L7AmywzmRoWGwDUIR9YdVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745365394; c=relaxed/relaxed;
	bh=H8Zxh8t9YCpxlI0ZgT0ViWXKWEXuTyrLctSuix77HrU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLBvxNRL2K340XL9ywT5bR56r77SYuaI0k4rJ0r1YOf2je8n3Azhy2LJPJUxzSaF9no/1msm87euylB74r6Vra6FwvNe+z44jJLbppAdKsjdAEMXLzEBtay4/+pHxQDmZBewvW/W8x+OxUxNyHzeTuDEglol9maGRWX9KkLliBg9BcqafogYzm/XzMuua2Tr0JnSwRqepdiC+HxdFYT6bFuW16gQgJ9Bi61Ahl11dpP/xYey2mi2VqqTOI/9vAhrwJ3jhIIDvgvpM6VEZVNGHW6BYH0wnlVZvtizEX1SOLiLoYQ5efQGbMXP6HF0R7A3YWlAq/zUBTlu/KBhTZmjVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=LuIlfWYM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=LuIlfWYM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhzM40WTTz3bb2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 09:43:10 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7c5a88b34a6so543326185a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 16:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745365387; x=1745970187; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H8Zxh8t9YCpxlI0ZgT0ViWXKWEXuTyrLctSuix77HrU=;
        b=LuIlfWYMw5cMga/bnsdpiueuNDiTnI5H/JaHFVSJBtrjZNl+N9YWW5+25NN7V6yr2+
         NzLBBY1Hovr/Iq3JVa+0btEMCgCcHJKW3Ioy2nv95DeJmET+VO6FyjATB8RLGV8NAfzA
         PSOSwnjfoTetuP2CZKo/4CerHpfS4onjHGW281CWA9M3PUSpyODK8QrWNpfzvjSW2hmV
         C4LV/pGl2ndHHTtocKLnhsJvt7D+6dLrd9QHnhJSB1sN/K8XvhmYotWv1bJbdSdIQlLF
         cZF38tVInJGtm45fdW92MW7tIdJ6SAhKG33yTQ6wfH+V4pv4RTpp5h9uQTtkhA7d5qen
         pJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745365387; x=1745970187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8Zxh8t9YCpxlI0ZgT0ViWXKWEXuTyrLctSuix77HrU=;
        b=B2V9O9kTbkhDw/o6k98NzxqKfRDVdTs2nW5WBTMGn4EszpTtt2JoTmsrua78bbDUh8
         8u69AG8ubE5Nr+/DCit1HANOvZ7IjAntG4Xel7iIrqb70JbDRDtNzQaok6wLTJZT/6tq
         akl9C5LPDVAsFtt+TzDsv3C6QMV2/8xRALnXATfQRpphyZQdgu87NTB17EKUg+tjdtVc
         fRHJwnfjIA5EMrsN4lv4dgTMCD9d8nymjC17pS8lpVzpvfCyMIsArv8Lzb+tsxuOG4mg
         7fe9OFR6xlGKrmXK0RZGiP9yuowHV1ulzYBd06OKOn10j2S4CCDmQiCE9TdvZogn9154
         Z1pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwVF0oL6ZuPBdFcv3t+0PizNYP45/7Ny1h5rWETAjH3qyxdWtl8t7SD7u98xkW/MRXjd6njHNmWfr2jg8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxxVyeJzUZuizHddSKwU7/bfIAv2qbTLn4LvwZmGjxBAldQU5+8
	bkwZLTWqs9jYXcmpshM7QP4xEO8aqKCTNBu2gH24CmsVlwu4UXLLI43t0LY1zK0=
X-Gm-Gg: ASbGncub7GpGndlowtM+5ldtpGojIDb+RZnuutk++yfNvfuANaA0J7OhVrhA9xseB5H
	o/UyZyVLHEDu+0IYEzYubx+v60XX9XOHlKSt+ntrmwFMlZMreKw8BlJQ69eOkz6XsjNWPICald7
	EYK0y7SkwWlVtK84c4e1zKI2Nij6EdCV/NbxwxHMgIE8CH5yhdzPn0scVcGZp0EUOk2odzd1VKE
	vMZ2gBcGQseT1DioWhIhqFsxP6KTavrTnpZDsxmMIfAH/Azg10Al5dfl07FaF76ey6A+2xYE3+J
	fBM1rIdPAN+qa3hOgXXDefG98ohZvPdTok0vfTfYvpZF2d7Oc2Hg2ciBsd/TnxYYxEwbEwIdS2g
	ZmXwQIostBP7bVJycIkg=
X-Google-Smtp-Source: AGHT+IF0d7xIg/JkBNfKB1dvFEqi+nm6q/lLlUP8QDJzin7elXIwVxFKdmisgA6rLVL2E6mqGZK00Q==
X-Received: by 2002:a05:620a:44d6:b0:7c7:a5cb:2b65 with SMTP id af79cd13be357-7c927fb2214mr2562644385a.26.1745365387014;
        Tue, 22 Apr 2025 16:43:07 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b69579sm611812185a.91.2025.04.22.16.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 16:43:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7NGb-00000006xvD-2euk;
	Tue, 22 Apr 2025 20:43:05 -0300
Date: Tue, 22 Apr 2025 20:43:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] fsl_pamu: Use 40-bits for addressing where appropriate
Message-ID: <20250422234305.GE1213339@ziepe.ca>
References: <2025042122-prudent-dogfish-eac6bf@boujee-and-buff>
 <20250422190921.GB1213339@ziepe.ca>
 <2025042218-beneficial-wildcat-77dd3e@boujee-and-buff>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025042218-beneficial-wildcat-77dd3e@boujee-and-buff>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 22, 2025 at 06:21:32PM -0400, Ben Collins wrote:
> On Tue, Apr 22, 2025 at 04:09:21PM -0500, Jason Gunthorpe wrote:
> > On Mon, Apr 21, 2025 at 10:46:19PM -0400, Ben Collins wrote:
> > > diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
> > > index 30be786bff11e..a4bc6482a00f7 100644
> > > --- a/drivers/iommu/fsl_pamu_domain.c
> > > +++ b/drivers/iommu/fsl_pamu_domain.c
> > > @@ -214,9 +214,10 @@ static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
> > >  	INIT_LIST_HEAD(&dma_domain->devices);
> > >  	spin_lock_init(&dma_domain->domain_lock);
> > >  
> > > -	/* default geometry 64 GB i.e. maximum system address */
> > > +	/* Set default geometry based on physical address limit. */
> > >  	dma_domain->iommu_domain. geometry.aperture_start = 0;
> > > -	dma_domain->iommu_domain.geometry.aperture_end = (1ULL << 36) - 1;
> > > +	dma_domain->iommu_domain.geometry.aperture_end =
> > > +		(1ULL << PAMU_MAX_PHYS_BITS) - 1;
> > >  	dma_domain->iommu_domain.geometry.force_aperture = true;
> > 
> > What on earth does this even do? There is no map_range() callback in
> > this driver, so nothing should be reading geometry..
> 
> I dunno, but your "FIXME this is broken" comments are all over it from a
> year and a half ago:

Yes, I know, but you are changing this - are you changing it because
something is broken without making this change, if so what, or are you
changing it because it looked like it needed changing?

> The logic hasn't really been touched in 10 years.

Yeah, so I'm surprised someone still cares about it :)

Jason

