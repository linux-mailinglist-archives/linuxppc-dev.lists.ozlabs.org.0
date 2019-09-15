Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D772B2DC7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 04:12:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WCZ23GBKzF5jC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 12:12:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DDVc0xh9"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBcQ4xjszF5qq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:29:26 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id u72so17250980pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gJAUKxCQTNahi3b9/5FUNegnVO7BJ4flGpKowGG1AwQ=;
 b=DDVc0xh9v/MCluwZCmpdWquIbsekOXbUaDJZS4Qp+Cxd1OnlHn70/bhrLker05MV6d
 sdnbas521jFW/QNTORoAlk6ab3mbSp7L/NTF4Dc+fNQhPjnh36txd9GVrNFFHqXk/UUD
 7jVk0P5ClM40acf1BPaGgc2oWrTRtNQSSvlGvbipMttWyUYtGduQEyTko0GyRsjroVtk
 fZ/RyPyjaXXMbuYDv6lpaak5QVxyqLXyr8Zb5faPXOPrOb5lpduoP/06k2OHEbLAoiV0
 W3Ind9aX7bvqE/zIqEUG6oJlcXuET0ZKYwu8xfCm26nsxKE9reYhFuqquvEWknNHPnDZ
 0KAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gJAUKxCQTNahi3b9/5FUNegnVO7BJ4flGpKowGG1AwQ=;
 b=PWZQNx6HFasRL4S9Ii7F8nkRpnSBTMO2kEw9kqwZHZdwhlqrwoTMHOzi6MWJYkoHiR
 x4u8mGkM+uPVW4BXHTX4vZniPpyAVChF4oNtYEKgrDrIXwRMapDNkM5IY316yWfHIa/2
 iTEbL5aJLia9q23LhPtRmwoulRu2KkxCUi7p67A03/d623fI8WGOmTmLryD8IkUoFN5I
 20pRB9SY8FNEt1c1ucMbv4F9U4nnPvpsH3TdkkpBzcplFTvPdzCkJjXkdmRPE/Ze3U22
 MEjoOmnKwqXlV8IOVFBa20Zl3k25qK8XRW3LdhOayYR0sfrUFFTJNkRc4fX7v+nUdWpe
 C4fA==
X-Gm-Message-State: APjAAAWZMesvozt0z232RLncEc94FjVXUrDPCMnUeAnOXwEoo4qX8b+z
 Uf2nSOyYMpzgg4zzeHFUnfZu25EV
X-Google-Smtp-Source: APXvYqw2HxaU7SH4jSz0flmz+IIduduyUp0F7iqADXnDlFsjxqHUs8H/hT1bS1okR8EpZA5ZDR6XkA==
X-Received: by 2002:a63:d002:: with SMTP id z2mr51147224pgf.364.1568510964388; 
 Sat, 14 Sep 2019 18:29:24 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:29:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 21/27] powerpc/64s/exception: soft nmi interrupt should
 not use ret_from_except
Date: Sun, 15 Sep 2019 11:28:07 +1000
Message-Id: <20190915012813.29317-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915012813.29317-1-npiggin@gmail.com>
References: <20190915012813.29317-1-npiggin@gmail.com>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The soft nmi handler does not reconcile interrupt state, so it should
not return via the normal ret_from_except path. Return like other NMIs,
using the EXCEPTION_RESTORE_REGS macro.

This becomes important when the scv interrupt is implemented, which
must handle soft-masked interrupts that have r13 set to something other
than the PACA -- returning to kernel in this case must restore r13.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 38bc66b95516..af1264cd005f 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2740,7 +2740,11 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
-	b	ret_from_except
+	/* Clear MSR_RI before setting SRR0 and SRR1. */
+	li	r9,0
+	mtmsrd	r9,1
+	EXCEPTION_RESTORE_REGS hsrr=0
+	RFI_TO_KERNEL
 
 #endif /* CONFIG_PPC_WATCHDOG */
 
-- 
2.23.0

