Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D03001AB95C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 09:07:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492r016tkxzDrPn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 17:07:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=vkuznets@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=iIX1DYOW; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=coN8qmYy; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492qy851YFzDrLj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 17:06:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587020634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ycA+oaK7HnY0LCry275m8vvLJYLlqC5gRDJoT8fOj6s=;
 b=iIX1DYOWAXPgNxk6aF8CTQV6URQVWwBfXInDhlCMm+a2vtoT13nZArvWQnlv4J+28TY9lx
 TU9ISPw5612D7pPe2D2HSJcw4wc4jjuk4Th2wIXzvMzKItyTbuWnm4bmFzOSHF1PbxIt+J
 4t9U97jEEKUJOP8p75CxM8g2Z+TcfAI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587020761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ycA+oaK7HnY0LCry275m8vvLJYLlqC5gRDJoT8fOj6s=;
 b=coN8qmYyQBH/u1Xx39+z+as1C0EsD6oD7h4CQymideqanEzvnIm87Zh8KqbXOtu6/KBaZd
 HnAV6iL5wBTigSvQMToo+uKnKL8Rpv/rzOxuoPsaZNAP5H27VuyhWph5beFnuhGqXINxrE
 FfP6hc0wVwl4W8TyPmrs8Kh2uI3yz/4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-H5cObrEhPQy19gvtOwRvDA-1; Thu, 16 Apr 2020 03:03:52 -0400
X-MC-Unique: H5cObrEhPQy19gvtOwRvDA-1
Received: by mail-wr1-f70.google.com with SMTP id j12so1226116wrr.18
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 00:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=u8Fe4HRBZIpxRs2mIcqmv3RiTnssjCSY9lhZeXvdF9I=;
 b=a7/8xapMh63FZxwDZXwMRi6UotQNUbO4eG1HP4WkIjsZZpkS7T9xpSBhIZdeQjlXGq
 mUjgXtUyTQZf0NaYXr2YNyCW8tR4lulg0gua8M6EohLIXkd2UW8qwtjrgpvILaMHxx5q
 dqGNEh/Y87od/kKgPXIoLs+yybLFDEVl+zuTQ0xG0TcavcVbvjal85vqKkPX4JXUbPt1
 lLiRh62u9E4oveOCmcgMUYfaLCIR4eFnyu6aLh85RnousYGFGr91Gp+z/eU8ow4kZp9z
 B0s5/Ixwiqygm9r58qA3rWa8FP2aD8sOzVvnHYeVfGkA5VNqCfFjVaQCUXewB0/Bs7CT
 XnCw==
X-Gm-Message-State: AGi0PuaGrmAfoer4QBAY4bLlDisEgwFz78hmW37WcDiMSrvgeGn0bj7i
 NxL1oQ7gwzRSkw58SAZ0ktj2Fnvb4YrEbUDs0DVUMCUPIAYdSYeg5i1Z5x/UC4VowKJ6Or5uzv9
 WPXDxt07cnBeJX9wwkfzB5LQ13A==
X-Received: by 2002:a5d:4005:: with SMTP id n5mr7830147wrp.242.1587020631096; 
 Thu, 16 Apr 2020 00:03:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypKzVfRYkQQjXNmPRmmEuweWR0AsvTUy66VIOLHRJ9IcCVXdD+fbCSvkQnkvtw8EzDw2iMvttg==
X-Received: by 2002:a5d:4005:: with SMTP id n5mr7830094wrp.242.1587020630785; 
 Thu, 16 Apr 2020 00:03:50 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id o16sm26785055wrs.44.2020.04.16.00.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 00:03:49 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Subject: Re: [PATCH v2] KVM: Optimize kvm_arch_vcpu_ioctl_run function
In-Reply-To: <20200416051057.26526-1-tianjia.zhang@linux.alibaba.com>
References: <20200416051057.26526-1-tianjia.zhang@linux.alibaba.com>
Date: Thu, 16 Apr 2020 09:03:47 +0200
Message-ID: <878sivx67g.fsf@vitty.brq.redhat.com>
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
 linux-s390@vger.kernel.org, frankja@linux.ibm.com, joro@8bytes.org,
 x86@kernel.org, borntraeger@de.ibm.com, mingo@redhat.com,
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

