Return-Path: <linuxppc-dev+bounces-9274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7060AD474A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 02:11:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH5fY5jZHz30Tf;
	Wed, 11 Jun 2025 10:11:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749600661;
	cv=none; b=jZ8sxDahYjYPorQ/bU2SN1/l6HmTnZKp9eO4oJqHh74V9cSr5njItKCFaj3eKnh+Li0PVLlSy4USH5sWmGvcOQaCCj88QsnrVyw1JWorzJASR8qohnFielhqWsAkmfTC5yuYHmGMF7N/7qO75mAihbY6ToOLBt3csdjcpr82NETY+1ShJH8lOtDB7WMpsIq4VL0CTZhVRHdvopw/5VaKpodBvLO8chICrPHzIi338sZPU2wpIp+xO+ifiLlGfpWH2cLF5Ry06R3HPbWZLZza3l60qSplPEczTWYLcKo2giIQkKwSUhC6EY4kmDNlbdtsjJZOetM1N6VPgtnR8UtEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749600661; c=relaxed/relaxed;
	bh=t+Mj+r8r7UAjF4+0LNUZhsvI8NJHwfinPsCt24LIifo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d7kQntnCsI/IKi+3eeeFquUn6QGTD9X3aZqO9LXu4w7DW0JiuGYb66maCNRJVSSNzVJhATsykijRmZ/4A02Lf5rW4775j8BGGn5IGTt66UqJZjreyM8Czw/vV8oxV0n9Ha3vEPX5vmZj8HpmZdkf1V7Fkdtq1Nn6LQHsTwcGjankPyar9//3kIddVF4pef6VSafFZMxh1BlIY34Iyc/tFwMbBVaP4xtscwszdjo7ZH9fzam+wr/l/LVWC9IcgCf5jDJgpBOtmEFf0rKx2nomNBJF3VBdHIs8k28oDIZO4iYAkj8wi5XtOE+MB/8PGtK9HsdgJRj3PvmKi79wY9vSGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zcE+CgFO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3k8liaaykdjie0w95y2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zcE+CgFO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3k8liaaykdjie0w95y2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH5fY099dz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 10:11:01 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-74834bc5d37so6092227b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 17:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600659; x=1750205459; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=t+Mj+r8r7UAjF4+0LNUZhsvI8NJHwfinPsCt24LIifo=;
        b=zcE+CgFOS1i2hIV5bi8xq/5kmdUf6o/tIfGJr0c5oas/e5aZOQhShqX3TC1wkQXpKB
         GVp3lP6WoFzxFpM+bUy0v6Es0U/fygzXvzCUUXPCw8YpmIAEtDnGpUEbZ/HcDB9WTxg+
         rx9eGrJVRAXoPOnpZ6I5mdvbn1TZoV2Dlbi0zrz/+9fX1t+Pc0LQOVuFpZ8rgap4R0lb
         9ZikK1RYEUWZd4elCUiXUrdlM34GCm7HHZf5Wz8Yzsjee2bUdJbryYsGicYWWYSqVJJM
         4Ec0JdNHfT1kUrxHKHeYx6uLCFl/Ya+jEw9FZMQMTwW7DY47QZ1KExgYGSxB8f3rUwtN
         NM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600659; x=1750205459;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+Mj+r8r7UAjF4+0LNUZhsvI8NJHwfinPsCt24LIifo=;
        b=MW3hsa5kxIxffoQ3sNvPXqaMF4vbNODV0h34jLPvqPinuFiM4Bn6sR0AOsXuANtzql
         b2WYo57tN/fduPo23Ft6eMgi2Sio6deQ+rDPdy4+Pa+/UMd1yy2QjQfZw6Nua9KEshJ3
         oL+YMopf/B0+XEJAnStKVJH4m2wcZ03gaZpKFyVyx+M62marbdYPMH+XTxv6Ilqde5//
         V7K8BaoUn6zXgxx3Ugk9AaKDIZdUuX1SItWAWgtfUtlZCd7LhADCV0EbWjXUMWpEWyPk
         IbWdxpUvPEbzq0YkSueVv+q0tvaiqxrMeSCHw7ibIagnydqiZ1V9bmFNzLZAC4fY4+Nf
         2MpA==
