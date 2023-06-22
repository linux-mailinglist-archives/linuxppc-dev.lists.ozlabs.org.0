Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F3B73A25B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 15:58:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dE63dA3m;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IazrzXPa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qn25m3dNwz3bVS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:58:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dE63dA3m;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IazrzXPa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=ypodemsk@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn24t1Mydz2xgq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 23:57:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687442266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9GM+KaVBTG0d2ZoawOpQPP3iTozMv6kRahCWZiyW/ao=;
	b=dE63dA3mj9ln5+tXWsIQXmlaizNsyy0fLjor2NKmEQWZSNTzQP/DpTfWoWKzXEbX3znGt0
	0iFpj78wJtWj1N/KcuDNjdv2UBTRdbt2UcPte3uvGfsIjxDBFxh3muvqvqPgM4WITdDv52
	BzJwOiQDPWHS2reYwxJDI9Ti9DAcujQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687442267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9GM+KaVBTG0d2ZoawOpQPP3iTozMv6kRahCWZiyW/ao=;
	b=IazrzXParNj7jXGNi4lwfFXyrzIXWnbrG7B/IAOZTjJsw8DO4JN6v3IFilzylavpRIz0KK
	NFq3ASeBvd6yV5BH7XFdZVVULs7Yiz/xRr4qT1a8AgoV/oIgtjSBZnveMvNsKTOYEFyjyA
	I6LdgHsxzrtLfQtpNswYY8aMo6nYfiY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-jJ4skriJO1qv-c1A8Q022Q-1; Thu, 22 Jun 2023 09:57:44 -0400
X-MC-Unique: jJ4skriJO1qv-c1A8Q022Q-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f42bcef2acso29875465e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 06:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687442263; x=1690034263;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :cc:to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9GM+KaVBTG0d2ZoawOpQPP3iTozMv6kRahCWZiyW/ao=;
        b=PyOurCBSMy4VzruBK3VOCC2YIzRKJZPfnwmhngxC1VjHsfXdF1uV6tNIqdQi9iBhSE
         qbMxwvunvOlYeTfJqDsz7h616sOGx3Uan95uUNG0LJiEh7moSH9auRPx719OGLsi6KAv
         Ruo2Jb3GOlhC81wTH79D8Jz3+cv957Z5o+Vr/2CIEeQUOeB7YNdv2LxH4nZZzQKUuAUL
         hwNfnHT4ue9VlO+27Q6LwSQC3vqawWsvRs2lIOZYgE0JqNIdgL++7Hr2azNvH6PE/Et6
         rZfVvjfp8v35tQ3Eb4aRL6rGwfpXmWklCc/K5aUtW153b0pr+SRRyPqGxccRFfEgS/9P
         YKUg==
X-Gm-Message-State: AC+VfDxYGgnzIdznYK7lYWL1mE6hOrHk7StHNO251Dd54boZ2fuJOoel
	Eg0hIde44Ed2Xy1tzAFQUm8ab+kGXG5PyE2k7nkNM1nPmrs2hEpwRUCgDs8rnFrbZR1rSVexcuf
	l2eEvGC13TP9Js/ydDm2oVZwE9w==
X-Received: by 2002:a05:600c:2942:b0:3f7:5d:4a06 with SMTP id n2-20020a05600c294200b003f7005d4a06mr1531916wmd.1.1687442263390;
        Thu, 22 Jun 2023 06:57:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5p9/Up90QSZ1DAdrQMEuugJHQR/5D9norGZu6r3B4czFVgo4n6RIoxrIJViM7m10t9Bv6d/Q==
X-Received: by 2002:a05:600c:2942:b0:3f7:5d:4a06 with SMTP id n2-20020a05600c294200b003f7005d4a06mr1531890wmd.1.1687442263118;
        Thu, 22 Jun 2023 06:57:43 -0700 (PDT)
Received: from ypodemsk.tlv.csb (IGLD-84-229-250-192.inter.net.il. [84.229.250.192])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003f7e4d143cfsm7832711wmi.15.2023.06.22.06.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 06:57:42 -0700 (PDT)
Message-ID: <c08d81286b9986c086e9b68e3440f9bf99086d70.camel@redhat.com>
Subject: Re: [PATCH v2 2/2] mm/mmu_gather: send tlb_remove_table_smp_sync
 IPI only to MM CPUs
From: ypodemsk@redhat.com
To: Nadav Amit <nadav.amit@gmail.com>
Date: Thu, 22 Jun 2023 16:57:39 +0300
In-Reply-To: <10050BB1-15A4-4E84-B900-B21500B2079B@gmail.com>
References: <20230620144618.125703-1-ypodemsk@redhat.com>
	 <20230620144618.125703-3-ypodemsk@redhat.com>
	 <10050BB1-15A4-4E84-B900-B21500B2079B@gmail.com>
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8)
Mime-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: geert+renesas@glider.be, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linus.walleij@linaro.org, Dave Hansen <dave.hansen@linux.intel.com>, sebastian.reichel@collabora.com, linux-mm <linux-mm@kvack.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, Will Deacon <will@kernel.org>, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, ppandit@redhat.com, Ingo Molnar <mingo@redhat.com>, samitolvanen@google.com, Christian Borntraeger <borntraeger@linux.ibm.com>, frederic@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, gor@linux.ibm.com, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, rmk+kernel@armlinux.org.uk, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel
 @lists.infradead.org, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, aneesh.kumar@linux.ibm.com, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-06-21 at 11:02 -0700, Nadav Amit wrote:
> > On Jun 20, 2023, at 7:46 AM, Yair Podemsky <ypodemsk@redhat.com>
> > wrote:
> > 
> > @@ -1525,7 +1525,7 @@ static void collapse_and_free_pmd(struct
> > mm_struct *mm, struct vm_area_struct *v
> > 				addr + HPAGE_PMD_SIZE);
> > 	mmu_notifier_invalidate_range_start(&range);
> > 	pmd = pmdp_collapse_flush(vma, addr, pmdp);
> > -	tlb_remove_table_sync_one();
> > +	tlb_remove_table_sync_one(mm);
> 
> Can’t pmdp_collapse_flush() have one additional argument
> “freed_tables”
> that it would propagate, for instance on x86 to flush_tlb_mm_range()
> ?
> Then you would not need tlb_remove_table_sync_one() to issue an
> additional
> IPI, no?
> 
> It just seems that you might still have 2 IPIs in many cases instead
> of
> one, and unless I am missing something, I don’t see why.
> 
Hi Nadav,
Thanks for your comment.
I think you are right and in some configurations 2 IPIs might occur.
However I a am not really dealing with the thp code at the moment,
This patch is about the mmu_gatherer and mostly dealing with IPIs sent
via the other code path.
Thanks,
Yair

