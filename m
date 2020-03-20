Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ABD18C72B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 06:41:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kCM20WHRzDrhY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 16:41:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s6HkSl73; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kBsj14mHzDrRv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 16:19:37 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id h72so418454pfe.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N803Rlxjqi2Zye/wf/1l803z+FJx9F8eXRhqPNShi8I=;
 b=s6HkSl73dcGB3NZnYKc7CMVuBUM5sZjwBZXg+RgK56LP8/xH/hhEGhwCzTDsD5d0GA
 Xx2hiMx7XQbRV5rr1XclteEHeP6pXYf8bFgyOW7D+2oySqJRyxqmatAShgzjGPFvtBRe
 9u3W+4XlGV2uac+d1ZYV9OVk24olF85xFPcVMUsGnb48wC6V8pm6u5FBWwTFHJutiNfK
 mKGy98h1rDWkHT6ipnzgWFlVscB4BBc6+DDwKr6foyun+Of4+kIqRu9uvXLwoisqlnCK
 hA8YcdX9cOcexi+P8US7KwYuBPJnHNucr9txN8xEGl2jl7XaHJjv52rEbjlQmGzXzPIm
 TWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N803Rlxjqi2Zye/wf/1l803z+FJx9F8eXRhqPNShi8I=;
 b=W/TCj+GoTR0hqhkpbjey9pLvkErhOf/A27uyffAkViOUjk0jdN43TnhnoI7YF0K2EP
 WEyZVI6CA4VdtN4RGfNQEbSRGhB76wK1qP1AtOPMiDC0sU2w+gZfUN+lxuhGaIDMt4t5
 a6yEC1w2GcmzmNxAkfdgA66zseqff7K8EFeqWu/UpPt3k3y9KzSoHLFtg6LMVD8QFFGA
 VPTjpJ2qir4wAiCz8IQxqVrKmT1pFbpp300Y70Oas5aRieiWSOTrrCVLXo1DV4uJwrXl
 0flsVVfpSnK/Hq9OSqapG3/n/1oHlmd6iF8lrmwoiXLgp0MZveFRQrFqC6hqGkimpw1z
 dzPQ==
X-Gm-Message-State: ANhLgQ2NNy3bbdm2ae1lioweFYcd7xe3H4qLwqH0i3N7DT7JPZk5T5aA
 uEGPism6F4hvnufl78jEq2EeUJnFcT4=
X-Google-Smtp-Source: ADFU+vufQauG5AqUTsikyIqdFCawPHRPdbA5/Cze6Nhn5E5Z4gLhKfAcf8FgV3VPM+fpmdYvwjSgAA==
X-Received: by 2002:a63:195a:: with SMTP id 26mr6427488pgz.400.1584681575017; 
 Thu, 19 Mar 2020 22:19:35 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id c207sm3988716pfb.47.2020.03.19.22.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 22:19:34 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 12/16] powerpc: Define new SRR1 bits for a future ISA
 version
Date: Fri, 20 Mar 2020 16:18:05 +1100
Message-Id: <20200320051809.24332-13-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320051809.24332-1-jniethe5@gmail.com>
References: <20200320051809.24332-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the BOUNDARY SRR1 bit definition for when the cause of an alignment
exception is a prefixed instruction that crosses a 64-byte boundary.
Add the PREFIXED SRR1 bit definition for exceptions caused by prefixed
instructions.

Bit 35 of SRR1 is called SRR1_ISI_N_OR_G. This name comes from it being
used to indicate that an ISI was due to the access being no-exec or
guarded. A future ISA version adds another purpose. It is also set if
there is an access in a cache-inhibited location for prefixed
instruction.  Rename from SRR1_ISI_N_OR_G to SRR1_ISI_N_G_OR_CIP.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: Combined all the commits concerning SRR1 bits.
---
 arch/powerpc/include/asm/reg.h      | 4 +++-
 arch/powerpc/kvm/book3s_hv_nested.c | 2 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index c7758c2ccc5f..173f33df4fab 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -762,7 +762,7 @@
 #endif
 
 #define   SRR1_ISI_NOPT		0x40000000 /* ISI: Not found in hash */
-#define   SRR1_ISI_N_OR_G	0x10000000 /* ISI: Access is no-exec or G */
+#define   SRR1_ISI_N_G_OR_CIP	0x10000000 /* ISI: Access is no-exec or G or CI for a prefixed instruction */
 #define   SRR1_ISI_PROT		0x08000000 /* ISI: Other protection fault */
 #define   SRR1_WAKEMASK		0x00380000 /* reason for wakeup */
 #define   SRR1_WAKEMASK_P8	0x003c0000 /* reason for wakeup on POWER8 and 9 */
@@ -789,6 +789,8 @@
 #define   SRR1_PROGADDR		0x00010000 /* SRR0 contains subsequent addr */
 
 #define   SRR1_MCE_MCP		0x00080000 /* Machine check signal caused interrupt */
+#define   SRR1_BOUNDARY		0x10000000 /* Prefixed instruction crosses 64-byte boundary */
+#define   SRR1_PREFIXED		0x20000000 /* Exception caused by prefixed instruction */
 
 #define SPRN_HSRR0	0x13A	/* Save/Restore Register 0 */
 #define SPRN_HSRR1	0x13B	/* Save/Restore Register 1 */
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index dc97e5be76f6..6ab685227574 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1169,7 +1169,7 @@ static int kvmhv_translate_addr_nested(struct kvm_vcpu *vcpu,
 		} else if (vcpu->arch.trap == BOOK3S_INTERRUPT_H_INST_STORAGE) {
 			/* Can we execute? */
 			if (!gpte_p->may_execute) {
-				flags |= SRR1_ISI_N_OR_G;
+				flags |= SRR1_ISI_N_G_OR_CIP;
 				goto forward_to_l1;
 			}
 		} else {
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 220305454c23..b53a9f1c1a46 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -1260,7 +1260,7 @@ long kvmppc_hpte_hv_fault(struct kvm_vcpu *vcpu, unsigned long addr,
 	status &= ~DSISR_NOHPTE;	/* DSISR_NOHPTE == SRR1_ISI_NOPT */
 	if (!data) {
 		if (gr & (HPTE_R_N | HPTE_R_G))
-			return status | SRR1_ISI_N_OR_G;
+			return status | SRR1_ISI_N_G_OR_CIP;
 		if (!hpte_read_permission(pp, slb_v & key))
 			return status | SRR1_ISI_PROT;
 	} else if (status & DSISR_ISSTORE) {
-- 
2.17.1

