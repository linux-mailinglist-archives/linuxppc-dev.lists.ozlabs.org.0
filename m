Return-Path: <linuxppc-dev+bounces-2022-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D97A899902C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:29:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVq4WLyz3cDy;
	Fri, 11 Oct 2024 05:26:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584771;
	cv=none; b=AYd4VFTCww+DXQ7cat2jSEOTCNDixAIXpEmVwdtAvfiDiBssrxMr7kO/u4rmmqm8thK4xdh83qzipKF6qS8tPKz0dGSh0nXSEd1195IOXDIl/OJ5X5G3hKaQR+EUU+GaBBtUeT9gGJ2U3e0KTE8iGSVD5womZaE4eG/7MfgyqvLB2n+QDZMOMlgjb23Uvrl9qHc+cK3ThM5/MyTSKIFHiTrCc3MA9SXZvS1+vEiy+mdP57T46ZRcZ66Wko0Hf4yXze6Q23XhjvOhWnSdnok0oKjAL+tGuVgZfWdyvHPtVARUkVVErM9grQECpsphU2CI0SEK3y3s3YOm4xn0KY+S3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584771; c=relaxed/relaxed;
	bh=551DSOChXG5A+yDanUyc1gC1jxg9ryEf27npUXDW1CE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ACieM+vGrYBJ3VvQVof8WQ8rNb+KffE7WEoGTtr0cJlwAIXirHUnW+E6M1W2TSqkWSdMvoyUUDvV6E4bw9OZXJtw/amfQAAATY0rzprfJ2pDmhUimpe45HkoztR/2TIJxsurSgbEEhjH0XZKsvYxNuMFRji4OHv69dqXebpSkZyDEBJj7oMx4nLSKLFobhV/i62cy7eNg4exEEEaDQyW1dBM6LfVaOtEvyMr7vMRf3b4gT/qrSWZNodHnqKSK7uLRyJegadJDuxQVFTuSCYSrIpDpV1U/7F94wbWtJ+n78JIwdhu+rQKtR6ocG2Cab0FLCsjXXT6hbTyCqPzWDQmGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HfpBD4dr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3qbwizwykdncl73gc59hh9e7.5hfebgnqii5-67oeblml.hse34l.hk9@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HfpBD4dr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3qbwizwykdncl73gc59hh9e7.5hfebgnqii5-67oeblml.hse34l.hk9@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVp58CXz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:10 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-20c8a799e8dso9119605ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584769; x=1729189569; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=551DSOChXG5A+yDanUyc1gC1jxg9ryEf27npUXDW1CE=;
        b=HfpBD4drZtjugjR8vkrgTJiV6wQU/FRo+4ciIDhVFNWOkdhPuqGJlElu9YJY1gjtqT
         2xyKOPj620umzcWCJN+zmoeKfYamPQuapnm86aSQ+T+yrxnuJlFG3Eu64pg4iyAHOqb8
         UrTaqDrVRdh6U9mf3yEiFZBPDiGzYc3tfSXFURpSbEdM5iYB1hGjkHMEPROjBQKK51Qn
         ByjiNy7u/ss7/rZE9+szWrAp6dVL0xIieSBNFkNhvYYrIeNgKJsrYIOR0mcgoO5jkSgs
         DZg/Ov+pX2ubtdEC1XTUBubvqIYE6dKZynI4L8deJH6VDJEKl0nF1S66AHfyFxnIg8BL
         Uuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584769; x=1729189569;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=551DSOChXG5A+yDanUyc1gC1jxg9ryEf27npUXDW1CE=;
        b=GOc0aOx7/GbDucLlwO8d2XqVO1Dr6iOC8SrIW2vmNnd6lCn6pc8gAG67CK5Dixrdem
         B82NXyVl0zk2eL/reBRek/zPUGWrRLsL4xYyYDXv2EoM3VXzirgvfLjB4VH17vwk2g8Z
         GuL8TocHww7FQSKbw7bx5zG5izcXRl72q5XV9qwmAEYjVT40zaKs9MFA59svF/BH+tDg
         6T+QRkefKnJ6XV55iDyspRnh4QOhAR5kiKfvPqRTSo9sOTV3mvOahNbnu1jD6OMOZI8N
         oAnalPtWgkNCuTFUzMc5dLoIKwTdfxewxGLnvdgB1K99b9B1xEoRO/7Rj7+kE1W15MiW
         IfIA==
