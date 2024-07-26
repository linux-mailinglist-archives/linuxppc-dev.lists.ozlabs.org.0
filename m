Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9A593DC38
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:17:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0ZGdfqNM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4v72s97z3fp0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:17:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0ZGdfqNM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3dtekzgykdeg2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Mz32pGz3dWW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:51 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70d19a4137dso1423097b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038030; x=1722642830; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Xse5B7AOfcqAOlY7bR5VB/olShqjuvoHnQg+aILML2Y=;
        b=0ZGdfqNMc7/c0a4qPYlIn0RA4zrXDs7ZAgcYudLFh5TmOCPCr5ZBqiHkyubCaZNZwG
         Zhq11mzQwc95aUiyZYSZDlpUGrbb+0Xj1I1KLG39TFukqz3SzU6v1eTjyrQCvz6s9QgF
         /+ZAMwuYzJ46FlCQ27gLX7eYDBwoH6HCFR3OwRUHk38o8RTyovHdw8aW2YwBgL92EO1g
         iiw8ndiH/2rgaMLELIUFBIKDi6EOsJCxp2kyNGJz4baQcLZmhSXGlR6r4dpc682yRXx2
         kG+gUx6b5DZHN4o8ztQhUvM0APnAiRIoilqT+3g01MTW6stko0rcjDBKHXZl8s4JK6vM
         54yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038030; x=1722642830;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xse5B7AOfcqAOlY7bR5VB/olShqjuvoHnQg+aILML2Y=;
        b=kxYxojqpEKKLb/GeYnQYWMs6vKweoV2I4WJrv0Fv1GcA1Gqm6nz82S1yBOzTligbSu
         UoN63hCX/i+qkqfi0G8KiOem+jhrVgP/H7JjucwFl6RUifLxwChxUFrkJ6hyC/7kuFg3
         lXEuGXg6/iay7TobvOcLt4qD0ItaRQyEmg09AKKLbse4ZV1wRB7YYWivY8T4/tEWUxG3
         HM2T2mD7zuDotHRT8wUuwjVp/EHj1aHDQ2FU1LRJj4Wur5UWwgl0fvmn+wltQC7Eqtk/
         2Dc2TJ5kx1/gsAX4g5o7wJwnf0xwj/caiGCJyfjBnljsYud2esF9JvqfVRF0kxMuE7cR
         G6ow==
X-Forwarded-Encrypted: i=1; AJvYcCVW0wMedGhkv8TO8gxCQi1qk1nFQjG6KpvptFgOPhSwQz0sg8Zn4nleEwv5rkFYwjlFTNSqdyrLgdKjx8H8tt5Oj9sWXpkOCdg+IPmJzA==
X-Gm-Message-State: AOJu0YxusEfsIEq0n/oJ2ZkoraUz0xSLKyGeaP7DYteWTJQndwRdreUS
	4xswczWdpYAEIfgZtWRbvY63jf3PRBt+ouDqNgsDbvsZe16uFNg9FfLxIbCBArj8DtoiSI8VX6W
	Orw==
X-Google-Smtp-Source: AGHT+IEFcNwoZPtxzQ32cLJ1vxa7gkQJVcgltXDXIuLlGv+WV+Ss10kIc9nwtzcNKm3zIIgT6vAGf5Ndk9o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2e2a:b0:70d:9a0e:c13b with SMTP id
 d2e1a72fcca58-70ece7f0562mr55820b3a.3.1722038029490; Fri, 26 Jul 2024
 16:53:49 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:44 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-36-seanjc@google.com>
Subject: [PATCH v12 35/84] KVM: x86: Use kvm_lookup_pfn() to check if retrying
 #PF is useful
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use kvm_lookup_pfn() instead of an open coded equivalent when checking to
see if KVM should exit to userspace or re-enter the guest after failed
instruction emulation triggered by a guest page fault.

Note, there is a small functional change as kvm_lookup_pfn() doesn't mark
the page as accessed, whereas kvm_release_pfn_clean() does mark the page
accessed (if the pfn is backed by a refcounted struct page).  Neither
behavior is wrong per se, e.g. querying the gfn=>pfn mapping doesn't
actually access the page, but the guest _did_ access the gfn, otherwise
the fault wouldn't have occurred.

That said, either KVM will exit to userspace and the guest will likely be
terminated, or KVM will re-enter the guest and, barring weirdness in the
guest, the guest will re-access the gfn, and KVM will fault-in the pfn and
mark it accessed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index af6c8cf6a37a..59501ad6e7f5 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8867,7 +8867,6 @@ static bool reexecute_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 				  int emulation_type)
 {
 	gpa_t gpa = cr2_or_gpa;
-	kvm_pfn_t pfn;
 
 	if (!(emulation_type & EMULTYPE_ALLOW_RETRY_PF))
 		return false;
@@ -8892,22 +8891,15 @@ static bool reexecute_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 	}
 
 	/*
-	 * Do not retry the unhandleable instruction if it faults on the
-	 * readonly host memory, otherwise it will goto a infinite loop:
+	 * Do not retry the unhandleable instruction if emulation was triggered
+	 * for emulated MMIO, e.g. by a readonly memslot or lack of a memslot,
+	 * otherwise KVM will send the vCPU into an infinite loop:
 	 * retry instruction -> write #PF -> emulation fail -> retry
 	 * instruction -> ...
 	 */
-	pfn = gfn_to_pfn(vcpu->kvm, gpa_to_gfn(gpa));
-
-	/*
-	 * If the instruction failed on the error pfn, it can not be fixed,
-	 * report the error to userspace.
-	 */
-	if (is_error_noslot_pfn(pfn))
+	if (is_error_noslot_pfn(kvm_lookup_pfn(vcpu->kvm, gpa_to_gfn(gpa))))
 		return false;
 
-	kvm_release_pfn_clean(pfn);
-
 	/*
 	 * If emulation may have been triggered by a write to a shadowed page
 	 * table, unprotect the gfn (zap any relevant SPTEs) and re-enter the
-- 
2.46.0.rc1.232.g9752f9e123-goog

