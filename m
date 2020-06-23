Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D5206897
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 01:43:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s2sf3sSczDqSG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 09:43:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WgNv8N4e; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49s2qt0GdTzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 09:42:00 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id o11so339158wrv.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 16:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AReDoi+MO9YDqym/gLRNbjsgEQXfSTWrBiRDiKR/GZM=;
 b=WgNv8N4eS2wY9Qy9AIA0NNO1jYdU5fwi8KmjJ1PdbFJT7CrjJZsvX+SKUgEU8AOFYt
 Dg1XSagdgEgRsiRLB93nwxCqS676SUNoGY6bfBuSf5v1mQuilcomZKjimHKLxCA/g1sK
 8c83UYDjGcKaRCsVHUrd7GoFPpEWXmifJyKDpBPHazxhpkkUvtz1jQk+VdsX2TSOeE+I
 NRIzHQgCMRc866i6lMSmoIcaayRnZgJQj5KSxlj4DZ73efzZzphwIQam34mDRmq06eOC
 2qe70AhCvKsQdLqAINyw7SVV1u1uycNwX4unzuT3Wy6ms4ka7HGUhWSeRKjTVRBegk0W
 E6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AReDoi+MO9YDqym/gLRNbjsgEQXfSTWrBiRDiKR/GZM=;
 b=POJXTGC624r41RuuYDsWo1tpv0Z0oMFAnqZx7OiQXDPv84M2Fh4QU9lRSiAHCFewGX
 OmTBRvDUEX90dSJV6FL8r4z+7Pu53B6nBppSa5MAOzPEL9+OJeLgvG1FLx8YQBsaG2Sp
 JBv5Mbijwc1obXVwq9jb0kWzwlSwcEKCpti/E9EFdzPlSmkMXVmjkXLO8+gZsK3qRDH7
 8e/xWIJLDmdBFORmHXT/j1qr8qjwUuaALJj+Dy5iDOfsmufU3wuQelN8e3rDd5aFEW7Z
 CSNGaYO7tzCONRvG+baaaSjUQqQpEh26s9pexjwPJasP9Nmb803WXaTcQ3CLYTTSbRO+
 /Fug==
X-Gm-Message-State: AOAM533m6y8QgSoNLWNINh8WKoIAuY0M7k0egJK6Ju1S+NVq9BqZLdoT
 mDLx5j6O6sKtJUO5HCDMUBslTAE8
X-Google-Smtp-Source: ABdhPJxJg8G7Ng5nq//3THs247oX3BonSPDSCURzBjFkh5BBl30nxxevRxWY5MVTNkDFRbgH0xNoPQ==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr27063764wrv.74.1592955715827; 
 Tue, 23 Jun 2020 16:41:55 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id d63sm5878445wmc.22.2020.06.23.16.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 16:41:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/64s: restore_math remove TM test
Date: Wed, 24 Jun 2020 09:41:37 +1000
Message-Id: <20200623234139.2262227-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Anton Blanchard <anton@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The TM test in restore_math added by commit dc16b553c949e ("powerpc:
Always restore FPU/VEC/VSX if hardware transactional memory in use") is
no longer necessary after commit a8318c13e79ba ("powerpc/tm: Fix
restoring FP/VMX facility incorrectly on interrupts"), which removed
the cases where restore_math has to restore if TM is active.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 7bb7faf84490..c6c1add91bf3 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -530,8 +530,7 @@ void notrace restore_math(struct pt_regs *regs)
 {
 	unsigned long msr;
 
-	if (!MSR_TM_ACTIVE(regs->msr) &&
-		!current->thread.load_fp && !loadvec(current->thread))
+	if (!current->thread.load_fp && !loadvec(current->thread))
 		return;
 
 	msr = regs->msr;
-- 
2.23.0

