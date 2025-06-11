Return-Path: <linuxppc-dev+bounces-9270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0091FAD4743
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 02:11:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH5fR3GWQz30HB;
	Wed, 11 Jun 2025 10:10:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749600655;
	cv=none; b=JIxZ9QneIlXUNSjR9t6Sdcl/FiDHuWJXwEln+xU0hLYEIPg52N+XYf2mN7VDleDiEcEBiNjmRhSyRT/3DOwOEUS+iV1q9cWo6x38IrV9gpgk3bNX1h4Rz7vvdtG6n+EthrCzLdeR2e5tAMCYEjNmQrzjTPWLuIGoa18eGFPnqBB8DKsMuJ5ssTmfaMRrlJ//TPR1O33ol5oukQPS6jJBa9+AaDERIXgVDvGuvVyytckIsDi7Wsm13l3SX4ESFSbX+o2Wp1Jvjixq2UGDGlzq6aFmDAuyG6ov+sk6Yi2YngLRpmJeM5Iy5OIKL8aKIjbt9BzZAKNlXCRzTeAFMHYIpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749600655; c=relaxed/relaxed;
	bh=2yZMyl9DsHgqKNlFS7xPspHEMiNKaL3c340/uFTvPNQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LJXSOt/w4v+WWVIBewt3VdDukNFxqLp5V7JVTq1OumctxsyaoqCUjJXMpI5eatTJID1dZcGMhLl9NU7rfo3SuJM4bvkRNPz1HGJnX0fsbvlv8lpAC9Ujb/jHdprWF8p67w87Gi1FkvWjQ4ySFrGpw08Sv4wMkaVkcAHjNlGZmxRqFWI0uM+f6nHqehd74au7so2DRjA0kOsNkxzysXNwD+J9CADDc6ceSI0FT1LwJ2Kt+PunPBAnG+duXPJnuMTp4GgdXIuaT0A7zNkhHnAkiT9ILn1Uy2yn0fluehTjpb5K3tbM5yM+WTQ2x+bBrdh+Iz/92W+7BXmkEVMzvzHJ4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=o3klzfHF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3i8liaaykdio6so1xqu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=o3klzfHF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3i8liaaykdio6so1xqu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH5fP6frjz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 10:10:53 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3138e65efe2so2343929a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 17:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600652; x=1750205452; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2yZMyl9DsHgqKNlFS7xPspHEMiNKaL3c340/uFTvPNQ=;
        b=o3klzfHFGWOHWJnqGUtLlVqbRS5qpXtpAnJUOF0jDHQmUHigeygpR0m+QSYlUmnHYf
         bcUQOwg1VlMuZ00y0uf6WmVMYNvGz/qTTldVonNxdNhIYbhto8SATPfMDd+i1wM9axaV
         yjGAParvGE7QKLSGTg9R+IWGnmP4vk95/jw0IaVQcXM1ZhrDtjeq0drnp2zLiO7QJEoG
         pRMZB/J62aSaAZs9pYE4VzBkieLKklj5Jnv14xVJd/JZ4X7mtzI6JupLEdNA2zhlsRUx
         Wty5uoV3uEDVriXJKW1cTylRspHgXHe8dPq2x9JU+Rah2uHyUsV9c2mKIODYYTHYhO8H
         DLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600652; x=1750205452;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yZMyl9DsHgqKNlFS7xPspHEMiNKaL3c340/uFTvPNQ=;
        b=cRWGUprmP2McHM7X/Xri7uZlTVyYWmHhzQQkwuZGanqH2jd2FMowRu1Lx8AB+q6/12
         xYJ+zqzNiUu13abKWuMIXqz0TzdmF88W3R5pXDzqp3t++GT3HMmlUJOvrh+f06W03Y0V
         LVIka7URATYaghz+nnWbPDelZB9FwxIVftbkXHzaFm+qIvvL+2ZDlxhDh4oEHcOp6uaD
         fs2mhOeK9R+rUsdSqLhjwouvSRvC53xhLb+x5/SZrR6UNKOdI14WpB3cegvHYYpKkSUi
         DUeDiQBjDIUDTxzW1fFpSuwT0A377KNMDqQeouo9PwNoJV/N+wtUyFve3t0gTiloRr9m
         zGaw==
