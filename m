Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974EF6A58D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 13:07:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQx2C19lZz3c72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 23:07:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gby5KpPW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=punit.agrawal@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gby5KpPW;
	dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQx1H5Slyz30Kr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 23:06:41 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id k37so6268295wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1677585995;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bp3F4cfna3ERELV0qv1FC8LtmHZqyDHs34ywT+7WJr4=;
        b=gby5KpPWtmDSuPSdmLVwOeyPJ75gi22wCTpni2UDLR3cqXxtkvNMB/VpBEeY9idtBP
         K/U8Vws19YkUgCdu+jDSNh2NeL453+iLuB/IpzCtIjSYL2zdJ/2dNnkTN2bSYLEHnq5P
         G642ZJC6fjauM2jjg21KMN1NQUFc/Sc/SO7y7B7QDnxxOfrauBykv/6LXVaK5Xc+k22j
         J7cN/VGbytB9c9UP3wvl4eb82JvIDf1II0/X5nVPbSMdwSwHGP9hF6iQJiFK/bcGD7R2
         1HPZJRfW4Atk/ucwXBlYO3GuWpMJaS/2o4mxzVy5GC3hbCFS4KTT9YBiWHlCVJEbWlEc
         vuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677585995;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bp3F4cfna3ERELV0qv1FC8LtmHZqyDHs34ywT+7WJr4=;
        b=z9kjWT6zE7jCUt9iB2JJ0VU1QVHi+P1JD9Rmb3c4XaSkXTRbXVFE5HAxTqMEEVbptB
         hTf5SImKmz+UiUH/sBa5UAoB1/CXNVdUOInJtDyYjImJNhI2lF80UAUPRDX/hek684pz
         +wf8FZgkVLTQSzHexaEkMGYe+W0+/uzF2nzskM/9BuVHvvV5nw4mj8+OmcLeHYUgT8YG
         lyFFnWR0uXbM1/Z2uCy4YVqMuvP7FEluSyxuyJonE+ivuK15cvqa/d0Rwly6qwbSjmAH
         jD913ZmnGrYjiwmGC3wVMkFfo8aP2EWzyLDyMDnDz268oi6df7kWcQNQlSw1taQbuxpB
         2Qpw==
X-Gm-Message-State: AO0yUKVoHPLRfwbhbLy5AB2eLW4k9XV5OK88ghdhy35EhmctPTiPACtj
	12VIVFz1Wdi03MwxAdo7mtJ7fg==
X-Google-Smtp-Source: AK7set9K5fr49pjDNXd0jk3vZV9+2nq0FdwHqxbkZhn7OHdaHusnSbCsOF6tn3AUWfDtVfZGp5A/wg==
X-Received: by 2002:a05:600c:19ca:b0:3ea:f883:53ea with SMTP id u10-20020a05600c19ca00b003eaf88353eamr1904265wmq.7.1677585994998;
        Tue, 28 Feb 2023 04:06:34 -0800 (PST)
Received: from localhost ([95.148.15.48])
        by smtp.gmail.com with ESMTPSA id l1-20020a1ced01000000b003ea57808179sm15482212wmh.38.2023.02.28.04.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 04:06:34 -0800 (PST)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: Punit Agrawal <punit.agrawal@bytedance.com>
Subject: Re: [PATCH v2 00/33] Per-VMA locks
References: <20230127194110.533103-1-surenb@google.com>
	<87r0uqq1f9.fsf@stealth>
