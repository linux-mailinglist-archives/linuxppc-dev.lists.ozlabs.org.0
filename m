Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24F63E58A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:35:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwYq373yz3fML
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:35:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZPl5I1zJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=34ukhywykdokdplyunrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ZPl5I1zJ;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0j1LPyz3bg1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:29 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id y6-20020a25b9c6000000b006c1c6161716so17622706ybj.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OieTjXt168G/Xjnld4ZlmtAw/6/4OJXm7SHd++1umI0=;
        b=ZPl5I1zJcqiE0l+4F/p8x6MLz2tSOeT/JZaLfE85w0lTajS4YSXdVr0RiZjkgSEqwa
         4ZgU2COJfSsknurs5ma4q7/tOV6Gnl6zIYDu75IjmXc0cmaezZcggCRChMBWOsGfJN3u
         aG4Vf+GA7ibgun2XkOoNom2MZ7Avlb1XoX9hweZFFf+ZDAOgyYhM5lVfcYQhIkiKBYr6
         L8+d26lEXIAkz+yw7+S1z80LAtEvQ2PSmnrtxAiADFN6FS/yNg/pKsk42Q/SzOKPkyuh
         ophht1lsuYKEpGQB+6NLnN2Em3iy4MyMlv0s/808Yh5Ot/5JFY+xj86MEAcGBgxZMese
         FYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OieTjXt168G/Xjnld4ZlmtAw/6/4OJXm7SHd++1umI0=;
        b=xHwSSkysxRreYoBMBmxnOHhhaMxhNCjS66vB9GTSnY7S9Dwx6ybKt6E+ENjUCSKsM6
         MK3O5AwNPmibYm2yplYXowLOB4sVb2b/zCCcWkvPqvscrwNveg1ep7VPsE4cXtdbJFIq
         NnXpLtaMVAqkiom4AStgq9VCmlMaQE6q8E8O0HokMvh12EAX8Q9VdXvPjNP/Z+gO677U
         mWTYyYXVgLrBbyfH/Sv0md74+U9JNhuFmuvRW1mXEOfYV8oiTkWGKTwvPmshiwEdxk7W
         GTtOhdrBymlQI2PM2pQNCttm0KX3mTHEvwjAoLszl03LDrSq698Nud/o3i9SH9IDgV2U
         NSgw==
X-Gm-Message-State: ANoB5pmDTYHO27oZvsI5mMd6JF4SpMeZve2/2/3FRv+WZsx4chRqp1wb
	rJwlo2ulXfe8oCaNxjIS50gh194ssHI=
X-Google-Smtp-Source: AA0mqf7doE3KsN0pmH7Rc4o01wWXfMkyHfPIY/F3jF9M2I4m4Ef8qW3AG+neuaJOQfJatrp6XEk3w2N5lcM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:2d4d:0:b0:6f2:b3f7:7a44 with SMTP id
 s13-20020a252d4d000000b006f2b3f77a44mr29050195ybe.370.1669849826261; Wed, 30
 Nov 2022 15:10:26 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:12 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-29-seanjc@google.com>
Subject: [PATCH v2 28/50] KVM: s390: Mark __kvm_s390_init() and its
 descendants as __init
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

Tag __kvm_s390_init() and its unique helpers as __init.  These functions
are only ever called during module_init(), but could not be tagged
accordingly while they were invoked from the common kvm_arch_init(),
which is not __init because of x86.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
---
 arch/s390/kvm/interrupt.c | 2 +-
 arch/s390/kvm/kvm-s390.c  | 4 ++--
 arch/s390/kvm/kvm-s390.h  | 2 +-
 arch/s390/kvm/pci.c       | 2 +-
 arch/s390/kvm/pci.h       | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/s390/kvm/interrupt.c b/arch/s390/kvm/interrupt.c
index 1dae78deddf2..3754d7937530 100644
--- a/arch/s390/kvm/interrupt.c
+++ b/arch/s390/kvm/interrupt.c
@@ -3411,7 +3411,7 @@ void kvm_s390_gib_destroy(void)
 	gib = NULL;
 }
 
-int kvm_s390_gib_init(u8 nisc)
+int __init kvm_s390_gib_init(u8 nisc)
 {
 	int rc = 0;
 
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 8c4fcaf2bd36..66d162723d21 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -366,7 +366,7 @@ static __always_inline void __insn32_query(unsigned int opcode, u8 *query)
 #define INSN_SORTL 0xb938
 #define INSN_DFLTCC 0xb939
 
-static void kvm_s390_cpu_feat_init(void)
+static void __init kvm_s390_cpu_feat_init(void)
 {
 	int i;
 
@@ -469,7 +469,7 @@ static void kvm_s390_cpu_feat_init(void)
 	 */
 }
 
-static int __kvm_s390_init(void)
+static int __init __kvm_s390_init(void)
 {
 	int rc = -ENOMEM;
 
diff --git a/arch/s390/kvm/kvm-s390.h b/arch/s390/kvm/kvm-s390.h
index d48588c207d8..0261d42c7d01 100644
--- a/arch/s390/kvm/kvm-s390.h
+++ b/arch/s390/kvm/kvm-s390.h
@@ -470,7 +470,7 @@ void kvm_s390_gisa_clear(struct kvm *kvm);
 void kvm_s390_gisa_destroy(struct kvm *kvm);
 void kvm_s390_gisa_disable(struct kvm *kvm);
 void kvm_s390_gisa_enable(struct kvm *kvm);
-int kvm_s390_gib_init(u8 nisc);
+int __init kvm_s390_gib_init(u8 nisc);
 void kvm_s390_gib_destroy(void);
 
 /* implemented in guestdbg.c */
diff --git a/arch/s390/kvm/pci.c b/arch/s390/kvm/pci.c
index ded1af2ddae9..39544c92ce3d 100644
--- a/arch/s390/kvm/pci.c
+++ b/arch/s390/kvm/pci.c
@@ -670,7 +670,7 @@ int kvm_s390_pci_zpci_op(struct kvm *kvm, struct kvm_s390_zpci_op *args)
 	return r;
 }
 
-int kvm_s390_pci_init(void)
+int __init kvm_s390_pci_init(void)
 {
 	zpci_kvm_hook.kvm_register = kvm_s390_pci_register_kvm;
 	zpci_kvm_hook.kvm_unregister = kvm_s390_pci_unregister_kvm;
diff --git a/arch/s390/kvm/pci.h b/arch/s390/kvm/pci.h
index 486d06ef563f..ff0972dd5e71 100644
--- a/arch/s390/kvm/pci.h
+++ b/arch/s390/kvm/pci.h
@@ -60,7 +60,7 @@ void kvm_s390_pci_clear_list(struct kvm *kvm);
 
 int kvm_s390_pci_zpci_op(struct kvm *kvm, struct kvm_s390_zpci_op *args);
 
-int kvm_s390_pci_init(void);
+int __init kvm_s390_pci_init(void);
 void kvm_s390_pci_exit(void);
 
 static inline bool kvm_s390_pci_interp_allowed(void)
-- 
2.38.1.584.g0f3c55d4c2-goog

