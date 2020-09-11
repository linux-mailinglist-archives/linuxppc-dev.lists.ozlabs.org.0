Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDDB26695B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 22:07:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp6H14b4czDqsd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 06:07:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::143;
 helo=mail-il1-x143.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=I9voHxb8; dkim-atps=neutral
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp6Dt1XSjzDqqJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 06:05:15 +1000 (AEST)
Received: by mail-il1-x143.google.com with SMTP id a8so10152678ilk.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 13:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lkQcTqH4VEZ3iEgT/GD9JP5N85keOg351zxTDmOcIaI=;
 b=I9voHxb8dJ7Hpr77FARBSPzOQ+MPVMwPkwF0luH+LKCeQ2lgpDwGcralZQ0FGAYrwc
 BVvqLhsKXRb6YcR4pkKP2c34FkKNgqX6pj64qFDH7oE4338e+VgL2+G3FMKW2FPuHDYW
 MOKS2lLDde3qke8PUPdIqAr1Lc/lVhX7oeWxLzC+beM8ycXu9dGfsOKsCsNwUr3jtzLk
 5mkQWm2rxczvKT5Nvh/ZTiFFTOW6UPc+/aWP2W0F+b+rADWmR1dpfaY8WBd7QI32TkZL
 3etlwSquQXvam+E6vRIK7GF1RHnaGGDJvV4v5yGgCZRyA8h08sygo6M84bfQ7xFbLqxr
 cOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lkQcTqH4VEZ3iEgT/GD9JP5N85keOg351zxTDmOcIaI=;
 b=nslgmIzqSAJDOvUULRZRlkNZhALtqMC0X+VLADBWQAMWXJ2U6qRkeEWKOIR3GpH+Hc
 kvxF17mL5L9cUyfHKf+M8aPeQLmI+7cX1ootSla9+AOMk/eU9SPfMqtnmFv+dBuuovi2
 o7NbCTYliUb0o2iJM2Xkk0lWl/wpclBL+EREKYBnr06z2ayDZvlyWfVPUJVo2t/4ozCz
 lXStLYpIPVmC5Weqq+iBnA0CLXw+pAAS95qFAGTt0vfPqgwI3la5gnlFoMMJCg6lta+4
 znuqWzFD6VweJm/PFxlSDyoJeyqrFueHgOk5w8DBm9mUS576LIHybbVYcGikyySxaTQd
 vNOA==
X-Gm-Message-State: AOAM531TsAjiekFu7NtrmUJRQqoqiOdrxTusi434UL4fttFrjR3mEdih
 sQzH/PuwTllHFEbkNVKz6ItlBw==
X-Google-Smtp-Source: ABdhPJwYA/rzSMaXI+K0i70ikIv3tpbBn8J3glPlyteqvWFcMv0jpWCYFK3IcfJC1YHXSV5pVRNS1g==
X-Received: by 2002:a92:c791:: with SMTP id c17mr3247679ilk.107.1599854713521; 
 Fri, 11 Sep 2020 13:05:13 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
 by smtp.gmail.com with ESMTPSA id j62sm1648212iof.53.2020.09.11.13.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 13:05:12 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kGpIF-005AGU-JV; Fri, 11 Sep 2020 17:05:11 -0300
Date: Fri, 11 Sep 2020 17:05:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH] mm/gup: fix gup_fast with dynamic page table folding
Message-ID: <20200911200511.GC1221970@ziepe.ca>
References: <20200911070939.GB1362448@hirez.programming.kicks-ass.net>
 <patch.git-2c4880212370.your-ad-here.call-01599849957-ext-4686@work.hours>
 <20200911194000.GB1221970@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911194000.GB1221970@ziepe.ca>
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
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-x86 <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
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

On Fri, Sep 11, 2020 at 04:40:00PM -0300, Jason Gunthorpe wrote:
> These would probably be better as static inlines though, as only s390
> compiles will type check pudp like this.

Never mind, it must be a macro - still need brackets though

Jason
