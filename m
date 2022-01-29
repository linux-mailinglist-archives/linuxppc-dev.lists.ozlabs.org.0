Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA704A2C78
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 08:27:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jm5W14TB6z3bSk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 18:27:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PfLG/Hx7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PfLG/Hx7; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jm5T04Zwjz2xDD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 18:25:24 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id r59so8646317pjg.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 23:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=maaBtp9rN8wYryMs18OoJVk6D+EX7D5VRAAjNiu1Ku0=;
 b=PfLG/Hx7kose59zE1d7qfi69eXP4rA3OFqoZmDVIEgNLifw1qa/ETTN2r8MmRiObPX
 2xJ2zrlQzNtauYCHCJiAuQz6Zbtm3AtSbfEQeDaeWwT57lUoyWkE2rXSSDXm8zE9jqJC
 silk4pJC+8jz/FTInP6w27J63kkWFOu/XTEbAZxe3q0EfItukwuess9mC5rsGs5Gaxai
 j4YaITH0sdn3n1smqhv6N6uv4BCTva/a2kHHRW+jryWBF6j9SMzDn3hywePnRxZxIKlI
 ddde/AfIJ1oh2sm+DGt+aM9UpFSBHyc18PCYHJERNz+SbknY4ag8Dr91iMfiZZY0ZCtn
 gn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=maaBtp9rN8wYryMs18OoJVk6D+EX7D5VRAAjNiu1Ku0=;
 b=vDaRaoCgvUKs6NwN0A8q5szTi0sqt+rAWRw+IIW7TnKPaCLWTGqy9pUF1nTi7tMkWU
 qVsBS5SXC9d3eMJA2hc9M5c8P2ruqlZ91vpybFYw/RYMNy7qAAWl0mHCODHFnxFpIxem
 WpQMBOaEyk2rj4Ha9xZWDOHKgnZO24FKW71ff6qIhn4Nr1UDhUc3i+GAQu6JKGhFRcak
 We7sGbgdV2NImh/gZrIz9CBSQ+7UYpfjaau2JL/74taNiMrNAfjbuNmYLB+7eNKLfZcR
 lZGO5IRpa4XGRs39NxAS3Ny6mA69HbbOuxQfZkdxYBJSvCGWjqeudPtvKXaMeFs0CGJ+
 8pmA==
X-Gm-Message-State: AOAM532eJ4L68T4QcHxFLdBQfcie/yqmusNi2qw12av8E8eOnaxcrcmA
 il+58yUpX/XUi6D3CM0+XPDFGwumYJ3WyA==
X-Google-Smtp-Source: ABdhPJw7g9BylPk3/75UFf0xH3up7hpMpZ2SCq42Se224u1+eQJnfSdqHQrRMGtRuIktInayXVkGTA==
X-Received: by 2002:a17:902:8d81:: with SMTP id
 v1mr11983194plo.20.1643441122440; 
 Fri, 28 Jan 2022 23:25:22 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.111.178.100])
 by smtp.gmail.com with ESMTPSA id 12sm3917449pgb.71.2022.01.28.23.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 23:25:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] KVM: PPC: Book3S PR: Disallow AIL != 0
Date: Sat, 29 Jan 2022 17:25:11 +1000
Message-Id: <20220129072511.105523-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220129072511.105523-1-npiggin@gmail.com>
References: <20220129072511.105523-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM PR does not implement address translation modes on interrupt, so it
must not allow H_SET_MODE to succeed. The behaviour change caused by
this mode is architected and not advisory (interrupts *must* behave
differently).

QEMU does not deal with differences in AIL support in the host. The
solution to that is a spapr capability and corresponding KVM CAP, but
this patch does not break things more than before (the host behaviour
already differs, this change just disallows some modes that are not
implemented properly).

By happy coincidence, this allows PR Linux guests that are using the SCV
facility to boot and run, because Linux disables the use of SCV if AIL
can not be set to 3. This does not fix the underlying problem of missing
SCV support (an OS could implement real-mode SCV vectors and try to
enable the facility). The true fix for that is for KVM PR to emulate scv
interrupts from the facility unavailable interrupt.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_pr_papr.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_pr_papr.c b/arch/powerpc/kvm/book3s_pr_papr.c
index 1f10e7dfcdd0..dc4f51ac84bc 100644
--- a/arch/powerpc/kvm/book3s_pr_papr.c
+++ b/arch/powerpc/kvm/book3s_pr_papr.c
@@ -281,6 +281,22 @@ static int kvmppc_h_pr_logical_ci_store(struct kvm_vcpu *vcpu)
 	return EMULATE_DONE;
 }
 
+static int kvmppc_h_pr_set_mode(struct kvm_vcpu *vcpu)
+{
+	unsigned long mflags = kvmppc_get_gpr(vcpu, 4);
+	unsigned long resource = kvmppc_get_gpr(vcpu, 5);
+
+	if (resource == H_SET_MODE_RESOURCE_ADDR_TRANS_MODE) {
+		/* KVM PR does not provide AIL!=0 to guests */
+		if (mflags == 0)
+			kvmppc_set_gpr(vcpu, 3, H_SUCCESS);
+		else
+			kvmppc_set_gpr(vcpu, 3, H_UNSUPPORTED_FLAG_START - 63);
+		return EMULATE_DONE;
+	}
+	return EMULATE_FAIL;
+}
+
 #ifdef CONFIG_SPAPR_TCE_IOMMU
 static int kvmppc_h_pr_put_tce(struct kvm_vcpu *vcpu)
 {
@@ -384,6 +400,8 @@ int kvmppc_h_pr(struct kvm_vcpu *vcpu, unsigned long cmd)
 		return kvmppc_h_pr_logical_ci_load(vcpu);
 	case H_LOGICAL_CI_STORE:
 		return kvmppc_h_pr_logical_ci_store(vcpu);
+	case H_SET_MODE:
+		return kvmppc_h_pr_set_mode(vcpu);
 	case H_XIRR:
 	case H_CPPR:
 	case H_EOI:
@@ -421,6 +439,7 @@ int kvmppc_hcall_impl_pr(unsigned long cmd)
 	case H_CEDE:
 	case H_LOGICAL_CI_LOAD:
 	case H_LOGICAL_CI_STORE:
+	case H_SET_MODE:
 #ifdef CONFIG_KVM_XICS
 	case H_XIRR:
 	case H_CPPR:
@@ -447,6 +466,7 @@ static unsigned int default_hcall_list[] = {
 	H_BULK_REMOVE,
 	H_PUT_TCE,
 	H_CEDE,
+	H_SET_MODE,
 #ifdef CONFIG_KVM_XICS
 	H_XIRR,
 	H_CPPR,
-- 
2.23.0

