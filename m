Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FEE3250C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:48:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmYzC3JJgz3dHL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:48:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HhY4kn+4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HhY4kn+4; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYxd1GtQz3cYg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:47:17 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id l18so3560893pji.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PQ5MsB/7FGz/hp4mvby/IngotkcaBU3resUOZZYOYwQ=;
 b=HhY4kn+4A52rg4eUJqgs1XKXan9wsa8JPqLC3eA0f+yqOdX2ZpkIqvbuN/g77kpbkD
 sPosXd4uKndvPb0ihaPDv7+wXzvO7bTKNf4+YOQfFXFg7WlCjbNtZyLVMix4LhCNq1MS
 TcnJOg7D1xW1OLTdamucwA0lIJb4V5zOiCYse5gp17AH+N+61tdX5Ylnd9zCOKDnjtIK
 U+gPNs+IUnsZzg1XFxNslhW8ra5VO7msMCPm2/u+I8PgeXXbsQcKn8EE+J7UkvBAekM+
 WfsDSIr5hEQQd+35KEtOInM7B1WUn8lNrzuUDVox84JVfLnQjSyL5ih6W4WeXJfj0nJd
 1/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQ5MsB/7FGz/hp4mvby/IngotkcaBU3resUOZZYOYwQ=;
 b=nc4+y+NAdZreg+Yj4/ckoRtztSHogT1HnHZoaZyrqKqA2kQ1b/Un5wDPBR9HUg3l1l
 P/J/zfxBsjtpzu6JcLXIj1aoEbffFoelRgwCNaWlZaR/N2+v9dZtRykIwcz6bHlH1fEd
 b++9n0wvLT5MVR3eNm6UwM9nAu36yD3BiBzCZzUClS+w1Tn26jikr4t2BU03G9xxJz+Y
 RDwvmFEJNFdMxLMeGuoyHlSMMqq61efaGVnAHy9UNo6f5ZdKbInU4Isp15ScTI6gCCqS
 QP/qGbz1hPpbPR9cg55xuYDznzZ4O6DD8hzu32zzkf9QshiHwnRKoroV83pqZaOgaAZt
 8v/Q==
X-Gm-Message-State: AOAM533pYUxBFS+xaw3VRVMkC5OrZF7o5EfxE4UcDhbC4yH0XWk3+tuF
 WnuFA42kcrJBir+nOqwYbx4=
X-Google-Smtp-Source: ABdhPJysSqXiQZVbglCTK6LYw197cPu65igol+mtRJ9WMgCDydIOdFnpcLBayFgC7m+/QntFqOgZKQ==
X-Received: by 2002:a17:90a:5302:: with SMTP id
 x2mr3506949pjh.232.1614260835067; 
 Thu, 25 Feb 2021 05:47:15 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:47:14 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 03/37] powerpc/64s: Remove KVM handler support from CBE_RAS
 interrupts
Date: Thu, 25 Feb 2021 23:46:18 +1000
Message-Id: <20210225134652.2127648-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cell does not support KVM.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 60d3051a8bc8..a027600beeb1 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2530,8 +2530,6 @@ EXC_VIRT_NONE(0x5100, 0x100)
 INT_DEFINE_BEGIN(cbe_system_error)
 	IVEC=0x1200
 	IHSRR=1
-	IKVM_SKIP=1
-	IKVM_REAL=1
 INT_DEFINE_END(cbe_system_error)
 
 EXC_REAL_BEGIN(cbe_system_error, 0x1200, 0x100)
@@ -2701,8 +2699,6 @@ EXC_COMMON_BEGIN(denorm_exception_common)
 INT_DEFINE_BEGIN(cbe_maintenance)
 	IVEC=0x1600
 	IHSRR=1
-	IKVM_SKIP=1
-	IKVM_REAL=1
 INT_DEFINE_END(cbe_maintenance)
 
 EXC_REAL_BEGIN(cbe_maintenance, 0x1600, 0x100)
@@ -2754,8 +2750,6 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 INT_DEFINE_BEGIN(cbe_thermal)
 	IVEC=0x1800
 	IHSRR=1
-	IKVM_SKIP=1
-	IKVM_REAL=1
 INT_DEFINE_END(cbe_thermal)
 
 EXC_REAL_BEGIN(cbe_thermal, 0x1800, 0x100)
-- 
2.23.0

