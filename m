Return-Path: <linuxppc-dev+bounces-1026-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B52796CAA1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:56:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzdC010Lwz2y8h;
	Thu,  5 Sep 2024 08:56:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725490572;
	cv=none; b=il/EJO1mT1SAAAbVkENFZQFYTBj7y8Wf4g8XeSpXhDtxgjpgTMwDz6AUGDkbGLkjRffWCbEKoxYb8539Wg3IJj6aROA27xx1cq3cbm/5KHJHU/gHDIitygTGI3QQeLYsDUeOTX8psKjLU73MeS3BXdVvHVxx/hCHo4oO8m5zYMufHD0RlOv5CSQGpwsEDC8ZhSwGn9//4hVtJSvoSs1ieZCEixy8YB/zuf+ibMNEzaCX1WY/aiTHtDa7DoA29yR3faKDlTrTiml/Twnq8hIkt7XnwUunXxpvjZtes7vipIiume2Pf70MJnbwswdAaiKUv89+aK4XoaBILetpRFGfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725490572; c=relaxed/relaxed;
	bh=35/vvYnjYcTahPnX2Ak6JC2o1aEV4aWjtE37kGrVzrs=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=XkF6uscC7TgChgA5I3iiczpZTQDEvFLM7yBP3yTp4EsyB9rWjFhmW1ANvAye6kbFKyH++AYBEGSPIYkpIkoTrmbtdxW1RiUrPy3SiYfzylr/9KL9at7mweZl8PrJz3YaW7Q+kjQ5259ybdOQvlrOpQsTroXKq/dlpZ934b6ExqO0LEL5aRBkpd5Be5yrE+uQe/7mpCEmngAty+SHecgGpmtrHM/x54LjgVQJ1/9xpXRoSXy7Kkw6PTFnFFl3btrp6ERj7WBlNXa0DW94R6QIY1pPZ3NevLtAmRYzXi9THMmtxxOc7wDOYQxoES8TnuMZ44jLc+IUfcST0ralKPfNLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com; dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=d2jkLwGZ; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org) smtp.mailfrom=osandov.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=d2jkLwGZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=osandov.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzdBz36n1z2xst
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 08:56:10 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7143c9e68a3so14358b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 15:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725490568; x=1726095368; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=35/vvYnjYcTahPnX2Ak6JC2o1aEV4aWjtE37kGrVzrs=;
        b=d2jkLwGZPkINts1CDevsM2F36sLdrn+VIau23H6sWAuGMZTSiPsRNmbf2iq+e9008d
         D2Fxn1/uHo6PZidMHkgJz955bq2wqo5sRXaFl6Wz+oULEncu88HiDSqUxMkEmhjwCj4M
         W3Ua2vqYdGm4/9R7vplKdFxREB5yJKsmOKmb21WKbzQ5YknryERelt+TWRWYtE3Nc0rP
         5jGUyS6DBiC+EWNHRGgoFqKx8rfWYU7ChrtuPtbwyuax4Q3/EeYtApK4f6b5S2GnMKo1
         PRwAMTgEOm8gdyZu0O0Xi2JFyvIteEZAavIT/oy7hEEWTvZPGpQ3+0y4snO2GQd51J5+
         2frA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490568; x=1726095368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35/vvYnjYcTahPnX2Ak6JC2o1aEV4aWjtE37kGrVzrs=;
        b=SiLwZ2vPUmPiLdjxYs7iYxV20wjv4PMuNoymmxVzW1Ds1DZWz6WN4j6IdmCfQl8Rgd
         Ya3CWXwdslB78rjR5rR/8TtcjkwXtuUdU55Bryouc1h0UebMG8Gj9xuMpQcaVE3IIdz/
         oadhhWv+SXJXDgxGKrNdyqSdmr/43e7xtzyceG/M77GQVrboe16svLeG1BvJmIq4E21y
         ETbm0RSjd6nZYC4autidLVBMWjPcNbiSLOiQUWbeXQYeNkMjoZe3SfRojnwAz/K0E/IV
         7kv4ecpAevGr7dA29ABv32bFuXSMH0h5BiORc9W/dUkkHCMfNHnELiL196mOEjdP0S3H
         wZ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbGilhCfdKMAYJud8PL52HHVZj5/lZYoqo/wAHoczI0ea2bDWTghDoRhshH1iv45U5PVmERLX8/5Q0eWE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YybnHemOcmLEaZn1qu0w9iL9Kj2X01gTirMjuKrUksGUnM1Hdwm
	B0C71gVpDekCwP3Lr/TOsiNuKSvfCD/5ipzVrnlmMK3T80wfwMOHV30Hi1N4Upc=
