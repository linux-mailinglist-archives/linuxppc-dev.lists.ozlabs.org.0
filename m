Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6EB49FA77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 14:18:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JldLT5B9bz3cPj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 00:18:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cLb3S0yk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cLb3S0yk; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JldKn696Sz2xXW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 00:17:32 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id n8so11743771lfq.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 05:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AYl20x8f64eY3Q6M51ieJFRc3attF791Qq3pPAooZU0=;
 b=cLb3S0ykwzyVoc8708XHRRYPgYryU5bGWXLkbayh8hQ+Un/CO5sfcMm3146Kk16CAx
 pHgU4SayyKOs+aagwTRyJTNcVzBZmRdx8bUfxUTjOy6Mm5C7QTVQb+FFKm73ykHWqwTo
 KxiiB/x5ZJ/i1jLRnvShGi37yl1tKPAtIH54w19tg7LbMVty6y9NceGKve3GxZV6oN97
 fEEWbewRQC2Og7Y1JzJu8CNuxaTzaeaDln6H1U+u9W1M//EYsAQxRd06ccuk0Sy0OR+L
 wVKeTQUtotZs/kL7WO7a8kLIld8P6g+1/YwN//75AxYd0UNZNhiFWaSyqzD0KXyuGv9k
 Hqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AYl20x8f64eY3Q6M51ieJFRc3attF791Qq3pPAooZU0=;
 b=Ewzb9WbhoiJzEX3hVSst68jkEHO2d2Du4kUy8rHhTZfsOgJi9qDDQpuLavh872zKMA
 StVmY1thBf4RZvSASijdCHcdE+ID+GINuOYXIWG+oOZ8NuoaiP1nLjitxycVyNkZ+my9
 tQ/taURQX9TmjvI5L3H1HMqTpxFS9HQpVjvy2stBN9AWuxqKrG2m4RFNydXpp6AMDL2O
 O3xtjeKIKaIHGfy7z2Pxxp6Fgp1vi3cP4dOqfhCRB9wftAssTBzLj/OLIkqABYC6wy+c
 JoZlwKJMOHSNL5o2Hb4uOPslQmn6Wc05rAeCsftBH6wUEFsu1gREp0LTMoFhSwYjyC/8
 WxbA==
X-Gm-Message-State: AOAM5331Tlquk7EtWGayy8rMxLE+tjWEeu5T8MxxlOyfLSYGhwIIc2Sm
 2z+0DmWAXQR7xSap1cQaI4BpqA==
X-Google-Smtp-Source: ABdhPJwAZ2Q1WGxi7/NXG6VtAjneijeqYVZkjzKgZBOzUxzKZ4f5lAR7n+3sy+lC9puoYXvODnO40w==
X-Received: by 2002:a05:6512:3256:: with SMTP id
 c22mr6175723lfr.574.1643375847828; 
 Fri, 28 Jan 2022 05:17:27 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id f8sm705480ljn.16.2022.01.28.05.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 05:17:27 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	mpe@ellerman.id.au
Subject: [PATCHv3] powerpc: mm: radix_tlb: rearrange the if-else block
Date: Fri, 28 Jan 2022 14:17:13 +0100
Message-Id: <20220128131713.299198-1-anders.roxell@linaro.org>
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
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 7724af19ed7e..5172d5cec2c0 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1171,15 +1171,12 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 			}
 		}
 	} else {
-		bool hflush = false;
+		bool hflush;
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

