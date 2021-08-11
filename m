Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAC53E9591
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:08:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFB12szWz3dRD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:08:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lma6aBQN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lma6aBQN; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF2H4LP6z3cHr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:15 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id a20so3342536plm.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DKq8DJSxGhBXzYj1xzUohFIXvPf01oJFRn8nuM9P7p4=;
 b=lma6aBQNpLAl+jS3h8+vESjIcKgyn9gViolaxPgZ+neVXaOq/Tm52zDzZq2zQCKK/M
 BhFYNFSZppyaXcvmgmr8ema84WlMud1Vmhua00bA+/tZDu+Sccfo+I/wzv/QbI9O1ZhG
 uLvg+uV77Ye4vtGFz21ji5RuAdM+bglisqYk7Ndft/EpNpdDbxZ87iDt0QIpsHZ/1qyM
 ggfbWhnyzedtE98zjQbOLYm1NvPmL2NP5IhAukaI3lF5ZCJufSSjfAGro6K05SXERAFy
 jaQvB3AhF11YfpFMuFhI6O/ngMhXqzkQpI+Gx/dTWYNWW0iwudusnbIUCCShxzY3YncM
 WfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DKq8DJSxGhBXzYj1xzUohFIXvPf01oJFRn8nuM9P7p4=;
 b=Hrk2l46n7XrjG33GB1zKKOBSYDPLx2MbpCZa/zlK0Xk5WlK/KWsY0VyVTdb/cHEJhs
 +vUq16GjoQvD2LnSHI8aV9Xqd4U8YIbo6Cv6fm3PsEdM9O3KR6RGQEahK7kbVcTAMbPz
 3zs+vyalMdvXQMOyX/lbQBaV6ONDJXyiQSqc3rKqc/SdMfI/mwHaq4xms8v8/UEWcV0x
 iN8a9pwljJby38LtQLOS00LvC/5KHexZ2hP+IW/t+lcaGg3smEfSPWOWe7j7yYv9hsjE
 /CzFjPeHaWP1tr7Vkp/9oiaZWQd3GOWjPmP9ROo4YdRXZFEmn7mBrZv4nEnUiYW/F4qD
 pRjQ==
X-Gm-Message-State: AOAM530h/Lfng6k3UBJaXLhDSHENzv8rIbkSQa7CYifWf8Fb1u+IMVvt
 lCqYI9xSm/k4MZKtq7GWb1I=
X-Google-Smtp-Source: ABdhPJycpQsCjxqz5RVJTlxfpp/h1mcxCPlbQ4A5gGw9kh5PMpEuxbaTy7hWJkJJGorXl329MBvphw==
X-Received: by 2002:a17:90a:1a51:: with SMTP id
 17mr10940798pjl.59.1628697733000; 
 Wed, 11 Aug 2021 09:02:13 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 11/60] KMV: PPC: Book3S HV P9: Use set_dec to set
 decrementer to host
Date: Thu, 12 Aug 2021 02:00:45 +1000
Message-Id: <20210811160134.904987-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The host Linux timer code arms the decrementer with the value
'decrementers_next_tb - current_tb' using set_dec(), which stores
val - 1 on Book3S-64, which is not quite the same as what KVM does
to re-arm the host decrementer when exiting the guest.

This shouldn't be a significant change, but it makes the logic match
and avoids this small extra change being brought into the next patch.

Suggested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 3198f79572d8..b60a70177507 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4049,7 +4049,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - mftb());
+	set_dec(local_paca->kvm_hstate.dec_expires - mftb());
 	/* We may have raced with new irq work */
 	if (test_irq_work_pending())
 		set_dec(1);
-- 
2.23.0

