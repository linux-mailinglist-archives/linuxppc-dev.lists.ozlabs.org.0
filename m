Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C09663454A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:07:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4CrZ5Hx3z3d9c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:07:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FGNL+DDj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FGNL+DDj; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Cmc13fCz303y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:03:44 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id u19so10035904pgh.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E62+LHQ2c3n0CwfIPm7B0azJ78zQw1H69t0RKah36K8=;
 b=FGNL+DDji348jx19Mn83RQEvXoK9PZX4LHGN9OB2tifdm1iiqaskd8lLQexxSs6rD3
 y426id3egK9kMx4AQ+2GW2Uj1255cPwJKv/3qmX90KYu9XCYsk5gjMNdh9Lv0gzUXXCn
 htQY2xlf1gUDU6u9w1ZqVMNdL3w1E/XW+0K6rCY/NRtDGbmHCT3KBPoTWrNXnpUirLrp
 JEc6MjDJ0AbcALi1vICljpBLpOcoHwxev8rY43IRn4bcFjkQdMZWzRtFC8YG6s+RBjGl
 zRgMV1ASZ2iZiaPN2WhlNwufKDe7uQYgUPYYYc+mc5QDdjiHxW82PqDxkWEZJQalqaK+
 63Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E62+LHQ2c3n0CwfIPm7B0azJ78zQw1H69t0RKah36K8=;
 b=hf7Trv+5nFVUzoki4vA9L7V8O5uuSCWlsEbba9bHiEOONurT49iNm9JxRRi0O59H5D
 suFkXPD6scI57FfbFBZ/Dxuvf4m0xZ+OHZzOzDW5wWZ3HDY/J7Ydgk0Ewkrc/qo5xXaY
 OhwgWdbSwA34x8DqAA7DKT3lcQcDYozKSHIyCJUeR3RNPKy31qZHyzXz3nA9AHzPzHhd
 V0ynzWUwh5JD4n7JIc8bH5jI+el1xu+xiGN3Klw/G2IF/95qM9NLmklGm6EBz9VjMjbk
 LAMn7lFRfjG+Ha4EJnnr5rKRtb97KT6UygC3CwXqf1y9gIy+1E+xysIFFYXU7Vu9jbRt
 z4Ng==
X-Gm-Message-State: AOAM5324rosfeVlcFedhGanSJKsfMIY766N/xx3h6+xCaruLNnzFzILV
 TMa97hIUOnZWiBOFP61ZM1I=
X-Google-Smtp-Source: ABdhPJzBWL1NGfct+hRKcUIZhRgaHW3RPyLNqSI7XuEWacyfeZMw/kip0J0vuVktC8LArrMpXMrQag==
X-Received: by 2002:aa7:9984:0:b029:1f8:b0ed:e423 with SMTP id
 k4-20020aa799840000b02901f8b0ede423mr1976227pfh.81.1616461421971; 
 Mon, 22 Mar 2021 18:03:41 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:03:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 08/46] powerpc/64s: Remove KVM handler support from CBE_RAS
 interrupts
Date: Tue, 23 Mar 2021 11:02:27 +1000
Message-Id: <20210323010305.1045293-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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
index 8082b690e874..a0515cb829c2 100644
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

