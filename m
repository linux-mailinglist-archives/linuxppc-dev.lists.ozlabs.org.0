Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FCE49716D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 13:05:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhWyg2f0zz3dlR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 23:05:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gSQMatjK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gSQMatjK; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhWss4QDKz3bVx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 23:01:05 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id 128so13208137pfe.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 04:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qp5jKk+UJYmHsTosJh5HwKS1PeRELtDkE45Uz+gEt9o=;
 b=gSQMatjKLAr73jKctC2hjXdGMXEdcmRfGjyUq4m/0ZGRGIvyhMuDKFLZ9MQuvK7+tv
 LVfi7/i9el0qMrlSAF0U+ND6Xx7Sa/Hj6kavO6v97YKDEwjD5NiQgUBQGIBDJIwIRPUO
 35TkLk1D+nXF0KOfjE65MZD018xCiwTvXXPGNMo29yh1htvHWXQiBhTaeQbsGSoakk8i
 RHgu2SooPoev5RB/yjQVj4nobzZ1cl5TGJVwyvAsd22LEoknVOYyMyHbvbXegG+XK+8n
 p7AWKs4kbTxQ6MkAIORYZV2KoyuFlYx3HYuMJv0RFjH8CCPVIZHHvlxNjEzr9sDi5vAm
 Tn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qp5jKk+UJYmHsTosJh5HwKS1PeRELtDkE45Uz+gEt9o=;
 b=soa1nmfmvY5CprNsTVVezUvyS/S0EMPEQZhCBuLZ4v/9v70R2R6nenMGLS1mEqy9g6
 f76kT6juRNC7sDDSrHUd41GJlUGlTLlGPV38Sm30J6DSe4dC4hrSBsjxybkgf3Vr1eXq
 BcqEufD9MNLSjvPZexjE1xZsZ53NyqfJXk3124FIhUsHMG9C9wttXyJnGrM73jbZfytT
 8D7wltJnwpy33T0iDLidld6tHuGy7DlEwsQ2JYGdPI5eWnXTJYNOEfs7Qmr9/Ro84BDB
 jO4v2BwGyPTL72+uwDr9ojTsK3yfXKboau7BYvmc0lppm81F/n4qmy1Aq+J0kXikg24e
 KvAQ==
X-Gm-Message-State: AOAM533WdS4t0KkmYobXIIuUXXN0UYql3+kiEBDIP8ttyXbxLkPrjLSN
 7+K4Hm3APHV8SxrFNXy5UC0Oz/6IgQM=
X-Google-Smtp-Source: ABdhPJw0wBH39ArOzmmkKhfDF+aylPz81C9WDUCDiaEbreARhRo8/DGjE+PjXjq8Th4W6RppFIVz5Q==
X-Received: by 2002:a63:10c:: with SMTP id 12mr8566069pgb.67.1642939263452;
 Sun, 23 Jan 2022 04:01:03 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id kx11sm9608213pjb.1.2022.01.23.04.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 04:01:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] KVM: PPC: Book3S HV: Remove KVMPPC_NR_LPIDS
Date: Sun, 23 Jan 2022 22:00:43 +1000
Message-Id: <20220123120043.3586018-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220123120043.3586018-1-npiggin@gmail.com>
References: <20220123120043.3586018-1-npiggin@gmail.com>
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

KVMPPC_NR_LPIDS no longer represents any size restriction on the
LPID space and can be removed. A CPU with more than 12 LPID bits
implemented will now be able to create more than 4095 guests.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_asm.h | 3 ---
 arch/powerpc/kvm/book3s_64_mmu_hv.c       | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
index e6bda70b1d93..c8882d9b86c2 100644
--- a/arch/powerpc/include/asm/kvm_book3s_asm.h
+++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
@@ -14,9 +14,6 @@
 #define XICS_MFRR		0xc
 #define XICS_IPI		2	/* interrupt source # for IPIs */
 
-/* LPIDs we support with this build -- runtime limit may be lower */
-#define KVMPPC_NR_LPIDS			(1UL << 12)
-
 /* Maximum number of threads per physical core */
 #define MAX_SMT_THREADS		8
 
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index f983fb36cbf2..aafd2a74304c 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -269,9 +269,6 @@ int kvmppc_mmu_hv_init(void)
 		nr_lpids = 1UL << KVM_MAX_NESTED_GUESTS_SHIFT;
 	}
 
-	if (nr_lpids > KVMPPC_NR_LPIDS)
-		nr_lpids = KVMPPC_NR_LPIDS;
-
 	if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
 		/* POWER7 has 10-bit LPIDs, POWER8 has 12-bit LPIDs */
 		if (cpu_has_feature(CPU_FTR_ARCH_207S))
-- 
2.23.0

