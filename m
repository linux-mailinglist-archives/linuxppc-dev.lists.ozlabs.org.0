Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8444BF23B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 07:50:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2qYG0bgxz3cWf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 17:50:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SWk/strL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SWk/strL; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2qVV6jlVz3bXg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 17:47:46 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id c9so2835075pll.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 22:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zyP1CDnBZz+or+GUa/iSW1eRXWHN1F8ZgUdecrqgvGI=;
 b=SWk/strLjmDoEYAWt8Ial+BNg08vwBhkBUAUTiIrOm0h9JzI9089awMslPw9rrQLM7
 lr7eqFEnycVzvez1IMdL38nWgBzcV/Muzj7l9r2/Y/wnO4J0AK6f/gdoaMhS2FpggY0L
 HNQGzdbKs0vr0wKftafgEUGw4oA9MQLroskGgNNSFXht6N/jr79GE/r6sT1/D5ikaEwj
 cl5EKakhOpx+Xs+8iQXiOzjWazMY1zUol1+d8KkdovxV+sl7CJET1TjvOgSRxPGe74bl
 P8Dzcpr9ScGa3N16cBFtl902HqQUAJTrPCgUImxPQTd8EXV1+az5rNzsTToy58GgH0jF
 rmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zyP1CDnBZz+or+GUa/iSW1eRXWHN1F8ZgUdecrqgvGI=;
 b=QNAOaNoBh9+aspuUFRanDU2Ogy9qLfDR+xywBDQjX398CmIwT1R+baP1WFrJMFPAgL
 htmDgWMLm/Nv0oQiJh4XUbr/OFIObQJt6vI+Ib2Z8vEoVU4Zz0JwhxpmDPD8Xn5i3CbH
 Oo8hFyv7JnfQvJFAq9Ve4o4jI/6UQVYYPCoNJj3k7/Nbi+QsJzj3QCAPcMMhR+P27NRp
 YPrWagp29STIwV3Sy9sSWglVmBnR/PhRv7Qc5RlK3RdIP62DiOT0QNUcU8KCk17vgont
 hwuI/S+UnzliuY/dKRTKSGNATHxrhfnzwV/B7momL0GMx/YtjzP7xS3J9Ug+CJkK789U
 23fg==
X-Gm-Message-State: AOAM532cWTzjSaSWLV3AULLB64+UkcbTm1ssod05bUr/84h+vGvLP1pm
 FJLK/UwphSIt0UQnIAgWnqVz6Jp5fhY=
X-Google-Smtp-Source: ABdhPJzOfiyirnWhuN3Uc4DQ4wrL7Ir3DNaGBfpOD/pWn21PotYcLFLrspNR2ceR5MpdIJgZliatsA==
X-Received: by 2002:a17:90a:9288:b0:1bc:568b:55bc with SMTP id
 n8-20020a17090a928800b001bc568b55bcmr2678772pjo.9.1645512465185; 
 Mon, 21 Feb 2022 22:47:45 -0800 (PST)
