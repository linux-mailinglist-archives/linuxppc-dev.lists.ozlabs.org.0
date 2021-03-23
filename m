Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 203513454BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:13:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4D0C0sQMz30B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:13:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qOZDoJN3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qOZDoJN3; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4CnV3vN5z300Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:04:30 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id ha17so9349722pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R+RBK5Wp2FbOLAF9RxuzFwJgi7lrOETPRx1F7UbJZI8=;
 b=qOZDoJN30FiMNb2d0dJip1qgpjEGvQ8z7IjDdwguu/vGI1BcfXfCsslGUnkpH6w9bs
 4vWgczq1+f/Z29exaAO0KdZPtSy0XekeGlMSaooObecU0GFWNKsHJ8l7PwH5TB8sC5vb
 OQ6o8ABQ5+/buGOhX9h+T0IW1zkeUp84tivZBxEICMZa1hVRcLSKb6q071LvO1J5Z+0Q
 Z+wuSzhZGLIcgmd37hzjPBo9bPNPp4QmP2163U/pL8K9qFPJ0p+W46VsnqCGxgUAI1Hw
 /HlwxY/lqjOpXjmdPK889leTaX7xnPpEdCg6jgCCan/vkqjIFb+uUriG0KOHaUH0NIMN
 StZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R+RBK5Wp2FbOLAF9RxuzFwJgi7lrOETPRx1F7UbJZI8=;
 b=hVFwCttN5sFdGYRv4FN0FQsQeAyL3G1AJPTIaQtHv8iC2oFWWNA86t/WsMp0GHwBQ6
 Q9DGkZxAuhQ3lf9wH9A2mqtPHlKnXJ+BmCkuRsH6biz59GuRdB8IedlmECKTG1DZGsnO
 hi/wmS5Mt6ZylFG7hJDhHxRr8gl+Dis9DxTdVc+EOZ6ih6Li9ctcKNjISYB17W7N/u4N
 JXmWEJ9di1qRXhE6XBfIz8TP332Bc7J7yOnwEHWgVCmjNuZ9jcCmhpB+VS520+5l3Zpe
 MseHDo0WELeQCzAsz5wwokhGWkA3U3MV4Vtblm4Wnwiz8J5nDRoGgJTjHg+bPPiZx7jh
 KZqA==
X-Gm-Message-State: AOAM532OUAI5JFluohZnFwNA453D3WuUmibrtA5ksbbew6FhYFly99uC
 X+nqz0wDjI7VZ6F8uumHVh4PR1flgFM=
X-Google-Smtp-Source: ABdhPJzQ7LzQaiOb4v6RfX3ok6MJKTVncrPs9yIekTG23t9fpsEwvB2iQiTk5fxImVlPO9mr/A6vUQ==
X-Received: by 2002:a17:90a:a513:: with SMTP id
 a19mr1880824pjq.210.1616461468167; 
 Mon, 22 Mar 2021 18:04:28 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:04:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 23/46] KVM: PPC: Book3S HV P9: Move setting HDEC after
 switching to guest LPCR
Date: Tue, 23 Mar 2021 11:02:42 +1000
Message-Id: <20210323010305.1045293-24-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LPCR[HDICE]=0 suppresses hypervisor decrementer exceptions on some
processors, so it must be enabled before HDEC is set.

Rather than set it in the host LPCR then setting HDEC, move the HDEC
update to after the guest MMU context (including LPCR) is loaded.
There shouldn't be much concern with delaying HDEC by some 10s or 100s
of nanoseconds by setting it a bit later.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 17739aaee3d8..8215430e6d5e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3540,20 +3540,9 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		host_dawrx1 = mfspr(SPRN_DAWRX1);
 	}
 
-	/*
-	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] = 0,
-	 * so set HDICE before writing HDEC.
-	 */
-	mtspr(SPRN_LPCR, kvm->arch.host_lpcr | LPCR_HDICE);
-	isync();
-
 	hdec = time_limit - mftb();
-	if (hdec < 0) {
-		mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
-		isync();
+	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
-	}
-	mtspr(SPRN_HDEC, hdec);
 
 	if (vc->tb_offset) {
 		u64 new_tb = mftb() + vc->tb_offset;
@@ -3599,6 +3588,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
 
+	/*
+	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
+	 * so set guest LPCR (with HDICE) before writing HDEC.
+	 */
+	mtspr(SPRN_HDEC, hdec);
+
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
 	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
 
-- 
2.23.0

