Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A0C93DCAE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:41:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Yl/uSnFT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5R82KBYz3dL8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:41:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Yl/uSnFT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3vzekzgykdjie0w95y2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4PP2C2vz3dTN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:55:05 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5e4df21f22dso1272982a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038104; x=1722642904; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=y+Ar7T6On16alzy9M8c5sPTmukkBuZuZUdMs6MViY54=;
        b=Yl/uSnFTWtUANGl1ZkcismFZWoU6z5klXboFD8pFACOO6ti6nUZ6Me47ZPhLFa0jMW
         LaRYi/1k9XfszPuwOs2VosU0Cm1o2FIkPgnIa9zUYwz+vtOCuRh/f+k8oG+QzZhtrPd4
         LVaba5JTqtUw9ogtblgUj3EEmpGTDNfKUux3suhFXdYOUuSd77qyXTLUv4+b7usOoCXV
         knMls+mFwLz1Iydl8jzus5L4MBrfXLosg40g/373UZHZmvYxwdsaFNdUqEn0WXx+l1r4
         E+2IuEb41argrTd2TiM3cPyVLDBTWwugj0A2AVjA9mSVw8lwaPAqQ0987DMieQ/scIWz
         qPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038104; x=1722642904;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+Ar7T6On16alzy9M8c5sPTmukkBuZuZUdMs6MViY54=;
        b=I74zsGkA62bgGI1AbqkenlebjKJUdiO462JTm/YUq7Jy8woQ2jDsJM3EiqL453Qd47
         kzXOo1HttxfGNehYf/+gkPl1Wl/y2BnijHwceduCUnICqJ7U7lE43pjlhqlh1q9Xgb9Y
         +CRJFbUIOi29Zc/W6r++27Kpg4+kgGFcvtwt8eKGra42zJb2PekjjdsJV6/2dBKdsKVe
         7PeVDNSS5zwsk6xq3gQA6cOVy10fUqR6TIFxIqh5TJcKIA+qCPgAJxnq1NMLcX0Wv3/x
         vAsGKzJ2Avl214AsKFhn/PQTIpqz88XacAlxOHm9ne3NDFLJSuAIsCJzIKnUX0wyDnZS
         3u6w==
X-Forwarded-Encrypted: i=1; AJvYcCVOdcmEvpguPL5nDiXKkpKXnmppw8xFZ+cWC+bgvJF8vUr5rxLvUFcpg98GdLLJlQYDcoQV6Zcpz2qGSta/GuUtv23+bvSNAioJP6TZDA==
X-Gm-Message-State: AOJu0Yy4r8zyWr0kO/89UXUEgy9YfIUSVVaQD4MXVdFsc/rnGoBglP37
	f34yv9Zck9a94fRjwccUK6631GuUa3SEaNlJhQlg8w/RN43htEbbidiCpZDs4GlyiXKZMHhuoKC
	Bpg==
X-Google-Smtp-Source: AGHT+IFnr9ua4KoyN+kf9dgXRrvt4SVsbQldBEs2PtVQEhle6Kqivs/NJk7PeSFySHT1lFiCWuBu3lKqAis=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:50a:b0:740:2b12:8780 with SMTP id
 41be03b00d2f7-7ac8fd30684mr3158a12.5.1722038103410; Fri, 26 Jul 2024 16:55:03
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:19 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-71-seanjc@google.com>
Subject: [PATCH v12 70/84] KVM: MIPS: Mark "struct page" pfns accessed prior
 to dropping mmu_lock
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that MIPS can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index f1e4b618ec6d..69463ab24d97 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -634,10 +634,9 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
-
-	spin_unlock(&kvm->mmu_lock);
 	kvm_release_pfn_clean(pfn);
-	kvm_set_pfn_accessed(pfn);
+
+	spin_unlock(&kvm->mmu_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.46.0.rc1.232.g9752f9e123-goog

