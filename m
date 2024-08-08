Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B810894BFB7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 16:34:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEQgiL4q;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N/B5u2Oe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfqM24gwFz2yQl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 00:34:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEQgiL4q;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N/B5u2Oe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfqLL5XSNz2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 00:34:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723127650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kNGFee3br1hjECiovXqSOfAESUmkPD9eLr9HZ2AG11Y=;
	b=jEQgiL4qx0CPgSaHT3tTmlV48jxGwyG+0n7s+hy5Lmht8TBNR2aBM9jqOFXV5cTeueIj3B
	zyL4jYL4jdaJmTKQfD8LF1HfEvk+M2r73DvbUQKL25C5F4Qfe50Md+C+5sjniGlzwr9Qgg
	oG8Ws856gKgaEhveZcpH5rgb1t5WETs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723127651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kNGFee3br1hjECiovXqSOfAESUmkPD9eLr9HZ2AG11Y=;
	b=N/B5u2OeXdItb/iYVvlVm1qw0+yf97b/QogbH5JYvkMI90r9DF+ijPFpu8YSepareYaErQ
	jd7WnMwpthn9HnB5jy6d9JQKV7EP5LkgdWLt1KXAiybrZHWnSa2lUUT7uXhmrTqF1zoGoq
	UGz1Xo70ZZtYi7VO5BGqbUySQV76EbA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-cpsBj3N3OJOYXM2pzvSs9Q-1; Thu, 08 Aug 2024 10:34:09 -0400
X-MC-Unique: cpsBj3N3OJOYXM2pzvSs9Q-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7a1d5ee7762so780285a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 07:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723127648; x=1723732448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNGFee3br1hjECiovXqSOfAESUmkPD9eLr9HZ2AG11Y=;
        b=VuKa8k7dRVGHw0OGAoRCtxStPFctFRumDWX1sb5mDLydfu4bn6oFlbw219U30GcKhK
         IIbf+x9MifJ8BKYJgHKS2wmto1D9Ypo43UPEkDFmCtDPHVk9E08rJLuYh3hyRXTi27pH
         SufldraTu0Qa519EqHRAoDWQ7lsviMyimnIsRsAy6uZtgMx/aEsqNc9vkPhAmca3u//D
         jNK8U+L20A1NKpw93CRLV8pyAcYJdI0RjLo3PKh1ByCuqbtZbBJiDnzvvymAnCHOFMvt
         bVpzopNC3dxACvX55jzZKDbMk80eGdxKNtWBQjRR6UsohgS+jBjLnsoGjtpI4uybvMj/
         DpaA==
X-Forwarded-Encrypted: i=1; AJvYcCXBhzphnqyRETyC4qb8LVFszW54FUSA4fuKAqn4mitZJQAuTR2wFsnWmZscNsAfW6hSjP03q48c7lgkuMw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6TaSEXm4fkD4HPcyNIv5eFxGR1DmsTDAuIYraS1nBeI5y4o2t
	uJvFM0cVqyR4EY7qK+2SXC5cnlIJ8+3GtPpuPAe+lQ7TIls4njWLAT/u7kRpBQg4sQPcc0r709v
	h5RN/t5UVwYVApYw+UMgYXkb2BcTz7qYNVqh/e/yk3wnI5YMj8FUHgbwCqLK4Yv0=
X-Received: by 2002:a05:620a:192a:b0:79d:595b:d4ea with SMTP id af79cd13be357-7a3817ee628mr147831685a.2.1723127648622;
        Thu, 08 Aug 2024 07:34:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkrMT/qf2Z1Zwec6CCoJX/CvM7BpTtL4mQOwgoVFYQ8j/2utHXaaQU95bCId/QVjyX8fpcMA==
X-Received: by 2002:a05:620a:192a:b0:79d:595b:d4ea with SMTP id af79cd13be357-7a3817ee628mr147830185a.2.1723127648196;
        Thu, 08 Aug 2024 07:34:08 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a378693d23sm164459085a.87.2024.08.08.07.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:34:07 -0700 (PDT)
Date: Thu, 8 Aug 2024 10:34:04 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 0/7] mm/mprotect: Fix dax puds
Message-ID: <ZrTXXJ8r_WpPgcU4@x1n>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807141703.d641001ee14177ccf80a31d8@linux-foundation.org>
 <ZrPoUgISLqlF-iEQ@x1n>
 <20240807144454.15a9668c23d05141ae777696@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20240807144454.15a9668c23d05141ae777696@linux-foundation.org>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 07, 2024 at 02:44:54PM -0700, Andrew Morton wrote:
> On Wed, 7 Aug 2024 17:34:10 -0400 Peter Xu <peterx@redhat.com> wrote:
> 
> > The problem is mprotect() will skip the dax 1G PUD while it shouldn't;
> > meanwhile it'll dump some bad PUD in dmesg.  Both of them look like (corner
> > case) bugs to me.. where:
> > 
> >   - skipping the 1G pud means mprotect() will succeed even if the pud won't
> >     be updated with the correct permission specified. Logically that can
> >     cause e.g. in mprotect(RO) then write the page can cause data corrupt,
> >     as the pud page will still be writable.
> > 
> >   - the bad pud will generate a pr_err() into dmesg, with no limit so far I
> >     can see.  So I think it means an userspace can DoS the kernel log if it
> >     wants.. simply by creating the PUD and keep mprotect-ing it
> > 
> 
> I edited this important info into the [0/n] text, thanks.
> 
> So current kernels can be made to spew into the kernel logs?  That's

I suppose yes to this one.

> considered serious.  Can unprivileged userspace code do this?

AFAIU, /dev/dax* require root privilege by default, so looks not.  But
anyone more familiar with real life dax usages please correct me otherwise.

Thanks,

-- 
Peter Xu

