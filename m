Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A22CFCC3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 16:48:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ngGC0fnlzDqDl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 01:48:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="se2aFiXX"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ngDH5Lj3zDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2019 01:47:10 +1100 (AEDT)
Received: by mail-ed1-x542.google.com with SMTP id r16so15806942edq.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Oct 2019 07:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=v5480SQD25UEO3u3h3+XfLx5vFnRoXUIs+mxAEl7+m0=;
 b=se2aFiXXhMrk97Swm5RVBKrZDzR4rbVDTQHoaephg3zQRqf4aiWct8dOpfWt+A6/MD
 EQXc7lGw+qNX/k7xLEfqdG/+Z18ewJvXPUHF3x3hiSbMgHm7+05YOss9b4+qgIJQ0331
 ltpJapqLojYHxnGse0s+MGwyO89dsWakkcQyMpaoVmlhS67GGjhYqFerFlD1gGKMMx1g
 egGWpU+tl3cS1bndnMw6bczTJkKVJDck5y6WAM2D+Hm3fEbqPHHgijTkLiizW4XAAPTm
 52xS7wN43n6ydUNM+Fz/2g++ZJTmNbWiYp/1nUTCmn7CdHBUz31N4sQTakF4KfVjsRhZ
 ONEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v5480SQD25UEO3u3h3+XfLx5vFnRoXUIs+mxAEl7+m0=;
 b=Bm10lua0REtjwJBUYo6ey7yX+2Mb5Pp8Sf2+819ySHPEaE+IBDclKlVQgvFd0Vvbe8
 mEKO6sG6ACEuNQUqq6Opb4rvH6G3VbLayIbE8p83S9Nk/hSc4ggxVyhYwZI8YsWpEny+
 pvQWSQxLvwv3T8kQ6K+U8myBuuvosFdl6T8cN/IzkEM99sW9Iyy6XNg0MM+K2GO35hAG
 dnWEDe+PgjSWUtPiJj9uB2ofJXc3ifmtobJ2Fb9a9t0s3qa/ekYCvztXsZP8BaaJPlrX
 cuApYnD3f+E1w3xJ8O++yUsenJ4IGamWPk84N2QQHpOYCuoFEMW4JQDP9f2RO/PMj8yN
 n7RQ==
X-Gm-Message-State: APjAAAXhrgbWrAE7E5ha9AMsmYUZXHwP2PytJszti2gCOfLToDQxDbEI
 bYaCqkOM/2+UXkbJbt5vbpDN+Q==
X-Google-Smtp-Source: APXvYqxqKHsJy8HeTUty9LBa/Qt26DoTxp7ystN2S2TmUMeOOrGzsYaDRYOhxeGCTLSl7VrIgdRdVg==
X-Received: by 2002:a05:6402:32f:: with SMTP id
 q15mr34455938edw.143.1570546027695; 
 Tue, 08 Oct 2019 07:47:07 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id v8sm3973001edl.74.2019.10.08.07.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 07:47:06 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 9017810170F; Tue,  8 Oct 2019 17:47:06 +0300 (+03)
Date: Tue, 8 Oct 2019 17:47:06 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 01/11] asm-generic/pgtable: Adds generic functions to
 monitor lockless pgtable walks
Message-ID: <20191008144706.yu6jrthweyn4kgdm@box>
References: <20191003013325.2614-1-leonardo@linux.ibm.com>
 <20191003013325.2614-2-leonardo@linux.ibm.com>
 <20191003071145.GM4536@hirez.programming.kicks-ass.net>
 <20191003115141.GJ4581@hirez.programming.kicks-ass.net>
 <651856af-30de-15ad-2312-158f3ad5292e@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <651856af-30de-15ad-2312-158f3ad5292e@linux.ibm.com>
User-Agent: NeoMutt/20180716
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>,
 Peter Zijlstra <peterz@infradead.org>, "Dmitry V. Levin" <ldv@altlinux.org>,
 Keith Busch <keith.busch@intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Christoph Lameter <cl@linux.com>,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Santosh Sivaraj <santosh@fossix.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, John Hubbard <jhubbard@nvidia.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>, kvm-ppc@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Nicholas Piggin <npiggin@gmail.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Thomas Gleixner <tglx@linutronix.de>, Reza Arbab <arbab@linux.ibm.com>,
 Allison Randal <allison@lohutok.net>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Roman Gushchin <guro@fb.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 05, 2019 at 02:05:29PM +0530, Aneesh Kumar K.V wrote:
> MADV_DONTNEED has caused us multiple issues due to the fact that it can run
> in parallel to page fault. I am not sure whether we have a known/noticeable
> performance gain in allowing that with mmap_sem held in read mode.

Yes we do. MADV_DONTNEED used a lot by userspace memory allocators and it
will be very noticible performance regression if we would switch it to
down_write(mmap_sem).

-- 
 Kirill A. Shutemov
