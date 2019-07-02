Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 351EE5C96B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 08:40:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dF3w4thyzDqTb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 16:40:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="uLwrvlss"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCH224n5zDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:19:58 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id m4so7097646pgk.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XB8JDWrvxOU6U9PteJneZ99ibbyNeJLhwtOQI5zxxaE=;
 b=uLwrvlssgRZUCY1wQG4PVSd/VBD/UwP2wv6Ug5qyOaZW4qipGf6CQU9n6s5+kRzh/W
 LqxWTUIwTNTB3jZN2oI8grq23pisVKzcxRYvojdE+jtfdZmDKKhkXDjS93FMJOeJYrwb
 1ej4gUnWk2uXfBUihQxS5+hPhZa4eUFYtcB8dsxFjSpGskob/ARWnA/jJOiWTV+JKIw4
 5p70GXH4mZPUkhdIR5ZhydaemcnrEPSKqG87UUfi1KpGBhEw3wFH5bizg9rIeuAV+DZS
 9DiwPf251WGQizLdexk7Rv5M9GklUS3iRjqGM0wo6m4VRmks/4hGFLHZOinHv7y6Pbth
 ZHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XB8JDWrvxOU6U9PteJneZ99ibbyNeJLhwtOQI5zxxaE=;
 b=ObPY/XeMyKCXZtjHm7UuANMR5Gf7n7sqEy+5Gd5NRxTt7n3gew2TAzdHblVZkswLRo
 WTHmnU8adyp4kWzxxK/odosyJzUmq+Up40kWbrnRWbwSvHUkiMgp5/rXzDr3wNMFcOkN
 Y3YwnJYQGqZAXyQylyQWIHJJ7Vhwqt7sLkxeEDq9i4G/JbS6kUGyNgH1p02q8RJvmWtZ
 +3Iop/ngxQ0yAN8P5hWRrnl+xgPOwl0Hovjk5gkOMY1AZgdbw5tBVCztCOEk5ts9KeaK
 s5YBJQSYk3bDCMRiQjx4VF4GMKOlX1zy3zz4IZyABPGYW41xQuhMW1QqOG+bnLwSdgCo
 J0Kg==
X-Gm-Message-State: APjAAAWX2UUYK27dJZZSXSqUi/hB8P6H12OLL297ItUAljOSdX+WF3Ts
 doIhI+bkcCuvZJ12wQRM3KBXeCTQWJ8lIw==
X-Google-Smtp-Source: APXvYqxDXxLz5GXJiALnMOWknaYdHpPL80OSU5ZijvTCgheKQnHqmIaqACP4QagdQLIxY40gWghH3g==
X-Received: by 2002:a63:18d:: with SMTP id 135mr28749774pgb.62.1562044796233; 
 Mon, 01 Jul 2019 22:19:56 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.67])
 by smtp.gmail.com with ESMTPSA id t9sm1106898pji.18.2019.07.01.22.19.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:19:55 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v2 04/12] powerpc/mce: Move machine_check_ue_event() call
Date: Tue,  2 Jul 2019 10:49:24 +0530
Message-Id: <20190702051932.511-5-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702051932.511-1-santosh@fossix.org>
References: <20190702051932.511-1-santosh@fossix.org>
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

From: Reza Arbab <arbab@linux.ibm.com>

Move the call site of machine_check_ue_event() slightly later in the MCE
codepath. No functional change intended--this is prep for a later patch
to conditionally skip the call.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/kernel/mce.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 24d350a934e4..0ab171b41ede 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -156,7 +156,6 @@ void save_mce_event(struct pt_regs *regs, long handled,
 		if (phys_addr != ULONG_MAX) {
 			mce->u.ue_error.physical_address_provided = true;
 			mce->u.ue_error.physical_address = phys_addr;
-			machine_check_ue_event(mce);
 		}
 	}
 	return;
@@ -656,4 +655,8 @@ void machine_check_notify(struct pt_regs *regs)
 		return;
 
 	blocking_notifier_call_chain(&mce_notifier_list, 0, &evt);
+
+	if (evt.error_type == MCE_ERROR_TYPE_UE &&
+	    evt.u.ue_error.physical_address_provided)
+		machine_check_ue_event(&evt);
 }
-- 
2.20.1

