Return-Path: <linuxppc-dev+bounces-9268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E532EAD473E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 02:11:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH5fN3cMRz30Bd;
	Wed, 11 Jun 2025 10:10:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749600652;
	cv=none; b=Sg52vPDyP+BzuZ4K0x2z5Xo6fCwNWdG+QKygPM3iSRbqAbyCmWAm00u8NlhZsjoUQZPid7MIPKqti7vlaCzxtdwUJSvE4wUJMcjWXNXBxytFb/LCGNqzhsMIV8cIT/klpzE1On5DvHB6OGby+4E6/hNCITPp41rpZm543oeAKQlge2QipPtwSOg9KdIO2/d0O/8Vrt/6nit+ws3y0rdMfUK4UkR6d94dAFvIo/893IQQBIAEa6EyAjnBO4UXQ34r1aN2uAN5cVd63dP6g0MRgeGx7Vnwk/63Y9MTNU41Z7LaOjUVGisHGKnCsQ7286SkYst8DdNwiyAINXB9WwU2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749600652; c=relaxed/relaxed;
	bh=6JPxC6M/8C78oUmZk1MgMr9DeqlObfjqst+28w3sGNI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=owO5ZNjoUw0104396BO8DngsnVdO00sflh0Uez0HEPH9DoprmdWhl2jx8ty9aaib167YLcf/B9CpROenX4ZbRyuPneWCS0Nnricon2wRF1WxqY0dgkNUgRJCsf9iM3h59wdzZcKwf7DyKojyEWeKaAn11FpkKe1cvaZcelT35FypHxPQYxsEI+57oOmN6cCjyhQP8k4y/PwzySIbumZgytrlt6qW243P/vOAu6A+3Jp0uDaOZqzQs/SbLa5QHK21D+lbmuWvvNmx/QPeNictyyxARYLkmmWA8LxnAL9QAKQq18vu0TmtE8/9IK9UU1KG3aEP6eBCF9t1Gz6+AeNiGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2j+pKBGY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3imliaaykdic3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2j+pKBGY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3imliaaykdic3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH5fM0jVdz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 10:10:50 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so5482435a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 17:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600649; x=1750205449; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6JPxC6M/8C78oUmZk1MgMr9DeqlObfjqst+28w3sGNI=;
        b=2j+pKBGYlMASP+InLqoVROxj7IyV8i3Agtp0CrwOzIMRbd74ROkInlMaQ+nSA/vVr7
         XImcuLLvdhVkAG2XtYTjkNisQZG7P8AB+Ev007hCW3V61Ui0PXEcLW3kVGI9+QvSvGPE
         5n/8tkkEzmbz71jwZEMVmF2q/8eehI8S/ynP2zEdKyR4AotvUJxAps4OgJN0id1+AtqP
         kqoyPeSpHRucD5RRG08dvNMqIo2lRTBIGCgYZTouhyX+RCkeB8f0AIQlrRKaR3ciCt8E
         wmWPFhBR+l+aMND7jsuWRODBCkSNKzo+FxVZXns/SBQ9ZWxIyy7ufhT8S3dKhlWIFVLV
         +oLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600649; x=1750205449;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JPxC6M/8C78oUmZk1MgMr9DeqlObfjqst+28w3sGNI=;
        b=pbL5REwjJzhF9yuIjsXZIAQ3+8V12gt3ds7IxU3zuFj78KjDNrlvOPFaR8tM7ptNRo
         pKfukBbcXE4l45ssUnkNxKOmXtm0RfWqbQ+Q4kBtq4EFJsfrbohlQg8aGV3IRqBhjjw7
         feScL0CnXNxo7Wyrxr/rgnebo+xOZDn3jl/bZalJFwJkIBtsuObCZILPrgsgDnX8qrIu
         l3KqoRgv78lHSs2JBy5MNGK2FCkgik2MhngWFglkR8jjknLq7Pucj3yI0tzR/mJRocO4
         TucavHqWGm4ihENwf/7MjaxSG4W6EKqhgfcJCzWaLn7i7mGQ3lX5ORQxgNyMfpWNyWOh
         Ulhg==
X-Forwarded-Encrypted: i=1; AJvYcCWeNlZqz+H3CMK3Wj7xGijSiyNQqR9G+7Iji5qMFQt/I5T0u4J57Nh0hTmXl2TeiwvWc5MAc/GO2hJvsb8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSAMrOtEgU3919Uamaf4Y6UnqbMcdvYUNx3woHZBPFVyW2HbYk
	ybAyk6PlZv8NsDyzSlcD9WVe6zGGasVf29RestAqCATbP73FRxaJYNZQY9FDGcnRyL5k9rBgpmO
	qCBMLcA==
X-Google-Smtp-Source: AGHT+IH8G3icYEi+L3rUhxMgi7kY7xVjk4t0ltvPAXoSgaLu6NXS+iOsy9Z0A/wrYNq1F2Q9c5lqhoRbAbQ=
X-Received: from pjbsm18.prod.google.com ([2002:a17:90b:2e52:b0:311:c7f9:ca1c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52:b0:311:b0ec:1360
 with SMTP id 98e67ed59e1d1-313b1ff8de6mr923707a91.29.1749600648794; Tue, 10
 Jun 2025 17:10:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 17:10:36 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
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
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-3-seanjc@google.com>
Subject: [PATCH 2/8] KVM: arm64: Include KVM headers to get forward declarations
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Include include/uapi/linux/kvm.h and include/linux/kvm_types.h in ARM's
public arm_arch_timer.h and arm_pmu.h headers to get forward declarations
of things like "struct kvm_vcpu" and "struct kvm_device_attr", which are
referenced but never declared (neither file includes *any* KVM headers).

The missing includes don't currently cause problems because of the order
of includes in parent files, but that order is largely arbitrary and is
subject to change, e.g. a future commit will move the ARM specific headers
to arch/arm64/include/asm and reorder parent includes to maintain
alphabetic ordering.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/kvm/arm_arch_timer.h | 2 ++
 include/kvm/arm_pmu.h        | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index 681cf0c8b9df..22cce6843e9a 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARM_KVM_ARCH_TIMER_H
 #define __ASM_ARM_KVM_ARCH_TIMER_H
 
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
 #include <linux/clocksource.h>
 #include <linux/hrtimer.h>
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 96754b51b411..baf028d19dfc 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARM_KVM_PMU_H
 #define __ASM_ARM_KVM_PMU_H
 
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmuv3.h>
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


