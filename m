Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BF72130F6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 03:23:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ycg56f6WzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 11:23:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ix7QrYTk; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ycb53lWszDqkZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 11:20:17 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w19so1308673ply.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 18:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pmg18ZVtz+aHnPcYNR/ar+KZfsU0xgw5dZN9uFapXrc=;
 b=ix7QrYTkhbDElBDQK97dD1ZIli7OvLW/q7YCa37dgxZSpEvoqvj/NxJqsufWECEq3S
 XSXfix0vvdAjZrZo/tEINlw/lEf9zvilReHVhtnVH+m30hJKBgbcMQkV1J0aWFUbb5KI
 mVn4lAk/ruolbBf+cVKfHymLp1+q2DDJ4S7C48wPGgVaHq3Z4QHjZkA9OxLHA3sEivvx
 3wHYXv0G89NH3Ct7j7NZBHWcqBJ+tG9nSD8QDzP8Y5oJVWCgxwSKjpHutopLdgqblx73
 lKyGbJUndXKYW4TSufT1Ci6JX1PVnu/D7zg9L0k8Wh1+WQDpqcqPHRe0ZH7oOYNzjvr5
 5I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pmg18ZVtz+aHnPcYNR/ar+KZfsU0xgw5dZN9uFapXrc=;
 b=uOg7x/zkF0WbwTZ0LnYjK11KRfS81ynctvMkveve2uwwY2RpMvuL8kS/s/NfhAGgA5
 W8XBvVWSaO9tz/lrlRoBh2f2ZheU2CKo3a4hu2n6FFxR4qJoXmIJjxInFQUDhFwQI5K+
 FNyvEgiJ8UexKO52X9REYZnN4V8e8D8In8aUxi5gGpkUlsBHs5gLsFpAL1azjWaOWFLa
 Yw31SGda4Bpfu3IruRcPFJrk2z28tVgxKnKYPIA1Yn4MTChc65SpmTTQyM5X7hn8gyhM
 4xJdsMuS4EZl9eL08GachlQjHMI9Ox1RUQ3E4mF053HZe67UxOPgQoWbW8+1TVi8DhYX
 YNkw==
X-Gm-Message-State: AOAM5311Zf/ub5gm1ZnfZ/PBkOO3l4HE9eZnL0JgzG9lX3ESuPqgLVTN
 af6gNJBNCzDh/drXNQss8AP5XtTj
X-Google-Smtp-Source: ABdhPJycoMHaJ6keUkaICJE+J9qDkLH3KGkWOscF7Ui+Q5MY7bumj4st46Jo8k4jaioh/RUFY3o5GQ==
X-Received: by 2002:a17:90b:405:: with SMTP id
 v5mr10594146pjz.226.1593739213943; 
 Thu, 02 Jul 2020 18:20:13 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id v186sm10094222pfv.141.2020.07.02.18.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 18:20:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/3] powerpc: remove stale calc_vm_prot_bits comment
Date: Fri,  3 Jul 2020 11:19:56 +1000
Message-Id: <20200703011958.1166620-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200703011958.1166620-1-npiggin@gmail.com>
References: <20200703011958.1166620-1-npiggin@gmail.com>
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
Cc: linux-mm@kvack.org, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-api@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This comment is wrong, we wouldn't use calc_vm_prot_bits here because
we are being called by calc_vm_prot_bits to modify its behaviour.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/mman.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
index d610c2e07b28..4ba303ea27f5 100644
--- a/arch/powerpc/include/asm/mman.h
+++ b/arch/powerpc/include/asm/mman.h
@@ -13,10 +13,6 @@
 #include <linux/pkeys.h>
 #include <asm/cpu_has_feature.h>
 
-/*
- * This file is included by linux/mman.h, so we can't use cacl_vm_prot_bits()
- * here.  How important is the optimization?
- */
 static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
 		unsigned long pkey)
 {
-- 
2.23.0

