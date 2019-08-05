Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5828123B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 08:26:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46278P2DHXzDqXr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 16:26:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="OFrfSNcS"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46273h73y5zDqTT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2019 16:22:40 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id f17so35089015pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Aug 2019 23:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wCmmwD53XttWvxo3IyfDIXHfbZJtgpbW8gfsweTknQc=;
 b=OFrfSNcS5B23jmgGaxKhHDxaRdtfG9Z/9t76o5z4mnZtYlEYQ91YZ0dKJbAEJlOi7Z
 g9KAI8tTJyy2tACIQe1DM1eKsOxnDmkMbQR9/o9sxMHYfzT21wmvfdQ3Yza1W6T0Ww5w
 wmTuD3Z8XKNFh3q3SRiWrAQ6pHlK5Zi4dMiPWHqRtIQYEE2DSe9trD/Kt5MGoDrriPU+
 OvOomkWC9/VFXvYAvQDqQbkppeE2qBMjBtXz/QXCTgxcCMn1wTnkQVLCcrJVFqrrJWSE
 0yl2BL4d7pszaUvl09p/k3KPNV+klnoAksnyhx3a4k5KXF4uhTrnf7gGlb4TOGRIvXT2
 iY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wCmmwD53XttWvxo3IyfDIXHfbZJtgpbW8gfsweTknQc=;
 b=gMN+xO2gVzCK4WOE09joWQWkNcpatNjrQ5ovm5AXkTEjYGjLRLYY3YmSjE8kD40sem
 uo1owfhzvsjpUHfOt51s5EvMSEeHGMLbZ8my2R/hsSt03y1Gyv9YulrwNG6b+MyJkBum
 qUARYZCjmWqXiMnZzMVV1qm7FHM0vliXJCTaJmBZWHL/OXvMvpAr0lQCJOWE13gMIBWF
 dn1+dz+6tBJXMEcZwTSjjkLyarbKKM3/wsrQD76Fs1iGv93s4XxDV4kLG1SnYfiLjJ4S
 2qUt7g7upAls759QSKRLSnzquPPKOuUJNjX2/vifH+Xxx/WHy/8CxEAPX4NqbFNqzO3T
 4Qmw==
X-Gm-Message-State: APjAAAXRauQj6ElMjY18DP7yTcnig6QCoOe/z51Zp6hci0suFQo9AmPH
 s26+uYDl937OWmBwxy0whBdzw6GsvkUcXg==
X-Google-Smtp-Source: APXvYqzhpCMHhcko/8qLIOGOygFC1h7OUS2KmJMEu13blLA1da/lJtYyGUdGlWhX+fadRuZLVXRKgQ==
X-Received: by 2002:a17:90a:8c06:: with SMTP id
 a6mr16996434pjo.45.1564986158367; 
 Sun, 04 Aug 2019 23:22:38 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.66])
 by smtp.gmail.com with ESMTPSA id i14sm124680082pfk.0.2019.08.04.23.22.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 23:22:37 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/7] powerpc/mce: Schedule work from irq_work
Date: Mon,  5 Aug 2019 11:52:19 +0530
Message-Id: <20190805062225.4354-2-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805062225.4354-1-santosh@fossix.org>
References: <20190805062225.4354-1-santosh@fossix.org>
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

