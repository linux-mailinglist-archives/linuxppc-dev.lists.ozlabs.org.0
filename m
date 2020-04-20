Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6733A1B19CD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 00:54:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495hq45vP8zDr28
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 08:54:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YmH7uDuq; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495hnh495VzDql9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 08:53:42 +1000 (AEST)
Received: by mail-lf1-x144.google.com with SMTP id h6so9496986lfc.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 15:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RNk2/s+798PoKv3JnJ/hhJNPDgeiscbjwcrK7uyEZbg=;
 b=YmH7uDuqtUjh8BP0z9BmAxjyrM//1+xCH8CFdpc6VTVXdhnlBzHI9Gi4MjPqeBpVjj
 mqMqXslZ390z3xe+WjoXruazSkm2A7fhvcwxJILSerUwh57i/v20zmQ3G1rqkIRX35I5
 kVZx/Cyb2sXvDCl5gopY5/n+K6zvvOsrxU5033mk9qdCTDWLU4GJevyhL5NPtDWdZvEi
 SdovFleLu6drNliJrSEEksJ9b9EL7q7qkLDAkcVRzC3yxcc95IFS5h2dnJcSFAKZU5rv
 c58AaKgSKeFmuL93FK26irrPTr22IC9ONJiZXnuID0v+tqe5F2F9LFZz/LAOgsYh3NoY
 ANNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RNk2/s+798PoKv3JnJ/hhJNPDgeiscbjwcrK7uyEZbg=;
 b=tx2MR2y1uoQSsebZq4dxxj+aD6F+fIfN/hT5vS8bAe0TFTeDFrDiJmAWLg4s68m4iy
 0fgyvfHhYPcvRrRER8FtwCnsvJkwIiMRUZ537Y3M692n9PqEXYqAvqhWZ7aRD3wPli16
 /kAUa7U/4zaIGICQSAKzLVSD9nboUZ/ZhkNa4cDCQJqC2wbU05TJwYiV8MZYII52PZRG
 6jy75KDKPSqQD9P05hr6UVKgqQYyWXViX3E3Cfqznm9UX9NZGGTq90vKB/XGmFalPbrq
 Pw0sc4g2wnmgwWfJMjIvwbwwFJiPlNLHnGAKf1bkTM81YBTEsy2z6elkCHXz+TBPL6Bi
 auRQ==
X-Gm-Message-State: AGi0PubteQZZL5q9wzBORxk4BDIPhbc/MOrebKTziPY7detPFb55LIT7
 7xPsjGr0Bdr/jCAgz8T5jgni2ZD6U3g5nCkgqFo4Qw==
X-Google-Smtp-Source: APiQypKXyvohoz9hAFVdAiOa8F7voUy3e/GT1SGuDeVrZQD1XPKHc8CL09oKY7XVjUOx5xFWTNgrgWZPn+CxnBqFFH8=
X-Received: by 2002:a19:c1d3:: with SMTP id
 r202mr11708833lff.216.1587423217517; 
 Mon, 20 Apr 2020 15:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200417185049.275845-1-mike.kravetz@oracle.com>
 <5E312000-05D8-4C5D-A7C0-DDDE1842CB0E@lca.pw>
 <4c36c6ce-3774-78fa-abc4-b7346bf24348@oracle.com>
 <CADYN=9+=tCDmddTYGY44onvrzbg7yrbacMDSxd4hhD+=b=Yeiw@mail.gmail.com>
 <86333853-0648-393f-db96-d581ee114d2b@oracle.com>
