Return-Path: <linuxppc-dev+bounces-13601-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0912C22299
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:13:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFcC5Wgpz3fJx;
	Fri, 31 Oct 2025 07:11:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855067;
	cv=none; b=ju9FZb4DrHgEaJVqni8FAAdrhAIvVb1HSgpzT565z5ZGW3Af20VUvspgXHD3ddxBzqbanoqHGY6lKn8Ce+EQ2OQRBDUMwg0XfpRSCfRioqn9gK2Rxh6XuxqRL8T8mxeAtUeyoDZVfKP0c2Iq///MwQ3Gq8xcD+rqi0OUx3PeVnpnSCP+C/thAIpuggJCrCbzkTM5mZT2aKlJGYqV2tzPavbDBAlKBLRP3l4f6xLWKFIL/Ccoh2x6M4BsFrZH3wqFPgNoH+pkCIGVYB5b/f0yiWgBUFqPABctI/d7qErzqkJCpEtom9g/fvWevVez5HIuk2O2AwN5ceWE/tp57OpLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855067; c=relaxed/relaxed;
	bh=gJtCncfCK9X54oXx991KGpYhmmpTyjjcLT5mmtOhZeY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jhiG13UfrhCdIgRaFpWaTkMRjlnDWOuuWqpwQ9vasXowi40Xo1j6+M3YquPMWaC834jB1jhSudL8SKkFCnLgREYfp8CnrALs2AtXBZAwrXTO978hNOP3X8FjPezv3cYWNzxggfpsNWT3NRbrqtkKHBTPIDjM+U7LbClrabLMft1ak9P6X48v0FF5Qd1FIcSVuj4L/FCegHFDK5PGWzbWWUz1exQrba0ATC90AQZSdQ07Dt/vpR5zNlpa4xja2bFFEoELqTjul3YEyvfWek/DTF63sInqnPEZyo/8+qyzFlCb5EoPspgNCGCYMjtp3DgUlsWE8G8SauoQ98IbCEle7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uFsiJ1Ec; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3wcydaqykdeqykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uFsiJ1Ec;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3wcydaqykdeqykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFcC1KrTz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:11:07 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so1121915a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855065; x=1762459865; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gJtCncfCK9X54oXx991KGpYhmmpTyjjcLT5mmtOhZeY=;
        b=uFsiJ1Ec2CigtvyDCXLHNVuz2bDt1pCtuc5iep03TxtUrDR4xflt2LHrN3JxYTmkVR
         POsHni3DgEPTbfl7mUGvHPhkptcMieByyVD6N/bsPjpdHX1DKdAJi+jV3f/ij7Gknatu
         KTfVLc/BrjtIpwKsCACsn7RUxfdrKsHTgBrWV0Hrobo0uIzx5srPrFMEHexRwMaiNyGp
         drcnV0rnmwgCp8cNDLqNin4iQx1oXb3fi1l2PpaZ/7tHhE0mCFhNZEDww4NzV+4nyQIV
         UbCzexuw1DySxEXMSjhrpuT8pit9fn7rZYplxKTU3F+uJaU3DjDqeiZR5wj+4aZU1oY+
         4Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855065; x=1762459865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJtCncfCK9X54oXx991KGpYhmmpTyjjcLT5mmtOhZeY=;
        b=KWe/LkWNLOEMfbap853eN4ahDnp2sWL1RChflrZbAKYe2N82DKYVMbt3GXtdCiZNyo
         O0hPabLlw/iKP2/Fcse+vY2xspZKhFFmjkiKuqYyca1LNbP7JJJdhC+UWL8AL+Lo9CM7
         xwm4lQMpfmf5ihzBMVdOTCFj6Dp6DUh7fhGwHSn4i1noLxE1xrDdpt+jZHHcDukVXNaK
         YGd/m+AGvTe1wtQLg2DmiZ3g4L6Vn7E2iRuOH+pjEQxvsy+REGKVs4SNe2RLNXzC3q78
         kasS/XBf/Z2z4QptV3+t9YyDHt82t2L9U9bFqRWFRvfVEOjhpc28SnzTDqk21CS5mrfR
         Q1pg==
