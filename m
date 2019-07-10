Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E4E649E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:42:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kNjS2mXdzDqWN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:42:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aMvgeDzX"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kNH51vZwzDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:22:57 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id a93so1402220pla.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p+jjIAIMslx172lTxJVoXHhGXL+fIcfc+rKiQb14IpE=;
 b=aMvgeDzXO5r5K3P9Gtp+0OJxDh2MrLI08DdRTQVSFIyaRZK1t8UHAdMU94AIyTAzb6
 ruHHwNTCNKVOi+6mBfiAew5ElMWsWXAriy1Zu/NLrErW5LlMPmNneJ3yiRtrfu/gFZd8
 j3vVWzkqRVGrOTRjkaJVt6A31mr1dV2AN6AHuDnBVlStVz40XC+jIJp+sxdM3MuwYTw1
 7sl/XJKoBJ1V87WuenOKPChVrWFD2A6oZ1UmupAdLetH3Z3imT76j2Qw7D5Ob2bN4PjP
 S4Zz2c95GwvVFFSu4HR2XauqkmBsnwIzRTF9U0mXOPXH9ZXov16BGd3paPpF1LLB1t3f
 ayVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p+jjIAIMslx172lTxJVoXHhGXL+fIcfc+rKiQb14IpE=;
 b=OBm3Go/dD4SbNisFuieyB3US6UVfv4/Gs6dcedEjEAf/z6B/6gDIujTXsBIvYRPixD
 AZHDaO9MtnHsULUxWP/7AGw1dPEvUcJBDrVX/eEon3XhEAVI59G/G7Q4oO4HFsmXdy1o
 SQnuvDShT4q05CPOuilBnKHDcasEUj8euHc19/Rw1s5FinlDbIFrykVcLeU6MI4FDIQu
 GqBv148xwkNbMJaOOeYvRmBQ4yuRrU2pBh5gR6vwf8A9NTR8BeEjgQEqQCEuvf5eSaIs
 lwNDBux+N1aScmtau45mlJE3fnYg/RCpn0tvaUpwZ4rBU/UK/1fMdQgoEe2zaJDzFXNT
 rDaw==
X-Gm-Message-State: APjAAAUw6BlhgKI2C1hTVkftdhLgBzeZOv9nZMuZLBF9RytaDJKDUTsM
 GIed/Z0vOBwuXBUuvIwD4CBUjEVr7dg=
X-Google-Smtp-Source: APXvYqyjYR0iuxiFzZDm5JYG/pZN+pw3yS/hQJ0X/KynkYVWBAzlcKXCb16+NcbpU0F+FMcFFIsHkA==
X-Received: by 2002:a17:902:27a8:: with SMTP id
 d37mr39590137plb.150.1562772174697; 
 Wed, 10 Jul 2019 08:22:54 -0700 (PDT)
Received: from bobo.local0.net (14-203-207-157.tpgi.com.au. [14.203.207.157])
 by smtp.gmail.com with ESMTPSA id
 s22sm2699212pfh.107.2019.07.10.08.22.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:22:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/16] powerpc/64s/exception: machine check pseries should
 always run the early handler
Date: Thu, 11 Jul 2019 01:19:39 +1000
Message-Id: <20190710151950.31906-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710151950.31906-1-npiggin@gmail.com>
References: <20190710151950.31906-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that pseries with fwnmi registered runs the early machine check
handler, there is no good reason to special case the non-fwnmi case
and skip the early handler. Reducing the code and number of paths is
a top priority for asm code, it's better to handle this in C where
possible (and the pseries early handler is a no-op if fwnmi is not
registered).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 0186a44bb981..a69ceb28cf4c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -934,11 +934,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 	EXCEPTION_PROLOG_0 PACA_EXMC
-BEGIN_FTR_SECTION
 	b	machine_check_common_early
-FTR_SECTION_ELSE
-	b	machine_check_pSeries_0
-ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
 TRAMP_REAL_BEGIN(machine_check_common_early)
-- 
2.20.1

