Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BEC5B1EDD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 15:27:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNfzq2lBLz3cCc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 23:27:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hnQAef5x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hnQAef5x;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNfyc6G1sz30D0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 23:26:00 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id pj10so7345843pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=b6R5QMvB2S/UrzCiGF2IsiVSCIsOB79N6a1hozlTLlk=;
        b=hnQAef5xTCRakQyJPwSW3KnWpdpHkLwsrx06fSZKw04MiOgKPSsWtfxCEJHX/1q3G6
         W7Qbm3RBgLbstMJYJgUwbLhKZPo/HojBo18zkHgRGcTzEZlKtOF89rjVZbeUHBR3ILCW
         7r7WyTAkRYAZu61x0wXR3Hk9ACjaVBG5o3Wbmcl4WMZvZVM3NWCfGofzLzF1GX00mT9E
         RAh0gVJt3gGQuAZ5hCASwtmD02b1va7Sn528b6t0OyNGaLLw/LBKTKpOjDKZlxaw6qO+
         HlnnrP5Xh3aG7Ok3IbL01kn8RSJZfto4xzW6V7kQ6BfJxxjlq1vecmaeMqB1z17yGRmn
         aGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=b6R5QMvB2S/UrzCiGF2IsiVSCIsOB79N6a1hozlTLlk=;
        b=3GHp2Fa3HCkrjtntB+P+JD+uDQiriallwCE5/5Jvcj6ZtFTfFT+VSOwKOTJV6LETmT
         YiiuI/LoRaxngAsRtFJMmQCqAgdhVR8p9yN79WQJgjgqfu3Rg1l3VLA2Y9fDfrYBR5Ds
         YCZJfHYexcNRh5PMO49RUHGp9nD8ixQjN8bFQ7Ede2AXL+Pk2S2uDzjdFSnlRb1sOB2p
         gv2d0jYIcvOp+ceJMDkeXflUM1ntnW22Hov8EaM71QGlp1HRNoVJxYbWPyx4F3IGwzkc
         DfsOT4kiBlY3+XWb/Y1qgkr+ek+pUB6AhVQOyr+MR2KiNG96agWRUKtdTHvxJAHRr9Lh
         n4bQ==
X-Gm-Message-State: ACgBeo3bbMy6rOytj+H3Xctga/p/575jCEZqWeMeQVrZPjEByGfOVS9a
	MXemN2n72zL6uHTdld71hlgpJNN2EuFLAQ==
X-Google-Smtp-Source: AA6agR5NUEKKZ4J8dkEe/3aeYaQc/UKDgV8Yf9JKScJ0Q5xPY2jXFQVzx6jym8WRhZTmVibyrN6zXA==
X-Received: by 2002:a17:902:ec85:b0:175:55ce:f241 with SMTP id x5-20020a170902ec8500b0017555cef241mr8927578plg.89.1662643558174;
        Thu, 08 Sep 2022 06:25:58 -0700 (PDT)
Received: from bobo.ibm.com ([193.114.109.49])
        by smtp.gmail.com with ESMTPSA id z17-20020a170903019100b001768517f99esm12505504plg.244.2022.09.08.06.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 06:25:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] KVM: PPC: Book3S HV P9: Fix irq disabling in tick accounting
Date: Thu,  8 Sep 2022 23:25:42 +1000
Message-Id: <20220908132545.4085849-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908132545.4085849-1-npiggin@gmail.com>
References: <20220908132545.4085849-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kvmhv_run_single_vcpu() disables PMIs as well as Linux irqs,
however the tick time accounting code enables and disables irqs and
not PMIs within this region. By chance this might not actually cause
a bug, but it is clearly an incorrect use of the APIs.

Fixes: 2251fbe76395e ("KVM: PPC: Book3S HV P9: Improve mtmsrd scheduling by delaying MSR[EE] disable")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 014575b31651..f62dfaaf6c39 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4620,7 +4620,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	context_tracking_guest_exit();
 	if (!vtime_accounting_enabled_this_cpu()) {
-		local_irq_enable();
+		powerpc_local_irq_pmu_restore(flags);
 		/*
 		 * Service IRQs here before vtime_account_guest_exit() so any
 		 * ticks that occurred while running the guest are accounted to
@@ -4629,7 +4629,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 		 * interrupts here, which has the problem that it accounts
 		 * interrupt processing overhead to the host.
 		 */
-		local_irq_disable();
+		powerpc_local_irq_pmu_save(flags);
 	}
 	vtime_account_guest_exit();
 
-- 
2.37.2

