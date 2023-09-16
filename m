Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9055C7A2CC3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:54:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cUA61XnS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXd33Lgwz3dkt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:54:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cUA61XnS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3jfcezqykdl4wierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX7h2XHhz3dKm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:32:16 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59beb3a8291so33638237b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824333; x=1695429133; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxFx3Fi7YuxuIuavK7ybnF2fqrq2iHl6ALoFtRauezE=;
        b=cUA61XnS3w4xLLy0r2fqRv6GBtRYc1tcEWPonaqqkg7uyahtaAv+7edYedWGHBvNQO
         QZ8igLuGBsaNSypivrK6rADCUgDy9es5EokyCE+CHrjvrOJds/yP3lneznXeozYNsNRb
         Cto3RkGCuVar3SvmKOjZ6kxfZkafF/p4dLhyKqNg5nvM9PCnMa9n/0gL1EmAtsujwhFH
         zXYGSb6i2R2PBmNixhoo7VDKZnLgbI07PTVZb0gN6nufqBKOICXMt9x1+XEurXQXEZ2j
         wJE1yn+rf0+7LlehNjFjD+oK1ObnfJ4Jta6HnHxZjOODTMVrruO0tzGk+hQD2ZcqimJN
         mcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824333; x=1695429133;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KxFx3Fi7YuxuIuavK7ybnF2fqrq2iHl6ALoFtRauezE=;
        b=ZmK2DhpZmZWOqp959RY+lA3CJUID0AWeB9nMDOWQZsZJf2uOlJ3AiydtKRumoGn+6+
         CyMhr+ciTyADeODvYbshiA0o1U7saoFJnAMa2s4/K+Y5C9Fe+zBEfJf2eM9zSctw1k66
         q1g2iiiL9VuPJwm04cPv7O1Hs9T2fUZcuwDIhQKvKQiJwW0PDJYSo4sI+SLorQUrPLFi
         EFMsYBnTcnkGhwNxgFKdHlt1GoxNPNqXjw6VyHGF290mBuGWCjH0w3+fFWpKqGULI/GX
         L4roqKZBigu8CxIIjhTDodqTRCPpyHUHJ7y2P9BqZD7FrvddpTapBwrIhLbSTv0pJn0d
         5KLw==
X-Gm-Message-State: AOJu0Yw1bPqwJITBCS7YGsM5CH8hSFfNXI51L2GECrOshHAzIIEzKGrc
	PNo/K4JLMGiugGsMvaWpGDCLPFYH99s=
X-Google-Smtp-Source: AGHT+IEXzS/r4n0jWXYqmldfe2JXkH8I7F6JhHKmdXW7QQez9wS/RPm4WWzKr0H7Mg/fmcjRSnqE67DRs+k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:aa24:0:b0:d81:43c7:61ed with SMTP id
 s33-20020a25aa24000000b00d8143c761edmr78301ybi.5.1694824333108; Fri, 15 Sep
 2023 17:32:13 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:18 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-27-seanjc@google.com>
Subject: [PATCH 26/26] KVM: Hide KVM internal data structures and values from
 kernel at-large
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Venkatesh Srinivas <venkateshs@chromium.org>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Thornton <andrewth@google.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wrap all KVM internal APIs, data structures, values, etc. in public
headers with "#ifdef __KVM__" to effectively hide KVM's internal details
from other subsystems and the kernel at-large.  Hiding KVM details for
all architectures will, in the very distant future, allow loading a new
(or old) KVM module without needing to rebuild and reboot the entire
kernel, or to even allow loading and running multiple versions of KVM
simultaneously on a single host.

To allow different instances of KVM modules to freely modify KVM data
structures, enums, #defines, etc., e.g. the struct kvm_vcpu layout, there
must be exactly zero dereferences of KVM-defined structures/values in
non-KVM code (excepting code for architectures that don't support such
shenanigans).  Any such references could lead to latent bugs, e.g. as the
kernel would think a KVM structure has layout X, but in reality the
current incarnation of KVM uses layout Y.

In KVM x86, all remaining non-KVM references to KVM details have been now
eliminated.  To harden KVM against new references being introduced, hide
KVM's details to ensure that KVM doesn=E2=80=99t create a de facto ABI with=
 the
rest of the kernel.

