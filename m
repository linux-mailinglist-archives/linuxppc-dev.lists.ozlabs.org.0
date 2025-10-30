Return-Path: <linuxppc-dev+bounces-13581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB35C22236
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:11:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFbG3HY6z3dVx;
	Fri, 31 Oct 2025 07:10:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855018;
	cv=none; b=PhwbI17D5sg2BggS6Hqp8xrUseNdpswf44yPs7hDIRp+RwS6+ZIpQis7UK3aSJUY5v1kKp6wbTXWMB2jVU8QJr39X3pnDfU+D+W4NK+4090XfT3jRdPUAv5ymt8gAuGbpkGXVdzkl4Kac0ns6Blb6g13D0ojmP27HMot5QObp7a9j7FjtNDgfSuiUUvwAnBClmfEz+amjvmn7CwbVO0iUxuDvbjaXvQWm7NBpyoGwYradKga8rvV+wLaWAgir/cM13hNnLaHA2/zfmd2Ftq/7Yp9pCt7IvJnVPHi7/fUmaiK2pmDZ1viytnYD2Rg/lZfUpA476pBWfL6JuvRRg1ntw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855018; c=relaxed/relaxed;
	bh=JLmVjM6Rep3/JgP/0z+P5jqrWiynYk4juTN/f68hSuo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jI3zonblHerkTFz9aXLVHqedxrQPSKS2QEWYsUtrDObQLgriRSV8sa9pFJUiHXc8pSJ/9IqVI0WVAnDd9AIAhI7HuclD5usNSn9VMVE/HQOQfZD0+MA8XtrHI+j5wKNO+dQG6tgksi4Hw3A8sNO48MmwCmJuWyo6hs1uHb0DpMuKLsSk2pKdhLH1xEUs/HU0cXA/22ZhFmQZvGp9be/55fyg4W13wv9mFZiPXI3yPbn532fK6/kTdPJ637UI55CSqWadrCACs1AG6V7xFe8PUBQpBWeNzHwwARClOKwyFYjztt+VcO7kEhr1cqYUe+CQYg7uuL8y8f6afhHYNLvWOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=s9P1Oup/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3kmydaqykdbmbxt62vz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=s9P1Oup/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3kmydaqykdbmbxt62vz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFbF55qnz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:10:17 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-294f59039d6so12297745ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855016; x=1762459816; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JLmVjM6Rep3/JgP/0z+P5jqrWiynYk4juTN/f68hSuo=;
        b=s9P1Oup/83+RaawWI6yPOx1B9by/YuzP+5E+LTff0GEnOSqDIIILp4pAk7IV+wN82D
         HKU1EPjwjIlqMtd9KvydnQ3iO1l+H0F57GLXtSWlc7mpjZd7lUU+s1hUTP9IyZJhl+s5
         9uO7+5v/I1M2kEJpPHAGGGB/q6+W6mqnneIqY5qxlnFlqyA/k2tCNdZOyy0DL3OFhj05
         YclcyaUH+5cDrAQzfYp+YbERN4kLYtx1Oa9g7OaOylyt7XaT8uf/W5axHNSiDTyuZlJf
         3rzkjB5DYfahR9jwwxhQvC9HY8ASM+ftOo0tYRQfHSmMcwV7u830Ap35/S/fhHL7otA0
         qt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855016; x=1762459816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLmVjM6Rep3/JgP/0z+P5jqrWiynYk4juTN/f68hSuo=;
        b=RZcVH2KsZVG5bC+7BrsYyNrsAXB+oa6jGdSiSnrUheizayqezLIhMxNmjMauaay1YD
         hxcF2c9aL/LkomAwi3yH7cdxiYxarXOGaKJSuFo7Q2qsqqxxaKBdSbUsuzIVApEliXBv
         OiNIcAxGYsoJvIZ84CjcSW3zhE67vLjFN/wa93P/nBV7I2neYxBdEiVhuD2uijG6CY+P
         hybv0X9pCkTe1KWgUNmylnZ7l9U1R1u8nuQwdH3XKtzeFieUUCbCqpbhOjU/UAlyhpez
         Frrdt+QhJS2RsyZ2yfA6ftMZbgi6Pb5K8qmMGJwDisjm+ADvLW6pfHuHNJRLzajjS21t
         vsPg==
X-Forwarded-Encrypted: i=1; AJvYcCXQshgrkLSxgXNMkD1ZAFPauL/jTOs8u7PrXFOX1Skk5SDutQeVPcr2X0V+QKPndeb6otTjPtxkW4wRqVE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyViBPa2WZ+ykGd5Onj2qxwDfPb+BjVwgEZiOyYhE243rDAgazS
	azA0GsqPgsna6hfSwOmmWmlIW9yw51YupZ25+6ABLbkfL+DtxnXFOlB6DfZMg1bUJKf1myzHYVt
	ej/YEGg==
X-Google-Smtp-Source: AGHT+IH1/xZVzpdLpqTCV5R9sgqM94QaK+KvWTLge6Sarj+nuvNBhb5+D5DYqWRmVcfvrQhQkF7/dm0shPg=
X-Received: from plnx8.prod.google.com ([2002:a17:902:8208:b0:290:bd15:24ab])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88e:b0:28e:7fd3:57f2
 with SMTP id d9443c01a7336-2951a491f2dmr14399305ad.49.1761855016072; Thu, 30
 Oct 2025 13:10:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:30 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
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
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-8-seanjc@google.com>
Subject: [PATCH v4 07/28] KVM: x86/mmu: Rename kvm_tdp_map_page() to kvm_tdp_page_prefault()
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Rename kvm_tdp_map_page() to kvm_tdp_page_prefault() now that it's used
only by kvm_arch_vcpu_pre_fault_memory().

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3a5104e4127a..10e579f8fa8e 100644
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
2.51.1.930.gacf6e81ea2-goog


