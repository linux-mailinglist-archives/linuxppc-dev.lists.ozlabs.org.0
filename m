Return-Path: <linuxppc-dev+bounces-5064-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A34EA0A002
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 02:25:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVLRf5BHlz3d4H;
	Sat, 11 Jan 2025 12:25:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736558702;
	cv=none; b=Fpn6jo6VEAh1OJjk5B60ovQBtMTkZYdN9C7P5aBzBrEgkSIGmC2P/UVRIIXf9wH3n/OpBsBR1gAmHh/h6yxitHFNw/XnolPsLFrRoHKnMxrRiG8u5t31qJs52bVoiIUb974ojGrWbV1tLTFQBPqE0sUJbrddQ9ZsiIwP5EdAg/lAPdH6Ioluc1Z+zSjdZ2sIRaMR+ltgdeIhNYabr0E1Q06qdBA45JGe9XkQyxGMCar28XaXnPsMBjdp3NfdhGlF/DbmthNYXvGbpM3idvHQJJyJCRMVxjSMwtK0uIf1zW0kgiZ9A7HS/hkf46U4FoCscaxJ0krkTz98CYzLeJ1AYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736558702; c=relaxed/relaxed;
	bh=bnP9l4TBgZavFgl9ingoWbV7IQlMfBLutKO12YuuQSs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JQ6eWaledDlyCZvApKxlhVrqeur52IO3VIv9r4a1BNW72nDUDEkbiSYAuRLI0OL3vopn3SDH/Msovu27wr23hq9DUQSoTs98lMqrJ9RDGlkJ5czTPHra1QeLi8kifjtcv//6yjQ6mxGJv69wOloyz50M1a8dPmZf957hlmum/P8EJQw2+O4ZZYwyt54mnSxz+/H7rFmZvwh5XdkzZjFiVtb4kg0A3LOJtrLd0XP2lKoQZKhfTZi06S5x/+hvCCddocP4fwedq0Z67lRS4eLOToXPGbgCUDpsfb8ZyKO7Oxm8TUfarkH15Udb6SJ1e79YNY/aliulRMjkFn6Bde9ODQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YUTFTyy0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3bmibzwykdec1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YUTFTyy0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3bmibzwykdec1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVLRf0DhTz3d9L
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 12:25:02 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2161d5b3eb5so46318625ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736558700; x=1737163500; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bnP9l4TBgZavFgl9ingoWbV7IQlMfBLutKO12YuuQSs=;
        b=YUTFTyy06JmC/cH2gZu2SEAVqIBhKQ+shjXCTLoAeX+25q1YbzinN81RbAkWIVU7ox
         SYkA2RfZiyiCpValtlYJBG7ED1ZANe0FI0Gc17N2f6sNjNkbaAaypaXesTQ9Fo8owxGc
         /bepbW6gyg5K3QuwhknAeuaxufX3md1JRzibfNJCF50J6S9sZjutO0gbg3URT5afecym
         KU2WcmKA3Vr1srV+IF9qLd324yzEwbGT9OvHoYvyK5Mgdcyb1wmvvEDzrBCf5EW/TZF+
         QbbEnheo28QONnyzfHLouEVIgTsCF9MndJY+FNKGv4hKq/P2yLVOUvFB57UoI8T5jW4a
         Eg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558700; x=1737163500;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnP9l4TBgZavFgl9ingoWbV7IQlMfBLutKO12YuuQSs=;
        b=mFscYCtQaunXDh+tzkehZK2Ni2+++35lIy/7fnJo0WVEMniqzrxAJR2N0Vg79wCatE
         mwuUheMej131Ltq57pMCR9UMInj0U+k2ASNScS3+tViQQNEZFQIcNDiH5vltg0fKwGal
         AOPWDbLSMb6YKTfccD0Dhja4X3/CprygVKgkFtYcYWaEcCt/r0Xki+NfC4OABeugDxYa
         H6lGPMN1Vv//ArNqZDzZONOAHHnE9v2RjMXqBXH9q6/AQW3RQ5EHlQQoWwnIMiKSHJjR
         HY0sIjnDmrcERcvw927uO+thwfP6ZDrpUxjGF4h+yCERRE/7iYCpW1rut2JCr2zJsqiL
         RPWw==
X-Forwarded-Encrypted: i=1; AJvYcCV4psXLrOeoU6h7Y0hFX0iKT2UmcckO0jD+dCOAJsKyYg9iWV0N+xnb/9o0zs3ol0JI5cBzhBZrty6WKLw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxDEy0RYLPM1dBxYO9vgE+E8i847aVon1owmsj359kCaznq8pg2
	CjvkJuUyrMQ0SUvrr6mXmcw6fvbI5UVTtcCxRTQTfne9CDvgyN5O9+Wf9iW9NsLvaHIYjWVP/Xe
	lZw==
X-Google-Smtp-Source: AGHT+IH1NdERQE8OQLjVGWXsUxxFzmL931Ova+zIR4kc3ay4XMIaQ3TzbpO5jT/NYBJvXHUAPCJZD+fSckk=
X-Received: from pfbfh41.prod.google.com ([2002:a05:6a00:3929:b0:72a:bc54:8507])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4393:b0:1e1:ca91:b0e3
 with SMTP id adf61e73a8af0-1e88d09e17fmr21120449637.36.1736558700525; Fri, 10
 Jan 2025 17:25:00 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 10 Jan 2025 17:24:50 -0800
