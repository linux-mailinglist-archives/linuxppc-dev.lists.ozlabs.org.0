Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B0F78E5E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 16:49:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y2dg1T5FzDqNX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 00:49:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KQPuMd+4"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rY0y7NzDq96
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:48 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id f20so19107098pgj.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oCjBhCiSLWMLHedl9hS8CLCP4QpQl3JSv4kxPW/k+Zk=;
 b=KQPuMd+4kesJ6G6Tn9Y/7Is3GyKlW9xqUj2xUDK7GTZdKPW9bEb76TuzrJIGH4zevn
 gEPpJbScEjrTuI0loKdalvuAOwvjqi8Glp20BYi52jN/89Trp1ng2cZY/MAUxXYr0EiU
 MgMWtMA46ORSPs47jeTJ21/Xe9UYQcPJlRotIesoEEMHBx/OvpvDzkLW/3ofOZK4HDG5
 +uYAEpzLODhoEzU7EofRdTyZtkFEvmc4e6P3d6WrOt2FsXr6/ZDp0bKlJNqKoJuaAeD1
 9zsxeVwlj5YA6r1gzdhdzip4RVbx1Ey8eygOZYZ1Egr4CTmbQWLc4Xqw6cRq4LnyQWWC
 H2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oCjBhCiSLWMLHedl9hS8CLCP4QpQl3JSv4kxPW/k+Zk=;
 b=o7gHVACkBbNJiPTFtESHXTlH9KIqaC0j/kdvI6lwx38p6aI1BpKFncbHtwbD9PMdsu
 5KQ/Kog29kOY8hJ288pxNuEHkoUTWcZa9fWFpWSfRPLk96uHwkYjxL28vYxK8gxX7sOk
 U8agmotbkwR6Qx1rn91gwLoFqcYpClPTfz1mzGiunR1Zkh+zbclTp9WgKcP00LK746Ax
 zbXluadjzpfQrIy1JMV//OPDSmEtnTbnHyGpJtV80Gzmox8sDH8K3Z+BwyE+9UxHYzeK
 NkEA4ahV55qcbcX1tM7Ro0hQxRhrPC4e662kY+M7QXuUT3HQOvPdEKevWtR+0KoboaAy
 DfKw==
X-Gm-Message-State: APjAAAW4yQzJZPCFd4VW2fgGDBIt0izFWDfScBwdARhMIU5SIW4dTLtu
 GYLhCbEpBLJZ6V3Q0HvjkHUu1q4F8R0=
X-Google-Smtp-Source: APXvYqwIyb/T23PwCSu7aYuw5KMLcqCALw4QQ3DGNJiqiAD2KDLY/AqBq3fXt9cg15G8/xftTAB5Cw==
X-Received: by 2002:a65:584f:: with SMTP id s15mr87770940pgr.175.1564409626538; 
 Mon, 29 Jul 2019 07:13:46 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/18] powerpc/64s/exception: Add the virt variant of the
 denorm interrupt handler
Date: Tue, 30 Jul 2019 00:12:37 +1000
Message-Id: <20190729141247.26762-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729141247.26762-1-npiggin@gmail.com>
References: <20190729141247.26762-1-npiggin@gmail.com>
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

All other virt handlers have the prolog code in the virt vector rather
than branch to the real vector. Follow this pattern in the denorm virt
handler.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 94f885c58022..1c07b5fc6692 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1853,7 +1853,11 @@ EXC_REAL_END(denorm_exception_hv, 0x1500, 0x100)
 
 #ifdef CONFIG_PPC_DENORMALISATION
 EXC_VIRT_BEGIN(denorm_exception, 0x5500, 0x100)
-	b	exc_real_0x1500_denorm_exception_hv
+	INT_HANDLER denorm_exception, 0x1500, 0, 2, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 0
+	mfspr	r10,SPRN_HSRR1
+	andis.	r10,r10,(HSRR1_DENORM)@h /* denorm? */
+	bne+	denorm_assist
+	INT_VIRT_SAVE_SRR_AND_JUMP denorm_common, EXC_HV
 EXC_VIRT_END(denorm_exception, 0x5500, 0x100)
 #else
 EXC_VIRT_NONE(0x5500, 0x100)
-- 
2.22.0