X-Forwarded-Encrypted: i=1; AJvYcCUAY+/Llb4gFnlcfYbYToumt2u+abJ9RLohT6KHjyMau8cxhK5i6AfJDqALKjEKnarZFZqDfbIL7kSJzhw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQ2VO2tnDxmYG4jd6W8+6wlFoza4i5HX80eRF6M/KM4o9GLkoK
	RmYoSsu+LjRITS4NMLplE0Qu/Rhbf9xPWKIp+RqdLEeb9SmH+XuDq1yxdcVDWuU0f4JzjC0I2FX
	cj/KKsg==
X-Google-Smtp-Source: AGHT+IGHOQLpfyFznvDWNUH7H5RRwumwXl+ad4M1fU9LKzyWdjNf4lBkOJxqkb3vWAdXWhUIZ0D4LKjuEDo=
X-Received: from pjd14.prod.google.com ([2002:a17:90b:54ce:b0:339:ee20:f620])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3e4d:b0:32e:528c:60ee
 with SMTP id 98e67ed59e1d1-34083055b02mr1449393a91.24.1761855065570; Thu, 30
 Oct 2025 13:11:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:50 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
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
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-28-seanjc@google.com>
Subject: [PATCH v4 27/28] KVM: TDX: Bug the VM if extending the initial
 measurement fails
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
measurement should fail if and only if there is a KVM bug, or if the S-EPT
mapping is invalid.  Now that KVM makes all state transitions mutually
exclusive via tdx_vm_state_guard, it should be impossible for S-EPT
mappings to be removed between kvm_tdp_mmu_map_private_pfn() and
tdh_mr_extend().

Holding slots_lock prevents zaps due to memslot updates,
filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
vcpu->mutex locks prevents updates from other vCPUs, kvm->lock prevents
VM-scoped ioctls from creating havoc (e.g. by creating new vCPUs), and all
usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT entries that
can be used for the initial image.

For kvm_zap_gfn_range(), the call from sev.c is obviously mutually
exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT so the same goes
for kvm_noncoherent_dma_assignment_start_or_stop(), and
__kvm_set_or_clear_apicv_inhibit() is blocked by virtue of holding all
VM and vCPU mutexes (and the APIC page has its own non-guest_memfd memslot
and so can't be used for the initial image, which means that too is
mutually exclusive irrespective of locking).

Opportunistically return early if the region doesn't need to be measured
in order to reduce line lengths and avoid wraps.  Similarly, immediately
and explicitly return if TDH_MR_EXTEND fails to make it clear that KVM
needs to bail entirely if extending the measurement fails.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 8bcdec049ac6..762f2896547f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3123,21 +3123,23 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 
 	put_page(src_page);
 
-	if (ret)
+	if (ret || !(arg->flags & KVM_TDX_MEASURE_MEMORY_REGION))
 		return ret;
 
-	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
-		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
-			err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry,
-					    &level_state);
-			if (err) {
-				ret = -EIO;
-				break;
-			}
-		}
+	/*
+	 * Note, MR.EXTEND can fail if the S-EPT mapping is somehow removed
+	 * between mapping the pfn and now, but slots_lock prevents memslot
+	 * updates, filemap_invalidate_lock() prevents guest_memfd updates,
+	 * mmu_notifier events can't reach S-EPT entries, and KVM's internal
+	 * zapping flows are mutually exclusive with S-EPT mappings.
+	 */
+	for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
+		err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry, &level_state);
+		if (TDX_BUG_ON_2(err, TDH_MR_EXTEND, entry, level_state, kvm))
+			return -EIO;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *cmd)
-- 
2.51.1.930.gacf6e81ea2-goog


