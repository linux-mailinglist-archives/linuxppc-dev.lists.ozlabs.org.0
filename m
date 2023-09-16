Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B9E7A2C97
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:40:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FV3wORLL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXKF6vtqz3dln
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:40:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FV3wORLL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3bpcezqykdj0pb7kg9dlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX721cp0z3dFB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:31:42 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c0cfc2b995so24152515ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824300; x=1695429100; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RPxwiI+CF5oY5axnD8PplP8rMTdwT2bOTUtJzDVfTIk=;
        b=FV3wORLL8l/lPSKFToJwOx1kN6i636saF/9SCbIm3LrZ4faEj7JjcHTrKT661jXQqj
         lBUYub+QipqM6YH7J5IY9I/ulPwakgNosV3/BNqxcfXwjD4YOczbYmUp9Cq4NKpuF6de
         p3o6SB4SKMbsMXieoGeetLCpia5mvxFG/0E5sqGVUKTsuH15YD2ptW8M4ng7G+fqHbGY
         V0Domo/TiYcNM9uCYdJCDszEgdQeYi6sgw2Byml8JPAVyYNc8rA+pLp8eToiqdbobzD6
         W2+vbd3YzCWCT9HRBry5i16f7J+JXuuQgryXQIhHhehwd8/0Sx5JyX/atmjSEn2cc7j0
         LRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824300; x=1695429100;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPxwiI+CF5oY5axnD8PplP8rMTdwT2bOTUtJzDVfTIk=;
        b=I2BCI0VNsJFCwbwLvZ35GvC6VBsVMIsRCAppMt/NB2DA5ePARsL81xJtfbZ0GS42BG
         XVxgTszCrEFdRIxzrh3YxSu/pJATRjkmgKInk6R1XEXHd/UcNvp3RliRyilnadpSxlht
         AoubIvoAVs5kt9ZoVJ+FFpC3qZ8zUwtQfIBOAQJiDQiamzXuvvNuislQrLgootjUzs+V
         mxh4Rh4C8gKoXb/R9vtI2FcN/wZgtN5gWmnQmgz05AfIS1/6YRY0ixfEhZQiRvpz5HpZ
         T2YfRO61kpFvpqF0CCEXinKt5Otdr77E1KHFBGcwh2vKUSkX2lNXBc2E2fPF68bvBhiK
         Vbng==
X-Gm-Message-State: AOJu0YygROvU6N0bBDBVpusf0MO5Y3ItzhwBc6iTs9qYzuU8hFyScw46
	g7aiaF7dVhouGxWDTlR0YMYYKjoUJ6E=
X-Google-Smtp-Source: AGHT+IHW1P62bdhU5bhLcOltXlUxrv9g7sIQXkfjHJs3Wzbb395eeX6g+RNXiUsvwMV2ESouovB/6KamMFU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2302:b0:1b8:a555:385d with SMTP id
 d2-20020a170903230200b001b8a555385dmr88540plh.9.1694824300497; Fri, 15 Sep
 2023 17:31:40 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:02 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-11-seanjc@google.com>
Subject: [PATCH 10/26] KVM: s390: Stop selecting and depending on HAVE_KVM
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

Now that nothing in s390 or architecture agnostic code consumes HAVE_KVM,
stop selecting it in s390.  This is one of several steps towards deleting
HAVE_KVM from the common KVM Kconfig.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/Kconfig     | 1 -
 arch/s390/kvm/Kconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index ae29e4392664..8a5dca0036d9 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -193,7 +193,6 @@ config S390
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_KRETPROBES
-	select HAVE_KVM
 	select HAVE_LIVEPATCH
 	select HAVE_MEMBLOCK_PHYS_MAP
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
index 459d536116a6..9056cee72945 100644
--- a/arch/s390/kvm/Kconfig
+++ b/arch/s390/kvm/Kconfig
@@ -19,7 +19,6 @@ if VIRTUALIZATION
 config KVM
 	def_tristate y
 	prompt "Kernel-based Virtual Machine (KVM) support"
-	depends on HAVE_KVM
 	select PREEMPT_NOTIFIERS
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
-- 
2.42.0.459.ge4e396fd5e-goog

