Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC54093DBBB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:05:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KHkzMhsC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4dc6HG7z3fr0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:05:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KHkzMhsC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=36takzgykdcqseanjcgoogle.comlinuxppc-devlists.ozlabs.org@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4MH3zsVz3dV6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:15 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc52d3c76eso12295855ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037994; x=1722642794; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YtgPpIjPSqL3TzmlwlpLZvvahtPd8ef2dtbW1LnZzVw=;
        b=KHkzMhsCzwfrxtRYu5ry36yX029UupdaBchTcwyvIQ+6jspXEk97xUAbUuiAuZ1dfP
         IKTt7hnNShGJzuXYGkgM3MGM+2WKX4ZOUvbKKIV2nK8nG/fZ3RqAUIEwT533w62JiArF
         IEv0lKEZCI1fX9m9iNMbUGjG46Hfkr3RoYlVvxvfggZRMc3LqHyVCeMpFdhc39hKM8PM
         vMYWALXeMXEgm+71jI3HLW5Bx3oeUQcNq5A4pegQ6W8DNF9qqMS0P0pBNZXiCBV94mkV
         XAXy69ytRMPB4Ey/w+OlQ6R7lQwRlJGKmkymk/3vl/V662hILpkm+0Q74lhwniRUnPsS
         OeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037994; x=1722642794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtgPpIjPSqL3TzmlwlpLZvvahtPd8ef2dtbW1LnZzVw=;
        b=vVicHWElY1cWnilOIvV4CxT3+N1NW1gffliwXsSv0yk54HHyMH8sgmktV6OC+geGHa
         /OUDNIChMhe/tdIuu/BGmEd+BvKV3waU3o15AAIizzDydvsuaijP5ymovwtmgalggPj/
         wmeupcGfcup+PE8NeQ+vaCwUYpTdKMAhl9e8NcIrUXm8snqcrfM0X1aZTDPRCfMrJ3Sc
         Yd7Iv6Bi2mm63UQ93eK8GQ5KDFQVj8mWX6cBPmfXYS92/6gO+KplDxHCRO5nhCRtmaFP
         pDIs1K1Naxjs3GZoggi+7BtF5Xy1apOs//mhE0fKMYNlfhgQu0kSst4D2jyMoQZjXX2h
         QsIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCj3TG4RimT5ma0XpojtGcz7vd1tPxgMJfPSaDbf5PW8+XMn7fQvm48BpO85mEy+pmJR6HNydcl0890ZH64TRAvssDd7RXkHT3lHUgTw==
X-Gm-Message-State: AOJu0YxcQrEAioc7qMjbBKa57OwV2/8uzLr/lULXxyiGZ03Jw3GgA2sl
	KUjMrPnbI1LzAXEjoPABCCRDXNVwDcGnZ+NjyPOTmtwWJWXuxpH9F2nvum/yfsYhf4kQp++uFCM
	Xjw==
X-Google-Smtp-Source: AGHT+IHmoajaYWuB/CstqlwF+EMvaWyxqBn3H/lV1e3JQu2uS0IU9winjnCx9o/cN/zsyEDP3UE3pPbYXjw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e744:b0:1fe:d72d:13bc with SMTP id
 d9443c01a7336-1ff04822069mr906395ad.5.1722037993928; Fri, 26 Jul 2024
 16:53:13 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:27 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-19-seanjc@google.com>
Subject: [PATCH v12 18/84] KVM: Remove pointless sanity check on @map param to kvm_vcpu_(un)map()
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

Drop kvm_vcpu_{,un}map()'s useless checks on @map being non-NULL.  The map
is 100% kernel controlled, any caller that passes a NULL pointer is broken
and needs to be fixed, i.e. a crash due to a NULL pointer dereference is
desirable (though obviously not as desirable as not having a bug in the
first place).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 56c2d11761e0..21ff0f4fa02c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3092,9 +3092,6 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 	void *hva = NULL;
 	struct page *page = KVM_UNMAPPED_PAGE;
 
-	if (!map)
-		return -EINVAL;
-
 	pfn = gfn_to_pfn(vcpu->kvm, gfn);
 	if (is_error_noslot_pfn(pfn))
 		return -EINVAL;
@@ -3122,9 +3119,6 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_map);
 
 void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 {
-	if (!map)
-		return;
-
 	if (!map->hva)
 		return;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

