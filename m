Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5B85BA3C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 03:11:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTGH130qNz3c1G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 11:11:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hq/LIZNA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hq/LIZNA;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTGGP6TzRz2xrW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 11:10:37 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id e68so19746689pfe.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 18:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=hr/gJPcU5hvQZ/MKgVwi2KwSsJ/0TzKkNDXlKjCB2Yw=;
        b=hq/LIZNAoz+v9v5PWfa/0aKD/JB/tXkKxHIojwHn30BdKNQ5Be3G0BaUU/zSYBJeE9
         ZLRcqcxf0IDv61ZhN3/kOqcYUToLQAGW/EjhSW4TrFFz9Bqw+yJyw6+Y21pYn3ywkugA
         JniDjX5JcG8m+H85hzbd3loI476IGJYE6L2/G3cL1NfdXgiVnH9OkTHI/WNBlcsCgoy5
         g9uCl3lHdNcq9lab3lKR95Gy8j5E77OSw8jBZYVJGKBEcNBuiYVGD3iTUzbt+3PGUA5n
         JN6BFkpeFxXKeqmd35cSdKJ5epc1LwvYjnXD/rPy7wE+YH+9cFaQxJc+tbgJ5HWLDqSc
         5Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=hr/gJPcU5hvQZ/MKgVwi2KwSsJ/0TzKkNDXlKjCB2Yw=;
        b=wrL60Nm6ViX618pI1gUXKcIRVdQy3iLnK1CoPcfO1UX+OI+MHSIL7CNIVAlE3Wi+vU
         gR91qX3GVIVphS6Kf8PDLe67cqP0fDHi6NMtSS9K5hH4slWApbxmnR07xFnPJpAd1XcY
         uIKah1A+KXvE4Ng9r2u2odqy/rTnM2w9a/ZfQXWsVbLVTzt0zBf3IehsiAiywjTBAc+n
         VmdPE0omAi2NX34Qxuu1BIJoWZlFyys8deajytE0DdnVxyuIu+SA90t+Fk5HReW9BEGL
         88oJxL7EaKvUrBICF/B4Knh/wDT7fDaJWS7lp/ygZOdIE5IhnDIF6KPCErvtom5BPJAr
         3ErQ==
X-Gm-Message-State: ACrzQf2Y8+cS0d4/5fAw73s7haxbzZcr7dLCS5uCIOhGePBTGkID2AOG
	7ReDOv9dXg8ewitwBRgxewU=
X-Google-Smtp-Source: AMsMyM5HLVuDEFZ7yFGWlTXtrR5ixkZIR3wBKnru30CnmTKTvOjZydafHw2K7xojMyDBGaMDjl15+A==
X-Received: by 2002:a05:6a00:1342:b0:545:4d30:eecb with SMTP id k2-20020a056a00134200b005454d30eecbmr2511913pfu.69.1663290634936;
        Thu, 15 Sep 2022 18:10:34 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902f68600b00176b3d7db49sm13769119plg.0.2022.09.15.18.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 18:10:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Sep 2022 11:10:25 +1000
Message-Id: <CMXFBGZGQCQR.2FRWNY2JHBVL9@bobo>
Subject: Re: [PATCH kernel] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE platform
 dependent
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexey Kardashevskiy" <aik@ozlabs.ru>, <kvm-ppc@vger.kernel.org>
X-Mailer: aerc 0.11.0
References: <20220504074807.3616813-1-aik@ozlabs.ru>
 <0d4bb0fa-10c6-3f5a-34c8-293144b3fdbb@ozlabs.ru>
 <59dfb450-5a91-f27b-6edf-0adfa89729b7@ozlabs.ru>
In-Reply-To: <59dfb450-5a91-f27b-6edf-0adfa89729b7@ozlabs.ru>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, kvm-riscv@lists.infradead.org, Paolo
 Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Seems okay to me, it probably better go through the KVM tree though.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

