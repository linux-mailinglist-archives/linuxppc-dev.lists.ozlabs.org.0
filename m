Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBFF32EE01
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:10:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWQ05GK7z3f9F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:10:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Xv7V73ke;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xv7V73ke; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWLF2Fwyz3dF4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:07:17 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id p5so1554761plo.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XvUmT8dwL13269YYxdxnzVZ4ABcP2U76detfFQqFeVM=;
 b=Xv7V73kemdoPyDBu2UARrRC4OQvnQHmcJ9j6kh0frRowTctCI420YeTWOUDjOVF99I
 d2bwRxc0i6NUmkpbIRGnwUpItM5PBpzIEDiUOo2EwjMNjJBFmqfMT9eTp/dYFAp4hemm
 a+xo5VIrH5+MPwf2igac4knx9zpQg3aFnf1Jl38NCZdc67ZwtubrJE8wzjfCtbE5j31Y
 TgM4G4jReXN8u5c7diNzhnmoJuiGhj+iuOcr0EiGtD8gE3ZVFqkV93pUsCuDHvGh4n52
 u+KeCf5sSbw8qg6/7c6nlnlOyJhD7BOqj8/qkdmLsebzLrgw8Xil9sG28GyKGwIR4jXE
 2uCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XvUmT8dwL13269YYxdxnzVZ4ABcP2U76detfFQqFeVM=;
 b=FilHDfcHgdQHfLVwPzIHJQG9ln6i/3rO60BKTLzkbrewCWYuHU9iWjb/ra6rAcfscZ
 okYn7rAGeRI+UiJIKGQjIIbQJC/bEzuXI7znggHw9pToQGthnFwwGhrMUuxU/Or8DnJQ
 G0hGupV9NLnILz8Bxb0pYElWqexBTfoRaI7Bp2J4b414jYp0OB5K3IzSGE6KPgbY1vdM
 vCR4J/5W9fP+yp5p6t3QuSococ/TgcebtUIYY46PsFLrC5xD3cVeO9K0jJaK1Kp+BtX6
 8/WY7QAuybWABsy9F6iVJnwL8fx4CHeQ/CUB6l2uYAv1b4YHaXGmPVKcC+zwSC2zfMwL
 gN5A==
X-Gm-Message-State: AOAM531ac/o34aAOho/hYyOqzrIGUOWfj/KUUTf0PcwZfalpLXiDg9fc
 udXJe05Xzfkl54IxTkqT3fs=
X-Google-Smtp-Source: ABdhPJztJBg5vturchwCfFqMhtteseIp6OdJYmM0grAxUt44rQ+GdwjjgZ6ZR6MUqRp5UCmoDlCAqw==
X-Received: by 2002:a17:90a:20c:: with SMTP id
 c12mr10626988pjc.224.1614956834977; 
 Fri, 05 Mar 2021 07:07:14 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:07:14 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 08/41] KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in
 guest MSR
Date: Sat,  6 Mar 2021 01:06:05 +1000
Message-Id: <20210305150638.2675513-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than add the ME bit to the MSR when the guest is entered, make
it clear that the hypervisor does not allow the guest to clear the bit.

The ME addition is kept in the code for now, but a future patch will
warn if it's not present.

Reviewed-by: Daniel Axtens <dja@axtens.net>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_builtin.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 158d309b42a3..5e199fd6769a 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -662,6 +662,12 @@ static void kvmppc_end_cede(struct kvm_vcpu *vcpu)
 
 void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr)
 {
+	/*
+	 * Guest must always run with machine check interrupt
+	 * enabled.
+	 */
+	msr |= MSR_ME;
+
 	/*
 	 * Check for illegal transactional state bit combination
 	 * and if we find it, force the TS field to a safe state.
-- 
2.23.0

