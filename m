Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 598BD26489A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 17:14:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnMqN4MtdzDqfs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 01:14:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=OLk8h2bg; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnMlD4NWzzDqfc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 01:10:32 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id g72so6361882qke.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 08:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IGv0f01H1HhwMLTOhjZhfHu2g8LxVsJgV1pDEfYUgDw=;
 b=OLk8h2bgkMx23a6lKAISLlfAQbxOdT1UvNWDM9Zk6DHatbSGVbAHhfj7/QkR54l1rm
 7d91OLwa5I5BFDa46HUCe2u5YIKKF7iZkfQGVUZwXBkVLOtQU1rMTEuS2YOP/A4N28Nh
 OaR3h6vYn2g6YHgjvbU6b6KqfQkKa4ZNKWFkzx5yRTFbAouWKSLG0Y+HJuXypLnRDO1C
 /p+eopFDX9lOqXJ5iyilR1G0IS0msV2EgzUi/8XlGm0UwB0i+O4JYL5JY9QXWMDvYWiy
 JaCFeMCQ8DYNgBrrdkRhDwMsvdOgF8w7kYFilEVYxP/+fBz702MoGQCz4e65/5fZS+Qk
 h+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IGv0f01H1HhwMLTOhjZhfHu2g8LxVsJgV1pDEfYUgDw=;
 b=Qgr5ed2E6YZxuhEklW2Ab9QtTxfbQVIjE58lXgku9g5KVPnIL2rMnAdClaY1DJEc0E
 VvMBmwX5WVGbvSUG9R6a/W+3WvprSLL4PBky6ei0at4YbQ8HF4QO7Ig1WhelhQrkA28a
 Cx2CUjvtnwml5bTcJ8PI2J7IcswCWicOtjAKh/W97/+mpfbC0+3T63Bf5vr4fuT2GXn6
 4owX/STKkpboeM5UQKOaA01d55qqaxIlOZEChkMYxmMYq+KI1gRkxdBPw19fBLa0jIXY
 oAjfeRdQQaUQHQjateDCXFWxFpi3+ajL6Ye/ra+ErcyQKnzv6bQ+bjUhnI/yMU7zY4Yp
 Gd5Q==
X-Gm-Message-State: AOAM5333jDd1wvF+fNzWx+i0IBVvkprVPZs0kVMVJV2I9XZSGstshXYG
 If0IFo0CrLPyibXh7uuK1RI4LQ==
X-Google-Smtp-Source: ABdhPJykgWiu1zjU+K7XkGZJ7ie1IxH4yzDlIW/0m/WeyP2P7YrPQaO2mutyhA53lMDex0T4CRnGTg==
X-Received: by 2002:a05:620a:141a:: with SMTP id
 d26mr7906055qkj.97.1599750628651; 
 Thu, 10 Sep 2020 08:10:28 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id z74sm6914588qkb.11.2020.09.10.08.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 08:10:27 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kGODS-004MNk-Mg; Thu, 10 Sep 2020 12:10:26 -0300
Date: Thu, 10 Sep 2020 12:10:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
Message-ID: <20200910151026.GL87483@ziepe.ca>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-2-gerald.schaefer@linux.ibm.com>
 <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad>
 <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <20200910130233.GK87483@ziepe.ca>
 <20200910152803.1a930afc@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910152803.1a930afc@thinkpad>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Heiko Carstens <hca@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-mm <linux-mm@kvack.org>, linux-power <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 10, 2020 at 03:28:03PM +0200, Gerald Schaefer wrote:
> On Thu, 10 Sep 2020 10:02:33 -0300
> Jason Gunthorpe <jgg@ziepe.ca> wrote:
> 
> > On Thu, Sep 10, 2020 at 11:39:25AM +0200, Alexander Gordeev wrote:
> > 
> > > As Gerald mentioned, it is very difficult to explain in a clear way.
> > > Hopefully, one could make sense ot of it.  
> > 
> > I would say the page table API requires this invariant:
> > 
> >         pud = pud_offset(p4d, addr);
> >         do {
> > 		WARN_ON(pud != pud_offset(p4d, addr);
> >                 next = pud_addr_end(addr, end);
> >         } while (pud++, addr = next, addr != end);
> > 
> > ie pud++ is supposed to be a shortcut for 
> >   pud_offset(p4d, next)
> > 
> > While S390 does not follow this. Fixing addr_end brings it into
> > alignment by preventing pud++ from happening.
> > 
> > The only currently known side effect is that gup_fast crashes, but it
> > sure is an unexpected thing.
> 
> It only is unexpected in a "top-level folding" world, see my other reply.
> Consider it an optimization, which was possible because of how our dynamic
> folding works, and e.g. because we can determine the correct pagetable
> level from a pXd value in pXd_offset.

No, I disagree. The page walker API the arch presents has to have well
defined semantics. For instance, there is an effort to define tests
and invarients for the page table accesses to bring this understanding
and uniformity:

 mm/debug_vm_pgtable.c

If we fix S390 using the pX_addr_end() change then the above should be
updated with an invariant to check it. I've added Anshuman for some
thoughts..

For better or worse, that invariant does exclude arches from using
other folding techniques.

The other solution would be to address the other side of != and adjust
the pud++

eg replcae pud++ with something like:
  pud = pud_next_entry(p4d, pud, next)

Such that:
  pud_next_entry(p4d, pud, next) === pud_offset(p4d, next)

In which case the invarient changes to 'callers can never do pointer
arithmetic on the result of pXX_offset()' which is a bit harder to
enforce.

Jason
