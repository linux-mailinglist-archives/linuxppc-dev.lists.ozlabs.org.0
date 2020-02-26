Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B753616F65E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:15:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S2XY411tzDq7w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:15:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LlGqkLLz; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S2N14NBgzDqcc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:08:17 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id p7so740417pli.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 20:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N803Rlxjqi2Zye/wf/1l803z+FJx9F8eXRhqPNShi8I=;
 b=LlGqkLLz/2+CDt5lkkNpPOKqT1oNmHoQnxWGF1dB2NYRm7nOaH43Fiv0qY1ZdnntJI
 FMZZ0GxcHzRA13P4HBxe7Jm1SY8fT9e1HknO8tZYSEpxL8Vk67lBKQErZ5+0ZHASN/76
 HIrUxZX1EQruJmfT+qElicXAkOP2xjUxa3+1z0+j7yBqQ/ogQCyR6jOSEWqwABeWoJsK
 W1Ub7siFXdpirnaV4jfGnIwma4CHRyl7n7zZ4SOmHoXEJwqG0rZ2kfodkza4Rhvkq3YZ
 WvBXP+V8ZU8NiYwX2YaRx4ihrsvMwR8qL9oMrhQOt4xEsbPEy/PPxbBmKi8I0CfuEIMb
 pSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N803Rlxjqi2Zye/wf/1l803z+FJx9F8eXRhqPNShi8I=;
 b=hBWFs7cMeOEZuqPyZqgwBVYKBbS5Ji7PNOQzuZOv5VA3nduXE4AKdVFAxtoHJ1QNsU
 AtaeFjWkmHeAmuQ1aBAKG/6ALUvEpBM8EJ70h9dyalO0xdi8F4pwPVsyYAOPiKHTs6zk
 gomGVkRHq0rTZ5duXaMCdEBOs+O5JUkkR7TmBTSomfObmgnZtxqN1MpPhUTwtSHj0zoq
 w5WBUvGO7aNpItVkfUbEHIeOc0t4YO5Y35IXH2q5OG6KpJKldTkA5QdMd7NtrJZtmn5x
 Y3BQREDq6e4MOpl+aA5BVz0F1jYy6VxYMPsBNSgBaBfBHvRGyPbkr+S/ddLoeMHCIYiB
 /SNg==
X-Gm-Message-State: APjAAAWHSh7qb6RcN2vg9Wq+1QuCeYH5sa8Jyd2ePInMFmLlqCsGGLGO
 OzGzyJ5RnmkqpqRvWwwvHMRkHFid6KA=
X-Google-Smtp-Source: APXvYqxYg7l0h/fjYKDl2BhzVTYaXpB6pZvmp/y8EsnJ12atDH2CLxg0aPfkA9teTK8bMdUD4H9ijQ==
X-Received: by 2002:a17:902:7c85:: with SMTP id
 y5mr1914464pll.227.1582690094964; 
 Tue, 25 Feb 2020 20:08:14 -0800 (PST)
Received: from tee480.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d4sm604681pjg.19.2020.02.25.20.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 20:08:14 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 02/14] powerpc: Define new SRR1 bits for a future ISA
 version
Date: Wed, 26 Feb 2020 15:07:04 +1100
Message-Id: <20200226040716.32395-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226040716.32395-1-jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, bala24@linux.ibm.com,
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

