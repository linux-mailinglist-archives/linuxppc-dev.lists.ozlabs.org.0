Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1517A2C90
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:38:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UD0lbaDh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXHF3RXJz3dWY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:38:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=UD0lbaDh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3apcezqykdjkl73gc59hh9e7.5hfebgnqii5-67oeblml.hse34l.hk9@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX6y2sSpz3cPf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:31:38 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d81a47e12b5so2554455276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824296; x=1695429096; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2bGNmVCdNvvogzEXgW0zNdAXreJziaadtBBldNfFmhI=;
        b=UD0lbaDhV+DvOUSemEuCCQU9y3Jgbz7meZQoMJ34e/43dn5bQ3UvrLXaFDKXgY8mTg
         bvxE6Hpa1+ljnDZPLyG6KKY7d9Np3oY5RPcz6GYMTK2ItkMSpRA+4jFOMc1zSGSBESPB
         cX2Y8Wezp95Eitbp0iRRI2sgjYLDAIBwyGkBpH8NNqWvRFE24rOW/qMsn6H5DwIC81cY
         ZUuEuLC6v3Nrnm/UDfUiQckqZNL4dS4KxcOHQxuzKq7tcOCdudXfWeE0CSaOY7uA6jg1
         ujgKr9bpnpCU1pymLwkcOZi5g9T26Wgr1y53Xq+LGF0lNFtGGLw4QWqfbT6ykhsuA36q
         1pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824296; x=1695429096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bGNmVCdNvvogzEXgW0zNdAXreJziaadtBBldNfFmhI=;
        b=ImwyFuGgP8rJe2nCmQAv0dpa5USzI6PYB69xcGQXrTL2Ea5U7RSDvGUG4dy2GY/vAF
         N195Yew9M3oZawAw74plD2T1yS76RGTqmJF0cLbZRPQDwTox4MQf4fKCF2MZk3Qqa3Ov
         1gelXgdknGcu9HGhaT9eyT27VhRiMCTQweIQkaQEZLoMg9+FUpnE6p4CTrtmazTutg3l
         ggMK2rZnbq7cI9lBl0nQm3b+3YjmzEqO9WS5OAdWFc48eeH8yqejKhCwbzUupdgK9KHf
         1DwteeYjEmJoTLTvifhr3sqskL8aRnAou7H7vwulOAauTiyfLPRvvZ5iA2rK//X/LNpL
         kTCw==
X-Gm-Message-State: AOJu0Yx8YRniz/hAhpNe9dHaoh68eYSGiFLSkjiQD5ZHuUlstnSgjsWb
	yiK7cMqNMGUL8JIOnoBxPdYsW+KtO48=
X-Google-Smtp-Source: AGHT+IEii4782d+JzWBACVp4gsfxYcFW3PZ67SLHnb796XbOz2rrTeQdE9Xb83Qlv7LO8McNRbBpWAwnK1E=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2982:0:b0:d05:98ef:c16b with SMTP id
 p124-20020a252982000000b00d0598efc16bmr77753ybp.5.1694824296181; Fri, 15 Sep
 2023 17:31:36 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:00 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-9-seanjc@google.com>
Subject: [PATCH 08/26] KVM: x86: Stop selecting and depending on HAVE_KVM
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

Now that nothing in x86 or architecture agnostic code consumes HAVE_KVM,
stop selecting it in x86.  This is one of several steps towards deleting
HAVE_KVM from the common KVM Kconfig.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/Kconfig     | 1 -
 arch/x86/kvm/Kconfig | 2 --
 2 files changed, 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 982b777eadc7..32eb288a4e3a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -240,7 +240,6 @@ config X86
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_KRETPROBES
 	select HAVE_RETHOOK
-	select HAVE_KVM
 	select HAVE_LIVEPATCH			if X86_64
 	select HAVE_MIXED_BREAKPOINTS_REGS
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 0f01e5600b5f..8c5fb7f57b4c 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -7,7 +7,6 @@ source "virt/kvm/Kconfig"
 
 menuconfig VIRTUALIZATION
 	bool "Virtualization"
-	depends on HAVE_KVM || X86
 	default y
 	help
 	  Say Y here to get to see options for using your Linux host to run other
@@ -20,7 +19,6 @@ if VIRTUALIZATION
 
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support"
-	depends on HAVE_KVM
 	depends on HIGH_RES_TIMERS
 	depends on X86_LOCAL_APIC
 	select PREEMPT_NOTIFIERS
-- 
2.42.0.459.ge4e396fd5e-goog

