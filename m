Return-Path: <linuxppc-dev+bounces-860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F971967F81
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 08:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WxzRR14XFz2yMt;
	Mon,  2 Sep 2024 16:31:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725258675;
	cv=none; b=gfocWdvyHWA+MlCDRSaSJBWbb2rlsxBTJ/fQY2U5o7t+2YlViQHEbkhMxQvLBXa+ehlXPVTGAmAT+439xxE8qQR1/ufABzUb07Se1V7HXQ5Fe3MLEhBI3U1VmrPz8YBdXxydwlHKi83IvPVJpXUCUJUGI7dGpRC6Jss0vsPdsNgcOjkYNeZdjwV0uLrEP9UbE9UqQEHxcI6YgYKrDE14fxQkrZrK83iXsIpOMHacxQHwgYy+QyBIiYbP6q7KbfD3QnWf9IiktqNK2dQFATI9ScBOTVkEy5TdNURcYlUprgkC9Ddz+93LJQqppUhlrSwmil15frxZ1q7Zo/hDkbK+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725258675; c=relaxed/relaxed;
	bh=4QRHpO2u5pbpxFjPI4wQ+JqY+Z37bYljgBG+DFxhCvw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To; b=j9UGV1o+2/eh+3KWrEU9Qvb5Qy3MujVTJAfOBOizmYSch8cRQaZrYKJSU6ETQjeRJxJsLf9ahx52/3y17QZem6xUs3EmhP4y3HIYHtGKOxUy6/ucbEflQjx5S06U6YZoVF1k0mx+hsxnuMIo5+fFjnEpu5l2kIz6mdE/R3W8GWE0cUYV+vItwV+AIBmeERD4D4x/XIxfHZDqoMDnh3/hsWZR6T4MtkHqvJ3Q8f1We+g+klVNDB+DdxDIVmugK6hsprrxcRZb43B3grsoqOtNAo4F+o7jzjuw9S2mjzuV952ZU1fTrdvXVmJqf4rmImzE8JTjg0/+idGrGIaOBpS2Rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com; dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=l6ooc7qy; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org) smtp.mailfrom=osandov.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=l6ooc7qy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=osandov.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WxzRQ5x4Qz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 16:31:13 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71428f16b09so177317b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Sep 2024 23:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725258670; x=1725863470; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4QRHpO2u5pbpxFjPI4wQ+JqY+Z37bYljgBG+DFxhCvw=;
        b=l6ooc7qyIvpiQ0GrDIbhzanaYEJq2InXaCSREFbcf1LWU9lmISazxsmxKAJTCiMik6
         9UG3d1nHc2myE+z8A/qOJvIcaKg3K52VRx0YDcYzuwdRKYFQxbmL/b9O3SdN17p1BxjH
         6ChCGXJl1NLJXXi5p4NWjqS5xwSXbe95HnF4TxunUFofLPuistv1Y2oKK3Xlm3BYbvN7
         MUvhwsLvy2yeldYc6WblG0S1RA0hEgc4hwiQi997q4yB46NPXgqh447hiKMyuBpVG+ZE
         sjFsKRJOeltnRjeLCtpkPYsBvWdp2Vp/AA8y8cf3dJBLbHnvY7SG6AP69zYZ19ks/sjs
         2F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725258670; x=1725863470;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4QRHpO2u5pbpxFjPI4wQ+JqY+Z37bYljgBG+DFxhCvw=;
        b=gI07NWhHzZBvoFnd2OvOy+d0dxS0rlopPrtjaed4u37K7N6TKW+gnzqwZ+E8jRIZ6m
         qB7sETs+KNESRLr1dvmZUaoUykh/mkuBuuD725ypAeM4S8UVau00L/DS+n46PzTGebRX
         noWDckW6Zs/6nw9FjRmrMNAUaHiE28iz6P+/SzEgWiHqaXDD8+6x2Nnm7ai88R2oFknw
         aILIAeeNZqHIn754iq5yRL+FasFoQaY4IkCoOCTtVZ1LW0FrxO7w6GrP2IGLsMHToeVf
         th99I1seON9seEQab/Ytx5AGPHcFhrwLu3IG/HnshvzNdMWSMW+KHPYVFCws9EOILNAP
         h0fA==
X-Forwarded-Encrypted: i=1; AJvYcCUdj901uAasyS2NMKSX3xUKjVgG8tZRkar5y7KMjc/e9VuRhYcKj5YBY4K+ZKdIPtmDbxnLGV2q+K7/VDg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxpaNXKoZoLOLTP9UY035Kn1DO3a43WOqOPMJsU1MKtkV8X8FJ7
	hWUMaWqNa6GGyzHHukeo8fRzsSGFbgIgAS6ev4urZysh17ClnSCRe0W82kp9+9w=
X-Google-Smtp-Source: AGHT+IEamVmuc71sTYPdHjFxuF/z2Kir18akAJnclZjSyzrG4uveb/oGnmnZ8wSmLeO97ZW2P5fb1A==
X-Received: by 2002:a17:902:da86:b0:1fb:1ae6:6aa7 with SMTP id d9443c01a7336-2052750795amr58817315ad.3.1725258670426;
        Sun, 01 Sep 2024 23:31:10 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::901f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515542350sm59747515ad.213.2024.09.01.23.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 23:31:09 -0700 (PDT)
Date: Sun, 1 Sep 2024 23:31:08 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org, kernel-team@fb.com
Subject: Re: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user
 addresses
Message-ID: <ZtVbrM4rQsGFJo_t@telecaster>
References: <cover.1725223574.git.osandov@fb.com>
 <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>
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
In-Reply-To: <5fa50d78-6764-4f99-87b3-7bd7edbeea5a@csgroup.eu>

On Mon, Sep 02, 2024 at 08:19:33AM +0200, Christophe Leroy wrote:
> 
> 
> Le 02/09/2024 à 07:31, Omar Sandoval a écrit :
> > [Vous ne recevez pas souvent de courriers de osandov@osandov.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: Omar Sandoval <osandov@fb.com>
> > 
> > Hi,
> > 
> > I hit a case where copy_to_kernel_nofault() will fault (lol): if the
> > destination address is in userspace and x86 Supervisor Mode Access
> > Prevention is enabled. Patch 2 has the details and the fix. Patch 1
> > renames a helper function so that its use in patch 2 makes more sense.
> > If the rename is too intrusive, I can drop it.
> 
> The name of the function is "copy_to_kernel". If the destination is a user
> address, it is not a copy to kernel but a copy to user and you already have
> the function copy_to_user() for that. copy_to_user() properly handles SMAP.

I'm not trying to copy to user. I am (well, KDB is) trying to copy to an
arbitrary address, and I want it to return an error instead of crashing
if the address is not a valid kernel address. As far as I can tell, that
is the whole point of copy_to_kernel_nofault().

Thanks,
Omar

