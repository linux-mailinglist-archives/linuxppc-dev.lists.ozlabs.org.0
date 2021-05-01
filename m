Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 363263704AA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 03:22:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXBLW1mR0z30C1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 11:22:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=slyeCUmu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=slyeCUmu; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXBL45H0fz2yRW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 11:22:18 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so2642440pjj.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=tp9K+hqYN18rShJQLsPbl0DiqxEWjraxPwl8IaW3wOM=;
 b=slyeCUmuPT60u0rrowTXYzSA64fLkBRZWJxi/BRgOWmRzkruFLkM57or3Fs/SriEm+
 w9gBiJG5s5lEjIZKeuH6ZGb5O8/ciWC6ISQfCvC/neo7wjfH1qd+2xtpWBQ6l632xVig
 uOPLgwSuQVaXqWXWKT7CzyNVubwKwsiBusLvB2mG5oyQT7ndqGQ87yuCEzggOqvx2wPM
 Ph9SIG8cfKS6m4MHVi0A3pLqRRwApF54dkclDrbza1mjbEHUwDfze0ogYGS1c6kJaJH7
 AU+wocsXcuwI/nBT7XtsqMtj2T/ylbtrmEm2+7Q0pFhnfL6/paw54B1LBzlSW6vni4uI
 bJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=tp9K+hqYN18rShJQLsPbl0DiqxEWjraxPwl8IaW3wOM=;
 b=II4bw5xgwfi3KHOG5dUMfX811ZBb5CjQm6r5RbdwGM1HEueWumVpagbryuML17TIIH
 OvwBOBNWq2lLPra4xwOY3pnZVDlE+HkADu5caB8aCpcaifrICEYphkCO8dcz1XwT6xvf
 sgG4T9Ugr9vNIG+PY3wTOBTLpAeET+jSTol2d5Ud7Ir7ZjvOqsnpV0MqXf6teIDK9t37
 GATAhfor3oIzn0uZExFn8B8/oIV1XxJGhRsoV9Lg2HwBRjQIWsk/+Wmt/8TefWNfcExS
 Nh+J91ZKRIXDKyZrUQ2Q4lV1+h2i0WF8OruIIGfKnSbHecrMC6zS5OGIhnqz4xKaItL9
 wtbw==
X-Gm-Message-State: AOAM532FqDSuLPOFQ307NOIGEsC2UmMu9fw/g/61zw/A9W5O2IgBCLK3
 L5Isc7Xmjx07EDnY4wl/YRZsy9L7Alamsw==
X-Google-Smtp-Source: ABdhPJx4AArEoDCcO3UCPFYdW9BQVz6sL4JW+DMfYtby1d3i18cUoGpogFWlw+DTSii5drlzprwgrg==
X-Received: by 2002:a17:902:6b8c:b029:ea:f54f:c330 with SMTP id
 p12-20020a1709026b8cb02900eaf54fc330mr8011353plk.10.1619832132814; 
 Fri, 30 Apr 2021 18:22:12 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id 31sm4130296pgw.3.2021.04.30.18.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 18:22:12 -0700 (PDT)
Date: Sat, 01 May 2021 11:22:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/4] powerpc/pseries: Fix hcall tracing recursion in pv
 queued spinlocks
To: linuxppc-dev@lists.ozlabs.org, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>
References: <20210423031108.1046067-1-npiggin@gmail.com>
 <20210423031108.1046067-2-npiggin@gmail.com>
 <1619529780.yjjzv9cw5m.naveen@linux.ibm.com>
