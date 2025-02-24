Return-Path: <linuxppc-dev+bounces-6437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EDAA43154
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 00:55:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1yL03Tvgz30Pn;
	Tue, 25 Feb 2025 10:55:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740441352;
	cv=none; b=PZ9SNsjHk2qqHsKOodZoElSPHpmIuXnBcueK4X9njCzvlrHVWkXuJyORFCutCAKGoOqjBRqqiOuOytsi9lyLG2vVU9mluik/IEVypugLiu3JtqWeO8tc16I9AuxDYnSpuTXiFE1+AmU5lyIKJ2OXCCtDX5HBp4Cv5CFuCe5CmiNusC1ilTyyR/iwSKbbtXJ1NYU0Ey6E0mDWIJSSquckc5f0bfAOZ39T0d4XY5fa3U+L3ZEZ+AWqOklDDS0tGEY+MoFABWi9Vi99OnxAREo8ULSX5WgppDWfMeg95iZh3rER0jyP/VVUjUusoB5ypLynxTRKtF5G+p1Lp9MLZmlfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740441352; c=relaxed/relaxed;
	bh=VUFWBiQUtkyxtQjLqO6VHI65Q9aVoo/tjEK11vAPqoc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LO9wsXH4uiw4RP/xdNHdRqcHmAMfxQTPZdaM5AEC6x3FMQjKHG0S4BAnjZ3JHJUWalt+e5HaOXrQ1HmQB15AZQKyvtzOgabTBnPAnDFHpEG+VfizxS3pXTcM1+eS5dMnLnnJMElzzFD4tYngbN8IRpcSnbqMAeTX4yU7y7SibSxuNba0EwwfqLPAhIH9spgnVRjZe87q2lynoCydY4A7VEtSPPcDFzh2caZDlGtQEF4RXpHEVK+8Aoq4OXa5T+0vvXozcH/600iyRmwdZ0OA9Om0m2veqz7jiIMPJsfCrtQu4HzP08eR7R2oMKqhdwMBZwm3UgmW1TLW+53GR8mUUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rQJqQ+t9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3awe9zwykdeo4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rQJqQ+t9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3awe9zwykdeo4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1yKy5xJvz3093
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 10:55:50 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fce2954a10so13725324a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 15:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441347; x=1741046147; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VUFWBiQUtkyxtQjLqO6VHI65Q9aVoo/tjEK11vAPqoc=;
        b=rQJqQ+t9B9AD28W0NZd76BWgVicwfePNSdFOam31NkIqjhbme+m033XdGsm50FhRe7
         e3Co9nqV1L27YzJn5LxH5/2J0G249f+EhxBv3Q8FnykiIWZFHxBGsE+v4zf8Eh0mcCyo
         /1u1kdNrLZ5c738zNCoWa+pOu7llWazCPdRr1I4SviN+WZ2GOV5OSmAAYBKNVGaYGHOH
         THbiaC9R5sxwsOyi2mtr8rhqQ6NfrW5FTwMWvwq98p1YT0cuu83Q8dvn/dit16NoP9xS
         zhxvvgPd4Ya2e5jfroyRJlMmV+3s1Y4uh6O6JvoPkb8UT0F4tchmQCqD/UlzWvZ8SWXf
         gbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441347; x=1741046147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUFWBiQUtkyxtQjLqO6VHI65Q9aVoo/tjEK11vAPqoc=;
        b=gq/w5VtyJSHmt3FnSdMJOynmzaI05Wpai530vJ6K+eeCbwJpBTdYZMbct1u5M06833
         2nmemkGkx+iw+0RxjZUJE00Z2OzmII1NBNjGXIDBJ+f1Ph11agRxf5juvu/0tCJ6MJzj
         0ZPAOjEyAyHnZL+2+11BWVi8RSTltmydWJ85K2GeNQUPc7yOxAHfdkZm/48IPERW9kWB
         fCBkVzvlztShANDWUNOeeMzVqiovhml0lOviS73CFTtrWS4of6zBXZndzPwRkMh/jlUA
         W/lCPVbgp5Zc5ym6oA9qvD1hLjo5N83PHruInIwapEY4c1ln0meOHmyqVt8DWg+4Rnjq
         eyHA==
X-Forwarded-Encrypted: i=1; AJvYcCVRFVoJ9+mAHgACGhLMXzvvJqIsW/DHJsfbNrIakYZ1jJ+gxlbB15CqCC3oanuGkPFbroOV1CTskBy8Brg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyE3QOk2GN8OKZ1k9CJMt1B609hqmU1Qs0S0X6XiZjmBmDfhrtG
	CqyFHz2dvw+cuaefUCrnM95r+bd31C7olmYdlNx4QgMichHJh647YY07O59CUWeD4nhgWviJaLO
	MBw==
