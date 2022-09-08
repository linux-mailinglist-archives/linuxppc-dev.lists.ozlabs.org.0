Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3BE5B1ED7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 15:26:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNfz85ktpz3c2q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 23:26:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UL96f5I7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UL96f5I7;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNfyc5pWNz303T
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 23:25:58 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id e5so89174pfl.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=log0diJjGxBlvSxf2yN5pbMKbshxXY0OSVP3MW4ICZg=;
        b=UL96f5I7AaCVCASEIkm5LW6I2hv/WJ93iwOtLyvlXeOBhmn543NSDEcb/2+SvKQPOl
         JxM6DTYv4e6T0BkWwVsgTTZcY2LPuv5Psnyu9cdEtzqdoSSRHUjZsh48O8ODr2wYpC8j
         PALES4WvinJvuf1AZw6jcZ4lrwV+DJx9/w5ns/vHN+eAmgZouASYP39xiV6P+oGIIxVh
         ncxcas+e6VWuZiHyl/SKNFfaSZoLfrTDzzW8FZdxLUwvm88P4K5wCQMsd6io/4sRk3tx
         WOl0kR1qkz5ClRHZGyZvlNENrmpHU6D9tz0pHnwiyUiyRNE19tEyvF2SxB+YzENm57eG
         rIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=log0diJjGxBlvSxf2yN5pbMKbshxXY0OSVP3MW4ICZg=;
        b=ILiwr6IoiiWjIwpbb5mRUgIICGjhTCrhK+1RC5jhfEwf1NHg5xV+ua1KF69H7rNVgw
         RIEf44q9DdGedDKk589h6wUkWb5ym4kT3/bGQrfPsAXRalb/xIwwMNTOCsa2x66ZlH6p
         eR/s+1sdIMMfQbUfHVgQWoivw41WpbiCB7CH4KPGP6zuXnaY8liD96j2Yw3RvkKkOc8z
         NL9iuUl+X1dfdDwX3aMh9gAGeK7VbtjxxKFPo4lB4DZMAbnVDLnD0Rnv+YkpV8ZFUv8S
         u27pXtM2urYZZ/I5j0/DhePY167eQQOos79j9WFDBDupB+O6xLIuvVoersAuqz6+CIZZ
         eWUg==
X-Gm-Message-State: ACgBeo34rZmhCUkMD38+5vOBYmeXhEn5ZIJTloNpct+KK+4e+yn26LIN
	eUvPmY66bkwt4VF3OP5mK64WqEoEWtzkBA==
X-Google-Smtp-Source: AA6agR5+XapZByClH6vaW+GTvw17ZAA3ncF2TMd7zEiDBcQItXANW75VWyNmNovyYHXq5+tu2/a4Wg==
X-Received: by 2002:a63:290:0:b0:41c:506f:7ae9 with SMTP id 138-20020a630290000000b0041c506f7ae9mr8001320pgc.373.1662643555765;
        Thu, 08 Sep 2022 06:25:55 -0700 (PDT)
Received: from bobo.ibm.com ([193.114.109.49])
        by smtp.gmail.com with ESMTPSA id z17-20020a170903019100b001768517f99esm12505504plg.244.2022.09.08.06.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 06:25:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] KVM: PPC: Book3S HV P9: Clear vcpu cpu fields before enabling host irqs
Date: Thu,  8 Sep 2022 23:25:41 +1000
Message-Id: <20220908132545.4085849-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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

On guest entry, vcpu->cpu and vcpu->arch.thread_cpu are set after
disabling host irqs. On guest exit there is a window whre tick time
accounting briefly enables irqs before these fields are cleared.

Move them up to ensure they are cleared before host irqs are run.
This is possibly not a problem, but is more symmetric and makes the
fields less surprising.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 57d0835e56fd..014575b31651 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4615,6 +4615,9 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	set_irq_happened(trap);
 
+	vcpu->cpu = -1;
+	vcpu->arch.thread_cpu = -1;
+
 	context_tracking_guest_exit();
 	if (!vtime_accounting_enabled_this_cpu()) {
 		local_irq_enable();
@@ -4630,9 +4633,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	}
 	vtime_account_guest_exit();
 
-	vcpu->cpu = -1;
-	vcpu->arch.thread_cpu = -1;
-
 	powerpc_local_irq_pmu_restore(flags);
 
 	preempt_enable();
-- 
2.37.2