X-Forwarded-Encrypted: i=1; AJvYcCVenz9UUMsjkowuZNkm0WKpnDPg7E6yI1TsiRozC9Lm73rpT4rHqOEo7TBIGLb80HXWswWT/EBVF5JNQYo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxKm4xVEr7We7mKAXkMmGN6DGLkn8rhA1DbB2nUIG3xZantbSMd
	N/Ir/Nf4v0HTRDhWb1TPHD9DAHdgEE2dvo0SJ3t2jFL9/NhKIuviMR72wqEJWqrsm32ZvnqK8DC
	VIi8NoA==
X-Google-Smtp-Source: AGHT+IEQs2JsVTUXveb/V9I06jm4zaYAh3wZWMzb/QDiH8+SAZVfaf+ke/+9FbLvW15z7wPEbMAuKp579iM=
X-Received: from pjboh5.prod.google.com ([2002:a17:90b:3a45:b0:2fb:fa85:1678])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dc1:b0:313:28e7:af14
 with SMTP id 98e67ed59e1d1-313b1fdabadmr842732a91.19.1749600651929; Tue, 10
 Jun 2025 17:10:51 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 17:10:38 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-5-seanjc@google.com>
Subject: [PATCH 4/8] KVM: Move include/kvm/iodev.h to include/linux as kvm_iodev.h
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Move iodev.h, the last remaining holdout in include/kvm, to the standard
include/linux directory as kvm_iodev.h and delete include/kvm.

Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 MAINTAINERS                                | 1 -
 arch/arm64/include/asm/kvm_vgic.h          | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v2.c         | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c         | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio.c            | 2 +-
 arch/loongarch/include/asm/kvm_eiointc.h   | 2 +-
 arch/loongarch/include/asm/kvm_ipi.h       | 2 +-
 arch/loongarch/include/asm/kvm_pch_pic.h   | 2 +-
 arch/mips/include/asm/kvm_host.h           | 3 +--
 arch/powerpc/kvm/mpic.c                    | 2 +-
 arch/riscv/kvm/aia_aplic.c                 | 2 +-
 arch/riscv/kvm/aia_imsic.c                 | 2 +-
 arch/x86/kvm/i8254.h                       | 2 +-
 arch/x86/kvm/ioapic.h                      | 2 +-
 arch/x86/kvm/irq.h                         | 2 +-
 arch/x86/kvm/lapic.h                       | 2 +-
 include/{kvm/iodev.h => linux/kvm_iodev.h} | 0
 virt/kvm/coalesced_mmio.c                  | 3 +--
 virt/kvm/eventfd.c                         | 2 +-
 virt/kvm/kvm_main.c                        | 3 +--
 20 files changed, 18 insertions(+), 22 deletions(-)
 rename include/{kvm/iodev.h => linux/kvm_iodev.h} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10cf54c8f727..a2cd432273e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13011,7 +13011,6 @@ W:	http://www.linux-kvm.org
 T:	git git://git.kernel.org/pub/scm/virt/kvm/kvm.git
 F:	Documentation/virt/kvm/
 F:	include/asm-generic/kvm*
-F:	include/kvm/iodev.h
 F:	include/linux/kvm*
 F:	include/trace/events/kvm.h
 F:	include/uapi/asm-generic/kvm*
