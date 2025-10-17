Return-Path: <linuxppc-dev+bounces-12965-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97757BE5EC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:34:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm5B4S95z3dFr;
	Fri, 17 Oct 2025 11:33:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661198;
	cv=none; b=gdBn2GfSR9P5v0AzgGitp39e8gM/5SXDrLiQHfTGoNCl79RWmg5bQa4jMdALzkRZyoRjHeJOBbBTip46j/kOVM8zCwd+iaJqNW3Q6RjAYOMpMvt5mDFbpRuq1WCA8RH6RRDDP4tPKVPednls131NVHVTWAW4KrrlI++OQ/Gyf8dXzq/B3kbZJ9y+4D/8lprmVYYwraH/B0G31Hdv5UEEjeJrJwphqByN8NtaC+Kr4ARxuVkvGmPCyHrqe/nvUHxfCXf6IbATbwDhLTLZ25nce3ZR+BDGOsFuQJFhjxfzFh2iBxPTdF+9sxXLo/7DkdL90cqIxkO4B6Qs1TzYg/vP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661198; c=relaxed/relaxed;
	bh=WBWRMN6X3w3vTrUF8QjNUM8q/tVPNzKCX5eXLQ+Uu38=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jZPnaFM5CLQy8UuEr5Rdbt92l6iUfb2Wmj9ckLESspl95LUakjsiB82WDIEMmCX56nV+fio9DDU1v0+4VIWYpbx4afBsCu/h6rz7KCh22cZJYNRfIn1O+loOm+n8zMV+p1LOkl5eLXXke/1KB470k0LOgX6AwKc3zdjhICOlwwZ4PbquAE4l1s0IAtye8rKru9JWEi4JM2IeBaxozSJKDY9rtUc6fuKoQ9dsYsIuTuJAYaEx57RroZv4SULYtoK2cmhNg/3k2aGOQzDIQZZ+ohA4LCpZE1lWnTkALY7QDDb0Xp4kcU6dC1fgySP9PD+hurLjVLmAAhkO7+csQPZOHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=onfrlHjl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3zi7xaaykdp0xjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=onfrlHjl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3zi7xaaykdp0xjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm5B0Lp4z3dBr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:18 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33bdd0479a9so102949a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661196; x=1761265996; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WBWRMN6X3w3vTrUF8QjNUM8q/tVPNzKCX5eXLQ+Uu38=;
        b=onfrlHjlquVQCqwLPMZFRzV8xWnI7mQY0caCon1KQWTsxAX+JgTtGGA5ZYiFg9jTnH
         jvnKMSTMeRx43f+d085Cav3u7gMFK05ErDZB7pxj8WiexDsTfe1yfehbFpZcD2IL3vUi
         3dfY6vjwd+53ykhf2gvOca7VdDglz3xeoH9Eu3Uqw9IMFP84QWSfVV5Xnt+Alf4evBSY
         f4FZGuOgEP1dbeuU0IICBcQpiK43S/z91uufeQRDJGZwMP8LktZ/i9WIOPNEuB/EzTwz
         BkX5wDtf6Bw75Oicr+vTrsZfwDkrFkT2gQ/frq36vM3mbduelBPZakjmizroEBxQf7MQ
         Xn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661196; x=1761265996;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBWRMN6X3w3vTrUF8QjNUM8q/tVPNzKCX5eXLQ+Uu38=;
        b=QLOJYE6D4RcKZJSBao9z+0AzovBO4x+Xcc1d4j+VyHcY9j+hFeSI2zPeiulBYR+t1u
         kJrTKhmzYYdRYvEJwHUJ4o3u8H8k0x2PsY1WG5uv6nqUPM5DloVHciwoA3nhPuOGOsak
         kqLeSLViX4jJZh5uB7i1jGnRLf/uS/UAhqvRvQuylUxLMbdkmF4M3j7KtblGS3h8Vneb
         0xVI+0GojCdotAhbtTkiePeVuWoJIRbLK6vtoCl5gd3YLEpWx2BW+XBx8dOSe6YFsKVl
         1HdA8bFhdMgWRbCoJItd0QKXCyzpVTz3qrHGQefmolMqgsHDk967nIhAZ6T5sNoC2wCx
         7llg==