Date: Tue, 28 Feb 2023 12:06:34 +0000
In-Reply-To: <87r0uqq1f9.fsf@stealth> (Punit Agrawal's message of "Wed, 15 Feb
	2023 17:32:58 +0000")
Message-ID: <87fsaqouyd.fsf_-_@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@tech
 singularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Punit Agrawal <punit.agrawal@bytedance.com> writes:

> Suren Baghdasaryan <surenb@google.com> writes:
>
>> Previous version:
>> v1: https://lore.kernel.org/all/20230109205336.3665937-1-surenb@google.c=
om/
>> RFC: https://lore.kernel.org/all/20220901173516.702122-1-surenb@google.c=
om/
>>
>> LWN article describing the feature:
>> https://lwn.net/Articles/906852/
>>
>> Per-vma locks idea that was discussed during SPF [1] discussion at LSF/MM
>> last year [2], which concluded with suggestion that =E2=80=9Ca reader/wr=
iter
>> semaphore could be put into the VMA itself; that would have the effect of
>> using the VMA as a sort of range lock. There would still be contention at
>> the VMA level, but it would be an improvement.=E2=80=9D This patchset im=
plements
>> this suggested approach.
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


The above workload represent the worst case with regards to per-VMA
locks as it creates a single large VMA. As a follow-up, I modified
pft[2] to create a VMA per thread to understand the behaviour in
scenarios where per-VMA locks should show the most benefit.

                                        6.2.0-rc4                6.2.0-rc4 =
               6.2.0-rc4
                             mm-unstable-20230210                   pvl-v2 =
              pvl-v2+opt

Hmean     faults/cpu-1     905497.4354 (   0.00%)   888736.5570 *  -1.85%* =
  888695.2675 *  -1.86%*
Hmean     faults/cpu-4     758519.2719 (   0.00%)   812103.1991 *   7.06%* =
  825077.9277 *   8.77%*
Hmean     faults/cpu-7     617153.8038 (   0.00%)   729943.4518 *  18.28%* =
  770872.3161 *  24.91%*
Hmean     faults/cpu-12    424848.5266 (   0.00%)   550357.2856 *  29.54%* =
  597478.5634 *  40.63%*
Hmean     faults/cpu-21    290142.9988 (   0.00%)   383668.3190 *  32.23%* =
  433376.8959 *  49.37%*
Hmean     faults/cpu-30    218705.2915 (   0.00%)   299888.5533 *  37.12%* =
  342640.6153 *  56.67%*
Hmean     faults/cpu-48    142842.3372 (   0.00%)   206498.2605 *  44.56%* =
  240306.3442 *  68.23%*
Hmean     faults/cpu-79     90706.1425 (   0.00%)   160006.6800 *  76.40%* =
  185298.4326 * 104.28%*
Hmean     faults/cpu-110    67011.9297 (   0.00%)   143536.0062 * 114.19%* =
  162688.8015 * 142.78%*
Hmean     faults/cpu-128    55986.4986 (   0.00%)   136550.8760 * 143.90%* =
  152718.8713 * 172.78%*

Hmean     faults/sec-1     905492.1265 (   0.00%)   887244.6592 *  -2.02%* =
  887775.6079 *  -1.96%*
Hmean     faults/sec-4    2994284.4204 (   0.00%)  3154236.9408 *   5.34%* =
 3221994.8465 *   7.60%*
Hmean     faults/sec-7    4177411.3461 (   0.00%)  4933286.4045 *  18.09%* =
 5202347.2077 *  24.54%*
Hmean     faults/sec-12   4892848.3633 (   0.00%)  6054577.0988 *  23.74%* =
 6511987.1142 *  33.09%*
Hmean     faults/sec-21   5823534.1820 (   0.00%)  7637637.4162 *  31.15%* =
 8553362.3513 *  46.88%*
Hmean     faults/sec-30   6247210.8414 (   0.00%)  8598150.6717 *  37.63%* =
 9799696.0945 *  56.87%*
Hmean     faults/sec-48   6274617.1419 (   0.00%)  9467132.3699 *  50.88%* =
11049401.9072 *  76.10%*
Hmean     faults/sec-79   6187291.4971 (   0.00%) 11919062.5284 *  92.64%* =
13420825.3820 * 116.91%*
Hmean     faults/sec-110  6454542.3239 (   0.00%) 15050228.1869 * 133.17%* =
16667873.7618 * 158.23%*
Hmean     faults/sec-128  6472970.8548 (   0.00%) 16647275.6575 * 157.18%* =
18680029.3714 * 188.59%*

As expected, the tests highlight the improved scalability as core count
increases.

> [0] https://github.com/gormanm/mmtests
> [1] https://github.com/gormanm/mmtests/blob/master/compare-kernels.sh

[2] https://github.com/gormanm/pft/pull/1/commits/8fe554a3d8b4f5947cd00d4b4=
6f97178b8ba8752
