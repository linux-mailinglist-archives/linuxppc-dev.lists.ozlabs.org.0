Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BEE454C66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 18:46:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvVjs4HT5z3dpr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 04:46:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TYMfIkAp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=desiato.srs.infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=batv+060ef2ffc16683cdd84b+6660+infradead.org+dwmw2@desiato.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=TYMfIkAp; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvVb54WyQz2yZx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 04:41:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/evKXqcw/8FGr8TmFi1F9Nz8K19EsCZyfN23kozBzuY=; b=TYMfIkAp6L2TaYaVmW2RdETkMa
 8JmlGYHkGWEGXIh/VB9A4koqTyveOj149L8dAbNy73RDG749xVey0EKlby1WEdxfBf6CRgNI9uopW
 HlGhhECkiSnwUfnA+uQgIypdMC/Qmx4c54RBReiMZuWHCF7qWZlmCYiDKmn6erqIZdFAD3HY05V6+
 oiwrEiNDBG4MFjyBhiOo1/ZuwMzkCGq9ghulRf3rUe6qtninr8sN5auPWR8Kerr6IwsnD2l0kARXY
 dm1sR0sM/8naYQ+qqJazcbnF3lIDz7KoTdSeLxdn+CTnmHKOgSyIi/LPx/MpY3WU41S84H7ijEO4o
 JUxi4YCA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnOum-00GXWb-Ln; Wed, 17 Nov 2021 17:40:08 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mnOum-001Gxc-CK; Wed, 17 Nov 2021 17:40:08 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	kvm <kvm@vger.kernel.org>
Subject: [PATCH v3 07/12] KVM: arm64: Use Makefile.kvm for common files
Date: Wed, 17 Nov 2021 17:39:58 +0000
Message-Id: <20211117174003.297096-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117174003.297096-1-dwmw2@infradead.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/arm64/kvm/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 989bb5dad2c8..04a53f71a6b6 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -5,14 +5,12 @@
 
 ccflags-y += -I $(srctree)/$(src)
 
-KVM=../../../virt/kvm
+include $(srctree)/virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
 obj-$(CONFIG_KVM) += hyp/
 
-kvm-y := $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o $(KVM)/eventfd.o \
-	 $(KVM)/vfio.o $(KVM)/irqchip.o $(KVM)/binary_stats.o \
-	 arm.o mmu.o mmio.o psci.o perf.o hypercalls.o pvtime.o \
+kvm-y += arm.o mmu.o mmio.o psci.o perf.o hypercalls.o pvtime.o \
 	 inject_fault.o va_layout.o handle_exit.o \
 	 guest.o debug.o reset.o sys_regs.o \
 	 vgic-sys-reg-v3.o fpsimd.o pmu.o \
-- 
2.31.1

