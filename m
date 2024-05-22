Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 768CC8CB8B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 03:51:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hgP01ScC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkYtt4NWsz3w99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 11:41:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hgP01ScC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3au1nzgykdao2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkYsK4glBz3g1d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 11:40:21 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5c66a69ec8eso10774993a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 18:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342018; x=1716946818; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ksrstYm4acNB+vq44uyCoC45OYvJ0DDPXjwdxHvKYos=;
        b=hgP01ScCaPfVPekwFRHpfg1SM2VfWlje+bMJdMADO3XGr+9UnRsRwq1dWQBkBMzbe5
         c4xfHXW6ItBrghAsaXAq29SLmfV/kX99TPNo1CZEZfudbr37yB6m0jJRgqRHuVV4b/u3
         dNBqKggE1f4HQYmLqsZMS3taM2BlmB51gNIYVp6kGKXNx8hxgVKgmRz91eC9E3vwlIVh
         z1KzWFFUTq1ZdYywPOduh3r+ffKVUwZ/idBA0IZRpV2vGxJSqNFoy8XTHSQxXyt5vQds
         bPu1EWX0WyDmwbOGbQwsVMIzvY7p/TerZKut4myPC1HB0X8bSn8o8v79xugfpsVgOmDb
         U6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342018; x=1716946818;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ksrstYm4acNB+vq44uyCoC45OYvJ0DDPXjwdxHvKYos=;
        b=pvVzMAebi5GX8lfM5sow9W8cytAfwbtbf8EUpHJXk6Utxzc8ZwAMNFcnIYgX/QaKoV
         njHOWP3ZVspMJMIPPLfbQ1Cz2DtxwIqx/5HroqaER84m/sV6xE8D7NG6J9Bp+4YWY2FX
         4QfQ5PKibqJWVC5HgBGkiyBe/PrE3VkV7ynDooHPRJhGJgp8gS/khJpFLj2ukZPIHVz/
         azPZFgvZmsAdbY2fJNkSH8/qGs1llSI5iPkdluJL0tgzTwRFRnvK/2dFcKdvcOcbN8v+
         STxrF3gKg8rymqyyZmKx5muFD68g9UUu3yHj33fIvXJ4+bqU89UYaVMVrIMfFlvw/t6w
         B4Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUNqJdBwJiVdlaSw9c63j12vYV72FaQCuk9rMY0Y8mausN343ipq7HtwbTEh1ziQ+uBcdZKzoCU8szTGcMj0H14yiJ3DziM5oWKTJzhog==
X-Gm-Message-State: AOJu0YwO/2eJ4qe1eSzlLphplCs9ocf0jIXiiTt6ziNhqKkFHo4QoI8H
	7DUBiYR4RO6Smz79BjULaQvIc/3XRcUgfUlcv82cvBA/kb1tXAY5Qn6yVG67Sp/poBD7HybqQxm
	n+g==
X-Google-Smtp-Source: AGHT+IHJLNUzIn6ctcMF+INwxFBaLeFnt3jt+tGT+n5clQV+H1h//pkXMDRUR1aNO5clBwbY0FCScT/OPUo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:484:b0:5dc:5111:d8b1 with SMTP id
 41be03b00d2f7-676492dc83emr2297a12.5.1716342017980; Tue, 21 May 2024 18:40:17
 -0700 (PDT)
Date: Tue, 21 May 2024 18:40:08 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-2-seanjc@google.com>
Subject: [PATCH v2 1/6] KVM: Add a flag to track if a loaded vCPU is scheduled out
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

Add a kvm_vcpu.scheduled_out flag to track if a vCPU is in the process of
being scheduled out (vCPU put path), or if the vCPU is being reloaded
after being scheduled out (vCPU load path).  In the short term, this will
allow dropping kvm_arch_sched_in(), as arch code can query scheduled_out
during kvm_arch_vcpu_load().

Longer term, scheduled_out opens up other potential optimizations, without
creating subtle/brittle dependencies.  E.g. it allows KVM to keep guest
state (that is managed via kvm_arch_vcpu_{load,put}()) loaded across
kvm_sched_{out,in}(), if KVM knows the state isn't accessed by the host
kernel.  Forcing arch code to coordinate between kvm_arch_sched_{in,out}()
and kvm_arch_vcpu_{load,put}() is awkward, not reusable, and relies on the
exact ordering of calls into arch code.

Adding scheduled_out also obviates the need for a kvm_arch_sched_out()
hook, e.g. if arch code needs to do something novel when putting vCPU
state.

And even if KVM never uses scheduled_out for anything beyond dropping
kvm_arch_sched_in(), just being able to remove all of the arch stubs makes
it worth adding the flag.

Link: https://lore.kernel.org/all/20240430224431.490139-1-seanjc@google.com
Cc: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 1 +
 virt/kvm/kvm_main.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7b57878c8c18..bde69f74b031 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -380,6 +380,7 @@ struct kvm_vcpu {
 #endif
 	bool preempted;
 	bool ready;
+	bool scheduled_out;
 	struct kvm_vcpu_arch arch;
 	struct kvm_vcpu_stat stat;
 	char stats_id[KVM_STATS_NAME_SIZE];
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a1756d5077ee..7ecea573d121 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6288,6 +6288,8 @@ static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
 	__this_cpu_write(kvm_running_vcpu, vcpu);
 	kvm_arch_sched_in(vcpu, cpu);
 	kvm_arch_vcpu_load(vcpu, cpu);
+
+	WRITE_ONCE(vcpu->scheduled_out, false);
 }
 
 static void kvm_sched_out(struct preempt_notifier *pn,
@@ -6295,6 +6297,8 @@ static void kvm_sched_out(struct preempt_notifier *pn,
 {
 	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);
 
+	WRITE_ONCE(vcpu->scheduled_out, true);
+
 	if (current->on_rq) {
 		WRITE_ONCE(vcpu->preempted, true);
 		WRITE_ONCE(vcpu->ready, true);
-- 
2.45.0.215.g3402c0e53f-goog

