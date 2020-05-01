Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC841C0D68
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:28:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CzlS47qdzDrNY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:28:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TDfs8vJi; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CytG34l4zDrM1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:49:26 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id p25so1054703pfn.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/WdKr7qU/RDrLC0fUrDX121JWKh5HnI24QVIyhKEGqA=;
 b=TDfs8vJijbzo8x8sqsBFoeXAke95jMoVORLQB1uDrUeH6T0kV/dWDNWdXbYE2RA+z3
 1fRBNC+TzFZtjy6FHgLTsStVPHBSsjJdC6G58lpZupaaYCdJjMmaYbmcW2IGkLPuqsnn
 yysrsrFruLkXdvCDHpjrmdgwZeDDw7QgxyeBIfHnxtBIbKTrsJeW1covrI98VyMarCHe
 //7RwaiLQYPrJiHF2YqrjVPhwV1s96Q8CQjNvi/euzOnEAzUknI33UHlTudb+rZITba+
 cGBSg1LOVNV4IkyrPJtu6LT1W1Q8tl1IoIBRuGzpo2oQfsVXp9n7ObhAZ+dBRDEoyV/Q
 jj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/WdKr7qU/RDrLC0fUrDX121JWKh5HnI24QVIyhKEGqA=;
 b=lWvFLJRiwa7hqGO/5ZAsmB8p2yCBilyFhakljD2Zu8o6IqLdz3VOURl0KmrqUc7oQW
 Qbum0hoeIexPEgSKWOnP50atmMngnYEri4kLhsNkONWrf0S50/4m/fwdUkAlH1WGPMMh
 Byce7I3/tnRX2owqBq1QpBfjZa0i4DYALvpA3ObpT7i6o4AfLYxH8BK64ESQr6/Jk5YZ
 2aEDLO5onlwxiAyJz/HGYnuSBZbE9HLy1RfEhlh9B88lpdIuK/2HjeT2tqXbR5lvfYW2
 N8JumVMRuupy9lza3PfC/Sav5mYCyiHaAtKqYVK0Q3MVFzFfpFFWvy+FJtZbW0F2Skyl
 dRnw==
X-Gm-Message-State: AGi0PuZgldZ0lQnvqW37JdC67xLvExBsLGVJkyNfDybfTKnjlIUJHHpA
 IbY0bfoyUT3X6SaTGo6QtV4X8WAf6lHhgQ==
X-Google-Smtp-Source: APiQypLPi98zQZJYWO11xW3A1bVFJ7av5hUwRRB6yogPQq3RVdYEW+pA2kZllBeEVFA7KQ5SV8nXcw==
X-Received: by 2002:aa7:9709:: with SMTP id a9mr2326045pfg.166.1588304963762; 
 Thu, 30 Apr 2020 20:49:23 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:49:23 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 22/28] powerpc: Define new SRR1 bits for a future ISA
 version
Date: Fri,  1 May 2020 13:42:14 +1000
Message-Id: <20200501034220.8982-23-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
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
index 773f76402392..f95eb8f97756 100644
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