On Tue Sep 13, 2022 at 10:50 PM AEST, Alexey Kardashevskiy wrote:
> Ping? It's been a while and probably got lost :-/
>
> On 18/05/2022 16:27, Alexey Kardashevskiy wrote:
> >=20
> >=20
> > On 5/4/22 17:48, Alexey Kardashevskiy wrote:
> >> When introduced, IRQFD resampling worked on POWER8 with XICS. However
> >> KVM on POWER9 has never implemented it - the compatibility mode code
> >> ("XICS-on-XIVE") misses the kvm_notify_acked_irq() call and the native
> >> XIVE mode does not handle INTx in KVM at all.
> >>
> >> This moved the capability support advertising to platforms and stops
> >> advertising it on XIVE, i.e. POWER9 and later.
> >>
> >> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> >> ---
> >>
> >>
> >> Or I could move this one together with KVM_CAP_IRQFD. Thoughts?
> >=20
> >=20
> > Ping?
> >=20
> >>
> >> ---
> >> =C2=A0 arch/arm64/kvm/arm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++=
+
> >> =C2=A0 arch/mips/kvm/mips.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 ++=
+
> >> =C2=A0 arch/powerpc/kvm/powerpc.c | 6 ++++++
> >> =C2=A0 arch/riscv/kvm/vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 3 +++
> >> =C2=A0 arch/s390/kvm/kvm-s390.c=C2=A0=C2=A0 | 3 +++
> >> =C2=A0 arch/x86/kvm/x86.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 3 +++
> >> =C2=A0 virt/kvm/kvm_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 1 -
> >> =C2=A0 7 files changed, 21 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> >> index 523bc934fe2f..092f0614bae3 100644
> >> --- a/arch/arm64/kvm/arm.c
> >> +++ b/arch/arm64/kvm/arm.c
> >> @@ -210,6 +210,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,=
=20
> >> long ext)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_SET_GUEST_DEBUG:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_VCPU_ATTRIBUTES:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_PTP_KVM:
> >> +#ifdef CONFIG_HAVE_KVM_IRQFD
> >> +=C2=A0=C2=A0=C2=A0 case KVM_CAP_IRQFD_RESAMPLE:
> >> +#endif
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D 1;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_SET_GUEST_DEBUG2:
> >> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> >> index a25e0b73ee70..0f3de470a73e 100644
> >> --- a/arch/mips/kvm/mips.c
> >> +++ b/arch/mips/kvm/mips.c
> >> @@ -1071,6 +1071,9 @@ int kvm_vm_ioctl_check_extension(struct kvm=20
> >> *kvm, long ext)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_READONLY_MEM:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_SYNC_MMU:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_IMMEDIATE_EXIT:
> >> +#ifdef CONFIG_HAVE_KVM_IRQFD
> >> +=C2=A0=C2=A0=C2=A0 case KVM_CAP_IRQFD_RESAMPLE:
> >> +#endif
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D 1;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_NR_VCPUS:
> >> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> >> index 875c30c12db0..87698ffef3be 100644
> >> --- a/arch/powerpc/kvm/powerpc.c
> >> +++ b/arch/powerpc/kvm/powerpc.c
> >> @@ -591,6 +591,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,=
=20
> >> long ext)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >> =C2=A0 #endif
> >> +#ifdef CONFIG_HAVE_KVM_IRQFD
> >> +=C2=A0=C2=A0=C2=A0 case KVM_CAP_IRQFD_RESAMPLE:
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D !xive_enabled();
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >> +#endif
> >> +
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_PPC_ALLOC_HTAB:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D hv_enable=
d;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> >> index c768f75279ef..b58579b386bb 100644
> >> --- a/arch/riscv/kvm/vm.c
> >> +++ b/arch/riscv/kvm/vm.c
> >> @@ -63,6 +63,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,=20
> >> long ext)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_READONLY_MEM:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_MP_STATE:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_IMMEDIATE_EXIT:
> >> +#ifdef CONFIG_HAVE_KVM_IRQFD
> >> +=C2=A0=C2=A0=C2=A0 case KVM_CAP_IRQFD_RESAMPLE:
> >> +#endif
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D 1;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_NR_VCPUS:
> >> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> >> index 156d1c25a3c1..85e093fc8d13 100644
> >> --- a/arch/s390/kvm/kvm-s390.c
> >> +++ b/arch/s390/kvm/kvm-s390.c
> >> @@ -564,6 +564,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,=
=20
> >> long ext)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_SET_GUEST_DEBUG:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_S390_DIAG318:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_S390_MEM_OP_EXTENSION:
> >> +#ifdef CONFIG_HAVE_KVM_IRQFD
> >> +=C2=A0=C2=A0=C2=A0 case KVM_CAP_IRQFD_RESAMPLE:
> >> +#endif
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D 1;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_SET_GUEST_DEBUG2:
> >> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> >> index 0c0ca599a353..a0a7b769483d 100644
> >> --- a/arch/x86/kvm/x86.c
> >> +++ b/arch/x86/kvm/x86.c
> >> @@ -4273,6 +4273,9 @@ int kvm_vm_ioctl_check_extension(struct kvm=20
> >> *kvm, long ext)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_SYS_ATTRIBUTES:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_VAPIC:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_ENABLE_CAP:
> >> +#ifdef CONFIG_HAVE_KVM_IRQFD
> >> +=C2=A0=C2=A0=C2=A0 case KVM_CAP_IRQFD_RESAMPLE:
> >> +#endif
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D 1;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_EXIT_HYPERCALL:
> >> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> >> index 70e05af5ebea..885e72e668a5 100644
> >> --- a/virt/kvm/kvm_main.c
> >> +++ b/virt/kvm/kvm_main.c
> >> @@ -4293,7 +4293,6 @@ static long=20
> >> kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
> >> =C2=A0 #endif
> >> =C2=A0 #ifdef CONFIG_HAVE_KVM_IRQFD
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_IRQFD:
> >> -=C2=A0=C2=A0=C2=A0 case KVM_CAP_IRQFD_RESAMPLE:
> >> =C2=A0 #endif
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_IOEVENTFD_ANY_LENGTH:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case KVM_CAP_CHECK_EXTENSION_VM:
> >=20
>
> --=20
> Alexey

