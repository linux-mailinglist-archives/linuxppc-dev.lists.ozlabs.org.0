Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFD77403DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 21:12:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=tIcBSsqa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrDqV38Btz3bvB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 05:12:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=tIcBSsqa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrDpc2cxZz2xr6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 05:11:35 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-40079620a83so57061cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 12:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687893092; x=1690485092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDQfwDeAKrSsrpidMk41ByVr7rAta0NMcFmnCRtDfIY=;
        b=tIcBSsqafCGXLKenVt1fpFuS0HgcvXhoN1fscelTiFO0W+JMZvUfP2ocFlWD5XjFQZ
         xDGPf60hvTiMEltt+PWPmEf75tVnHsurwQ4PCG26oPRdzBd/gf28dWs1r109NjisMP9z
         d7701C/iv5K18kuWgut0yNAg5cxWnrFC4sTNFzkiVmnSuBV3XnpklCEJC1W5CqGQIPcL
         KuY1yJXLoMTR35+2FzPgCxt0DB3tMfA1m1SoLK2PeSAaDBzykPyeSnhEZ56bVsWWk/3Q
         90pywN1Fdll4rOwC0Q8kAfrJ8TtkqasqC414OWB85B9Zck56xfF1zPU8dE9BwisBvDfp
         OgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687893092; x=1690485092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDQfwDeAKrSsrpidMk41ByVr7rAta0NMcFmnCRtDfIY=;
        b=WOKkIWF8/RC8qedoT1sM1wbHnIMuBEP8BPu11NVElhrXtrrv09eP6hZFU06T/1ZVa7
         S04HPCPB0bfvOmaGc3xnvvIvm2W3xUrSoC4jHE1xHRh7NaHnRYY8WbbiZVVe23JAMCv7
         33SBK5d2QrvEx4MrAbOsyH2htZMgvkXM/EwwHzauJelTtCAFme52dJ9rMazQmpOx5OB5
         gRt5ryizSFzFEPA8O7gLTb2gk63RRNAz8K5UXhF5hCdXdgrrwr2WSqj2LQfqWRa55/zU
         jYnTW4qcoXy+Z312vQigHHKJAbHpMgaRACb1Oaqb11yCuyiVwGmkRv4KdHDkOymil8kB
         bRQg==
X-Gm-Message-State: AC+VfDzxOtJUWjynIPQ9dr8CTo+GW4GTFvekK8ZNtY26eNWvDOCAWZ4l
	Qnrs6ebDsX/vbgFWgXN8YdIKuOm1KrBwNrQV8gKa6w==
X-Google-Smtp-Source: ACHHUZ48452J+SqEq59D2HCrG9lok9BMOY13M2w9ux9yAiWWTZ9z9ehWMqAfmwUjcbSWe8cjbMSFWFBx8a++3hGisSM=
X-Received: by 2002:ac8:5b46:0:b0:3f7:ffc8:2f6f with SMTP id
 n6-20020ac85b46000000b003f7ffc82f6fmr23879qtw.28.1687893091988; Tue, 27 Jun
 2023 12:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230613120047.149573-1-aneesh.kumar@linux.ibm.com>
 <20230613120047.149573-3-aneesh.kumar@linux.ibm.com> <87bkh4x661.fsf@linux.ibm.com>
 <CAOUHufYM-gBNUyf8X9y3-OzCA5EeC5kR0VktV+F6pi8_6yC3Nw@mail.gmail.com>
 <959537fc-cee4-f5e8-d7be-5e4402feda9f@linux.ibm.com> <CAOUHufYZMddJXsy7xL=rG9U=caga=m6e3dfbme3KouuhdZN8Rw@mail.gmail.com>
 <e814b7e7-541b-518b-a63d-4fc2e7b87ab5@linux.ibm.com>
