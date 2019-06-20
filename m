Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B74F4C7DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 09:06:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TtCg2FjTzDr8p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 17:06:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BHRBJIxO"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqn36r17zDqwN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:55 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id v9so904549pgr.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kZmKdYuz//BUyLDyTXNiXDPLJjSgFKIRUQN4aB4XgaE=;
 b=BHRBJIxO+XYyOBUgVf626bJKrc8IXUJVL602jxNb2GUGjgW8tgzOkSPqqnq19Suhj2
 NZcXgPy5g7HRgOWDyZtTTpA1X8+xWtQqAj8RfCd3cKbFPBm4WpZf/38aY00fITr0pulP
 WmXcauF1qfD0Uw8ShG4QiW0LXk2eyZ9plixcR7poAOvBRB745tKgjaP7t2jO0cfXPaCa
 r5MaCxefNqCnUTaPwH3RvhsE1B85Hggw+tkOBl5T+c8wovCj65iIIV8tKqsk6xUs1R9X
 7Jcq6EHGLj8BRVwD39CiFTpIOYL9So7Kx55n5rEnd6P30SzJPACDUSRMECgewgB9JDCE
 wigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kZmKdYuz//BUyLDyTXNiXDPLJjSgFKIRUQN4aB4XgaE=;
 b=cWR5xu5ly7/aBs0Z8ucOYobpYmXU8pmg7x0PfuJo2JHciQC0ElJjGNKoIU+h8OxOcs
 CrBkqLhwIXA0mWqRtzGVLI6O+mqZcwLfnYAObP6ZhrUf3DH0CzXdm/WTYxkAHWgAVDqw
 yjVWtSezfa+09X/j38qeIg1Tt9JvvMfvCwAbbSL0dbQm8TuKi+hkKzwxGeOYhQ84j1DR
 Gpm0Z15iGfbcrJESXo2331LYSdGsi5Y7bGTo9Em5W/yfcGksnG19dwbbTYpXTPvjBc2q
 3MPO+c0ByoWqUx9o7hj0w0eGZzuv2RzoybOGUcFR5ylVYFrNCPln92A8knuXjH7ScAId
 KgVg==
X-Gm-Message-State: APjAAAXKAj96egT2A7hqZJ3pcsGrfF0nFHU7aHRCMFDCHp1qraLdPXGb
 ctgm55ixkb04cRPZ7+GumYXXR2WW
X-Google-Smtp-Source: APXvYqwiGNnqfXDEclALDw/u1/qStJzi9/CA7o8A21beDdfZmZpjCw1iAL/Is64Z62LshgpX3SVS1Q==
X-Received: by 2002:a17:90a:b011:: with SMTP id
 x17mr1096424pjq.113.1561007813852; 
 Wed, 19 Jun 2019 22:16:53 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 52/52] powerpc/64s/exception: add missing branch to self
 after RFI
Date: Thu, 20 Jun 2019 15:14:59 +1000
Message-Id: <20190620051459.29573-53-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

For consistency. These may not be required on modern processors,
and they don't quite fit with the RFI_TO macros, but they should
be all removed in that case.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index e21bf047156d..cdf7d7ef0c0e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -944,6 +944,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 
 	EXCEPTION_RESTORE_REGS EXC_STD
 	RFI_TO_USER_OR_KERNEL
+	b	.
 
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
@@ -1111,6 +1112,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_206)
 	bl	machine_check_queue_event
 	MACHINE_CHECK_HANDLER_WINDUP
 	RFI_TO_USER_OR_KERNEL
+	b	.
 
 deliver_mce:
 	/* Deliver the machine check to host kernel in V mode. */
@@ -1686,6 +1688,7 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 
 	EXCEPTION_RESTORE_REGS EXC_HV
 	HRFI_TO_USER_OR_KERNEL
+	b	.
 
 1:
 	/*
-- 
2.20.1

