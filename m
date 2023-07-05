Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD937747FFD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 10:44:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EcSDcbMF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwtWS4bp8z30gc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 18:44:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EcSDcbMF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwtVY5FCHz2yjk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 18:43:48 +1000 (AEST)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4435508cff9so1923002137.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 01:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688546625; x=1691138625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfLzlu2hCuH/qNgHtEqj71Fn9ZBy4uE0Z7kkhh4XPaU=;
        b=EcSDcbMFLlaEKCnAfTNq6ncklG6G9aICkpdmAnIqeybUq25h0n04X5AdQKHA7ie10B
         lNc/Wu9uxR7DSqJdKi4ZR4CO7aC60Was+59WEFygIao4OxzvM3ExJtlmMRSRSITZ3jbP
         qfJ5gWKACUFlABiAC3a9IKngo5vX/7G8Ge9CL2IQIMPWHD7oMIQLr33gNaWWRbzVsiSx
         na0BZny08KFWuPAM5Sfwwc2WMDxLARuH9UdUm0JKzhKrs5ZsuSsMdxQBN9TLHg/jfoN/
         bPmaYtawgUtRk99LL/nUxuk0QbU5QFV0LuLfeZTEUU9O9xTjggAvb3iW/nKfE0wnT34F
         eFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688546625; x=1691138625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfLzlu2hCuH/qNgHtEqj71Fn9ZBy4uE0Z7kkhh4XPaU=;
        b=kPrwZ5djdQGb3hQnFGUfMjNVQj/NkRbYt0rSdPpqDC+kY7EHV+LeX+PKtAIrcfjrd2
         EizRdvCb1s6tTS5kBwbFIcifXzQ7hnvmgnSgxKvQksqu2NUZKwNSpNDdhY+xN+OR5w4D
         RhfsOTwJaMBJs3pimdRzE7SGGtUruOx/foCXMqr4T1yyaocbwTHLUNlJN5wU4bvB8bHd
         MGNKv75XUJ6C3Qs8/ChNsyFHlKdKDZehMaMxnXYT55cIIVSd1NWMviAN9CUYOUNkOsak
         BGWMg4H+P1iHft4zQawIL/uLJs4hOwEsJ+AAFSHRebtEwp2qAfH+jH45bz2NuIR2CPIB
         sD6g==
X-Gm-Message-State: ABy/qLahePvt6p9P4oqf0ZhEYX4EvfQCm1OoRa7PCiShJowloCb/Q/UQ
	osN9cJJVXcMMnaxc9bcEkT11DtM+CUMe0zUQBzU=
X-Google-Smtp-Source: APBJJlFLUnJaRW83dmmmrNBi+Pcq3+yZ/Or6M1SrtK+X+fK4Yl/i1JA0jGSQfbLmKOpA+aNZfqIRanR69NKYC7JoALc=
X-Received: by 2002:a67:fd82:0:b0:443:7516:450b with SMTP id
 k2-20020a67fd82000000b004437516450bmr4352254vsq.35.1688546625075; Wed, 05 Jul
 2023 01:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230518065934.12877-1-yangyicong@huawei.com> <20230518065934.12877-3-yangyicong@huawei.com>
 <ZJ2x6DlmyA3kVh1n@arm.com> <ZJ2+37Q7v4odMmEd@arm.com> <2f593850-797c-5422-2c80-ce214fac02bb@huawei.com>
In-Reply-To: <2f593850-797c-5422-2c80-ce214fac02bb@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 5 Jul 2023 16:43:29 +0800
Message-ID: <CAGsJ_4zG=DT0gwC+5uN51rQKT=UudNDZ4t1BgRNoFb_3NNLOtQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v9 2/2] arm64: support batched/deferred tlb
 shootdown during page reclamation/migration
To: Yicong Yang <yangyicong@huawei.com>
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
Cc: mark.rutland@arm.com, wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, realmz6@gmail.com, linux-doc@vger.kernel.org, peterz@infradead.org, Catalin Marinas <catalin.marinas@arm.com>, yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, punit.agrawal@bytedance.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, ryan.roberts@arm.com, arnd@arndb.de, anshuman.khandual@arm.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, Jonathan.Cameron@huawei.com, linux-arm-kernel@lists.infradead.org, guojian@oppo.com, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 4, 2023 at 10:36=E2=80=AFPM Yicong Yang <yangyicong@huawei.com>=
 wrote:
>
> On 2023/6/30 1:26, Catalin Marinas wrote:
> > On Thu, Jun 29, 2023 at 05:31:36PM +0100, Catalin Marinas wrote:
> >> On Thu, May 18, 2023 at 02:59:34PM +0800, Yicong Yang wrote:
> >>> From: Barry Song <v-songbaohua@oppo.com>
> >>>
> >>> on x86, batched and deferred tlb shootdown has lead to 90%
> >>> performance increase on tlb shootdown. on arm64, HW can do
> >>> tlb shootdown without software IPI. But sync tlbi is still
> >>> quite expensive.
> >> [...]
> >>>  .../features/vm/TLB/arch-support.txt          |  2 +-
> >>>  arch/arm64/Kconfig                            |  1 +
> >>>  arch/arm64/include/asm/tlbbatch.h             | 12 ++++
> >>>  arch/arm64/include/asm/tlbflush.h             | 33 ++++++++-
> >>>  arch/arm64/mm/flush.c                         | 69 +++++++++++++++++=
++
> >>>  arch/x86/include/asm/tlbflush.h               |  5 +-
> >>>  include/linux/mm_types_task.h                 |  4 +-
> >>>  mm/rmap.c                                     | 12 ++--
> >>
> >> First of all, this patch needs to be split in some preparatory patches
> >> introducing/renaming functions with no functional change for x86. Once
> >> done, you can add the arm64-only changes.
> >>
>
> got it. will try to split this patch as suggested.
>
> >> Now, on the implementation, I had some comments on v7 but we didn't ge=
t
> >> to a conclusion and the thread eventually died:
> >>
> >> https://lore.kernel.org/linux-mm/Y7cToj5mWd1ZbMyQ@arm.com/
> >>
> >> I know I said a command line argument is better than Kconfig or some
> >> random number of CPUs heuristics but it would be even better if we don=
't
> >> bother with any, just make this always on.
>
> ok, will make this always on.
>
> >> Barry had some comments
> >> around mprotect() being racy and that's why we have
> >> flush_tlb_batched_pending() but I don't think it's needed (or, for
> >> arm64, it can be a DSB since this patch issues the TLBIs but without t=
he
> >> DVM Sync). So we need to clarify this (see Barry's last email on the
> >> above thread) and before attempting new versions of this patchset. Wit=
h
> >> flush_tlb_batched_pending() removed (or DSB), I have a suspicion such
> >> implementation would be faster on any SoC irrespective of the number o=
f
> >> CPUs.
> >
> > I think I got the need for flush_tlb_batched_pending(). If
> > try_to_unmap() marks the pte !present and we have a pending TLBI,
> > change_pte_range() will skip the TLB maintenance altogether since it di=
d
> > not change the pte. So we could be left with stale TLB entries after
> > mprotect() before TTU does the batch flushing.
> >

Good catch.
This could be also true for MADV_DONTNEED. after try_to_unmap, we run
MADV_DONTNEED on this area, as pte is not present, we don't do anything
on this PTE in zap_pte_range afterwards.

> > We can have an arch-specific flush_tlb_batched_pending() that can be a
> > DSB only on arm64 and a full mm flush on x86.
> >
>
> We need to do a flush/dsb in flush_tlb_batched_pending() only in a race
> condition so we first check whether there's a pended batched flush and
> if so do the tlb flush. The pending checking is common and the difference=
s
> among the archs is how to flush the TLB here within the flush_tlb_batched=
_pending(),
> on arm64 it should only be a dsb.
>
> As we only needs to maintain the TLBs already pended in batched flush,
> does it make sense to only handle those TLBs in flush_tlb_batched_pending=
()?
> Then we can use the arch_tlbbatch_flush() rather than flush_tlb_mm() in
> flush_tlb_batched_pending() and no arch specific function needed.

as we have issued no-sync tlbi on those pending addresses , that means
our hardware
has already "recorded" what should be flushed in the specific mm. so
DSB only will flush
them correctly. right?

>
> Thanks.
>

Barry
