Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A770D3BC5F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 07:13:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJrLd4L6pz303j
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 15:13:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Y3r+P8ek;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Y3r+P8ek; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJrLB1jx1z2yLq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 15:13:21 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id h4so20305627pgp.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jul 2021 22:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGEIoRo5Dp7AVnpJdAEGBYvPI2Lzg0XOuBunjectvb8=;
 b=Y3r+P8ekYKtJkS3l6XUrImvvUqye5WZg4USvMxXHC3Vdvj0E1uqLBSiI9a7l8QNHf3
 g8+vKa7V0smnyxx//wwd3aqgCplTECq7BbdDn21lPo6tHksYWXikMQZyFm2VVw9W5PWp
 pPXosboBPyfsZA7IBr3fJd4fW/AY48y48reSRzbz3i+KNB/+tDYhAKLJ7em3Fu40eu88
 9I/FCQ3DGkMxrnPh+bE6T709VHPB4ZSt3SKG9HXv88BfANHxGhGlp5bzBpTBbuEg2c0K
 4JhwFXBe17nWpiymDwdhhqeYd+zqdRQj6hmKK/G6nktqmBv/reab6eybWeok6lQZ5GhB
 sP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGEIoRo5Dp7AVnpJdAEGBYvPI2Lzg0XOuBunjectvb8=;
 b=ENbVlsvl0PsS9OhZuAzveGqymDOfdKU/hI9djwVcrzwmMAbFHlwT+MqY6ZxVtimotM
 4gP0UREQ9/vAaeRQCRxmerF1IlKpRhZKU4jL/t91ou8MY2OssmegKxE5+Rp2E3YOGxif
 zcRGdBxd9NNZvW7HJjOhgiXbn+3Tq7tBDUf5sT0vADEE4D/IH7YSENKNJ7VjooTdVaEw
 Yk+/2HjY3viv9pK95eBuetvTDG3bcgHFjXx3xMRpJm7EQteneQzTXLFO2CQdH2I4nmyz
 i65R+Q3akpYtaZgqpYl/HYscnPFhLmxWaJU1irjzZR+V7P6Otmbd6/JaFdL5K9TlyWs3
 8R7w==
X-Gm-Message-State: AOAM5312VKNvCNtKt9IyHBwRP9p9wxYwKSzIPKeWeXeb5hTthb4MC7rR
 kGg2nx12R1uduWlDt950jiAXSVbwKamPTw==
X-Google-Smtp-Source: ABdhPJwWVnsji0e8J5nwY8j/S584NbTZ4c5tAZDcE1JRMrOnJ4lrEC73YibUWuHMC4/cXX4KJ/jb/g==
X-Received: by 2002:a63:f750:: with SMTP id f16mr17667602pgk.292.1625548397844; 
 Mon, 05 Jul 2021 22:13:17 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([202.168.10.200])
 by smtp.gmail.com with ESMTPSA id f17sm1180338pjj.21.2021.07.05.22.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 22:13:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64e: Fix system call illegal mtmsrd instruction
Date: Tue,  6 Jul 2021 15:13:10 +1000
Message-Id: <20210706051310.608992-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

BookE does not have mtmsrd, switch to use wrteei to enable MSR[EE].

Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Fixes: dd152f70bdc1 ("powerpc/64s: system call avoid setting MSR[RI] until we set MSR[EE]")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This wasn't caught by QEMU because it executes mtmsrd just fine on BookE
CPUs. Patching that reproduces the problem and verifies this fix.

 arch/powerpc/kernel/interrupt_64.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 4063e8a3f704..d4212d2ff0b5 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -311,9 +311,13 @@ END_BTB_FLUSH_SECTION
 	 * trace_hardirqs_off().
 	 */
 	li	r11,IRQS_ALL_DISABLED
-	li	r12,-1 /* Set MSR_EE and MSR_RI */
 	stb	r11,PACAIRQSOFTMASK(r13)
+#ifdef CONFIG_PPC_BOOK3S
+	li	r12,-1 /* Set MSR_EE and MSR_RI */
 	mtmsrd	r12,1
+#else
+	wrteei	1
+#endif
 
 	/* Calling convention has r9 = orig r0, r10 = regs */
 	mr	r9,r0
-- 
2.23.0

