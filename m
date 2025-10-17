Return-Path: <linuxppc-dev+bounces-12955-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A525DBE5E8B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:33:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm4s1lRSz3cl9;
	Fri, 17 Oct 2025 11:33:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661181;
	cv=none; b=WCaiE+2h38s5chPkCCGxGW2AXbM9XuMQLFSQHuQTqP0ywdjOW3/AVwPor5nxIskAX+6f7r1BJOoyneHaIKNKTHvyFY0b37YGmto8KJJ5PBSMxmVpIqAqp0Xw9zXV/C2Z8KMD7DgZAjPOOiBGQiDDM0exHe2WWb/HIzN3boeQjUdi7O7efwddZro0dv7TJHsMSC4z/PQfuoSKfQnq0rmI3eRpLhaF8o/Kg1t3LiHIjgICZPD3qbVEwiVGHaIHnYCG3fHtGyYursrL9OUjVoj6yWqQiApOqIBB6Zb9nx6lCbgw4Xl69Dv/MUGntxF50d6jDuS/GysbJ+Gjoym83z6bTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661181; c=relaxed/relaxed;
	bh=+a1al4eiPUacV4Mot5X5KU5+gR34Rt/H3K9T45t0ZTE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K62PsdtQKc0YSEvB9zXBEslbkr7BDzQb+qURp9ycW6W2uAee2Nx9Na2bqAQX+FWgWXOXVfLfDUEuX/FDQuhWiCMllYrSn7NE7AbBG/Rt27HMvUsXNtiGdAKrLZ1CgUIrM2UBY/ay2E7agu3i4TAhfYNeWqXB1Y+C+HTJnZK/lvUlgWPov/aicBUKuKfjDgbFB34lcCtUB7EAhpmsnSbjg46ISSMMTv7QHtWBoDTfxhA5ktoTZ/sXyTs8Clo8Vhvu6PzINIcmK54igF0FjqTBe0eOq/CauDKrdJViGhXqjvBi6cW6+CAB0hZGWwK2yestZ+9VXhPH9BzQ0foCv0Ac+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gZ7pW0Pk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3uo7xaaykdosfrnawptbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=gZ7pW0Pk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3uo7xaaykdosfrnawptbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm4r3znmz3cfQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:00 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3307af9b55eso1200083a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661179; x=1761265979; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+a1al4eiPUacV4Mot5X5KU5+gR34Rt/H3K9T45t0ZTE=;
        b=gZ7pW0PkSdj59K5FFr/Ff8lT2Bqw0gpGufTjCTdZbJCdcKaK3yCFv4EJHCPNqiKdGL
         18UoP1GSR1HyyTeDlv6LQxDP+Cpz4InDrAu2sVQ2UNDm+WS5eb4nPvOGW6KbaST5cSrx
         Dgizy8iG2EDctH+nq0PaIk4+w5MnWAZWojEiC8YYTMA5YqLKUQbZ0D5VbDfh0MxtHNEc
         8qmnrMVPtI2MEKAiv+IVV9mR4b43+0OFtC+0fsadyfLVs/1Tg4xKavXaa1spGN0F661i
         jvjlTQq0YH6bXqGM1o6lsjw8Mu5+0mtZoUKQyBukfL5ijQDFzVJxPBulcGFqs7p1J7vH
         xfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661179; x=1761265979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+a1al4eiPUacV4Mot5X5KU5+gR34Rt/H3K9T45t0ZTE=;
        b=owkQRAUob+MKurzPPflWhXhkW9IN1nIhuZx8PrshNuZ2UttoErzjqXjRa0anbbvdpO
         FA/R/jMN1cVnd47uaAQlyJDY8jIBZPVyftOVPJwG+repBoSBDIlVZodnCmRpxo6kevui
         /H4X7dXVitD+xZ9Dwu3oIiS5MBVnMJZVg66nSZNHJOqAt9iqCROuXJpIpH1JQccazmm6
         5gXX942TkBZ/7Vv3epwFqLlVJcxeTBqlZ0n0PV6ZTawVWqFE6Ipr+TvQKhyeE1DXzFeO
         VCN6OeSxks3+N7KL5/M3UnaAjnNqw/hN3hQuwTsUs31Lynuw11gYUoOIrVeOaPqpCwCI
         FiPg==
X-Forwarded-Encrypted: i=1; AJvYcCVlwA1t57YHfUHQBM25JBXARWCtDSQdcIfhmpdGFkJ4DEKEFOsqO23fgC9PW26AtoFX2MnwnGT67ofbzvY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxN94qV3MtA+7fPJOwvOyUlSD47Kk+JZPjr9EjK0sMu9mgL/AM0
	n8z5sh05UML++4zkt4yRv94lMD0xMfEXT4a92/KHmglCNMX7zEvUX3/tc/8d2J7hot9tmSc8mm0
	ObPrcIg==
X-Google-Smtp-Source: AGHT+IHzIstKbR2q/VP+R8akfQ7d0mH54WcISHRgZ7r9iWOK+ijBTCVCrvD3k8+Ee7BqK468kooIUIkBSz0=
X-Received: from pjbgj21.prod.google.com ([2002:a17:90b:1095:b0:33b:b662:ae3a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1343:b0:30a:4874:5397
 with SMTP id 98e67ed59e1d1-33bcf87f454mr1982502a91.9.1760661178904; Thu, 16
 Oct 2025 17:32:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:24 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-7-seanjc@google.com>
Subject: [PATCH v3 06/25] KVM: x86/mmu: Rename kvm_tdp_map_page() to kvm_tdp_page_prefault()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Rename kvm_tdp_map_page() to kvm_tdp_page_prefault() now that it's used
only by kvm_arch_vcpu_pre_fault_memory().

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3711dba92440..94d7f32a03b6 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4924,8 +4924,8 @@ int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	return direct_page_fault(vcpu, fault);
 }
 
-static int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code,
-			    u8 *level)
+static int kvm_tdp_page_prefault(struct kvm_vcpu *vcpu, gpa_t gpa,
+				 u64 error_code, u8 *level)
 {
 	int r;
 
@@ -5002,7 +5002,7 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 	 * Shadow paging uses GVA for kvm page fault, so restrict to
 	 * two-dimensional paging.
 	 */
-	r = kvm_tdp_map_page(vcpu, range->gpa | direct_bits, error_code, &level);
+	r = kvm_tdp_page_prefault(vcpu, range->gpa | direct_bits, error_code, &level);
 	if (r < 0)
 		return r;
 
-- 
2.51.0.858.gf9c4a03a3a-goog


