Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA901BDB60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 14:06:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49By063b1nzDr2p
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 22:05:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=vkuznets@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Di8VTxch; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Di8VTxch; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bxxq17FHzDqyS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 22:03:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588161835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vVvnsQYJBmlhPz+VOWOkjerwwm6oNBR0crQtJmB/QvU=;
 b=Di8VTxch3dM8983mUaDpogW2whBgw6a7ZB600X1ANUmTwzrkv+5uzLo2iDOZ6sU1Rsyp/B
 8n+6ubFMUmJQPG1FamsV0tzNdAmnUBO9NuTLgUyw5/H6OqOGJP//E5ohSr2j+sgTbJAIa2
 kC5xLIguucSYRTPrllJxctLtsTk+dxw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588161835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vVvnsQYJBmlhPz+VOWOkjerwwm6oNBR0crQtJmB/QvU=;
 b=Di8VTxch3dM8983mUaDpogW2whBgw6a7ZB600X1ANUmTwzrkv+5uzLo2iDOZ6sU1Rsyp/B
 8n+6ubFMUmJQPG1FamsV0tzNdAmnUBO9NuTLgUyw5/H6OqOGJP//E5ohSr2j+sgTbJAIa2
 kC5xLIguucSYRTPrllJxctLtsTk+dxw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-KwHn5H1uNbKkFWxh8MroJA-1; Wed, 29 Apr 2020 08:03:53 -0400
X-MC-Unique: KwHn5H1uNbKkFWxh8MroJA-1
Received: by mail-wr1-f69.google.com with SMTP id p2so1600407wrx.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 05:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PqLyCXunZj5hIFRUBscgO/EQSOL9w9OMkdGXwDOCk6M=;
 b=BEzAwCBQ0ohBrfTYYvdEAtlm364q/bHw/2jOfbretx5xFuy6Tdl/0505knjuIPFArc
 X5YoA7LBs7s22HnHSw32wjWZlYKsJnKQsQN2ImtXZfPjjvyQ/7YuvQDdpk9Iec81V8at
 4pQuW6HL0wYCSaF8s1ftwZRfGylj7j5StKDTSCpUdnlXQYF7xhPUiE33Nu8Vw5sfe08M
 ELelI7E5eHAR7eBGnpnhLKOaUDzeO5hheEEP3JH0+sHW5nXORESQEi+oY+kDTFKWrqwH
 6mZsIqx3TgRWP1L0gSjXhY4S1GNbHYviKRUrK6cuuOeHB1axv0epXI/VlpZPs5cFqq3y
 MRBw==
X-Gm-Message-State: AGi0Pub7XdPJni+TBn8J6/CFgP6egtFmsFSpSrKA2DKkRYUNVBcFHbH2
 JRGoD3lMD/XXgntf3ALQEZxnchGbCeTGRmCAzmydeW3UXDtV5fNizBtkvfxBPoHODyEBfhXGm28
 jafB74k5LL0Uiu8awRCqYMP7n2A==
X-Received: by 2002:a5d:470a:: with SMTP id y10mr38056967wrq.63.1588161831819; 
 Wed, 29 Apr 2020 05:03:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypLf4KZ8Rngx22ZnSSPEeNNoZEwjNixMH7nATd8iA4vBWIWJ++JJzRvFnPP9z8By88bEDzPwkg==
X-Received: by 2002:a5d:470a:: with SMTP id y10mr38056907wrq.63.1588161831501; 
 Wed, 29 Apr 2020 05:03:51 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id h16sm33279920wrw.36.2020.04.29.05.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 05:03:46 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH v4 1/7] KVM: s390: clean up redundant 'kvm_run' parameters
In-Reply-To: <20200427043514.16144-2-tianjia.zhang@linux.alibaba.com>
References: <20200427043514.16144-1-tianjia.zhang@linux.alibaba.com>
 <20200427043514.16144-2-tianjia.zhang@linux.alibaba.com>
Date: Wed, 29 Apr 2020 14:03:41 +0200
Message-ID: <87r1w6h52a.fsf@vitty.brq.redhat.com>
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