Use #ifdeffery to hide KVM details as doing so requires, by far, the least
amount of churn and impact on architectures that freely share select KVM
details with the rest of the kernel, e.g. s390, ARM64 and PPC, have
significant usage of KVM-defined APIs, structures, values, etc.  E.g.
attempting to extract the "private" chunks into dedicated KVM-internal
headers would require massive churn, even on x86, and it's not obvious the
end result would be a net positive (all attempts at moving code around
failed long before getting anywhere near compiling cleanly).

Another (bad) alternative that would be relative churn-free would be to
move the KVM headers to a dedicated KVM-specific path while maintaining
the generic layout, e.g. something like virt/kvm/include/linux.  That
would allow x86 to simply omit the KVM-specific include path.  But that
would require modifying the global include path, i.e. would make KVM a
really special snowflake and set the awful precedent that it's "ok" to
add subsystem specific directories to the global include path.

Grant exceptions to asm-offsets.c as needed, and to s390's VFIO AP driver.
Creating a KVM-specific asm-offsets, as was done for x86, adds no value
(x86 did so to avoid exposing vendor specific headers) and doesn't create
much of a "slippery slope" risk.  s390's VFIO AP driver on the other hand
is simply too intertwined with KVM to realistically treat it as anything
other than KVM code, despite it living in crypto drivers, e.g. the driver
has some rather crazy lock ordering rules between the device and KVM.

Add a static assert that __KVM__ is defined in trace/events/kvm.h, as that
is effectively a private KVM header that just happens to live in a public
path.

Shuffle a few PPC includes and an s390 declaration as needed, and
opportunistically include kvm_host.h in trace/events.kvm.h instead of
relying on the parent to provide the right includes.

Cc: Anish Ghulati <aghulati@google.com>
Cc: Venkatesh Srinivas <venkateshs@chromium.org>
Cc: Andrew Thornton <andrewth@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h     | 3 +++
 arch/arm64/include/asm/kvm_host.h        | 2 ++
 arch/arm64/include/asm/kvm_mmu.h         | 4 ++++
 arch/arm64/kernel/asm-offsets.c          | 2 ++
 arch/arm64/kvm/hyp/Makefile              | 2 +-
 arch/arm64/kvm/hyp/nvhe/Makefile         | 3 ++-
 arch/arm64/kvm/hyp/vhe/Makefile          | 2 +-
 arch/mips/include/asm/kvm_host.h         | 2 ++
 arch/mips/kernel/asm-offsets.c           | 2 ++
 arch/powerpc/include/asm/kvm_book3s.h    | 3 +++
 arch/powerpc/include/asm/kvm_book3s_64.h | 2 ++
 arch/powerpc/include/asm/kvm_booke.h     | 4 ++++
 arch/powerpc/include/asm/kvm_host.h      | 7 ++++---
 arch/powerpc/include/asm/kvm_ppc.h       | 2 ++
 arch/powerpc/kernel/asm-offsets.c        | 1 +
 arch/riscv/include/asm/kvm_host.h        | 3 +++
 arch/riscv/kernel/asm-offsets.c          | 1 +
 arch/s390/include/asm/kvm_host.h         | 7 +++++--
 arch/s390/kernel/asm-offsets.c           | 1 +
 arch/x86/include/asm/kvm_host.h          | 3 +++
 drivers/s390/crypto/vfio_ap_drv.c        | 1 +
 drivers/s390/crypto/vfio_ap_ops.c        | 2 ++
 include/linux/kvm_host.h                 | 4 ++++
 include/linux/kvm_types.h                | 3 +++
 include/trace/events/kvm.h               | 5 +++++
 virt/kvm/Makefile.kvm                    | 2 +-
 26 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/=
kvm_emulate.h
index 3d6725ff0bf6..5861fa00763b 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -21,6 +21,8 @@
 #include <asm/cputype.h>
 #include <asm/virt.h>
=20
+#ifdef __KVM__
+
 #define CURRENT_EL_SP_EL0_VECTOR	0x0
 #define CURRENT_EL_SP_ELx_VECTOR	0x200
 #define LOWER_EL_AArch64_VECTOR		0x400
@@ -615,4 +617,5 @@ static __always_inline void kvm_reset_cptr_el2(struct k=
vm_vcpu *vcpu)
=20
 	kvm_write_cptr_el2(val);
 }
