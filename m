Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBDD7F62E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:46:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460QN62N92zDqwf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:45:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eJ4mHbI9"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PMd3zt5zDqy6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:29 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id f5so27077189pgu.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AZTrJ75fwiSKeqtskzr4XIpVQCwpd4JHPmIVa+6R3Ls=;
 b=eJ4mHbI9HMoECAchdtWDWDLmSY8D6zwnap2iuaTkG6t8vbTHu9gA1nTD7U2xiXkiP4
 lHOmeDB4YIIerPprp7pT8pXORQGKU2u/v6nzglbX/M9X6hOYuL8gPfrI4nzxHnQHvQ+t
 OvgnFQDoKeoillNmXzZZLxMf3RRjWUD8YwvFQPqSGmk3+3Cin52dTLc3MrVz5NeGVw1E
 Q3Hth5o//g41qfHDuBNO3RUz5S3HjWWwXW6iA0ZS1lgmpkEjr/ENBH1vZ3zXRaCGi3jg
 tO80ttJBo9QQRbrOumhyK2l1OPFUYSMtE77PAPM/pE9nmb2nLQiwGWlW1N3JRjdCGoJf
 bwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AZTrJ75fwiSKeqtskzr4XIpVQCwpd4JHPmIVa+6R3Ls=;
 b=hlfqm8DwhWIL4UkkH+b/1alqQ1MvSvPaTZB76VXYhmuo7rnyN7W2K6Fz8gAiBztqgI
 eH7YTfAHKefWsReyIOu/j+Vu093dnC/t1DopCjrhiR7X5b0LGLlza518KX2QloLXHzTS
 /VNPwnEWNktdCIdUBx3MzLh5Nzs94oR4StUCo2t0O8vr4/PXZhMAVqu7v0ojgireRX2g
 BsgjPQThgVeeqCiI2pt4fTHRiGl3ZcsuT3reBIQCavpZa8xUOh4lc217fqvkpoIaCMfK
 +ShNU5kxmt20s/r+vMrSoqazhgNyaXOBBeZX1Oc59tsmtDlVwqYED5qiRutxstqeu2VY
 MJPQ==
X-Gm-Message-State: APjAAAWhNOM2fNoaBC84DaS19QAXryutx3VpjZod1WC37tOwB6dLBThu
 JY/4xS9l3GRnGko5HOecUFPKn4jl3qM=
X-Google-Smtp-Source: APXvYqzkOaWx063XFC98BBypOlRlEhqce19YUElp9q2PWlea4/JW9jeTeY03OsH5gFIK/Xvfh076eA==
X-Received: by 2002:a65:528d:: with SMTP id y13mr35591451pgp.120.1564743627669; 
 Fri, 02 Aug 2019 04:00:27 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 20/44] powerpc/64s/exception: Fix performance monitor virt
 handler
Date: Fri,  2 Aug 2019 20:56:45 +1000
Message-Id: <20190802105709.27696-21-npiggin@gmail.com>
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

The perf virt handler uses EXCEPTION_PROLOG_2_REAL rather than _VIRT.
In practice this is okay because the _REAL variant is usable by virt
mode interrupts, but should be fixed (and is a performance win).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 60969992e9e0..723c37f3da17 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -750,7 +750,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 #define __TRAMP_VIRT_OOL_MASKABLE(name, realvec, bitmask)		\
 	TRAMP_VIRT_BEGIN(tramp_virt_##name);				\
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 0, realvec, 0, 0, bitmask ; \
-	EXCEPTION_PROLOG_2_REAL name##_common, EXC_STD, 1
+	EXCEPTION_PROLOG_2_VIRT name##_common, EXC_STD
 
 #define EXC_VIRT_OOL_MASKABLE(name, start, size, realvec, bitmask)	\
 	__EXC_VIRT_OOL_MASKABLE(name, start, size);			\
-- 
2.22.0

