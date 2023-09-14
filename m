Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C727B79F8A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 05:07:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YH6fs4CE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmMh54dsZz3c6c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 13:07:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YH6fs4CE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmMfK6nR5z2yh5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 13:06:17 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c3887039d4so3927585ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 20:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694660775; x=1695265575; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O40+8ZcyF7i45coCovtz7BFXegxRcC292Q0Q5Dn+068=;
        b=YH6fs4CEJX5k6TpmaCNJT7I5P234ICoXG7YJYu6pwlmMO/2qPcOv04Xt/z3/4SpdFQ
         Tf3RODrrup+v+We5EVpJxByFwoR6PtZxmaxTeNoN0cRm9yNPn2BdP+TCzzdOLylWcBxq
         HbTwpgcjNpTw5jN0s69FyiCHAYTAvLubixsyEIx8CZZu7zhP5s/yHot/MqkIzeIDQWUm
         hQqlFiOUsII1qhk2rkIJTsNsKqnoqchGH7RzZQdiu2paGVCSpTBJz3GyCLpyxWyfi7wK
         7dT+xQ2uzuv+LvKRCswth5vF2Zib0SReWM4W+oRWAqCw6s1wtb14G1tD7auQR/6prQXx
         QZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694660775; x=1695265575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O40+8ZcyF7i45coCovtz7BFXegxRcC292Q0Q5Dn+068=;
        b=YCTM4m81TQG08Y6fxZ/8hpn4DU13engQGCmz7pgJTmPZkKDKYhjiqb5U9noW+GQP/K
         ImZ26lJMHECWM0tuIPyIL6Qs+MxswK29qGnaVuF/nT/EVQmRWxlGP0C27of8N+5eZ8no
         uIcEuKCzjZjyNq5/ej8+2mtrgjz6S/V8kLGti5P7d5gwovbpv4lDpqsfzW8yGz5uVcrw
         l5B1DGmGECPkWMA2ojrx8LnQ70nlgrl6d0oazfs0W8CKorf38qKRAyL2cjpEzIDmgIah
         CDdiWt4JdsI0rEyMqZ1v9r84uZy/r7NMuav3fzMLqOGjvq32HoKCK5P38XK325ahpFN/
         9tlw==
X-Gm-Message-State: AOJu0YydlRXs8QHOY2nT1YyLjfM+ol61T3UetxZ7yF/BRwe3LlilEF4/
	MWXy9Sja6ae7WTR8XCeV5cBhZdI1ROQdtA==
X-Google-Smtp-Source: AGHT+IH9LPUFgyk6sF+p0ea+YM+pEUlobcU9+6GFzkXo/QurcKo+dOmMxOWWeSHXSG1u7/knwcJjPg==
X-Received: by 2002:a17:902:db03:b0:1bd:f314:7896 with SMTP id m3-20020a170902db0300b001bdf3147896mr4977810plx.25.1694660775119;
        Wed, 13 Sep 2023 20:06:15 -0700 (PDT)
Received: from pwon.ozlabs.ibm.com ([146.112.118.69])
        by smtp.gmail.com with ESMTPSA id w2-20020a170902904200b001b567bbe82dsm330521plz.150.2023.09.13.20.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 20:06:14 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 01/11] KVM: PPC: Always use the GPR accessors
Date: Thu, 14 Sep 2023 13:05:50 +1000
Message-Id: <20230914030600.16993-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230914030600.16993-1-jniethe5@gmail.com>
References: <20230914030600.16993-1-jniethe5@gmail.com>
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, npiggin@gmail.com, David.Laight@ACULAB.COM, kvm-ppc@vger.kernel.org, sachinp@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Always use the GPR accessor functions. This will be important later for
Nested APIv2 support which requires additional functionality for
accessing and modifying VCPU state.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4:
  - Split into unique patch
---
 arch/powerpc/kvm/book3s_64_vio.c     | 4 ++--
 arch/powerpc/kvm/book3s_hv.c         | 8 ++++++--
 arch/powerpc/kvm/book3s_hv_builtin.c | 6 +++++-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c  | 8 ++++----
 arch/powerpc/kvm/book3s_hv_rm_xics.c | 4 ++--
 arch/powerpc/kvm/book3s_xive.c       | 4 ++--
 6 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 93b695b289e9..4ba048f272f2 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -786,12 +786,12 @@ long kvmppc_h_get_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 	idx = (ioba >> stt->page_shift) - stt->offset;
 	page = stt->pages[idx / TCES_PER_PAGE];
 	if (!page) {
-		vcpu->arch.regs.gpr[4] = 0;
+		kvmppc_set_gpr(vcpu, 4, 0);
 		return H_SUCCESS;
 	}
 	tbl = (u64 *)page_address(page);
 
-	vcpu->arch.regs.gpr[4] = tbl[idx % TCES_PER_PAGE];
+	kvmppc_set_gpr(vcpu, 4, tbl[idx % TCES_PER_PAGE]);
 
 	return H_SUCCESS;
 }
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 130bafdb1430..4af5b68cf7f8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1267,10 +1267,14 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 			return RESUME_HOST;
 		break;
 #endif
