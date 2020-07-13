Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3000021DF79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 20:20:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5Blw2cKbzDqXd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 04:20:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=u4CmsHwa; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5Bk635CPzDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 04:19:08 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id gc9so262435pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=DMv6KVcfwWuUfVxq/TG9jnHiUvzjJiD3obg8ZekXyMs=;
 b=u4CmsHwa7xaCe3zDb4jrOUPoyQAwVMb0GO0GgYreE3k9fxWU5POmlIk30LPDTgAQUj
 UXSamG1nn5bzlmnsItQRLjFVeTX9jNNZSWB3UwJkV82kO9sw8mlCK+8QA2A6XZi7xW2p
 cYw26U3rmfF6mijGvSDefylxiQCOhgYcxL7pxRoq9V/UTMxzAkw29s2tnGqbRpV7VXiB
 xUZoWpQGSZUmOzxEuR/l0sY53x7ZhIn9xs7ai2/qJ8GwCFJdnk5CAStVEdHSJJZOWF44
 QORefjrjcSrzgiOPOEdXNRfrCTZl39dyw6LhXayUWrSOVuTaE7f9koQ+xXXMyR2rQ5bk
 e1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=DMv6KVcfwWuUfVxq/TG9jnHiUvzjJiD3obg8ZekXyMs=;
 b=ZzUkifonMylG0BWtpgtloSa9sZ5rHS+0jf5YXRqMcaUSWs6qFSOw2PSxZxhYRvhkb4
 RJ2IV7a83ohlEFtx0/qLs7fLOrcd1Nn7rOTKoikJDwdHlQSy/XF+M58Keh5NqOlDEzx6
 OdAdg20R9GfvuBH4/QNANfNUss5IbNICvVqgnaIC9O1LZb+N4Ix6Iu6EmJbxo1qgMm1t
 vi9qh3AyGuIEtHqQvgNVbqkxawlTIP244JOGoC4ivjUk2QBObRDZNolEVfLZ85np1VBM
 QZ9ZmFSYFZfetEEx/60CQiETmyBAg2bHIt/e7SEtJWSydc9W+5QnNiPhlF2LSutlE0Ft
 hEQA==
X-Gm-Message-State: AOAM532MYylFJWLz19Fd53eyiQDzf7KNu8zHZ+LbdWWwnlDBQWdv86ZK
 aaIulxqO2tojtXbYZuox/8fIpg==
X-Google-Smtp-Source: ABdhPJxyhASCLIINvghsf6QoRE0SwaPQ4do1QD3z/4f/3BAYiXHFhS0sGlAWxIM465D2lRN3W0sD0g==
X-Received: by 2002:a17:90a:ba86:: with SMTP id t6mr719906pjr.10.1594664345260; 
 Mon, 13 Jul 2020 11:19:05 -0700 (PDT)
Received: from ?IPv6:2601:646:c200:1ef2:3071:afe7:f805:6350?
 ([2601:646:c200:1ef2:3071:afe7:f805:6350])
 by smtp.gmail.com with ESMTPSA id j5sm15051298pfa.5.2020.07.13.11.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 11:19:04 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH 7/7] lazy tlb: shoot lazies,
 a non-refcounting lazy tlb option
Date: Mon, 13 Jul 2020 11:18:57 -0700
Message-Id: <010054C3-7FFF-4FB5-BDA8-D2B80F7B1A5D@amacapital.net>
References: <1594658283.qabzoxga67.astroid@bobo.none>
In-Reply-To: <1594658283.qabzoxga67.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: iPhone Mail (17F80)
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
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On Jul 13, 2020, at 9:48 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> =EF=BB=BFExcerpts from Andy Lutomirski's message of July 14, 2020 1:59 am:=

>>> On Thu, Jul 9, 2020 at 6:57 PM Nicholas Piggin <npiggin@gmail.com> wrote=
:
>>>=20
>>> On big systems, the mm refcount can become highly contented when doing
>>> a lot of context switching with threaded applications (particularly
>>> switching between the idle thread and an application thread).
>>>=20
>>> Abandoning lazy tlb slows switching down quite a bit in the important
>>> user->idle->user cases, so so instead implement a non-refcounted scheme
>>> that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot down
>>> any remaining lazy ones.
>>>=20
>>> On a 16-socket 192-core POWER8 system, a context switching benchmark
>>> with as many software threads as CPUs (so each switch will go in and
>>> out of idle), upstream can achieve a rate of about 1 million context
>>> switches per second. After this patch it goes up to 118 million.
>>>=20
>>=20
>> I read the patch a couple of times, and I have a suggestion that could
>> be nonsense.  You are, effectively, using mm_cpumask() as a sort of
>> refcount.  You're saying "hey, this mm has no more references, but it
>> still has nonempty mm_cpumask(), so let's send an IPI and shoot down
>> those references too."  I'm wondering whether you actually need the
>> IPI.  What if, instead, you actually treated mm_cpumask as a refcount
>> for real?  Roughly, in __mmdrop(), you would only free the page tables
>> if mm_cpumask() is empty.  And, in the code that removes a CPU from
>> mm_cpumask(), you would check if mm_users =3D=3D 0 and, if so, check if
>> you just removed the last bit from mm_cpumask and potentially free the
>> mm.
>>=20
>> Getting the locking right here could be a bit tricky -- you need to
>> avoid two CPUs simultaneously exiting lazy TLB and thinking they
>> should free the mm, and you also need to avoid an mm with mm_users
>> hitting zero concurrently with the last remote CPU using it lazily
>> exiting lazy TLB.  Perhaps this could be resolved by having mm_count
>> =3D=3D 1 mean "mm_cpumask() is might contain bits and, if so, it owns the=

>> mm" and mm_count =3D=3D 0 meaning "now it's dead" and using some careful
>> cmpxchg or dec_return to make sure that only one CPU frees it.
>>=20
>> Or maybe you'd need a lock or RCU for this, but the idea would be to
>> only ever take the lock after mm_users goes to zero.
>=20
> I don't think it's nonsense, it could be a good way to avoid IPIs.
>=20
> I haven't seen much problem here that made me too concerned about IPIs=20
> yet, so I think the simple patch may be good enough to start with
> for powerpc. I'm looking at avoiding/reducing the IPIs by combining the
> unlazying with the exit TLB flush without doing anything fancy with
> ref counting, but we'll see.

I would be cautious with benchmarking here. I would expect that the nasty ca=
ses may affect power consumption more than performance =E2=80=94 the specifi=
c issue is IPIs hitting idle cores, and the main effects are to slow down ex=
it() a bit but also to kick the idle core out of idle. Although, if the idle=
 core is in a deep sleep, that IPI could be *very* slow.

So I think it=E2=80=99s worth at least giving this a try.

>=20
> Thanks,
> Nick