diff --git a/arch/arm64/include/asm/kvm_vgic.h b/arch/arm64/include/asm/kvm_vgic.h
index 4a34f7f0a864..09d7f628fa3b 100644
--- a/arch/arm64/include/asm/kvm_vgic.h
+++ b/arch/arm64/include/asm/kvm_vgic.h
@@ -14,7 +14,7 @@
 #include <linux/static_key.h>
 #include <linux/types.h>
 #include <linux/xarray.h>
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 #include <linux/list.h>
 #include <linux/jump_label.h>
 
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v2.c b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
index d00c8a74fad6..889440a8b129 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
@@ -6,9 +6,9 @@
 #include <linux/irqchip/arm-gic.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/nospec.h>
 
-#include <kvm/iodev.h>
 #include <asm/kvm_vgic.h>
 
 #include "vgic.h"
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 505d4e389885..db95d3ccbd14 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -7,8 +7,8 @@
 #include <linux/irqchip/arm-gic-v3.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/interrupt.h>
-#include <kvm/iodev.h>
 
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_arm.h>
diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index ec1b13abc728..de689e0e881f 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -9,7 +9,7 @@
 #include <linux/irq.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 #include <asm/kvm_arch_timer.h>
 #include <asm/kvm_vgic.h>
 
diff --git a/arch/loongarch/include/asm/kvm_eiointc.h b/arch/loongarch/include/asm/kvm_eiointc.h
index a3a40aba8acf..0049b0b79477 100644
--- a/arch/loongarch/include/asm/kvm_eiointc.h
+++ b/arch/loongarch/include/asm/kvm_eiointc.h
@@ -6,7 +6,7 @@
 #ifndef __ASM_KVM_EIOINTC_H
 #define __ASM_KVM_EIOINTC_H
 
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 
 #define EIOINTC_IRQS			256
 #define EIOINTC_ROUTE_MAX_VCPUS		256
diff --git a/arch/loongarch/include/asm/kvm_ipi.h b/arch/loongarch/include/asm/kvm_ipi.h
index 060163dfb4a3..3956b230f087 100644
--- a/arch/loongarch/include/asm/kvm_ipi.h
+++ b/arch/loongarch/include/asm/kvm_ipi.h
@@ -6,7 +6,7 @@
 #ifndef __ASM_KVM_IPI_H
 #define __ASM_KVM_IPI_H
 
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 
 #define LARCH_INT_IPI			12
 
diff --git a/arch/loongarch/include/asm/kvm_pch_pic.h b/arch/loongarch/include/asm/kvm_pch_pic.h
index e6df6a4c1c70..4b37e3134e52 100644
--- a/arch/loongarch/include/asm/kvm_pch_pic.h
+++ b/arch/loongarch/include/asm/kvm_pch_pic.h
@@ -6,7 +6,7 @@
 #ifndef __ASM_KVM_PCH_PIC_H
 #define __ASM_KVM_PCH_PIC_H
 
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 
 #define PCH_PIC_SIZE			0x3e8
 
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index c14b10821817..0d7dd89ca5bf 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/types.h>
 #include <linux/kvm.h>
+#include <linux/kvm_iodev.h>
 #include <linux/kvm_types.h>
 #include <linux/threads.h>
 #include <linux/spinlock.h>
@@ -24,8 +25,6 @@
 #include <asm/inst.h>
 #include <asm/mipsregs.h>
 
-#include <kvm/iodev.h>
-
 /* MIPS KVM register ids */
 #define MIPS_CP0_32(_R, _S)					\
 	(KVM_REG_MIPS_CP0 | KVM_REG_SIZE_U32 | (8 * (_R) + (_S)))
diff --git a/arch/powerpc/kvm/mpic.c b/arch/powerpc/kvm/mpic.c
index 23e9c2bd9f27..b25a03251544 100644
--- a/arch/powerpc/kvm/mpic.c
+++ b/arch/powerpc/kvm/mpic.c
@@ -26,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/errno.h>
 #include <linux/fs.h>
 #include <linux/anon_inodes.h>
