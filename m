Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BDF497D0C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 11:26:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jj5jz5X67z3bTg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 21:26:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mRiwMZyd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mRiwMZyd; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jj5gz6kCFz30N0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 21:24:31 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id v74so12274585pfc.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 02:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a22onBB8xY9MCxFKi1knuvCfdysowRIRm8sOH5niTeE=;
 b=mRiwMZydbhVvAUHqvJRZ0X2wo7stpkHqBgrBs9uD+T4vQn9TVZYuPSsTbj3XebXXOY
 2KOGZQ0TZM7c3LKu/Fh7FUWNyVKjmUfsNZfHOWc6o/Ap94dbBy6pxIeUfnSR9/4XZPiL
 PUN628cs1RaS+I6lAirdseGo88dUwzQiwq9TksTz/2CloqVHtdoKDw1wnOKYOm+39/UA
 vYMrWHrHyrd9aorxEHLeeup9xjiJ7hNuUl4E7QfVap0LVjzhCwVWdK66MOAOs/VZEQuo
 gYvxeWwbhwuNH6HLBCgi6q2xtZ7T1errskSU+3qioRURjRbZaxIzSdUDtqhXRv7HzUzA
 382g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a22onBB8xY9MCxFKi1knuvCfdysowRIRm8sOH5niTeE=;
 b=hMeq89PFk73w6FTCFCaVPqFAgskhQxKevXdIKNABq9D9Oa4pOsFp6yDY4WRDib59hX
 cXsEn+iQ/CuTDp4Y7cAEQeag7KQeHFt8gnDsIuUAfWbwDNbvfydHQ8sncUw3dT1IjU77
 BppM7Zsk7pewlG89n6/dh0Z9iNo+E/1MymSX3lSFWFqsBN4ERcJsbFmPlvYzD91EVhha
 YpFQm7SUMqb7lWamwqVnFPr/NrPgpVv4UJGTL1JRBbJOSx91kW2+CHBNx5CT6lo712HR
 yOJm9dp+QkBAKtT8y4m6Ol5XWlCADkeIIjX0HwUW5iUCsm2LXGRibOiqzE/yYm/pPytU
 2xDg==
X-Gm-Message-State: AOAM531yPKujhSm1m4b2kix+2fm74Nx/jL/C/ntjJnGPxriselJmYbEL
 xWgTb7rrdX725kgzg6tj7SVNe7nC1es=
X-Google-Smtp-Source: ABdhPJz+UymtRlDjsyW3KuMJYRhr5WOEKT/DJLfRYtjoDNraFmiLnqe39jsiz0/MvbqtlHceMFtazQ==
X-Received: by 2002:a05:6a00:2186:b0:4c6:50ea:6701 with SMTP id
 h6-20020a056a00218600b004c650ea6701mr13301737pfi.12.1643019870003; 
 Mon, 24 Jan 2022 02:24:30 -0800 (PST)
Received: from bobo.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id z14sm11724081pgr.34.2022.01.24.02.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 02:24:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] KVM: PPC: Book3S PR: Disallow AIL != 0
Date: Mon, 24 Jan 2022 20:24:17 +1000
Message-Id: <20220124102417.3741427-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220124102417.3741427-1-npiggin@gmail.com>
References: <20220124102417.3741427-1-npiggin@gmail.com>
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
must not allow H_SET_MODE to succeed.

This is not compatible with QEMU behaviour. The solution might be to
have a cap-ail for this, but now it's broken either way so fix it in
KVM to start with.

This allows PR Linux guests that are using the SCV facility to boot and
run, because Linux disables the use of SCV if AIL can not be set to 3.
This isn't a real fix because Linux or another OS could implement real
mode SCV vectors and try to enable it. The right solution is for KVM to
emulate scv interrupts from the facility unavailable interrupt.

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

