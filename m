Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 307D07F63D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:55:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460QZT6BswzDqgn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:54:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G2omd5PU"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PMr2jCgzDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:40 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id c3so12725225pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUnQK3fSzZ5G7iwVI9pBm3YXBB947i2a3wrqHuTxWSI=;
 b=G2omd5PUdTKhCvEL8n9nThXoyxAW2rBjK0Aw27ijrb0/Dw2zBO/EUhCc4XHL6VttVW
 2wkXyA6H22Zbrx2rjslo5Xqn29UWHr1TFDRKP4NOt+3cF4S5oAF5BmmHh6+gR+hUZZTc
 SuUnPxQMegd19UIkh2AgPu/XiL2Ij7JB59AN/xZ8eiid2tygU5GZTI0m8NUznWb8gIi2
 yK9LjBUvb3zoS7xjrqCfaawaabAPp6edfQruEo//x9s0wsRUFG/ibuZ5VS13geyPkPJj
 uO4APoelfQDDyNzyKBP3l4z+KzTJPEoIOg3a/TEpLpAPekL4Wuzno5Deg2Vn+Y5Nutow
 PMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUnQK3fSzZ5G7iwVI9pBm3YXBB947i2a3wrqHuTxWSI=;
 b=RF6JW+ctcslguLTuS1yCCf/Rd3tz5Au2f+mBeniXax9kWWg9B2imE7uW9937HP+ikZ
 7RTQOPos22FpL+NTJFn3YbE8TcWWfmqSjDijaqCxqOfP7SSgpmdR6b6ic/v4AwpsNZww
 TVCl8u9Nq2tL3l1+6odt8GRIbCvOwxmnAx2iC3LygdSMae5sOB3bDY/IJKWy88GFNTte
 MB3uZwubZWPRh3dqpdxGlkme0B9pAr/R2pbIdaxdkC1rsUcl/KEdDeW2yP6Usmd+bKAz
 MF0ecJLelP7TXtmLQuxdQs/b6rUp5C9HPQbOfzQV95G9wVFXX+qgP6bxttkHhylxRmNJ
 XwxA==
X-Gm-Message-State: APjAAAXR20rGuvld9M9qloreSB3/31k8AOvecXIPr+yOP0XJdBtYsLC3
 UHPPGidCnb6jfEJTYXqqGkyWwo7l7F4=
X-Google-Smtp-Source: APXvYqyggy825vwcII8G8sIxTSIbnDD8yKTJ0Sv05SWpzsYmm7m1UdtSAbFHiWwAnrhLtvcEDMgP3A==
X-Received: by 2002:a63:e948:: with SMTP id q8mr119830658pgj.93.1564743637219; 
 Fri, 02 Aug 2019 04:00:37 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 24/44] powerpc/64s/exception: Add the virt variant of the
 denorm interrupt handler
Date: Fri,  2 Aug 2019 20:56:49 +1000
Message-Id: <20190802105709.27696-25-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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
index 58bfd4827750..45e9f8bd551d 100644
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

