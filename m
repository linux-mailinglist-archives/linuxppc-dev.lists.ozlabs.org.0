Return-Path: <linuxppc-dev+bounces-2068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E5199908C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:34:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXk5X1fz3blH;
	Fri, 11 Oct 2024 05:27:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584870;
	cv=none; b=VWkotd5/4j6HiDKbjefpNWhT2DGeAif8oEXDArOZJILf+2qqz4GA+F5AdGg4nQECH4bTVWjY1y6WjUfwzAKXQCEZiSmCLzOPhcOnndgCTAPGjSd7atoWChmgElhcPascLaedle3mK3CxHnyFMakiWfk8PyB77ZFxcQ6aDbLJvbTetl4NFZ6QBeZBzggjrTrb7p7fsUEDEtHA8OXGpeOZADQDar92R6ot5CvXMgO680v3rVpp6+8YapiyhEkpN9Yowm1Z/dsI0i3X6TLfp/CP5UO21PWClksPovb7mTnvIvAnM3qNePeiUbEBqjMVXRLe0smKAd5EyqUrgVu9y3t6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584870; c=relaxed/relaxed;
	bh=qYRk8t9w2U8aQ/ID4AWjouVrA1tdB4hWvcNmB/sB3HQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z2fl9mZDzDnGrsSipWuDWdsNc1eRUFzHOUnSLctate59ti6S9uewy1BSRb4aRiVbTvjuzqICBouW2qtqDNqkBNYv9CTzwPxqKBRD7qLCOblWzlDD38Luq7ck5uNkQgV2fb5iSLWE2a/JR4OQ3SpiRubIgQZ0XLZydEGZDf8ohsF+TPOxraffZusMBCgEDcoqEsxjKREGVIxAUeQkUKH5XMtL1muPphZFlwjMv3udKfEuW02f78dZedRcWHhNNTG5gCrzeY/+NYP9tQh2QLV9ri9EtJlBC2PH+izAPffqVnHP4Xhor/LCarY1Cy7lD9VXQgYVrIk0Qo/nFQLG/xDFOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xQwNKQhG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3pbwizwykdd0rdzmibfnnfkd.bnlkhmtwoob-cdukhrsr.nykzar.nqf@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=xQwNKQhG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3pbwizwykdd0rdzmibfnnfkd.bnlkhmtwoob-cdukhrsr.nykzar.nqf@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXj6HmZz3cVf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:49 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7ea00becea0so1484920a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584868; x=1729189668; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYRk8t9w2U8aQ/ID4AWjouVrA1tdB4hWvcNmB/sB3HQ=;
        b=xQwNKQhG93u0ATZZIxb2qXPHthFEojUmCMYswltf79eOOOmkz8ulgr+H/ehBVTTtWd
         49kSLN+5m4zrNcIw8aYmC2eQrAGyorj3ji3ltaicsITNprMv/7RubN9Fd8fT/z8rSPTO
         AFHm6riwhnJl889Z3/UUOxcquK/sGYLHA+3gPsI0ZtIMJ2cVBiwKYh9CFnMf6s1hpr3o
         JNcVPoamwfa4zNm9w89IXP/0mulmuhV3ffU1LB9un0SnWulr6OC9aZi/jivViqrk8mRm
         5Pib0fcwrvFEZmA3bmV3vcqBMiL3N4cYN5ggEZYcHvsHhuXrHW5cO8CcJByilzd1ImLr
         PBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584868; x=1729189668;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qYRk8t9w2U8aQ/ID4AWjouVrA1tdB4hWvcNmB/sB3HQ=;
        b=dZ7xu/xrXXFuk5XwKcq0E+KJ56w2jl8xHGFm8c1G3lqXbbXw8wMeuJSTPMLZHFSKFE
         ZMXexyYY5stoi8a206uKKPNMQj7E9Wcw5Pct4JUvtMRd2xh5AmcPvxsFkOysPUvKMExz
         83f5P5BdBNdz0XSUrXEj+tykOIScbTaexkyUhi0jVvQVYuS8oi7PTO1Pol118I+uBTwC
         qF212MkEYhp2mT85fsZeuhXoPpw/OgBRJy9RD3IinGTEwIBiiLhK2as+rdSYqLoTnYUQ
         Q4i2jZoY3MJKn6uwEMRoDA/5w2QndFeJ1ut7nnTwpuyHkqjnt9NvhxNt56BG3G/NyaiR
         coWA==
