Return-Path: <linuxppc-dev+bounces-13324-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6114C0C754
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 09:54:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw6l56JZjz306S;
	Mon, 27 Oct 2025 19:54:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761555281;
	cv=none; b=LENT0Ndaysqj3NnCIuU1uziNvABsFaRjcXhdBZQ7qIUWkMoxDAEk6CqhkLQAspdYLrrFVA70QJITBzw7amNJsrLFgAMWxSjnuKLQ/klUpGy5S46GBDq4jPjYO2Vxz/wh0w6pb/o9VSGV5Iv2jKWUw2hJbHuPx1ESLmY5LwL3e3RT6EubRVx06isEo3eRCcnRk+r9c/6IcYaJskQBc3TL96sbglha+ChrBfbhbCOWFZb1ra0HcN7sLTvrtKDAkzpS7Nm4f7/qa9gddbe3i94pYSQS6JQYkSw5rAok+6YYl7M14XcT6A93NBT7j5FKqkGRR8P21dpA/vd/QYGCFUNaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761555281; c=relaxed/relaxed;
	bh=wADVRJvytaaWYRB+ePAV85hnF5m9541y74Pe50E1fZI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jiocwq9rLAJK5n2HxS6GEOMIBJ1OwHG/TDGwZJ/1lFtB5TtwjWD43EJDIQNBJO+Y/jyKoAyoE01B3yTqTDHzul2EFzikNbrBpGLtjXvU6SwswuVyIke4zHH0v6UOk9TjKnnZdnNRswVZjbvw2QyORW9LK5oJoiQizzSAFidlPrGMOmhEf7SxqcpNrTyykstuHTwo6Xanprt9DhDKPHaEwQlukuWxv48rBsPVCAozrrk4TvoBFofny8hddx0IUBV5LfTBtyCufHNlXnY9mUrKXFgMRl0rhXwwr0NUdIbpKg+DGHYAvgGtdqyXc+A3N61bNJWu9ot+4puC6K43OC/69w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YsmeIQP8; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oSFIPMt9; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YsmeIQP8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oSFIPMt9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw6l5109Jz2yjs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:54:41 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761555278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wADVRJvytaaWYRB+ePAV85hnF5m9541y74Pe50E1fZI=;
	b=YsmeIQP8S5/E25k3rwutuq+qQsolOVlhOTHUnDexDGFCkFrHdxhoqTT3j4HSbjWO/eh3bh
	ws51Q5qDygFbUuo9tkbjwBPSyDMCe7ZduKzOsVawUkjTHIVQ0SGfBb0WK+GaAGv/Q3j5rH
	QbE7eR6KkenDzVeTCiEc9aiVvHER+zUJJ9sZz/hpZweEJ9/q6Ud0ZpQ0F9lNcMEtRosSQc
	nsP6h/NOsI6hq2iYLLdgDgO/MPXa8gIwYj2RiIjZVLQepB2mgtUrjeggM4hqUj9K+Zw2ER
	1/zXoGSDqOvFmIBy0/WHQck8aQpTlOXvnIp3D4ruoF6dMeLf4TQpJTGPwpOv9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761555278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wADVRJvytaaWYRB+ePAV85hnF5m9541y74Pe50E1fZI=;
	b=oSFIPMt9Z1bsEXRk4Vnk69ZGkKjQvDEd3BNgP5hBFPT/ptpcHdW4WkGr7AjAEYIF46zjmZ
	p6nXBMQn7vCpeiDA==
To: Shrikanth Hegde <sshegde@linux.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Gabriele Monaco
 <gmonaco@redhat.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Michael Jeanson <mjeanson@efficios.com>, Jens Axboe <axboe@kernel.dk>,
 "Paul E. McKenney" <paulmck@kernel.org>, "Gautham R. Shenoy"
 <gautham.shenoy@amd.com>, Florian Weimer <fweimer@redhat.com>, Tim Chen
 <tim.c.chen@intel.com>, Yury Norov <yury.norov@gmail.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>
Subject: Re: [patch V2 16/20] sched/mmcid: Provide new scheduler CID mechanism
In-Reply-To: <9076c353-a22b-4c38-bd30-fb10eb0ae851@linux.ibm.com>
References: <20251022104005.907410538@linutronix.de>
 <20251022110556.399477196@linutronix.de>
 <9076c353-a22b-4c38-bd30-fb10eb0ae851@linux.ibm.com>
Date: Mon, 27 Oct 2025 09:54:36 +0100
Message-ID: <87ldkwwwqb.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 27 2025 at 10:41, Shrikanth Hegde wrote:
> On 10/22/25 6:25 PM, Thomas Gleixner wrote:
>> The MM CID management has two fundamental requirements:
>>=20
>>    1) It has to guarantee that at no given point in time the same CID is
>>       used by concurrent tasks in userspace.
>>=20
>>    2) The CID space must not exceed the number of possible CPUs in a
>>       system. While most allocators (glibc, tcmalloc, jemalloc) do not
>>       care about that, there seems to be at least some LTTng library
>>       depending on it.
>>=20
>> The CID space compaction itself is not a functional correctness
>> requirement, it is only a useful optimization mechanism to reduce the
>> memory foot print in unused user space pools.
>>=20
>
> Just wondering, if there is no user space request for CID, this whole mec=
hanism
> should be under a static check to avoid any overhead?

The problem is that CID has been introduced unconditionally with RSEQ
and there is no mechanism to opt-in. So we could go and change the ABI,
but as you know that's generally frowned upon.

I thought about adding a static key, but that'd be systemwide and
would probably required to be opt-out for the same reason.

>> +static inline unsigned int mm_get_cid(struct mm_struct *mm)
>> +{
>> +	unsigned int cid =3D __mm_get_cid(mm, READ_ONCE(mm->mm_cid.max_cids));
>> +
>> +	for (; cid =3D=3D MM_CID_UNSET; cpu_relax())
>
> This triggers an compile error on ppc64le.
>
> In file included from ./include/vdso/processor.h:10,
>                   from ./arch/powerpc/include/asm/processor.h:9,
>                   from ./include/linux/sched.h:13,
>                   from ./include/linux/sched/affinity.h:1,
>                   from kernel/sched/sched.h:8,
>                   from kernel/sched/rq-offsets.c:5:
> kernel/sched/sched.h: In function =E2=80=98mm_get_cid=E2=80=99:
> ./arch/powerpc/include/asm/vdso/processor.h:26:9: error: expected express=
ion before =E2=80=98asm=E2=80=99
>     26 |         asm volatile(ASM_FTR_IFCLR(                             =
        \
>        |         ^~~
> kernel/sched/sched.h:3615:37: note: in expansion of macro =E2=80=98cpu_re=
lax=E2=80=99
>   3615 |         for (; cid =3D=3D MM_CID_UNSET; cpu_relax())
>

Duh. Did not notice because x86 implements cpu_relax() as a static
inline while PPC has it as a plain macro define. Let me move it out of
the for() then.

Thanks,

        tglx


