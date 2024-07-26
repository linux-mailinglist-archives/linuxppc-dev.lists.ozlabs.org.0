Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F40593DB60
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 01:56:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ww1jrKwx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4RG0wRCz3fps
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 09:56:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ww1jrKwx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3zzakzgykdao2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Ln5bc2z3dTP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:52:49 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-70b09eb46e4so1449157b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037968; x=1722642768; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=1PAT6v4tn5ltatT/kjen/UunIT1fRhHnj971W9WBYQU=;
        b=ww1jrKwx6JvCFMvZ+xPEVJ0WL3Ba7nohCMx6vKm6ptu2LqAMWZPOoRVbucOHEj2nqC
         3lto/DMqVQRBffU9cpEymd6oT6WCjPTdzUX1kcEeAuREWEYDgU9vGHHySqXxPlzRhATQ
         afXT+7cbNd0hArkJ6PAduoOiZsIUgS5yghMdd6asvziO+FNqKjRDZ0t4NXqXGcAYH0a2
         MEPBmXxZozns7t9rBjZ8iReeZ0kq3VuZRvntHMxo2ZS3OQ/VGP73ExbVCRolJO84KEZj
         a6eGneVwENt3ZjNzlDzu3divpDKqCsrDEL83OoGPzDxi8+A1S1j+UQxYsWmhgfKeHo/e
         gIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037968; x=1722642768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PAT6v4tn5ltatT/kjen/UunIT1fRhHnj971W9WBYQU=;
        b=X8xzRY4gK1JmpcajJAfX00IBlQlxKH9xCKN99vF/nI0y5FQ9qVti+juYU/1Bov+T7I
         w/oJfgDMmbKQh+PtHBV+cmbbiuTLPfFDwmELED51BmnVrfbCRCeZaYswtcCsi6ZDrU27
         As2R0iKOlTnQs11Bfi2tHiSpq/QMqCifLagwFRbjokZmXEqJbDzHJ76XEdZnzvyd6q5B
         ZYxDNvDYzL9VIOY2KBmT6vLuC8U/gpgWCWD24r+tz3UThX7batZgO9SUkXeUYZo5QgcP
         3GFCpJrLhvx/2LVFdd/AN0H1qESu2razM7tyO6LiDRO0cVi9nGLi2YfseccTOd32t4z/
         hDQA==
X-Forwarded-Encrypted: i=1; AJvYcCWkoLjnB5KwVX7zQ437ZAfr+MemLiVEf3+m7tKzYCSyPN0AUc/CvjfxmrCk5j/ts1gAjZhIPG/R0aKSEiwb0Ox1SipC7MND1c7peHCK4Q==
X-Gm-Message-State: AOJu0Yya0J9eUE2SZ7YTgSM4nRT5Z2qVzAwn+NuVaM3xNzY0FglTrVfx
	bl5I0LNABymXEIcoENk2rgVUhGfAAUtzHV/RsvxkmTRPczAsuqvWVC1ILYnuTVxtlR5FxzmgTeR
	7fg==
X-Google-Smtp-Source: AGHT+IGybwcUaaDWGaRnVlNYMzL2lybkBwi+pdiFBv1toqDzA479d7SifMoC4AbRMiwOqaRTolCzzwjRN5U=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:731c:b0:70d:13c2:1d08 with SMTP id
 d2e1a72fcca58-70ecedb0dfamr2514b3a.3.1722037967857; Fri, 26 Jul 2024 16:52:47
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:14 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-6-seanjc@google.com>
Subject: [PATCH v12 05/84] KVM: Add kvm_release_page_unused() API to put pages
 that KVM never consumes
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

Add an API to release an unused page, i.e. to put a page without marking
it accessed or dirty.  The API will be used when KVM faults-in a page but
bails before installing the guest mapping (and other similar flows).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3d9617d1de41..c5d39a337aa3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1201,6 +1201,15 @@ unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t gfn, bool *writable);
 unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot, gfn_t gfn);
 unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t gfn,
 				      bool *writable);
+
+static inline void kvm_release_page_unused(struct page *page)
+{
+	if (!page)
+		return;
+
+	put_page(page);
+}
+
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

