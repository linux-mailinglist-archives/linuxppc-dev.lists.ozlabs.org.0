Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECDD22B090
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 15:34:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCCwW3nQhzDr3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 23:34:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nJOThBN3; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCCrC50WrzDqW5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 23:30:19 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id u185so3033875pfu.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Td5n8VLQM5VzC3/ySr0x0FkE92YfVlucA4U3oDMBrpc=;
 b=nJOThBN3e0u2wPmuKSDicZ+MnhpMP1D4iUV1NevDGUNLVV/pnTf9+zsjxy0Qbbio20
 0MiiX36MZ0ZC4E71DLYgt/cADBAmI3H4MzayuAZG7DzEI7kaA9e9QwPC8lL1JqZQP+NL
 9MGVBFha1s2QXAWnx1C1AGhlwjqS8hcx22i1c5WfIxY0DFbIb6mc4Y32KjmVk6PiLbeG
 GoPigoJt0ecu9QSJzK2R1EDHjtsTbmfloVX4mn/0GnuomG5yEie0b35EjQ2/6Q5Wp5I4
 n22LyNjNL9sMD5ZFQyhsBEiiaJmT4JxbN546p048mlxo3r6w7CQPF4aegWwn/eZpecgd
 nubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Td5n8VLQM5VzC3/ySr0x0FkE92YfVlucA4U3oDMBrpc=;
 b=iNlvSsezMpDbzy/8Z+KBep9NWfCBHx5/QZDEO5p0NQT2ECO10EL0W2bghbEnvvKPGI
 O+NmsuTKZqfwY9vJPUPrid6FxGEDjdBnrrSIr31Th6X4pzDRBWlz5qLRDkFevEW7VpYp
 31FdVUlwd0go5k36qfLyXicyhCe33YwCbCSftmppHvOUcVKtPa9R5Y/JFmLCRS8KYI/l
 R0iJ1UW4Heu/e+jcBW9gprxxU1zFERB75Cb6td8oMqavdfPcitqRHWL7Is1zMABAB7Xh
 DsLt2Lncqbv+ViK5d8EDEMrujuw6ORUi9/EOXLvcxpohMtNnewibveIFFCAhtSkWACqz
 mY2A==
X-Gm-Message-State: AOAM5311fok3B6RZOA7z+/rxuSHa6T+qF92Ob21iEdJmiA03pFO9KBx7
 bqtk4uPaMs8BrYjE1c4HLLI=
X-Google-Smtp-Source: ABdhPJzDRciPPyx06p/TELG6ZbrzJ5oreW4i8vpZMSYQR38q69s9sCgkLuLjxZA90YTp1MLQk8mQMQ==
X-Received: by 2002:a65:644d:: with SMTP id s13mr4226469pgv.103.1595511015960; 
 Thu, 23 Jul 2020 06:30:15 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id u26sm3148320pfn.54.2020.07.23.06.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 06:30:15 -0700 (PDT)
Date: Thu, 23 Jul 2020 23:30:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: Waiman Long <longman@redhat.com>, Peter Zijlstra <peterz@infradead.org>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <20200708084106.GE597537@hirez.programming.kicks-ass.net>
 <1595327263.lk78cqolxm.astroid@bobo.none>
 <eaabf501-80fe-dd15-c03c-f75ce4f75877@redhat.com>
In-Reply-To: <eaabf501-80fe-dd15-c03c-f75ce4f75877@redhat.com>
MIME-Version: 1.0
Message-Id: <1595510571.u39qfc8d1o.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Waiman Long's message of July 22, 2020 12:36 am:
> On 7/21/20 7:08 AM, Nicholas Piggin wrote:
>> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include=
/asm/qspinlock.h
>> index b752d34517b3..26d8766a1106 100644
>> --- a/arch/powerpc/include/asm/qspinlock.h
>> +++ b/arch/powerpc/include/asm/qspinlock.h
>> @@ -31,16 +31,57 @@ static inline void queued_spin_unlock(struct qspinlo=
ck *lock)
>>  =20
>>   #else
>>   extern void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)=
;
>> +extern void queued_spin_lock_slowpath_queue(struct qspinlock *lock);
>>   #endif
>>  =20
>>   static __always_inline void queued_spin_lock(struct qspinlock *lock)
>>   {
>> -	u32 val =3D 0;
>> -
>> -	if (likely(atomic_try_cmpxchg_lock(&lock->val, &val, _Q_LOCKED_VAL)))
>> +	atomic_t *a =3D &lock->val;
>> +	u32 val;
>> +
>> +again:
>> +	asm volatile(
>> +"1:\t"	PPC_LWARX(%0,0,%1,1) "	# queued_spin_lock			\n"
>> +	: "=3D&r" (val)
>> +	: "r" (&a->counter)
>> +	: "memory");
>> +
>> +	if (likely(val =3D=3D 0)) {
>> +		asm_volatile_goto(
>> +	"	stwcx.	%0,0,%1							\n"
>> +	"	bne-	%l[again]						\n"
>> +	"\t"	PPC_ACQUIRE_BARRIER "						\n"
>> +		:
>> +		: "r"(_Q_LOCKED_VAL), "r" (&a->counter)
>> +		: "cr0", "memory"
>> +		: again );
>>   		return;
>> -
>> -	queued_spin_lock_slowpath(lock, val);
>> +	}
>> +
>> +	if (likely(val =3D=3D _Q_LOCKED_VAL)) {
>> +		asm_volatile_goto(
>> +	"	stwcx.	%0,0,%1							\n"
>> +	"	bne-	%l[again]						\n"
>> +		:
>> +		: "r"(_Q_LOCKED_VAL | _Q_PENDING_VAL), "r" (&a->counter)
>> +		: "cr0", "memory"
>> +		: again );
>> +
>> +		atomic_cond_read_acquire(a, !(VAL & _Q_LOCKED_MASK));
>> +//		clear_pending_set_locked(lock);
>> +		WRITE_ONCE(lock->locked_pending, _Q_LOCKED_VAL);
>> +//		lockevent_inc(lock_pending);
>> +		return;
>> +	}
>> +
>> +	if (val =3D=3D _Q_PENDING_VAL) {
>> +		int cnt =3D _Q_PENDING_LOOPS;
>> +		val =3D atomic_cond_read_relaxed(a,
>> +					       (VAL !=3D _Q_PENDING_VAL) || !cnt--);
>> +		if (!(val & ~_Q_LOCKED_MASK))
>> +			goto again;
>> +        }
>> +	queued_spin_lock_slowpath_queue(lock);
>>   }
>>   #define queued_spin_lock queued_spin_lock
>>  =20
>=20
> I am fine with the arch code override some part of the generic code.