X-Google-Smtp-Source: AGHT+IEskcg8NGcMgI3lzGvHxN+7n9pLx0XcpaLq7IsEpPM2kCgPZOpZWimEzcKRut1Ut1sQ02q7DWsQk2M=
X-Received: from pjuw11.prod.google.com ([2002:a17:90a:d60b:b0:2fa:1771:e276])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e18c:b0:2ea:bf1c:1e3a
 with SMTP id 98e67ed59e1d1-2fce86ae2cbmr28015424a91.12.1740441347216; Mon, 24
 Feb 2025 15:55:47 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 24 Feb 2025 15:55:36 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
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
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-2-seanjc@google.com>
Subject: [PATCH 1/7] KVM: x86: Free vCPUs before freeing VM state
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
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Free vCPUs before freeing any VM state, as both SVM and VMX may access
VM state when "freeing" a vCPU that is currently "in" L2, i.e. that needs
to be kicked out of nested guest mode.

Commit 6fcee03df6a1 ("KVM: x86: avoid loading a vCPU after .vm_destroy was
called") partially fixed the issue, but for unknown reasons only moved the
MMU unloading before VM destruction.  Complete the change, and free all
vCPU state prior to destroying VM state, as nVMX accesses even more state
than nSVM.

In addition to the AVIC, KVM can hit a use-after-free on MSR filters:

  kvm_msr_allowed+0x4c/0xd0
  __kvm_set_msr+0x12d/0x1e0
  kvm_set_msr+0x19/0x40
  load_vmcs12_host_state+0x2d8/0x6e0 [kvm_intel]
  nested_vmx_vmexit+0x715/0xbd0 [kvm_intel]
  nested_vmx_free_vcpu+0x33/0x50 [kvm_intel]
  vmx_free_vcpu+0x54/0xc0 [kvm_intel]
  kvm_arch_vcpu_destroy+0x28/0xf0
  kvm_vcpu_destroy+0x12/0x50
  kvm_arch_destroy_vm+0x12c/0x1c0
  kvm_put_kvm+0x263/0x3c0
  kvm_vm_release+0x21/0x30

and an upcoming fix to process injectable interrupts on nested VM-Exit
will access the PIC:

  BUG: kernel NULL pointer dereference, address: 0000000000000090
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  CPU: 23 UID: 1000 PID: 2658 Comm: kvm-nx-lpage-re
  RIP: 0010:kvm_cpu_has_extint+0x2f/0x60 [kvm]
  Call Trace:
   <TASK>
   kvm_cpu_has_injectable_intr+0xe/0x60 [kvm]
   nested_vmx_vmexit+0x2d7/0xdf0 [kvm_intel]
   nested_vmx_free_vcpu+0x40/0x50 [kvm_intel]
   vmx_vcpu_free+0x2d/0x80 [kvm_intel]
   kvm_arch_vcpu_destroy+0x2d/0x130 [kvm]
   kvm_destroy_vcpus+0x8a/0x100 [kvm]
   kvm_arch_destroy_vm+0xa7/0x1d0 [kvm]
   kvm_destroy_vm+0x172/0x300 [kvm]
   kvm_vcpu_release+0x31/0x50 [kvm]

Inarguably, both nSVM and nVMX need to be fixed, but punt on those
cleanups for the moment.  Conceptually, vCPUs should be freed before VM
state.  Assets like the I/O APIC and PIC _must_ be allocated before vCPUs
are created, so it stands to reason that they must be freed _after_ vCPUs
are destroyed.

Reported-by: Aaron Lewis <aaronlewis@google.com>
Closes: https://lore.kernel.org/all/20240703175618.2304869-2-aaronlewis@google.com
Cc: Jim Mattson <jmattson@google.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Kai Huang <kai.huang@intel.com>
Cc: Isaku Yamahata <isaku.yamahata@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 58b82d6fd77c..045c61cc7e54 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12890,11 +12890,11 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 		mutex_unlock(&kvm->slots_lock);
 	}
 	kvm_unload_vcpu_mmus(kvm);
+	kvm_destroy_vcpus(kvm);
 	kvm_x86_call(vm_destroy)(kvm);
 	kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
 	kvm_pic_destroy(kvm);
 	kvm_ioapic_destroy(kvm);
-	kvm_destroy_vcpus(kvm);
 	kvfree(rcu_dereference_check(kvm->arch.apic_map, 1));
 	kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
 	kvm_mmu_uninit_vm(kvm);
-- 
2.48.1.658.g4767266eb4-goog


