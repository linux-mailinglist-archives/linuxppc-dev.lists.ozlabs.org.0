Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBDA535F40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 13:30:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8jK63yCTz3c8q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 21:30:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nXTl96gp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nXTl96gp;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8hLp603xz2yjS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 20:46:41 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id f9so8065629ejc.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 03:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VEAekRrz/FSY4pk4QnV3m6H5QVjhz8BFDYr0EcpVw1E=;
        b=nXTl96gpCDbYy3bbmZHUFxanwBKanpTD5T3ye91nNt0S5DzRS50X+C3V5calou/Tbd
         W3tp+Pa5ui5nyk/J9IilzxqUhKzX+QyGcukjZk0ELfa/RtKrZMaq9i+yE1j0RcYeHGEH
         V+4RtLXDWPxnAymJMfcVpu0JZEZoxenwNXkmgyYKMQXGnN1Ls7NkOSx9TgW4IEazH0HS
         TOy4lNsQjFRd71dz5D/Ux8BGGU+UgNurAc7P2zcBMC8bJFwbS5pJWekOq461oc+DsRDd
         eh87WbfBiCTIu2NxwA+S3LoC7J0WxrnESI1Jt77XHjKjToAke3bka2tT28oXpFfiDYxk
         GFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=VEAekRrz/FSY4pk4QnV3m6H5QVjhz8BFDYr0EcpVw1E=;
        b=ezENvcVzyYJD9XuziEhXA9E8ainxX30MPbNzq2YxKQHe4kwdoxV52o09HO2PspzRIs
         4VjshtFY5cv5X3tK4+5yPtZl0ViOd5D6BQeJUe2iKzHOD1JdyvfAGilSE2xi6EwlZ0GL
         SQEyFcjFHj2BRGrr/BmBaLbO0Utns2oNR/5A66AsVqX65Xu8SzId4d2In9eG+s6siTuc
         haHqc/GxaQ3R/uRzYkrWMtO259eAFD8CLPKIB7dS+S/oGnLQI6cIIL+9jwMmK01omnfY
         BIIy4+RJBb18msMwDnjO5s/sSQXeE73Do0rInS08f5UgCAgpK9dpRghX0PdnUy70KZnG
         C+GQ==
X-Gm-Message-State: AOAM530q1a6SW6CyI2aRymwvEyMcKsvFteNQTlkl8Onzv00QxkqC78So
	L2ysRzuUuNDVXEnH+oqYozE=
X-Google-Smtp-Source: ABdhPJyWn7wVchQLELsEVq6TA/gUzEaBn19VUAXtFTYBInhQr0sSQqMx29HcpQwhBHqmmOM8Z+iT0g==
X-Received: by 2002:a17:907:7baa:b0:6fe:b3dc:2378 with SMTP id ne42-20020a1709077baa00b006feb3dc2378mr30766036ejc.266.1653648395645;
        Fri, 27 May 2022 03:46:35 -0700 (PDT)
Received: from gmail.com (563BA16F.dsl.pool.telekom.hu. [86.59.161.111])
        by smtp.gmail.com with ESMTPSA id i20-20020a17090639d400b006fec1a73e48sm1320742eje.64.2022.05.27.03.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 03:46:34 -0700 (PDT)
Date: Fri, 27 May 2022 12:46:31 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpCsBwFArieTpvg2@gmail.com>
References: <20220524234531.1949-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524234531.1949-1-peterx@redhat.com>
X-Mailman-Approved-At: Fri, 27 May 2022 21:29:50 +1000
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
Cc: x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, Rich Felker <dalias@libc.org>, Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org, linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, linux-sh@vger.ke
 rnel.org, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, Stafford Horne <shorne@gmail.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Andrea Arcangeli <aarcange@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Brian Cain <bcain@quicinc.com>, Heiko Carstens <hca@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Bab
 ka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.n

et>, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Guo Ren <guoren@kernel.org>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Peter Xu <peterx@redhat.com> wrote:

> This patch provides a ~12% perf boost on my aarch64 test VM with a simple
> program sequentially dirtying 400MB shmem file being mmap()ed and these are
> the time it needs:
>
>   Before: 650.980 ms (+-1.94%)
>   After:  569.396 ms (+-1.38%)

Nice!

>  arch/x86/mm/fault.c           |  4 ++++

Reviewed-by: Ingo Molnar <mingo@kernel.org>

Minor comment typo:

> +		/*
> +		 * We should do the same as VM_FAULT_RETRY, but let's not
> +		 * return -EBUSY since that's not reflecting the reality on
> +		 * what has happened - we've just fully completed a page
> +		 * fault, with the mmap lock released.  Use -EAGAIN to show
> +		 * that we want to take the mmap lock _again_.
> +		 */

s/reflecting the reality on what has happened
 /reflecting the reality of what has happened

>  	ret = handle_mm_fault(vma, address, fault_flags, NULL);
> +
> +	if (ret & VM_FAULT_COMPLETED) {
> +		/*
> +		 * NOTE: it's a pity that we need to retake the lock here
> +		 * to pair with the unlock() in the callers. Ideally we
> +		 * could tell the callers so they do not need to unlock.
> +		 */
> +		mmap_read_lock(mm);
> +		*unlocked = true;
> +		return 0;

Indeed that's a pity - I guess more performance could be gained here, 
especially in highly parallel threaded workloads?

Thanks,

	Ingo