X-Google-Smtp-Source: AGHT+IGJMJTzWYcjGTZbRrQ6IDaoYzbHR/wGLI0wH+MKCl8eX8iKTnn29gVdjQTwsOFAi2AC/JBGeg==
X-Received: by 2002:a17:902:f545:b0:206:b618:1d8f with SMTP id d9443c01a7336-206b6182580mr23287495ad.11.1725490567622;
        Wed, 04 Sep 2024 15:56:07 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:500::4:761e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae9525cbsm18305395ad.99.2024.09.04.15.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 15:56:07 -0700 (PDT)
Date: Wed, 4 Sep 2024 15:56:04 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Benjamin Gray <bgray@linux.ibm.com>,
	"Christopher M. Riedl" <cmr@bluescreens.de>,
	Christoph Hellwig <hch@lst.de>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org, kernel-team@fb.com
Subject: Re: [PATCH 2/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
Message-ID: <ZtjlhFbeFZtxzmTb@telecaster.dhcp.thefacebook.com>
References: <cover.1725223574.git.osandov@fb.com>
 <f0e171cbae576758d9387cee374dd65088e75b07.1725223574.git.osandov@fb.com>
 <64e74f4d-948d-442e-9810-69907915401c@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64e74f4d-948d-442e-9810-69907915401c@csgroup.eu>

On Wed, Sep 04, 2024 at 09:50:56AM +0200, Christophe Leroy wrote:
> Hi,
> 
> Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> > [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: Omar Sandoval <osandov@fb.com>
> > 
> > I found that on x86, copy_to_kernel_nofault() still faults on addresses
> > outside of the kernel address range (including NULL):
> > 
> >    # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
> >    # echo g > /proc/sysrq-trigger
> >    ...
> >    [15]kdb> mm 0 1234
> >    [   94.652476] BUG: kernel NULL pointer dereference, address: 0000000000000000
> ...
> > 
> > Note that copy_to_kernel_nofault() uses pagefault_disable(), but it
> > still faults. This is because with Supervisor Mode Access Prevention
> > (SMAP) enabled, do_user_addr_fault() Oopses on a fault for a user
> > address from kernel space _before_ checking faulthandler_disabled().
> > 
> > copy_from_kernel_nofault() avoids this by checking that the address is
> > in the kernel before doing the actual memory access. Do the same in
> > copy_to_kernel_nofault() so that we get an error as expected:
> > 
> >    # echo ttyS0 > /sys/module/kgdboc/parameters/kgdboc
> >    # echo g > /proc/sysrq-trigger
> >    ...
> >    [17]kdb> mm 0 1234
> >    kdb_putarea_size: Bad address 0x0
> >    diag: -21: Invalid address
> > 
> > Signed-off-by: Omar Sandoval <osandov@fb.com>
> > ---
> >   mm/maccess.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/mm/maccess.c b/mm/maccess.c
> > index 72e9c03ea37f..d67dee51a1cc 100644
> > --- a/mm/maccess.c
> > +++ b/mm/maccess.c
> > @@ -61,6 +61,9 @@ long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
> >          if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
> >                  align = (unsigned long)dst | (unsigned long)src;
> > 
> > +       if (!copy_kernel_nofault_allowed(dst, size))
> > +               return -ERANGE;
> > +
> >          pagefault_disable();
> >          if (!(align & 7))
> >                  copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
> > --
> > 2.46.0
> > 
> 
> This patch leads to the following errors on ppc64le_defconfig:
> 
> [    2.423930][    T1] Running code patching self-tests ...
> [    2.428912][    T1] code-patching: test failed at line 395
> [    2.429085][    T1] code-patching: test failed at line 398
> [    2.429561][    T1] code-patching: test failed at line 432
> [    2.429679][    T1] code-patching: test failed at line 435
> 
> This seems to be linked to commit c28c15b6d28a ("powerpc/code-patching: Use
> temporary mm for Radix MMU"), copy_from_kernel_nofault_allowed() returns
> false for the patching area.

Thanks for testing. This patch isn't worth the trouble, so we can drop
it.

Thanks,
Omar

