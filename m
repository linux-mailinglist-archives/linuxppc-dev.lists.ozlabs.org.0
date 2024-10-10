Return-Path: <linuxppc-dev+bounces-2062-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C05A99907F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:33:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXV3ck5z3cTh;
	Fri, 11 Oct 2024 05:27:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584858;
	cv=none; b=UrdR4AqKKgIaGech97BE/49kYGoqwVdraT3UnlC6cGtMYdiu+lP6D4TSkRqHo3sU+jKY+CfRtEk0InhdLNPL2TErIh+IiggT3F52Ky6cC45HpmVA3uxnfkBJzYIlFQvRaW5yGrB8N8VAlDOtylcKVqCXndfQCEbsfUV9Nv0THDCNBWu++E/EN3q1NhiduiThUFKDFL9Zsoy4fYhlSqPK7Tw2QjNwzF42Hv2I1pWN5MMUID8KYvUFMKOzNGiutaauodka7gkldj3BaV2E2zPp0FZog5oKWewzQj7T+YYFGxo+ZWJR3ZNIKCE91gOcp17bOL3WQeDEG6W2XNhqXoYUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584858; c=relaxed/relaxed;
	bh=04eHUk6AClz9cRMQcjlWjE46ZR1uXceY2ogFB00LGDM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FYZgbNhjkiSLnGHQ+HDiozLXkTW4KtprOh827u1f2CAEXX0KfUlaelRwo/EC38lav1XmCGGybvtT/6S0p2hdPT12H1ksLD4mZiqtfm6oP2EWitrwbjMgzx1RorAGdKBZW8zIcgZmTd5bsmJ1+Y4b+gAUO9Qw8Zg/CAle4FoOT+x+4b8OUYSNMq/XI2+ZtdHeV1AJe31wvYc6CHvIBzgPwhW81IFWaMh2UeTbu5F8ZpIqlVv6uPhzq9aHGkY3bicQaJJYhgDQ4JKaFSQBGR9ZHQs9qnbzCUXqrhqozTMgNXJBJxAHPv59lPPgNgJR2ftoZQ9BxMU44UeMkez6uF/iQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kjeY9iQS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3lxwizwykddaeqmzvosaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kjeY9iQS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3lxwizwykddaeqmzvosaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXT4Khtz3cSv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:37 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-20c8c108f85so9252535ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584856; x=1729189656; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04eHUk6AClz9cRMQcjlWjE46ZR1uXceY2ogFB00LGDM=;
        b=kjeY9iQS/ePDppHNqLxXhMnUk+Sr1XZ6xab9SafBfguhxe6/gCPJCm4kx8Mar33YL4
         j/R+3PdgwVoFgHsm7M3HJ+KztBAl09G/Mls/IoRFUuzMF9Yt2Dt/X5da1dsHUfzaFMGO
         +bee2gJcmN04b1239zKpbaLCH17qFbaOnLY5HGudtBPqEfZ0Od5pMdjUctEKvEQ95SXL
         7v+PJO/DUtKL48cWn+wypzTWDXrnkvjet51DJrfpPpYRnYxM623EC+LMoydy2s1k3ZCF
         jGqSWIpH/fyuTzrlTh759RYDZEmFJU2aGhH0frgDK65PwAlx8RKL9rgQKRW5qrlnP8W+
         H2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584856; x=1729189656;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=04eHUk6AClz9cRMQcjlWjE46ZR1uXceY2ogFB00LGDM=;
        b=RN+qgLy5gs4yFDkeoywB2QZQBHyKBcpe5n+hfDHLEch4p71gR3m4WXvIQbWiP76GKZ
         gOzzzdTqKBfJdPbMNRJDrO80r+045YpzG9iaq3BJD7D+0bfrczzw+pbau+LDLiYEaOUO
         eo+Y0f4lxqJqWef6HVMlcHOyfBybV1b8EtYufskYSKKFhEA8O0/hy6zmIG79VrevOiQB
         09Ty3Y9hAyn8eWGpKX4DKxCUO7ex3ZcNeyOhoY6UaqFwO3xeHaTU9o6HGrzgNm1eWQzo
         9WSpG+sMGbQlc/6YcMcB0UUQZLB9GKYqdMM+dvIuBXjki00Dvo34VRfQr5Pqfvn0aTTh
         PsCw==
X-Forwarded-Encrypted: i=1; AJvYcCWTJWQJhptFuIhzdI7/YQsOCsJpgiYiqsSm2x9xEVj/iXSp5qlpyuPpUcP3N90oJZzAj53gR1uEJbvucQ8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yym3rwEj0OmpVa9l/I5nDGaUZN9OYG53x5RcFREMClEWXni7Mks
	1m16Lb8ZIyBs76L00pUZP/STTWrj5kozsYSOchJURhc2wQGMpPSebVZ+SQKbtz4ZeBl2jzfZjbM
	Uzg==
X-Google-Smtp-Source: AGHT+IHGiwNd3UbnZUzPre1tk98dNYoM10q7gFGG4lq0PldsJuDm1rxMHI+g8Yc3UsVnmkzWnOurUMFmqIQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c4:b0:20c:8f78:67c9 with SMTP id
 d9443c01a7336-20c8f786946mr26385ad.5.1728584855618; Thu, 10 Oct 2024 11:27:35
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:19 -0700
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
Message-ID: <20241010182427.1434605-78-seanjc@google.com>
Subject: [PATCH v13 77/85] KVM: arm64: Use __gfn_to_page() when copying MTE
 tags to/from userspace
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

Use __gfn_to_page() instead when copying MTE tags between guest and
userspace.  This will eventually allow removing gfn_to_pfn_prot(),
gfn_to_pfn(), kvm_pfn_to_refcounted_page(), and related APIs.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/guest.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 962f985977c2..4cd7ffa76794 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1051,20 +1051,18 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 	}
=20
 	while (length > 0) {
-		kvm_pfn_t pfn =3D gfn_to_pfn_prot(kvm, gfn, write, NULL);
+		struct page *page =3D __gfn_to_page(kvm, gfn, write);
 		void *maddr;
 		unsigned long num_tags;
-		struct page *page;
=20
-		if (is_error_noslot_pfn(pfn)) {
-			ret =3D -EFAULT;
-			goto out;
-		}
-
-		page =3D pfn_to_online_page(pfn);
 		if (!page) {
+			ret =3D -EFAULT;
+			goto out;
+		}
+
+		if (!pfn_to_online_page(page_to_pfn(page))) {
 			/* Reject ZONE_DEVICE memory */
-			kvm_release_pfn_clean(pfn);
+			kvm_release_page_unused(page);
 			ret =3D -EFAULT;
 			goto out;
 		}
@@ -1078,7 +1076,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 				/* No tags in memory, so write zeros */
 				num_tags =3D MTE_GRANULES_PER_PAGE -
 					clear_user(tags, MTE_GRANULES_PER_PAGE);
-			kvm_release_pfn_clean(pfn);
+			kvm_release_page_clean(page);
 		} else {
 			/*
 			 * Only locking to serialise with a concurrent
@@ -1093,8 +1091,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 			if (num_tags !=3D MTE_GRANULES_PER_PAGE)
 				mte_clear_page_tags(maddr);
 			set_page_mte_tagged(page);
-
-			kvm_release_pfn_dirty(pfn);
+			kvm_release_page_dirty(page);
 		}
=20
 		if (num_tags !=3D MTE_GRANULES_PER_PAGE) {
--=20
2.47.0.rc1.288.g06298d1525-goog


