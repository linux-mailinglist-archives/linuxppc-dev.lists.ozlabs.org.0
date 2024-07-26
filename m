Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C6893DC97
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:31:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VSeBerPC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5Cw3hLVz3frG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:31:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VSeBerPC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3otekzgykdhqkwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Nr1BMDz3fRY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:36 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2cb7364bac9so1380486a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038074; x=1722642874; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EmJI7mCwitfWH+6LwHkJyXugWKEFSS3lkF1NSC2iA8Y=;
        b=VSeBerPCkC9egzdeMB3niMN2+1mn2OumSaU61oDplUOnwawSAD6Ot5nLAy2R9ro8zW
         fMn2b75bfXj9ZZpBtSPdYLS7zLA6tDbeVnXAFuL727R4BKAlm9VUw3O9ZLNe0MmmvUkZ
         nNZq4bo93n3ImoUKFmACvSkdIguzlzDF6bV7iP868nqp2izirtrL8PqGDfwq4oP57kOs
         gidnsSDWaMQ36JIbNk4XS9RwzyoxC32PAmR9TnhPpXA3LjqfMtYe0rDSFN9BukNJJPWZ
         eH5TbSFf8kNfsfiZdN13cC7vrb5HadcJdvIBnLx9ehVyzYmakIIWdlEtN03v99X+CrEL
         Bf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038074; x=1722642874;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmJI7mCwitfWH+6LwHkJyXugWKEFSS3lkF1NSC2iA8Y=;
        b=lu6zJEViV6uN/u24r9f6Y9Oi9xRIrWiPyjiVunyDePIEHc3bhrH6lVHMN/jHl3Utl5
         O8e0iMU2GVyDJBlvIz2FSBA3/61YYmLImPj4UOUP8pQlMAam1Ak5QOLsALUC0cQ7DGRp
         SQFltTmImG4KAnYzxNoHPIs4FMZd0TeT6uNkBrcRqc+4Sg7hcMJg2f4yiQX1ZY/XedUs
         AL/T5QFW/jskt5qnFjTRWxUVOT2Ujl47DbhZDp+PQo1eLkFWb7kdCQhF2Lrh2wyIVlCS
         4/Ks2pc757dBlPV/hqeKOR/N3pAyNsDF0bmWBVbPgVDsbOkn6Ay/Ka704Us8iNF1GTET
         BE8w==
X-Forwarded-Encrypted: i=1; AJvYcCW1X5VrsDmDhwZq+3+1ASZolc/P063xn6oCQtETfQU1x/Lgvmc8zNWHlOUtwXGUsveONvd006ntZXnYdkQmbaxFsO1V7EwAx9oTriHZLA==
X-Gm-Message-State: AOJu0Yz6MJ2G+P9Yqk+dZgi10g22+afTWrcIdlmrqowRYvYCo/k04zFE
	9HKtcp2tbS7fCnYIIgNyw/jdlSgQhBDQrbwNTvYnpyRJShr9RlouKZDDmriJaGKT3KyCYgfwHWc
	Z0w==
X-Google-Smtp-Source: AGHT+IG4DskQJpICSO/7ZhzoCwUBvTBXkkJhFyAvydTVcsfBboV7ccXE3z2KESMy5r+D4xCglFGTF0FLhYg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:470e:b0:2c8:632:7efe with SMTP id
 98e67ed59e1d1-2cf7d1673aamr10630a91.4.1722038073062; Fri, 26 Jul 2024
 16:54:33 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:05 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-57-seanjc@google.com>
Subject: [PATCH v12 56/84] KVM: RISC-V: Mark "struct page" pfns dirty iff a
 stage-2 PTE is installed
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't mark pages dirty if KVM bails from the page fault handler without
installing a stage-2 mapping, i.e. if the page is guaranteed to not be
written by the guest.

In addition to being a (very) minor fix, this paves the way for converting
RISC-V to use kvm_release_faultin_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index b63650f9b966..06aa5a0d056d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -669,7 +669,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		goto out_unlock;
 
 	if (writable) {
-		kvm_set_pfn_dirty(hfn);
 		mark_page_dirty(kvm, gfn);
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
 				      vma_pagesize, false, true);
@@ -682,6 +681,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
+	if ((!ret || ret == -EEXIST) && writable)
+		kvm_set_pfn_dirty(hfn);
+
 	spin_unlock(&kvm->mmu_lock);
 	kvm_set_pfn_accessed(hfn);
 	kvm_release_pfn_clean(hfn);
-- 
2.46.0.rc1.232.g9752f9e123-goog

