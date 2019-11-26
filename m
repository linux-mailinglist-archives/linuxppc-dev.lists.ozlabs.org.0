Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD281098B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:32:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MXbN3XGvzDqgX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:32:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UFZL3oOj"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNF3N2zzDqBW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:22:37 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id o8so3228178pls.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tE2BEoxThlbLsBzvgjDGGfiQqF/FbnTA/7glIGIOwYU=;
 b=UFZL3oOj/mw/5O8MDysuwr5cb/rxQrQSLKWygmvPvwnoPsasAY+NTJj+HCFdJtcuWC
 a43WG4827W1F6u6JsM3JGKArCptrTr/osdx4855BGR6yECNfBZmy0N8oFVjd3lKJvLde
 W4mK7CjN4p6F7LSXsRg4NaGUkBhNf7fyBfx5YmNZmbtIFMd5ktVjkJr99JJndmBNjp7G
 fdaUhm/Qv+irvq0xIWOIDYFAvvDNHzf+gq18vuWNwIbSpUyoC45/ATrdlt/SZo2/nDn3
 SdsmU6yzh3INTCYEGXsfyfoG2T6CyLYtKWBaTeq2SPIbEI8oxaKrXSXwWg8D5x/iXOVn
 66nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tE2BEoxThlbLsBzvgjDGGfiQqF/FbnTA/7glIGIOwYU=;
 b=ijI8tyu8Y0q5xaHDmOase5/jOdoTuZAHJs36dHm/7Lj1+u6mkFsw3qEdQdFBe56XJn
 SXKl06FKJpz7bzkUGLX2h6u0BqsHm9e/TlOtPDWQpT7ARO7gSUwE1SIWpbBXuxOqCNzi
 UfWEIVODSIi0Y7AVVyhP/JQbW/YbPSpcTWiXQOidZiqznbUQ7bTJOaDDkPVi2NqGtN8M
 f/yJtchtVuRXa+p5fuGGps3Sx7JJ5sNZw+10SWLzkvSVxKXWhMKZ+BjkJtbRC/XO+QAN
 E5IDGqcCa8fkmrkx4pGYzllf++xORBllPnhwOxMPwakkAvlNTbHKLjbI+83SmnNSXVvz
 T4hw==
X-Gm-Message-State: APjAAAUMC/qC7bvI2c1k1pVsu0SOyLBwkJEJTD8ZrpfDiGRaNVTjEYxf
 Fc3c1op6hdlfGtTkK4l9DGnmG22A
X-Google-Smtp-Source: APXvYqxQzqLyOWcoQ4uOnTIlnCVUDIejMcv4ombKYJ2lTzZW3VYmycVKtOaka/neomsIW3jCxsmOYw==
X-Received: by 2002:a17:90a:a405:: with SMTP id
 y5mr4244035pjp.102.1574745755439; 
 Mon, 25 Nov 2019 21:22:35 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:34 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/18] powerpc: Rename Bit 35 of SRR1 to indicate new purpose
Date: Tue, 26 Nov 2019 16:21:27 +1100
Message-Id: <20191126052141.28009-5-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126052141.28009-1-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bit 35 of SRR1 is called SRR1_ISI_N_OR_G. This name comes from it being
used to indicate that an ISI was due to the access being no-exec or
guarded. A future ISA version adds another purpose. Now it is also set if there
is a access in a cache-inhibited location for prefixed instruction.
Rename from SRR1_ISI_N_OR_G -> SRR1_ISI_N_G_OR_CIP to reflected this new
role.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/reg.h      | 2 +-
 arch/powerpc/kvm/book3s_hv_nested.c | 2 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 0a6d39fb4769..d3d8212603cb 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -750,7 +750,7 @@
 #define SPRN_SRR0	0x01A	/* Save/Restore Register 0 */
 #define SPRN_SRR1	0x01B	/* Save/Restore Register 1 */
 #define   SRR1_ISI_NOPT		0x40000000 /* ISI: Not found in hash */
-#define   SRR1_ISI_N_OR_G	0x10000000 /* ISI: Access is no-exec or G */
+#define   SRR1_ISI_N_G_OR_CIP	0x10000000 /* ISI: Access is no-exec or G or CI for a prefixed instruction */
 #define   SRR1_ISI_PROT		0x08000000 /* ISI: Other protection fault */
 #define   SRR1_WAKEMASK		0x00380000 /* reason for wakeup */
 #define   SRR1_WAKEMASK_P8	0x003c0000 /* reason for wakeup on POWER8 and 9 */
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index cdf30c6eaf54..32798ee76f27 100644
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
2.20.1

