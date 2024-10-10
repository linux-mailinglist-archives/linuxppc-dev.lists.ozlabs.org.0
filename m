Return-Path: <linuxppc-dev+bounces-2015-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 411FB99901D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:28:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVZ2Qtyz3bn1;
	Fri, 11 Oct 2024 05:25:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584758;
	cv=none; b=kBJoWXM4PzG/vzXWDH4FC095HH6j283iPRGNcC3pcRmp/9VyMTS6+98P/mv3toH0dlMlNq0JEN2xFJ/x2m6X8zGO0PheGoBSGirSFqyt953gAJHI4N2KZd+jYEgAn92UsZCF34SyMYcOvIKScOii1uWeaEfxE+Jp263RBSz5h7oZkruu9uxB/CqNSjeOn/uV6D/c9RfV2IoMwRgORUIf7wC+enql2+ISDcFubV2K5mgJI/LYFA9/bloDrtDnGw9nPKDBVNHDc3qIRkPW+932aCMIfsaci+wcHDJB6nUhtvaUDhF5Kuv229krVe97T83Q/4yDIqkTchOdack4p3g81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584758; c=relaxed/relaxed;
	bh=/prKt8Bu+DRISNBcov5NrkfgoAIYHMahITKzCWpSrCI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ckg+P99cObtNVk25PMsD5n3GNIt82YOmP9FBXJBwCqukxx8EkqA+j2m6AM6KDU9Dv2QrhSDaIvIJqWfftOreTRCbj5ilKv23iEIeDe8VNbvM5XJPCQrWiIyWOv0+mrRX/tv4aEGVHQTKfKbjCoq1yby0BEoCVOK3om9t4fJGh9sCvC0ppPRDC6fXcLTAfgmkaBYd55/qiD0m7GkR+jaHonoIrhNbGQkgj1hFnVIqNwS+HhPhFRmcGJ3cYqtEbuILn8Q99VUTROdxSSvk+Ei308P0uyhohtztokQG7MqAb/icV7xZli5fiuCVzOtTTFQX/BMDu5hZwg/SE8e11qnHjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2KRn6tjY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3mxwizwykdmo8uq3zsw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2KRn6tjY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3mxwizwykdmo8uq3zsw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVY2ScFz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:57 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e32e920cf6so23638797b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584755; x=1729189555; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/prKt8Bu+DRISNBcov5NrkfgoAIYHMahITKzCWpSrCI=;
        b=2KRn6tjYwkJYAfAMh4YoVuGtvqsQwU1CeOGJbcORNUiprt0Di56WhY8ahbfcXjPBsj
         q+KZnL9BxQXTk9t/S7jOI5rPHx89K7ZVCshpYCelPAzvbi9hH2hneTVJu8864jS9cZBu
         iiSpVW/PIrgk3elqo+ktFqDQi0hvH+iRLADqbq6V8P6D3VikdLCsB8la6jXeKrUp2aSu
         32Xsx2b0KkUTH2t/7+DgpV9Y+gnn3IjcXW1b/x8ARlSpBVrivd6R6HV5/Hu835ibDWcy
         SFrjooOluxYnMntkh27fwKuphY6lxeUL1MnniM9Fn6UD6vutgkYSjMD1xA1LrvV9IhoA
         SIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584755; x=1729189555;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/prKt8Bu+DRISNBcov5NrkfgoAIYHMahITKzCWpSrCI=;
        b=bXX+VmmOVfbuYxhs0GUQC5d/Eh8nn3nAHNLbGaJVD0yw4D3/RNOvl92AK8HQQ9c5IC
         VWLDrxMrFMml+cSD6o6nOnqX3y31jb0I7sZnQe3WOc0fgHzGsex/tkxnR1s8LphQolx/
         5+ct7Z164qYmSsAfUq0Dwt7MBBOd/C6Q9V4Q8H6mI+Ku97Uaja7TqWNyd2w9hVyZ81F+
         EdXxMQECLI4gXYDMzpdcR7sQlSckpDuGcE9eC/lH18+NETFjuCCpSLrC9vEIJOIH4Fvy
         aIfday2Ua1NyhCAV8OYU7cVYtqGfTMC36WFfXaSE8TQ6jNrT4Hadmbh1W6h/j/9Tps8g
         2tNA==
