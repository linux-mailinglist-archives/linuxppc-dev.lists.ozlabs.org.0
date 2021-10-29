Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F4443F3FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 02:36:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgNlk1srqz3bnP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 11:36:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iIYU/DIx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iIYU/DIx; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgNl14WXhz2ywf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 11:35:56 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so9246216pji.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 17:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=E4pGtECdhwt8OtT2ngqN26PWhFeuiws8t3kYQYNcqJ0=;
 b=iIYU/DIxptGc5/pseofBUrAkvt9GDbEh23gs9KsEwm8k0cQ6A+PbHw2Jrjyy7u2c1j
 z9ObztzNbIHQB9bPMVhO3Sn24rBJEt+np3JaQ1hXlauyOIl13xfVVWMa6s4ZCIL6v9WW
 dYpRiTrC3ZmhR1CO+XLqX1LJjZs6l9hfLM3l1U1t8DQxrw0r1AUcdyl/Gi4rBSjCRWvA
 mp6GNCWKpCKGgUzlcL45N7VDf6WYp4PdvMcD4ZRLQ4SZz2b0Zmsy21YHISndPKA0CoBW
 qdgRgEOG66a5llPd5/ZePuME7BRjHVHLR/NKz9XvJYGwqjDEdS4qrO2PGzrXk4VccDMb
 wAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=E4pGtECdhwt8OtT2ngqN26PWhFeuiws8t3kYQYNcqJ0=;
 b=6NnSpgC6EgJb9H7zT3lPcQKCnzvkQ8meRGrbRPXfyNXKG69DarFlQAJqlmGk3cEdXd
 VdBb9Q/Mht7HfmIqQ9p2NTEe6ilQA1mr3rwVmp5oqsX2WtD7ZtSskkUfC81WPk0yGFLt
 OBRu7pqOrM3186nqy923ip4aJHVtVZN2zrMlQzaEgGCFyAZevNtjB2NT0NY9XLk7Y/Pw
 3GgYla5OLme+K5K22fMLFwwg3N/k215tnx6IkwCFo5wWUTqR2yw4Vk63RUG+DMcjfD9p
 EdZ2zSqKgtxSizvdImQse+tf3rWz3auOKp3oo43nzjLidarVBaLjCSwbThUdjeoh+Trt
 KVnQ==
X-Gm-Message-State: AOAM530s3AcBMg/eqYFSVnB6x3bW/do6299ExAPdeTlT0USPqmikW65S
 tEa7RTzyFKOs6sz50VhCCdgiUToBXZ4=
X-Google-Smtp-Source: ABdhPJzhM9pPrymQRAwuzTvuFultc21B0+v8z3K8T9mud89lprYQp4NnRsvDWMV60HSJGm2pWOFvxQ==
X-Received: by 2002:a17:90b:789:: with SMTP id
 l9mr16397192pjz.19.1635467753497; 
 Thu, 28 Oct 2021 17:35:53 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id m10sm8775953pjs.21.2021.10.28.17.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 17:35:52 -0700 (PDT)
Date: Fri, 29 Oct 2021 10:35:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3] KVM: PPC: Tick accounting should defer vtime
 accounting 'til after IRQ handling
To: linuxppc-dev@lists.ozlabs.org, Laurent Vivier <lvivier@redhat.com>
References: <20211027142150.3711582-1-npiggin@gmail.com>
 <3d621619-e6b2-9388-06dd-0ea4cc805ed7@redhat.com>
