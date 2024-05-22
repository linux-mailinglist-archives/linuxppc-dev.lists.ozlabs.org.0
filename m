Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5438CB8AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 03:51:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=CYZ603Tf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkYyv0WPXz87Jn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 11:45:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=CYZ603Tf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3c01nzgykdbqcyu73w08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkYsS6bdtz3g6N
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 11:40:28 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61bed763956so247999037b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 18:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342027; x=1716946827; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=N3tcdNqgpk0g0Qawt6D2SIU8FL4Y9j5vsBcc8xUlRY4=;
        b=CYZ603Tfsn1eFwcYpW2jA2nnq/5wfp6n/qYIrbInTD0MhZo4LY3oL4PcJjukAh1lmu
         bd6tb6r5uYQL1f5JFifnBCcVV+tum0hQeTc0HzGJuzCXBXzaBAFkg7VtWNx4XdRwqNrD
         gYhA54QeZSn76jTgNKoeuYZLWuQYI/cYrHx7Tz0mVyaNIWhiatWXMqZix7KZoL95FmzW
         jtPqOakPtwA4lrwMaRP9kdj+dU8JdgAXzTJOe5QLjejToJYZTMOU/cKsNWe5j5shFTK1
         /uLXyBRdyPzzVAyIPdOoCUQN/rgjHlU4nI26UPbieop2NZvLVem+Ncdr4MbtNyLyF3VU
         WtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342027; x=1716946827;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3tcdNqgpk0g0Qawt6D2SIU8FL4Y9j5vsBcc8xUlRY4=;
        b=PUpbZWf9M2jV2wqtUWKNQDv4zomMPFWxzxg9peRpllvAj1iKTWC+xim1IzQ1RtIp/W
         er0XxAZKONvAwHfNElgHNdRy3/B4iZ94EW5txWlaGN4GTjO9CDnlRl67lpC3hZSiEEym
         RLiif2YWjgTn/nP0O6kYCtPttnCvi1acL2awozUuHAn9v0lVOgWFY5B6dUC3QXFWqy1o
         LpBg2ebfJln70TNj/GHqL3OO9/TfbyVZk5vHNaQM5oKC56leEqV2gYnpLAzRoi/3+mHS
         3bnBb60LqTjurxrjxvxZu7bkZthU6bE0CySMMW6jhRNbh9LDnH+DJmwFBSNiG8/jE16y
         ZNyg==
X-Forwarded-Encrypted: i=1; AJvYcCVrk4MGGMI57xZNpsYWEX1tipsXWND4/Z2b+pIEs9ybdRqrw3OniNEjP0joj6YpIvWHAb1U6O0vn4FLOktl0PZa1mVR7a7qErNaKjLn1A==
X-Gm-Message-State: AOJu0YxjuQyIhKgiuNsEMumlTfv5ZgtSlNl3EUyscSme21EuAg0ZYFYS
	qhWI7mAqLSU+1m9T6u3yqd9PKyEaIcV6lyRZTt+qqIAggHF0b5SSJ1pQogJ/tRtRbMxT7xXOu6t
	ufA==
X-Google-Smtp-Source: AGHT+IFL81/qwy5rtkuJ10qcaRdu2JQbneM9E+pjVdbps1/0e/VA4O7XiaE6CliC0DQxJV6ImSRXVMyGgXw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4984:0:b0:61b:e6d8:1c01 with SMTP id
 00721157ae682-627e487fd2emr1914977b3.10.1716342027243; Tue, 21 May 2024
 18:40:27 -0700 (PDT)
Date: Tue, 21 May 2024 18:40:13 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-7-seanjc@google.com>
Subject: [PATCH v2 6/6] KVM: x86: Drop now-superflous setting of
 l1tf_flush_l1d in vcpu_run()
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

Now that KVM unconditionally sets l1tf_flush_l1d in kvm_arch_vcpu_load(),
drop the redundant store from vcpu_run().  The flag is cleared only when
VM-Enter is imminent, deep below vcpu_run(), i.e. barring a KVM bug, it's
impossible for l1tf_flush_l1d to be cleared between loading the vCPU and
calling vcpu_run().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 7 ++++---
 arch/x86/kvm/x86.c     | 1 -
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index da2f95385a12..552b6a9887a5 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6672,9 +6672,10 @@ static noinstr void vmx_l1d_flush(struct kvm_vcpu *vcpu)
 		bool flush_l1d;
 
 		/*
-		 * Clear the per-vcpu flush bit, it gets set again
-		 * either from vcpu_run() or from one of the unsafe
-		 * VMEXIT handlers.
+		 * Clear the per-vcpu flush bit, it gets set again if the vCPU
+		 * is reloaded, i.e. if the vCPU is scheduled out or if KVM
+		 * exits to userspace, or if KVM reaches one of the unsafe
+		 * VMEXIT handlers, e.g. if KVM calls into the emulator.
 		 */
 		flush_l1d = vcpu->arch.l1tf_flush_l1d;
 		vcpu->arch.l1tf_flush_l1d = false;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 60fea297f91f..86ae7392cc59 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11264,7 +11264,6 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
 	int r;
 
 	vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
-	vcpu->arch.l1tf_flush_l1d = true;
 
 	for (;;) {
 		/*
-- 
2.45.0.215.g3402c0e53f-goog

