Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA5984F5C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 17:02:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463ZVb1QkCzDqLP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 01:02:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="uyB8j/ts"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463ZNd0P78zDqk9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 00:57:20 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id 4so34213734pld.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2019 07:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wCmmwD53XttWvxo3IyfDIXHfbZJtgpbW8gfsweTknQc=;
 b=uyB8j/tsSzit3NKNl6frCAIzbjxLYgwq157qH/us4cCgDbniSP8u0YjsXYJFHLRLJe
 XfAArNBgUVQvE9F/L3yxnLhUs+jDBwJewdRgiRoq0KXQ1XKO4hBB8nQnx8Iusd95byWx
 h+s9Vpqka6JyUtLZ3LQakBnx4JPY3m8jvwZjGe7md+PhukFp79FHDGnwagpY2RxrmHgX
 KIL8oO2iQY/6ZH1YjBncEqczITFPz19Zo+7qYfFremFmmV34WFndOv3MVCXi2noADWhJ
 A80O0zkkDUdRc70fXZD+GJ+7Z8SxTklgF9EvLamXOEETQl+13uVd5UokuifJUcqqLtta
 u9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wCmmwD53XttWvxo3IyfDIXHfbZJtgpbW8gfsweTknQc=;
 b=MxR3DlS8LM/vkEDEFy+TOywAeorA6ceuxMPYyRsKze6OfT2BIufKnSwuyHZdWrJI7r
 Ey3z7FCPt2sXiJcDzEtlP3fHuYCV9uQrk0q2yIayLzyVq48ym/KdjjSIQP1vuOH7Pd9+
 47JrpBJmoMK/1yuUWn/wX4UzzvguwfQsl3/R2P3zlbx3ZE/oUvcOfz71KSTEgugCIEf+
 +D8Pdg2UXuPJ+eJa5ES2YXSBtW8TnxFp7Kwaqc7rIuQcKjIWPVVA7ugrl58VRwZWSxNf
 JwMDCJaHcxUfvPRdfdqC2J92yV9Byi8rS1MuvzWtmfiitKQuFg6VFq4PPrr2Vzof04HE
 bimQ==
X-Gm-Message-State: APjAAAUNInTtP13QbgSwz1hWpjYbXNg2En35WKJj8qqTQ4RMYsEOs2Lc
 Zh5so9MCfxeEkzicIItbhq5hgifYYh8loA==
X-Google-Smtp-Source: APXvYqwEdtTkYTZY5Lvvefr4X0NqDCNkF1rLMWL7F2pp5Z47593oQIrCYDO/j784NjBZ2G3xux6gFQ==
X-Received: by 2002:a63:e306:: with SMTP id f6mr7928966pgh.39.1565189838910;
 Wed, 07 Aug 2019 07:57:18 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([183.82.17.96])
 by smtp.gmail.com with ESMTPSA id l4sm93617475pff.50.2019.08.07.07.57.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:57:18 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 1/7] powerpc/mce: Schedule work from irq_work
Date: Wed,  7 Aug 2019 20:26:54 +0530
Message-Id: <20190807145700.25599-2-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190807145700.25599-1-santosh@fossix.org>
References: <20190807145700.25599-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

schedule_work() cannot be called from MCE exception context as MCE can
interrupt even in interrupt disabled context.

fixes: 733e4a4c ("powerpc/mce: hookup memory_failure for UE errors")
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/kernel/mce.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index b18df633eae9..0ab6fa7cbbbb 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -144,7 +144,6 @@ void save_mce_event(struct pt_regs *regs, long handled,
 		if (phys_addr != ULONG_MAX) {
 			mce->u.ue_error.physical_address_provided = true;
 			mce->u.ue_error.physical_address = phys_addr;
-			machine_check_ue_event(mce);
 		}
 	}
 	return;
@@ -275,8 +274,7 @@ static void machine_process_ue_event(struct work_struct *work)
 	}
 }
 /*
- * process pending MCE event from the mce event queue. This function will be
- * called during syscall exit.
+ * process pending MCE event from the mce event queue.
  */
 static void machine_check_process_queued_event(struct irq_work *work)
 {
@@ -292,6 +290,10 @@ static void machine_check_process_queued_event(struct irq_work *work)
 	while (__this_cpu_read(mce_queue_count) > 0) {
 		index = __this_cpu_read(mce_queue_count) - 1;
 		evt = this_cpu_ptr(&mce_event_queue[index]);
+
+		if (evt->error_type == MCE_ERROR_TYPE_UE)
+			machine_check_ue_event(evt);
+
 		machine_check_print_event_info(evt, false, false);
 		__this_cpu_dec(mce_queue_count);
 	}
-- 
2.20.1

