Return-Path: <linuxppc-dev+bounces-10472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F78B16563
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 19:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsfDm1yz5z30Vs;
	Thu, 31 Jul 2025 03:23:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753896184;
	cv=none; b=G/oCjbCX6DNk3Em5gAWJpPkfu1A0RU9kDy8bd94lhVNUNzM9MuEs88x+4bLmnyLhZK518iGBie+QJ6vAmtUYW2f4Vj9IN8m65ApHML+7ccK/bZV+HCTYrCc+AHHGhGvHv0i+u1EzqkownmXLcDP9veNb6ic2lbKykTEbSjEQRxEd7TBQ7sbbp/+o82jFyI8cmnMXDHmvRQTsNCSfU/KKP+MdTXU6hyJVwNkjyYSF5hsX6nuDi55zVe0bvi8P1hHnbAxN3FmzgXTGU+1iK/ZeS0bzacr35QosSfzY4xsEBnCFO4tWHFufcVU+43quxc0nndB+iwopa1nQlRgBBeCrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753896184; c=relaxed/relaxed;
	bh=RVG5g2ageWB6fvYTmlrchc1VftQuavVCJU6Q16hxq1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxtNMBDBUgZ/KL0v/RuYaVatEj1Fr/HoW+AC7XxIst8+k4azHwEut+93hGTI+YOK/26ExYaLBbfMwAp1aCh/vXS7GlCTEj9CeGg7PIYMruU1PcHU3jfWYXu8C3w8Vh6kqVSoytXT/Y/lRP8tM2T+ssQn1F7noUQnrEssaiOKXxtqwG9JEK14qy0aVv4GIklhDxNL2/bZ6VD1lmUscARMrQMPCrbp0SW+GMM8z3WWKyNpNdARXt0CiV1lQn2cHQfVZpD1GE08ZeA12qnIcjg1RTe5aWxU7jYlbGMYRdsIwYt+yGjz4m2RNXb56RBW+yZhoXEeUxSV3agWFE3uTcyfBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.54; helo=mail-ej1-f54.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.54; helo=mail-ej1-f54.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsfDl13JCz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 03:23:02 +1000 (AEST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so2845666b.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 10:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753896179; x=1754500979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVG5g2ageWB6fvYTmlrchc1VftQuavVCJU6Q16hxq1Q=;
        b=SQlnMU1TYaML1vooBGmrIVOg2BfQCyCDUyiesAttMRFoYyRm6EXlHJexiLrO27QeUy
         MnR8SkdJZI1cpHSd94l/2Q2sZHIkFj9gk1p6qxnNoZAOSAI1lGe/wpUEJlSVG6RWRDpq
         RpS/IUqOLpdC95yC+xgtnmkEcj7pHr1FPVumZWVZpBMcMX6fxYSV/Kg5nOpCgv2JQpjy
         Q8pDCM5Na9fMcw+dj15J0Bfg27/v/lgqR8RtBM+Ugge8SdLU5fu+o7YN/MKB4bofaIQR
         tbkTkfiM2x4ZJ68lvSE68ylejQ2qHpJ4r6+3mC6jkqc5D4PFySOYG39TnZsDR1H7m6hf
         sHjg==
X-Forwarded-Encrypted: i=1; AJvYcCXxW4CneeOr7c0+eBbvs4U3rxU+0TEyUDpkkP02X85BTRLzVG8C45GG3vx4S7YKAHhJRbfQnoveQ44W690=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxeCf6TyMc72gJEsoV3HV1BWFOZdaItg7HMAtCNIM4IQL5WG8to
	CZQ974bmV6xHAA+OhZXgD5TjxjGzySoXOKS6F3yNK7whm/7mrCjbMFf/
X-Gm-Gg: ASbGncuhHm+BDy5dQOQZK7CHIFqRWmEnWpaAsLZa+5mB5kRsX8qy2jc6Q3XRFAdQvBZ
	bQeqqhLcmG0IF2B6srMTImchZCF/YDRHX/ZsC3cAcNXmiWBENICt0ppr/cAwoeu1N4y39Z7GqaK
	DH/2nS0RXkERO/p1PVMIJfL2SCSZSer5SMigqpn1+aCgAu7mms7XEKV62WjtHW9B72RlsvN8rKj
	VLdIYN+9TnpSkxB27wtMJUzJRS4JhN+wDRVqk2yCuW2mcRcx46sR29JRb1M9r1fzotgU/YDdQig
	a41eSJ0/ZKvms7Vp2XRhVeSEHj9PKI0Q8bTa0D4qkp99UjsfEF58y7HDGmjyZyBCILIYb8VD3Ke
	aX13JG/AVzoT4
X-Google-Smtp-Source: AGHT+IEUbbT7MGZ9RPV14AyB319B+ILu1Zn4HTqqRjqhmc6jefo1B6r2lcAh4WufQuwJ5cKV1ZycMA==
X-Received: by 2002:a17:907:3d0f:b0:ade:3eb6:3c6 with SMTP id a640c23a62f3a-af8fd71454bmr552748166b.15.1753896178789;
        Wed, 30 Jul 2025 10:22:58 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:9::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a63a5bsm781297566b.93.2025.07.30.10.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 10:22:58 -0700 (PDT)
Date: Wed, 30 Jul 2025 10:22:55 -0700
From: Breno Leitao <leitao@debian.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, 
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, 
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev, osandov@osandov.com, 
	konrad.wilk@oracle.com, linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <4w7adjalaisxhdx4l2zzl6ghanky4geijl523q2ezz7b5kj4kq@fr44nlwsw6qa>
References: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
 <7ce9731a-b212-4e27-8809-0559eb36c5f2@linux.alibaba.com>
 <4qh2wbcbzdajh2tvki26qe4tqjazmyvbn7v7aqqhkxpitdrexo@ucch4ppo7i4e>
 <fdb5dced-ea5a-48b8-bbb4-fc3ade7f3df8@linux.alibaba.com>
 <ldlansfiesfxf4a6dzp5z2etquz5jgiq6ttx3al6q7sesgros6@xh4lkevbzsow>
 <4ef01be1-44b2-4bf5-afec-a90d4f71e955@linux.alibaba.com>
 <2a7ok3hdq3hmz45fzosd5vve4qpn6zy5uoogg33warsekigazu@wgfi7qsg5ixo>
 <a87c5e74-082f-4be6-bbfd-4867bf72ddcc@linux.alibaba.com>
 <zc4jm3hwvtwo5y2knk2bqzwmpf7ma7bdzs6uv2osavzcdew3nk@lfjrlp6sr7zz>
 <20250730182137.18605ea1@foz.lan>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730182137.18605ea1@foz.lan>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Mauro,

On Wed, Jul 30, 2025 at 06:21:37PM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 30 Jul 2025 06:11:52 -0700
> Breno Leitao <leitao@debian.org> escreveu:
> > On Wed, Jul 30, 2025 at 10:13:13AM +0800, Shuai Xue wrote:
> > > In ghes_log_hwerr(), you're counting both CPER_SEV_CORRECTED and
> > > CPER_SEV_RECOVERABLE errors:  
> > 
> > Thanks. I was reading this code a bit more, and I want to make sure my
> > understanding is correct, giving I was confused about CORRECTED and
> > RECOVERABLE errors.
> > 
> > CPER_SEV_CORRECTED means it is corrected in the background, and the OS
> > was not even notified about it. That includes 1-bit ECC error.
> > THose are not the errors we are interested in, since they are irrelavant
> > to the OS.
> 
> Hardware-corrected errors aren't irrelevant. The rasdaemon utils capture
> such errors, as they may be a symptom of a hardware defect. In a matter
> of fact, at rasdamon, thresholds can be set to trigger an action, like
> for instance, disable memory blocks that contain defective memories.

Sorry, I meant that Hardware-corrected errors aren't relevant in the
context of this patch, where we are errors that the OS has some
influence and decision.

> This is specially relevant on HPC and supercomputer workloads, where
> it is a lot cheaper to disable a block of bad memory than to lose
> an entire job because that could take several weeks of run time on
> a supercomputer, just because a defective memory ended causing a
> failure at the application.

Agree. These errors are used in several ways, including to detect
hardware aging and hardware replacement at maintenance windows.

In this patchset, I am more focused on what information to add to
crashdump, so, it makes it easy to correlate crashes to hardware events,
and RECOVERABLE are the main ones.