> In the current kvm version, 'kvm_run' has been included in the 'kvm_vcpu'
> structure. For historical reasons, many kvm-related function parameters
> retain the 'kvm_run' and 'kvm_vcpu' parameters at the same time. This
> patch does a unified cleanup of these remaining redundant parameters.
>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>  arch/s390/kvm/kvm-s390.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index e335a7e5ead7..c0d94eaa00d7 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -4176,8 +4176,9 @@ static int __vcpu_run(struct kvm_vcpu *vcpu)
>  =09return rc;
>  }
> =20
> -static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_ru=
n)
> +static void sync_regs_fmt2(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *kvm_run =3D vcpu->run;
>  =09struct runtime_instr_cb *riccb;
>  =09struct gs_cb *gscb;
> =20
> @@ -4243,8 +4244,10 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu, =
struct kvm_run *kvm_run)
>  =09/* SIE will load etoken directly from SDNX and therefore kvm_run */
>  }
> =20
> -static void sync_regs(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
> +static void sync_regs(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *kvm_run =3D vcpu->run;
> +
>  =09if (kvm_run->kvm_dirty_regs & KVM_SYNC_PREFIX)
>  =09=09kvm_s390_set_prefix(vcpu, kvm_run->s.regs.prefix);
>  =09if (kvm_run->kvm_dirty_regs & KVM_SYNC_CRS) {
> @@ -4273,7 +4276,7 @@ static void sync_regs(struct kvm_vcpu *vcpu, struct=
 kvm_run *kvm_run)
> =20
>  =09/* Sync fmt2 only data */
>  =09if (likely(!kvm_s390_pv_cpu_is_protected(vcpu))) {
> -=09=09sync_regs_fmt2(vcpu, kvm_run);
> +=09=09sync_regs_fmt2(vcpu);
>  =09} else {
>  =09=09/*
>  =09=09 * In several places we have to modify our internal view to
> @@ -4292,8 +4295,10 @@ static void sync_regs(struct kvm_vcpu *vcpu, struc=
t kvm_run *kvm_run)
>  =09kvm_run->kvm_dirty_regs =3D 0;
>  }
> =20
> -static void store_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm_r=
un)
> +static void store_regs_fmt2(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *kvm_run =3D vcpu->run;
> +
>  =09kvm_run->s.regs.todpr =3D vcpu->arch.sie_block->todpr;
>  =09kvm_run->s.regs.pp =3D vcpu->arch.sie_block->pp;
>  =09kvm_run->s.regs.gbea =3D vcpu->arch.sie_block->gbea;
> @@ -4313,8 +4318,10 @@ static void store_regs_fmt2(struct kvm_vcpu *vcpu,=
 struct kvm_run *kvm_run)
>  =09/* SIE will save etoken directly into SDNX and therefore kvm_run */
>  }
> =20
> -static void store_regs(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
> +static void store_regs(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *kvm_run =3D vcpu->run;
> +
>  =09kvm_run->psw_mask =3D vcpu->arch.sie_block->gpsw.mask;
>  =09kvm_run->psw_addr =3D vcpu->arch.sie_block->gpsw.addr;
>  =09kvm_run->s.regs.prefix =3D kvm_s390_get_prefix(vcpu);
> @@ -4333,7 +4340,7 @@ static void store_regs(struct kvm_vcpu *vcpu, struc=
t kvm_run *kvm_run)
>  =09current->thread.fpu.fpc =3D vcpu->arch.host_fpregs.fpc;
>  =09current->thread.fpu.regs =3D vcpu->arch.host_fpregs.regs;
>  =09if (likely(!kvm_s390_pv_cpu_is_protected(vcpu)))
> -=09=09store_regs_fmt2(vcpu, kvm_run);
> +=09=09store_regs_fmt2(vcpu);
>  }
> =20
>  int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> @@ -4371,7 +4378,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  =09=09goto out;
>  =09}
> =20
> -=09sync_regs(vcpu, kvm_run);
> +=09sync_regs(vcpu);
>  =09enable_cpu_timer_accounting(vcpu);
> =20
>  =09might_fault();
> @@ -4393,7 +4400,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  =09}
> =20
>  =09disable_cpu_timer_accounting(vcpu);
> -=09store_regs(vcpu, kvm_run);
> +=09store_regs(vcpu);
> =20
>  =09kvm_sigset_deactivate(vcpu);

Haven't tried to compile this but the change itself looks obviously
correct, so

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

--=20
Vitaly

