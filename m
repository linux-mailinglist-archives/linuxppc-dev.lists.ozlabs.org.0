Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EDC93DC98
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:32:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dZrt7Ljo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5Dh4Vq6z3fp8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:32:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dZrt7Ljo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3pdekzgykdhcnzviexbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Nt28P2z3cQP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:38 +1000 (AEST)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-70d14d11f42so1334370b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038077; x=1722642877; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8WWxSeEhwRY8Kz5lKN5dweAMeNFVe6itBQweyIKsQVg=;
        b=dZrt7LjooDV8aqCgUYK2UiLrKE6MvLV3GXivGi0mC2D3gQJnj6GdbUik0/mEAI7s2X
         /G2RSbeWYWwFY0g0Qy2ALonhuepCU6z8N82R1xGA/nLlbHteN9TuCbuZmdMxvo43flLl
         bBZtC3HO4Ii3LqR2odyxs0vXrK/uDvJQmtk6KdNPOuEOyHLu74JUt3KFEkBpSZFWL1TB
         xSNOWZs0H8FJOvwiIrIdqRHe+9jxMlLceifAK3RNv2Z0uWUwjOPHXyPh15fFeMLCodoL
         bc3doemPiCQ2GHiJTx8RTScMV3C4qzrqDw07hXkYpCosBv4hcBw10AVaULDexs8RS0Gx
         +5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038077; x=1722642877;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WWxSeEhwRY8Kz5lKN5dweAMeNFVe6itBQweyIKsQVg=;
        b=XCNEyB9YR8M4H/uXdH20lld03UmgZZZiE/S9PxCk0T8YArduxNlT/XiFKbnLZgsHwt
         6RuIqCpQKWMDJKO41Q296shDL9ydl6j5C03DM+YPRMLKZz5iIczC5EqSGOWwnwQAF2j3
         AZ5Y8rA5I6AOtlbTiB1Gn0to9IW5qgdc2zNyZOG3wPDicMlgUkylASWfbjaXthnyf4Ex
         edKpqfelQFo8ZOBKDeFDIb9TRVeMPipnU0Z+ivb4872lW3LTv/rknItkBNRA4BaNX2ar
         cqCcbfnx8V4Tc/q77p6AJzaESo9QD1izT4f+ijtgs3WQAIX0dmqdqappanXImHjgPEGE
         e8cA==
X-Forwarded-Encrypted: i=1; AJvYcCVNQMyx+eaFmrnCjSzUrBqapB6QR6lAAt6qn92nY+/FSroXm83Jh9VSrSnFtaAciD2PZla1oi4QXABE9IFdByDcPd+rNG+LSAyB2VWw9Q==
X-Gm-Message-State: AOJu0YxgBbxYDd0yGV9fTn/epnWd5S7ghBfdpS4prhg1fIw72wSgCW0s
	KiYt3ElEQmNcOoIzoWWJJhZznz8rBe8ZmGFsAV3yWxWeDPuVAwHpjcAsZ9dvWGtAEXfJsj0QgFB
	IXw==
X-Google-Smtp-Source: AGHT+IFil497nfsH36PcPgD5gbB02jEmsX2CuGy2fe2s5ytKElT5nFsSQdr9eHlR2IIEavfJT4DgKyMZ3iM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:66e5:b0:70d:1e28:1c33 with SMTP id
 d2e1a72fcca58-70ece9ecd04mr10022b3a.1.1722038076443; Fri, 26 Jul 2024
 16:54:36 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:06 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-58-seanjc@google.com>
Subject: [PATCH v12 57/84] KVM: RISC-V: Mark "struct page" pfns accessed
 before dropping mmu_lock
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
so that RISC-V can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.  Marking pages accessed
outside of mmu_lock is ok (not great, but safe), but marking pages _dirty_
outside of mmu_lock can make filesystems unhappy.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 06aa5a0d056d..806f68e70642 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -683,10 +683,10 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 out_unlock:
 	if ((!ret || ret == -EEXIST) && writable)
 		kvm_set_pfn_dirty(hfn);
+	else
+		kvm_release_pfn_clean(hfn);
 
 	spin_unlock(&kvm->mmu_lock);
-	kvm_set_pfn_accessed(hfn);
-	kvm_release_pfn_clean(hfn);
 	return ret;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

