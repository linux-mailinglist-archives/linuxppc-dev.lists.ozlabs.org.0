Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B6263596
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 20:07:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmqjV0HrLzDqNw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 04:07:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=A1EztTr1; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmqdG3wLZzDqZD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 04:03:29 +1000 (AEST)
Received: by mail-qv1-xf41.google.com with SMTP id cr8so1979438qvb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Sep 2020 11:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UQgQ1jWE5sEaZp188M6nTz8t9kSh4aamz6SSlq8ptfM=;
 b=A1EztTr153mgaOQzg71QrWYh4iR+/GKjXrKqg1rHHwyCQEu/IERkUOuYsKvQkOl1+C
 6eEp+cnjHSrQGtueAOf9pTHLleNwrHI+seHLvaQHFTcxMdSMW5tN7OgJMFx+soMlUkUR
 eYjHVlgNYm626JzDRfys6jbvYB1TI08s8VAfVz2V9RqGqoB/GOGYcY/+rYj5qrggDmLx
 K4fu1a4UZ5Rnlb/xtt4Vdy+434DxWnYfGu+HQ3SBS7LpF1L/tfeGSDCPAfZt0eW1xmOI
 vZmyUl7Hz6/Q8m3UTevIXqwOJHuaAn4ywsKXM3r0kORYKH6pbqnoX/h8gtw1ia3Np5f7
 fmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UQgQ1jWE5sEaZp188M6nTz8t9kSh4aamz6SSlq8ptfM=;
 b=YmPkccOhTFv+OSN4KLXgUy1cEaEhFPXCD2NMs35GuI5hCtv9RW/AXzrGVyArVw4AOf
 q39BhVgo5tJVFYTVGKLcP+4b4j2galpzEueF+XpZfMynG8/1FPbdBQM7OaYQKNwEOghR
 +jCRh98r+eEWBu14z5IpHETEkCaYvi9uQYBgbZgU6NCvsR4kclmf/FrbuBu9IROfltbj
 4b7fzVZgbtOkjgMfipD0xOVMsyHZv7JIuN8uJnfof4XhS9DjS7yria3EarFKF9ZVnv+F
 3LgQxC0/kNR0LNjhaPshL5U+fSEFP4KFBCqC5LKz0giB7Fwho4FUx9MwdDmbHuwHTnVQ
 8BaA==
X-Gm-Message-State: AOAM533HPdVEf4ycj3OvlMRdFQEt90vugiXHzxppJZbK9+UaXaJOA4GW
 NLRLNZobluG9UsG4IB0YlmbXtw==
X-Google-Smtp-Source: ABdhPJyORWlaWmB1Nu1DtA3vqJBA49b6LBNYfIyPrYHnjmR0hq08XfufNeF9nCJAP6MnxhYPIeRCPA==
X-Received: by 2002:a05:6214:5c8:: with SMTP id
 t8mr5410996qvz.67.1599674606034; 
 Wed, 09 Sep 2020 11:03:26 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id d16sm4004982qte.19.2020.09.09.11.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 11:03:25 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kG4RI-003r3t-JU; Wed, 09 Sep 2020 15:03:24 -0300
Date: Wed, 9 Sep 2020 15:03:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
Message-ID: <20200909180324.GI87483@ziepe.ca>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-2-gerald.schaefer@linux.ibm.com>
 <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909192534.442f8984@thinkpad>
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

On Wed, Sep 09, 2020 at 07:25:34PM +0200, Gerald Schaefer wrote:
> I actually had to draw myself a picture to get some hold of
> this, or rather a walk-through with a certain pud-crossing
> range in a folded 3-level scenario. Not sure if I would have
> understood my explanation above w/o that, but I hope you can
> make some sense out of it. Or draw yourself a picture :-)

What I don't understand is how does anything work with S390 today?

If the fix is only to change pxx_addr_end() then than generic code
like mm/pagewalk.c will iterate over a *different list* of page table
entries. 

It's choice of entries to look at is entirely driven by pxx_addr_end().

Which suggest to me that mm/pagewalk.c also doesn't work properly
today on S390 and this issue is not really about stack variables?

Fundamentally if pXX_offset() and pXX_addr_end() must be consistent
together, if pXX_offset() is folded then pXX_addr_end() must cause a
single iteration of that level.

Jason
