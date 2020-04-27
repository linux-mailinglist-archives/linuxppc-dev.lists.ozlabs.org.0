Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0751B9668
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 07:06:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499XnQ3jbQzDqWN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 15:06:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=sandipan.osd@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bT29SBfO; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499XlC4nckzDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 15:04:52 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id mq3so7014108pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 22:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RpEFDruZhhlXBhX9QpFVEyfUVGVZWtywwb585yNz+7Y=;
 b=bT29SBfOK96SESehhTW4BCxtsJFVttVeoi/t0urpRpj0AFJ020vN2h1/7jbZohDiWY
 G+7rYY/cyjMWRX2nWM1nQUHRK5DYY0Z3Re/LQsmmL5pheEmdu3Z1rJ7IPvBhUWW1vcYA
 rRAUC3qAszhg7SieSVaXNxX3irqWsJ185lS+6xxGA+5B6PInlCzT3e4IzLqCdgG84LZT
 0O5T2gDAaSxEEY9ruwlPztv5j6dMcOK3Fxvpnkz0f3/jF7y8KJINeGHpr20aF1GemJoJ
 vZnP/QcZkHuVdvvx0xYhq+BbBscy9ve367kNA6XTMOpJq4QXGHxO/ZNnzNN5zxO0WihD
 fgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RpEFDruZhhlXBhX9QpFVEyfUVGVZWtywwb585yNz+7Y=;
 b=iL3emBN2Y0ZTE+iW+0s9uHxDwmV8T/0rQXwfhMygICz8Xu1pmAMRdSPkQflyni67zF
 Wh1vktCt/r5wgK4vRo/782gWrCwvBW7YOcuSayKXmYl4O/dGyNG9tklYGzqfzV8yrc8d
 lUYfqRdsErnWnT6Y22AF78l1z+nfiTIy+Qoj5ALsGh9ue3lKQdhq14ouhraxvmfV3PnF
 g5GzalZyqydwjPLvpfiKJcMYu0W9gCsTI/gKCriwN7MzuwY9Im49GPgeHWRkepDxIPuc
 lgPXipHug9lVpNwmlIUNzKpOGfQlOyE4kH4lHEq2mSUjJuAJfoIJMk24tUq09Yq+7Qxw
 78hw==
X-Gm-Message-State: AGi0PuY/OHx0Ebyf3Gq5+ExJGRBkf2BGr7d+2L4jryMR1AOGifrIGO8v
 5u5VAN++gbZWhQyQs8IlCgY=
X-Google-Smtp-Source: APiQypIf/qo/TUxxXd3N0x5q5i+APW/p3XTbnR6PLJskh1YyRzL4PAyXKe0dL0wTZKlCFIs0r3ai3g==
X-Received: by 2002:a17:90a:3f8e:: with SMTP id
 m14mr20357937pjc.92.1587963888745; 
 Sun, 26 Apr 2020 22:04:48 -0700 (PDT)
Received: from [192.168.0.102] ([49.205.220.192])
 by smtp.gmail.com with ESMTPSA id o21sm9822670pgk.16.2020.04.26.22.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Apr 2020 22:04:48 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] hugetlbfs: move hugepagesz= parsing to arch
 independent code
To: Mike Kravetz <mike.kravetz@oracle.com>
References: <20200417185049.275845-1-mike.kravetz@oracle.com>
 <20200417185049.275845-3-mike.kravetz@oracle.com>
From: Sandipan Das <sandipan.osd@gmail.com>
Message-ID: <7583dfcc-62d8-2a54-6eef-bcb4e01129b3@gmail.com>
Date: Mon, 27 Apr 2020 10:34:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417185049.275845-3-mike.kravetz@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Mina Almasry <almasrymina@google.com>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Nitesh Narayan Lal <nitesh@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,

On 18/04/20 12:20 am, Mike Kravetz wrote:
> Now that architectures provide arch_hugetlb_valid_size(), parsing
> of "hugepagesz=" can be done in architecture independent code.
> Create a single routine to handle hugepagesz= parsing and remove
> all arch specific routines.  We can also remove the interface
> hugetlb_bad_size() as this is no longer used outside arch independent
> code.
> 
> This also provides consistent behavior of hugetlbfs command line
> options.  The hugepagesz= option should only be specified once for
> a specific size, but some architectures allow multiple instances.
> This appears to be more of an oversight when code was added by some
> architectures to set up ALL huge pages sizes.
> 
> [...]
> 
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index de54d2a37830..2c3fa0a7787b 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -589,21 +589,6 @@ static int __init add_huge_page_size(unsigned long long size)
>  	return 0;
>  }
>  
> -static int __init hugepage_setup_sz(char *str)
> -{
> -	unsigned long long size;
> -
> -	size = memparse(str, &str);
> -
> -	if (add_huge_page_size(size) != 0) {
> -		hugetlb_bad_size();
> -		pr_err("Invalid huge page size specified(%llu)\n", size);
> -	}
> -
> -	return 1;
> -}
> -__setup("hugepagesz=", hugepage_setup_sz);
> -
> [...]

This isn't working as expected on powerpc64.

  [    0.000000] Kernel command line: root=UUID=dc7b49cf-95a2-4996-8e7d-7c64ddc7a6ff hugepagesz=16G hugepages=2 
  [    0.000000] HugeTLB: huge pages not supported, ignoring hugepagesz = 16G
  [    0.000000] HugeTLB: huge pages not supported, ignoring hugepages = 2
  [    0.284177] HugeTLB registered 16.0 MiB page size, pre-allocated 0 pages
  [    0.284182] HugeTLB registered 16.0 GiB page size, pre-allocated 0 pages
  [    2.585062]     hugepagesz=16G
  [    2.585063]     hugepages=2

The "huge pages not supported" messages are under a !hugepages_supported()
condition which checks if HPAGE_SHIFT is non-zero. On powerpc64, HPAGE_SHIFT
comes from the hpage_shift variable. At this point, it is still zero and yet
to be set. Hence the check fails. The reason being hugetlbpage_init_default(),
which sets hpage_shift, it now called after hugepage_setup_sz().


- Sandipan
