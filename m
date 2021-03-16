Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2694333D22D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 11:52:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F099J1936z3bmr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 21:52:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fsfycRiZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fsfycRiZ; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F098v3vV6z2xfl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 21:52:15 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id o10so4555795plg.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 03:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R+de/X0rnXV0f1FHR7BuMAM6SyOWthu2NUw8EqIWeL8=;
 b=fsfycRiZ/SoXt2NNYViF1VTgxmH+EIPL2KOeMdjvkXrq7K2J/8L4ykwS1JXciCFz6B
 LepvpqBkIPeHLQiYKNY2qcBLqArMc56xDExuSTK7wJ5lXtQ/fIgn2zX2PZSs+2bYX88s
 eJCFbz0sfy+vXFb1Z7h1my2ZdwBUsv8HZanfdm06vVEnsNF4y1n95rOV+J2iO9LHgFzu
 ckfJR4Vv/Il0yv/sbzH+0UVAuOoNCRM2JP8gz3QJZRYW71ZJ16EuBycxxro9CcoEmdzI
 JazUUuqCcwJ+rR7CcYUYBxnJ/Pzq+JcOZ+hoLt0OVKQQRHniMvJfP/MgAdp3GoPq7PMK
 we4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R+de/X0rnXV0f1FHR7BuMAM6SyOWthu2NUw8EqIWeL8=;
 b=XR8fctZvc80wlFl4BvO5/+Tpk/XXT9SK1l8EtZaycGLLH2CZX7GHHPtsLyXQEEQDkR
 3fLqzn9jiPI47PaNYkmRuv3IuCtYGD0VHI8Rvitmhptxhb40cPapZyI2TGqPjgwYRzz/
 mUSWA5uCE9VUXeUe/TdjDigPtgQKek5JqqQTsWE1uvwdmG4pXf0BKz6wNDpy2HWg2E24
 pR7rFtFU6wBEG8zgeAt7NSxeQaj+WwhSB2S3uf53Kw5xe6zrDMmO11WyOXQW/CgUAqS6
 +BTyHG71cu0bLcnACPRlHHZYycs0/Vm/qUKEAk9SDFdLA0q9k7ZaQsx1yjiB/7zzfuvF
 MgjQ==
X-Gm-Message-State: AOAM533FtTEebZJRkFT1ntHM8t2lbCmzr1HQI+D6AKAv6voA02/2fge+
 8zqCP6yuooWgeRwseQrXyvE4j3cwbcU=
X-Google-Smtp-Source: ABdhPJx+vX1NDaTboTIVUHnw+W6ldGcmVNwFdBlaR0g2DPk31AXgqT7an52gMA5XQd5xDqulTcCQdw==
X-Received: by 2002:a17:90a:ce0c:: with SMTP id
 f12mr4228822pju.11.1615891931824; 
 Tue, 16 Mar 2021 03:52:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 n5sm16047079pfq.44.2021.03.16.03.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:52:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix hash fault to use TRAP accessor
Date: Tue, 16 Mar 2021 20:52:05 +1000
Message-Id: <20210316105205.407767-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hash faults use the trap vector to decide whether this is an
instruction or data fault. This should use the TRAP accessor
rather than open access regs->trap.

This won't cause a problem at the moment because 64s only uses
trap flags for system call interrupts (the norestart flag), but
that could change if any other trap flags get used in future.

Fixes: a4922f5442e7e ("powerpc/64s: move the hash fault handling logic to C")
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 1c4b0a29f0f5..977da0dce80c 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1545,10 +1545,10 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 	if (user_mode(regs) || (region_id == USER_REGION_ID))
 		access &= ~_PAGE_PRIVILEGED;
 
-	if (regs->trap == 0x400)
+	if (TRAP(regs) == 0x400)
 		access |= _PAGE_EXEC;
 
-	err = hash_page_mm(mm, ea, access, regs->trap, flags);
+	err = hash_page_mm(mm, ea, access, TRAP(regs), flags);
 	if (unlikely(err < 0)) {
 		// failed to instert a hash PTE due to an hypervisor error
 		if (user_mode(regs)) {
-- 
2.23.0

