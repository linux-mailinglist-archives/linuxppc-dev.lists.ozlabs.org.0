Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C82265EB8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 13:22:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BntdB4J27zDqsb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 21:22:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=MranxbqI; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BntZK1LgrzDqgC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 21:19:36 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id d20so9493322qka.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 04:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RF/fhPo5kBauAi3eDmZJgpqIrahl3Q40enwZDmyVW/Y=;
 b=MranxbqI0sbZTUHr/5nRrvvNnaOGVKUaAfIpgrguT3kotqu2/+vaLtFjLBr7Dchw8g
 JJmcJV/C0jOxv4hRKHMp+z8brOgZNv7zPlHzEFTxIGRfWe+oDWMX2pQve/8jTAvpKMiT
 7RN3juzzMtOiuIWBUDCT1BvIFCKf6bxkwXrdAtvSLUiKX/5kI+sFcR6JdpWoUm6ixgyF
 dLqTOenPUtqGXVDIBwggt4h+6OsbKY/DS4ZW5VLOTe31mPZEk/NO9CEvKD3cWUNhjl7s
 kxOAXY9+GRt4ctbpbjP727YWsJahqV0QyR6AL3DhYyp7rVFeR5dvwtqaEjOc69J99Ry7
 iGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RF/fhPo5kBauAi3eDmZJgpqIrahl3Q40enwZDmyVW/Y=;
 b=q312OUAM1wujiwznRqR4aJclXrMzB3O1slE/qm0um7AawtjY/i24DvvO604hket9GB
 OWrbTsV7n3lUbQMfHntaKQnpomrhbUL/NP2uX41FdUNHsfZ5Rdd65JZf9dFTiGuLDREA
 nmIngzDrksNggMDzA1BMAFpp/Ls74gIaXJM69jvJNS89nfIal4y8cB0ZD8MOTyjdU+oT
 axS0UM+us6w+7cK9idNdymfphE4BLuAwFQcVuVp1XHlen13gzfLrW6Q5AenU9ohjlBxo
 pCJH/fS4HW6DF2hxm968XeTvNjRUR+uu6upax5/Ap6ylv78jWeCPmJXVj/qFoiHtB5mz
 CjBg==
X-Gm-Message-State: AOAM530izAXq7uDNRF8rsikDkMfRKCg+rhepsEUP0GcV+GO9qs5nvJJn
 JpN1FNVjIvmIlUAv5O+/5q0uYg==
X-Google-Smtp-Source: ABdhPJzPJMV+cEWYRmvlb24Nbw7GCKp+KbSMxPhKphhah1G5lDmq4fX9f/inMOZg7Se/iCqj4A8+eA==
X-Received: by 2002:a37:a8ca:: with SMTP id r193mr1042066qke.83.1599823172826; 
 Fri, 11 Sep 2020 04:19:32 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id k185sm2269296qkd.94.2020.09.11.04.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 04:19:31 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kGh5W-004ktM-DO; Fri, 11 Sep 2020 08:19:30 -0300
Date: Fri, 11 Sep 2020 08:19:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: peterz@infradead.org
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
Message-ID: <20200911111930.GS87483@ziepe.ca>
References: <20200909192534.442f8984@thinkpad>
 <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
 <20200910181319.GO87483@ziepe.ca>
 <CAHk-=wh3SjOE2r4WCfagL5Zq4Oj4Jsu1=1jTTi2GxGDTxP-J0Q@mail.gmail.com>
 <20200910211010.46d064a7@thinkpad>
 <CAHk-=wg3ggXU98Mnv-ss-hEcvUNc9vCtgSRc7GpcGfvyOw_h3g@mail.gmail.com>
 <20200910215921.GP87483@ziepe.ca>
 <20200911070939.GB1362448@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911070939.GB1362448@hirez.programming.kicks-ass.net>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm <linux-mm@kvack.org>,
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
 Dave Hansen <dave.hansen@intel.com>,
 linux-power <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 11, 2020 at 09:09:39AM +0200, peterz@infradead.org wrote:
> On Thu, Sep 10, 2020 at 06:59:21PM -0300, Jason Gunthorpe wrote:
> > So, I suggest pXX_offset_unlocked()
> 
> Urgh, no. Elsewhere in gup _unlocked() means it will take the lock
> itself (get_user_pages_unlocked()) -- although often it seems to mean
> the lock is already held (git grep _unlocked and marvel).
>
> What we want is _lockless().

This is clear to me!

Thanks,
Jason 
