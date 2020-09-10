Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B1265577
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 01:23:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnZgQ642bzDqjT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 09:22:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f44;
 helo=mail-qv1-xf44.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=ek3aEVh6; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnZdR5zvRzDqfj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 09:21:13 +1000 (AEST)
Received: by mail-qv1-xf44.google.com with SMTP id cv8so4228986qvb.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 16:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fIHL0Rq33O5ozDdBNb92cfl0GBqGdNKvR/YdlpxGcAc=;
 b=ek3aEVh6EDZv0MY4CyKrIOtcGg9hcQrcK0LNTKZQKq5D36Q4OOful56d1fLsdvbySj
 gIxGsvrf3KCS0cBe2Cddj6sjM6xxgr+gzrdl7qNDkNuApsUa7CiM5w7gHpJiiyXmHOM7
 z0Fmkdon1hMn3l1idV0bhKgpCa6PUJSq4CW7y6g23Ml8DO+r/mDIQI9+zVDERUCtr5L5
 WJuVfXkINtgWDQegahH+XHGH+cQJScV2EOHwfsx92Xl2/qRCRlsZDeCmHgB5ogwUgrhe
 yUNj2pRXsNm4WiFcUh2LoLVRUAZ5EBB0j8EQP9F4uwiM1oP8TqSobCs8onyBplaZNq9X
 j4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fIHL0Rq33O5ozDdBNb92cfl0GBqGdNKvR/YdlpxGcAc=;
 b=OwlnJld0GEgJ5hCG3Y2P6WoaGAFCaQRBXVR6DKs+tPeiMxp7hXBYrVnn4qDfLYqnf8
 GloV4c5ZKGKFRo/y+qOVs/t/eEuuFSwPqMvNGqKi0OCqJif2pWAbpHEPBFL3eermTI5K
 X2ABJffmgsrRDvkB+8YB0619qSnMLVkam/K2C9ib9HwpYMM8nyf4YferoSaRzYaAb1Pi
 YpKholyhoybmyfKP/29ygHqahpg67x34DXDsdV+GkZB5wuuE6XOwOGO4RGKvKOqG6bW9
 cMlPx9FqQvS7trSHbqNQtIaUc3PheXq/5YE0eyBk549kbJ75D/35IDBttVS+SXHQQAAL
 TrfQ==
X-Gm-Message-State: AOAM5311yDX7QcspnP7BK+qrpk6hhEGOzeGlrL4EzvD9f7yUrTWgIfb0
 m3KKv/8TGPZD8sVvmlmYg/Fl5w==
X-Google-Smtp-Source: ABdhPJwWb13ftCj9Nx7W+uTucDyXl8x3WeSQXroWv7fkEgHTFAhsxe/mYAzhjXYKGK+4OJt2xnAqTg==
X-Received: by 2002:a05:6214:954:: with SMTP id
 dn20mr10867015qvb.122.1599780068776; 
 Thu, 10 Sep 2020 16:21:08 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id m36sm289969qtd.10.2020.09.10.16.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 16:21:07 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kGVsI-004SPL-RD; Thu, 10 Sep 2020 20:21:06 -0300
Date: Thu, 10 Sep 2020 20:21:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
Message-ID: <20200910232106.GR87483@ziepe.ca>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-2-gerald.schaefer@linux.ibm.com>
 <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad>
 <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <20200910130233.GK87483@ziepe.ca>
 <20200910195749.795232d1@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910195749.795232d1@thinkpad>
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

On Thu, Sep 10, 2020 at 07:57:49PM +0200, Gerald Schaefer wrote:
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
> 
> Hmm, IIUC, all architectures with static folding will simply return
> the passed-in p4d pointer for pud_offset(p4d, addr), for 3-level
> pagetables.

It is probably moot now, but since other arch's don't crash they also
return pud_addr_end() == end so the loop only does one iteration.

ie pud == pud_offset(p4d, addr) for all iterations as the pud++ never
happens.

Which is what this addr_end patch does for s390..

Jason
