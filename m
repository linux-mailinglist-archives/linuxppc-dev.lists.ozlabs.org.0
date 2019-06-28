Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E18659450
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 08:41:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZnGZ1YnBzDqrV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 16:41:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G0FzVLnm"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zn5d42r7zDqlF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 16:33:25 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id r1so2437309pfq.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 23:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7DF6ojBYAmHkDmYe6ocgC5T0eh+wo56rup2w+4XKrIE=;
 b=G0FzVLnm5d9idLiIM405vfvutl1SZ7u9USB81LuJXCTNhpoIze2qfDcRIcfTG+euH1
 Xmd3q3zJAyKwV+6MGg8k7VXQsGKHviIxJnO2qC6dJYZlx11vxqvz5SqEBM+GQZsXV+fz
 g4NPvkYdMHWoLTuW7ke3viPU3Ty/CRIKGr3wvay7ZYDIakgTmvKEkrwOpwJS7uyCMQrj
 AjCRIWe0g1I4UX74bT1zKFNwNtrDyUXAEK37rDfAlx9pNXk7eUxBOMP6lRw27H73MY13
 qfPeaGHf97f/LhFZUVvFYTWbZIIaPgYgmBOgKXeBDi0Vz7nEVmdhbAifG9Jz7YR7qw8X
 TJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7DF6ojBYAmHkDmYe6ocgC5T0eh+wo56rup2w+4XKrIE=;
 b=qlpc6BZqtTmSdDKAocf0jlHDHFAS8/3LaW7t2Ox9FDEbDZLszRnkTQwv5zE0TmSMIE
 t5xjIdd6FzkyThAve8CN6nbxGaf8PFNgJ+j/4giXgY/NY1JXf01mRhq6Fcb/8Cn7//C/
 tKLiWs75gMnkxkgc+HoqAsbEq1Hg6uGqaawRD63I6FvWtRzKN0ehnbSB54s/7uWNTyUr
 C2ZVVWdjMWcwPSLTmy6GjUFn0Aq6V0lIfuqIARSMat4Yrz4HMgVi5oW3hdux4/nP9deK
 R7tTBbvqW+06p1XSUqDZzLGnF6/VRNMIw6jszq356uwxr1HbcfFeP+xW71KxU/tUrM1q
 Pvyw==
X-Gm-Message-State: APjAAAVUKM3LsHQ3G++aeXeGxMNnmKh/+9SrwIsaAWYJIA/Knytn6c76
 6136PJeA4bhNZm87JyiUwn/77lEn
X-Google-Smtp-Source: APXvYqxrDKgFT4x+xLAudH6BaBP5YXVP51kY0dnT7fPORVTKT5HQhrGUnkdFoACkAO8snIZ25zXMMw==
X-Received: by 2002:a17:90a:2506:: with SMTP id
 j6mr11411337pje.129.1561703603456; 
 Thu, 27 Jun 2019 23:33:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id h14sm1071500pfq.22.2019.06.27.23.33.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 23:33:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] powerpc/64s/exception: hmi remove special case macro
Date: Fri, 28 Jun 2019 16:33:21 +1000
Message-Id: <20190628063322.11628-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628063322.11628-1-npiggin@gmail.com>
References: <20190628063322.11628-1-npiggin@gmail.com>
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

No code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 89ea4f3b07cb..23aba27b2f59 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -519,11 +519,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
  *
  * There can be combinations, e.g., EXC_VIRT_OOL_MASKABLE_HV
  *
- * The one unusual case is __EXC_REAL_OOL_HV_DIRECT, which is
- * an OOL vector that branches to a specified handler rather than the usual
- * trampoline that goes to common. It, and other underscore macros, should
- * be used with care.
- *
  * KVM handlers come in the following verieties:
  * TRAMP_KVM
  * TRAMP_KVM_SKIP
@@ -614,12 +609,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	__EXC_REAL_OOL_MASKABLE(name, start, size);			\
 	__TRAMP_REAL_OOL_MASKABLE(name, start, bitmask)
 
-#define __EXC_REAL_OOL_HV_DIRECT(name, start, size, handler)		\
-	EXC_REAL_BEGIN(name, start, size);				\
-	EXCEPTION_PROLOG_0 PACA_EXGEN ;					\
-	b	handler;						\
-	EXC_REAL_END(name, start, size)
-
 #define __EXC_REAL_OOL_HV(name, start, size)				\
 	__EXC_REAL_OOL(name, start, size)
 
@@ -1720,7 +1709,10 @@ EXC_COMMON(emulation_assist_common, 0xe40, emulation_assist_interrupt)
  * first, and then eventaully from there to the trampoline to get into virtual
  * mode.
  */
-__EXC_REAL_OOL_HV_DIRECT(hmi_exception, 0xe60, 0x20, hmi_exception_early)
+EXC_REAL_BEGIN(hmi_exception, 0xe60, 0x20)
+	EXCEPTION_PROLOG_0 PACA_EXGEN
+	b	hmi_exception_early
+EXC_REAL_END(hmi_exception, 0xe60, 0x20)
 __TRAMP_REAL_OOL_MASKABLE_HV(hmi_exception, 0xe60, IRQS_DISABLED)
 EXC_VIRT_NONE(0x4e60, 0x20)
 TRAMP_KVM_HV(PACA_EXGEN, 0xe60)
-- 
2.20.1