In-Reply-To: <20250111012450.1262638-1-seanjc@google.com>
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
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111012450.1262638-6-seanjc@google.com>
Subject: [PATCH 5/5] KVM: selftests: Rely on KVM_RUN_NEEDS_COMPLETION to
 complete userspace exits
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add selftests coverage for KVM_RUN_NEEDS_COMPLETION by redoing KVM_RUN if
and only if KVM states that completion is required.

Opportunistically rename the helper to replace "io" with "exit", as exits
that require completion are no longer limited to I/O.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h            | 8 ++++++--
 tools/testing/selftests/kvm/lib/kvm_util.c                | 4 ++++
 tools/testing/selftests/kvm/lib/ucall_common.c            | 2 +-
 tools/testing/selftests/kvm/lib/x86/processor.c           | 8 +-------
 tools/testing/selftests/kvm/x86/triple_fault_event_test.c | 3 +--
 5 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 78fd597c1b60..86e1850e4e49 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -29,6 +29,8 @@
 
 #define NSEC_PER_SEC 1000000000L
 
+extern bool kvm_has_needs_completion;
+
 struct userspace_mem_region {
 	struct kvm_userspace_memory_region2 region;
 	struct sparsebit *unused_phy_pages;
@@ -634,9 +636,11 @@ static inline int __vcpu_run(struct kvm_vcpu *vcpu)
 
 void vcpu_run_immediate_exit(struct kvm_vcpu *vcpu);
 
-static inline void vcpu_run_complete_io(struct kvm_vcpu *vcpu)
+static inline void vcpu_run_complete_exit(struct kvm_vcpu *vcpu)
 {
-	vcpu_run_immediate_exit(vcpu);
+	if (!kvm_has_needs_completion ||
+	    (vcpu->run->flags & KVM_RUN_NEEDS_COMPLETION))
+		vcpu_run_immediate_exit(vcpu);
 }
 
 struct kvm_reg_list *vcpu_get_reg_list(struct kvm_vcpu *vcpu);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index c9a33766f673..95ac9b981049 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -19,6 +19,8 @@
 
 #define KVM_UTIL_MIN_PFN	2
 
+bool kvm_has_needs_completion;
+
 uint32_t guest_random_seed;
 struct guest_random_state guest_rng;
 static uint32_t last_guest_seed;
@@ -2253,6 +2255,8 @@ void __attribute((constructor)) kvm_selftest_init(void)
 	/* Tell stdout not to buffer its content. */
 	setbuf(stdout, NULL);
 
+	kvm_has_needs_completion = kvm_check_cap(KVM_CAP_NEEDS_COMPLETION);
+
 	guest_random_seed = last_guest_seed = random();
 	pr_info("Random seed: 0x%x\n", guest_random_seed);
 
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index 42151e571953..125584a94ba8 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -154,7 +154,7 @@ uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc)
 			    "Guest failed to allocate ucall struct");
 
 		memcpy(uc, addr, sizeof(*uc));
-		vcpu_run_complete_io(vcpu);
+		vcpu_run_complete_exit(vcpu);
 	} else {
 		memset(uc, 0, sizeof(*uc));
 	}
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index bd5a802fa7a5..1db4764e413b 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1077,13 +1077,7 @@ struct kvm_x86_state *vcpu_save_state(struct kvm_vcpu *vcpu)
 			    nested_size, sizeof(state->nested_));
 	}
 
-	/*
-	 * When KVM exits to userspace with KVM_EXIT_IO, KVM guarantees
-	 * guest state is consistent only after userspace re-enters the
-	 * kernel with KVM_RUN.  Complete IO prior to migrating state
-	 * to a new VM.
-	 */
-	vcpu_run_complete_io(vcpu);
+	vcpu_run_complete_exit(vcpu);
 
 	state = malloc(sizeof(*state) + msr_list->nmsrs * sizeof(state->msrs.entries[0]));
 	TEST_ASSERT(state, "-ENOMEM when allocating kvm state");
diff --git a/tools/testing/selftests/kvm/x86/triple_fault_event_test.c b/tools/testing/selftests/kvm/x86/triple_fault_event_test.c
index 56306a19144a..82d732788bc1 100644
--- a/tools/testing/selftests/kvm/x86/triple_fault_event_test.c
+++ b/tools/testing/selftests/kvm/x86/triple_fault_event_test.c
@@ -97,8 +97,7 @@ int main(void)
 	events.flags |= KVM_VCPUEVENT_VALID_TRIPLE_FAULT;
 	events.triple_fault.pending = true;
 	vcpu_events_set(vcpu, &events);
-	run->immediate_exit = true;
-	vcpu_run_complete_io(vcpu);
+	vcpu_run_complete_exit(vcpu);
 
 	vcpu_events_get(vcpu, &events);
 	TEST_ASSERT(events.flags & KVM_VCPUEVENT_VALID_TRIPLE_FAULT,
-- 
2.47.1.613.gc27f4b7a9f-goog


