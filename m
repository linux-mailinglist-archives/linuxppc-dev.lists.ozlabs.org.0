Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0115869822B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 18:34:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH4tt6DnRz3f2k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 04:33:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=wTYzp+HL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=punit.agrawal@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=wTYzp+HL;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH4sw28rFz3cd2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 04:33:06 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id y1so19961869wru.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 09:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0t94xwbIE7oAhUJFQ2BQHFhw0oZE0qnNECyAb2ZFKHQ=;
        b=wTYzp+HLVi+lx88ricSM/4zA8JGJ0VYAUK8sP1YwmHt5MGHWabBceqwlwxcEPxzMvc
         magXOb6suv1DXlOStB5PZvc2zBV9hlnvnH4H50+kYlzyuV0Uu06GW3ZzJsNjP1wjmEm/
         /g6mWpsZrj7fTLUZSrzvfBri7ZHgBO27wAq3dbmuY1x4ZZ0PkgpMBAjk0VwNa34aASAE
         A6rGzpy27hnSGLZSLkcS6pi1DiFjFqnQuJ3Rc47jhXlM2nYrZ2UnOXk5csTd2qgzNdtr
         43SrIB3xEnsd/MLqrCKN/npLj7g40d4R1m+2AC2+7QkNOt17ZlxEe1FozUu7SHAncT2A
         rrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0t94xwbIE7oAhUJFQ2BQHFhw0oZE0qnNECyAb2ZFKHQ=;
        b=tuAXYk6LcC6p/DdWGgZ67bPGVOqxERr+m2fg8SRF/eeQGr544bXSke/i0+9xc5n73g
         L+DmKm4gv5QeyfAMpQV+3dIKMLeHRKXqGVjgLBDeGAJkl4f8bQE3ySJ8ULpKDgIGbZrV
         Ll0Xd7ckB+pJwvIUpB2DS2YVuSE0jYIf3FdN53vlggb6Uiiv3yb5aDirBEqbsu0PMAPk
         4wueHRd5dw1KlbKeLGngazjcURbPP70maw87H7tFj4uZkYZ9MJMxgnH3Z76wwXah7XA7
         lzcVVwgKCSEtEgGvgoMYdojkAMsFUFlDDm8z8N40+kZaAbbeWVqBkTqZi/17ly+2j1Ap
         1TTA==
X-Gm-Message-State: AO0yUKXGIozr2J4hrXI9AUIj8yCpy1bb4qSZg9iI0eupDQq+3L2qwVIP
	5asunJdEZ1YiBLKvfKYp2kqM6w==
X-Google-Smtp-Source: AK7set9kT9H6NMj2/S3WBxDWHmAmNxq0wUR9ec7mDgnR1zjNhxV91JrWyeNEVDzBJm76EQ32XvPpCg==
X-Received: by 2002:a5d:4b03:0:b0:2c5:644c:3e89 with SMTP id v3-20020a5d4b03000000b002c5644c3e89mr2357955wrq.67.1676482380110;
        Wed, 15 Feb 2023 09:33:00 -0800 (PST)
Received: from localhost ([95.148.15.48])
        by smtp.gmail.com with ESMTPSA id f26-20020a5d58fa000000b002c5526680cbsm10288128wrd.92.2023.02.15.09.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 09:32:59 -0800 (PST)
From: Punit Agrawal <punit.agrawal@bytedance.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [External] [PATCH v2 00/33] Per-VMA locks
References: <20230127194110.533103-1-surenb@google.com>
Date: Wed, 15 Feb 2023 17:32:58 +0000
In-Reply-To: <20230127194110.533103-1-surenb@google.com> (Suren Baghdasaryan's
	message of "Fri, 27 Jan 2023 11:40:37 -0800")
Message-ID: <87r0uqq1f9.fsf@stealth>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity
 .net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Suren Baghdasaryan <surenb@google.com> writes:

> Previous version:
> v1: https://lore.kernel.org/all/20230109205336.3665937-1-surenb@google.co=
m/
> RFC: https://lore.kernel.org/all/20220901173516.702122-1-surenb@google.co=
m/
>
> LWN article describing the feature:
> https://lwn.net/Articles/906852/
>
> Per-vma locks idea that was discussed during SPF [1] discussion at LSF/MM
> last year [2], which concluded with suggestion that =E2=80=9Ca reader/wri=
ter
> semaphore could be put into the VMA itself; that would have the effect of
> using the VMA as a sort of range lock. There would still be contention at
> the VMA level, but it would be an improvement.=E2=80=9D This patchset imp=
lements
> this suggested approach.

