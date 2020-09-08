Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8184E2611FF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 15:28:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bm5ZH0S9RzDqMp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 23:28:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=Lf6G5poV; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bm5Wx4jBKzDqMb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 23:26:15 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id n133so15148448qkn.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 06:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0Bd9eUG3DnE6D+neFj9R3QfT/oWxBp+wzdY7i+GsBSw=;
 b=Lf6G5poVVU9DTO5y/Kk8H2Ke1/yuvwq44QRfLlgtzVksH3W4CflZYO6N1CS6Gkgf+O
 36N3+8wD9pObYI1CMdwZYMYRu7HbXVUKEFPJ2AjNcK9X3BID5PsppQaFjSnqxa7JtCNT
 aY2EX4mu669m3AJgX7WT/I/zIn+qpP2LPn3ueNiUgo8NZRJ/0OvY6GqXffz02hp9ASt6
 Kw7kagCQ12/ztkbDpZvauMGFhf/ti5rup7TXyfyR2MZlnoY6C7+c78nhZr2bXok7Z+TB
 z94051jMYxpI6fAzrkfx1CYHrWeWBF5AFFZLbShjEyTsCM8ydvp1pulj0ri7yDSPS5ma
 HXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0Bd9eUG3DnE6D+neFj9R3QfT/oWxBp+wzdY7i+GsBSw=;
 b=dzB+AVmDymk+MkeAlENckfXmCcrg+cXWWr+I5uST0GhO77rnXLJbE6VbtXuUqNrvv+
 5netf/mug++wNdD6f85lgLwBSwd7vExYV0QODJM/gWZ2fNIub9eDV0xalpw35V125GbZ
 P2vDsFlhbUVBDPoZc7FDtEQgJOLy+7FShHY/4s6Jf/CyPxanSGc2Se1RhoiLPznCtuMc
 xShnc+7/qdRXaGQ/XASq3RVGPksEjjv9DhwuFgal1I7OFv7JUjCy1GRh83GQ9JjZYgNC
 M3Rd7J9HIgSwN9u4iEhMRz8Ira0oAAMxruoJW9W1XJ2bPFwG2c5qo4MuwCKMnT0vu2d5
 koNg==
X-Gm-Message-State: AOAM5316L+CZ1ckBfIrbTuMRKg5kfN627acRZxzxzxlFVnH8gpHYjCps
 VeRxJAQPTGgouot2mNfV4CSSYg==
X-Google-Smtp-Source: ABdhPJytassnqIHgDUzIEWSN+bwEo6szoZotvnjMoppJpA+RAkN2BANjzTq153kTDs5DZf5N4KZr1w==
X-Received: by 2002:a05:620a:6d9:: with SMTP id 25mr18567qky.269.1599571572011; 
 Tue, 08 Sep 2020 06:26:12 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id j8sm14658360qth.90.2020.09.08.06.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 06:26:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kFddS-002zaX-9j; Tue, 08 Sep 2020 10:26:10 -0300
Date: Tue, 8 Sep 2020 10:26:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [RFC PATCH v2 2/3] mm: make pXd_addr_end() functions page-table
 entry aware
Message-ID: <20200908132610.GB87483@ziepe.ca>
References: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
 <20200907180058.64880-3-gerald.schaefer@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907180058.64880-3-gerald.schaefer@linux.ibm.com>
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
 linux-power <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 07, 2020 at 08:00:57PM +0200, Gerald Schaefer wrote:
> From: Alexander Gordeev <agordeev@linux.ibm.com>
> 
> Unlike all other page-table abstractions pXd_addr_end() do not take
> into account a particular table entry in which context the functions
> are called. On architectures with dynamic page-tables folding that
> might lead to lack of necessary information that is difficult to
> obtain other than from the table entry itself. That already led to
> a subtle memory corruption issue on s390.
> 
> By letting pXd_addr_end() functions know about the page-table entry
> we allow archs not only make extra checks, but also optimizations.
> 
> As result of this change the pXd_addr_end_folded() functions used
> in gup_fast traversal code become unnecessary and get replaced with
> universal pXd_addr_end() variants.
> 
> The arch-specific updates not only add dereferencing of page-table
> entry pointers, but also small changes to the code flow to make those
> dereferences possible, at least for x86 and powerpc. Also for arm64,
> but in way that should not have any impact.
> 
> So, even though the dereferenced page-table entries are not used on
> archs other than s390, and are optimized out by the compiler, there
> is a small change in kernel size and this is what bloat-o-meter reports:

This looks pretty clean and straightfoward, only
__munlock_pagevec_fill() had any real increased complexity.

Thanks,
Jason
