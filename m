Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1590E1BDD5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 15:18:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BzbY3KX3zDqp5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 23:18:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=vkuznets@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=bPXMF5BI; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=bPXMF5BI; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ByNr2mSQzDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 22:23:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588163031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f73XFclQGMI95HoTU649yPccrfl6BgMf60JAuz7AmbU=;
 b=bPXMF5BIRwCmB50fr+kc4JOvXEa/5HG2HmoHvKOTPTQzECAfZzKOtqFFYUnYRPigmPCUYm
 3wkFS9DrbAu691q7hc9BwO+umBtTMVRqJdFLBvQLTC9kWxUcfUPgVyW490KZr9mufAPY+l
 7wUVqLxFxGA73HYZ2oX0Q1WNVEYDmOo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588163031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f73XFclQGMI95HoTU649yPccrfl6BgMf60JAuz7AmbU=;
 b=bPXMF5BIRwCmB50fr+kc4JOvXEa/5HG2HmoHvKOTPTQzECAfZzKOtqFFYUnYRPigmPCUYm
 3wkFS9DrbAu691q7hc9BwO+umBtTMVRqJdFLBvQLTC9kWxUcfUPgVyW490KZr9mufAPY+l
 7wUVqLxFxGA73HYZ2oX0Q1WNVEYDmOo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-0S59-kZkMyWKYwkgigQjww-1; Wed, 29 Apr 2020 08:23:47 -0400
X-MC-Unique: 0S59-kZkMyWKYwkgigQjww-1
Received: by mail-wm1-f70.google.com with SMTP id h22so1131211wml.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 05:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=P8pgV6uMHzNDOfpWIiJdoKMsBBSJGFZq++Qsl0KZjhI=;
 b=diM+p/p4I2dl1k1JG3JaIHvjLdBphbd25JFCxtRKc1yvAzzSUbp+YS0EycPn0Mj9zh
 5WPlFrjEsf8Xfm9EivyIX2vC+UFTQLdwW8kLobFIKT45NDMl9sR1PpRQK7X7LeN6Btq1
 pFLIIhG2k5CY8r6aLjFqYgKpJJI4tFkLQZHmjHhVcOmWd4EQTEfg0zaCOurJZiO7zyk1
 WMaSheF0so7BqqsRekd7LA7r80nu5GZCSFgBiClQ9jdoknkU2Fi9N5vPsiN58Q+bowY4
 74iC4qN4d/cOclOmbNX5v5me9+BPJzoLJJQqOWNlBiKImnlkEjJAc5X3NoaVJxwwRdrE
 vWaw==
X-Gm-Message-State: AGi0PuatCWmG2fxcr+nmDlT/gq8oXgyyKOgtVxnXy3VH41d/F3+CWt2L
 +EdGbb0Jwbsj7ixef4l573qw+kULy7Pt5LUAmbYIvg61/rJTx1ZZbB1u/RU4NkpklVzB3z5qCYB
 L0fRRtwnXqAYoCYjok+6t/ABVfw==
X-Received: by 2002:a1c:8106:: with SMTP id c6mr2999782wmd.88.1588163026211;
 Wed, 29 Apr 2020 05:23:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypLEQN/fKbOj2PpKvd2yk8qFu2uTYg65caL+qOuUZqYZNmiqKNZUNV+CX/Wun7VWjygdbXHKLA==
X-Received: by 2002:a1c:8106:: with SMTP id c6mr2999734wmd.88.1588163025929;
 Wed, 29 Apr 2020 05:23:45 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id n6sm32160645wrs.81.2020.04.29.05.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 05:23:45 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH v4 3/7] KVM: PPC: Remove redundant kvm_run from vcpu_arch
In-Reply-To: <20200427043514.16144-4-tianjia.zhang@linux.alibaba.com>
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
 <20200427043514.16144-4-tianjia.zhang@linux.alibaba.com>
Date: Wed, 29 Apr 2020 14:23:42 +0200
Message-ID: <87lfmeh44x.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: christoffer.dall@arm.com, wanpengli@tencent.com, kvm@vger.kernel.org,
 david@redhat.com, heiko.carstens@de.ibm.com, peterx@redhat.com,
 linux-kernel@vger.kernel.org, hpa@zytor.com, kvmarm@lists.cs.columbia.edu,
 linux-s390@vger.kernel.org, frankja@linux.ibm.com, chenhuacai@gmail.com,
 joro@8bytes.org, x86@kernel.org, borntraeger@de.ibm.com, mingo@redhat.com,
 julien.thierry.kdev@gmail.com, thuth@redhat.com, gor@linux.ibm.com,
 suzuki.poulose@arm.com, kvm-ppc@vger.kernel.org, bp@alien8.de,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jmattson@google.com,
 tsbogend@alpha.franken.de, tianjia.zhang@linux.alibaba.com, cohuck@redhat.com,
 linux-mips@vger.kernel.org, sean.j.christopherson@intel.com,
 james.morse@arm.com, maz@kernel.org, pbonzini@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tianjia Zhang <tianjia.zhang@linux.alibaba.com> writes:

> The 'kvm_run' field already exists in the 'vcpu' structure, which
> is the same structure as the 'kvm_run' in the 'vcpu_arch' and
> should be deleted.
>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>  arch/powerpc/include/asm/kvm_host.h | 1 -
>  arch/powerpc/kvm/book3s_hv.c        | 6 ++----
>  arch/powerpc/kvm/book3s_hv_nested.c | 3 +--
>  3 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/a=
sm/kvm_host.h
> index 1dc63101ffe1..2745ff8faa01 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -795,7 +795,6 @@ struct kvm_vcpu_arch {
>  =09struct mmio_hpte_cache_entry *pgfault_cache;
> =20
>  =09struct task_struct *run_task;
> -=09struct kvm_run *kvm_run;
> =20
>  =09spinlock_t vpa_update_lock;
>  =09struct kvmppc_vpa vpa;
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 93493f0cbfe8..413ea2dcb10c 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -2934,7 +2934,7 @@ static void post_guest_process(struct kvmppc_vcore =
*vc, bool is_master)
> =20
>  =09=09ret =3D RESUME_GUEST;
>  =09=09if (vcpu->arch.trap)
> -=09=09=09ret =3D kvmppc_handle_exit_hv(vcpu->arch.kvm_run, vcpu,
> +=09=09=09ret =3D kvmppc_handle_exit_hv(vcpu->run, vcpu,
>  =09=09=09=09=09=09    vcpu->arch.run_task);
> =20
>  =09=09vcpu->arch.ret =3D ret;
> @@ -3920,7 +3920,6 @@ static int kvmppc_run_vcpu(struct kvm_run *kvm_run,=
 struct kvm_vcpu *vcpu)
>  =09spin_lock(&vc->lock);
>  =09vcpu->arch.ceded =3D 0;
>  =09vcpu->arch.run_task =3D current;
> -=09vcpu->arch.kvm_run =3D kvm_run;
>  =09vcpu->arch.stolen_logged =3D vcore_stolen_time(vc, mftb());
>  =09vcpu->arch.state =3D KVMPPC_VCPU_RUNNABLE;
>  =09vcpu->arch.busy_preempt =3D TB_NIL;
> @@ -3973,7 +3972,7 @@ static int kvmppc_run_vcpu(struct kvm_run *kvm_run,=
 struct kvm_vcpu *vcpu)
>  =09=09=09if (signal_pending(v->arch.run_task)) {
>  =09=09=09=09kvmppc_remove_runnable(vc, v);
>  =09=09=09=09v->stat.signal_exits++;
> -=09=09=09=09v->arch.kvm_run->exit_reason =3D KVM_EXIT_INTR;
> +=09=09=09=09v->run->exit_reason =3D KVM_EXIT_INTR;
>  =09=09=09=09v->arch.ret =3D -EINTR;
>  =09=09=09=09wake_up(&v->arch.cpu_run);
>  =09=09=09}
> @@ -4049,7 +4048,6 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
>  =09vc =3D vcpu->arch.vcore;
>  =09vcpu->arch.ceded =3D 0;
>  =09vcpu->arch.run_task =3D current;
> -=09vcpu->arch.kvm_run =3D kvm_run;
>  =09vcpu->arch.stolen_logged =3D vcore_stolen_time(vc, mftb());
>  =09vcpu->arch.state =3D KVMPPC_VCPU_RUNNABLE;
>  =09vcpu->arch.busy_preempt =3D TB_NIL;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index dc97e5be76f6..5a3987f3ebf3 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -290,8 +290,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
>  =09=09=09r =3D RESUME_HOST;
>  =09=09=09break;
>  =09=09}
> -=09=09r =3D kvmhv_run_single_vcpu(vcpu->arch.kvm_run, vcpu, hdec_exp,
> -=09=09=09=09=09  lpcr);
> +=09=09r =3D kvmhv_run_single_vcpu(vcpu->run, vcpu, hdec_exp, lpcr);
>  =09} while (is_kvmppc_resume_guest(r));
> =20
>  =09/* save L2 state for return */

FWIW,

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

--=20
Vitaly

