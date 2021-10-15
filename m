Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FEB42E67D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 04:23:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVqny0XT3z2yY7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 13:23:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZHoEbIOM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZHoEbIOM; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVqnG008Fz2xXy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 13:23:12 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 66so7218140pgc.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 19:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=3M9O7XSoph4svAH5nZJ04xH/DP3a3sIU5ihXxGXcasc=;
 b=ZHoEbIOM2bEgMVGUhbJNjUZ4YyZUu6Pgt80iFL6xmp3QDTrCxz27ls16kQ8qhlA45j
 l/e3vYKK6iLLoz246LoePo9U9SLtgtMqW70HTuQV37COmDhfGk3CHLp15tzK/koSJFIF
 tBdf9bj3Qmqb/zV9crdL/9tLrlZKrDouDRgr9Y6ooCd0B6Tmzmo/C9R6wNJKVGcVLs7n
 fCcE0gXpiagWOJU3O0lz6w7aTdkw5VPxXtlfWVaGH/QYDq7pr4/TKzi4TIDjd+Z7FzYB
 uFrzFJdnVQTg15ddft0Dq+DkAK579EUHM9Fl6Ws1m2RVzSGd6m6Gf/9hTx1n+qYWt8Go
 Bncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=3M9O7XSoph4svAH5nZJ04xH/DP3a3sIU5ihXxGXcasc=;
 b=PH6+0EbVkd/g+HgyO+DqmTaoaYHbdNRPjHmzXbKRxSRpcP2fHyC6INONZcVu4lH3YN
 BAWyuw0Z+NoeVV9HV/zLtq9AlLTeYcRBwV543dQEUoNlQJ2r7Tl4Spy2C1BnuXueg24a
 v7JcHS/OXSLk586LvS4yacMne9iv2B7CqrYzcrrN7uBbliV9fOlh0eiPNJWKr3ho+s8/
 3wy9JXM/yfepAuz9Uc2vfOObIUrBUB7579YBsyw+/T/bCxIXDR3xBJk1lahY07rs4xZD
 WFrDd+DQ9h4ny9gyf0BCPivCcHxmoFsQW1q2GUbYGGwhrFXdrFp7aiwnBFMK3pMjPxDv
 DyWA==
X-Gm-Message-State: AOAM533xfSVop+BP3LNnnbQ12OvPi0tSowHN5oS2J6Pq4A4XEtkT/6gD
 iWAm4V2ccyoT9/pPyJfl0F4=
X-Google-Smtp-Source: ABdhPJxOlWOOgYYmyYuVxUvgD8RqatJ6qu59HWcI+qiH2UryvxaZcqbC9wQO6rsGR9v+SIc92Y5Yhw==
X-Received: by 2002:a05:6a00:856:b0:44c:f184:9320 with SMTP id
 q22-20020a056a00085600b0044cf1849320mr8671829pfk.81.1634264589786; 
 Thu, 14 Oct 2021 19:23:09 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 oc8sm3843637pjb.15.2021.10.14.19.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 19:23:09 -0700 (PDT)
Date: Fri, 15 Oct 2021 12:23:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] KVM: PPC: Defer vtime accounting 'til after IRQ
 handling
To: kvm-ppc@vger.kernel.org, Laurent Vivier <lvivier@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20211007142856.41205-1-lvivier@redhat.com>
 <875yu17rxk.fsf@mpe.ellerman.id.au>
 <d7f59d0e-eac2-7978-4067-9258c8b1aefe@redhat.com>
