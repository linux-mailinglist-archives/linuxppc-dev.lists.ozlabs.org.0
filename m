Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EA94BD6CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 08:25:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2DNv61Gwz3bcy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 18:25:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lBp2csNW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lBp2csNW; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2DLv1PYBz30Dy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 18:24:06 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d187so8011371pfa.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 23:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Yszb1VhW5vQuqMzk14SvDtmn04SSl+6GxkgNXsOtcc=;
 b=lBp2csNWBwQp+LwcI1KFhunjR++NdypdhfkhLK9SCNftY7BjkL3xAjkDvzUaSD+C6G
 1pSOwaJ3N0z3ok8Cbz/ho0GQvc8vq46gVLW4e7mk9nhDR3h1HKCezkqkZnLZ0N9JRZ37
 ZRNB8YYge7GfwZchACPADGTiTw2pqH9AB+Q9oTk4kbXObKm1yhpAs8gx5q7qwNWdgh/8
 DywiGMLWwPzxlkzJ41fkTzaoSS1gRs50q9TsShIjup3GMNCYCoTXBvwthVFzpvjXWg19
 U91CiYjImMSwZASAQCrYkdqfXDA+6TlN5vCu1hG/utGXXHwIyFWtrzv2Y2FSlGJ9qwZE
 HabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Yszb1VhW5vQuqMzk14SvDtmn04SSl+6GxkgNXsOtcc=;
 b=flxVNmZC3GOthPqn52juUyTCRMGp80raeUEM59XMNgpcyvoDo3Ge4tAoXfUbVA70/j
 2XI7P/t9uGYCKO2fMvJLFXHOEe/o0ieL7Kp0qwzglOJIyGnOyfUb1dVQd43UWfFxeF0B
 PNjtAxiWitGTanBMTGGXb4ngKBJW3gHH4tQePe4mcpolafHmvlMEgJFRrRrKoSRMeRSW
 Pkly4gcHdmy21/Qhsy5nkh88QGucDV8fBrJ4OjD1sSiqlZvHb4p5476hefXK4MNlcla2
 u95yyJ2V0Lly1UkLLM6ov3y2dgK1ek/sFZAK7qiyFzF41pGu9tTkvds2qIjiIXRwwh0/
 Mu8A==
X-Gm-Message-State: AOAM530UOV7+QEZGKMZ3VDm/0VofAS/IWjVgz/gZAGQiCgkvowmQ/WNG
 Zjj5YlrdAizyJah10w95rgd2gNo7zuY=
X-Google-Smtp-Source: ABdhPJxdWqgZLnLQs3z7eXXo+e1vNtUk0MLGyHxvIccBxFm7kObUO+nl0/CDosjtl0WEyoxsWjDYIA==
X-Received: by 2002:a62:586:0:b0:4e1:dc81:8543 with SMTP id
 128-20020a620586000000b004e1dc818543mr16146455pff.0.1645428245207; 
 Sun, 20 Feb 2022 23:24:05 -0800 (PST)
Received: from bobo.ibm.com (193-116-225-41.tpgi.com.au. [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id me14sm6825901pjb.41.2022.02.20.23.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 23:24:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/3] KVM: PPC: Book3S PR: Disallow AIL != 0
Date: Mon, 21 Feb 2022 17:23:52 +1000
Message-Id: <20220221072353.2219034-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220221072353.2219034-1-npiggin@gmail.com>
References: <20220221072353.2219034-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
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

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
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

