Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF647D097B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 09:25:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=X80VXgv9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBbhV1zH7z3dL4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 18:25:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=X80VXgv9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBbct5QYjz3cP5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 18:22:06 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6b1e46ca282so499424b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 00:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786524; x=1698391324; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3zCDz3wNvDFZIfhQp3mdMMGRfliX9zzX2s9SoD5fk8=;
        b=X80VXgv9E98jqRDVbGi/6dVI7OxVJuxVNjtBeHe4cXsqLtZ+ExQyp/zbBMB0N1/5J0
         U+KB5E58DW8xCJlywyPHhs0IYpVPmIVMBZIiQ/P+25afrK4bZ9BzFG2bVIpfHo7A3cLT
         RYDnZb6YJU1chNO77u/CHH0y5H2eGa/wxzAn2J6VR6csx46In1E+VUn9SL3WcEdsw7Ge
         MCrcb4D1JXVeY12i0YDMW3ZO++6fQ/c7xYp/W/Z8LFJ6kXfCRsrt3qr+flci+6fpg10I
         QfvHE+hevmzGuRMZOxKQpHCrgszEIIxqJkCd88IbN3xaGKIZectwDNVhjY+2fkc6w4a3
         1Wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786524; x=1698391324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3zCDz3wNvDFZIfhQp3mdMMGRfliX9zzX2s9SoD5fk8=;
        b=kScSsauLxsDYWOTp7f8MeW3YC5fD4519h0skuNey/b/76dvqTazYt9bpxOeWBlIZyK
         QxUffTY9doSY1icIg0w39h4TB59CuoCnffh6SEB9bxafS5yTbZr0pfn4kHMXskjpxSRQ
         rolPjfxp3HhJoHmZVMgPsyG5lIcYSU6KkLpwXPi2EOP6C3T7CivISp7OWp31/ohBCc/N
         pjcZEuGe8r1PDqQV2HyZ199HLtNZWIsnYmHBlx78/uhi9EpzH1+vdkk1BYLzd95S8ojO
         /Hfp92ta22pbRYBJCEeH4eGxupcW5B9JWL4vCS9IAG8hEVk7PNTxuDw4CdSFfA9oD02b
         whZw==
X-Gm-Message-State: AOJu0YyxTTv42Rsjm7Tmla12ZzGqXIMf1em4isTlbb43FnjOJejo4DNd
	OJP4FXsiUuGhF0Uc+RE/i3BDXQ==
X-Google-Smtp-Source: AGHT+IG244Unqcch61/RKDkaln/AZV8DtWkK/fAUAz824/pCQp9YvCbi/8qrpjv0yroTiFuFOsikCg==
X-Received: by 2002:aa7:962b:0:b0:690:38b6:b2db with SMTP id r11-20020aa7962b000000b0069038b6b2dbmr951624pfg.6.1697786523600;
        Fri, 20 Oct 2023 00:22:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:22:03 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v3 3/9] RISC-V: KVM: Allow some SBI extensions to be disabled by default
Date: Fri, 20 Oct 2023 12:51:34 +0530
Message-Id: <20231020072140.900967-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-serial@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, all SBI extensions are enabled by default which is
problematic for SBI extensions (such as DBCN) which are forwarded
to the KVM user-space because we might have an older KVM user-space
which is not aware/ready to handle newer SBI extensions. Ideally,
the SBI extensions forwarded to the KVM user-space must be
disabled by default.

To address above, we allow certain SBI extensions to be disabled
by default so that KVM user-space must explicitly enable such
SBI extensions to receive forwarded calls from Guest VCPU.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++
 arch/riscv/kvm/vcpu.c                 |  6 +++
 arch/riscv/kvm/vcpu_sbi.c             | 57 +++++++++++++--------------
 3 files changed, 38 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 8d6d4dce8a5e..c02bda5559d7 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -35,6 +35,9 @@ struct kvm_vcpu_sbi_return {
 struct kvm_vcpu_sbi_extension {
 	unsigned long extid_start;
 	unsigned long extid_end;
+
+	bool default_unavail;
+
 	/**
 	 * SBI extension handler. It can be defined for a given extension or group of
 	 * extension. But it should always return linux error codes rather than SBI
@@ -59,6 +62,7 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid);
 int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
+void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 
 #ifdef CONFIG_RISCV_SBI_V01
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c061a1c5fe98..e087c809073c 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -141,6 +141,12 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (rc)
 		return rc;
 
+	/*
+	 * Setup SBI extensions
+	 * NOTE: This must be the last thing to be initialized.
+	 */
+	kvm_riscv_vcpu_sbi_init(vcpu);
+
 	/* Reset VCPU */
 	kvm_riscv_reset_vcpu(vcpu);
 
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 9cd97091c723..bda8b0b33343 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -155,14 +155,8 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	/*
-	 * We can't set the extension status to available here, since it may
-	 * have a probe() function which needs to confirm availability first,
-	 * but it may be too early to call that here. We can set the status to
-	 * unavailable, though.
-	 */
-	if (!reg_val)
-		scontext->ext_status[sext->ext_idx] =
+	scontext->ext_status[sext->ext_idx] = (reg_val) ?
+			KVM_RISCV_SBI_EXT_AVAILABLE :
 			KVM_RISCV_SBI_EXT_UNAVAILABLE;
 
 	return 0;
@@ -188,16 +182,8 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	/*
-	 * If the extension status is still uninitialized, then we should probe
-	 * to determine if it's available, but it may be too early to do that
-	 * here. The best we can do is report that the extension has not been
-	 * disabled, i.e. we return 1 when the extension is available and also
-	 * when it only may be available.
-	 */
-	*reg_val = scontext->ext_status[sext->ext_idx] !=
-				KVM_RISCV_SBI_EXT_UNAVAILABLE;
-
+	*reg_val = scontext->ext_status[sext->ext_idx] ==
+				KVM_RISCV_SBI_EXT_AVAILABLE;
 	return 0;
 }
 
@@ -337,18 +323,8 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 			    scontext->ext_status[entry->ext_idx] ==
 						KVM_RISCV_SBI_EXT_AVAILABLE)
 				return ext;
-			if (scontext->ext_status[entry->ext_idx] ==
-						KVM_RISCV_SBI_EXT_UNAVAILABLE)
-				return NULL;
-			if (ext->probe && !ext->probe(vcpu)) {
-				scontext->ext_status[entry->ext_idx] =
-					KVM_RISCV_SBI_EXT_UNAVAILABLE;
-				return NULL;
-			}
 
-			scontext->ext_status[entry->ext_idx] =
-				KVM_RISCV_SBI_EXT_AVAILABLE;
-			return ext;
+			return NULL;
 		}
 	}
 
@@ -419,3 +395,26 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
 
 	return ret;
 }
+
+void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+
+		if (ext->probe && !ext->probe(vcpu)) {
+			scontext->ext_status[entry->ext_idx] =
+				KVM_RISCV_SBI_EXT_UNAVAILABLE;
+			continue;
+		}
+
+		scontext->ext_status[entry->ext_idx] = ext->default_unavail ?
+					KVM_RISCV_SBI_EXT_UNAVAILABLE :
+					KVM_RISCV_SBI_EXT_AVAILABLE;
+	}
+}
-- 
2.34.1

