Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C31B6663A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 04:08:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lGYH4X52zDqkw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 12:08:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lGWG44hGzDqkf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 12:06:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TbWOHkpN"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45lGWG1S4Yz8t0l
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 12:06:34 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45lGWG0lD2z9sMr; Fri, 12 Jul 2019 12:06:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TbWOHkpN"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45lGWF6Cv7z9sMQ
 for <linuxppc-dev@ozlabs.org>; Fri, 12 Jul 2019 12:06:33 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id y15so3595988pfn.5
 for <linuxppc-dev@ozlabs.org>; Thu, 11 Jul 2019 19:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=vNBK+QFEu9QF3vJMr4t5WoVDGfRfBpi0TNU2yGl9SjI=;
 b=TbWOHkpN20FVB/gP83fCmS0O16ZeYOYsJlfW6VMM1QI4itZUMQqqc/TfjvScp0eG5p
 VEQZ6dmYn32sKtxLoQVDSU6usIpHCG8GghWdfNRix3gyjcJjUsKPCTnNvhG+mza4Q9Hd
 H7wixInwzkVYJX+S2PrYUgKwPsxXwGUFgdQJTyKlvACRIAOuk8nZ1mIOxI5GieRFzQfS
 r3wiHdE1KvjukuJcWXngrmrsehzNLfSi9eaGNty6K55JJaS9akLOkLgMi3/AsqLNEsDZ
 dySo4AtxTPzYZJyM8Ha44Nez6TnNxChLGgvgPUZO9lEYDp2kwu5H9DO+FsevTjbsvZTT
 jzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=vNBK+QFEu9QF3vJMr4t5WoVDGfRfBpi0TNU2yGl9SjI=;
 b=iFJevbL2IfHby9qIsDUOt/Y8KrJDeb0RpmgocTO8a+xS+l3yD8JRwuvA66YvdZFHWK
 DByxqhwqA9DBwzHIqjTpqPX+tan+uaLD4YooZ0rwrOB8JtmjXCqxUpTyZtUAc/GbYEdD
 +fP5YvXX8mHk6uLBTksqYuDhTXPbUaDdw1MmD9K/W03jSYaPaHG3NQj5mgEau9Xk+mux
 Z8Zv6jt0X09yz6K4kfNB+dE+NtwcqQw8WMK/dQZpMS0MKbkpFX56xPpjcx75OMw4R7v+
 8Mws9Qr1GPdk4pO06bz0YDj7fCLqyh60fJeW/Q0eTAxs/+dqrSGhBNuqGmkGedbdTZu8
 BlFQ==
X-Gm-Message-State: APjAAAW63Dlb7/LTXZb2Z2EJ6Lgf99gUSWG/LnZ7FNJ+MdMeKwQYELwt
 RsWfAFApYh7JDWW1sg0zIto=
X-Google-Smtp-Source: APXvYqx5HEYOOKj17WOjpHfej7IR0stg4M9N33BijqyltbIcvvGw/fAGwTaDYmBqCJtH+96hGBCUwQ==
X-Received: by 2002:a63:f941:: with SMTP id q1mr7855384pgk.350.1562897191764; 
 Thu, 11 Jul 2019 19:06:31 -0700 (PDT)
Received: from localhost ([220.240.228.224])
 by smtp.gmail.com with ESMTPSA id f12sm6336662pgo.85.2019.07.11.19.06.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 19:06:30 -0700 (PDT)
