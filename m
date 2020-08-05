Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB9B23CD00
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 19:15:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMJCp3yClzDqHg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 03:15:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oziJJooK; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMJ7k5gB7zDqbB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 03:11:46 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id h19so48562642ljg.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Aug 2020 10:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wXACrCF85ppHwQuHqdOjCkc1N78NkRlSijLNjTow210=;
 b=oziJJooKYyQ5sG761r04I5LKIuXOAb4zkqQY0rWC/xo2s+cTYTs9U7RyQWnqJ5pq1v
 Nbi4cMvrIp/CIcHu8pIr+eoqlm0BvwqSZf/j11GWMus1IVdOI8eFA+JP3OpxAqxrqH8K
 4U3LrHkbnbOlDfybyMuly/WmuqEo0ptHsHBq2XUlda4WU2cHiLw7ZD+AnmV8uuOJ/jgu
 3gjhgLG0ATcZI4I3fwTk7ZEPoMTcfQVSsz4xqNOlCB6RK7j7M3zBxlIMpYdsF8DV3rrq
 yNVU9YFhsTtYiIivGSgzfm9XcHZ9fq/Ugzzwuzkf0diKBR/hJ5MKs2YpE9NsOoFGUM2c
 kG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wXACrCF85ppHwQuHqdOjCkc1N78NkRlSijLNjTow210=;
 b=Mi8eWkIMDcvxWbtv19gIj+sYekKIgTKeo8YFvuJRLLcowgYBkZ+MY7iXtCVaCI4ba+
 T3/ek2ooFaQbbYFY3YJaVaAoHXk4s2wb8OJCsQGq2W2uG6jaKxJMjk8m1j7MEcrlbBrk
 JU8/9SJeU73BTgrSfvlFZ7+PfUb+VupUck1Kti0TQ14lfilK/QPCnpAwpJUhIlb4zu2f
 ITf6ZKJmulSpVp2XhFgBglE5z3Qz+2GBNpzdjdDZmj/DOPxCnv0UPczeSIYfu2FU09Rg
 2AaPecYaoEtKpxGsap1XPf1UfOfjItnEcAVj6Gb1O3+3tkvbP12ikkk7PjjYIS43K0VK
 OXvw==
X-Gm-Message-State: AOAM532BKlKB1VDd2lWbS09+CgIxscOD/hVOKFeWr/YcwMDoKP1iEWjJ
 2wlJlI1HrJSuOGVWkBgeysUx6yfNWjj4HO9KxQI=
X-Google-Smtp-Source: ABdhPJwaicIhf8YdyAekvXwX7eOOzcHPiY2LvmIo6u440HJ6sOevFi0lA9FP0nbD1iVE8pjbKUmnQK8GBjMj1kpsXT0=
X-Received: by 2002:a2e:b814:: with SMTP id u20mr1829339ljo.202.1596647501750; 
 Wed, 05 Aug 2020 10:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-17-rppt@kernel.org>
In-Reply-To: <20200802163601.8189-17-rppt@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2020 19:11:30 +0200
Message-ID: <CANiq72k-hZwbnttADQhi3+NrHkLDVe95jxLAPvLbvSOW41+HaQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/17] memblock: implement
 for_each_reserved_mem_region() using __next_mem_region()
To: Mike Rapoport <rppt@kernel.org>
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-MM <linux-mm@kvack.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 2, 2020 at 6:40 PM Mike Rapoport <rppt@kernel.org> wrote:
>
>  .clang-format                    |  2 +-

The .clang-format bit:

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel
