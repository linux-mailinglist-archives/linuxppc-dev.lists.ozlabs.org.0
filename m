Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D634548A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:05:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Cpc1Z9vz3cCX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:05:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iSK4Rha4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iSK4Rha4; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4CmM2Bjfz30BH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:03:31 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id x26so12511578pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96lVEMoY9hmNRY65UX3KaQpv8EehCYA8LF4BBDNeARg=;
 b=iSK4Rha4ojQO3w1SlTqJyLAZThuuX0MD2SeDxkMMa5SyRmgHPv3iBkYCzlfYbiXHap
 4W6LWw3i/tEZ80AXYb8vhj+z4OIw/2cHoNhgnvREZ6nI3HyYkmdU0+YN9LvnGRrXDZTc
 FxIEzDV3Q/504Hmz2gSgDVsxWLtCn9a2wW0Czckaa2Oi/pZRHkoimiOfAOzWBqEKM+lL
 9M/HrVUbOMfjB3YR5toJT7fDMxSMAUyWYS33gp+alUPVPNmCYnkh+ow4UGd/Dm+Vyl14
 feNPyZSeEB4EDqaUvi5/R/YF8Y25mCX3tArhFDkSGaLmabnUiaoUZAY7+NcGPrXyt1+s
 vMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96lVEMoY9hmNRY65UX3KaQpv8EehCYA8LF4BBDNeARg=;
 b=n7PEGJjghZCW6dq4vc1l7GHB4YAneu6HuE4I5SLfiXb7evy8+XyCOvlS1qg23dngSX
 TeU10nG/qMoEg9vaX4t7kEJuV8MF8rBGk7ENrp6bfPQxoLUqtanXxXhR8nYqvi4eRX6v
 FWUb7JyxX2yRRlvqsma/jYks9pWggYcU7UhGNX8LABbK5uavSw8SV/Ze0bC61gt2TtNR
 skM4GaSINZSnpzwZyOo3sbf3iEIUpTVqmT05bf9KtJ2sV2go0X+hJRL9l44MQc0DVr7l
 2WGrBdFv6PpU38OBT2TmmMcZX+vM2a7AbiutN3HgJ9WItL/W/e6ck+TcV2dnAgtyhmxV
 9arg==
X-Gm-Message-State: AOAM533voXqTCFUAHI36R4+HPY66ETXubyFJEf63XlVfIqnkLVYkGZfS
 swYNzkW9nx/BA1UHagSfTfc=
X-Google-Smtp-Source: ABdhPJwHaxaBbEuGdovpRjVbFcwmJA1YSF54aKN3EmfRzan+E5ppcHdiDa0PBOZV7uXBrp6yGDN3Rw==
X-Received: by 2002:a65:6a44:: with SMTP id o4mr1802492pgu.312.1616461409541; 
 Mon, 22 Mar 2021 18:03:29 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:03:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 04/46] KVM: PPC: Book3S HV: Prevent radix guests from
 setting LPCR[TC]
Date: Tue, 23 Mar 2021 11:02:23 +1000
Message-Id: <20210323010305.1045293-5-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This bit only applies to hash partitions.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c        | 6 ++++++
 arch/powerpc/kvm/book3s_hv_nested.c | 3 +--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c5de7e3f22b6..1ffb0902e779 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1645,6 +1645,12 @@ static int kvm_arch_vcpu_ioctl_set_sregs_hv(struct kvm_vcpu *vcpu,
  */
 unsigned long kvmppc_filter_lpcr_hv(struct kvmppc_vcore *vc, unsigned long lpcr)
 {
+	struct kvm *kvm = vc->kvm;
+
+	/* LPCR_TC only applies to HPT guests */
+	if (kvm_is_radix(kvm))
+		lpcr &= ~LPCR_TC;
+
 	/* On POWER8 and above, userspace can modify AIL */
 	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
 		lpcr &= ~LPCR_AIL;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index f7b441b3eb17..851e3f527eb2 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -140,8 +140,7 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 	/*
 	 * Don't let L1 change LPCR bits for the L2 except these:
 	 */
-	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
-		LPCR_LPES | LPCR_MER;
+	mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_LPES | LPCR_MER;
 	hr->lpcr = kvmppc_filter_lpcr_hv(vc,
 			(vc->lpcr & ~mask) | (hr->lpcr & mask));
 
-- 
2.23.0