> In earlier versions of kvm, 'kvm_run' is an independent structure
> and is not included in the vcpu structure. At present, 'kvm_run'
> is already included in the vcpu structure, so the parameter
> 'kvm_run' is redundant.
>
> This patch simplify the function definition, removes the extra
> 'kvm_run' parameter, and extract it from the 'kvm_vcpu' structure
> if necessary.
>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
>
> v2 change:
>   remove 'kvm_run' parameter and extract it from 'kvm_vcpu'
>
>  arch/mips/kvm/mips.c       |  3 ++-
>  arch/powerpc/kvm/powerpc.c |  3 ++-
>  arch/s390/kvm/kvm-s390.c   |  3 ++-
>  arch/x86/kvm/x86.c         | 11 ++++++-----
>  include/linux/kvm_host.h   |  2 +-
>  virt/kvm/arm/arm.c         |  6 +++---
>  virt/kvm/kvm_main.c        |  2 +-
>  7 files changed, 17 insertions(+), 13 deletions(-)
>
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index 8f05dd0a0f4e..ec24adf4857e 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -439,8 +439,9 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vc=
pu *vcpu,
>  =09return -ENOIOCTLCMD;
>  }
> =20
> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09int r =3D -EINTR;
> =20
>  =09vcpu_load(vcpu);
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index e15166b0a16d..7e24691e138a 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -1764,8 +1764,9 @@ int kvm_vcpu_ioctl_set_one_reg(struct kvm_vcpu *vcp=
u, struct kvm_one_reg *reg)
>  =09return r;
>  }
> =20
> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09int r;
> =20
>  =09vcpu_load(vcpu);
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 19a81024fe16..443af3ead739 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -4333,8 +4333,9 @@ static void store_regs(struct kvm_vcpu *vcpu, struc=
t kvm_run *kvm_run)
>  =09=09store_regs_fmt2(vcpu, kvm_run);
>  }
> =20
> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_r=
un)
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *kvm_run =3D vcpu->run;
>  =09int rc;
> =20
>  =09if (kvm_run->immediate_exit)
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 3bf2ecafd027..a0338e86c90f 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -8707,8 +8707,9 @@ static void kvm_put_guest_fpu(struct kvm_vcpu *vcpu=
)
>  =09trace_kvm_fpu(0);
>  }
> =20
> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_r=
un)
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *kvm_run =3D vcpu->run;
>  =09int r;
> =20
>  =09vcpu_load(vcpu);
> @@ -8726,18 +8727,18 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu=
, struct kvm_run *kvm_run)
>  =09=09r =3D -EAGAIN;
>  =09=09if (signal_pending(current)) {
>  =09=09=09r =3D -EINTR;
> -=09=09=09vcpu->run->exit_reason =3D KVM_EXIT_INTR;
> +=09=09=09kvm_run->exit_reason =3D KVM_EXIT_INTR;
>  =09=09=09++vcpu->stat.signal_exits;
>  =09=09}
>  =09=09goto out;
>  =09}
> =20
> -=09if (vcpu->run->kvm_valid_regs & ~KVM_SYNC_X86_VALID_FIELDS) {
> +=09if (kvm_run->kvm_valid_regs & ~KVM_SYNC_X86_VALID_FIELDS) {
>  =09=09r =3D -EINVAL;
>  =09=09goto out;
>  =09}
> =20
> -=09if (vcpu->run->kvm_dirty_regs) {
> +=09if (kvm_run->kvm_dirty_regs) {
>  =09=09r =3D sync_regs(vcpu);
>  =09=09if (r !=3D 0)
>  =09=09=09goto out;
> @@ -8767,7 +8768,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, =
struct kvm_run *kvm_run)
> =20
>  out:
>  =09kvm_put_guest_fpu(vcpu);
> -=09if (vcpu->run->kvm_valid_regs)
> +=09if (kvm_run->kvm_valid_regs)
>  =09=09store_regs(vcpu);
>  =09post_kvm_run_save(vcpu);
>  =09kvm_sigset_deactivate(vcpu);
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 6d58beb65454..1e17ef719595 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -866,7 +866,7 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *=
vcpu,
>  =09=09=09=09    struct kvm_mp_state *mp_state);
>  int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
>  =09=09=09=09=09struct kvm_guest_debug *dbg);
> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_r=
un);
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
> =20
>  int kvm_arch_init(void *opaque);
>  void kvm_arch_exit(void);
> diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
> index 48d0ec44ad77..f5390ac2165b 100644
> --- a/virt/kvm/arm/arm.c
> +++ b/virt/kvm/arm/arm.c
> @@ -639,7 +639,6 @@ static void check_vcpu_requests(struct kvm_vcpu *vcpu=
)
>  /**
>   * kvm_arch_vcpu_ioctl_run - the main VCPU run function to execute guest=
 code
>   * @vcpu:=09The VCPU pointer
> - * @run:=09The kvm_run structure pointer used for userspace state exchan=
ge
>   *
>   * This function is called through the VCPU_RUN ioctl called from user s=
pace. It
>   * will execute VM code in a loop until the time slice for the process i=
s used
> @@ -647,8 +646,9 @@ static void check_vcpu_requests(struct kvm_vcpu *vcpu=
)
>   * return with return value 0 and with the kvm_run structure filled in w=
ith the
>   * required data for the requested emulation.
>   */
> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  {
> +=09struct kvm_run *run =3D vcpu->run;
>  =09int ret;
> =20
>  =09if (unlikely(!kvm_vcpu_initialized(vcpu)))
> @@ -659,7 +659,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, st=
ruct kvm_run *run)
>  =09=09return ret;
> =20
>  =09if (run->exit_reason =3D=3D KVM_EXIT_MMIO) {
> -=09=09ret =3D kvm_handle_mmio_return(vcpu, vcpu->run);
> +=09=09ret =3D kvm_handle_mmio_return(vcpu, run);

I don't know much about ARM but this also seems redundant,
kvm_handle_mmio_return() is also able to extruct 'struct kvm_run' from'
'struct kvm_vcpu'. This likely deserves it's own patch though.

>  =09=09if (ret)
>  =09=09=09return ret;
>  =09}
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 74bdb7bf3295..e18faea89146 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3135,7 +3135,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
>  =09=09=09=09synchronize_rcu();
>  =09=09=09put_pid(oldpid);
>  =09=09}
> -=09=09r =3D kvm_arch_vcpu_ioctl_run(vcpu, vcpu->run);
> +=09=09r =3D kvm_arch_vcpu_ioctl_run(vcpu);
>  =09=09trace_kvm_userspace_exit(vcpu->run->exit_reason, r);
>  =09=09break;
>  =09}

Looked at non-x86 arches just briefly but there seems to be no
controversy here, so

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

--=20
Vitaly

