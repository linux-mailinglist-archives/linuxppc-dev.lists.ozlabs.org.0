Return-Path: <linuxppc-dev+bounces-2060-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0B099907C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:33:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXQ2zXlz3cTL;
	Fri, 11 Oct 2024 05:27:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::44a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584854;
	cv=none; b=mYq+B93OzY31nIMbItjnSJNR//z2/szyp9wcvNyQjijZFsuNFFm9PBGlR2+yIzkzwbSHHJn7Qy5WlWM6HzahYXNb9GDxzWH0uu/Ps2xsmQn0FlO25zpj31N5fDVryRHs8LDkaXHQfBEF5MnTFKrnpazocKIx5qr9o7tdXOoKp7l5wCt+tEPZ3wlEfQA00JJ2whMKFd1ujSGmf/lStDZX0fM3cxIUFtJkn2dr7L1K0PFpBxMpKEWAC+S+WL1isMQJ40Aau7djrv+bkKK7ZXUn+3rZ6bp3Fe5svFVA8xwDKeNl8DCrHlbZGyJF6ouTh0JkPxOp+epBFPMUWYnf5FXfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584854; c=relaxed/relaxed;
	bh=fZpnWf51XalE5JTpUzeqj9xBy85lPuBTlHLH/3crpzM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n3hF2CpeYJVa4FZki73PqwYJ57CcnoZyAHsFXDqJVF2fQg//Pd2W+3Mx5RctLi1TVbYQ5aOyG4SejaXqv+V8+mI9rQRDWNznDU1ieoATnK0PFsHIameMzo3WWjy/dW4pdoonH3YrgUqHcqoMUElNYwnVOWes4mlj5JHkhOKpJ7Opr2iJQTUPWHiwdukwxOpRIC6xR0sUsYP/y/BAxwztvrfnZvVmNAnYcgmukfKjStvbClaEHx0QYBzQXolahREC1E/9t2d22aPMIngfxWJq/KJB/PbOzMEANlCbVBB4ZGgZMisNa1vWnpefyv5E7uJX5401X7kB5fpLIYo0ebUb5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NaIpAxiQ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3kxwizwykdcwamivrkowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NaIpAxiQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3kxwizwykdcwamivrkowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXP3fLwz3cSv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:33 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71e019ab268so1590141b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584852; x=1729189652; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZpnWf51XalE5JTpUzeqj9xBy85lPuBTlHLH/3crpzM=;
        b=NaIpAxiQUlDwRbRv/JQvEz0jdI2pEZEJCZuhYcELtAezepz2tIaYFE3U8KrGz4F5Zb
         8p3ajA4xIos8eEz4/nc3KvZKsJaYf1B39sOprU6D6Ru/MEbTArZ5Uhpk85EhEncoASyK
         Ef/QuYy6cCBrWQN5FZTH9hcH4+jJehgSLVoBLjtWLSXjJXs15LDdrfQfmoCaIVH4XlZJ
         GTxG/REf13UVcVoUcTe6sCz79OlirJHSgJQ6z2RoBpZa+jYkW/pBz4Gzh/9Ak/f1Bltr
         QzBUvccBE1b9qID94CiuxjdtxYMjKfQQ7KVFxQoB19Rmmlkud7Sd5esAhlWwDnt8UB8m
         XtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584852; x=1729189652;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fZpnWf51XalE5JTpUzeqj9xBy85lPuBTlHLH/3crpzM=;
        b=I151N9UN3Pc0vxj1kirVjEooPM8nubUseNXF6TPNYtPjTtILCjoDI0iTB2YSWZiIP/
         C2AyT0UPPE5KraK1So1t4hGBOoGyAsZ+dGsEFYvpAU9hqTL5T1R8IhOe5zxmSppdYkJ3
         zfQJpMLY319mDkbd5FVWElFwAAxMk0vK8lVbWwmrMLAEJePHNLgWfHqCnPdMZjnAuw+A
         ta/sIeUiqiYdu/A6aFVdlgsqwbmBkOdoG1mYdZrbJ0LeKyROdXZWBG8R4ObdN/xyIGjx
         Xx3es79M/cczE7wCFzs8xIR/gzJ9cHACDP1eluymiijEQBSNDxKtVralbbMyNCZvgpSu
         HBPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtzPe25WKbfEWYYYUdFfX5fIIFAodWSH25nZLdzXU4aE7oLqxk7JD5YAVFhwB223cQQJLdmi102C2og9s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwucnEIqSBuVgGbkNamWllq3BoeHTzb5l8l/E1KkMCZlZUUphSS
	JfWfbbAgMkUAB95IET85qUTTlUcjIfg8c8qxW7WUSlwwBPqLczIE0teMjsUrcD51vS10yuabnDo
	/8Q==
X-Google-Smtp-Source: AGHT+IHVUYgAS8Gi1OfHaumBjOVs/68U//Xc3NGlK2wEye9l2w1SuCdDQ/WQfsMbBzqgGqsCESzcy3AUxv4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:aa7:93b4:0:b0:71d:f64d:712c with SMTP id
 d2e1a72fcca58-71e1db65a16mr7365b3a.1.1728584851459; Thu, 10 Oct 2024 11:27:31
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:17 -0700
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
Message-ID: <20241010182427.1434605-76-seanjc@google.com>
Subject: [PATCH v13 75/85] KVM: Convert gfn_to_page() to use kvm_follow_pfn()
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

Convert gfn_to_page() to the new kvm_follow_pfn() internal API, which will
eventually allow removing gfn_to_pfn() and kvm_pfn_to_refcounted_page().

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 696d5e429b3e..1782242a4800 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3145,14 +3145,16 @@ EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
  */
 struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 {
-	kvm_pfn_t pfn;
+	struct page *refcounted_page =3D NULL;
+	struct kvm_follow_pfn kfp =3D {
+		.slot =3D gfn_to_memslot(kvm, gfn),
+		.gfn =3D gfn,
+		.flags =3D FOLL_WRITE,
+		.refcounted_page =3D &refcounted_page,
+	};
=20
-	pfn =3D gfn_to_pfn(kvm, gfn);
-
-	if (is_error_noslot_pfn(pfn))
-		return NULL;
-
-	return kvm_pfn_to_refcounted_page(pfn);
+	(void)kvm_follow_pfn(&kfp);
+	return refcounted_page;
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


