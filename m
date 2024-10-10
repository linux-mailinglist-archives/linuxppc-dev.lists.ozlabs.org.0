Return-Path: <linuxppc-dev+bounces-2006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16907999008
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:27:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVD6hywz3bx5;
	Fri, 11 Oct 2024 05:25:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584740;
	cv=none; b=dED/vo6MdajyK+Ik8+iay1sv5UnGy6bMni/EF8rV0uqOx0wXe3MlJwgLhX1exou3+a4uDUoOaZe3a54JS+iW1CaIlehYVM4W7BM9UplR2fFqer/ePUoK2cFYlG6cZYeL1Ostpl8OcMMwSI64xLVxcfBTvSCWCTFAUWjoRtI3+k2ku+GED8h1O9LgMoieAhb78zfWmQolyeOI16szDTt2bVaPEPZFLTG7GmUnoCG5R2PcwZknsrPvSVw04tEAf61uBkwtCh9R2skxyVYtzi293s/wqMqU05Gmr5Hcj754ZxHBm+WqkM+FEzjRUDGKz89KOAOL6ucWSeQRx1Zm1bYAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584740; c=relaxed/relaxed;
	bh=IMgO/JDFhWAWu7Wkr7+zBWYfApHhI977J8rKw7ML51Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m7p2kYEZgw/22ecIWGu98qxuiPI9WKH4EDvtpmo9T/CQ0yy1ON6jthiG1mIDBEwguA1pqH+l3mQDCP6+XjkNvq4k6IWyC/6kpaCwFwkf1zrnf/EcwsCmcX4zCQqh2pZ+A15JhGHlx282qePqAzgPoGtUV+78vumlCWAsEwlv+O2TZLqjRCwPRRLFbEUH/beQ2N9akBZEBZCmXa5r/ZEe3e52vDdNzb1Hd1M/dzqkkn5cLDoxPm46JiqtlnwSoyVaf2VYibFfbqyND+1bfa8HDMWfe3J+miccmDhjHrtfOvLp+wIJ5MfUigH1oQhuRRKziWEByGxwCSHJW8/lkyZXOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K8QQ3j1F; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3ibwizwykdlcpbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K8QQ3j1F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3ibwizwykdlcpbxkgzdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVC6RGmz3bjf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:39 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e2605ce4276so2179753276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584737; x=1729189537; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMgO/JDFhWAWu7Wkr7+zBWYfApHhI977J8rKw7ML51Y=;
        b=K8QQ3j1FYYWM9koiXwd8FDPU6fp+0D13tE5/5Hx/cmK0cyPeqBm734fAPuoYiGKyi3
         cwgVq87Do8Xx/f+DlkQ92sYPVYPZIZ4XXiMl1vC/1COTrpLCCGM7x+dQe3zilfKP097Z
         vw1vmlZddEfhcyijEvXV+dJA+IREjeBgIDQhkNwEkezLN4RjzCOxuNqfYRD0sHMeH7bc
         okcyzo7g8dSLrPXeAWVHOet88ENCUGqKT2MzakI4unroy+7xpgZympVLYY5eoghzehOU
         RCPEPHw6q3xx9BlKsqDo+KBRpE3F0kkqYQAJBr3WPGc7oIuMoiQfaaJTcou+dJhUFuBO
         95zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584737; x=1729189537;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IMgO/JDFhWAWu7Wkr7+zBWYfApHhI977J8rKw7ML51Y=;
        b=VlJYIc2/Fcp2Av/hxZ2xVUap675UQFwujsVH3NEnDHV+MngSsGI92uj9IArQsx/JUA
         t2UraNTSTmLUO/7VSSqxo0mFQ+tUbLS5mxDyzFjlx6UMN/uYIfJn45n8lB4TdIatMS2O
         T5DHdy23DIb5HeeNfIxaRpRd67fTvCz37wH8GsVQTT3MmU9wz8OkWyTGS6JfIkRmjNfU
         dJAAW3ij7hbpMy4aP4CZuBC/0rCn7ywDKXSXjEzDA4T96rgsBFWPJTK7hZlt4pIhac1m
         qQFP+W3U1NH8JHKK0TNmJDQ1EAe0gXYE9retuQxqDamKhEXhKOfVbszLpICBdyqCfw/n
         IRjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkJHCE5l8/kqmv4h26CdBo+W+8SXKqs560tyiSS7NrOd1/LATgSVaw6YsKTzc1pFX9JO2GcLJG8+zfn5E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzQMnaz0avBd9YcumLg1tfRVf6E/X1bm5PhhfxmMB8+w2pka/Mu
	m6A5QTPnJhPF/GAZtLl5c51L7hdr1BZrFQ0M3bpAPvH/LaYW4ovad70W9LahjkuT+A3V9pad+F5
	jWw==
X-Google-Smtp-Source: AGHT+IGlSN4X6DbrP5DPPe6+MPgoNlxMoOT3GZzpJV2jr+xnXsAJlzTjTlsnBYkwN+CsyuU9UJbLGW89hxk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:c70a:0:b0:e28:eae7:f84a with SMTP id
 3f1490d57ef6-e28fe0feaecmr5507276.0.1728584736880; Thu, 10 Oct 2024 11:25:36
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:23 -0700
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
Message-ID: <20241010182427.1434605-22-seanjc@google.com>
Subject: [PATCH v13 21/85] KVM: Explicitly initialize all fields at the start
 of kvm_vcpu_map()
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

Explicitly initialize the entire kvm_host_map structure when mapping a
pfn, as some callers declare their struct on the stack, i.e. don't
zero-initialize the struct, which makes the map->hva in kvm_vcpu_unmap()
*very* suspect.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c7691bc40389..f1c9a781315c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3067,32 +3067,24 @@ void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
=20
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *ma=
p)
 {
-	kvm_pfn_t pfn;
-	void *hva =3D NULL;
-	struct page *page =3D KVM_UNMAPPED_PAGE;
-
-	pfn =3D gfn_to_pfn(vcpu->kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
-		return -EINVAL;
-
-	if (pfn_valid(pfn)) {
-		page =3D pfn_to_page(pfn);
-		hva =3D kmap(page);
-#ifdef CONFIG_HAS_IOMEM
-	} else {
-		hva =3D memremap(pfn_to_hpa(pfn), PAGE_SIZE, MEMREMAP_WB);
-#endif
-	}
-
-	if (!hva)
-		return -EFAULT;
-
-	map->page =3D page;
-	map->hva =3D hva;
-	map->pfn =3D pfn;
+	map->page =3D KVM_UNMAPPED_PAGE;
+	map->hva =3D NULL;
 	map->gfn =3D gfn;
=20
-	return 0;
+	map->pfn =3D gfn_to_pfn(vcpu->kvm, gfn);
+	if (is_error_noslot_pfn(map->pfn))
+		return -EINVAL;
+
+	if (pfn_valid(map->pfn)) {
+		map->page =3D pfn_to_page(map->pfn);
+		map->hva =3D kmap(map->page);
+#ifdef CONFIG_HAS_IOMEM
+	} else {
+		map->hva =3D memremap(pfn_to_hpa(map->pfn), PAGE_SIZE, MEMREMAP_WB);
+#endif
+	}
+
+	return map->hva ? 0 : -EFAULT;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_map);
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


