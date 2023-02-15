Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0909698253
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 18:40:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH5273vnNz3cj2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 04:40:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WFAY+kEZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WFAY+kEZ;
	dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH51C3btYz3cd2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 04:39:26 +1100 (AEDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-52f1b1d08c2so164220247b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 09:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1TegSQrWWZR8y8DXduRdcFIn2Gv2LGeDQhHy0b7yto=;
        b=WFAY+kEZ4MUdHDMej8sLvtg1NtCcTyLoaa4kCDjumgF1vPSCpCOQp0+SmPTWbbphgv
         1qdEB+3c/ZsfI94TpAHvpgnaLXkkGdTp8XwEdrQZlev5nAjGSshe5cXxUXy797Sw4ut1
         gX/ad1x9WEbuoDv795bj09rb50PEfKJOBtFgqU6rb0sLGt72Dz1sQphwKeGT21Q8+Qx8
         5cEIPSOcV2HFtdiFZ0eANnerOvXt/Em+YWCypMgOZl2VNk5VRH4w48igI78zrl0HI95T
         PTEvIHWKpPRzvi5TTuAo2VDj5vjGZ8ebBdC1U/wiQmmhOYnpLRXBS/12cTMrvERyYByi
         Kg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1TegSQrWWZR8y8DXduRdcFIn2Gv2LGeDQhHy0b7yto=;
        b=0FaHY5c3R33sSh7Czaytkz15/vs2sF/OyS4j1H7oPfCWPcdCQxcuDo2v+rsKFYxWB7
         WuHto7fOPXzLvTirmBievCu3ojduyEtSX3UB1GAj1KLQhTVgwUKheLzNR8TabSlW10y0
         pYMO5R0kl39en4l35tstz+WzYn76SioVyexztjsE2dZ6EVj/OgvMXvu/W7HdWbWRaiLO
         CRkG3Jc9/8dWOInRaOAy22ljWpBsR1QjR+AHQS4waD9x8Gl/TA7MPjN2dBbWimHupxuG
         eBRhX5foE4sDFQBcGeE9Zzg0Q1w7pvtE9etSBmEGmzusPpwHrA8221L+MQ3fy2Z2YRIU
         Ab2g==
X-Gm-Message-State: AO0yUKVOHW8Qn42O/2QNORIuhwt5vJw6aUDxiiG02CMNHZcJ9NxT5Qcg
	QK+Jndr7ONh6KbShwEcT6jeHrR2f0QNnFDEU6TiNCg==
X-Google-Smtp-Source: AK7set9tj0SuaGqHnOQP442Zg1VoaONJfoFdwtf3ZUGe2VF4FOCBp2d9PHYcB5dmd1FIm9VjS1Fr8aaHX2CzwR1jECs=
X-Received: by 2002:a0d:f481:0:b0:52f:6f1:c397 with SMTP id
 d123-20020a0df481000000b0052f06f1c397mr370391ywf.321.1676482762380; Wed, 15
 Feb 2023 09:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com> <87r0uqq1f9.fsf@stealth>
In-Reply-To: <87r0uqq1f9.fsf@stealth>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 15 Feb 2023 09:39:11 -0800
Message-ID: <CAJuCfpEtbN7ivxD_QHa+bqhr5f4SqkVUTvodcwt6Snj=d+f6qg@mail.gmail.com>
Subject: Re: [External] [PATCH v2 00/33] Per-VMA locks
To: Punit Agrawal <punit.agrawal@bytedance.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 15, 2023 at 9:33 AM Punit Agrawal
<punit.agrawal@bytedance.com> wrote:
>
> Suren Baghdasaryan <surenb@google.com> writes:
>
> > Previous version:
> > v1: https://lore.kernel.org/all/20230109205336.3665937-1-surenb@google.=
com/
> > RFC: https://lore.kernel.org/all/20220901173516.702122-1-surenb@google.=
com/
> >
> > LWN article describing the feature:
> > https://lwn.net/Articles/906852/
> >
> > Per-vma locks idea that was discussed during SPF [1] discussion at LSF/=
MM
> > last year [2], which concluded with suggestion that =E2=80=9Ca reader/w=
riter
> > semaphore could be put into the VMA itself; that would have the effect =
of
> > using the VMA as a sort of range lock. There would still be contention =
at
> > the VMA level, but it would be an improvement.=E2=80=9D This patchset i=
mplements
> > this suggested approach.
>
> I took the patches for a spin on a 2-socket 32 core (64 threads) system
> with Intel 8336C (Ice Lake) and 512GB of RAM.
>
> For the initial testing, "pft-threads" from the mm-tests suite[0] was
> used. The test mmaps a memory region (~100GB on the test system) and
> triggers access by a number of threads executing in parallel. For each
> degree of parallelism, the test is repeated 10 times to get a better
> feel for the behaviour. Below is an excerpt of the harmonic mean
> reported by 'compare_kernel' script[1] included with mm-tests.
>
> The first column is results for mm-unstable as of 2023-02-10, the second
> column is the patches posted here while the third column includes
> optimizations to reclaim some of the observed regression.
>
> From the results, there is a drop in page fault/second for low number of
> CPUs but good improvement with higher CPUs.
>
>                                         6.2.0-rc4                6.2.0-rc=
4                6.2.0-rc4
>                              mm-unstable-20230210                   pvl-v=
2               pvl-v2+opt
>
> Hmean     faults/cpu-1     898792.9338 (   0.00%)   894597.0474 *  -0.47%=
*   895933.2782 *  -0.32%*
> Hmean     faults/cpu-4     751903.9803 (   0.00%)   677764.2975 *  -9.86%=
*   688643.8163 *  -8.41%*
> Hmean     faults/cpu-7     612275.5663 (   0.00%)   565363.4137 *  -7.66%=
*   597538.9396 *  -2.41%*
> Hmean     faults/cpu-12    434460.9074 (   0.00%)   410974.2708 *  -5.41%=
*   452501.4290 *   4.15%*
> Hmean     faults/cpu-21    291475.5165 (   0.00%)   293936.8460 (   0.84%=
)   308712.2434 *   5.91%*
> Hmean     faults/cpu-30    218021.3980 (   0.00%)   228265.0559 *   4.70%=
*   241897.5225 *  10.95%*
> Hmean     faults/cpu-48    141798.5030 (   0.00%)   162322.5972 *  14.47%=
*   166081.9459 *  17.13%*
> Hmean     faults/cpu-79     90060.9577 (   0.00%)   107028.7779 *  18.84%=
*   109810.4488 *  21.93%*
> Hmean     faults/cpu-110    64729.3561 (   0.00%)    80597.7246 *  24.51%=
*    83134.0679 *  28.43%*
> Hmean     faults/cpu-128    55740.1334 (   0.00%)    68395.4426 *  22.70%=
*    69248.2836 *  24.23%*
>
> Hmean     faults/sec-1     898781.7694 (   0.00%)   894247.3174 *  -0.50%=
*   894440.3118 *  -0.48%*
> Hmean     faults/sec-4    2965588.9697 (   0.00%)  2683651.5664 *  -9.51%=
*  2726450.9710 *  -8.06%*
> Hmean     faults/sec-7    4144512.3996 (   0.00%)  3891644.2128 *  -6.10%=
*  4099918.8601 (  -1.08%)
> Hmean     faults/sec-12   4969513.6934 (   0.00%)  4829731.4355 *  -2.81%=
*  5264682.7371 *   5.94%*
> Hmean     faults/sec-21   5814379.4789 (   0.00%)  5941405.3116 *   2.18%=
*  6263716.3903 *   7.73%*
> Hmean     faults/sec-30   6153685.3709 (   0.00%)  6489311.6634 *   5.45%=
*  6910843.5858 *  12.30%*
> Hmean     faults/sec-48   6197953.1327 (   0.00%)  7216320.7727 *  16.43%=
*  7412782.2927 *  19.60%*
> Hmean     faults/sec-79   6167135.3738 (   0.00%)  7425927.1022 *  20.41%=
*  7637042.2198 *  23.83%*
> Hmean     faults/sec-110  6264768.2247 (   0.00%)  7813329.3863 *  24.72%=
*  7984344.4005 *  27.45%*
> Hmean     faults/sec-128  6460727.8216 (   0.00%)  7875664.8999 *  21.90%=
*  8049910.3601 *  24.60%*

Thanks for summarizing the findings, Punit! So, looks like the latest
fixes I sent to you for testing (pvl-v2+opt) bring the regression down
quite a bit. faults/sec-4 case is still regressing but the rest look
quite good. I'll incorporate those fixes and post v3 shortly. Thanks!

>
> [0] https://github.com/gormanm/mmtests
> [1] https://github.com/gormanm/mmtests/blob/master/compare-kernels.sh
