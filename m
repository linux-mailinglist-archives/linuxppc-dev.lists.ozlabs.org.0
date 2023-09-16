Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C72F7A2C8C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:37:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PHZoCmn+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXFF0Z2qz3dxh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PHZoCmn+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3zpcezqykdjuh3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX6t5ZwFz3dD7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:31:34 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d81a76a11eeso2349357276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824292; x=1695429092; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qo2m7xsYGxv0LvZBx1IOU3suTnYOrGiO/bIX70mqbME=;
        b=PHZoCmn+ucr8lNdT2Dg82/5eTJdmsodP0QDubeOyTUu7wwsPCsI4Zy7nrQKUkXeBes
         6BoxcGIoapt4D8WxC9iAOAdDeXk8L9mbmJBtabMdIi05hIx/HgrRiey+7clp0tNvCHQz
         2D3kLkjxQPobA1RYHp879yXHiQAdbLEvno4XxdjvD73XxBtvFVdPZ/iFlzTvJw2Xtda9
         iAqIwvF4I+OtXkY1QMjIvmrKt7PAio0aL3SCufm4Qf9JpKev9MWLOJOtifR4PV+9O12d
         bFm7woHG2Sbdx7xnmFalETSiQ4lkfkCBPymk2yJehGvaal5sD7ke5kPICkcPNpAD8DG4
         9q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824292; x=1695429092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qo2m7xsYGxv0LvZBx1IOU3suTnYOrGiO/bIX70mqbME=;
        b=WeA4vqpcWSs4ftEdKqFpSdDQXOM+tEaPvb+Lw1D5SuEsDzJr8DzpcEfD5SoInN9Eeu
         ShGI3K7ioztlEeVs6d+c6niuipjvUjrdcki0Nr9PL7X7H0bCOZJoOwZFoN0BKkOCACYW
         LUpcCd1UrE798nLyoLiY7S/DtlXfnVQCiBNs/6zx5yBtjfe3mi97wS1IVAADMpblJ/3o
         3lYBiCxLTVw7XoZ0+XixqO7i2e+ny1XjMhu1ElzVwkMjS7y955wNiHWj5xlHQsts1y/a
         P1fcoLsfhn3bRB28GDy9WXSFxZL1SIfLZVQV66pBoXFKQyrifSKOBdnh+WbR3OQ2buyx
         P8wQ==
X-Gm-Message-State: AOJu0Yy1VGc+d4bn3QwSc1IeN83bs2GfncsYvBff1ATlvEMGLpTXXtex
	pHCw/kNbVLHNMiRvcGwgsIjgPSd81jU=
X-Google-Smtp-Source: AGHT+IGldyHqJlNQwUdnpkugxOOkbUw+dVHZu9n7C9ywbITmCocjjVdCkDZmP9v50Lpi+O1mI86Ze95fAkM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d045:0:b0:d7e:afff:c8fa with SMTP id
 h66-20020a25d045000000b00d7eafffc8famr73977ybg.5.1694824292733; Fri, 15 Sep
 2023 17:31:32 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:30:58 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-7-seanjc@google.com>
Subject: [PATCH 06/26] KVM: Drop CONFIG_KVM_VFIO and just look at KVM+VFIO
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

Drop KVM's KVM_VFIO Kconfig, and instead compile in VFIO support if
and only if VFIO itself is enabled.  Similar to the recent change to have
VFIO stop looking at HAVE_KVM, compiling in support for talking to VFIO
just because the architecture supports VFIO is nonsensical.

This fixes a bug where RISC-V doesn't select KVM_VFIO, i.e. would silently
fail to do connect KVM and VFIO, even though RISC-V supports VFIO.  The
bug is benign as the only driver in all of Linux that actually uses the
KVM reference provided by VFIO is KVM-GT, which is x86/Intel specific.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/Kconfig   | 1 -
 arch/powerpc/kvm/Kconfig | 1 -
 arch/s390/kvm/Kconfig    | 1 -
 arch/x86/kvm/Kconfig     | 1 -
 virt/kvm/Kconfig         | 3 ---
 virt/kvm/Makefile.kvm    | 4 +++-
 virt/kvm/vfio.h          | 2 +-
 7 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 83c1e09be42e..2b5c332f157d 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -28,7 +28,6 @@ menuconfig KVM
 	select KVM_MMIO
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_XFER_TO_GUEST_WORK
-	select KVM_VFIO
 	select HAVE_KVM_EVENTFD
 	select HAVE_KVM_IRQFD
 	select HAVE_KVM_DIRTY_RING_ACQ_REL
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 902611954200..c4beb49c0eb2 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -22,7 +22,6 @@ config KVM
 	select PREEMPT_NOTIFIERS
 	select HAVE_KVM_EVENTFD
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
-	select KVM_VFIO
 	select IRQ_BYPASS_MANAGER
 	select HAVE_KVM_IRQ_BYPASS
 	select INTERVAL_TREE
diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
index 45fdf2a9b2e3..459d536116a6 100644
--- a/arch/s390/kvm/Kconfig
+++ b/arch/s390/kvm/Kconfig
@@ -31,7 +31,6 @@ config KVM
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_INVALID_WAKEUPS
 	select HAVE_KVM_NO_POLL
-	select KVM_VFIO
 	select INTERVAL_TREE
 	select MMU_NOTIFIER
 	help
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index ed90f148140d..0f01e5600b5f 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -45,7 +45,6 @@ config KVM
 	select HAVE_KVM_NO_POLL
 	select KVM_XFER_TO_GUEST_WORK
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
-	select KVM_VFIO
 	select INTERVAL_TREE
 	select HAVE_KVM_PM_NOTIFIER if PM
 	select KVM_GENERIC_HARDWARE_ENABLING
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 484d0873061c..f0be3b55cea6 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -59,9 +59,6 @@ config HAVE_KVM_MSI
 config HAVE_KVM_CPU_RELAX_INTERCEPT
        bool
 
-config KVM_VFIO
-       bool
-
 config HAVE_KVM_INVALID_WAKEUPS
        bool
 
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 2c27d5d0c367..29373b59d89a 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -6,7 +6,9 @@
 KVM ?= ../../../virt/kvm
 
 kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
-kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
+ifdef CONFIG_VFIO
+kvm-y += $(KVM)/vfio.o
+endif
 kvm-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
 kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
 kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
diff --git a/virt/kvm/vfio.h b/virt/kvm/vfio.h
index e130a4a03530..af475a323965 100644
--- a/virt/kvm/vfio.h
+++ b/virt/kvm/vfio.h
@@ -2,7 +2,7 @@
 #ifndef __KVM_VFIO_H
 #define __KVM_VFIO_H
 
-#ifdef CONFIG_KVM_VFIO
+#if IS_ENABLED(CONFIG_KVM) && IS_ENABLED(CONFIG_VFIO)
 int kvm_vfio_ops_init(void);
 void kvm_vfio_ops_exit(void);
 #else
-- 
2.42.0.459.ge4e396fd5e-goog