X-Forwarded-Encrypted: i=1; AJvYcCWyholLRnVeX3sQT7P7ZzFv4K86xqVXg7vOSLkbpclQIcfizbMChemuvTTEhYXWgr9ZfPwOxQTk4az7i/s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzl2BFXR97LojIDHDYE29LjNzroXTdmt7Lor1EzUGUJWOKWKWzr
	WG42x1ycoBaGf5W6GNHSnsEPG0uMonG+bIsvqaj8IiiMVliEevvpJ5iWmiFjucUjGP6IHv6AO0g
	afA==
X-Google-Smtp-Source: AGHT+IHNZW39HKgOpo4XLx10sqcp5MldEDD35H2r/7z7SkgDatDPvbEuIFyvlgb9BtXWEl9gaR4EDWCFxGs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2093:b0:6d4:30f0:3a74 with SMTP id
 00721157ae682-6e322171640mr1011347b3.6.1728584755409; Thu, 10 Oct 2024
 11:25:55 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:32 -0700
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
Message-ID: <20241010182427.1434605-31-seanjc@google.com>
Subject: [PATCH v13 30/85] KVM: Migrate kvm_vcpu_map() to kvm_follow_pfn()
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

From: David Stevens <stevensd@chromium.org>

Migrate kvm_vcpu_map() to kvm_follow_pfn(), and have it track whether or
not the map holds a refcounted struct page.  Precisely tracking struct
page references will eventually allow removing kvm_pfn_to_refcounted_page()
and its various wrappers.

Signed-off-by: David Stevens <stevensd@chromium.org>
[sean: use a pointer instead of a boolean]
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  2 +-
 virt/kvm/kvm_main.c      | 26 ++++++++++++++++----------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e3c01cbbc41a..02ab3a657aa6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -280,6 +280,7 @@ struct kvm_host_map {
 	 * can be used as guest memory but they are not managed by host
 	 * kernel).
 	 */
+	struct page *refcounted_page;
 	struct page *page;
 	void *hva;
 	kvm_pfn_t pfn;
@@ -1238,7 +1239,6 @@ void kvm_release_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_accessed(kvm_pfn_t pfn);
=20
-void kvm_release_pfn(kvm_pfn_t pfn, bool dirty);
 int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset=
,
 			int len);
 int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long l=
en);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6cdbd0516d58..b1c1b7e4f33a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3093,21 +3093,21 @@ struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn=
)
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
=20
-void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
-{
-	if (dirty)
-		kvm_release_pfn_dirty(pfn);
-	else
-		kvm_release_pfn_clean(pfn);
-}
-
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *ma=
p)
 {
+	struct kvm_follow_pfn kfp =3D {
+		.slot =3D gfn_to_memslot(vcpu->kvm, gfn),
+		.gfn =3D gfn,
+		.flags =3D FOLL_WRITE,
+		.refcounted_page =3D &map->refcounted_page,
+	};
+
+	map->refcounted_page =3D NULL;
 	map->page =3D NULL;
 	map->hva =3D NULL;
 	map->gfn =3D gfn;
=20
-	map->pfn =3D gfn_to_pfn(vcpu->kvm, gfn);
+	map->pfn =3D kvm_follow_pfn(&kfp);
 	if (is_error_noslot_pfn(map->pfn))
 		return -EINVAL;
=20
@@ -3139,10 +3139,16 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct k=
vm_host_map *map, bool dirty)
 	if (dirty)
 		kvm_vcpu_mark_page_dirty(vcpu, map->gfn);
=20
-	kvm_release_pfn(map->pfn, dirty);
+	if (map->refcounted_page) {
+		if (dirty)
+			kvm_release_page_dirty(map->refcounted_page);
+		else
+			kvm_release_page_clean(map->refcounted_page);
+	}
=20
 	map->hva =3D NULL;
 	map->page =3D NULL;
+	map->refcounted_page =3D NULL;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


