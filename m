Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13393DC0F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:13:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MF444GiB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4q73826z3cBb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:13:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MF444GiB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3azekzgykdd4xjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Mn4vSWz3dKS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:41 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e03b3f48c65so446178276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038020; x=1722642820; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ABkrzr1cGSxzpfOXTkcnfxpngM7W7Byv3yxUL9/Xpog=;
        b=MF444GiBkt/i89MEVTo6G4yCW24CUGHt749nH3IbL8XF9c02iXzxRt/9+et/5nWpIY
         hT1h8bDLIm2yh9P+foTfDj/qG8E/frVd0XUhzhYuFNzYRB46V4JmO2qb44BJL53cbdiG
         iUJPMHGhwynjNv5/vBg7IiFuOA3ElXv6vN3cUAOviO6I8Io7qxxUXeFOiFzBScNtO3/F
         uLcXU/K1H6oMPhvUGVNc5mjCOXz5KiLnKABdfAzISrtU6vnG8Jrivb9pceiHJmZ5GUXJ
         p2a6EUGkN/6m5jbDVErphfSPD6lfUpDAbFSdrIF/V8zWsNlZHpsFJLNhppUr84HUOSWz
         AHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038020; x=1722642820;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABkrzr1cGSxzpfOXTkcnfxpngM7W7Byv3yxUL9/Xpog=;
        b=cSl4yehyKtHHV8+HmNLbhfp6r4dq+ZGNaCs8oETTgdE2CdGav8M/ileX+yuR2LTpOV
         +hc4f8JsNq64SWhnWFwZd37drUuWqph6jacvqhecxO4YfsZc/q7zCYWX/yg1gF3zn9/f
         +1VYvv8YQRDO0qJ711ujvHqExMIT9C4t1Lj0gu6GxAoRdquTLXEmrI86ObC1C6zq69aP
         Es3B+ieIMKw5vB7ez3RK/pHnf0g+yJ+593Up7uU0N2eBvWXFb3HAXn3sbSaQhbBJroax
         QYXSzHD4s+Kd0TIDR3Q0DvTiNd/c3KkIRSwW26AbuLI8HVL51zoBBlRvVre25k8TIhJ/
         Oy9A==
X-Forwarded-Encrypted: i=1; AJvYcCXAe3wE0TfsrrvB1k0Qa/R02+yihZUDa5ltlEbbp7SywNHTjkzMYjfnRHiNea8yYQLF2vza1ORv4xN19dHW+yvuKOYxE2wzXQLPMluGiA==
X-Gm-Message-State: AOJu0YzBFXDLbvrFkbuiYtS2mdS67xalCrnivSNb3dmAjrngAZ0Pv4JK
	cfJq6AJ/9QiINZYNGvLzvdTF3hJVQVlvTnshUkLpXoogcLz1lgpHDVXR3QX5vNPW3NipDRWTqcg
	VjA==
X-Google-Smtp-Source: AGHT+IF9e10ucuu5PEDYEm2t1VHH57SvniduNcr3PDVCEbnd2uQ/527xnsEGixiu/Fx7KhH32OKutuDbjT0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:9004:0:b0:e03:b9df:aa13 with SMTP id
 3f1490d57ef6-e0b5455eafcmr36206276.8.1722038019655; Fri, 26 Jul 2024 16:53:39
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:39 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-31-seanjc@google.com>
Subject: [PATCH v12 30/84] KVM: nVMX: Mark vmcs12's APIC access page dirty
 when unmapping
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

Mark the APIC access page as dirty when unmapping it from KVM.  The fact
that the page _shouldn't_ be written doesn't guarantee the page _won't_ be
written.  And while the contents are likely irrelevant, the values _are_
visible to the guest, i.e. dropping writes would be visible to the guest
(though obviously highly unlikely to be problematic in practice).

Marking the map dirty will allow specifying the write vs. read-only when
*mapping* the memory, which in turn will allow creating read-only maps.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 8d05d1d9f544..3096f6f5ecdb 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -318,12 +318,7 @@ static void nested_put_vmcs12_pages(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
-	/*
-	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
-	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
-	 * and if it is written, the contents are irrelevant.
-	 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, true);
 	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
 	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
 	vmx->nested.pi_desc = NULL;
-- 
2.46.0.rc1.232.g9752f9e123-goog

