Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 310501C66C4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:24:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3QS1ftszDrS5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:24:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=th9SMcYd; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2cC0rYTzDqTG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:47:55 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 145so317921pfw.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zKXoIzf535eMhWR2cM2XBNY+s2TI5PsaO8wOzrfsArQ=;
 b=th9SMcYdbr6I5NKJx794bG8hxdOiEUzGD2g8/I0H65QlON9ngJeGPEZBdybEJatU6i
 eBumz4IzEBIZiFXwqZX+VbNQifGTtYx0/knDGBymbbRGp/pbwSf2OrPfaOQfDzyIcqYc
 4g4u0JF+nGAdl/wxt8foaeyB0S0NttbICT9KJPM4w77dKnFT29O96jUmetzFszEZtcJk
 r47qeK5149I/i67q5yHV/nqHCiemPZd2veUSyV6Fmn3EfcgGfNwnvFYo/hb0bC8dNU/h
 TDwmlvdmyVGiMGcO8Zc4GS/UYcPMmI/TkZwa2oM679dlI6gKLsBCmddREaCkjtNTPRm4
 ioKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zKXoIzf535eMhWR2cM2XBNY+s2TI5PsaO8wOzrfsArQ=;
 b=gz4QuBqdPilACFWgIM/bqQKr9gcD1fi++6FWJflv84LYYx10Mo6Pt7mUwSWZX0Cwp3
 OArULdPzbTL+BeiSq44kN7DGJngvdruVlygyz5Sw6AomzI1nrNfnYNOj+Qp0rHhCJxeH
 3AbOC+9MlrTw6Sf6TQkwNB6SlwxniMmicyv3idfq3wg3iW85GMzkG9sWFQZ/nyfgNmK9
 TTMB4XIo6df7daJ5EzO4uFab9swrMDfeHud9zBiKVHDpBkrGrSEuBRPw3XrZzBmM38+q
 4d7zr5Pk4WC3tFOoCOrWU6HBUg5mI/XEaYPe2BxhqiaWPLsUdVhQzo/CX4LLZoFO4WIh
 Fglg==
X-Gm-Message-State: AGi0PuYkSiyZUo6g3E0H0p3xnRuzw81egRArtACAFmHrK3m2mz+D2uob
 mYySkySYaACu0NfFmkX2fo5nG+NvDkWLJg==
X-Google-Smtp-Source: APiQypKUTJrdZI+q3Eqoqvbho45U4T2P8j3mZ+wC47gipifvrRV1VPzxCXtwG+oZuOHbxjcEq8xkGA==
X-Received: by 2002:a62:e213:: with SMTP id a19mr6079587pfi.180.1588736872175; 
 Tue, 05 May 2020 20:47:52 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:47:51 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 22/30] powerpc: Define new SRR1 bits for a future ISA
 version
Date: Wed,  6 May 2020 13:40:42 +1000
Message-Id: <20200506034050.24806-23-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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

Reviewed-by: Alistair Popple <alistair@popple.id.au>
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

