Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F3263E5BB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:49:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwtF3VwMz3fXb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:49:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VFFqhuPm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=37ukhywykdpupbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VFFqhuPm;
	dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0w1cJtz3bgx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:39 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id j21-20020a63fc15000000b00476d6932baeso48547pgi.23
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sHcyHjJ8KuW26EmyMG2GCKXDxJlY2ojJURA0kcfw/9k=;
        b=VFFqhuPme1m1eQU16n2iG/J4RAGy2zrHzndrwcDa2UqPCuhmGJAJUoqWiUJ0hBawNj
         h+1PCcwEa7TWtGKSi7eE+1ph58rOUBv3xDHOkx/n95w6cUeiQfhXEh79gM7EIyUtnO0y
         ioN8O+FtRJeTVR0iP2uSqqMMZ5ce7bBX8TmoSKstA2185sSr20JSkv0QaUPbyNWz1HPN
         V+igGOZxxi1EiiIK8zOP02RlczC9ypmTY7mqbv223oTCKi8YwUrElYdikisBH1Zh971w
         Fr2k5IgU2gcv415RYRumMziSQSo+TFWu1mQkGuJbocDRmVfBg+o1I6JFksOzDsAHNWBN
         gCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHcyHjJ8KuW26EmyMG2GCKXDxJlY2ojJURA0kcfw/9k=;
        b=giwO+QMyZr9CUVCQL6kAWpnuEvm+/9eSfpcDtYl39ihDfgb0KD7IF1k0zBoK65f9mQ
         9J4ODs3X8YwyLGwbRIeHNUrO0wDs+zz/255ikdC/GFjuSMJlGJHSvxtoXPfO/y6NGvbf
         KEf0RyH0Fxvj3k6s56mJ76mu30KLeTOOV7xsX7Udn/Js4dbAfjEeJAO/Pbgmz+sqX0EN
         4WV6qMMZhNCvqar0nrveYtn4hTxRjRGFwuzHU9mpwb8IfKEhrw1njJTg8HfzvkHru3n/
         b3A84bZMlzeT68ZDyTWfc7xmd6GlJ8wSgK5ZE5ftTDVnhkdDCDuWiPTGatg6L13RC2kZ
         7kFA==
X-Gm-Message-State: ANoB5pnOT/CL/xlMTc/JG+bxz00vBP+BOAh3EI4ZYHB0+ChDsB9Kxa1W
	IWc8VvOw9uRE761M8PBv2PwjJs3/ZEI=
X-Google-Smtp-Source: AA0mqf6iPCX6KyjCp3cF1IRt5Mv13lZJWlEm0jsHehxUqphsE1Cogz37ZNgUSTWxB9XNJiT56sIeMfxkVVA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:63d8:0:b0:477:172b:c350 with SMTP id
 n24-20020a6563d8000000b00477172bc350mr40707643pgv.313.1669849838234; Wed, 30
 Nov 2022 15:10:38 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:19 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-36-seanjc@google.com>
Subject: [PATCH v2 35/50] KVM: VMX: Use current CPU's info to perform
 "disabled by BIOS?" checks
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use this_cpu_has() instead of boot_cpu_has() to perform the effective
"disabled by BIOS?" checks for VMX.  This will allow consolidating code
between vmx_disabled_by_bios() and vmx_check_processor_compat().

Checking the boot CPU isn't a strict requirement as any divergence in VMX
enabling between the boot CPU and other CPUs will result in KVM refusing
to load thanks to the aforementioned vmx_check_processor_compat().

Furthermore, using the boot CPU was an unintentional change introduced by
commit a4d0b2fdbcf7 ("KVM: VMX: Use VMX feature flag to query BIOS
enabling").  Prior to using the feature flags, KVM checked the raw MSR
value from the current CPU.

Reported-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index e859d2b7daa4..3f7d9f88b314 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2492,8 +2492,8 @@ static __init int cpu_has_kvm_support(void)
 
 static __init int vmx_disabled_by_bios(void)
 {
-	return !boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
-	       !boot_cpu_has(X86_FEATURE_VMX);
+	return !this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
+	       !this_cpu_has(X86_FEATURE_VMX);
 }
 
 static int kvm_cpu_vmxon(u64 vmxon_pointer)
-- 
2.38.1.584.g0f3c55d4c2-goog

