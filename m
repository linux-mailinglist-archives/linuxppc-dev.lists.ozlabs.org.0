Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C376121CE77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 06:59:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4rzm4B2ZzDqW2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 14:59:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=twLvAk0Z; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4ryC5PY0zDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 14:58:25 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id u185so5495192pfu.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jul 2020 21:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=P9lvh6IbVzCStjX6UUqQ4hMLI1Givor5C1Gp3Fr1r88=;
 b=twLvAk0ZReArj6wfcl7hQ//jm11HXj/KFahAEPL+UM6ujjMxhZiF0A0GOyw2PNcD6n
 mpih/dpKWaQtDJIw68Mh6Mc/STHYFqpCPq5h12R3J5lg6CFdfbcacHxe/Hbw2um73nEr
 bYGFr3b9Btax772OMVBYuUmLxSf7OP35btmVMCe+X8dfchC/n+BTM4c9hQJgnzjZKXNs
 cOlxmSMsn5/NM+lPQSJGSh167XGYYbPSShRi+exUS8TdpmMudsYE/pFUxAFqyIS6bzXB
 byoyuNxro9XNx2Xd0kYoj7WbW86Izvr05PEjwIPv3cEJydPxXqXYo3/liFM/xZSJ6Hgq
 jchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=P9lvh6IbVzCStjX6UUqQ4hMLI1Givor5C1Gp3Fr1r88=;
 b=aNLCXF6ETSLW/pWsCA3rAb7FyFGFgeVb/ppXXAI685QKWNvqevw5xBLiH979OuAPrI
 tXv60qix9ccscNwtKSwdrowyxAevI2NW07s+8F3AmPqGoSqcNAx7who+vGLkApMVnjsg
 9exvrqj4ZscrHuSfhRkF4EEJdybCUoxcRBSwyeZo5j91iYoCaLZW3GyVxEmAe+QGJgV5
 TLVgggzaihf+26UiDZ/KEHlP8S0qwIComgyENpujchVwfiK1gzGXiAl5nQIycMlo44DZ
 PYmiYeoPpqWgThXLcZ0nc6sXx7HipJLoAwPgS4E+G81aZdHGkVK8qkzFBZwZMgCvZ2an
 bcYw==
X-Gm-Message-State: AOAM530dTsaSKDRIODYAR6GkQIafgR61qLOVLoBEBOUIf6Ok8O1QEFg7
 /9XJj6Xg4kEZwT8V3Fo3B1w=
X-Google-Smtp-Source: ABdhPJyVdzyfh+4/fnCB+gvx/RI5CNBM3ozikU//q1BXlfMf+CY/xIg+P4iZrF3k5Z/5NYCTX1F4YQ==
X-Received: by 2002:a63:4543:: with SMTP id u3mr62898286pgk.398.1594616302094; 
 Sun, 12 Jul 2020 21:58:22 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id g5sm13135499pfh.168.2020.07.12.21.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 21:58:21 -0700 (PDT)
Date: Mon, 13 Jul 2020 14:58:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 7/7] lazy tlb: shoot lazies, a non-refcounting lazy
 tlb option
To: Peter Zijlstra <peterz@infradead.org>
References: <20200710015646.2020871-1-npiggin@gmail.com>
 <20200710015646.2020871-8-npiggin@gmail.com>
 <20200710093556.GY4800@hirez.programming.kicks-ass.net>
In-Reply-To: <20200710093556.GY4800@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1594615574.lowminiy4u.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Peter Zijlstra's message of July 10, 2020 7:35 pm:
> On Fri, Jul 10, 2020 at 11:56:46AM +1000, Nicholas Piggin wrote:
>> On big systems, the mm refcount can become highly contented when doing
>> a lot of context switching with threaded applications (particularly
>> switching between the idle thread and an application thread).
>>=20
>> Abandoning lazy tlb slows switching down quite a bit in the important
>> user->idle->user cases, so so instead implement a non-refcounted scheme
>> that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot down
>> any remaining lazy ones.
>>=20
>> On a 16-socket 192-core POWER8 system, a context switching benchmark
>> with as many software threads as CPUs (so each switch will go in and
>> out of idle), upstream can achieve a rate of about 1 million context
>> switches per second. After this patch it goes up to 118 million.
>=20
> That's mighty impressive, however:

Well, it's the usual case of "find a bouncing line and scale up the
machine size until you achieve your desired improvements" :) But we
are looking at some fundamental scalabilities and seeing if we can
improve a few things.

>=20
>> +static void shoot_lazy_tlbs(struct mm_struct *mm)
>> +{
>> +	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_SHOOTDOWN)) {
>> +		smp_call_function_many(mm_cpumask(mm), do_shoot_lazy_tlb, (void *)mm,=
 1);
>> +		do_shoot_lazy_tlb(mm);
>> +	}
>> +}
>=20
> IIRC you (power) never clear a CPU from that mask, so for other
> workloads I can see this resulting in massive amounts of IPIs.
>=20
> For instance, take as many processes as you have CPUs. For each,
> manually walk the task across all CPUs and exit. Again.
>=20
> Clearly, that's an extreme, but still...

We do have some issues with that, it does tend to be very self-limiting
though, short lived tasks that can drive lots of exits won't get to run
on a lot of cores.

It's worth keeping an eye on, it may not be too hard to mitigate the IPIs
doing something dumb like collecting a queue of mms before killing a
batch of them.

Thanks,
Nick
