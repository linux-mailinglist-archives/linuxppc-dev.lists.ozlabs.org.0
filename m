Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97EE6740CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 19:22:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyWFq4hl6z3fGf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 05:22:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lPgJ+psv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3sorjywykdkkbnjwslpxxpun.lxvurwdgyyl-mneurbcb.xiujkb.xap@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=lPgJ+psv;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyWDw1r1Zz3fDW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 05:22:06 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id o16-20020a17090ac71000b00229ba85bc63so1412909pjt.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 10:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b40fwcC6nngRFLft6op27vX6xZWPu1WE1VJnXnClKPs=;
        b=lPgJ+psvO0gs4F1pC7Vb9jyNcokvbED/nE4sfWUC7tB5g/4OxeLVT56AIJY01cJgOa
         EsCnN99LLBE77rh51iBGQNmTyTMhzT9Q9FXaxFpsnDNXG6uBzHfYFnmn0L71YgUiJXoc
         c+zkoS9FEo1pdbW3YSuO1zXz2IfLOGyzmNyxUAAuJ+K5nq5LxCtwyPkA8enNIr2OCPsk
         UryVt6qYaPlTl4yVAGsh+H/ZyE5tYIy6BXXfV0oOTJEdOlMUAx2yMGvvB/wSYcPdSP6L
         StepHpLKdkdeMUQWM3xGseB1/PNRmD7Zv9Ga/E8KfpFdmBQp60J+aUm2uoMumiPLQQdB
         zXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b40fwcC6nngRFLft6op27vX6xZWPu1WE1VJnXnClKPs=;
        b=4VONmqlK3ABjTKNrjx90gcG/0iwj67FvF/v4yA51GdNVfm7xpbrD5S0W9mFauyoEjo
         lok8W5xFic16cuCA0MSXNg97QL7p/0pNkRSNIYy5vC+g90cdmKMVCTlb2fQjKX1ONyLw
         hyotrlmMqYC22Wyt+QktnL1fJ4rhS/M4B+/u1xFGpdXNN2iwvQGNAHokXLfuxwWDNFjU
         khi7rCgwW1DWhD5TJ2UOdPUeB0DSCQL3rDwU0DXas5Z0CUfmR6I7kHeJcqDZGuIZOQEp
         WL1QVV35S45+G5qO0qMqbkOreTN8MjSBn7Q1pn8B8elfIlMbkte7C0abiYdpE7RMVIgA
         HmXA==
X-Gm-Message-State: AFqh2kqSuxAaN2RFnEFBD0CRBgFXfAOwRNwKol8WT39Q8F403j3jh+P2
	fZew8s1jlR80PXa14dVvCss6as96niA=
X-Google-Smtp-Source: AMrXdXv67WP/W+jw1oSkl8gqR+hmC3zu77fxSLGsZHoNLNooy8UzOTuEE+n7IIlf/ADQ9g1YvqSVz1is9Zw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:4e87:0:b0:58d:8d29:399c with SMTP id
 c129-20020a624e87000000b0058d8d29399cmr1071733pfb.44.1674152522508; Thu, 19
 Jan 2023 10:22:02 -0800 (PST)
Date: Thu, 19 Jan 2023 18:21:58 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Message-ID: <20230119182158.4026656-1-seanjc@google.com>
Subject: [PATCH] KVM: PPC: Fix refactoring goof in kvmppc_e500mc_init()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix a build error due to a mixup during a recent refactoring.  The error
was reported during code review, but the fixed up patch didn't make it
into the final commit.

Fixes: 474856bad921 ("KVM: PPC: Move processor compatibility check to module init")
Link: https://lore.kernel.org/all/87cz93snqc.fsf@mpe.ellerman.id.au
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/booke.c  | 2 +-
 arch/powerpc/kvm/e500mc.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 7b4920e9fd26..a647bfc322b8 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -1208,7 +1208,7 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 
 /*
  * On cores with Vector category, KVM is loaded only if CONFIG_ALTIVEC,
- * see kvmppc_core_check_processor_compat().
+ * see kvmppc_e500mc_check_processor_compat().
  */
 #ifdef CONFIG_ALTIVEC
 	case BOOKE_INTERRUPT_ALTIVEC_UNAVAIL:
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index 611532a0dedc..a309138927ff 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -168,7 +168,7 @@ static void kvmppc_core_vcpu_put_e500mc(struct kvm_vcpu *vcpu)
 	kvmppc_booke_vcpu_put(vcpu);
 }
 
-int kvmppc_core_check_processor_compat(void)
+int kvmppc_e500mc_check_processor_compat(void)
 {
 	int r;
 
@@ -390,7 +390,7 @@ static int __init kvmppc_e500mc_init(void)
 
 	r = kvmppc_e500mc_check_processor_compat();
 	if (r)
-		return kvmppc_e500mc;
+		goto err_out;
 
 	r = kvmppc_booke_init();
 	if (r)

base-commit: 91dc252b0dbb6879e4067f614df1e397fec532a1
-- 
2.39.0.246.g2a6d74b583-goog

