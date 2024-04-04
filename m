Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40C8986B5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 14:01:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PTcIfipk;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PTcIfipk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9KwN4q3cz3vjc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 23:01:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PTcIfipk;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PTcIfipk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9Kvc0Qhvz3vdr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 23:00:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712232054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfuooD1IfgatoIS7OAIU70Y79yHtd6slmR6Wd2lGo90=;
	b=PTcIfipkFMzHFYd7yVMhlS2XO+r6De9ENvqodeUNcp4851UX0N+SJVG7GkqCCD6WcblYs7
	zfc8Pg+K83BxtJMnn/ABGm10ahlZq7AzPZbE6DUa2ANpVxHFjSDe7NrkQfy9mteGwcOqBK
	vuaHe+Fbcf8SIV3OygN/S1PTM41MFgY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712232054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfuooD1IfgatoIS7OAIU70Y79yHtd6slmR6Wd2lGo90=;
	b=PTcIfipkFMzHFYd7yVMhlS2XO+r6De9ENvqodeUNcp4851UX0N+SJVG7GkqCCD6WcblYs7
	zfc8Pg+K83BxtJMnn/ABGm10ahlZq7AzPZbE6DUa2ANpVxHFjSDe7NrkQfy9mteGwcOqBK
	vuaHe+Fbcf8SIV3OygN/S1PTM41MFgY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-CbgIIuSeOKqUeJwYZOFB2Q-1; Thu, 04 Apr 2024 08:00:51 -0400
X-MC-Unique: CbgIIuSeOKqUeJwYZOFB2Q-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-69939cb15faso101476d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Apr 2024 05:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712232051; x=1712836851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfuooD1IfgatoIS7OAIU70Y79yHtd6slmR6Wd2lGo90=;
        b=Ermf+Qfbt6PIWvgZcvXtxbaKpxpvCjD+7B4a4kQdRBPeTZYxETPlezIBixS3oqS46e
         qhd6UUQWrtpPfbObsd0ThIBlYUHefKjKA8n3Ez7i6z9aQ4KJJN++YW/5nO6PeS8JAMUN
         +YEqliH2O9kTEG/d+istHsG05tq0W7pg84niFekEshvp3j4cyl32DPtuPFHq307ofP33
         tPWZ+c4ArlMDimvGxunX0AojVtR5onxDGSVrTKlQFZtp8R/r+ARBvulAusw2fItp1lA1
         eWgR8/1zwW8e50dwwWUF0rl/Y++2beGZfIC72qitzl3kX8fKixVtVLzCwiHpZTwbObAv
         QaGg==
X-Forwarded-Encrypted: i=1; AJvYcCWpOPvlehyCriZvAHK0pavcAUNzkY7g/4YC0Zr/rb18QHoBHkh3gEcIdbQNw4yaIT+7/7X8qczLH6/wCTFz1SZjeA0PqSlp9OefWqrvOg==
X-Gm-Message-State: AOJu0Ywa2i8lXjwmY512e+PNjDT0kV5z/ZmZEWjMc5dBjXhp6IDSEXzR
	XHH1PKo6Zt/yneJEy8ybG3CoLMgmSdoa6L+i4//a+Y7Oxj2GB6bquukcvZc0+Q3KD886m8QFtti
	q1cMvTCxH5PNo8C5kytD+JcVIbQ3b+tcRaZH7ktEZGfNE4GfVOYyP6Ka5UkKovuU=
X-Received: by 2002:a05:6214:5007:b0:699:4d3:98dc with SMTP id jo7-20020a056214500700b0069904d398dcmr2122680qvb.0.1712232050901;
        Thu, 04 Apr 2024 05:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMCWtQWiLpesBQTQo5kp7GWlhuKWfgLgdLeENDjrnl6Gj4+sgwXTUEXT7yElLHvch56DwpwQ==
X-Received: by 2002:a05:6214:5007:b0:699:4d3:98dc with SMTP id jo7-20020a056214500700b0069904d398dcmr2122629qvb.0.1712232050343;
        Thu, 04 Apr 2024 05:00:50 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id jf14-20020a0562142a4e00b006987021a724sm7171209qvb.118.2024.04.04.05.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:00:50 -0700 (PDT)
Date: Thu, 4 Apr 2024 08:00:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <Zg6WbzWkoLtbY2LZ@x1n>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
 <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com>
 <ZgyWUYVdUsAiXCC4@xz-m1.local>
 <20240403120841.GB1723999@nvidia.com>
 <Zg2fEP4eEeLhgDwE@x1n>
 <20240404112404.GG1723999@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240404112404.GG1723999@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, WANG Xuerui <kernel@xen0n.name>, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 04, 2024 at 08:24:04AM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 03, 2024 at 02:25:20PM -0400, Peter Xu wrote:
> 
> > > I'd say the BUILD_BUG has done it's job and found an issue, fix it by
> > > not defining pud_leaf? I don't see any calls to pud_leaf in loongarch
> > > at least
> > 
> > Yes, that sounds better too to me, however it means we may also risk other
> > archs that can fail another defconfig build.. and I worry I bring trouble
> > to multiple such cases.  Fundamentally it's indeed my patch that broke
> > those builds, so I still sent the change and leave that for arch developers
> > to decide the best for the archs.
> 
> But your change causes silent data corruption if the code path is
> run.. I think we are overall better to wade through the compile time
> bugs from linux-next. Honestly if there were alot then I'd think there
> would be more complaints already.
> 
> Maybe it should just be a seperate step from this series.

Right, that'll be imho better to be done separate, as I think we'd better
consolidate the code.

One thing I don't worry is the warning would cause anything real to fail; I
don't yet expect any arch that will not define pud_pfn when it needs
it.. so it can mean all of the build errors may not cause real benefits as
of now.  But I agree with you we'd better have it.  I'll take a todo and
I'll try to add it back after all these fallouts.  With my cross build
chains now it shouldn't be hard, just take some time to revisit each arch.

Thanks,

-- 
Peter Xu