+#endif /* __KVM__ */
 #endif /* __ARM64_KVM_EMULATE_H__ */
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm=
_host.h
index 89b40c34f0af..ba4065db5d5c 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -93,6 +93,7 @@ static inline bool kvm_pmu_counter_deferred(struct perf_e=
vent_attr *attr)
 	return (!has_vhe() && attr->exclude_host);
 }
=20
+#ifdef __KVM__
 DECLARE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
=20
 extern unsigned int __ro_after_init kvm_sve_max_vl;
@@ -1149,4 +1150,5 @@ int kvm_trng_call(struct kvm_vcpu *vcpu);
 void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
 bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
=20
+#endif /* __KVM__ */
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_=
mmu.h
index 96a80e8f6226..9d8c92cda3b6 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -125,6 +125,8 @@ void kvm_update_va_mask(struct alt_instr *alt,
 void kvm_compute_layout(void);
 void kvm_apply_hyp_relocations(void);
=20
+#ifdef __KVM__
+
 #define __hyp_pa(x) (((phys_addr_t)(x)) + hyp_physvirt_offset)
=20
 static __always_inline unsigned long __kern_hyp_va(unsigned long v)
@@ -314,5 +316,7 @@ static inline struct kvm *kvm_s2_mmu_to_kvm(struct kvm_=
s2_mmu *mmu)
 {
 	return container_of(mmu->arch, struct kvm, arch);
 }
+
+#endif /* __KVM__ */
 #endif /* __ASSEMBLY__ */
 #endif /* __ARM64_KVM_MMU_H__ */
diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offset=
s.c
index 5ff1942b04fc..dc02ea9a002c 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -7,6 +7,8 @@
  * Copyright (C) 2012 ARM Ltd.
  */
=20
+#define __KVM__
+
 #include <linux/arm_sdei.h>
 #include <linux/sched.h>
 #include <linux/ftrace.h>
diff --git a/arch/arm64/kvm/hyp/Makefile b/arch/arm64/kvm/hyp/Makefile
index 4ce8c86967b5..99982b75671a 100644
--- a/arch/arm64/kvm/hyp/Makefile
+++ b/arch/arm64/kvm/hyp/Makefile
@@ -5,6 +5,6 @@
=20
 incdir :=3D $(srctree)/$(src)/include
 subdir-asflags-y :=3D -I$(incdir) -I$(srctree)/arch/arm64/kvm
-subdir-ccflags-y :=3D -I$(incdir) -I$(srctree)/arch/arm64/kvm
+subdir-ccflags-y :=3D -I$(incdir) -I$(srctree)/arch/arm64/kvm -D__KVM__
=20
 obj-$(CONFIG_KVM) +=3D vhe/ nvhe/ pgtable.o
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Mak=
efile
index 2250253a6429..b5f4750fa16e 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -9,7 +9,8 @@ asflags-y :=3D -D__KVM_NVHE_HYPERVISOR__ -D__DISABLE_EXPORT=
S
 # there is no way to execute them and any such MMIO access from nVHE KVM
 # will explode instantly (Words of Marc Zyngier). So introduce a generic f=
lag
 # __DISABLE_TRACE_MMIO__ to disable MMIO tracing for nVHE KVM.
-ccflags-y :=3D -D__KVM_NVHE_HYPERVISOR__ -D__DISABLE_EXPORTS -D__DISABLE_T=
RACE_MMIO__
+ccflags-y :=3D -D__KVM_NVHE_HYPERVISOR__ -D__DISABLE_EXPORTS \
+	     -D__DISABLE_TRACE_MMIO__  -D__KVM__
 ccflags-y +=3D -fno-stack-protector	\
 	     -DDISABLE_BRANCH_PROFILING	\
 	     $(DISABLE_STACKLEAK_PLUGIN)
diff --git a/arch/arm64/kvm/hyp/vhe/Makefile b/arch/arm64/kvm/hyp/vhe/Makef=
ile
index 3b9e5464b5b3..54cd3c444102 100644
--- a/arch/arm64/kvm/hyp/vhe/Makefile
+++ b/arch/arm64/kvm/hyp/vhe/Makefile
@@ -4,7 +4,7 @@
 #
=20
 asflags-y :=3D -D__KVM_VHE_HYPERVISOR__
-ccflags-y :=3D -D__KVM_VHE_HYPERVISOR__
+ccflags-y :=3D -D__KVM_VHE_HYPERVISOR__ -D__KVM__
=20
 obj-y :=3D timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o
 obj-y +=3D ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.=
o \
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_h=
ost.h
index f8f63d0aa399..6fd7c998d7b9 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -25,6 +25,7 @@
 #include <asm/inst.h>
 #include <asm/mipsregs.h>
=20
+#ifdef __KVM__
 /* MIPS KVM register ids */
 #define MIPS_CP0_32(_R, _S)					\
 	(KVM_REG_MIPS_CP0 | KVM_REG_SIZE_U32 | (8 * (_R) + (_S)))
@@ -897,4 +898,5 @@ static inline void kvm_arch_vcpu_unblocking(struct kvm_=
vcpu *vcpu) {}
=20
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
=20
+#endif /* __KVM__ */
 #endif /* __MIPS_KVM_HOST_H__ */
diff --git a/arch/mips/kernel/asm-offsets.c b/arch/mips/kernel/asm-offsets.=
c
index d1b11f66f748..8a233bddfea0 100644
--- a/arch/mips/kernel/asm-offsets.c
+++ b/arch/mips/kernel/asm-offsets.c
@@ -9,6 +9,8 @@
  * Kevin Kissell, kevink@mips.com and Carsten Langgaard, carstenl@mips.com
  * Copyright (C) 2000 MIPS Technologies, Inc.
  */
+#define __KVM__
+
 #include <linux/compat.h>
 #include <linux/types.h>
 #include <linux/sched.h>
diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/a=
sm/kvm_book3s.h
index bbf5e2c5fe09..8880bc7c8a32 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -13,6 +13,8 @@
 #include <linux/kvm_host.h>
 #include <asm/kvm_book3s_asm.h>
=20
+#ifdef __KVM__
+
 struct kvmppc_bat {
 	u64 raw;
 	u32 bepi;
@@ -483,4 +485,5 @@ static inline u32 kvmppc_pack_vcpu_id(struct kvm *kvm, =
u32 id)
 	return packed_id;
 }
=20
+#endif /* __KVM__ */
 #endif /* __ASM_KVM_BOOK3S_H__ */
diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/includ=
e/asm/kvm_book3s_64.h
index d49065af08e9..a807716ccae6 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -16,6 +16,7 @@
 #include <asm/ppc-opcode.h>
 #include <asm/pte-walk.h>
=20
+#ifdef __KVM__
 /*
  * Structure for a nested guest, that is, for a guest that is managed by
  * one of our guests.
@@ -679,4 +680,5 @@ extern pte_t *find_kvm_nested_guest_pte(struct kvm *kvm=
, unsigned long lpid,
=20
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
=20
+#endif /* __KVM__ */
 #endif /* __ASM_KVM_BOOK3S_64_H__ */
diff --git a/arch/powerpc/include/asm/kvm_booke.h b/arch/powerpc/include/as=
m/kvm_booke.h
index 0c3401b2e19e..85ebc0314539 100644
--- a/arch/powerpc/include/asm/kvm_booke.h
+++ b/arch/powerpc/include/asm/kvm_booke.h
@@ -12,6 +12,8 @@
 #include <linux/types.h>
 #include <linux/kvm_host.h>
=20
+#ifdef __KVM__
+
 /*
  * Number of available lpids. Only the low-order 6 bits of LPID rgister ar=
e
  * implemented on e500mc+ cores.
@@ -105,4 +107,6 @@ static inline bool kvmppc_supports_magic_page(struct kv=
m_vcpu *vcpu)
 	return false;
 #endif
 }
+
+#endif /* __KVM__ */
 #endif /* __ASM_KVM_BOOKE_H__ */
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm=
/kvm_host.h
index 14ee0dece853..1e7a008ce085 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/types.h>
 #include <linux/kvm_types.h>
+#include <linux/mmu_notifier.h>
 #include <linux/threads.h>
 #include <linux/spinlock.h>
 #include <linux/kvm_para.h>
@@ -25,13 +26,14 @@
 #include <asm/cacheflush.h>
 #include <asm/hvcall.h>
 #include <asm/mce.h>
+#include <asm/cputhreads.h>
=20
+#ifdef __KVM__
 #define __KVM_HAVE_ARCH_VCPU_DEBUGFS
=20
 #define KVM_MAX_VCPUS		NR_CPUS
 #define KVM_MAX_VCORES		NR_CPUS
=20
-#include <asm/cputhreads.h>
=20
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 #include <asm/kvm_book3s_asm.h>		/* for MAX_SMT_THREADS */
@@ -60,8 +62,6 @@
 #define KVM_REQ_EPR_EXIT	KVM_ARCH_REQ(1)
 #define KVM_REQ_PENDING_TIMER	KVM_ARCH_REQ(2)
=20
-#include <linux/mmu_notifier.h>
-
 #define KVM_ARCH_WANT_MMU_NOTIFIER
=20
 #define HPTEG_CACHE_NUM			(1 << 15)
@@ -883,4 +883,5 @@ static inline void kvm_arch_sched_in(struct kvm_vcpu *v=
cpu, int cpu) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
=20
+#endif /* __KVM__ */
 #endif /* __POWERPC_KVM_HOST_H__ */
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/=
kvm_ppc.h
index ead2ad892ebc..03d9998d0111 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -183,6 +183,7 @@ static inline void kvmppc_clear_host_ipi(int cpu)
 static inline bool kvm_hv_mode_active(void)		{ return false; }
 #endif
=20
+#ifdef __KVM__
 /*
  * KVMPPC_INST_SW_BREAKPOINT is debug Instruction
  * for supporting software breakpoint.
@@ -1076,4 +1077,5 @@ static inline ulong kvmppc_get_ea_indexed(struct kvm_=
vcpu *vcpu, int ra, int rb)
 	return ea;
 }
=20
+#endif /* __KVM__ */
 #endif /* __POWERPC_KVM_PPC_H__ */
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-of=
fsets.c
index 9f14d95b8b32..872d44971536 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -8,6 +8,7 @@
  * compile this file to assembler, and then extract the
  * #defines from the assembly-language output.
  */
+#define __KVM__
=20
 #include <linux/compat.h>
 #include <linux/signal.h>
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm=
_host.h
index 1ebf20dfbaa6..a81ae8c4b739 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -22,6 +22,8 @@
 #include <asm/kvm_vcpu_timer.h>
 #include <asm/kvm_vcpu_pmu.h>
=20
+#ifdef __KVM__
+
 #define KVM_MAX_VCPUS			1024
=20
 #define KVM_HALT_POLL_NS_DEFAULT	500000
@@ -354,4 +356,5 @@ bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcp=
u, u64 mask);
 void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