Date: Fri, 12 Jul 2019 12:03:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 7/8] KVM: PPC: Ultravisor: Enter a secure guest
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-8-cclaudio@linux.ibm.com>
In-Reply-To: <20190628200825.31049-8-cclaudio@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562896723.n2w6yyxx6b.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Claudio Carvalho's on June 29, 2019 6:08 am:
> From: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
>=20
> To enter a secure guest, we have to go through the ultravisor, therefore
> we do a ucall when we are entering a secure guest.
>=20
> This change is needed for any sort of entry to the secure guest from the
> hypervisor, whether it is a return from an hcall, a return from a
> hypervisor interrupt, or the first time that a secure guest vCPU is run.
>=20
> If we are returning from an hcall, the results are already in the
> appropriate registers R3:12, except for R3, R6 and R7. R3 has the status
> of the reflected hcall, therefore we move it to R0 for the ultravisor and
> set R3 to the UV_RETURN ucall number. R6,7 were used as temporary
> registers, hence we restore them.
>=20
> Have fast_guest_return check the kvm_arch.secure_guest field so that a
> new CPU enters UV when started (in response to a RTAS start-cpu call).
>=20
> Thanks to input from Paul Mackerras, Ram Pai and Mike Anderson.
>=20
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> [ Pass SRR1 in r11 for UV_RETURN, fix kvmppc_msr_interrupt to preserve
>   the MSR_S bit ]
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> [ Fix UV_RETURN ucall number and arch.secure_guest check ]
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [ Save the actual R3 in R0 for the ultravisor and use R3 for the
>   UV_RETURN ucall number. Update commit message and ret_to_ultra comment =
]
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kvm_host.h       |  1 +
>  arch/powerpc/include/asm/ultravisor-api.h |  1 +
>  arch/powerpc/kernel/asm-offsets.c         |  1 +
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 40 +++++++++++++++++++----
>  4 files changed, 37 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/a=
sm/kvm_host.h
> index 013c76a0a03e..184becb62ea4 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -294,6 +294,7 @@ struct kvm_arch {
>  	cpumask_t cpu_in_guest;
>  	u8 radix;
>  	u8 fwnmi_enabled;
> +	u8 secure_guest;
>  	bool threads_indep;
>  	bool nested_enable;
>  	pgd_t *pgtable;
> diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/inc=
lude/asm/ultravisor-api.h
> index 141940771add..7c4d0b4ced12 100644
> --- a/arch/powerpc/include/asm/ultravisor-api.h
> +++ b/arch/powerpc/include/asm/ultravisor-api.h
> @@ -19,5 +19,6 @@
> =20
>  /* opcodes */
>  #define UV_WRITE_PATE			0xF104
> +#define UV_RETURN			0xF11C
> =20
>  #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-=
offsets.c
> index 8e02444e9d3d..44742724513e 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -508,6 +508,7 @@ int main(void)
>  	OFFSET(KVM_VRMA_SLB_V, kvm, arch.vrma_slb_v);
>  	OFFSET(KVM_RADIX, kvm, arch.radix);
>  	OFFSET(KVM_FWNMI, kvm, arch.fwnmi_enabled);
> +	OFFSET(KVM_SECURE_GUEST, kvm, arch.secure_guest);
>  	OFFSET(VCPU_DSISR, kvm_vcpu, arch.shregs.dsisr);
>  	OFFSET(VCPU_DAR, kvm_vcpu, arch.shregs.dar);
>  	OFFSET(VCPU_VPA, kvm_vcpu, arch.vpa.pinned_addr);
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/b=
ook3s_hv_rmhandlers.S
> index cffb365d9d02..89813ca987c2 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -36,6 +36,7 @@
>  #include <asm/asm-compat.h>
>  #include <asm/feature-fixups.h>
>  #include <asm/cpuidle.h>
> +#include <asm/ultravisor-api.h>
> =20
>  /* Sign-extend HDEC if not on POWER9 */
>  #define EXTEND_HDEC(reg)			\
> @@ -1092,16 +1093,12 @@ BEGIN_FTR_SECTION
>  END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> =20
>  	ld	r5, VCPU_LR(r4)
> -	ld	r6, VCPU_CR(r4)
>  	mtlr	r5
> -	mtcr	r6
> =20
>  	ld	r1, VCPU_GPR(R1)(r4)
>  	ld	r2, VCPU_GPR(R2)(r4)
>  	ld	r3, VCPU_GPR(R3)(r4)
>  	ld	r5, VCPU_GPR(R5)(r4)
> -	ld	r6, VCPU_GPR(R6)(r4)
> -	ld	r7, VCPU_GPR(R7)(r4)
>  	ld	r8, VCPU_GPR(R8)(r4)
>  	ld	r9, VCPU_GPR(R9)(r4)
>  	ld	r10, VCPU_GPR(R10)(r4)

Just to try to be less arbitrary about things, could you use regs
adjacent to r4? Generally good because then it has a chance to get
our loads paired up (which may not help some CPUs).

Thanks,
Nick
=
