Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD893DC7B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:22:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zAE6kCkW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW51X6gMFz2ypm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:22:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zAE6kCkW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3hjekzgykdfkj51ea37ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4NJ6hnlz3ck4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:08 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7a28f78c67aso1346521a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038047; x=1722642847; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wxuzXAlWAmTLEMJkRQnxVQGU0NLqznOMJ0954FoR3Ro=;
        b=zAE6kCkWPNammJ2CJZKAtrj0Xk4wamE+vA+EOuaf8h0htlMSe4CW4wt3PsovrzcPiu
         RYpAQuQp4ozz3PdseP8Mpd8dx88Os6nYZQPGz9YSgR25iUSMFhpaKvGWqf/ioYL9Wg+q
         cfkGRGANqVHwRxciudZ4Heh0FQpK7lWZ80pspN455t/lwpsBi34OEd588VQ1WCcs6plN
         UNjEq4MoFU7ahxrTEPMVnD+Am/i2pNKbrv+kPnOv73S3aV6gTMTJumVth49OJykeB/6z
         9KsdmP8eIBoao61E3iaHlyznBrg49jcG55CJFIafR0aWQLlTkwdDRd9y9hkzLqhkoe5Z
         vR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038047; x=1722642847;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxuzXAlWAmTLEMJkRQnxVQGU0NLqznOMJ0954FoR3Ro=;
        b=ESIGO+FmwBn0vwKwZyss4jprAyd/sj4t2xb9+/8GO482cWCgXgKLTe49CASDjxxAH3
         mu9F1pfEAlW9zTbBP79VjECnDzzBMPnOmeGWRBgaMjpqSl/zn5hMrTWcDLc8r1HRFtk4
         hWSg3zD3YV+k6o7JZM8GSf67coEearwp3c7UG7zNT2K0uLtEwL1R1144hb+ZFIPCdUvF
         ol+yt0JLZZGd29eAGqPljL56tDx621AwR6uyPA10sUtoO4/L7Fzvtj2tGht0LtUpaLp8
         NrmF2/TNLYntevvrfoYRevw5fK/zDLWSCwb95ILQpy63vHQPFG9W8oZqYTnP42oxThEq
         3ikg==
X-Forwarded-Encrypted: i=1; AJvYcCWFZukN/ME5nznjQ0wwZBewfKetcvu+0ajsqJq+S7QfEGbkHCIv5zQ/zHFqZwY0axt/dRkwLcBpFLHcfAYytpIwUnyVbABXrFz0yNgWwQ==
X-Gm-Message-State: AOJu0YzIQlNghrXXQ5dBhxCKGqHV8a3kz7Yao53+YrxXuosCC2FBomi6
	cjB0zNBp9QrAIXla+5ziBKSKPyEcGO2HOu5kmeiTiXmCQf6DyFO+fde0yoL2JNtqNcJhcllQxOq
	blQ==
X-Google-Smtp-Source: AGHT+IHHkDF9jDFipyHQqfPDWUmaQYRR7lKWyDIChzQG4y5VknOXhGJqf1L9qSRAYqKwiuxxpki7u8BCvjE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:141f:0:b0:6e5:ef07:5922 with SMTP id
 41be03b00d2f7-7ac8d9d818bmr4158a12.1.1722038046008; Fri, 26 Jul 2024 16:54:06
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:52 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-44-seanjc@google.com>
Subject: [PATCH v12 43/84] KVM: Add kvm_faultin_pfn() to specifically service
 guest page faults
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

Add a new dedicated API, kvm_faultin_pfn(), for servicing guest page
faults, i.e. for getting pages/pfns that will be mapped into the guest via
an mmu_notifier-protected KVM MMU.  Keep struct kvm_follow_pfn buried in
internal code, as having __kvm_faultin_pfn() take "out" params is actually
cleaner for several architectures, e.g. it allows the caller to have its
own "page fault" structure without having to marshal data to/from
kvm_follow_pfn.

Long term, common KVM would ideally provide a kvm_page_fault structure, a
la x86's struct of the same name.  But all architectures need to be
converted to a common API before that can happen.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 11 +++++++++++
 virt/kvm/kvm_main.c      | 22 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ef0277b77375..e0548ae92659 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1217,6 +1217,17 @@ void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
 kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn);
+kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
+			    unsigned int foll, bool *writable,
+			    struct page **refcounted_page);
+
+static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
+					bool write, bool *writable,
+					struct page **refcounted_page)
+{
+	return __kvm_faultin_pfn(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn,
+				 write ? FOLL_WRITE : 0, writable, refcounted_page);
+}
 
 kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ad84dab8c5dc..6dc448602751 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3134,6 +3134,28 @@ kvm_pfn_t kvm_lookup_pfn(struct kvm *kvm, gfn_t gfn)
 	return pfn;
 }
 
+kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
+			    unsigned int foll, bool *writable,
+			    struct page **refcounted_page)
+{
+	struct kvm_follow_pfn kfp = {
+		.slot = slot,
+		.gfn = gfn,
+		.flags = foll,
+		.map_writable = writable,
+		.refcounted_page = refcounted_page,
+	};
+
+	if (WARN_ON_ONCE(!writable || !refcounted_page))
+		return KVM_PFN_ERR_FAULT;
+
+	*writable = false;
+	*refcounted_page = NULL;
+
+	return kvm_follow_pfn(&kfp);
+}
+EXPORT_SYMBOL_GPL(__kvm_faultin_pfn);
+
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages)
 {
-- 
2.46.0.rc1.232.g9752f9e123-goog

