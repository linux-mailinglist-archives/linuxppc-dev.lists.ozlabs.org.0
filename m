Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0B935B85B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 03:54:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJWyC2FdHz3dqV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 11:54:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=vGp7Me7o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vGp7Me7o; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJWrB4Yhhz30HW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 11:49:30 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id l76so8173375pga.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 18:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SrGG57sCJsQ8pkpP+3mT7sg63D+3Ca06l9D6kjJ6tqw=;
 b=vGp7Me7om9cdFzBdOGxgR7OLxv7BopSYT5hdQT1LGRCoYIbbqpNA3VGdLIt7Dw0FkC
 DJWxCWLmNqzExkIFKOqQDGgYk6CVirQ3fR/a1+UGoek7boS9IRiCtCxITLnQ/ULkzNsb
 /J8vNc3Fvw/5p1cpzhO/wh0zxBoUvPnEafKakczeIQaPprv3zb0ZcpqygIviQ7XDBJtO
 yaLzRoo5tzNnbrQytROss9GyS+tE4i387QxKgFaIrIFRgO6C/E6VBmhRfPdvi8O7Sdqv
 X0+qbLHRWug9oEs1/3hnf8Cz//0AKUysW1vqpiVaOBf0DYlnxRk7gVS/OpDodrexIsUf
 d6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SrGG57sCJsQ8pkpP+3mT7sg63D+3Ca06l9D6kjJ6tqw=;
 b=NZKYsr5YZm0gIIOIVGKNiaUk87zj6gyQlIp/lxsKcDNkH2iuy1OWF5Gk4RwPQNsjp6
 avNPN5zu1s6uVgv6OH6eD56EKoKR7sMTNbRVcBz+or1Os2oFLo1NRvo5vBnCAUBkpuBI
 UTF7rwSuoQEgoQJSnw4PXf1l1z6Tb2e7iZdNxfLxrU/zAq0Cs6U8dhzPtGFti2iUi/sy
 AqOcPqV2fKWPPFWIAC57q7bbDmgEhl0/PlllK+nDNn7hAk/VSbqjuP/wyJUGebwJEe6X
 wkCzjNHatcjqGZeeR9hBbMkLO5krMS/ttP4ea7DlejXPGOSdQ8Q0UDLdYO1UpPvZZzBa
 O/FQ==
X-Gm-Message-State: AOAM533OphgK1QIEyOenM5DPZyWusXozb2+V8pyfZxCZbsqjWiZmUAWs
 wrznpAdTCVpltz6BnwU1UiU=
X-Google-Smtp-Source: ABdhPJw3ZMdGiv+pO6hLANfM5DZrtutZPxb6wmVxQnFeXntYKqtXZQN53v9QtdoFZphST5/uIwMcIw==
X-Received: by 2002:a63:1a50:: with SMTP id a16mr25388216pgm.92.1618192168509; 
 Sun, 11 Apr 2021 18:49:28 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id m9sm9502345pgt.65.2021.04.11.18.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 18:49:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 12/12] KVM: PPC: Book3S HV: Ensure MSR[HV] is always clear
 in guest MSR
Date: Mon, 12 Apr 2021 11:48:45 +1000
Message-Id: <20210412014845.1517916-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210412014845.1517916-1-npiggin@gmail.com>
References: <20210412014845.1517916-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than clear the HV bit from the MSR at guest entry, make it clear
that the hypervisor does not allow the guest to set the bit.

The HV clear is kept in guest entry for now, but a future patch will
warn if it is set.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_builtin.c | 4 ++--
 arch/powerpc/kvm/book3s_hv_nested.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 41cb03d0bde4..7a0e33a9c980 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -662,8 +662,8 @@ static void kvmppc_end_cede(struct kvm_vcpu *vcpu)
 
 void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr)
 {
-	/* Guest must always run with ME enabled. */
-	msr = msr | MSR_ME;
+	/* Guest must always run with ME enabled, HV disabled. */
+	msr = (msr | MSR_ME) & ~MSR_HV;
 
 	/*
 	 * Check for illegal transactional state bit combination
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index fb03085c902b..60724f674421 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -344,8 +344,8 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	vcpu->arch.nested_vcpu_id = l2_hv.vcpu_token;
 	vcpu->arch.regs = l2_regs;
 
-	/* Guest must always run with ME enabled. */
-	vcpu->arch.shregs.msr = vcpu->arch.regs.msr | MSR_ME;
+	/* Guest must always run with ME enabled, HV disabled. */
+	vcpu->arch.shregs.msr = (vcpu->arch.regs.msr | MSR_ME) & ~MSR_HV;
 
 	sanitise_hv_regs(vcpu, &l2_hv);
 	restore_hv_regs(vcpu, &l2_hv);
-- 
2.23.0