X-Forwarded-Encrypted: i=1; AJvYcCXmAs8VsUkZct0W38FBOpf0oh6rRzdhvuxFoPftcWf9+C1/jBH3yn6POvCcR0hu6/rEXAwgKVQVyLHfrQE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwPNWnudj2SlnZpQZReQheUUOVOtQEHhRlXmB90GJN+zUoHkvfJ
	dIcNIxG7GraTj02o3UhmFo2SFKqmnkDSV+s63gv+ichyNI5fAMtHMiLetG2YaxCyKnVWZRk+e9u
	eOQ==
X-Google-Smtp-Source: AGHT+IGKm7yq47izgr1FmkV+xWCQVhrzT+Qt86SXT8qqzZ7digIfsw6vfVxyVo72E4861BiCHpsXRIV5BzI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:e80f:b0:1fa:2ae7:cc6a with SMTP id
 d9443c01a7336-20c63722d7fmr648865ad.4.1728584768900; Thu, 10 Oct 2024
 11:26:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:39 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-38-seanjc@google.com>
Subject: [PATCH v13 37/85] KVM: x86/mmu: Add "mmu" prefix fault-in helpers to
 free up generic names
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Prefix x86's faultin_pfn helpers with "mmu" so that the mmu-less names can
be used by common KVM for similar APIs.

No functional change intended.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 19 ++++++++++---------
 arch/x86/kvm/mmu/mmu_internal.h |  2 +-
 arch/x86/kvm/mmu/paging_tmpl.h  |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 28f2b842d6ca..e451e1b9a55a 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4347,8 +4347,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *k=
vm, kvm_pfn_t pfn,
 	return max_level;
 }
=20
-static int kvm_faultin_pfn_private(struct kvm_vcpu *vcpu,
-				   struct kvm_page_fault *fault)
+static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
+				       struct kvm_page_fault *fault)
 {
 	int max_order, r;
=20
@@ -4371,10 +4371,11 @@ static int kvm_faultin_pfn_private(struct kvm_vcpu =
*vcpu,
 	return RET_PF_CONTINUE;
 }
=20
-static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault =
*fault)
+static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
+				 struct kvm_page_fault *fault)
 {
 	if (fault->is_private)
-		return kvm_faultin_pfn_private(vcpu, fault);
+		return kvm_mmu_faultin_pfn_private(vcpu, fault);
=20
 	fault->pfn =3D __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
 					  fault->write, &fault->map_writable);
@@ -4409,8 +4410,8 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, s=
truct kvm_page_fault *fault
 	return RET_PF_CONTINUE;
 }
=20
-static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *f=
ault,
-			   unsigned int access)
+static int kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
+			       struct kvm_page_fault *fault, unsigned int access)
 {
 	struct kvm_memory_slot *slot =3D fault->slot;
 	int ret;
@@ -4493,7 +4494,7 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, str=
uct kvm_page_fault *fault,
 	if (mmu_invalidate_retry_gfn_unsafe(vcpu->kvm, fault->mmu_seq, fault->gfn=
))
 		return RET_PF_RETRY;
=20
-	ret =3D __kvm_faultin_pfn(vcpu, fault);
+	ret =3D __kvm_mmu_faultin_pfn(vcpu, fault);
 	if (ret !=3D RET_PF_CONTINUE)
 		return ret;
=20
@@ -4570,7 +4571,7 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, s=
truct kvm_page_fault *fault
 	if (r)
 		return r;
=20
-	r =3D kvm_faultin_pfn(vcpu, fault, ACC_ALL);
+	r =3D kvm_mmu_faultin_pfn(vcpu, fault, ACC_ALL);
 	if (r !=3D RET_PF_CONTINUE)
 		return r;
=20
@@ -4661,7 +4662,7 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vc=
pu,
 	if (r)
 		return r;
=20
-	r =3D kvm_faultin_pfn(vcpu, fault, ACC_ALL);
+	r =3D kvm_mmu_faultin_pfn(vcpu, fault, ACC_ALL);
 	if (r !=3D RET_PF_CONTINUE)
 		return r;
=20
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_interna=
l.h
index 633aedec3c2e..59e600f6ff9d 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -235,7 +235,7 @@ struct kvm_page_fault {
 	/* The memslot containing gfn. May be NULL. */
 	struct kvm_memory_slot *slot;
=20
-	/* Outputs of kvm_faultin_pfn.  */
+	/* Outputs of kvm_mmu_faultin_pfn().  */
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
 	bool map_writable;
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.=
h
index 143b7e9f26dc..9bd3d6f5db91 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -812,7 +812,7 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, str=
uct kvm_page_fault *fault
 	if (r)
 		return r;
=20
-	r =3D kvm_faultin_pfn(vcpu, fault, walker.pte_access);
+	r =3D kvm_mmu_faultin_pfn(vcpu, fault, walker.pte_access);
 	if (r !=3D RET_PF_CONTINUE)
 		return r;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