In-Reply-To: <1619529780.yjjzv9cw5m.naveen@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1619832010.xbqdcxufia.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Naveen N. Rao's message of April 27, 2021 11:43 pm:
> Nicholas Piggin wrote:
>> The paravit queued spinlock slow path adds itself to the queue then
>> calls pv_wait to wait for the lock to become free. This is implemented
>> by calling H_CONFER to donate cycles.
>>=20
>> When hcall tracing is enabled, this H_CONFER call can lead to a spin
>> lock being taken in the tracing code, which will result in the lock to
>> be taken again, which will also go to the slow path because it queues
>> behind itself and so won't ever make progress.
>>=20
>> An example trace of a deadlock:
>>=20
>>   __pv_queued_spin_lock_slowpath
>>   trace_clock_global
>>   ring_buffer_lock_reserve
>>   trace_event_buffer_lock_reserve
>>   trace_event_buffer_reserve
>>   trace_event_raw_event_hcall_exit
>>   __trace_hcall_exit
>>   plpar_hcall_norets_trace
>>   __pv_queued_spin_lock_slowpath
>>   trace_clock_global
>>   ring_buffer_lock_reserve
>>   trace_event_buffer_lock_reserve
>>   trace_event_buffer_reserve
>>   trace_event_raw_event_rcu_dyntick
>>   rcu_irq_exit
>>   irq_exit
>>   __do_irq
>>   call_do_irq
>>   do_IRQ
>>   hardware_interrupt_common_virt
>>=20
>> Fix this by introducing plpar_hcall_norets_notrace(), and using that to
>> make SPLPAR virtual processor dispatching hcalls by the paravirt
>> spinlock code.
>>=20
>> Fixes: 20c0e8269e9d ("powerpc/pseries: Implement paravirt qspinlocks for=
 SPLPAR")
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/hvcall.h       |  3 +++
>>  arch/powerpc/include/asm/paravirt.h     | 22 +++++++++++++++++++---
>>  arch/powerpc/platforms/pseries/hvCall.S | 10 ++++++++++
>>  arch/powerpc/platforms/pseries/lpar.c   |  4 ++--
>>  4 files changed, 34 insertions(+), 5 deletions(-)
>=20
> Thanks for the fix! Some very minor nits below, but none the less:
> Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>=20
>>=20
>> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/as=
m/hvcall.h
>> index ed6086d57b22..0c92b01a3c3c 100644
>> --- a/arch/powerpc/include/asm/hvcall.h
>> +++ b/arch/powerpc/include/asm/hvcall.h
>> @@ -446,6 +446,9 @@
>>   */
>>  long plpar_hcall_norets(unsigned long opcode, ...);
>>=20
>> +/* Variant which does not do hcall tracing */
>> +long plpar_hcall_norets_notrace(unsigned long opcode, ...);
>> +
>>  /**
>>   * plpar_hcall: - Make a pseries hypervisor call
>>   * @opcode: The hypervisor call to make.
>> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/=
asm/paravirt.h
>> index 5d1726bb28e7..3c13c2ec70a9 100644
>> --- a/arch/powerpc/include/asm/paravirt.h
>> +++ b/arch/powerpc/include/asm/paravirt.h
>> @@ -30,17 +30,33 @@ static inline u32 yield_count_of(int cpu)
>>=20
>>  static inline void yield_to_preempted(int cpu, u32 yield_count)
>>  {
>=20
> It looks like yield_to_preempted() is only used by simple spin locks=20
> today. I wonder if it makes more sense to put the below comment in=20
> yield_to_any() which is used by the qspinlock code.

Yeah, I just put it above the functions entirely because it refers to=20
all of them.

>=20
>> -	plpar_hcall_norets(H_CONFER, get_hard_smp_processor_id(cpu), yield_cou=
nt);
>> +	/*
>> +	 * Spinlock code yields and prods, so don't trace the hcalls because
>> +	 * tracing code takes spinlocks which could recurse.
>> +	 *
>> +	 * These calls are made while the lock is not held, the lock slowpath
>> +	 * yields if it can not acquire the lock, and unlock slow path might
>> +	 * prod if a waiter has yielded). So this did not seem to be a problem
>> +	 * for simple spin locks because technically it didn't recuse on the
> 							       ^^^^^^
> 							       recurse
>=20
>> +	 * lock. However the queued spin lock contended path is more strictly
>> +	 * ordered: the H_CONFER hcall is made after the task has queued itsel=
f
>> +	 * on the lock, so then recursing on the lock will queue up behind tha=
t
>> +	 * (or worse: queued spinlocks uses tricks that assume a context never
>> +	 * waits on more than one spinlock, so that may cause random
>> +	 * corruption).
>> +	 */
>> +	plpar_hcall_norets_notrace(H_CONFER,
>> +				   get_hard_smp_processor_id(cpu), yield_count);
>=20
> This can all be on a single line.

Should it though? Linux in general allegedly changed to 100 column=20
lines for checkpatch, but it seems to still be frowned upon to go
beyond 80 deliberately. What about arch/powerpc?

Thanks,
Nick