In-Reply-To: <86333853-0648-393f-db96-d581ee114d2b@oracle.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 21 Apr 2020 00:53:26 +0200
Message-ID: <CADYN=9JbXi=rvBAvhwPh8aFu2ne4Hbu4T+PW3NP3Rv2is+x77w@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Clean up hugetlb boot command line processing
To: Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-doc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Peter Xu <peterx@redhat.com>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Mina Almasry <almasrymina@google.com>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Longpeng <longpeng2@huawei.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Qian Cai <cai@lca.pw>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Nitesh Narayan Lal <nitesh@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S.Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Apr 2020 at 23:43, Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 4/20/20 1:29 PM, Anders Roxell wrote:
> > On Mon, 20 Apr 2020 at 20:23, Mike Kravetz <mike.kravetz@oracle.com> wrote:
> >> On 4/20/20 8:34 AM, Qian Cai wrote:
> >>>
> >>> Reverted this series fixed many undefined behaviors on arm64 with the config,
> >> While rearranging the code (patch 3 in series), I made the incorrect
> >> assumption that CONT_XXX_SIZE == (1UL << CONT_XXX_SHIFT).  However,
> >> this is not the case.  Does the following patch fix these issues?
> >>
> >> From b75cb4a0852e208bee8c4eb347dc076fcaa88859 Mon Sep 17 00:00:00 2001
> >> From: Mike Kravetz <mike.kravetz@oracle.com>
> >> Date: Mon, 20 Apr 2020 10:41:18 -0700
> >> Subject: [PATCH] arm64/hugetlb: fix hugetlb initialization
> >>
> >> When calling hugetlb_add_hstate() to initialize a new hugetlb size,
> >> be sure to use correct huge pages size order.
> >>
> >> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> >> ---
> >>  arch/arm64/mm/hugetlbpage.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> >> index 9ca840527296..a02411a1f19a 100644
> >> --- a/arch/arm64/mm/hugetlbpage.c
> >> +++ b/arch/arm64/mm/hugetlbpage.c
> >> @@ -453,11 +453,11 @@ void huge_ptep_clear_flush(struct vm_area_struct *vma,
> >>  static int __init hugetlbpage_init(void)
> >>  {
> >>  #ifdef CONFIG_ARM64_4K_PAGES
> >> -       hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
> >> +       hugetlb_add_hstate(ilog2(PUD_SIZE) - PAGE_SHIFT);
> >>  #endif
> >> -       hugetlb_add_hstate(CONT_PMD_SHIFT - PAGE_SHIFT);
> >> -       hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
> >> -       hugetlb_add_hstate(CONT_PTE_SHIFT - PAGE_SHIFT);
> >> +       hugetlb_add_hstate(ilog2(CONT_PMD_SIZE) - PAGE_SHIFT);
> >> +       hugetlb_add_hstate(ilog2(PMD_SIZE) - PAGE_SHIFT);
> >> +       hugetlb_add_hstate(ilog2(CONT_PTE_SIZE) - PAGE_SHIFT);
> >>
> >>         return 0;
> >>  }
> >
> > I build this for an arm64 kernel and ran it in qemu and it worked.
>
> Thanks for testing Anders!
>
> Will, here is an updated version of the patch based on your suggestion.
> I added the () for emphasis but that may just be noise for some.  Also,
> the naming differences and values for CONT_PTE may make some people
> look twice.  Not sure if being consistent here helps?
>
> I have only built this.  No testing.
>
> From daf833ab6b806ecc0816d84d45dcbacc052a7eec Mon Sep 17 00:00:00 2001
> From: Mike Kravetz <mike.kravetz@oracle.com>
> Date: Mon, 20 Apr 2020 13:56:15 -0700
> Subject: [PATCH] arm64/hugetlb: fix hugetlb initialization
>
> When calling hugetlb_add_hstate() to initialize a new hugetlb size,
> be sure to use correct huge pages size order.
>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

I tested this patch on qemu-aarch64.

Cheers,
Anders

> ---
>  arch/arm64/mm/hugetlbpage.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 9ca840527296..bed6dc7c4276 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -455,9 +455,9 @@ static int __init hugetlbpage_init(void)
>  #ifdef CONFIG_ARM64_4K_PAGES
>         hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>  #endif
> -       hugetlb_add_hstate(CONT_PMD_SHIFT - PAGE_SHIFT);
> +       hugetlb_add_hstate((CONT_PMD_SHIFT + PMD_SHIFT) - PAGE_SHIFT);
>         hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
> -       hugetlb_add_hstate(CONT_PTE_SHIFT - PAGE_SHIFT);
> +       hugetlb_add_hstate((CONT_PTE_SHIFT + PAGE_SHIFT) - PAGE_SHIFT);
>
>         return 0;
>  }
> --
> 2.25.2
>
