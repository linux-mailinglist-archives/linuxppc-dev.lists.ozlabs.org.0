Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E16993DC2F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:16:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KHOl2UQ7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4tM1dMYz3dFB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:16:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KHOl2UQ7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3czekzgykdey0mivrkowwotm.kwutqv25xxk-lm3tq010.w7tij0.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Mx3GcLz3dWr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:49 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fee7c9e4a4so10496675ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038028; x=1722642828; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=f0UOaTihDpRJ7PP+Ej2doGcOk+AHWo0BkuOsHzozLVI=;
        b=KHOl2UQ7VvQGd5GtgnKZ84oJer4ZebuZvjVQ8smNpeI38JOz3H2GrWjfCCa/cBdLwb
         DgIUXIcYcm9EIuoiiyOU/xxMYr4RyiDnz3Klfike3yJyLHqzRRH53XVVqmtbVNkcgmV1
         +1CzjJW3x09OmOiFVWywUlHAfDZkVMqtlNah/R0s4TVei68ljeQVnFnN4GMALX/84O0T
         LTZApmvEY5rJM4TuW51RL+dbNZfBDqqEFy00UAP8Zb8lrOQWO3eyUC/qxgbtdOpk/bak
         zkrxI71/CIEieDmJoENSmy2tbnLWGa/JskfFR5BtJS6jEurCO46qUCJTtwvs4xuQkCxf
         Va9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038028; x=1722642828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0UOaTihDpRJ7PP+Ej2doGcOk+AHWo0BkuOsHzozLVI=;
        b=gezhVRzbbuh2+O+20vPLo05GolW1Sms00ExIOgTJkJVPp3i9hMSq2LGhdp2q3Z8jmx
         XlhxC/YzuF1dsk6ONJt3KRqUYVuJ+cxv1lB+2Fqie1hgY18sbVaFkpM9OmY2zVqcYxIq
         wjCSt2mqemFMVCxWFqoXBmp+JIFTdbQqcfmXd4XnMAl7n1sDWxJFGENTfZKkLUvmo2Ss
         bDe0EQAZvSqjtQYTM9gj/Jr4IAd2X2752XQ178R5+Dgr1p7xtBWX8I3c1Y8ieTKy/6LY
         CJnNFPku8mrH+PvTBa4uqajWY4b+oqNPxAummT72lMErdWmdTHb7Oo823+GX9SINEv3K
         mzLg==
X-Forwarded-Encrypted: i=1; AJvYcCXjnhNpqxcnkWwiLrChexFOlfxBj8CUa23NVTo3cxwAWufvVieOe2TNLwKn9cMlhVtf8qk16FF5kPwWwqQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw3kuZPl1HOqWYSWkSxjHP5IUyib5O6th3Cl8fweXLKtyRbJiGb
	K5a7RHjTRA29KMamZsjC2kFkThcUdk43t229ev2Ot3JFUbdIaXaOKUUABBBlUoXAi1EYNwxPg9C
	idg==
X-Google-Smtp-Source: AGHT+IGYUMRc1uUxr912DKcgHH4gUUnvf0wLEKnF8dkY5ruUFOJLgoqFTBS1LD3evC3JUrfTD0ZWGbhz678=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:cecd:b0:1fd:6529:7443 with SMTP id
 d9443c01a7336-1ff0486a65amr545105ad.11.1722038027663; Fri, 26 Jul 2024
 16:53:47 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:43 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-35-seanjc@google.com>
Subject: [PATCH v12 34/84] KVM: Add a helper to lookup a pfn without grabbing
 a reference
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

Add a kvm_follow_pfn() wrapper, kvm_lookup_pfn(), to allow looking up a
gfn=>pfn mapping without the caller getting a reference to any underlying
page.  The API will be used in flows that want to know if a gfn points at
a valid pfn, but don't actually need to do anything with the pfn.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 82ca0971c156..5a572cef4adc 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1212,6 +1212,8 @@ static inline void kvm_release_page_unused(struct page *page)
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
+kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn);
+
 kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 0b3c0bddaa07..ad84dab8c5dc 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3118,6 +3118,22 @@ kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
 
+kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn)
+{
+	struct page *refcounted_page = NULL;
+	struct kvm_follow_pfn kfp = {
+		.slot = gfn_to_memslot(kvm, gfn),
+		.gfn = gfn,
+		.flags = FOLL_WRITE,
+		.refcounted_page = &refcounted_page,
+	};
+	kvm_pfn_t pfn;
+
+	pfn = kvm_follow_pfn(&kfp);
+	kvm_release_page_unused(refcounted_page);
+	return pfn;
+}
+
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages)
 {
-- 
2.46.0.rc1.232.g9752f9e123-goog