In-Reply-To: <e814b7e7-541b-518b-a63d-4fc2e7b87ab5@linux.ibm.com>
From: Yu Zhao <yuzhao@google.com>
Date: Tue, 27 Jun 2023 13:10:55 -0600
Message-ID: <CAOUHufZZFNXx9Zi1QRSQ+JrWvcHYo_D9-cEM_gEV7KSdgB73_A@mail.gmail.com>
Subject: Re: [PATCH 3/3] mm/lru_gen: Don't build multi-gen LRU page table walk
 code on architecture not supported
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 27, 2023 at 5:48=E2=80=AFAM Aneesh Kumar K V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 6/26/23 10:34 PM, Yu Zhao wrote:
> > On Mon, Jun 26, 2023 at 4:52=E2=80=AFAM Aneesh Kumar K V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> On 6/26/23 1:04 AM, Yu Zhao wrote:
> >>> On Sat, Jun 24, 2023 at 8:54=E2=80=AFAM Aneesh Kumar K.V
> >>> <aneesh.kumar@linux.ibm.com> wrote:
> >>>>
> >>>> Hi Yu Zhao,
> >>>>
> >>>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> >>>>
> >>>>> Not all architecture supports hardware atomic updates of access bit=
s. On
> >>>>> such an arch, we don't use page table walk to classify pages into
> >>>>> generations. Add a kernel config option and remove adding all the p=
age
> >>>>> table walk code on such architecture.
> >>>>>
> >>>>> No preformance change observed with mongodb ycsb test:
> >>>>>
> >>>>> Patch details        Throughput(Ops/sec)
> >>>>> without patch         93278
> >>>>> With patch            93400
> >>>>>
> >>>>> Without patch:
> >>>>> $ size mm/vmscan.o
> >>>>>    text    data     bss     dec     hex filename
> >>>>>  112102   42721      40  154863   25cef mm/vmscan.o
> >>>>>
> >>>>> With patch
> >>>>>
> >>>>> $ size  mm/vmscan.o
> >>>>>    text    data     bss     dec     hex filename
> >>>>>  105430   41333      24  146787   23d63 mm/vmscan.o
> >>>>>
> >>>>
> >>>> Any feedback on this patch? Can we look at merging this change?
> >>>
> >>> Just want to make sure I fully understand the motivation: are there
> >>> any other end goals besides reducing the footprint mentioned above?
> >>> E.g., preparing for HCA, etc. (My current understanding is that HCA
> >>> shouldn't care about it, since it's already runtime disabled if HCA
> >>> doesn't want to use it.)
> >>>
> >>
> >> My goal with this change was to remove all those dead code from gettin=
g complied
> >> in for ppc64.
> >
> > I see. But the first thing (lru_gen_add_folio()) you moved has nothing
> > to do with this goal, because it's still compiled after the entire
> > series.
> >
>
> Sure. will drop that change.
>
> >>> Also as explained offline, solely relying on folio_activate() in
> >>> lru_gen_look_around() can cause a measure regression on powerpc,
> >>> because
> >>> 1. PAGEVEC_SIZE is 15 whereas pglist_data->mm_walk.batched is
> >>> virtually unlimited.
> >>> 2. Once folio_activate() reaches that limit, it takes the LRU lock on
> >>> top of the PTL, which can be shared by multiple page tables on
> >>> powerpc.
> >>>
> >>> In fact, I think we try the opposite direction first, before arriving
> >>> at any conclusions, i.e.,
> >>>     #define arch_has_hw_pte_young() radix_enabled()
> >>
> >> The reason it is disabled on powerpc was that a reference bit update t=
akes a pagefault
> >> on powerpc irrespective of the translation mode.
> >
> > This is not true.
> >
> > From "IBM POWER9 Processor User Manual":
> > https://openpowerfoundation.org/resources/ibmpower9usermanual/
> >
> >   4.10.14 Reference and Change Bits
> >   ...
> >   When performing HPT translation, the hardware performs the R and C
> > bit updates nonatomically.
> >   ...
> >
> > The radix case is more complex, and I'll leave it to you to interpret
> > what it means:
> >
> > From "Power ISA Version 3.0 B":
> > https://openpowerfoundation.org/specifications/isa/
> >
> >   5.7.12 Reference and Change Recording
> >   ...
> >   For Radix Tree translation, the Reference and Change bits are set ato=
mically.
> >   ...
> >
>
> it is atomic in that software use ldarx/stdcx to update these bits. Hardw=
are/core won't
> update this directly even though Nest can update this directly without ta=
king a fault. So
> for all purpose we can assume that on radix R/C bit is updated by page fa=
ult handler.

Thanks. To me, it sounds like stating a function provided by h/w, not
a requirement for s/w. (IMO, the latter would be something like
"software must/should set the bits atomically.) But I'll take your
word for it.
