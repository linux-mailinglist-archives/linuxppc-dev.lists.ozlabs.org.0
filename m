Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7687D73AF22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 05:39:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=obkzvxCG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnNKQ2cvjz3bn6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 13:39:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=obkzvxCG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=shy828301@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnNJX6VJdz305R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 13:39:06 +1000 (AEST)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-630074df712so2332246d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 20:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687491543; x=1690083543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQCkd4lI+x6yZWQGbIGjk8nvglDFNi+aN+K8MOcwH6c=;
        b=obkzvxCGresnf5FRfVrvj4b/znqPUmGMMwKvIvfk8JFNu1deF5iG2IClXFSs/hqBes
         0DchAnN9jcxuJK+1+ZKd23RORLAtCB1aaCRRAW/OhJcfqCqUQNLBzTBpbxJmpuWbKfjS
         GHJW8WsTLXwJYS5PMKJOMqwGF/WhlRObHMiD0r0si8DOzKdhQ3DRjzuP54tE28VCyLvh
         LV9mOcap4BQfgiSa4vCLx3tJr5yWQgnZ2UsTStLz9NxYkxX8IS7oFayaE3MrbO0dEpB/
         K0gDAaORiA1jbA+zNdWb4SjSRPyF9Y1hEdIFkFam1bjGmw9MYsZEQu4LxQURWeFd5nOn
         uaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687491543; x=1690083543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQCkd4lI+x6yZWQGbIGjk8nvglDFNi+aN+K8MOcwH6c=;
        b=RghjoZMSb6YYHL8KIH3ruB/k+RxC8aVAEmsVPOFTM6iixwIv7JEV0kW7rYsVblR2/y
         3103tDU+pOizzZ/dmGI06B955ALaKTn2m99dOOh+z5bJhxF3ggFbjMLXOwYxNYqtJYYr
         GhIyZiqpTn4uoVe72jIamgNfdQmWn0DnyZ1YdJ4MGa2KqN08izQ5h4fK1hzJNFeOEsfF
         T7TM8swdXUac+cBQnyqVWerLv9C5+AQ6Putauv/7Y4ZvvU1GniX/haHK5vtrOI+gxk45
         O4qXIIwejXQWLk4Yva1R2HmrKIL51GWiVMI6XtQxHMJmpuQ79aCb+gd906RN9OLvY6PG
         TO+A==
X-Gm-Message-State: AC+VfDzvnFP90xAz5Nh5aQLMmg1ucAemuGawpa2Z1//T+xQipuW3wGQn
	JYIXJEJntyuybfCeI864zCOBKSCrOjt58NA39iM=
X-Google-Smtp-Source: ACHHUZ4TEnCYuyVXkOaJkrxqOvUh5TaEibt2frAQVMu4v4pRBqRYzpLpvZ5Z+pdQLYqT/hxYRfdn3rRiaTS4M+MnTIo=
X-Received: by 2002:a05:6214:29c8:b0:62d:f35c:a477 with SMTP id
 gh8-20020a05621429c800b0062df35ca477mr28990227qvb.1.1687491542761; Thu, 22
 Jun 2023 20:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230620144618.125703-1-ypodemsk@redhat.com> <20230620144618.125703-3-ypodemsk@redhat.com>
 <10050BB1-15A4-4E84-B900-B21500B2079B@gmail.com>
In-Reply-To: <10050BB1-15A4-4E84-B900-B21500B2079B@gmail.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 22 Jun 2023 20:38:51 -0700
Message-ID: <CAHbLzko2rNj8jdHVUw+kxF8Pz7b3o4im1ndoLbW611e2T3-LzA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to MM CPUs
To: Nadav Amit <nadav.amit@gmail.com>, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: geert+renesas@glider.be, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linus.walleij@linaro.org, Dave Hansen <dave.hansen@linux.intel.com>, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm <linux-mm@kvack.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, Will Deacon <will@kernel.org>, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, the arch/x86 maintainers <x86@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, ppandit@redhat.com, Ingo Molnar <mingo@redhat.com>, samitolvanen@google.com, Christian Borntraeger <borntraeger@linux.ibm.com>, frederic@kernel.org, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, gor@linux.ibm.com, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, rmk+kernel@armlinux.org.uk, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <
 tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, aneesh.kumar@linux.ibm.com, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 21, 2023 at 11:02=E2=80=AFAM Nadav Amit <nadav.amit@gmail.com> =
wrote:
>
> >
> > On Jun 20, 2023, at 7:46 AM, Yair Podemsky <ypodemsk@redhat.com> wrote:
> >
> > @@ -1525,7 +1525,7 @@ static void collapse_and_free_pmd(struct mm_struc=
t *mm, struct vm_area_struct *v
> >                               addr + HPAGE_PMD_SIZE);
> >       mmu_notifier_invalidate_range_start(&range);
> >       pmd =3D pmdp_collapse_flush(vma, addr, pmdp);
> > -     tlb_remove_table_sync_one();
> > +     tlb_remove_table_sync_one(mm);
>
> Can=E2=80=99t pmdp_collapse_flush() have one additional argument =E2=80=
=9Cfreed_tables=E2=80=9D
> that it would propagate, for instance on x86 to flush_tlb_mm_range() ?
> Then you would not need tlb_remove_table_sync_one() to issue an additiona=
l
> IPI, no?
>
> It just seems that you might still have 2 IPIs in many cases instead of
> one, and unless I am missing something, I don=E2=80=99t see why.

The tlb_remove_table_sync_one() is used to serialize against fast GUP
for the architectures which don't broadcast TLB flush by IPI, for
example, arm64, etc. It may incur one extra IPI for x86 and some
others, but x86 virtualization needs this since the guest may not
flush TLB by sending IPI IIUC. So if the one extra IPI is really a
problem, we may be able to define an arch-specific function to deal
with it, for example, a pv ops off the top of my head. But I'm not a
virtualization expert, I'm not entirely sure whether it is the best
way or not.  But the complexity seems overkilling TBH since khugepaged
is usually not called that often.

>
>
