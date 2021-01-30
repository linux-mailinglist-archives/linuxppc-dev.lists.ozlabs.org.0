Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4203095C2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:13:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbm06JPHzDq99
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:13:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s4PfCoIh; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZM10lrFzDrTg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:20 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id x9so1184597plb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6vo8AmiGX+ifb3NTSudBL/B4dXoNXEYykHe52+RgyYs=;
 b=s4PfCoIh5WHeQtm+L+KGpalnIUtJ2UzK0SuB+2A+RRfISGNNYuAzHV1SO9a6DxHjfD
 e8OzuXwk5XTzFx9xpXoVs2qhswftqBPFX2qZfdobUKe82cMcGoEzZ2PU87OfeLLWpEQQ
 Z3xzt0jPQ7U5Pbx+UkXS8DBpCAqEToISwwMboiG+ppRMI2x3pK+WoW0DuySHqBie0Vxx
 vAxZInbeUs0WlJeVqb0hPESMKN/mokCYg2x4a+TQHFIUrLH7008MoKaGSA/sSKQAYbuh
 2A5sXDawJQSWIaIYxSOBQFKBOOGkp/ylso7Q20cu/WObOl7HeBZarmUTNRc/AkXId0ny
 cZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6vo8AmiGX+ifb3NTSudBL/B4dXoNXEYykHe52+RgyYs=;
 b=PwjqKpDfljwo7gkrIYQ8PYlIvBM91sSfQJw7P2nJqHY6ZyXk6/SrRYzRdMDZzGctov
 JNC8wyHY6HLAIIFlo9UDNBvxbolTSOKrMVRoj+wwDHQOt4NVio0Ux1nyifFzqa4D5B+P
 YdyhXMCJoWUl5/A1QM5tQwdWzH3HJt5mYOfAgR1w4Qrt5c9NDrz1mMpcHloG/6t/HS+3
 /Uho/r+6BpvCwbsZMp2P3fVSjliG8piZfxFd55g0EDOYYv0dCuYPp9KOJiS2xxbx+Ikx
 AfCA5elFfjvcF/kStOVYnYs0kw8mElk1HhPcL8SNUXmrymbEhrWE1GAyewprSwak0zQr
 dxoA==
X-Gm-Message-State: AOAM531k9qOAD+O4XE2VqxRECFHpr1jK54RtLsjUBSCm0puo6LJ7K1RG
 0i/DYsYpPpjAG5qa+aSTEuFB32A9TSk=
X-Google-Smtp-Source: ABdhPJw5Ag6qUxhp8PXX0VskNbVZgCwCt3cZb/v4m/YIXi4FzYmx0lsacfaOlU967ki/mPpeB+SOVA==
X-Received: by 2002:a17:902:d686:b029:de:7845:c0b2 with SMTP id
 v6-20020a170902d686b02900de7845c0b2mr3791866ply.11.1612012216499; 
 Sat, 30 Jan 2021 05:10:16 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:15 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 22/42] powerpc/cell: tidy up pervasive declarations
Date: Sat, 30 Jan 2021 23:08:32 +1000
Message-Id: <20210130130852.2952424-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are declared in ras.h and defined in ras.c so remove them from
pervasive.h

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/cell/pervasive.c | 1 +
 arch/powerpc/platforms/cell/pervasive.h | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/cell/pervasive.c b/arch/powerpc/platforms/cell/pervasive.c
index 9068edef71f7..5b9a7e9f144b 100644
--- a/arch/powerpc/platforms/cell/pervasive.c
+++ b/arch/powerpc/platforms/cell/pervasive.c
@@ -25,6 +25,7 @@
 #include <asm/cpu_has_feature.h>
 
 #include "pervasive.h"
+#include "ras.h"
 
 static void cbe_power_save(void)
 {
diff --git a/arch/powerpc/platforms/cell/pervasive.h b/arch/powerpc/platforms/cell/pervasive.h
index c6fccad6caee..0da74ab10716 100644
--- a/arch/powerpc/platforms/cell/pervasive.h
+++ b/arch/powerpc/platforms/cell/pervasive.h
@@ -13,9 +13,6 @@
 #define PERVASIVE_H
 
 extern void cbe_pervasive_init(void);
-extern void cbe_system_error_exception(struct pt_regs *regs);
-extern void cbe_maintenance_exception(struct pt_regs *regs);
-extern void cbe_thermal_exception(struct pt_regs *regs);
 
 #ifdef CONFIG_PPC_IBM_CELL_RESETBUTTON
 extern int cbe_sysreset_hack(void);
-- 
2.23.0

