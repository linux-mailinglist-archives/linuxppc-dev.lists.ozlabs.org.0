Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C0F49F6DB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 11:09:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlY8G07QPz3cJ9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 21:09:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b56girLI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=b56girLI; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlY7d3Tx6z2xD7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 21:08:28 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id n8so10758692lfq.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 02:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pPIs9YPGDV7k07cd7jFYYkWNGuS5b4mzeWo4flha5rw=;
 b=b56girLI15IIsF4oK/Hs939t9s4O1/gcc0gOszxgrp+bUH0aFjNsQfRUDBc6B9OzDP
 F3Li62qBgvSbyeCOA3SlwWxvfsFKm3vzvyTxJbhduyYBCyLgv2CNuYX0oeRgCps7KqKY
 c0+k5HzbbT2RYg1kmKNmlf4BBtetBbDEDhLAIvh/+KeA1CqtgTiOrjVgu8nH1VWM4ekk
 ZkpR07ArNRdSlIjnVlQl8rdf+d1gxMrkRN36sXO+pjTpxL/0jcUad7FTM/TuYzHssyW3
 d+MiBjcMQ5pUdfnBWel/+FSS37EcK7l2mg9tlxiPQA3C+P8L7wjdQaX0yLlJ8oR9YPoG
 hT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pPIs9YPGDV7k07cd7jFYYkWNGuS5b4mzeWo4flha5rw=;
 b=GicVotj+Mg0cUUiSF0+3iwHKOAQEsD8i332aHrcYjz8c2M9bEbEniymmg54KgTLM7L
 UajxI2y97xCWEeSnjAaZawbDJYQ8nyh9ZQT0R0ZinEAfz0XGsfiMxGSdeA/H98f8DpP0
 SgKIzPJeid9BZxSe2jjMlJiqNNqdl3LKiv3rSddUi9PbxIKVejFifAI6BjMJUWiyZF43
 FS8Afx2cI1opm6Va/mTyvfX5Zwy/x4+bxtvHgXwgjDNRXqbWVLmpNQxc6vxnnpfu+YkH
 98fIKYXP9dphfd5wWxd0VJIGT80maHobz9AEgI3pve7Vy4+hDfStkVX+Rpx+ghepBnu5
 RY3Q==
X-Gm-Message-State: AOAM531IaMfY3+geyt+ZfHOLaXgAy4Jlli6mRhZ6YxO0dUXFzOkdURGU
 UD32dt8IHHPf97nRbx9wH548xQ==
X-Google-Smtp-Source: ABdhPJy2ZzvAQ/MsCmkNEnqNIXI59+XYp+TYTg3rqECD18OxWTFLitIFA8t4wVyFa2K8FcrCX8pQHA==
X-Received: by 2002:ac2:554a:: with SMTP id l10mr5560555lfk.534.1643364502961; 
 Fri, 28 Jan 2022 02:08:22 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id w13sm1830172lfk.148.2022.01.28.02.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 02:08:22 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	mpe@ellerman.id.au
Subject: [PATCHv2] powerpc: mm: radix_tlb: rearrange the if-else block
Date: Fri, 28 Jan 2022 11:08:15 +0100
Message-Id: <20220128100815.3231551-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang warns:

arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
                                __tlbiel_va_range(hstart, hend, pid,
                                                  ^~~~~~
arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning
                unsigned long hstart, hend;
                                    ^
                                     = 0
arch/powerpc/mm/book3s64/radix_tlb.c:1191:31: error: variable 'hend' is uninitialized when used here [-Werror,-Wuninitialized]
                                __tlbiel_va_range(hstart, hend, pid,
                                                          ^~~~
arch/powerpc/mm/book3s64/radix_tlb.c:1175:29: note: initialize the variable 'hend' to silence this warning
                unsigned long hstart, hend;
                                          ^
                                           = 0
2 errors generated.

Rework the 'if (IS_ENABLE(CONFIG_TRANSPARENT_HUGEPAGE))' so hstart/hend
always gets initialized, this will silence the warnings. That will also
simplify the 'else' path. Clang is getting confused with these warnings,
but the warnings is a false-positive.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 7724af19ed7e..7d65965a0688 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1174,12 +1174,9 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 		bool hflush = false;
 		unsigned long hstart, hend;
 
-		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
-			hstart = (start + PMD_SIZE - 1) & PMD_MASK;
-			hend = end & PMD_MASK;
-			if (hstart < hend)
-				hflush = true;
-		}
+		hstart = (start + PMD_SIZE - 1) & PMD_MASK;
+		hend = end & PMD_MASK;
+		hflush = IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && hstart < hend;
 
 		if (type == FLUSH_TYPE_LOCAL) {
 			asm volatile("ptesync": : :"memory");
-- 
2.34.1