=20
+#endif /* __KVM__ */
 #endif /* __RISCV_KVM_HOST_H__ */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offset=
s.c
index d6a75aac1d27..476263e78f39 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -5,6 +5,7 @@
  */
=20
 #define GENERATING_ASM_OFFSETS
+#define __KVM__
=20
 #include <linux/kbuild.h>
 #include <linux/mm.h>
diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_h=
ost.h
index 427f9528a7b6..9153420bb5ac 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -380,6 +380,10 @@ struct sie_page {
 	__u8 reserved700[2304];		/* 0x0700 */
 };
=20
+extern char sie_exit;
+
+#ifdef __KVM__
+
 struct kvm_vcpu_stat {
 	struct kvm_vcpu_stat_generic generic;
 	u64 exit_userspace;
@@ -1028,8 +1032,6 @@ static inline int sie64a(struct kvm_s390_sie_block *s=
ie_block, u64 *rsa)
 	return __sie64a(virt_to_phys(sie_block), sie_block, rsa);
 }
=20
-extern char sie_exit;
-
 bool kvm_s390_pv_is_protected(struct kvm *kvm);
 bool kvm_s390_pv_cpu_is_protected(struct kvm_vcpu *vcpu);
=20
@@ -1049,6 +1051,7 @@ static inline void kvm_arch_vcpu_unblocking(struct kv=
m_vcpu *vcpu) {}
=20
 #define __KVM_HAVE_ARCH_VM_FREE
 void kvm_arch_free_vm(struct kvm *kvm);
