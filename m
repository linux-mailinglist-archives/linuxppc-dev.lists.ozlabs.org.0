Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A58532DF800
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 04:24:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzlFb1wpLzDqLf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 14:24:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nxQd8PS6; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzlCQ4WnnzDqKv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 14:22:37 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id z21so5529138pgj.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Dec 2020 19:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j6HoXPsvoWbfaxq9n1rISwRjPcnSAE7rKJ1LgZNR1ho=;
 b=nxQd8PS6vwmDtSRzq/hlkFFjdEjIOUzCsx3Np8csu5lCklaPHZ8Y/yNvcuY+nEja4N
 na9OarOZUD4ZhciV6o8EbnvINk+Qcy+tHjv5C7tDbvzP8uHJ/8I6MjYbQkw6e5IClL1M
 0TRGEHzwdxoJUEjrqSw3Jib2BHKzWOg/DAdeihQdI30M4VkomHzIFbXgI1axl8ghl+bb
 6B80fC9XX+cjyePfYk+NH3gPXrVvD1YGZZFJG2urw9az4oyhPmkuAqDUOZ2hDPsEiDtC
 cKBw2uD10tuplWM5Jg5lbuSjrBfi/Jpv01y9QO3ab5N3trdDAG/MbKN0SuV6XBmyUIGX
 pelg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j6HoXPsvoWbfaxq9n1rISwRjPcnSAE7rKJ1LgZNR1ho=;
 b=DKsyvhF3RtWKEHGBfxiskpNURlrO3y6xp+z+XQFJraeo8hrlVwrbcJkIOnRiN63pmG
 Ah93+boSammEv2ccF4o4dgkcvGKPe8SpMKmsC8Cxg9zyfQ/WMqO0eGkUUymZ/NEI0TKn
 kAa7PH98VTQi/JCYBBTIO2+WyBtEYhGMFogvwC7UDWLNdXuevgtU2sMGKQJdHIwKKt6q
 NXOdAld7KLRRmUVE0vFHdLYD9399YqRIuzjLoh805C6+gYbFeep78lspL1ZTWh8V/GBn
 HysjJn0Kh8EQTZ5x95l7yUPE4jiaFx1pC5fBRsClIKAU3YSqcE3wGYpM5BUoNTxCluJ+
 L3Ag==
X-Gm-Message-State: AOAM531zDhsHTIxX8f25YguiICKCGbnpA1aVuqNUsMK123jIkpc7OgWc
 774U8z99RxMf5UHcD/+GiNNnMyopN+g=
X-Google-Smtp-Source: ABdhPJyokrpZvQXNtbuNa5Be8cltdABEROCx0EgWG5REYZ3D8MlWrMM463IQcc1HxTZPZLQXvzhrNA==
X-Received: by 2002:a05:6a00:1593:b029:198:195:4d93 with SMTP id
 u19-20020a056a001593b029019801954d93mr13535581pfk.32.1608520953353; 
 Sun, 20 Dec 2020 19:22:33 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm13669570pfc.185.2020.12.20.19.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Dec 2020 19:22:32 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: always enable queued spinlocks for 64s,
 disable for others
Date: Mon, 21 Dec 2020 13:22:26 +1000
Message-Id: <20201221032226.888758-1-npiggin@gmail.com>
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

Queued spinlocks have shown to have good performance and fairness
properties even on smaller (2 socket) POWER systems. This selects
them automatically for 64s. For other platforms they are de-selected,
the standard spinlock is far simpler and smaller code, and single
chips with a handful of cores is unlikely to show any improvement.

CONFIG_EXPERT still allows this to be changed, e.g., to help debug
performance or correctness issues.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ae7391627054..1f9f9e64d638 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -255,6 +255,7 @@ config PPC
 	select PCI_MSI_ARCH_FALLBACKS		if PCI_MSI
 	select PCI_SYSCALL			if PCI
 	select PPC_DAWR				if PPC64
+	select PPC_QUEUED_SPINLOCKS		if !EXPERT && PPC_BOOK3S_64 && SMP
 	select RTC_LIB
 	select SPARSE_IRQ
 	select SYSCTL_EXCEPTION_TRACE
@@ -506,16 +507,13 @@ config HOTPLUG_CPU
 config PPC_QUEUED_SPINLOCKS
 	bool "Queued spinlocks"
 	depends on SMP
+	depends on EXPERT || PPC_BOOK3S_64
+
 	help
 	  Say Y here to use queued spinlocks which give better scalability and
 	  fairness on large SMP and NUMA systems without harming single threaded
 	  performance.
 
-	  This option is currently experimental, the code is more complex and
-	  less tested so it defaults to "N" for the moment.
-
-	  If unsure, say "N".
-
 config ARCH_CPU_PROBE_RELEASE
 	def_bool y
 	depends on HOTPLUG_CPU
-- 
2.23.0

