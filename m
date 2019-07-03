Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0FC5DF3C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:01:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dtpw6T2kzDqQV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:01:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HQyc15p1"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dthM3gYrzDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 17:55:47 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w24so782330plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 00:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ee9qLF/RJ+7mXd4GiTRK8Dspx6rtpH65SXbucIncObU=;
 b=HQyc15p18sDixuNni4H5pwWcU7K2UGdio0PWpDsdQ8SLP7y9REPfq0a7Y/Rh4Mx1jB
 x97heN4ehKzdEFtAKkD/pNlS2WC4Zs93vgQYvjD6HeHSmfInZV2BsfacMkOuYUGcYv55
 fGPOdJTAnIcVqAY0ixLNhUd3RFCnljfIrZFKfbhve6QibPLaAEcNCFDTjvqnMSi2SfZu
 vA4PbonTJvXlNnprBcPQ6ScqMun+GpgKQ1Qoe6d7xOvSvZJowlBkc9pXdU876dWHJVwu
 cKUr6X3J/+npjpWKNGjwfM9C4sXUSgql3qJmTcfTYKK4XSvjpkMoJtlMJ09resThrLUD
 /Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ee9qLF/RJ+7mXd4GiTRK8Dspx6rtpH65SXbucIncObU=;
 b=taHXjzX3GwUU9SSKIlma2gQ+Kz5lL0Yz9RGzvPudVCL6NhwROJhQH6nW5Xq5aVV5tQ
 CCu/Rcm6/b2YAPCipUhuP6RSgLuI32kzY3+qWg3ODiebT8Y2UK1/dXUaAlyol7cxRZ4+
 w8pkPjfvGJMnkUJY25xhSTsgpBl8gPSXoInSiMzaj49uWpJJocyuiiuJ7U13T18BOaYw
 sdwaXd67Wcp/E92ltRBBCknqQSQJFbILt18IEp0mEQpOVSkO0EbxTmjzc44GmtnrNYk/
 ENbI7ziib+NKEIHCjRomZi5s7sE2xiTSLFS/W14GPzOi9lakVt1PkViESn6aP3BOx+0k
 cIpA==
X-Gm-Message-State: APjAAAUTqOm5qKy7Pv3mf7jOllUqhiiGtGBJAzGtlrFKGODzqUV1Svtj
 f4zAEyLfdddDQWZ4fpPSLsbOCKOj
X-Google-Smtp-Source: APXvYqxsqswn/eYdjAtHzFIit8iFb6U+47R9JTOiLxbuSFN7srqpuuEgJgxNJElWA7+kg/cU5JfVDg==
X-Received: by 2002:a17:902:8f81:: with SMTP id
 z1mr39781355plo.290.1562140544857; 
 Wed, 03 Jul 2019 00:55:44 -0700 (PDT)
Received: from bobo.local0.net (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id p68sm2955849pfb.80.2019.07.03.00.55.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 00:55:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/14] powerpc/64s/exception: machine check remove bitrotted
 comment
Date: Wed,  3 Jul 2019 17:54:32 +1000
Message-Id: <20190703075444.19005-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703075444.19005-1-npiggin@gmail.com>
References: <20190703075444.19005-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index db7ef8c8566f..e8734a1dfdb9 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -933,10 +933,6 @@ EXC_COMMON_BEGIN(system_reset_common)
 
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
-	/* This is moved out of line as it can be patched by FW, but
-	 * some code path might still want to branch into the original
-	 * vector
-	 */
 	EXCEPTION_PROLOG_0 PACA_EXMC
 BEGIN_FTR_SECTION
 	b	machine_check_common_early
-- 
2.20.1

