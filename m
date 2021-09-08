Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E5B4037B3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 12:18:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4J553gB3z304R
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 20:18:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GsTHxmt7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GsTHxmt7; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4J3g3QCZz2yHJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 20:17:33 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id e16so1628226pfc.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Sep 2021 03:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XJL6i+YCXvCo5U+3ydR+e/rNKFY7FEPlcahYujkfk38=;
 b=GsTHxmt7/p0l7lRb3A8EU9YOngEBaP/k7avWA0s8IGPIgRutpXhKuVMVx9hdwn6MtX
 aijnWx0rKArojVNf997GWPApjUz06PzUNhk8jdFUkXur36htDJIM5YokkqLBQZooiAXX
 pYbVwmm43MvFOVLZTKAMG0tRls2km1S6n3KEu/39ALHSwGqEk1Mp+iASv5wWj3yrgZBv
 xDXB9qv2seGhd5wcryuwcSXCc3T/iBCWocoDxAwWUQYLFhQlYQvqTlornNewy5rP3SiK
 BeE8ZkEUstHDTt/S9XHw3he163PtdZdj2rnet2UIPHLKlqUFOYdAe4y1frrnLlLyQK8l
 04bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XJL6i+YCXvCo5U+3ydR+e/rNKFY7FEPlcahYujkfk38=;
 b=tUMSvb7nomZjxekkxnJTJURIJEjRwAWGGjXvTA7wLSzaAxG1xpSBCOh5HXSA/xTuZ9
 nr0qkwGek8CH3lcT03fnXy8U+Rtpnfb2JDRW6gePjKBOE+aff81Pkr3Edh+0wLWWx8Ni
 dN6Gxjlm5nA0zky0v5TSSJ9fiMi2xUE+EP5FXGWZRkHGMjyjwCrNBFswnwJQx/AT0rND
 T30KwUwlblZS9ZYPPKvl7tYWsjzW96tlWT8ZifZhtZOqzxSs92nO3qHxGWRzLR81MCT+
 wlbPlXYz4emZ/OBtA/A3z1Z5hE5yKn5/M4NUpC6CJx2mLpc/K7tEI6bVK1vdU1BR2xg8
 Q+6Q==
X-Gm-Message-State: AOAM5315CASeKUZU3bRd1hPZqjGaRqCeOdW7l9JbWPlYECB2ucrFFgU/
 v/AgXCUSoUmjSoMLmXNw+8fnNviQ47M=
X-Google-Smtp-Source: ABdhPJziM6Ow0sUvG+SQ6pzjdoiUoFSffznbPeovqLT8kJ7D3AiFrv6xbYsegIKORt/mF7lwG/K1PA==
X-Received: by 2002:a63:b40a:: with SMTP id s10mr2986935pgf.481.1631096248831; 
 Wed, 08 Sep 2021 03:17:28 -0700 (PDT)
Received: from bobo.ibm.com (115-64-207-17.tpgi.com.au. [115.64.207.17])
 by smtp.gmail.com with ESMTPSA id bj13sm1722019pjb.28.2021.09.08.03.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:17:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 1/2] powerpc/64s: system call rfscv workaround for TM bugs
Date: Wed,  8 Sep 2021 20:17:17 +1000
Message-Id: <20210908101718.118522-1-npiggin@gmail.com>
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
Cc: Eirik Fuller <efuller@redhat.com>, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The rfscv instruction does not work correctly with the fake-suspend mode
in POWER9, which can end up with the hypervisor restoring an incorrect
checkpoint.

Work around this by setting the _TIF_RESTOREALL flag if a system call
returns to a transaction active state, causing rfid to be used instead
of rfscv to return, which will do the right thing. The contents of the
registers are irrelevant because they will be overwritten in this case
anyway.

Reported-by: Eirik Fuller <efuller@redhat.com>
Fixes: 7fa95f9adaee7 ("powerpc/64s: system call support for scv/rfscv instructions")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index c77c80214ad3..917a2ac4def6 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -139,6 +139,19 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	 */
 	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
 
+	/*
+	 * If system call is called with TM active, set _TIF_RESTOREALL to
+	 * prevent RFSCV being used to return to userspace, because POWER9
+	 * TM implementation has problems with this instruction returning to
+	 * transactional state. Final register values are not relevant because
+	 * the transaction will be aborted upon return anyway. Or in the case
+	 * of unsupported_scv SIGILL fault, the return state does not much
+	 * matter because it's an edge case.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+			unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
+		current_thread_info()->flags |= _TIF_RESTOREALL;
+
 	/*
 	 * If the system call was made with a transaction active, doom it and
 	 * return without performing the system call. Unless it was an
-- 
2.23.0

