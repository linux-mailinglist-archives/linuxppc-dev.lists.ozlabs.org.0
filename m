Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B484B8B809E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 21:34:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qgmB+jYl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTVkQ0tL6z3ck4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 05:34:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=qgmB+jYl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3m0cxzgykdl4wierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTVh65hhLz3bq0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 05:32:06 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5c670f70a37so6249125a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 12:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714505524; x=1715110324; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=teE05Ylose2pcYDprhAFOjLN/sOw6wgj1YwY4a/EgBU=;
        b=qgmB+jYlnTQa/m/koANNCIQQuZopXtbaq8YIM/2VHmvD1nJd6/hcKGhxfVpZNY6qXB
         CSEYdBF9lexNtJUq3ULB0OUwJMJKh60wuFXy7FxHkEAJbr505NGQMpvYB8BbXWBaDGg0
         WaXy3CV1zQEtt9Z0EKC23+m6RYLPeedoiKZ/Xvl1EXW//0E6S3X5hNSrMNQDGlXw00y8
         T2CtTT8HaGtoMueVRzpLh7D7D5Ppeo1rWoQqoWyM0HFQPTmiJNn6LAGkMy8RX+FgW/HS
         CE2dRMC6EXGgHVO8PNIkhX/AkSe+qeTQ68zhmwGvPUjxM486GpfhHLeWLWEYKk3K6eLs
         KxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714505524; x=1715110324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teE05Ylose2pcYDprhAFOjLN/sOw6wgj1YwY4a/EgBU=;
        b=i4Lo63AlCvkPGhSBtI3uPB2ezFoDLo+YwBLuoXde46HzJDsdk/CiIScqWjvMZCscnT
         SzIt2iwiRPMwM2kPcDwEpIdgugPGj45p/9w/VXWvvSWz69hsZpRKZcKsJL5f3h/kUyVC
         PwukNMRQdWzugU0mzOy1lci36+82sM+T5NMV+x+2nXZVMnhrbm5uoRkjP5RMLLChc1fy
         mhIzdAK2ACBMmeRYJTSMQiEX/KMcyFxXI2e1GhMhLK1bGFpTrPj3onpNREUC58ta9pQy
         fB5pwPct398Nm7S7zkI4vOZE8QWnD/wyWaZa1xFkowIXNUIWPdUXs4o1fTy0ntL4SKyN
         pGZA==
X-Forwarded-Encrypted: i=1; AJvYcCVBe+Tryd24ijc39FEgP7VYFkPweKUj3efkP3BVusRzOKqZOjGXb3jdcVXrdUBHyzcu4D0WH4KJEeZsZiGbEI4Ed2Ygh46Xty0CgltY4Q==
X-Gm-Message-State: AOJu0YyDrgraJrBxqFwWxDttInS+pSRq195rBIwSHKmGvfQB3fjoC4xB
	MOAzBaWRCh9yQzjYGzBz/htvIf6l4sWQ6OGjsPrt8R5dol+UNPRKwtSIByhTaYpoXBC4xuYYiU0
	73A==
X-Google-Smtp-Source: AGHT+IEbG2WGq5H7HJJ3oJz7X/vycBy/FzdcOadqmLeOQqQxGZZjzOUu53htbVlU23el0Z9xOdv4S0UMTZ0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:6a1:b0:5dc:5111:d8b1 with SMTP id
 ca33-20020a056a0206a100b005dc5111d8b1mr1313pgb.5.1714505523833; Tue, 30 Apr
 2024 12:32:03 -0700 (PDT)
Date: Tue, 30 Apr 2024 12:31:55 -0700
In-Reply-To: <20240430193157.419425-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240430193157.419425-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240430193157.419425-3-seanjc@google.com>
Subject: [PATCH 2/4] KVM: VMX: Move PLE grow/shrink helpers above vmx_vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move VMX's {grow,shrink}_ple_window() above vmx_vcpu_load() in preparation
of moving the sched_in logic, which handles shrinking the PLE window, into
vmx_vcpu_load().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 64 +++++++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 6780313914f8..cb36db7b6140 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1402,6 +1402,38 @@ static void vmx_write_guest_kernel_gs_base(struct vcpu_vmx *vmx, u64 data)
 }
 #endif
 
+static void grow_ple_window(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	unsigned int old = vmx->ple_window;
+
+	vmx->ple_window = __grow_ple_window(old, ple_window,
+					    ple_window_grow,
+					    ple_window_max);
+
+	if (vmx->ple_window != old) {
+		vmx->ple_window_dirty = true;
+		trace_kvm_ple_window_update(vcpu->vcpu_id,
+					    vmx->ple_window, old);
+	}
+}
+
+static void shrink_ple_window(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	unsigned int old = vmx->ple_window;
+
+	vmx->ple_window = __shrink_ple_window(old, ple_window,
+					      ple_window_shrink,
+					      ple_window);
+
+	if (vmx->ple_window != old) {
+		vmx->ple_window_dirty = true;
+		trace_kvm_ple_window_update(vcpu->vcpu_id,
+					    vmx->ple_window, old);
+	}
+}
+
 void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu,
 			struct loaded_vmcs *buddy)
 {
@@ -5871,38 +5903,6 @@ int vmx_vcpu_pre_run(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
-static void grow_ple_window(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	unsigned int old = vmx->ple_window;
-
-	vmx->ple_window = __grow_ple_window(old, ple_window,
-					    ple_window_grow,
-					    ple_window_max);
-
-	if (vmx->ple_window != old) {
-		vmx->ple_window_dirty = true;
-		trace_kvm_ple_window_update(vcpu->vcpu_id,
-					    vmx->ple_window, old);
-	}
-}
-
-static void shrink_ple_window(struct kvm_vcpu *vcpu)
-{
-	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	unsigned int old = vmx->ple_window;
-
-	vmx->ple_window = __shrink_ple_window(old, ple_window,
-					      ple_window_shrink,
-					      ple_window);
-
-	if (vmx->ple_window != old) {
-		vmx->ple_window_dirty = true;
-		trace_kvm_ple_window_update(vcpu->vcpu_id,
-					    vmx->ple_window, old);
-	}
-}
-
 /*
  * Indicate a busy-waiting vcpu in spinlock. We do not enable the PAUSE
  * exiting, so only get here on cpu with PAUSE-Loop-Exiting.
-- 
2.45.0.rc0.197.gbae5840b3b-goog

