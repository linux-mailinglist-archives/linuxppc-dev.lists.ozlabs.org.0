Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB8793DC50
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:19:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uF6DzthC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4xZ3SJjz3dVp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:19:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uF6DzthC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3ezekzgykde48uq3zsw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4N552Zwz3dWF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:57 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc52d3c76eso12298535ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038036; x=1722642836; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=G6XdYYnK6SmaIVsSbjLWLiXTD6vQEkdodh0PTaLJXbU=;
        b=uF6DzthClybhJzVsxhK1mptVLA1VUm3C4jCCDE6+1kyFO+gxUOoZ4keyo30U4skb5W
         bbUwX0h3Zsv6KUQHTm01cDA8ixPiPJJ6t/TtFF0upqeTSuYFWLPvW/xW8jSX+6ygXQ4J
         0BxuXeAPbWbsBL3mnfT3OAZTnht0skFF3B7UvAS71BCMp5BPBn1jOi4VgTGFKu+tXB+h
         k6MGSl9Q9SpJA3HVO1ECOCIMzQmufhPI0bmcp+DlEMCVSmgKkPn3C23kJe+tG6KVtQMV
         pCtukiEy7B2Vp8eNumb4bbfDsZDIEnwAATd55CBjrsgHTB5Tk3EwAGfTOnaNzrHiQ+jD
         DShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038036; x=1722642836;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6XdYYnK6SmaIVsSbjLWLiXTD6vQEkdodh0PTaLJXbU=;
        b=NZgh4jWN2HYu9z1/aAlOL3xPpGvgtB2KasMU8VbD/VHmkJi1/RpCXW3/lNrXiR0ZOk
         WaJAGjK1JG/Bu8tU1Uc6VbGkNZZDJT+fWfkZIS3YntQdyk1B8n9W44KgSEACUKRHFJJH
         aDBmw04Hn7t1niXriizpcII53pYToUs2t8WTRqC0LYw+0IMxbKCfC/4zv9lsaeEjzFQk
         a1hvVJfK8MDVbfMLgNOnG32UZ5Xw2Ib/Q98m18llPwb7/JahzwJaT83y8Fua38lmnZ/r
         aqGS3F32iutMgfuud2K2NbwzVM04DTp2M3n50XUMF9ViS0linAmcI3UetoGoqOpSjD6a
         8c3A==
X-Forwarded-Encrypted: i=1; AJvYcCXXpePXUeywl6XcaaSjMzPh9ll4/l3n1yAljtUEFMB5mUjSlABcofFP0H5bgE0CzLRZSpqBvqjcwTad1jdTOMdxw4vZ5X+qxecy2r7+RA==
X-Gm-Message-State: AOJu0Yw3PJl2O7NRjCr9KJvZ7cokZ53NZTE5EjXApALulm+P24CdewiP
	wK5ppzBd3Y8STlu0qFBMzmIbtBsKe5HO6VnzT0vNFQhxxLm2P2hyoj89SAJxr9xSljJ1Zj7qXBp
	+kA==
X-Google-Smtp-Source: AGHT+IFqcJX/9FY6hmZYd8EnC/sSURY7mS/rFneQMUHDSr3ovaE0Tb6dbx+RwJc5DGDg7FZUxHqlUK5Q8cY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c945:b0:1fc:733d:8465 with SMTP id
 d9443c01a7336-1ff0488cadamr598725ad.8.1722038035986; Fri, 26 Jul 2024
 16:53:55 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:47 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-39-seanjc@google.com>
Subject: [PATCH v12 38/84] KVM: x86/mmu: Put direct prefetched pages via kvm_release_page_clean()
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

Use kvm_release_page_clean() to put prefeteched pages instead of calling
put_page() directly.  This will allow de-duplicating the prefetch code
between indirect and direct MMUs.

Note, there's a small functional change as kvm_release_page_clean() marks
the page/folio as accessed.  While it's not strictly guaranteed that the
guest will access the page, KVM won't intercept guest accesses, i.e. won't
mark the page accessed if it _is_ accessed by the guest (unless A/D bits
are disabled, but running without A/D bits is effectively limited to
pre-HSW Intel CPUs).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 4d30920f653d..0def1444c01c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2919,7 +2919,7 @@ static int direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
 	for (i = 0; i < ret; i++, gfn++, start++) {
 		mmu_set_spte(vcpu, slot, start, access, gfn,
 			     page_to_pfn(pages[i]), NULL);
-		put_page(pages[i]);
+		kvm_release_page_clean(pages[i]);
 	}
 
 	return 0;
-- 
2.46.0.rc1.232.g9752f9e123-goog