Cool.

>> diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
>> index b9515fcc9b29..ebcc6f5d99d5 100644
>> --- a/kernel/locking/qspinlock.c
>> +++ b/kernel/locking/qspinlock.c
>> @@ -287,10 +287,14 @@ static __always_inline u32  __pv_wait_head_or_lock=
(struct qspinlock *lock,
>>  =20
>>   #ifdef CONFIG_PARAVIRT_SPINLOCKS
>>   #define queued_spin_lock_slowpath	native_queued_spin_lock_slowpath
>> +#define queued_spin_lock_slowpath_queue	native_queued_spin_lock_slowpat=
h_queue
>>   #endif
>>  =20
>>   #endif /* _GEN_PV_LOCK_SLOWPATH */
>>  =20
>> +void queued_spin_lock_slowpath_queue(struct qspinlock *lock);
>> +static void __queued_spin_lock_slowpath_queue(struct qspinlock *lock);
>> +
>>   /**
>>    * queued_spin_lock_slowpath - acquire the queued spinlock
>>    * @lock: Pointer to queued spinlock structure
>> @@ -314,12 +318,6 @@ static __always_inline u32  __pv_wait_head_or_lock(=
struct qspinlock *lock,
>>    */
>>   void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
>>   {
>> -	struct mcs_spinlock *prev, *next, *node;
>> -	u32 old, tail;
>> -	int idx;
>> -
>> -	BUILD_BUG_ON(CONFIG_NR_CPUS >=3D (1U << _Q_TAIL_CPU_BITS));
>> -
>>   	if (pv_enabled())
>>   		goto pv_queue;
>>  =20
>> @@ -397,6 +395,26 @@ void queued_spin_lock_slowpath(struct qspinlock *lo=
ck, u32 val)
>>   queue:
>>   	lockevent_inc(lock_slowpath);
>>   pv_queue:
>> +	__queued_spin_lock_slowpath_queue(lock);
>> +}
>> +EXPORT_SYMBOL(queued_spin_lock_slowpath);
>> +
>> +void queued_spin_lock_slowpath_queue(struct qspinlock *lock)
>> +{
>> +	lockevent_inc(lock_slowpath);
>> +	__queued_spin_lock_slowpath_queue(lock);
>> +}
>> +EXPORT_SYMBOL(queued_spin_lock_slowpath_queue);
>> +
>> +static void __queued_spin_lock_slowpath_queue(struct qspinlock *lock)
>> +{
>> +	struct mcs_spinlock *prev, *next, *node;
>> +	u32 old, tail;
>> +	u32 val;
>> +	int idx;
>> +
>> +	BUILD_BUG_ON(CONFIG_NR_CPUS >=3D (1U << _Q_TAIL_CPU_BITS));
>> +
>>   	node =3D this_cpu_ptr(&qnodes[0].mcs);
>>   	idx =3D node->count++;
>>   	tail =3D encode_tail(smp_processor_id(), idx);
>> @@ -559,7 +577,6 @@ void queued_spin_lock_slowpath(struct qspinlock *loc=
k, u32 val)
>>   	 */
>>   	__this_cpu_dec(qnodes[0].mcs.count);
>>   }
>> -EXPORT_SYMBOL(queued_spin_lock_slowpath);
>>  =20
>>   /*
>>    * Generate the paravirt code for queued_spin_unlock_slowpath().
>>
> I would prefer to extract out the pending bit handling code out into a=20
> separate helper function which can be overridden by the arch code=20
> instead of breaking the slowpath into 2 pieces.

You mean have the arch provide a queued_spin_lock_slowpath_pending=20
function that the slow path calls?

I would actually prefer the pending handling can be made inline in
the queued_spin_lock function, especially with out-of-line locks it=20
makes sense to put it there.

We could ifdef out queued_spin_lock_slowpath_queue if it's not used,
then __queued_spin_lock_slowpath_queue would be inlined into the
caller so there would be no split?

Thanks,
Nick
