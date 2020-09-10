Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D146226468A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 15:06:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnK0W1xzQzDqnk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 23:06:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=f2+BlMuU; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnJvh3K5zzDql0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 23:02:39 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id 16so5917288qkf.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZMHVjl3+9TgVg2XMpsqEGzDzTL85oyvjl7Ly6KJECZs=;
 b=f2+BlMuUGxSPKYE1QP62oEt/bC0dGgrFO/pevuVdYEPal0FxZbbtojVdbZbQ6sqmoz
 jaJs9e7Yg3oQ36AJtmPt+bWSweDM603M+W0NfngEfLnlu8waQhxBgX6HgQdgQkAOsQvN
 Imc2Ip25I3geF80IGGT4DFhCwFFWUwFOfv4oqMhYXEEoXV/3te0bj60yPFJV8SXZ1nIN
 1cOGfWeoU7Qerilj2IP4cT0hDPg8C8eGeDjj8ADKqV0CudBo5FDoF28Zeb24SsNY1XCA
 ye3tKdEeX5uSb4xgr1Zl54/2+vf6Hqdh4TzuL59fwFBW+mdrXHCpM+fh1UX1VSvqoYEC
 Wv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZMHVjl3+9TgVg2XMpsqEGzDzTL85oyvjl7Ly6KJECZs=;
 b=eEfvgeAMuklom3gFvDGSPppQLs7Fnr6W4Xe6GkRI582PK7EgeTHrUlSWdj7jsbF0nd
 uNCPpdp2PLgYoiTu6Ye3np41qsIZbxAw2pDeRIvJqQHZk5ai3n482b0Dt+0qjGGThTon
 //AvEcQ/nx1Fz43v1GJP/VBN+ne/pNqEJqdZ3tQRMhchFd+GauA02PnoVz8mhQqvIYw+
 kqpXrWK8N+vqJpfzEFCQfcsWxwvrZCzikeRTASARiJnhIcHew8Wp0zGBbH1kXhze08jP
 wB4Bf84SEC1g8XuVuJ5i83EK5q92Uj3mwRkqcLdBjMJGElfQGL2QQ5jEyp8ipxRVUa9U
 ndjA==
X-Gm-Message-State: AOAM5315oYM15LcNvulmDgyIVPs+WlxNvYSnufPesPCryKi22w+gg4oG
 8gzVGDWGKhGI/L+qhXbV5snwrg==
X-Google-Smtp-Source: ABdhPJxqOTcVzVF1zXXEOkRZLnf0cpg1VMvwjaF3fePKiOG08DrkmppE8sGHLJTo61W1PPeWEXyFQQ==
X-Received: by 2002:a05:620a:410:: with SMTP id
 16mr7289645qkp.133.1599742955509; 
 Thu, 10 Sep 2020 06:02:35 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id i1sm6457907qkd.58.2020.09.10.06.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:02:34 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kGMDh-004Ksi-Dp; Thu, 10 Sep 2020 10:02:33 -0300
Date: Thu, 10 Sep 2020 10:02:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
Message-ID: <20200910130233.GK87483@ziepe.ca>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-2-gerald.schaefer@linux.ibm.com>
 <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad>
 <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910093925.GB29166@oc3871087118.ibm.com>
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
 linux-mm <linux-mm@kvack.org>, linux-power <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 10, 2020 at 11:39:25AM +0200, Alexander Gordeev wrote:

> As Gerald mentioned, it is very difficult to explain in a clear way.
> Hopefully, one could make sense ot of it.

I would say the page table API requires this invariant:

        pud = pud_offset(p4d, addr);
        do {
		WARN_ON(pud != pud_offset(p4d, addr);
                next = pud_addr_end(addr, end);
        } while (pud++, addr = next, addr != end);

ie pud++ is supposed to be a shortcut for 
  pud_offset(p4d, next)

While S390 does not follow this. Fixing addr_end brings it into
alignment by preventing pud++ from happening.

The only currently known side effect is that gup_fast crashes, but it
sure is an unexpected thing.

This suggests another fix, which is to say that pud++ is undefined and
pud_offset() must always be called, but I think that would cause worse
codegen on all other archs.

Jason