X-Forwarded-Encrypted: i=1; AJvYcCWll0K7tWqJ1TBiDIB6AB0oYGgLSrZ6/F4WgTa+fFwhKLnYvU/G2OTWR43AFBKZ4UDw8h7CJhS/aeO3DkY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxXBcXF8Jg2farL2cVF22B9ZBWTjRac6/m1W7y8vv37GlOPvxNJ
	GLQfETcmeHKHNT8O+xAGfHW9ZNKZoETn9BRI7BIIEVCitSFIwl4p89AtXgtyiyYtfyVH1fHyFrZ
	MJA==
X-Google-Smtp-Source: AGHT+IHfwq/leOSDpGNmElHsEevN2NLhktzxL5WWYsNV7s51yqV4fIBatX1NQsHzbv29AfLNcoyCuLVeClM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:e745:b0:20c:857b:5dcb with SMTP id
 d9443c01a7336-20c857b62ffmr639275ad.4.1728584868183; Thu, 10 Oct 2024
 11:27:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:25 -0700
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
Message-ID: <20241010182427.1434605-84-seanjc@google.com>
Subject: [PATCH v13 83/85] KVM: arm64: Don't mark "struct page" accessed when
 making SPTE young
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

Don't mark pages/folios as accessed in the primary MMU when making a SPTE
young in KVM's secondary MMU, as doing so relies on
kvm_pfn_to_refcounted_page(), and generally speaking is unnecessary and
wasteful.  KVM participates in page aging via mmu_notifiers, so there's no
need to push "accessed" updates to the primary MMU.

Dropping use of kvm_set_pfn_accessed() also paves the way for removing
kvm_pfn_to_refcounted_page() and all its users.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 +---
 arch/arm64/kvm/hyp/pgtable.c         | 7 ++-----
 arch/arm64/kvm/mmu.c                 | 6 +-----
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/=
kvm_pgtable.h
index 03f4c3d7839c..aab04097b505 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -674,10 +674,8 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *p=
gt, u64 addr, u64 size);
  *
  * If there is a valid, leaf page-table entry used to translate @addr, the=
n
  * set the access flag in that entry.
- *
- * Return: The old page-table entry prior to setting the flag, 0 on failur=
e.
  */
-kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr);
+void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr);
=20
 /**
  * kvm_pgtable_stage2_test_clear_young() - Test and optionally clear the a=
ccess
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b11bcebac908..40bd55966540 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1245,19 +1245,16 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable=
 *pgt, u64 addr, u64 size)
 					NULL, NULL, 0);
 }
=20
-kvm_pte_t kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
+void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
 {
-	kvm_pte_t pte =3D 0;
 	int ret;
=20
 	ret =3D stage2_update_leaf_attrs(pgt, addr, 1, KVM_PTE_LEAF_ATTR_LO_S2_AF=
, 0,
-				       &pte, NULL,
+				       NULL, NULL,
 				       KVM_PGTABLE_WALK_HANDLE_FAULT |
 				       KVM_PGTABLE_WALK_SHARED);
 	if (!ret)
 		dsb(ishst);
-
-	return pte;
 }
=20
 struct stage2_age_data {
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4054356c9712..e2ae9005e333 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1706,18 +1706,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, ph=
ys_addr_t fault_ipa,
 /* Resolve the access fault by making the page young again. */
 static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_i=
pa)
 {
-	kvm_pte_t pte;
 	struct kvm_s2_mmu *mmu;
=20
 	trace_kvm_access_fault(fault_ipa);
=20
 	read_lock(&vcpu->kvm->mmu_lock);
 	mmu =3D vcpu->arch.hw_mmu;
-	pte =3D kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
+	kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
 	read_unlock(&vcpu->kvm->mmu_lock);
-
-	if (kvm_pte_valid(pte))
-		kvm_set_pfn_accessed(kvm_pte_to_pfn(pte));
 }
=20
 /**
--=20
2.47.0.rc1.288.g06298d1525-goog


