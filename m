Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ECB4BD6CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 08:26:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2DPd4vyXz3dgs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 18:26:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mgfW9lTu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mgfW9lTu; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2DLw6s7vz30Dy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 18:24:08 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id h125so13553230pgc.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 23:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yCwkFw9olHS4UIExgf7k90bsjYOzTjKzOLVpcFcbXHs=;
 b=mgfW9lTuRrmPQlj5NBPYI5oJisVKiDGK3Zb1ZSmGz+I9hA0K88gS/co0FGuNNySldl
 SjVgNY3mGDm7T1Y2rVzI7E50BFAxxKFS/xi/5JVwSqNJFKdlNHVUacqRMxp5l5d82lhd
 iE31adP4QjqafleFjYvL7QmJAE97la19Pkh/s2/PCSfg8f9mUGnfgasf49meC8xQRahG
 WbNFDa1lsczUqmVHIFW6geRk9kkwsS/SyEfKtdwDbRADkja1JR5c7ahItSyPtDN/jc/d
 Y3fHdJjxBquB2KmuYlhDl31QtJeWnNdEKDyKc13/FNpvYI4XpwOT092LrQwLOFKaqxg8
 fqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yCwkFw9olHS4UIExgf7k90bsjYOzTjKzOLVpcFcbXHs=;
 b=DB+P40NwdGfWuM5e5liMkgyUZAJrEnbk+OcWWOOpKi28SDOGGYgWgzsaAHPEsI2fXR
 4c+F5ozP1iZZ8AwItCBGBGF7xEm4oi+YeJVQpFIux+gvkkLPEwquQs3s8oP906Plbfp1
 yTH4magU2/8gT8CXnNARVbwJsv6Ez6MIcEqYlYWTyaCCpXRT36IOP3ND1KXy6XmiKha0
 qDuXgiuXQ+c2O/yLwutyX7fmg77Z6ZM3oAM5c3hNZoe6WUzPV8uiWejEIiflMxJ6qgIZ
 XPybKTIXQUgSzLgBws2oq6ptAxRXaE05CfJ+giwfmPomjsBlnqvZUEm5DKF9dGnEHxne
 8c+Q==
X-Gm-Message-State: AOAM532kNJIG1SsL01B2vSz5gpyrOFC7B1Pu9RyoHJAZjTx5bFyNE90F
 PpF26/FFy+xXWOOMZ6vIrQa51Rz5/bU=
X-Google-Smtp-Source: ABdhPJwrBX3LX3SnHRo8Q5lN/3lMcuN4WIkSFenKhpUO8Y8lQTynEib8+eRhaKdCjokGhZbBPovctw==
X-Received: by 2002:a65:6e93:0:b0:362:da8d:88d5 with SMTP id
 bm19-20020a656e93000000b00362da8d88d5mr15047348pgb.194.1645428247143; 
 Sun, 20 Feb 2022 23:24:07 -0800 (PST)
Received: from bobo.ibm.com (193-116-225-41.tpgi.com.au. [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id me14sm6825901pjb.41.2022.02.20.23.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 23:24:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/3] KVM: PPC: Add KVM_CAP_PPC_AIL_MODE_3
Date: Mon, 21 Feb 2022 17:23:53 +1000
Message-Id: <20220221072353.2219034-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220221072353.2219034-1-npiggin@gmail.com>
References: <20220221072353.2219034-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 Documentation/virt/kvm/api.rst         | 14 ++++++++++++++
 arch/powerpc/include/asm/setup.h       |  2 ++
 arch/powerpc/kvm/powerpc.c             | 20 ++++++++++++++++++++
 arch/powerpc/platforms/pseries/setup.c | 12 +++++++++++-
 include/uapi/linux/kvm.h               |  1 +
 tools/include/uapi/linux/kvm.h         |  1 +
 6 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index bb8cfddbb22d..404056a9a35a 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6995,6 +6995,20 @@ indicated by the fd to the VM this is called on.
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
index 2ad0ccd202d5..7dc101ea778c 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -678,6 +678,26 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = 1;
 		break;
 #endif
+	case KVM_CAP_PPC_AIL_MODE_3:
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
+			} else {
+				r = 0;
+			}
+		} else {
+			r = 0;
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
index 9563d294f181..65f231d048a8 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1133,6 +1133,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
 #define KVM_CAP_VM_GPA_BITS 207
 #define KVM_CAP_XSAVE2 208
+#define KVM_CAP_PPC_AIL_MODE_3 209
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index 9563d294f181..65f231d048a8 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -1133,6 +1133,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
 #define KVM_CAP_VM_GPA_BITS 207
 #define KVM_CAP_XSAVE2 208
+#define KVM_CAP_PPC_AIL_MODE_3 209
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.23.0

