Return-Path: <linuxppc-dev+bounces-2030-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFF599903F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:29:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdW92CkFz3cHS;
	Fri, 11 Oct 2024 05:26:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::44a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584789;
	cv=none; b=V9XcXyYbrLfZISDCCANaU2HXGYutzJwbtaTIxlHi824CwEykLPh/zyKj4RedYicvFpP3owh6KrpBoAqiQW1OcZFNNQHR9WePCyiOsDjBJ9/x03gMsxr6nII7M1HOdJ7ertRKmmRilc4zyU7TsHqmfsuHnD7mU6cgj1n7MzuhrHks3KKtnlQefu7lsPaGSG7YaISymN/+a0tCPpg2+6uGC1LIGnW49sbj/Li19uOAB4+pWgKj3gbKtftuHSTLGAULMGS1ODUtuFkaCWUFlK0v2wEU9LHeeMeGzqM5x8Gd7UeA7PPDO63izkDr7xdUrBy6ZcOLYX2Em6I0rSY+uW/zpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584789; c=relaxed/relaxed;
	bh=uRLwC7za7TRhyOe/CfUzhvpHD8RlodmrAsAEh9/RrLY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CWFbi6jC9b0tXyGpKZtbHFdZjwf19YWNAOfcIxN9/kNJkKVHSanwdsgEqJHBXFQmkxuhtEKuSQWJIUYUpZylePnK9E+jD/5Vsa2efRv1UxAht5WG28J4VUhMcDt5R57phOvDilbcr/8teIPXwNRJq99OiUGn4pMH/xu4YpD098ZiWGWYN6nRWwkqnL/xNl/YoTyXL9TaHUYwbNHck+sAoOKAOtzwslt/dSTya6lT2F5hhjMfa774lmcPn/twIM1Dsu/lzEeTdEMrcUAo5qId42h8PkOEf1PVjxOmtY1KiKV5sZ5ZZJsuxrv3vKoAzrXL9f7awbjTm0rRk6jQUcU9XA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=oI/GcB55; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3urwizwykdogcokxtmqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=oI/GcB55;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3urwizwykdogcokxtmqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdW82t5fz3cH7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:28 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71e0228d71dso1225532b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584787; x=1729189587; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uRLwC7za7TRhyOe/CfUzhvpHD8RlodmrAsAEh9/RrLY=;
        b=oI/GcB55E6ws5bYAK5aPY9W9ssMKZweEkQOtv4bmmWhu2rcfWHG6OtHt9ssnUzkgrO
         4oI3FG3dcyOlV8RPi1faIwQDqubVQ5uXOH66delW7nKg83roig53yrg7LCSPoheXEOpt
         zR2rfDDy2tVv2eO4Gwjc7JGwI3QGqZotG48xYWEnyhW1FF9XmXbSV3yv4tz+p474dXMr
         F7/LyHq6xQlraN69LcD/eYx0KChhc9Q0nIO+zEx5E/+NTzka8cZr470s/7HBf9sNk3bH
         /chO+yuJ5Ba2R0eL7WLRTNVGJx1rMv8Y40t4vzzOvCDHOh5Bw8pYVjVRMAYo0UAhbFWF
         gfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584787; x=1729189587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRLwC7za7TRhyOe/CfUzhvpHD8RlodmrAsAEh9/RrLY=;
        b=qPWiFb1MEEfz3LktCr8jkIJGQJHqz5PDD7x2Sx7Ip+t4bIHGImdAnUrO2ThO6Y6fvU
         GATDkSAwuW/1tmlZrDw+vMWNjbLk7/V62xSXDiweOF8cbRXC06i6L+oaMTscDx9NY5T/
         M/IHCWoA45JpcDT7mJiO6b+zdqOE8cB8eKxLfq23r4tDh7OBgVMNsSk2IYL09Ye/juWg
         Wyki9oSrJD1VWg9j6hYB32wDVSup9CsiFy6wydeABE7OSmBjKZXRLvMFp0CMToiDr3A6
         68M6ChIwvJR3LLgvRjv4rXmuUWiIKc1milGTylXLN2icgUb7UMJ4wbz6ZQiqlU4JqPXj
         FVVA==
