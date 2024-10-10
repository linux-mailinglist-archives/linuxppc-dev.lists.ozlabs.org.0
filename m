Return-Path: <linuxppc-dev+bounces-2052-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E6699906C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:32:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdX41FG8z3cRk;
	Fri, 11 Oct 2024 05:27:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584836;
	cv=none; b=VHu0L55CtBpKvdeYLMDNZItQ3FuG5Wbs2JZuNXcWbxYETm+WKHxT8BIMXqVwwMcAzB/hhGPB1xCBnFP1MtDYt4TU/rnrj5ArIpMImGh5PtNLtlk95Qw0s0AedBtxqrcWLaWwS/fBBabRXvL3I2TEte4/5/+UFP1cZqKZRQUYTQvWiXYTabY5N90jHT4jA85i8+t8QMnlRjyHFfDTizXsDiAVj6q3CdFVIwTwZUGAqsTCuIyj7ZN2ZcZtRn4DlJZv4sOucrGtVGXy6IQqh8FMBU2HxlcD0/QkTWTtgo+YYtpyrO5hXyYtyPbfNfvBu66r48jUZUPaySeZTgMV88vlug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584836; c=relaxed/relaxed;
	bh=3FFUjrr9Bcuid6sLVD5OEsWVTb8VG25P9bGjkNYbAzk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GaCpi0louWrUWd71RC8TrEkEIboTTNwHYogPzqIIy+2KYMQObkRey3EL/q3Q1QIgLhkJP5n48QgNm73gRcUBWpjmelN0pqIMAWGWWdQhli4r040/N48oRczwyv04WBIWflIavfNy2/aoa5p/XXeqCnD09To2XNgcOLUKkKx0qCNHJirxP9MJZQpaEl4oBRbUpc9fRYFsYXMrQpcA5sKLYpN4/CIa5i3nHdENuppd/pK6f4WxHdBWfAtZ6I0ZGKLS5OFFJM29fWSaIIeE0whVW62jttCUsplaLmDsfE7yt8tfhOwrhB9sXFGFhKDDsBw2CurJiOWG47KnxYbf4ndDMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=oaWmgpKZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3grwizwykdboi40d926ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=oaWmgpKZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3grwizwykdboi40d926ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdX326DRz3cRF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:15 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2e148d4550bso1323672a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584833; x=1729189633; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3FFUjrr9Bcuid6sLVD5OEsWVTb8VG25P9bGjkNYbAzk=;
        b=oaWmgpKZMC9HCe5AbHnviR/mkb4W8MBRJJhOotgk20YeZCf4cxcKJm7a1Fippg/Afi
         nRdfmz7j1UFN4E0beWSsxZQPVg9idWg8merzyK3K30A6vBXhr79duI6tTUhVl+rIgmnf
         GU/ZIuO/OmnZ6ZAv+kHTRyvDRYEcYcd8u0zMg0BbkmOPjcFgsobA7x6OWuvt+yqE5qVs
         TMZYAJVaPSp7CcrdiYlOsLoURqmh30wgtX8d0PpmDTV2geU/8VHNqrNL5x0RcqpDaINh
         uVDOXGt1yK7xU/SSRqU0G2EmKZOi5EASbIjqxEebH+Gboksq6jKfZFUcAqsav/EYQZwY
         GxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584833; x=1729189633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FFUjrr9Bcuid6sLVD5OEsWVTb8VG25P9bGjkNYbAzk=;
        b=tQhj9vgZhkA4wixdj78FbBHiM75hD5zVC+viZGjda+aPgVI7fLiR+nQ24jZHEP3ka/
         gU+d6VMNkFY85nLMXDZIHq1aGIvzuzdEeyYRp9YduC3MGmkye1euxXoIHa4w33ECLqFX
         6qnTmO8RIPpIKd3iJCroPH4uobuWoDIdOzoPGWnQCC47ynWqedlPm2sppaA4tFEVm2Tu
         5FAfSCj21TpR4gRRFudBABJwLiyh6lfuuIKfBe1lLipFhxL3RrzgXu+cc5iTclqRT49p
         uJWNeJKnOUi4Y8ZbsCF5LJIYxQKcHjY2Rs2bE4MdOgdEJqDeoJgU95BH+fbAbiEWpQrU
         oo7w==
X-Forwarded-Encrypted: i=1; AJvYcCWulIyulE87LUmnSG2OeQPzvMGlT4KCLMXmbJ4xqSwM8hlS3UtcY6Z+LOPNxF1x/S8nmMPS7nPOv5QPetQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzfBqQrZzgIn/F0A+QYcWJdeoFfHTZEl/Lm/NHoXnASl3jJDkHp
	nLQFDplUDjWAJ6G4qr6OcYXDf9MCurEZcjd88DbZehxEns8J915gccYOu0n7YCYYJw5Fd5huRf0
	1BQ==
X-Google-Smtp-Source: AGHT+IFpwqxWKAWfrUvKF1EatvnBv5g5CrzcpgT/ZTuiTODJnzoCoYK053S1MFwF0WyL9wI3LVhDYDAiv74=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90b:46d4:b0:2e2:e148:3d37 with SMTP id
 98e67ed59e1d1-2e2f09f1a56mr94a91.2.1728584833102; Thu, 10 Oct 2024 11:27:13
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:09 -0700
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
Message-ID: <20241010182427.1434605-68-seanjc@google.com>
Subject: [PATCH v13 67/85] KVM: LoongArch: Mark "struct page" pfn accessed
 before dropping mmu_lock
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
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that LoongArch can convert to kvm_release_faultin_page() without
tripping its lockdep assertion on mmu_lock being held.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index ed43504c5c7e..7066cafcce64 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -902,13 +902,13 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
+	kvm_release_pfn_clean(pfn);
 
 	spin_unlock(&kvm->mmu_lock);
 
 	if (prot_bits & _PAGE_DIRTY)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
-	kvm_release_pfn_clean(pfn);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.47.0.rc1.288.g06298d1525-goog


