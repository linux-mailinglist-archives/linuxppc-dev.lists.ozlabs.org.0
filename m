Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B024536C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 17:05:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtrW510Dwz3cTc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 03:05:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtrTp6KTFz2yJF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 03:04:14 +1100 (AEDT)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1DD2D619FA;
 Tue, 16 Nov 2021 16:04:13 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mn0wN-005sTB-4l; Tue, 16 Nov 2021 16:04:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 2/7] KVM: mips: Use kvm_get_vcpu() instead of open-coded
 access
Date: Tue, 16 Nov 2021 16:03:58 +0000
Message-Id: <20211116160403.4074052-3-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116160403.4074052-1-maz@kernel.org>
References: <20211116160403.4074052-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, linuxppc-dev@lists.ozlabs.org,
 pbonzini@redhat.com, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com,
 anup.patel@wdc.com, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 david@redhat.com, imbrenda@linux.ibm.com, jgross@suse.com, npiggin@gmail.com,
 seanjc@google.com, paulus@samba.org, mpe@ellerman.id.au, f4bug@amsat.org,
 james.morse@arm.com, suzuki.poulose@arm.com, alexandru.elisei@arm.com,
 kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Juergen Gross <jgross@suse.com>, Huacai Chen <chenhuacai@kernel.org>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Anup Patel <anup.patel@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@samba.org>, James Morse <james.morse@arm.com>,
 kernel-team@android.com, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As we are about to change the way vcpus are allocated, mandate
the use of kvm_get_vcpu() instead of open-coding the access.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/mips/kvm/loongson_ipi.c | 4 ++--
 arch/mips/kvm/mips.c         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kvm/loongson_ipi.c b/arch/mips/kvm/loongson_ipi.c
index 3681fc8fba38..5d53f32d837c 100644
--- a/arch/mips/kvm/loongson_ipi.c
+++ b/arch/mips/kvm/loongson_ipi.c
@@ -120,7 +120,7 @@ static int loongson_vipi_write(struct loongson_kvm_ipi *ipi,
 		s->status |= data;
 		irq.cpu = id;
 		irq.irq = 6;
-		kvm_vcpu_ioctl_interrupt(kvm->vcpus[id], &irq);
+		kvm_vcpu_ioctl_interrupt(kvm_get_vcpu(kvm, id), &irq);
 		break;
 
 	case CORE0_CLEAR_OFF:
@@ -128,7 +128,7 @@ static int loongson_vipi_write(struct loongson_kvm_ipi *ipi,
 		if (!s->status) {
 			irq.cpu = id;
 			irq.irq = -6;
-			kvm_vcpu_ioctl_interrupt(kvm->vcpus[id], &irq);
+			kvm_vcpu_ioctl_interrupt(kvm_get_vcpu(kvm, id), &irq);
 		}
 		break;
 
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index ceacca74f808..6228bf396d63 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -479,7 +479,7 @@ int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu,
 	if (irq->cpu == -1)
 		dvcpu = vcpu;
 	else
-		dvcpu = vcpu->kvm->vcpus[irq->cpu];
+		dvcpu = kvm_get_vcpu(vcpu->kvm, irq->cpu);
 
 	if (intr == 2 || intr == 3 || intr == 4 || intr == 6) {
 		kvm_mips_callbacks->queue_io_int(dvcpu, irq);
-- 
2.30.2