X-Forwarded-Encrypted: i=1; AJvYcCWEy2jmLMMDVApfUhJsvJWns7qQYKtUjA+IHeUwLQhHtQM4hI2JhzuWvpZQM0bbmTHrEt5+BfBZo5t2v7M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyVTz+WGFE+Q4TAN8mPGsHxo3ypOiLa5uy3k+tPCE5dnhrHb1EV
	c1SVA05ZGm967NjfyGaaXLUGlCQHcVDDyZaeZ2V40D4p9cJSB1VC/bdmHh/j0s6h13eMQ8VLWEa
	0sA==
X-Google-Smtp-Source: AGHT+IHljZntO7iRsDkdAW1llbbIMc26iesy/7PCA9rtG6130gQpp6naB/6JGeYrnZXaXdo41CPgD6F3FKs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:aa7:9184:0:b0:71d:f7c9:8cb3 with SMTP id
 d2e1a72fcca58-71e1dbf1ab5mr7795b3a.5.1728584785442; Thu, 10 Oct 2024 11:26:25
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:47 -0700
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
Message-ID: <20241010182427.1434605-46-seanjc@google.com>
Subject: [PATCH v13 45/85] KVM: guest_memfd: Pass index, not gfn, to __kvm_gmem_get_pfn()
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

Refactor guest_memfd usage of __kvm_gmem_get_pfn() to pass the index into
the guest_memfd file instead of the gfn, i.e. resolve the index based on
the slot+gfn in the caller instead of in __kvm_gmem_get_pfn().  This will
allow kvm_gmem_get_pfn() to retrieve and return the specific "struct page",
which requires the index into the folio, without a redoing the index
calculation multiple times (which isn't costly, just hard to follow).

Opportunistically add a kvm_gmem_get_index() helper to make the copy+pasted
code easier to understand.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 8f079a61a56d..8a878e57c5d4 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -302,6 +302,11 @@ static inline struct file *kvm_gmem_get_file(struct kvm_memory_slot *slot)
 	return get_file_active(&slot->gmem.file);
 }
 
+static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
+{
+	return gfn - slot->base_gfn + slot->gmem.pgoff;
+}
+
 static struct file_operations kvm_gmem_fops = {
 	.open		= generic_file_open,
 	.release	= kvm_gmem_release,
@@ -551,12 +556,11 @@ void kvm_gmem_unbind(struct kvm_memory_slot *slot)
 }
 
 /* Returns a locked folio on success.  */
-static struct folio *
-__kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
-		   gfn_t gfn, kvm_pfn_t *pfn, bool *is_prepared,
-		   int *max_order)
+static struct folio *__kvm_gmem_get_pfn(struct file *file,
+					struct kvm_memory_slot *slot,
+					pgoff_t index, kvm_pfn_t *pfn,
+					bool *is_prepared, int *max_order)
 {
-	pgoff_t index = gfn - slot->base_gfn + slot->gmem.pgoff;
 	struct kvm_gmem *gmem = file->private_data;
 	struct folio *folio;
 
@@ -592,6 +596,7 @@ __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, int *max_order)
 {
+	pgoff_t index = kvm_gmem_get_index(slot, gfn);
 	struct file *file = kvm_gmem_get_file(slot);
 	struct folio *folio;
 	bool is_prepared = false;
@@ -600,7 +605,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (!file)
 		return -EFAULT;
 
-	folio = __kvm_gmem_get_pfn(file, slot, gfn, pfn, &is_prepared, max_order);
+	folio = __kvm_gmem_get_pfn(file, slot, index, pfn, &is_prepared, max_order);
 	if (IS_ERR(folio)) {
 		r = PTR_ERR(folio);
 		goto out;
@@ -648,6 +653,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 	for (i = 0; i < npages; i += (1 << max_order)) {
 		struct folio *folio;
 		gfn_t gfn = start_gfn + i;
+		pgoff_t index = kvm_gmem_get_index(slot, gfn);
 		bool is_prepared = false;
 		kvm_pfn_t pfn;
 
@@ -656,7 +662,7 @@ long kvm_gmem_populate(struct kvm *kvm, gfn_t start_gfn, void __user *src, long
 			break;
 		}
 
-		folio = __kvm_gmem_get_pfn(file, slot, gfn, &pfn, &is_prepared, &max_order);
+		folio = __kvm_gmem_get_pfn(file, slot, index, &pfn, &is_prepared, &max_order);
 		if (IS_ERR(folio)) {
 			ret = PTR_ERR(folio);
 			break;
-- 
2.47.0.rc1.288.g06298d1525-goog