X-Forwarded-Encrypted: i=1; AJvYcCUN5MG2uXSs2d2m2J2Xv8S7Cr/kD49WldSKp2b/Q0kkt/Tb58tDpDlx2DV/4iYQyAWL2XZAcYNwXdDJLzI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywmc/CAp0ScLeuN/pQIlAmVph+QSarQ/YLflA99tRMIojWz39Z0
	cXChe/AmRG9U7yjX9vVw1Ucbg/ew8H39scL3mLB2ATATOvPQULevk1DHlN8QIhUnWEDlEX41DRD
	ScfcWqw==
X-Google-Smtp-Source: AGHT+IH07aQeXAQe/gpM4oI6RLK2u3p52mKtLGzZsiMbsodE1gcNl3/aTBVcK7Ae83foyLaxFhiKihoxiME=
X-Received: from pjbpt2.prod.google.com ([2002:a17:90b:3d02:b0:329:e84e:1c50])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2c3:b0:32e:4924:6902
 with SMTP id 98e67ed59e1d1-33bcf85a829mr1565388a91.3.1760661196491; Thu, 16
 Oct 2025 17:33:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:34 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-17-seanjc@google.com>
Subject: [PATCH v3 16/25] KVM: TDX: Fold tdx_sept_zap_private_spte() into tdx_sept_remove_private_spte()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Do TDH_MEM_RANGE_BLOCK directly in tdx_sept_remove_private_spte() instead
of using a one-off helper now that the nr_premapped tracking is gone.

Opportunistically drop the WARN on hugepages, which was dead code (see the
KVM_BUG_ON() in tdx_sept_remove_private_spte()).

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 41 +++++++++++------------------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 76030461c8f7..d77b2de6db8a 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1679,33 +1679,6 @@ static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
 	return 0;
 }
 
-static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
-				     enum pg_level level, struct page *page)
-{
-	int tdx_level = pg_level_to_tdx_sept_level(level);
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	gpa_t gpa = gfn_to_gpa(gfn) & KVM_HPAGE_MASK(level);
-	u64 err, entry, level_state;
-
-	/* For now large page isn't supported yet. */
-	WARN_ON_ONCE(level != PG_LEVEL_4K);
-
-	err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-
-	if (unlikely(tdx_operand_busy(err))) {
-		/* After no vCPUs enter, the second retry is expected to succeed */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
-	if (KVM_BUG_ON(err, kvm)) {
-		pr_tdx_error_2(TDH_MEM_RANGE_BLOCK, err, entry, level_state);
-		return -EIO;
-	}
-	return 1;
-}
-
 /*
  * Ensure shared and private EPTs to be flushed on all vCPUs.
  * tdh_mem_track() is the only caller that increases TD epoch. An increase in
@@ -1786,7 +1759,6 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
-	int ret;
 
 	/*
 	 * HKID is released after all private pages have been removed, and set
@@ -1800,9 +1772,18 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
 		return;
 
-	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
-	if (ret <= 0)
+	err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
+	if (unlikely(tdx_operand_busy(err))) {
+		/* After no vCPUs enter, the second retry is expected to succeed */
+		tdx_no_vcpus_enter_start(kvm);
+		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
+		tdx_no_vcpus_enter_stop(kvm);
+	}
+
+	if (KVM_BUG_ON(err, kvm)) {
+		pr_tdx_error_2(TDH_MEM_RANGE_BLOCK, err, entry, level_state);
 		return;
+	}
 
 	/*
 	 * TDX requires TLB tracking before dropping private page.  Do
-- 
2.51.0.858.gf9c4a03a3a-goog