+#endif /* __KVM__ */
=20
 struct zpci_kvm_hook {
 	int (*kvm_register)(void *opaque, struct kvm *kvm);
diff --git a/arch/s390/kernel/asm-offsets.c b/arch/s390/kernel/asm-offsets.=
c
index fa5f6885c74a..22ed673871ee 100644
--- a/arch/s390/kernel/asm-offsets.c
+++ b/arch/s390/kernel/asm-offsets.c
@@ -6,6 +6,7 @@
  */
=20
 #define ASM_OFFSETS_C
+#define __KVM__
=20
 #include <linux/kbuild.h>
 #include <linux/kvm_host.h>
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_hos=
t.h
index 29db870dbaae..eda45a937666 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -37,6 +37,8 @@
 #include <asm/kvm_vcpu_regs.h>
 #include <asm/hyperv-tlfs.h>
=20
+#ifdef __KVM__
+
 #define __KVM_HAVE_ARCH_VCPU_DEBUGFS
=20
 #define KVM_MAX_VCPUS 1024
@@ -2229,4 +2231,5 @@ int memslot_rmap_alloc(struct kvm_memory_slot *slot, =
unsigned long npages);
  */
 #define KVM_EXIT_HYPERCALL_MBZ		GENMASK_ULL(31, 1)
=20
+#endif /* __KVM__ */
 #endif /* _ASM_X86_KVM_HOST_H */
diff --git a/drivers/s390/crypto/vfio_ap_drv.c b/drivers/s390/crypto/vfio_a=
p_drv.c
index a5ab03e42ff1..55744f0f4758 100644
--- a/drivers/s390/crypto/vfio_ap_drv.c
+++ b/drivers/s390/crypto/vfio_ap_drv.c
@@ -7,6 +7,7 @@
  * Author(s): Tony Krowiak <akrowiak@linux.ibm.com>
  *	      Pierre Morel <pmorel@linux.ibm.com>
  */
+#define __KVM__
=20
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_a=
p_ops.c
index 4db538a55192..0dd98f42e9d5 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -8,6 +8,8 @@
  *	      Halil Pasic <pasic@linux.ibm.com>
  *	      Pierre Morel <pmorel@linux.ibm.com>
  */
+#define __KVM__
+
 #include <linux/string.h>
 #include <linux/vfio.h>
 #include <linux/device.h>
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d520d6801070..f0afe549c0d6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -45,6 +45,8 @@
 #include <asm/kvm_host.h>
 #include <linux/kvm_dirty_ring.h>
=20
+#ifdef __KVM__
+
 #ifndef KVM_MAX_VCPU_IDS
 #define KVM_MAX_VCPU_IDS KVM_MAX_VCPUS
 #endif
@@ -2329,4 +2331,6 @@ static inline void kvm_account_pgtable_pages(void *vi=
rt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
=20
+#endif /* __KVM__ */
+
 #endif
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 6f4737d5046a..4804bce2a655 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -48,6 +48,8 @@ typedef u64            hfn_t;
=20
 typedef hfn_t kvm_pfn_t;
=20
+#ifdef __KVM__
+
 enum pfn_cache_usage {
 	KVM_GUEST_USES_PFN =3D BIT(0),
 	KVM_HOST_USES_PFN  =3D BIT(1),
@@ -123,4 +125,5 @@ struct kvm_vcpu_stat_generic {
=20
 #define KVM_STATS_NAME_SIZE	48
=20
+#endif /* __KVM__ */
 #endif /* __KVM_TYPES_H__ */
diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
index 3bd31ea23fee..aee85527bb74 100644
--- a/include/trace/events/kvm.h
+++ b/include/trace/events/kvm.h
@@ -2,8 +2,13 @@
 #if !defined(_TRACE_KVM_MAIN_H) || defined(TRACE_HEADER_MULTI_READ)
 #define _TRACE_KVM_MAIN_H
=20
+#include <linux/kvm_host.h>
 #include <linux/tracepoint.h>
=20
+#ifndef __KVM__
+static_assert(0, "Do not include trace/events/kvm.h from non-KVM code");
+#endif
+
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM kvm
=20
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index e85079ad245d..4de10d447ef3 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -3,7 +3,7 @@
 # Makefile for Kernel-based Virtual Machine module
 #
=20
-ccflags-y +=3D -I$(srctree)/$(src)
+ccflags-y +=3D -I$(srctree)/$(src) -D__KVM__
=20
 KVM ?=3D ../../../virt/kvm
=20
--=20
2.42.0.459.ge4e396fd5e-goog