I took the patches for a spin on a 2-socket 32 core (64 threads) system
with Intel 8336C (Ice Lake) and 512GB of RAM.

For the initial testing, "pft-threads" from the mm-tests suite[0] was
used. The test mmaps a memory region (~100GB on the test system) and
triggers access by a number of threads executing in parallel. For each
degree of parallelism, the test is repeated 10 times to get a better
feel for the behaviour. Below is an excerpt of the harmonic mean
reported by 'compare_kernel' script[1] included with mm-tests.

The first column is results for mm-unstable as of 2023-02-10, the second
column is the patches posted here while the third column includes
optimizations to reclaim some of the observed regression.

From the results, there is a drop in page fault/second for low number of
CPUs but good improvement with higher CPUs.

                                        6.2.0-rc4                6.2.0-rc4 =
               6.2.0-rc4
                             mm-unstable-20230210                   pvl-v2 =
              pvl-v2+opt

Hmean     faults/cpu-1     898792.9338 (   0.00%)   894597.0474 *  -0.47%* =
  895933.2782 *  -0.32%*
Hmean     faults/cpu-4     751903.9803 (   0.00%)   677764.2975 *  -9.86%* =
  688643.8163 *  -8.41%*
Hmean     faults/cpu-7     612275.5663 (   0.00%)   565363.4137 *  -7.66%* =
  597538.9396 *  -2.41%*
Hmean     faults/cpu-12    434460.9074 (   0.00%)   410974.2708 *  -5.41%* =
  452501.4290 *   4.15%*
Hmean     faults/cpu-21    291475.5165 (   0.00%)   293936.8460 (   0.84%) =
  308712.2434 *   5.91%*
Hmean     faults/cpu-30    218021.3980 (   0.00%)   228265.0559 *   4.70%* =
  241897.5225 *  10.95%*
Hmean     faults/cpu-48    141798.5030 (   0.00%)   162322.5972 *  14.47%* =
  166081.9459 *  17.13%*
Hmean     faults/cpu-79     90060.9577 (   0.00%)   107028.7779 *  18.84%* =
  109810.4488 *  21.93%*
Hmean     faults/cpu-110    64729.3561 (   0.00%)    80597.7246 *  24.51%* =
   83134.0679 *  28.43%*
Hmean     faults/cpu-128    55740.1334 (   0.00%)    68395.4426 *  22.70%* =
   69248.2836 *  24.23%*

Hmean     faults/sec-1     898781.7694 (   0.00%)   894247.3174 *  -0.50%* =
  894440.3118 *  -0.48%*
Hmean     faults/sec-4    2965588.9697 (   0.00%)  2683651.5664 *  -9.51%* =
 2726450.9710 *  -8.06%*
Hmean     faults/sec-7    4144512.3996 (   0.00%)  3891644.2128 *  -6.10%* =
 4099918.8601 (  -1.08%)
Hmean     faults/sec-12   4969513.6934 (   0.00%)  4829731.4355 *  -2.81%* =
 5264682.7371 *   5.94%*
Hmean     faults/sec-21   5814379.4789 (   0.00%)  5941405.3116 *   2.18%* =
 6263716.3903 *   7.73%*
Hmean     faults/sec-30   6153685.3709 (   0.00%)  6489311.6634 *   5.45%* =
 6910843.5858 *  12.30%*
Hmean     faults/sec-48   6197953.1327 (   0.00%)  7216320.7727 *  16.43%* =
 7412782.2927 *  19.60%*
Hmean     faults/sec-79   6167135.3738 (   0.00%)  7425927.1022 *  20.41%* =
 7637042.2198 *  23.83%*
Hmean     faults/sec-110  6264768.2247 (   0.00%)  7813329.3863 *  24.72%* =
 7984344.4005 *  27.45%*
Hmean     faults/sec-128  6460727.8216 (   0.00%)  7875664.8999 *  21.90%* =
 8049910.3601 *  24.60%*

[0] https://github.com/gormanm/mmtests
[1] https://github.com/gormanm/mmtests/blob/master/compare-kernels.sh
