Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B41A2CB2EE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 03:52:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm3Qy23zkzDr4r
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 13:52:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pdL+rHdq; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm3NW13Z4zDr42
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 13:50:02 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id l23so152187pjg.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 18:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=kK3Q9wTcGhoxGEIMY0Ll+QkOAdyw6ggQzHJw4qOuYBo=;
 b=pdL+rHdqu9vZr8iSAMFhpbbe1/kXYhSgOjwbgZIvhE/l3SVZzO1LhnQjnoaLWGVZl4
 M8c+NjJu2tub2F6H8k8gWWjXcgbDJp4gKUa4j1+U9N4XPzuCaWDIyztRbcztPyG3ztJx
 mnbn7XKo0qZCxNPxMHgwUJS8r+TtX0KOSXD/9QAArw2VisEk5mEtscjd6SeBtv9b4Hoi
 tWCCSUMhpeKm5oCwErlUeXm/kxSr524TEn1wjfLo4B+EYEAh1va4Ji9yppYQNEQsxMEY
 jCWQmFaKYEiI2A51naOLEBqu4aXSWyKOU2W+ekS9bj9SLU21fHSjE8JrSZY0g8CxoJ5Z
 PMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=kK3Q9wTcGhoxGEIMY0Ll+QkOAdyw6ggQzHJw4qOuYBo=;
 b=mkwUOOQUeu2Y3/xWcyolxhapFZ5EOfSfDXh20NavkOZkKs66iK02fqX/+kiOxpAC6G
 C44yqGeHn5eGYk7p4X/8JZNAj/TDDy2Vg+T4WpgwSKocGTO+ss5F689JP/Xwq95awZEp
 PG6Mi+P3loCkl62C5Zx3R4r7+Myvr9Yz1Vso9x/xTZqmHuWFCaZQSc1dg/fOnMoKK48/
 WYoUHViQWWTeiVc2UwN2RVT4jwvzRs8r865bf/S+2IpvZZtaueJfohGdvu7O9BOIYOn3
 KdkbYHBpsYbFrUT/MQIzZ3koj1hS17aPMxyktrwhXZkmrETT4LjLDi/bnbOuZBmQcRun
 W2sQ==
X-Gm-Message-State: AOAM533lGiKD0XI8AHkcBiDkKXeLVSWCTM0Dn2NiPIvrz6xrbBjghF0n
 xC/Nh8IZ7rzQDpr3mjKJxFc=
X-Google-Smtp-Source: ABdhPJyWh9QiGaql1Lp94BlZmVG3HCxLBZGBrbL9Z7xBftB8HeziAbVbGnP4a+X0o3l7pddCcYYVEA==
X-Received: by 2002:a17:902:fe05:b029:da:7345:c773 with SMTP id
 g5-20020a170902fe05b02900da7345c773mr664641plj.20.1606877399319; 
 Tue, 01 Dec 2020 18:49:59 -0800 (PST)
Received: from localhost ([1.132.177.56])
 by smtp.gmail.com with ESMTPSA id h8sm223576pgg.79.2020.12.01.18.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 18:49:58 -0800 (PST)
Date: Wed, 02 Dec 2020 12:49:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/8] lazy tlb: allow lazy tlb mm switching to be
 configurable
To: Andy Lutomirski <luto@kernel.org>
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-6-npiggin@gmail.com>
 <CALCETrWz3hqptsmTHAu1Qb=E8FPhYRVfcO1nhTVHwOpTNq6w1w@mail.gmail.com>
In-Reply-To: <CALCETrWz3hqptsmTHAu1Qb=E8FPhYRVfcO1nhTVHwOpTNq6w1w@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1606876546.8oyicax8hw.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of November 29, 2020 10:36 am:
> On Sat, Nov 28, 2020 at 8:02 AM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>
>> NOMMU systems could easily go without this and save a bit of code
>> and the refcount atomics, because their mm switch is a no-op. I
>> haven't flipped them over because haven't audited all arch code to
>> convert over to using the _lazy_tlb refcounting.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/Kconfig             | 11 +++++++
>>  include/linux/sched/mm.h | 13 ++++++--
>>  kernel/sched/core.c      | 68 +++++++++++++++++++++++++++++-----------
>>  kernel/sched/sched.h     |  4 ++-
>>  4 files changed, 75 insertions(+), 21 deletions(-)
>>
>> diff --git a/arch/Kconfig b/arch/Kconfig
>> index 56b6ccc0e32d..596bf589d74b 100644
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -430,6 +430,17 @@ config ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>>           irqs disabled over activate_mm. Architectures that do IPI base=
d TLB
>>           shootdowns should enable this.
>>
>> +# Should make this depend on MMU, because there is little use for lazy =
mm switching
>> +# with NOMMU. Must audit NOMMU architecture code for lazy mm refcountin=
g first.
>> +config MMU_LAZY_TLB
>> +       def_bool y
>> +       help
>> +         Enable "lazy TLB" mmu context switching for kernel threads.
>> +
>> +config MMU_LAZY_TLB_REFCOUNT
>> +       def_bool y
>> +       depends on MMU_LAZY_TLB
>> +
>=20
> This could use some documentation as to what "no" means.

Sure I can add a bit more.

>=20
>>  config ARCH_HAVE_NMI_SAFE_CMPXCHG
>>         bool
>>
>> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
>> index 7157c0f6fef8..bd0f27402d4b 100644
>> --- a/include/linux/sched/mm.h
>> +++ b/include/linux/sched/mm.h
>> @@ -51,12 +51,21 @@ static inline void mmdrop(struct mm_struct *mm)
>>  /* Helpers for lazy TLB mm refcounting */
>>  static inline void mmgrab_lazy_tlb(struct mm_struct *mm)
>>  {
>> -       mmgrab(mm);
>> +       if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT))
>> +               mmgrab(mm);
>>  }
>>
>>  static inline void mmdrop_lazy_tlb(struct mm_struct *mm)
>>  {
>> -       mmdrop(mm);
>> +       if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT)) {
>> +               mmdrop(mm);
>> +       } else {
>> +               /*
>> +                * mmdrop_lazy_tlb must provide a full memory barrier, s=
ee the
>> +                * membarrier comment finish_task_switch.
>=20
> "membarrier comment in finish_task_switch()", perhaps?

Sure.

Thanks,
Nick