@@ -33,7 +34,6 @@
 #include <asm/mpic.h>
 #include <asm/kvm_para.h>
 #include <asm/kvm_ppc.h>
-#include <kvm/iodev.h>
 
 #define MAX_CPU     32
 #define MAX_SRC     256
diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index f59d1c0c8c43..bf163724aec5 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -9,10 +9,10 @@
 
 #include <linux/irqchip/riscv-aplic.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/math.h>
 #include <linux/spinlock.h>
 #include <linux/swab.h>
-#include <kvm/iodev.h>
 
 struct aplic_irq {
 	raw_spinlock_t lock;
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 29ef9c2133a9..ae3c0807baa9 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -11,10 +11,10 @@
 #include <linux/bitmap.h>
 #include <linux/irqchip/riscv-imsic.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/math.h>
 #include <linux/spinlock.h>
 #include <linux/swab.h>
-#include <kvm/iodev.h>
 #include <asm/csr.h>
 
 #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
diff --git a/arch/x86/kvm/i8254.h b/arch/x86/kvm/i8254.h
index a768212ba821..4de7a0b88e4f 100644
--- a/arch/x86/kvm/i8254.h
+++ b/arch/x86/kvm/i8254.h
@@ -4,7 +4,7 @@
 
 #include <linux/kthread.h>
 
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 
 struct kvm_kpit_channel_state {
 	u32 count; /* can be 65536 */
diff --git a/arch/x86/kvm/ioapic.h b/arch/x86/kvm/ioapic.h
index aa8cb4ac0479..cb36c36affd3 100644
--- a/arch/x86/kvm/ioapic.h
+++ b/arch/x86/kvm/ioapic.h
@@ -3,7 +3,7 @@
 #define __KVM_IO_APIC_H
 
 #include <linux/kvm_host.h>
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 #include "irq.h"
 
 struct kvm;
diff --git a/arch/x86/kvm/irq.h b/arch/x86/kvm/irq.h
index 76d46b2f41dd..b21b03aa2ee7 100644
--- a/arch/x86/kvm/irq.h
+++ b/arch/x86/kvm/irq.h
@@ -13,9 +13,9 @@
 #include <linux/mm_types.h>
 #include <linux/hrtimer.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/spinlock.h>
 
-#include <kvm/iodev.h>
 #include "lapic.h"
 
 #define PIC_NUM_PINS 16
diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 4ce30db65828..43ffbded5f72 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -2,7 +2,7 @@
 #ifndef __KVM_X86_LAPIC_H
 #define __KVM_X86_LAPIC_H
 
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 
 #include <linux/kvm_host.h>
 
diff --git a/include/kvm/iodev.h b/include/linux/kvm_iodev.h
similarity index 100%
rename from include/kvm/iodev.h
rename to include/linux/kvm_iodev.h
diff --git a/virt/kvm/coalesced_mmio.c b/virt/kvm/coalesced_mmio.c
index 375d6285475e..d0f84e3611da 100644
--- a/virt/kvm/coalesced_mmio.c
+++ b/virt/kvm/coalesced_mmio.c
@@ -9,8 +9,7 @@
  *
  */
 
-#include <kvm/iodev.h>
-
+#include <linux/kvm_iodev.h>
 #include <linux/kvm_host.h>
 #include <linux/slab.h>
 #include <linux/kvm.h>
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 11e5d1e3f12e..35786d59b233 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -26,7 +26,7 @@
 #include <linux/irqbypass.h>
 #include <trace/events/kvm.h>
 
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 
 #ifdef CONFIG_HAVE_KVM_IRQCHIP
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index eec82775c5bf..a401ba32ecaa 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -10,9 +10,8 @@
  *   Yaniv Kamay  <yaniv@qumranet.com>
  */
 
-#include <kvm/iodev.h>
-
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/kvm.h>
 #include <linux/module.h>
 #include <linux/errno.h>
-- 
2.50.0.rc0.642.g800a2b2222-goog


