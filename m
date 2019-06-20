Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B34C51F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 03:53:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TlG62FGczDqC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 11:53:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UkFBpkHn"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tl7H0SlnzDqrs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 11:47:22 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id v9so641559pgr.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 18:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Qzjpioy/P2IPckje2dj/C4MHof6bcToLS3p/Qy08+Dc=;
 b=UkFBpkHnaDzJ4EEr/gPxr3tB5VD3Lt6Sack+HpwPgZWu93UMoqsvLt3ySpWYJ1u+1o
 9zlwxLM4Xo8bksXVPtVDp3gAm1SozhQxFWLe9i8u+VzmeNAaYXq3GqnueIJgh8wR4JVo
 Q759N28xmebe3thpfTU2dey91XPLNRBpXYbc6Rft+ZpV4DhdbEpH1xyct1APfOEtv2M8
 x8h2dli7Wzyp5UTdf6r2VAkvX9UYsn4yxka7OSBhHmGqTBANYM7kMH7XE5key0GiGxSM
 O8QBmiPI4HXHEMLM/qMZJaIy2VC/kYviJQ7VyTtmGb1DrLsrGlIDm4+ku5eJ4uFsPgIa
 pt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Qzjpioy/P2IPckje2dj/C4MHof6bcToLS3p/Qy08+Dc=;
 b=FgTUVwCyPr//krCANQ28suXRYVfAhQWBFsbQvLsvJYqjC5avS/PlH6/Qm2tqIsRq9f
 6xwtBZbESYHlOyQyKteWWT70mJGYPLkeE0wZ2pxiqCfDywRPADs5ETfu3Ba6uyi6mHoD
 q2CZ9R53ZUALrr5o6ZIeYo4Oy2gwXK6hT++XxZpklyGo4EuybhgV7Ed26XHtPrxQDsA6
 akDxoBCu37Yzw8m9UHKV/LJ2CsM2ZqgTTwq/24GolEZZsPCvKTk05YYAvfyle2CiRKQH
 vJrD+1zdweZckqpLlDkmfdq0AHclQsUjR/NoA2hkDqO3Z3whFR5bBCAaz3SLyWK55YbF
 V+gQ==
X-Gm-Message-State: APjAAAWbDqaV/7Gy9qMjKeqIvF2HzR13BMsMLLbx+4NTq2VDU8dMNZGh
 rCcwDx1werx2S3teMcPP7/RV/B5E
X-Google-Smtp-Source: APXvYqx+2IXeF0bK9VkWnbmx9WmhqjJFeWbAoAZDCTeAWgYBWnohz9q3fIehN5XzGYXsgtu+dH0rtw==
X-Received: by 2002:a63:5a4b:: with SMTP id k11mr10562073pgm.143.1560995239808; 
 Wed, 19 Jun 2019 18:47:19 -0700 (PDT)
Received: from surajjs2.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 23sm20763528pfn.176.2019.06.19.18.47.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 18:47:19 -0700 (PDT)
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] KVM: PPC: Book3S HV: Clear pending decr exceptions on
 nested guest entry
Date: Thu, 20 Jun 2019 11:46:51 +1000
Message-Id: <20190620014651.7645-3-sjitindarsingh@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190620014651.7645-1-sjitindarsingh@gmail.com>
References: <20190620014651.7645-1-sjitindarsingh@gmail.com>
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
Cc: clg@kaod.org, kvm-ppc@vger.kernel.org, sjitindarsingh@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If we enter an L1 guest with a pending decrementer exception then this
is cleared on guest exit if the guest has writtien a positive value into
the decrementer (indicating that it handled the decrementer exception)
since there is no other way to detect that the guest has handled the
pending exception and that it should be dequeued. In the event that the
L1 guest tries to run a nested (L2) guest immediately after this and the
L2 guest decrementer is negative (which is loaded by L1 before making
the H_ENTER_NESTED hcall), then the pending decrementer exception
isn't cleared and the L2 entry is blocked since L1 has a pending
exception, even though L1 may have already handled the exception and
written a positive value for it's decrementer. This results in a loop of
L1 trying to enter the L2 guest and L0 blocking the entry since L1 has
an interrupt pending with the outcome being that L2 never gets to run
and hangs.

Fix this by clearing any pending decrementer exceptions when L1 makes
the H_ENTER_NESTED hcall since it won't do this if it's decrementer has
gone negative, and anyway it's decrementer has been communicated to L0
in the hdec_expires field and L0 will return control to L1 when this
goes negative by delivering an H_DECREMENTER exception.

Fixes: 95a6432ce903 "KVM: PPC: Book3S HV: Streamlined guest entry/exit path on P9 for radix guests"

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 719fd2529eec..4a5eb29b952f 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4128,8 +4128,15 @@ int kvmhv_run_single_vcpu(struct kvm_run *kvm_run,
 
 	preempt_enable();
 
-	/* cancel pending decrementer exception if DEC is now positive */
-	if (get_tb() < vcpu->arch.dec_expires && kvmppc_core_pending_dec(vcpu))
+	/*
+	 * cancel pending decrementer exception if DEC is now positive, or if
+	 * entering a nested guest in which case the decrementer is now owned
+	 * by L2 and the L1 decrementer is provided in hdec_expires
+	 */
+	if (kvmppc_core_pending_dec(vcpu) &&
+			((get_tb() < vcpu->arch.dec_expires) ||
+			 (trap == BOOK3S_INTERRUPT_SYSCALL &&
+			  kvmppc_get_gpr(vcpu, 3) == H_ENTER_NESTED)))
 		kvmppc_core_dequeue_dec(vcpu);
 
 	trace_kvm_guest_exit(vcpu);
-- 
2.13.6