-	case H_RANDOM:
-		if (!arch_get_random_seed_longs(&vcpu->arch.regs.gpr[4], 1))
+	case H_RANDOM: {
+		unsigned long rand;
+
+		if (!arch_get_random_seed_longs(&rand, 1))
 			ret = H_HARDWARE;
+		kvmppc_set_gpr(vcpu, 4, rand);
 		break;
+	}
 	case H_RPT_INVALIDATE:
 		ret = kvmppc_h_rpt_invalidate(vcpu, kvmppc_get_gpr(vcpu, 4),
 					      kvmppc_get_gpr(vcpu, 5),
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 0f5b021fa559..f3afe194e616 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -182,9 +182,13 @@ EXPORT_SYMBOL_GPL(kvmppc_hwrng_present);
 
 long kvmppc_rm_h_random(struct kvm_vcpu *vcpu)
 {
+	unsigned long rand;
+
 	if (ppc_md.get_random_seed &&
-	    ppc_md.get_random_seed(&vcpu->arch.regs.gpr[4]))
+	    ppc_md.get_random_seed(&rand)) {
+		kvmppc_set_gpr(vcpu, 4, rand);
 		return H_SUCCESS;
+	}
 
 	return H_HARDWARE;
 }
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 9182324dbef9..17cb75a127b0 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -776,8 +776,8 @@ long kvmppc_h_read(struct kvm_vcpu *vcpu, unsigned long flags,
 			r = rev[i].guest_rpte | (r & (HPTE_R_R | HPTE_R_C));
 			r &= ~HPTE_GR_RESERVED;
 		}
-		vcpu->arch.regs.gpr[4 + i * 2] = v;
-		vcpu->arch.regs.gpr[5 + i * 2] = r;
+		kvmppc_set_gpr(vcpu, 4 + i * 2, v);
+		kvmppc_set_gpr(vcpu, 5 + i * 2, r);
 	}
 	return H_SUCCESS;
 }
@@ -824,7 +824,7 @@ long kvmppc_h_clear_ref(struct kvm_vcpu *vcpu, unsigned long flags,
 			}
 		}
 	}
-	vcpu->arch.regs.gpr[4] = gr;
+	kvmppc_set_gpr(vcpu, 4, gr);
 	ret = H_SUCCESS;
  out:
 	unlock_hpte(hpte, v & ~HPTE_V_HVLOCK);
@@ -872,7 +872,7 @@ long kvmppc_h_clear_mod(struct kvm_vcpu *vcpu, unsigned long flags,
 			kvmppc_set_dirty_from_hpte(kvm, v, gr);
 		}
 	}
-	vcpu->arch.regs.gpr[4] = gr;
+	kvmppc_set_gpr(vcpu, 4, gr);
 	ret = H_SUCCESS;
  out:
 	unlock_hpte(hpte, v & ~HPTE_V_HVLOCK);
diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/book3s_hv_rm_xics.c
index e165bfa842bf..e42984878503 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
@@ -481,7 +481,7 @@ static void icp_rm_down_cppr(struct kvmppc_xics *xics, struct kvmppc_icp *icp,
 
 unsigned long xics_rm_h_xirr_x(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.regs.gpr[5] = get_tb();
+	kvmppc_set_gpr(vcpu, 5, get_tb());
 	return xics_rm_h_xirr(vcpu);
 }
 
@@ -518,7 +518,7 @@ unsigned long xics_rm_h_xirr(struct kvm_vcpu *vcpu)
 	} while (!icp_rm_try_update(icp, old_state, new_state));
 
 	/* Return the result in GPR4 */
-	vcpu->arch.regs.gpr[4] = xirr;
+	kvmppc_set_gpr(vcpu, 4, xirr);
 
 	return check_too_hard(xics, icp);
 }
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index f4115819e738..48d11baf1f16 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -328,7 +328,7 @@ static unsigned long xive_vm_h_xirr(struct kvm_vcpu *vcpu)
 	 */
 
 	/* Return interrupt and old CPPR in GPR4 */
-	vcpu->arch.regs.gpr[4] = hirq | (old_cppr << 24);
+	kvmppc_set_gpr(vcpu, 4, hirq | (old_cppr << 24));
 
 	return H_SUCCESS;
 }
@@ -364,7 +364,7 @@ static unsigned long xive_vm_h_ipoll(struct kvm_vcpu *vcpu, unsigned long server
 	hirq = xive_vm_scan_interrupts(xc, pending, scan_poll);
 
 	/* Return interrupt and old CPPR in GPR4 */
-	vcpu->arch.regs.gpr[4] = hirq | (xc->cppr << 24);
+	kvmppc_set_gpr(vcpu, 4, hirq | (xc->cppr << 24));
 
 	return H_SUCCESS;
 }
-- 
2.39.3

