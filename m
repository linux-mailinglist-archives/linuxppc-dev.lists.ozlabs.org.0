Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0414978DC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 16:25:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y25h50Y4zDqLp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 00:25:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XuLK3UzZ"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rF3HHgzDq96
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:33 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id f20so19106744pgj.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ycxDcWZtlkCQ1tMVmSZA/ZfExudWUJUXlte1q489Imk=;
 b=XuLK3UzZxYQz8FLziTlXCJC+9A9WcTAWMJhTmKwV47JEw3Eop4tdltws9/660h4gRV
 04WUU35fG9vIh0Zq+5MrSIrLnatYHrKrSpO64R78fRjC5dsBHh3SlPkbmAnoccwpEW3s
 NBGXkazxJX3NBCTLXrhd1q+hE791iL4KUATHFlllDBHdzRPFEdVStXaLVrEWXfb+VNgx
 UBIBAQL3tsUPKRQx7NlLAzFctNO5F86GxfWldj4NJkM44JGwqqVRbUO887uCKIS00Gqt
 uL315qxvJNiS/+Le0XKUCak2MBB59ra2YVmAHNRHRIAAteAIknKGmErhcC+lqPzutWzK
 wm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ycxDcWZtlkCQ1tMVmSZA/ZfExudWUJUXlte1q489Imk=;
 b=DIkyb4QqQff1CjOVdHZg8ZmtVX/aK/qgflRQk7mt0UM3mZJ4NMNwgFKBUciIDxlnM4
 7bUQ6J20SXDSe1PIFiwrZpfmsTYOANDdOWZp/IIvG5bzbBzh8nOxsx6ZTnRKVBDyXaue
 fbqu/jLuhUMby6uc2RFaG+jX1dA6l09rcNmS59ag/zioCDZZS7OQngdUgytlOyyvB4xf
 Os2BSj3aqPDeChb4LoGFWWSprXBBAgAtfTKQixDrtkzQobPK/zSgFv/KfCq26aKBh18m
 9yPK2TJGLFQIUFE+5XCjudRH21eN97zgA+VzPKv9QrRn6UpHS4XT0BxliluNzDw/2UIP
 ObXw==
X-Gm-Message-State: APjAAAXaBTWf6SekU7D3LdDX9v90BFuWzrP91HeSiMLS7WfDFFlCJOpK
 CJlGBlyhfFOjaNpieqgYxc6Ymrsh
X-Google-Smtp-Source: APXvYqx7VEZLudzzcyaC7YswgB4BUQLLuxTKxwkE6xE0ZZwjOEgM9lRU7pNdU/DK5csgYgv79YNjtw==
X-Received: by 2002:a62:e71a:: with SMTP id s26mr35710540pfh.89.1564409610390; 
 Mon, 29 Jul 2019 07:13:30 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/18] powerpc/64s/exception: Fix DAR load for
 handle_page_fault error case
Date: Tue, 30 Jul 2019 00:12:30 +1000
Message-Id: <20190729141247.26762-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729141247.26762-1-npiggin@gmail.com>
References: <20190729141247.26762-1-npiggin@gmail.com>
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

This buglet goes back to before the 64/32 arch merge, but it does not
seem to have had practical consequences because bad_page_fault does
not use the 2nd argument, but rather regs->dar/nip.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6b409d62d36c..f79f811ee131 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2336,7 +2336,7 @@ handle_page_fault:
 	bl	save_nvgprs
 	mr	r5,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	lwz	r4,_DAR(r1)
+	ld	r4,_DAR(r1)
 	bl	bad_page_fault
 	b	ret_from_except
 
-- 
2.22.0

