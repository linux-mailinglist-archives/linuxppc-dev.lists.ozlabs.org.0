Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 801CA6172CD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:39:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2jyn2rYvz3fRh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:39:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ddAfxHTl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3fftiywykdlgqcylhaemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ddAfxHTl;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jXR1hFjz3cNJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:19:51 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id c7-20020a170903234700b0018729febd96so207432plh.19
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=s9AuxTlRjBrfjYkcaQi28he/RkCYbCa6yMT59uzOKa0=;
        b=ddAfxHTlEUHw0qawyyn7Bns3LOyks9re4MtMC6FAIFAvlDf6eK/nu/+/9Fi10x1R6n
         WWJsCNbWaFv5FoXY2JkfL2gPHfmH7n5Ig/c/8vgYFwan9v+I5VkTcY5cAcyMIsF0YYgl
         ayeymXyuzlb1ZK6RywTZFK6M2TrYNtbmp52NtBkrAW3CizVOcP2GK1YSKNk0hRzbGX/H
         t6V+7QqjJlqd98Pv08NBqx2q5El2vxmRcwGZXuIwYC0OoPXag/D+TlMulKYngdYVLuGi
         IcUk8i0bIt121WR3Ua8dNN2eN53mKcAGIC6t4monNq6evoAdLql3aLFHNiEvl7F6ATwg
         1KbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9AuxTlRjBrfjYkcaQi28he/RkCYbCa6yMT59uzOKa0=;
        b=eDbIyjzm6ZwMP08LGDsH05wN+ijFMv0R/BrCmFJb9XaeDK1COb5xGBm2wzHcKHqsxS
         NDjiMjSbobxRRgzUasKwEmkF0GPu1orLZUwd/OWPtRk5t9UqwlbZI87yLw6by8+MKtS4
         Xh5TgSKYTTo3qCdb7WEj7gUeNT08j4NDv3Y6Pw/RjgAT65mwV7EJMJwxyqBmWOgPGnn9
         UglqGO/fDSWX1GHiQ49z6EljdTv0HRxlSh2seZRG7xkk1Q8tgjD0QDPVf39l7SuzHTxK
         IfdTpf6nuu5N/tnx+p5FUD8NcjtMSFgXMEz1Eeuqg67e5sBojTmdek+Se5lcLRkcUU8k
         qgjg==
X-Gm-Message-State: ACrzQf2ZE/5dXitjq0cKXdv1o3FVIKw9f8vkQCPJ0/+A7bUedikeLLMV
	5SKA9wzNgtSCFVkN38whAw8jqc+/DJc=
X-Google-Smtp-Source: AMsMyM4Aj3fLciSdgeuMbOdggWgonn7AFJaBAotEN5fF2aTBDAVACdmSaSGC1ByL/Xgyuk/Z8cG2B3zdT14=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:240a:b0:183:6555:7a89 with SMTP id
 e10-20020a170903240a00b0018365557a89mr27116619plo.68.1667431189462; Wed, 02
 Nov 2022 16:19:49 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:48 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-22-seanjc@google.com>
Subject: [PATCH 21/44] KVM: MIPS: Register die notifier prior to kvm_init()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Call kvm_init() only after _all_ setup is complete, as kvm_init() exposes
/dev/kvm to userspace and thus allows userspace to create VMs (and call
other ioctls).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mips.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 75681281e2df..ae7a24342fdf 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1640,16 +1640,17 @@ static int __init kvm_mips_init(void)
 	if (ret)
 		return ret;
 
-	ret = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
-
-	if (ret)
-		return ret;
 
 	if (boot_cpu_type() == CPU_LOONGSON64)
 		kvm_priority_to_irq = kvm_loongson3_priority_to_irq;
 
 	register_die_notifier(&kvm_mips_csr_die_notifier);
 
+	ret = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (ret) {
+		unregister_die_notifier(&kvm_mips_csr_die_notifier);
+		return ret;
+	}
 	return 0;
 }
 
-- 
2.38.1.431.g37b22c650d-goog

