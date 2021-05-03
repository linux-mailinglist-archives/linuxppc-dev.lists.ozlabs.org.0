Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3075C3715A2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 15:04:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYjqN1kNGz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 23:04:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dGabkijm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dGabkijm; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYjnb1Bq5z2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 23:02:59 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id b21so2762640plz.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WAQqpAgTTsGEbbkxR70JxT+IBdrvdRzWuqwtavlOARE=;
 b=dGabkijm0he+4nD4cKIy7hV9zN1Th6hYuEhRi3ml1BB/eiw2DxKIxak8cP3AuJnROZ
 IqzdptHV8CJP+L2SyWmBrTfE2LRf/fuCe3ONOVvBCxOztUK7AtGoMFviULPqLzSyuoQ2
 LE0xi6YQNDhZZe58udVq8j8tRdJFm/mueYrs+2vDz6mv8bWXNa2I2T7+YluPVVOqNHkD
 2y5IcA1F+yK8kifhos7MVX3Hboua8n4BNRHAwYxV/IkRxcNOKnVPjHswx7f+eT81jGJQ
 kmEnEc36voOhrRY1WRhywdrDFiYgj023XPZW+mNI2O5dZECFDKtUypbnWoO8U3gT7Map
 0ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WAQqpAgTTsGEbbkxR70JxT+IBdrvdRzWuqwtavlOARE=;
 b=s6NmO+7BMWomTqMJhVHedq5g+oVEp5uEsdD1LEcqyJaXaoY0A/qpKm18RNyv1sDuZi
 XMIinI9iUYVaiFjd/MuKTh/unZajmPpjt5OSnmVC27OTzIqYQU5eG/tu4r9UP58jyTrk
 oG+YeB6VrMudjT7sx+ZRVImimEvKEerf5SexE1+ep8yK8/5slHZYkUz/7sEkjp0F3KrJ
 43u1a2KXE4MR1j61ZcfvZr5W75idOY8DYZfYCByZ/Lr2CwTsAjS8lutBVtTRDuSnqCYb
 8F/+vN4P+88Wo67AaK67u2GJFWCxT7lEc4LMrMd7Z/N5kHGTCgzZlgWVdZbDGyQzHrYm
 GrRQ==
X-Gm-Message-State: AOAM530M40TlIQKK0A8d+35HGBxI/hNX7kB3N3Nbkf5eQGcBXdx0J3jS
 +ryM5dAXY49wjLYkXhRmKb5fJwVWq9I=
X-Google-Smtp-Source: ABdhPJwwRsscfIt52e8CIgWSiUqeYh5LWJ/OCS2e7EPMbUleVB/U7lmuEhs+9UMtSN849sp+tN0rXw==
X-Received: by 2002:a17:90a:c42:: with SMTP id
 u2mr21225032pje.76.1620046976236; 
 Mon, 03 May 2021 06:02:56 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id f1sm18069053pjt.50.2021.05.03.06.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 06:02:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc/pesries: Get STF barrier requirement from
 H_GET_CPU_CHARACTERISTICS
Date: Mon,  3 May 2021 23:02:42 +1000
Message-Id: <20210503130243.891868-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210503130243.891868-1-npiggin@gmail.com>
References: <20210503130243.891868-1-npiggin@gmail.com>
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

This allows the hypervisor / firmware to describe this workarounds to
the guest.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hvcall.h      | 1 +
 arch/powerpc/platforms/pseries/setup.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index f962b339865c..a60ef261f63a 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -395,6 +395,7 @@
 #define H_CPU_BEHAV_FLUSH_LINK_STACK	(1ull << 57) // IBM bit 6
 #define H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY	(1ull << 56) // IBM bit 7
 #define H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS (1ull << 55) // IBM bit 8
+#define H_CPU_BEHAV_NO_STF_BARRIER	(1ull << 54) // IBM bit 9
 
 /* Flag values used in H_REGISTER_PROC_TBL hcall */
 #define PROC_TABLE_OP_MASK	0x18
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 287f33645419..631a0d57b6cd 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -555,6 +555,9 @@ static void init_cpu_char_feature_flags(struct h_cpu_char_result *result)
 	if (result->behaviour & H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS)
 		security_ftr_clear(SEC_FTR_L1D_FLUSH_UACCESS);
 
+	if (result->behaviour & H_CPU_BEHAV_NO_STF_BARRIER)
+		security_ftr_clear(SEC_FTR_STF_BARRIER);
+
 	if (!(result->behaviour & H_CPU_BEHAV_BNDS_CHK_SPEC_BAR))
 		security_ftr_clear(SEC_FTR_BNDS_CHK_SPEC_BAR);
 }
-- 
2.23.0

