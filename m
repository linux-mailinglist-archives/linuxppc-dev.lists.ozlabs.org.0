Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD8A93DC02
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:12:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=b+FBSlUp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4nb1jVsz3dVZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:12:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=b+FBSlUp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3_zakzgykddooawjfyckkcha.ykihejqtlly-zarheopo.kvhwxo.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Mj2KLpz3d8S
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:37 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc54c57a92so10625795ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038016; x=1722642816; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cQ8Ke99Gz78IcD45RWrPNlFRmlyo3xxXp4XhOasYhk0=;
        b=b+FBSlUpVeC2wS1xXxVsEj73LOWVNjvGsAR7/j+EIh24/r1TtnQeFbeQxe6/4ifGeN
         6YT/abxZKDif5k6jcHLM1dMoJcEExqpvi6s+oIUUsjTNXF9WZRqeC2YJefEALw6t/dyC
         G9Ty9wEH3mQqODiKihdxfLiBze2hO2w2enmAbB5p4Ut8K3+g64t1c3AyIxBCn/gpZ/5c
         LEfQ74FGFJV2Dbiv5Ha+YV7Ma3sd+AEPohzC3x9qfG3doyrVRBkWno/0L6qWD7pD8FPC
         ONbGpieuSDOPTRHVo3xOjm6k5HPeS15qAbfg+1WONTFTFriT2OeSAz5v3CfcS9HFLH+8
         G4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038016; x=1722642816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQ8Ke99Gz78IcD45RWrPNlFRmlyo3xxXp4XhOasYhk0=;
        b=XawPIRJ1A6MARpyzi1aUHYCfGYiqacw5CcaHMX4i5w0DwWx51IoTCt2bTLtCRYhI9i
         rdk16inlcCB4TJO5QejkQBc9cI44J0ksn14MiMil/M5fGJsS6N8pweTT+SxbmQeV6YDT
         x8klArzVwg80UZnoIZtCGPVIH/TPk9G8Rw4g3S3aO+8X2mtr0z8H4ttHozct9LTVJMda
         /LoSFA1YrvPzGwWv17ZfXuUNRnHC651cPRg8pICmY4artYoYilDkZ1aOAIqs7s9FmQnx
         cjp7ce18jWUAwWGrHsWE08Q8T9I256nmjMys026ZHR09ZbeoOfo78yo4nsGqPv5F/w8r
         6qbA==
X-Forwarded-Encrypted: i=1; AJvYcCX97PfAnp7gj29uV/KueIF5UiXx1A5TWyD/i07gzjB7jbQBaXJrrkdmOsCPxC8gtr0XX/EAtYdc5k1zyewLUSKazzb8O3Plak2AEdhKNQ==
X-Gm-Message-State: AOJu0YygjOWemOsH0oCd6Eky21jkr5ilAHE2jF+U6ctuzH01ff3O+E9T
	MP1qaNJX2FKXQ5qLUfcl7nekjfycOQYThze+McC/O93FCaR2W+zr4wiLahupJbX7FshSmrI/QCW
	+ew==
X-Google-Smtp-Source: AGHT+IEYmoKPicLFNTjAfXc3rW7QIOSCWQtpI+t2ZFjfSCVkTMXBL3j4sNtxlzg5xGSYJWPU8sNID0rjz8Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d481:b0:1fb:5f82:6a61 with SMTP id
 d9443c01a7336-1ff047b8ea6mr1156745ad.5.1722038015496; Fri, 26 Jul 2024
 16:53:35 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:37 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-29-seanjc@google.com>
Subject: [PATCH v12 28/84] KVM: Migrate kvm_vcpu_map() to kvm_follow_pfn()
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

From: David Stevens <stevensd@chromium.org>

Migrate kvm_vcpu_map() to kvm_follow_pfn(), and have it track whether or
not the map holds a refcounted struct page.  Precisely tracking struct
page references will eventually allow removing kvm_pfn_to_refcounted_page()
and its various wrappers.

Signed-off-by: David Stevens <stevensd@chromium.org>
[sean: use a pointer instead of a boolean]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  2 +-
 virt/kvm/kvm_main.c      | 26 ++++++++++++++++----------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index a5dcb72bab00..8b5ac3305b05 100644
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
@@ -1223,7 +1224,6 @@ void kvm_release_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_dirty(kvm_pfn_t pfn);
 void kvm_set_pfn_accessed(kvm_pfn_t pfn);
 
-void kvm_release_pfn(kvm_pfn_t pfn, bool dirty);
 int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset,
 			int len);
 int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long len);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 48b626f1b5f3..255cbed83b40 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3113,21 +3113,21 @@ struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
 
-void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
-{
-	if (dirty)
-		kvm_release_pfn_dirty(pfn);
-	else
-		kvm_release_pfn_clean(pfn);
-}
-
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 {
+	struct kvm_follow_pfn kfp = {
+		.slot = gfn_to_memslot(vcpu->kvm, gfn),
+		.gfn = gfn,
+		.flags = FOLL_WRITE,
+		.refcounted_page = &map->refcounted_page,
+	};
+
+	map->refcounted_page = NULL;
 	map->page = NULL;
 	map->hva = NULL;
 	map->gfn = gfn;
 
-	map->pfn = gfn_to_pfn(vcpu->kvm, gfn);
+	map->pfn = kvm_follow_pfn(&kfp);
 	if (is_error_noslot_pfn(map->pfn))
 		return -EINVAL;
 
@@ -3159,10 +3159,16 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 	if (dirty)
 		kvm_vcpu_mark_page_dirty(vcpu, map->gfn);
 
-	kvm_release_pfn(map->pfn, dirty);
+	if (map->refcounted_page) {
+		if (dirty)
+			kvm_release_page_dirty(map->refcounted_page);
+		else
+			kvm_release_page_clean(map->refcounted_page);
+	}
 
 	map->hva = NULL;
 	map->page = NULL;
+	map->refcounted_page = NULL;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

