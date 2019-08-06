Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C793683135
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 14:16:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462tsv6CD6zDqys
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 22:16:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462tqC0JFRzDqpR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 22:14:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 462tqB2TZwz9sN1; Tue,  6 Aug 2019 22:14:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 462tqB0cfzz9sDB;
 Tue,  6 Aug 2019 22:14:30 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christopher M Riedl <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v2 3/3] powerpc/spinlocks: Fix oops in shared-processor
 spinlocks
In-Reply-To: <850780620.61430.1564758724962@privateemail.com>
References: <20190802042233.20835-1-cmr@informatik.wtf>
 <20190802042233.20835-4-cmr@informatik.wtf>
 <877e7vlruk.fsf@concordia.ellerman.id.au>
 <850780620.61430.1564758724962@privateemail.com>
Date: Tue, 06 Aug 2019 22:14:27 +1000
Message-ID: <87r25yv6cc.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ajd@linux.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christopher M Riedl <cmr@informatik.wtf> writes:
>> On August 2, 2019 at 6:38 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> "Christopher M. Riedl" <cmr@informatik.wtf> writes:
>> > diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
>> > index 0a8270183770..6aed8a83b180 100644
>> > --- a/arch/powerpc/include/asm/spinlock.h
>> > +++ b/arch/powerpc/include/asm/spinlock.h
>> > @@ -124,6 +122,22 @@ static inline bool is_shared_processor(void)
>> >  #endif
>> >  }
>> >  
>> > +static inline void spin_yield(arch_spinlock_t *lock)
>> > +{
>> > +	if (is_shared_processor())
>> > +		splpar_spin_yield(lock);
>> > +	else
>> > +		barrier();
>> > +}
>> ...
>> >  static inline void arch_spin_lock(arch_spinlock_t *lock)
>> >  {
>> >  	while (1) {
>> > @@ -132,7 +146,7 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
>> >  		do {
>> >  			HMT_low();
>> >  			if (is_shared_processor())
>> > -				__spin_yield(lock);
>> > +				spin_yield(lock);
>> 
>> This leaves us with a double test of is_shared_processor() doesn't it?
>
> Yep, and that's no good. Hmm, executing the barrier() in the non-shared-processor
> case probably hurts performance here?

It's only a "compiler barrier", so it shouldn't generate any code.

But it does have the effect of telling the compiler it can't optimise
across that barrier, which can be important.

In those spin loops all we're doing is checking lock->slock which is
already marked volatile in the definition of arch_spinlock_t, so the
extra barrier shouldn't really make any difference.

But still the current code doesn't have a barrier() there, so we should
make sure we don't introduce one as part of this refactor.

So I think you just want to change the call to spin_yield() above to
splpar_spin_yield(), which avoids the double check, and also avoids the
barrier() in the SPLPAR=n case.

And then arch_spin_relax() calls spin_yield() etc.

cheers
