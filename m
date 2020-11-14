Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 650D32B2CEE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Nov 2020 12:51:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CYDG11cJLzDqZx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Nov 2020 22:51:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DwS4EHmh; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CYD9X0kk0zDqDT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Nov 2020 22:47:58 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id k7so5800880plk.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Nov 2020 03:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WiJlvsi/QjkRrmqLPl3gJR17Lh9UpGaUd9FQtfJ6bM4=;
 b=DwS4EHmhqFHDBoFQQn8ul2sTMuGUxzd81eCgYrHUd09htwZFs6NXBIbe+bHe9B5Rp4
 Pg/kpZtwOwCDP/LpjmxJ/90JnIHL+V6BW+0qeTUqS1DcOXVFqgCSqRabv7jRPMagXi8O
 VqWK78xTb5u6aUUSEFLpmX4QH4am3c/wV1wzrLPoGTaLz+SEVsYF9nfjlwzKlPQXf+iO
 +b/EcEQ98bZXCDzFdmvGvHIUn4H33e8OXKG55XPYgTmLGLBdIg70GeIQ2917NZkBZDtH
 ZMSwLSNvO0uSBSla/fhIbhdgj5TxoSgNmvh5BqAPiaGUYlKRE/QAZHKKJy/f7eC3GOJn
 XB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WiJlvsi/QjkRrmqLPl3gJR17Lh9UpGaUd9FQtfJ6bM4=;
 b=mNVk0hTxXFWpXyE0uxy2QvI+KZD8wSc/34IzYh7WpK4FILV9ho/qw3HJSbH+US9C5Y
 Cr/QMgAc0tu0CAP1UCM6bkxd+aCE0mrDHGLVmRNXpMVTOQ2BjT5Jtqf6lNtQERZZvh96
 6SOtLwqQNSeFcBnocBZLI6X6fnamGZVINDiNlCJvkBVcKHgosocV7eeEKTekSn7KWK9P
 BMa3ar1mRvGEv4kB1mQoEaalA5x1AwWHvbyImNoqrfO3RoQqV5CUVKsZFV0P7HvEZ74e
 RFTtcTsuknU7S+eMLoVtwbgjRkPd0cqggVdkp6YSyuYaMQA20G4SMBRYkch54urcUequ
 cdHA==
X-Gm-Message-State: AOAM530m+Ah45XndswDczrA0+Hm6CyeYca89GbRceVDdD9vo0K+Sk4cB
 paSjbE5g0GvVKDj0NR1y+IqHTGRpjbw=
X-Google-Smtp-Source: ABdhPJybZ1tk5EZwfK53dSt0e4y/iHtnlvqSd+wjVzJVC3SSVnvFL0r26hcQykTgFR9Xu4WLGyPO7g==
X-Received: by 2002:a17:902:7606:b029:d3:d2dd:2b3b with SMTP id
 k6-20020a1709027606b02900d3d2dd2b3bmr5984993pll.67.1605354473140; 
 Sat, 14 Nov 2020 03:47:53 -0800 (PST)
Received: from bobo.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id e22sm12979922pfd.153.2020.11.14.03.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 03:47:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix KVM system reset handling when
 CONFIG_PPC_PSERIES=y
Date: Sat, 14 Nov 2020 21:47:43 +1000
Message-Id: <20201114114743.3306283-1-npiggin@gmail.com>
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

pseries guest kernels have a FWNMI handler for SRESET and MCE NMIs,
which is basically the same as the regular handlers for those
interrupts.

The system reset FWNMI handler did not have a KVM guest test in it,
although it probably should have because the guest can itself run
guests.

Commit 4f50541f6703b ("powerpc/64s/exception: Move all interrupt
handlers to new style code gen macros") convert the handler faithfully
to avoid a KVM test with a "clever" trick to modify the IKVM_REAL
setting to 0 when the fwnmi handler is to be generated (PPC_PSERIES=y).
This worked when the KVM test was generated in the interrupt entry
handlers, but a later patch moved the KVM test to the common handler,
and the common handler macro is expanded below the fwnmi entry. This
prevents the KVM test from being generated even for the 0x100 entry
point as well.

The result is NMI IPIs in the host kernel when a guest is running will
use gest registers. This goes particularly badly when an HPT guest is
running and the MMU is set to guest mode.

Remove this trickery and just generate the test always.

Fixes: 9600f261acaaa ("powerpc/64s/exception: Move KVM test to common code")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f7d748b88705..07d64883c0b5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1000,8 +1000,6 @@ TRAMP_REAL_BEGIN(system_reset_idle_wake)
  * Vectors for the FWNMI option.  Share common code.
  */
 TRAMP_REAL_BEGIN(system_reset_fwnmi)
-	/* XXX: fwnmi guest could run a nested/PR guest, so why no test?  */
-	__IKVM_REAL(system_reset)=0
 	GEN_INT_ENTRY system_reset, virt=0
 
 #endif /* CONFIG_PPC_PSERIES */
-- 
2.23.0

