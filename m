Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D74BF239
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 07:49:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2qXQ4svdz3cjd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 17:49:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nTfxQGLi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nTfxQGLi; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2qVR6Sypz3bPJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 17:47:43 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id z15so5260258pfe.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 22:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Yszb1VhW5vQuqMzk14SvDtmn04SSl+6GxkgNXsOtcc=;
 b=nTfxQGLi3zvpnCIzarK1KAHcr9OUbs6g4uz1ass4kLBNrNGLi6/vww8xDMkk7DhTWB
 YBMB5DKiT2n8CnwPJeqai5zUQTyH3WVIVVAUQ7BLSEMcf34G+Ek9LALCV5/ns+sFxIJ+
 8ZCGg+Zjd1OnwFBXJchPDB8GfjKVbzHHIf84DA3t9gX2BzzhugTuEiAAQir92Q+Pd0L3
 uhizVe0se+EP5skquxJb2+mdOIi66/uBZQNhYS/QNxFNz48MPZDCrw72cRZr5O0t3Dkn
 157ap6F4aEh2U6MVT3eCgyM3dxRUYLpI12S+dRKOwpwJzScJPEV4WZSQZux3zT73djji
 Pr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Yszb1VhW5vQuqMzk14SvDtmn04SSl+6GxkgNXsOtcc=;
 b=iifZ5ztgmLf+RtRnmTlfn5Yh89jMYwZfLpySAR+HCtk4JUXVNSejfjMBIYffY51AxV
 PPzV81cT7wsnHmRWCs87WsJpZv869rN+52WH2YOuUYcoOSEFmva84mxste7L3tJMNDnq
 13euhGx84pTIoWhX/SeiHf8NGihZmlkI72zEy5eT5y4/FK4N0IFrbyiZ2F4Ezz/NwzZe
 x8TIRgIqp9P4Oss0mBD6apk997YnP71/64YAt0ZeaApP+RwVLJoUKzMuICCzR12YsUfD
 xbYQ6hRRHaBD3aBbbP76MDrCB91OzCddAmER/DV7ekJ28UQc54tWe0H/9tH0J+Ios7wk
 N/nw==
X-Gm-Message-State: AOAM5328jHlZdqk419uCfhRS4For66P9iFAMaivAU/Kees4yWqVU2BO7
 kOnk66QJ5zKJOolW5EpTyuvAB2FYk7M=
X-Google-Smtp-Source: ABdhPJyKnQMMQNrOXDylnjffub+WBwYSjI2bbl4OUZPem1TdOXRxmNhHZnfjesuPU0PiWaDiIQnIXg==
X-Received: by 2002:a05:6a00:14ca:b0:4cf:1930:9d67 with SMTP id
 w10-20020a056a0014ca00b004cf19309d67mr23076612pfu.55.1645512462337; 
 Mon, 21 Feb 2022 22:47:42 -0800 (PST)
Received: from bobo.ibm.com (193-116-225-41.tpgi.com.au. [193.116.225.41])
 by smtp.gmail.com with ESMTPSA id d8sm16346711pfv.84.2022.02.21.22.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 22:47:42 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/3] KVM: PPC: Book3S PR: Disallow AIL != 0
Date: Tue, 22 Feb 2022 16:47:26 +1000
Message-Id: <20220222064727.2314380-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220222064727.2314380-1-npiggin@gmail.com>
References: <20220222064727.2314380-1-npiggin@gmail.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
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