X-Forwarded-Encrypted: i=1; AJvYcCV5RTqF7zvyeTMchayMXXUW73ad7RacZ86A0R85layJOpbnxX7A9v+U3nWwMu4UF33dMMM9Rcclmvb4ja4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyv220A/6iRAru53WQlrioCaUfaxiecmSWU28CIsZUaojm86aVm
	R9RnVSEBa2WAwNpl0OM0ZVgNB8fhrzehiwurmu8KbTx9+QDcyu5rubG8mzMS0u1kBShSLBBZqL8
	Q3uNb4A==
X-Google-Smtp-Source: AGHT+IHdKstC+XlYUus8Wdm0HR7HPxHMBlUy5ahB8xm3L+Y1hmecIZTBPJ5vhN4Gi0qdwz1eVbXtQ9xfH68=
X-Received: from pgam16.prod.google.com ([2002:a05:6a02:2b50:b0:b2f:6348:f715])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9012:b0:1f5:8f7f:8f19
 with SMTP id adf61e73a8af0-21f8663f76dmr1960513637.10.1749600659002; Tue, 10
 Jun 2025 17:10:59 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 17:10:42 -0700
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
Message-ID: <20250611001042.170501-9-seanjc@google.com>
Subject: [PATCH 8/8] KVM: Standardize include paths across all architectures
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

Standardize KVM's include paths across all architectures by declaring
the KVM-specific includes in the common Makefile.kvm.  Having common KVM
"own" the included paths reduces the temptation to unnecessarily add
virt/kvm to arch include paths, and conversely if allowing arch code to
grab headers from virt/kvm becomes desirable, virt/kvm can be added to
all architecture's include path with a single line update.

Having the common KVM makefile append to ccflags also provides a
convenient location to append other things, e.g. KVM-specific #defines.

Note, this changes the behavior of s390 and PPC, as s390 and PPC
previously overwrote ccflags-y instead of adding on.  There is no evidence
that overwriting ccflags-y was necessary or even deliberate, as both s390
and PPC switched to the overwrite behavior without so much as a passing
mention when EXTRA_CFLAGS was replaced with ccflags-y (commit c73028a02887
("s390: change to new flag variable") and commit 4108d9ba9091
("powerpc/Makefiles: Change to new flag variables")).

Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/Makefile   | 2 --
 arch/mips/kvm/Makefile    | 2 --
 arch/powerpc/kvm/Makefile | 2 --
 arch/riscv/kvm/Makefile   | 2 --
 arch/s390/kvm/Makefile    | 2 --
 arch/x86/kvm/Makefile     | 1 -
 virt/kvm/Makefile.kvm     | 2 ++
 7 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 7c329e01c557..86035b311269 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y += -I $(src)
-
 include $(srctree)/virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 96a7cd21b140..d198e1addea7 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -4,8 +4,6 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y += -Iarch/mips/kvm
-
 kvm-$(CONFIG_CPU_HAS_MSA) += msa.o
 
 kvm-y +=    mips.o emulate.o entry.o \
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 1a575db2666e..6f12edd465df 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y := -Iarch/powerpc/kvm
-
 include $(srctree)/virt/kvm/Makefile.kvm
 
 common-objs-y += powerpc.o emulate_loadstore.o
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 4e0bba91d284..dbe61a398cc8 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for RISC-V KVM support
 #
 
-ccflags-y += -I $(src)
-
 include $(srctree)/virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
index b742e08c036b..5cbcaa7f241a 100644
--- a/arch/s390/kvm/Makefile
+++ b/arch/s390/kvm/Makefile
@@ -5,8 +5,6 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y := -Iarch/s390/kvm
-
 kvm-y += kvm-s390.o intercept.o interrupt.o priv.o sigp.o
 kvm-y += diag.o gaccess.o guestdbg.o vsie.o pv.o gmap-vsie.o
 
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index a5d362c7b504..f78f11b582d2 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ccflags-y += -I $(srctree)/arch/x86/kvm
 ccflags-$(CONFIG_KVM_WERROR) += -Werror
 
 include $(srctree)/virt/kvm/Makefile.kvm
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 724c89af78af..0e7ba49026fc 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -3,6 +3,8 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
+ccflags-y += -I$(src)
+
 KVM ?= ../../../virt/kvm
 
 kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
-- 
2.50.0.rc0.642.g800a2b2222-goog


