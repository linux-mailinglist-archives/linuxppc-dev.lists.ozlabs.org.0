Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6817A45317E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 12:54:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Htkx50JbVz3cSf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 22:54:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=PRoUphX+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+823bceb16b6acc74ecec+6659+infradead.org+dwmw2@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=PRoUphX+; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtktS6vmYz2ybM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 22:51:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ThsOSYmYD8dlkFVZCot5XM+hXrGwbgaPOIk3p6njr20=; b=PRoUphX+pIULR3EbrwPwnXgZQE
 KJugHFdqYqZvzpg14jZ+UpMDllj4vfjtrPD0lLxvo6JoT4Oms1Gjd+23QSBHZTWjHd9lTq6fEa4no
 XChwpj6zE/6jmAGntIbuUBNorfTtou+6pVcO8oN9Bs3z5CM05cr80+MywMlpTRl5c5+YlEBDorAFI
 SQ8S165jKSb1SSFMjdcMLe3LHmkr+nflaFHAm5L8E/8kSsmppgHNaE5xEvdZlxfeNrY3hHwmfPOut
 aQUbvSydHeSw3h9UeJ0Ftuscprr+yKiuvWdd8x3latc3Zsg51BamnkgdwLJXQdNdy8RT7S85pJ2T+
 yfiUlBOA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmwzC-006iYi-Vu; Tue, 16 Nov 2021 11:50:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mmwzD-000VDb-5r; Tue, 16 Nov 2021 11:50:51 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	kvm <kvm@vger.kernel.org>
Subject: [PATCH 2/7] KVM: Add Makefile.kvm for common files, use it for x86
Date: Tue, 16 Nov 2021 11:50:46 +0000
Message-Id: <20211116115051.119956-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116115051.119956-1-dwmw2@infradead.org>
References: <5047c2591310e503491850ef683f251395247d50.camel@infradead.org>
 <20211116115051.119956-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Woodhouse <dwmw@amazon.co.uk>

Splitting kvm_main.c out into smaller and better-organized files is
slightly non-trivial when it involves editing a bunch of per-arch
KVM makefiles. Provide virt/kvm/Makefile.kvm for them to include.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/Makefile |  7 +------
 virt/kvm/Makefile.kvm | 13 +++++++++++++
 2 files changed, 14 insertions(+), 6 deletions(-)
 create mode 100644 virt/kvm/Makefile.kvm

diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index 75dfd27b6e8a..30f244b64523 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -7,12 +7,7 @@ ifeq ($(CONFIG_FRAME_POINTER),y)
 OBJECT_FILES_NON_STANDARD_vmenter.o := y
 endif
 
-KVM := ../../../virt/kvm
-
-kvm-y			+= $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o \
-				$(KVM)/eventfd.o $(KVM)/irqchip.o $(KVM)/vfio.o \
-				$(KVM)/dirty_ring.o $(KVM)/binary_stats.o
-kvm-$(CONFIG_KVM_ASYNC_PF)	+= $(KVM)/async_pf.o
+include $(srctree)/virt/kvm/Makefile.kvm
 
 kvm-y			+= x86.o emulate.o i8259.o irq.o lapic.o \
 			   i8254.o ioapic.o irq_comm.o cpuid.o pmu.o mtrr.o \
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
new file mode 100644
index 000000000000..ee9c310f3601
--- /dev/null
+++ b/virt/kvm/Makefile.kvm
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for Kernel-based Virtual Machine module
+#
+
+KVM ?= ../../../virt/kvm
+
+kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
+kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
+kvm-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
+kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
+kvm-$(CONFIG_HAVE_KVM_IRQCHIP) += $(KVM)/irqchip.o
+kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
-- 
2.31.1