Received: from bobo.ibm.com (193-116-225-41.tpgi.com.au. [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id d8sm16346711pfv.84.2022.02.21.22.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 22:47:44 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 3/3] KVM: PPC: Add KVM_CAP_PPC_AIL_MODE_3
Date: Tue, 22 Feb 2022 16:47:27 +1000
Message-Id: <20220222064727.2314380-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220222064727.2314380-1-npiggin@gmail.com>
References: <20220222064727.2314380-1-npiggin@gmail.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add KVM_CAP_PPC_AIL_MODE_3 to advertise the capability to set the AIL
resource mode to 3 with the H_SET_MODE hypercall. This capability
differs between processor types and KVM types (PR, HV, Nested HV), and
affects guest-visible behaviour.

QEMU will implement a cap-ail-mode-3 to control this behaviour[1], and
use the KVM CAP if available to determine KVM support[2].

[1] https://lists.nongnu.org/archive/html/qemu-ppc/2022-02/msg00437.html
[2] https://lists.nongnu.org/archive/html/qemu-ppc/2022-02/msg00439.html

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 Documentation/virt/kvm/api.rst         | 14 ++++++++++++++
 arch/powerpc/include/asm/setup.h       |  2 ++
 arch/powerpc/kvm/powerpc.c             | 17 +++++++++++++++++
 arch/powerpc/platforms/pseries/setup.c | 12 +++++++++++-
 include/uapi/linux/kvm.h               |  1 +
 tools/include/uapi/linux/kvm.h         |  1 +
 6 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index a4267104db50..9954568c7eab 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6997,6 +6997,20 @@ indicated by the fd to the VM this is called on.
 This is intended to support intra-host migration of VMs between userspace VMMs,
 upgrading the VMM process without interrupting the guest.
 
+7.30 KVM_CAP_PPC_AIL_MODE_3
+-------------------------------
+
+:Capability: KVM_CAP_PPC_AIL_MODE_3
+:Architectures: ppc
+:Type: vm
+
+This capability indicates that the kernel supports the mode 3 setting for the
+"Address Translation Mode on Interrupt" aka "Alternate Interrupt Location"
+resource that is controlled with the H_SET_MODE hypercall.
+
+This capability allows a guest kernel to use a better-performance mode for
+handling interrupts and system calls.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index d0d3dd531c7f..a555fb77258a 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -28,11 +28,13 @@ void setup_panic(void);
 #define ARCH_PANIC_TIMEOUT 180
 
 #ifdef CONFIG_PPC_PSERIES
+extern bool pseries_reloc_on_exception(void);
 extern bool pseries_enable_reloc_on_exc(void);
 extern void pseries_disable_reloc_on_exc(void);
 extern void pseries_big_endian_exceptions(void);
 void __init pseries_little_endian_exceptions(void);
 #else
+static inline bool pseries_reloc_on_exception(void) { return false; }
 static inline bool pseries_enable_reloc_on_exc(void) { return false; }
 static inline void pseries_disable_reloc_on_exc(void) {}
 static inline void pseries_big_endian_exceptions(void) {}
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 2ad0ccd202d5..56a6b66d16fe 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -678,6 +678,23 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = 1;
 		break;
 #endif
+	case KVM_CAP_PPC_AIL_MODE_3:
+		r = 0;
+		/*
+		 * KVM PR, POWER7, and some POWER9s don't support AIL=3 mode.
+		 * The POWER9s can support it if the guest runs in hash mode,
+		 * but QEMU doesn't necessarily query the capability in time.
+		 */
+		if (hv_enabled) {
+			if (kvmhv_on_pseries()) {
+				if (pseries_reloc_on_exception())
+					r = 1;
+			} else if (cpu_has_feature(CPU_FTR_ARCH_207S) &&
+				  !cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
+				r = 1;
+			}
+		}
+		break;
 	default:
 		r = 0;
 		break;
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 83a04d967a59..182525c2abd5 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -353,6 +353,13 @@ static void pseries_lpar_idle(void)
 	pseries_idle_epilog();
 }
 
+static bool pseries_reloc_on_exception_enabled;
+
+bool pseries_reloc_on_exception(void)
+{
+	return pseries_reloc_on_exception_enabled;
+}
+
 /*
  * Enable relocation on during exceptions. This has partition wide scope and
  * may take a while to complete, if it takes longer than one second we will
@@ -377,6 +384,7 @@ bool pseries_enable_reloc_on_exc(void)
 					" on exceptions: %ld\n", rc);
 				return false;
 			}
+			pseries_reloc_on_exception_enabled = true;
 			return true;
 		}
 
@@ -404,7 +412,9 @@ void pseries_disable_reloc_on_exc(void)
 			break;
 		mdelay(get_longbusy_msecs(rc));
 	}
-	if (rc != H_SUCCESS)
+	if (rc == H_SUCCESS)
+		pseries_reloc_on_exception_enabled = false;
+	else
 		pr_warn("Warning: Failed to disable relocation on exceptions: %ld\n",
 			rc);
 }
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 5191b57e1562..507ee1f2aa96 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1134,6 +1134,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_GPA_BITS 207
 #define KVM_CAP_XSAVE2 208
 #define KVM_CAP_SYS_ATTRIBUTES 209
+#define KVM_CAP_PPC_AIL_MODE_3 210
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index 5191b57e1562..507ee1f2aa96 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -1134,6 +1134,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_GPA_BITS 207
 #define KVM_CAP_XSAVE2 208
 #define KVM_CAP_SYS_ATTRIBUTES 209
+#define KVM_CAP_PPC_AIL_MODE_3 210
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.23.0

