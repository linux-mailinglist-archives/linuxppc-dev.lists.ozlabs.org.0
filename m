Return-Path: <linuxppc-dev+bounces-2011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 378E3999016
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:27:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVP5SGNz3c1S;
	Fri, 11 Oct 2024 05:25:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584749;
	cv=none; b=e0Y7S6Gl1ft7iGTV152plxFq0JkIrojhHpB57lZUwslssv3HdadUcCs8lJAeVsM3sXq2EuXYTE6dFr918aUWgxfvBQOYacpDr7MJEiNpWkLM1MBAtgyeQuYmXG+NTMjRwN+ZlhqYXLcafRUMrw76PV8I2/lEey5B9tc3Ik7BsqJqVeNLHsNVv2krOU6OmH98oYCvl8ss1E3ohIhJ+iQiKOUS3AhmPUPmOrb21c3UMqpkWmZb3JZ3L5kC/OXULbUwvX8NPTe0xQVgdcYwAoJOjuaGHXlbehL1UUmy23GU26UymW9Vb2bzfRN5krn/yimT0zg3Lpw1tIbOUuzcUo5U9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584749; c=relaxed/relaxed;
	bh=/W6JK9yAcorM7mqEFQq2hRBqvFCoz2C4pz3yOEmiGek=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ksi2bdXUmPyYeO0Q9V2eUvF5LRS0HlNtGo9tOM/gE0HW8cchvBH1uM2zxzI+mxZvhqeSapdeUGXwEHwQmX124NbY2MauN3C5L3Zh7cEYrE9R7RqZDVFCNsg5AaKYBXbC8UaEbZMocWxecIOhLgu6OOLiaPahGTVM7QA8C1ME94AIRwu/jhAUHmLa9z2KTUtXEnfshXC59Naom5DY/wBT7vX5cSD/2vESYfqdmD2P9JN/z+Ia1UNKRfAN0/zLQp6nvGnTil2kxxNnOVtjYyJu01T2DbCpoOvIGNA1WWlfg4GlV5fbonfQ13eYCVAZyeBEwIeghbsJcUTYBso+7tH3Xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=CBqFREzO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3khwizwykdmezlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=CBqFREzO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3khwizwykdmezlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVN6JV7z3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:48 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2e2ca4fb175so1247942a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584747; x=1729189547; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/W6JK9yAcorM7mqEFQq2hRBqvFCoz2C4pz3yOEmiGek=;
        b=CBqFREzOfDdJuxeEKXbNYbFCzz6PZFexLnwZtym81IqoIUmI6DJdrmeXnM1zsYXZAg
         kPIn7YXue/zYSV7dEd/OI5RMqlb7xDIDVdQxTXAnxnR7iE09EZ+EcRLWIafZGtUv7Rs9
         083/Vr9OW3F/FYdq0wHQDWFMQ8BsmzmgMC/lQxpjBLb8vANuTEdzSNBjU7H+y3snqv8n
         kuPZwhbyEx/hBGU9ekRNMZ49UN59D2J0VoVxIE2x9r4WLT/Ih7X9jlNpSzNgNBoWhtmA
         wYEYQbavIF5NXR+Zsbl0YYL3jCcMxvlhSWZg1c4Ub9Zn4tQQPfFrux2m5YD3Zu3Eop5Y
         fhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584747; x=1729189547;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/W6JK9yAcorM7mqEFQq2hRBqvFCoz2C4pz3yOEmiGek=;
        b=jxc9sc0/ZImPNxzyvhTS0RLFK/WTDS852xnTyzr0MOC3UHK0+M4LLvHhAEewaf3tR4
         LGjCXNOyGFSwXs0MOrofxcfz8ZXU3IWMZ+77zx/up9RC0x+l1CfvDe+bRunEPxEWMUeq
         RlsOPAXczwd1zrr/ZH6uwVvFc9F8Yn7ekbxM+zuKjGnNPdET5/8+s22CqAUU4HyRplYE
         xdt4MuUEXo0w1r7UiLxu/Pv+gnI1KGP0yqv/kgqE4fwRRpXOWOnIAiLLgyz6w3SKzmox
         aBLdIolwDkES9gY5v9HilChJxOR4EfnzoxDKMLeLcm9wj4faU3X1lWuZzLrG37T2RYRO
         np8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDwurt3/nFtjBv+gBaU8l+CRmoepdQiHWthQKH048Mek+xoi7/dFA+zALFOzsilGtJ+XJLcSwPeEM/xAg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yya+JZmlegk9iP7zi96JtWs0uQQdZI30MBshX/i8Z4S5N0a3JWR
	s1BEl4KC9RJZxNgEfL3cUgL5pba1qpYYy9RqItUIJ7YzRXRMBS0Ci993+Wc0NQT9hTISd2h0KeE
	rsA==
X-Google-Smtp-Source: AGHT+IFGWHaFUEsQRxn4rcRWabj8vzxqpLHdNOXqOmiiQlX4dD6MZqF5BpShV2hVfQIOX/PTyNMVtEMSya8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:9a94:b0:2e2:da81:40c1 with SMTP id
 98e67ed59e1d1-2e2f09f2280mr109a91.1.1728584746508; Thu, 10 Oct 2024 11:25:46
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:28 -0700
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
Message-ID: <20241010182427.1434605-27-seanjc@google.com>
Subject: [PATCH v13 26/85] KVM: Use plain "struct page" pointer instead of
 single-entry array
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

Use a single pointer instead of a single-entry array for the struct page
pointer in hva_to_pfn_fast().  Using an array makes the code unnecessarily
annoying to read and update.

No functional change intended.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7acb1a8af2e4..d3e48fcc4fb0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2752,7 +2752,7 @@ unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcp=
u *vcpu, gfn_t gfn, bool *w
  */
 static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
 {
-	struct page *page[1];
+	struct page *page;
=20
 	/*
 	 * Fast pin a writable pfn only if it is a write fault request
@@ -2762,8 +2762,8 @@ static bool hva_to_pfn_fast(struct kvm_follow_pfn *kf=
p, kvm_pfn_t *pfn)
 	if (!((kfp->flags & FOLL_WRITE) || kfp->map_writable))
 		return false;
=20
-	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, page)) {
-		*pfn =3D page_to_pfn(page[0]);
+	if (get_user_page_fast_only(kfp->hva, FOLL_WRITE, &page)) {
+		*pfn =3D page_to_pfn(page);
 		if (kfp->map_writable)
 			*kfp->map_writable =3D true;
 		return true;
--=20
2.47.0.rc1.288.g06298d1525-goog


