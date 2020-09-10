Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 763B12654C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 00:02:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnXtc1zg6zDqfs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 08:02:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=XGa+1wti; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnXq45ll1zDqfP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 07:59:26 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id w16so7757905qkj.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 14:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RBvq+OOZpOHz7JVY1b9A66StBw0lh3lNMqv01GrhYLE=;
 b=XGa+1wtiJPkykbDWCfESpB/MvI1RBtyH5dvDVcm14/sCZlt15vU51OB/uvdf8x4ZQa
 kQYpCVOD4ExSpYHPDOteT1PnQSYpcVDio5gc9zCACzdojqAlh6SwMKMRY4M2jHdso8pC
 o1SCOD1e7CU5P94+lNcRXuJe4cmvhxIpYDyRzl6AlKYd1iDVs+vkgkgFbjeoHTVRj1ST
 1yBIDBY0FM4tBgJQZxvv5cNNGM4bu8ROu2teyjXMmbtUrBhHsMF7QLWMp1o0b0abexEB
 POsgnb1rV2g2SN+GvDFk4nRwxlB7GR1NoIs/6jzxofpKRolvj4glG/Y8VK7FoDyzwgcR
 PZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RBvq+OOZpOHz7JVY1b9A66StBw0lh3lNMqv01GrhYLE=;
 b=kKnfrBugnqBFnuWD0fMX09QkfxLozp2vd2ne3Szk5UhrFXUkq2Yq+Oi4sHwpCaNMUY
 fHpXh4keIlydoYwTX400XaT0tHApdhvyGQe2OXTCSvByn8GU59312DVKh0DipeS9jvWK
 jIrPxlxFiivQOeeag5jlvR7jzch861F8vYnpFGFkLdk1bIYjYVqyR1HCGxp+gJZ9vlgB
 BIj1W5jK1pCPyj64bLsDGIet6YroJf4EQiDV04lfkL6mu6m5rZXyaRNpOnDSC67sA0UO
 kfLNGFahnOoj22w2REpZI3XnoLghCaB0r3s73xSALVeG3Qy3JnfbhpkvDN8XmowLLE2c
 kjCg==
X-Gm-Message-State: AOAM531kYZDPqLiHocACJnM9wJyiG+GweP8Qd23wP5pymYIPtoEHr9Ac
 GXbaiivrmpfcMVq+BNlzAPh8JA==
X-Google-Smtp-Source: ABdhPJzg7+n4mPFpbsKeMom2f+wjc9snf2MnK4gNUYWrTQr71TGF5AizTC8kCaHgs9VlFTOngDCTww==
X-Received: by 2002:ae9:c015:: with SMTP id u21mr10626371qkk.268.1599775163249; 
 Thu, 10 Sep 2020 14:59:23 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id j88sm32038qte.96.2020.09.10.14.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 14:59:22 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kGUbB-004RUb-H7; Thu, 10 Sep 2020 18:59:21 -0300
Date: Thu, 10 Sep 2020 18:59:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
Message-ID: <20200910215921.GP87483@ziepe.ca>
References: <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad>
 <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
 <20200910181319.GO87483@ziepe.ca>
 <CAHk-=wh3SjOE2r4WCfagL5Zq4Oj4Jsu1=1jTTi2GxGDTxP-J0Q@mail.gmail.com>
 <20200910211010.46d064a7@thinkpad>
 <CAHk-=wg3ggXU98Mnv-ss-hEcvUNc9vCtgSRc7GpcGfvyOw_h3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg3ggXU98Mnv-ss-hEcvUNc9vCtgSRc7GpcGfvyOw_h3g@mail.gmail.com>
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
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 10, 2020 at 12:32:05PM -0700, Linus Torvalds wrote:
> Yeah, I get hung up on naming sometimes. I don't tend to care much
> about private local variables ("i" is a perfectly fine variable name),
> but these kinds of somewhat subtle cross-architecture definitions I
> feel matter.

One of the first replys to this patch was to ask "when would I use
_orig vs normal", so you are not alone. The name should convey it..

So, I suggest pXX_offset_unlocked()

Since it is safe to call without the page table lock, while pXX_offset()
requires the page table lock to be held as the internal *pXX is a data
race otherwise.

Patch 1 might be OK for a stable backport, but to get to a clear
pXX_offset_unlocked() all the arches would want to be changed to
implement that API and the generic code would provide the wrapper:

#define pXX_offset(pXXp, address) pXX_offset_unlocked(pXXp, *(pXXp), address)

Arches would not have a *pXX inside their code.

Then we can talk about auditing call sites of pXX_offset and think
about using the _unlocked version in places where the page table lock
is not held.

For instance mm/pagewalk.c should be changed. So should
huge_pte_offset() and probably other places. These places might
already be exsting data-race bugs.

It is code-as-documentation indicating an unlocked page table walk.

Now it is not just a S390 story but a change that makes the data
concurrency much clearer, so I think I prefer this version to the
addr_end one too.

Regards,
Jason