In-Reply-To: <3d621619-e6b2-9388-06dd-0ea4cc805ed7@redhat.com>
MIME-Version: 1.0
Message-Id: <1635467173.n25qd43d5m.astroid@bobo.none>
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
Cc: stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Laurent Vivier's message of October 28, 2021 10:48 pm:
> On 27/10/2021 16:21, Nicholas Piggin wrote:
>> From: Laurent Vivier <lvivier@redhat.com>
>>=20
>> Commit 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest
>> context before enabling irqs") moved guest_exit() into the interrupt
>> protected area to avoid wrong context warning (or worse). The problem is
>> that tick-based time accounting has not yet been updated at this point
>> (because it depends on the timer interrupt firing), so the guest time
>> gets incorrectly accounted to system time.
>>=20
>> To fix the problem, follow the x86 fix in commit 160457140187 ("Defer
>> vtime accounting 'til after IRQ handling"), and allow host IRQs to run
>> before accounting the guest exit time.
>>=20
>> In the case vtime accounting is enabled, this is not required because TB
>> is used directly for accounting.
>>=20
>> Before this patch, with CONFIG_TICK_CPU_ACCOUNTING=3Dy in the host and a
>> guest running a kernel compile, the 'guest' fields of /proc/stat are
>> stuck at zero. With the patch they can be observed increasing roughly as
>> expected.
>>=20
>> Fixes: e233d54d4d97 ("KVM: booke: use __kvm_guest_exit")
>> Fixes: 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest c=
ontext before enabling irqs")
>> Cc: <stable@vger.kernel.org> # 5.12
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> [np: only required for tick accounting, add Book3E fix, tweak changelog]
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> Since v2:
>> - I took over the patch with Laurent's blessing.
>> - Changed to avoid processing IRQs if we do have vtime accounting
>>    enabled.
>> - Changed so in either case the accounting is called with irqs disabled.
>> - Added similar Book3E fix.
>> - Rebased on upstream, tested, observed bug and confirmed fix.
>>=20
>>   arch/powerpc/kvm/book3s_hv.c | 30 ++++++++++++++++++++++++++++--
>>   arch/powerpc/kvm/booke.c     | 16 +++++++++++++++-
>>   2 files changed, 43 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 2acb1c96cfaf..7b74fc0a986b 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -3726,7 +3726,20 @@ static noinline void kvmppc_run_core(struct kvmpp=
c_vcore *vc)
>>  =20
>>   	kvmppc_set_host_core(pcpu);
>>  =20
>> -	guest_exit_irqoff();
>> +	context_tracking_guest_exit();
>> +	if (!vtime_accounting_enabled_this_cpu()) {
>> +		local_irq_enable();
>> +		/*
>> +		 * Service IRQs here before vtime_account_guest_exit() so any
>> +		 * ticks that occurred while running the guest are accounted to
>> +		 * the guest. If vtime accounting is enabled, accounting uses
>> +		 * TB rather than ticks, so it can be done without enabling
>> +		 * interrupts here, which has the problem that it accounts
>> +		 * interrupt processing overhead to the host.
>> +		 */
>> +		local_irq_disable();
>> +	}
>> +	vtime_account_guest_exit();
>>  =20
>>   	local_irq_enable();
>>  =20
>> @@ -4510,7 +4523,20 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, =
u64 time_limit,
>>  =20
>>   	kvmppc_set_host_core(pcpu);
>>  =20
>> -	guest_exit_irqoff();
>> +	context_tracking_guest_exit();
>> +	if (!vtime_accounting_enabled_this_cpu()) {
>> +		local_irq_enable();
>> +		/*
>> +		 * Service IRQs here before vtime_account_guest_exit() so any
>> +		 * ticks that occurred while running the guest are accounted to
>> +		 * the guest. If vtime accounting is enabled, accounting uses
>> +		 * TB rather than ticks, so it can be done without enabling
>> +		 * interrupts here, which has the problem that it accounts
>> +		 * interrupt processing overhead to the host.
>> +		 */
>> +		local_irq_disable();
>> +	}
>> +	vtime_account_guest_exit();
>>  =20
>>   	local_irq_enable();
>>  =20
>> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
>> index 977801c83aff..8c15c90dd3a9 100644
>> --- a/arch/powerpc/kvm/booke.c
>> +++ b/arch/powerpc/kvm/booke.c
>> @@ -1042,7 +1042,21 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, uns=
igned int exit_nr)
>>   	}
>>  =20
>>   	trace_kvm_exit(exit_nr, vcpu);
>> -	guest_exit_irqoff();
>> +
>> +	context_tracking_guest_exit();
>> +	if (!vtime_accounting_enabled_this_cpu()) {
>> +		local_irq_enable();
>> +		/*
>> +		 * Service IRQs here before vtime_account_guest_exit() so any
>> +		 * ticks that occurred while running the guest are accounted to
>> +		 * the guest. If vtime accounting is enabled, accounting uses
>> +		 * TB rather than ticks, so it can be done without enabling
>> +		 * interrupts here, which has the problem that it accounts
>> +		 * interrupt processing overhead to the host.
>> +		 */
>> +		local_irq_disable();
>> +	}
>> +	vtime_account_guest_exit();
>>  =20
>>   	local_irq_enable();
>>  =20
>>=20
>=20
> I'm wondering if we should put the context_tracking_guest_exit() just aft=
er the=20
> "srcu_read_unlock(&vc->kvm->srcu, srcu_idx);" as it was before 61bd0f66ff=
92 ("KVM: PPC:=20
> Book3S HV: Fix guest time accounting with VIRT_CPU_ACCOUNTING_GEN")?

For the run_single_vcpu path, I _think_ it shouldn't matter. It's mostly=20
just fixing up low level powerpc details.

But actually I wonder whether we should move the guest context entirely=20
inside the SRCU lock because it's a high level host locking primitive.

For the kvmppc_run_core path, we are actually taking the vc->lock spin=20
lock as well. Arguably it's waiting for secondary threads in the guest
but I think changing to host context as soon as possible could make
sense. If we don't have an actual bug identified it could wait for next
merge perhaps.

Thanks,
Nick
>=20