In-Reply-To: <d7f59d0e-eac2-7978-4067-9258c8b1aefe@redhat.com>
MIME-Version: 1.0
Message-Id: <1634263564.zfj0ajf8eh.astroid@bobo.none>
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
Cc: Greg Kurz <groug@kaod.org>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Laurent Vivier's message of October 13, 2021 7:30 pm:
> On 13/10/2021 01:18, Michael Ellerman wrote:
>> Laurent Vivier <lvivier@redhat.com> writes:
>>> Commit 112665286d08 moved guest_exit() in the interrupt protected
>>> area to avoid wrong context warning (or worse), but the tick counter
>>> cannot be updated and the guest time is accounted to the system time.
>>>
>>> To fix the problem port to POWER the x86 fix
>>> 160457140187 ("Defer vtime accounting 'til after IRQ handling"):
>>>
>>> "Defer the call to account guest time until after servicing any IRQ(s)
>>>   that happened in the guest or immediately after VM-Exit.  Tick-based
>>>   accounting of vCPU time relies on PF_VCPU being set when the tick IRQ
>>>   handler runs, and IRQs are blocked throughout the main sequence of
>>>   vcpu_enter_guest(), including the call into vendor code to actually
>>>   enter and exit the guest."
>>>
>>> Fixes: 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest =
context before enabling irqs")
>>> Cc: npiggin@gmail.com
>>> Cc: <stable@vger.kernel.org> # 5.12
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> ---
>>>
>>> Notes:
>>>      v2: remove reference to commit 61bd0f66ff92
>>>          cc stable 5.12
>>>          add the same comment in the code as for x86
>>>
>>>   arch/powerpc/kvm/book3s_hv.c | 24 ++++++++++++++++++++----
>>>   1 file changed, 20 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.=
c
>>> index 2acb1c96cfaf..a694d1a8f6ce 100644
>>> --- a/arch/powerpc/kvm/book3s_hv.c
>>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> ...
>>> @@ -4506,13 +4514,21 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu=
, u64 time_limit,
>>>  =20
>>>   	srcu_read_unlock(&kvm->srcu, srcu_idx);
>>>  =20
>>> +	context_tracking_guest_exit();
>>> +
>>>   	set_irq_happened(trap);
>>>  =20
>>>   	kvmppc_set_host_core(pcpu);
>>>  =20
>>> -	guest_exit_irqoff();
>>> -
>>>   	local_irq_enable();
>>> +	/*
>>> +	 * Wait until after servicing IRQs to account guest time so that any
>>> +	 * ticks that occurred while running the guest are properly accounted
>>> +	 * to the guest.  Waiting until IRQs are enabled degrades the accurac=
y
>>> +	 * of accounting via context tracking, but the loss of accuracy is
>>> +	 * acceptable for all known use cases.
>>> +	 */
>>> +	vtime_account_guest_exit();
>>=20
>> This pops a warning for me, running guest(s) on Power8:
>>  =20
>>    [  270.745303][T16661] ------------[ cut here ]------------
>>    [  270.745374][T16661] WARNING: CPU: 72 PID: 16661 at arch/powerpc/ke=
rnel/time.c:311 vtime_account_kernel+0xe0/0xf0
>=20
> Thank you, I missed that...
>=20
> My patch is wrong, I have to add vtime_account_guest_exit() before the lo=
cal_irq_enable().

I thought so because if we take an interrupt after exiting the guest that=20
should be accounted to kernel not guest.

>=20
> arch/powerpc/kernel/time.c
>=20
>   305 static unsigned long vtime_delta(struct cpu_accounting_data *acct,
>   306                                  unsigned long *stime_scaled,
>   307                                  unsigned long *steal_time)
>   308 {
>   309         unsigned long now, stime;
>   310
>   311         WARN_ON_ONCE(!irqs_disabled());
> ...
>=20
> But I don't understand how ticks can be accounted now if irqs are still d=
isabled.
>=20
> Not sure it is as simple as expected...

I don't know all the timer stuff too well. The=20
!CONFIG_VIRT_CPU_ACCOUNTING case is relying on PF_VCPU to be set when=20
the host timer interrupt runs irqtime_account_process_tick runs so it
can accumulate that tick to the guest?

That probably makes sense then, but it seems like we need that in a
different place. Timer interrupts are not guaranteed to be the first one
to occur when interrupts are enabled.

Maybe a new tick_account_guest_exit() and move PF_VCPU clearing to that
for tick based accounting. Call it after local_irq_enable and call the
vtime accounting before it. Would that work?

Thanks,
Nick
