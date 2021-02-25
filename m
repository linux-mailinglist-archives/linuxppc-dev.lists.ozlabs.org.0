Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661123250F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:55:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZ7K2hDKz3ffM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:55:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=otc6vdNM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=otc6vdNM; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYyj36b2z3ckB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:48:13 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id o6so3553572pjf.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5gBupD6w9IAV3hK4OXn3cqVs1/uQmmRToC//irklCQ4=;
 b=otc6vdNMX1R7wpi+EcZ6Sx/eMagFElg1z8C/hMvENJbfsoJiLAhL5xwPj8SfUnDy+W
 aY1OVgUMSruJ8aIiwH1p0tsLDQQrwXxFjbYjHWkWd+fjJxnSKkoNSZjqx/HjCAP2D35X
 ZjEKcid0iFjqrvMztOaDevAI2MgEJRv3m+WOn9j0x8sEj6n+uT+PZRN7BeiP6FDUQKbo
 EsdcsF/UTVK4qvvy5c9jNADiI6+zBA5wx2TM1h3YATs+IyB1i+tc+F1ScFXkdIMzsOvc
 JvbLWs3rJESGSXoCiHzOH40ijL+qUZ25IPJFtwkw4tt61odrQzzqMa32Fpnh8bJbURSy
 oyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5gBupD6w9IAV3hK4OXn3cqVs1/uQmmRToC//irklCQ4=;
 b=UCTAy6ll1CYm7XNt4SA0UraySVT3uQ4zS40D0HQ+Zz7dC0K2jDiZAchf6x1wSpph/r
 LTrnyJ0MUFytyly5iuIDOHG9wvI/D7C7fl3vPzZar1/frjULneiEGQIKNUy/71Qdr3tS
 0mr0C4yhwdzIqGBtCAXLuoYpGtQbyPLBTKjI1FMPBnSTqkcTyRFf+jov6kWda1vT6Ow4
 Q+3TxNL/mj+ix8iYy/9ITdVkvkf39b9clYbCDAh2BOUkh4SyCFfSpVuE3Y7As4eJ8c/J
 8zVmB1+N3DhVCn3QsR5ambqRfiBSjHwFQJ4EAxmjD0ml6AjyAQjZ1fik9Hz8r2vXSmJv
 ywcw==
X-Gm-Message-State: AOAM533opLVOcsAeD3ibzEgZTeyknzKJaXHUY28Q+q5C7OBRiYm/ri2k
 Pm9zPfCobJBfmYm597o7qC4=
X-Google-Smtp-Source: ABdhPJw55Z0GXGwEI7LASJoBShS68vWHDeVV6WM1gcGrjR0KrZyT0feHuIU12BgvwOse21jbUSEqfw==
X-Received: by 2002:a17:902:ced2:b029:e2:8db8:266f with SMTP id
 d18-20020a170902ced2b02900e28db8266fmr3008957plg.34.1614260891850; 
 Thu, 25 Feb 2021 05:48:11 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:48:11 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 20/37] KVM: PPC: Book3S HV P9: Reduce mftb per guest
 entry/exit
Date: Thu, 25 Feb 2021 23:46:35 +1000
Message-Id: <20210225134652.2127648-21-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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

mftb is serialising (dispatch next-to-complete) so it is heavy weight
for a mfspr. Avoid reading it multiple times in the entry or exit paths.
A small number of cycles delay to timers is tolerable.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 735ec40ece86..d98958b78830 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3689,7 +3689,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (!(vcpu->arch.ctrl & 1))
 		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
 
-	mtspr(SPRN_DEC, vcpu->arch.dec_expires - mftb());
+	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -3822,7 +3822,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - mftb());
+	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - tb);
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
 	kvmhv_load_host_pmu();
-- 
2.23.0

