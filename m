Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3080B63E595
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:37:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwbz0S6Kz3fDP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:37:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GVS6tfQs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=35ekhywykdowgsobxquccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GVS6tfQs;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0l6f4Tz3bhX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:31 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id t5-20020a5b07c5000000b006dfa2102debso17727619ybq.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=syK6eF0z1YIhw5KnDfEJ/sqHR3QdYzGhfq3h/5i5Sas=;
        b=GVS6tfQs69HM9iPg5RyanavfgqTtstL/hP2NZwyz6ZiOn7sQ0OggFONinN3Xpq5A5O
         ROAGkLrScqRoWmoumJCapQkQLkR93EZiZmJgM/igbQR0yiEQhTM5NlbokX/zSqXnB7+r
         NTk4xoTIRJmdEYgV5XTVp3WbKa8QFND0VjYsfazhzfL9lIlQKqNHJYrNBIvwG1lwEaBo
         U+Ok61fL2GtL8yDcgFKd5TgqnT7w/4A4Fxq0CZ9SiNKAiH0owEiGaxOBRpIJfpm0capw
         Q57SZ4+/8uPzzEqCtGgs63hTCqUtPFogvCulI6jofLJAraG2Zyu8sPd3r85eKSZc1cYA
         LlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syK6eF0z1YIhw5KnDfEJ/sqHR3QdYzGhfq3h/5i5Sas=;
        b=aogASMMShoZmKkibc8I1/irkV8O62RqsNFvkQHWxj2jchnOc1/hpvS/H3w9YM/Lo4z
         pvcV291KtLWlkNvhfOMutSMeDumFSgGbrx1mCUX4rgA45A50eT40nQMkfsmlIxdUH2sc
         LuEkuHu7VXUlpkblVUJR0ZAyXvTZFEEURDjqPAI+ZvBUr51AgGSiv5jbnkC3tic4fybj
         Kx39DtW3+ZVvsy1HFPuUh/aZu5brWPk5q145Cfio12h0vpl2Gz/+WYFJMVx7lhqDv4mV
         +o4GzDEiUxg28n/sbY6skAHHyW4nLLvOC5tm5J5TGSetmkCCnbL2WsndOtb/zwTr3GX+
         Pb6w==
X-Gm-Message-State: ANoB5pnriQSw2H8Ec4deIg/S2y+KH3PJ32FNZ7ec4CCUKXJE/61q8clN
	ipe+l3zOL6pVKtCkMaF5SfYetPx/p4I=
X-Google-Smtp-Source: AA0mqf6GlYmz6ao1Ocazy6XnieuesyYU9e/N0B6T5bGw3DwYIfX3lPKm+B7r5ybTp9p3YaVUKLjnuY7j4Vk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:e8b:b0:3c9:bdbf:444d with SMTP id
 cq11-20020a05690c0e8b00b003c9bdbf444dmr15670072ywb.56.1669849829390; Wed, 30
 Nov 2022 15:10:29 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:14 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-31-seanjc@google.com>
Subject: [PATCH v2 30/50] KVM: VMX: Make VMCS configuration/capabilities
 structs read-only after init
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

Tag vmcs_config and vmx_capability structs as __init, the canonical
configuration is generated during hardware_setup() and must never be
modified after that point.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/capabilities.h | 4 ++--
 arch/x86/kvm/vmx/vmx.c          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/capabilities.h b/arch/x86/kvm/vmx/capabilities.h
index cd2ac9536c99..45162c1bcd8f 100644
--- a/arch/x86/kvm/vmx/capabilities.h
+++ b/arch/x86/kvm/vmx/capabilities.h
@@ -66,13 +66,13 @@ struct vmcs_config {
 	u64 misc;
 	struct nested_vmx_msrs nested;
 };
-extern struct vmcs_config vmcs_config;
+extern struct vmcs_config vmcs_config __ro_after_init;
 
 struct vmx_capability {
 	u32 ept;
 	u32 vpid;
 };
-extern struct vmx_capability vmx_capability;
+extern struct vmx_capability vmx_capability __ro_after_init;
 
 static inline bool cpu_has_vmx_basic_inout(void)
 {
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 76185a7a7ded..654d81f781da 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -488,8 +488,8 @@ static DEFINE_PER_CPU(struct list_head, loaded_vmcss_on_cpu);
 static DECLARE_BITMAP(vmx_vpid_bitmap, VMX_NR_VPIDS);
 static DEFINE_SPINLOCK(vmx_vpid_lock);
 
-struct vmcs_config vmcs_config;
-struct vmx_capability vmx_capability;
+struct vmcs_config vmcs_config __ro_after_init;
+struct vmx_capability vmx_capability __ro_after_init;
 
 #define VMX_SEGMENT_FIELD(seg)					\
 	[VCPU_SREG_##seg] = {                                   \
-- 
2.38.1.584.g0f3c55d4c2-goog

