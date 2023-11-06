Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE8C7E260F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:50:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tVC/0EfH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPCRb6KzQz3cRZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 00:50:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tVC/0EfH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPCJL6bV9z3cT0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 00:44:33 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5079f9ec8d9so4823517e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 05:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699278266; x=1699883066; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zfut42GZ6PJsX7RslNyzOoo+yrwpRsBHvP3u/FnXLmg=;
        b=tVC/0EfHVput5VvSOaB2D+eLVAm2MLs0Ik5ISSoRuxoFh5fqm4M7gc5Yng0DbKzTS+
         vGvp4AhO4WSj9x9v/s29U/HwiQ5hUe2Gu5qH2M8cFGmit+lCXgN7sOGp5hDPJGXphDe6
         xU2VeGXwFQskuu49Du1JKdAkeL/NthCqVi6MWsn1FnqN8C9hhwLZEfokkmAMxxdlLVTD
         vL3bcpuzFQNYMe9o70foZynxM0iz+25eFD+7LfR1NmdoBaO6CBZfCwae0oTLSh4Hrzni
         26cA+0xvFakjKYyigrXEq+NS/3eUZVDYNck5DmThgQcONO1z1sLeAFtnfUugq3StwXNJ
         z+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699278266; x=1699883066;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfut42GZ6PJsX7RslNyzOoo+yrwpRsBHvP3u/FnXLmg=;
        b=bZ8hLe60fal625wkwPUArQgrQo3TnZZMxGdM4eAW0hY5LjjgNCQUwzeMoCyqZQ6Tk1
         cUajBBzev8Jz1ua/ThgGXZygrcxws4saeb8AGW27EbfTDUJnTQs/1JW+6bBlNViY+4dZ
         8WwC0AtEQU/8q6wBO+0oPLIRdehPLjFn3NBgel9jyS/gDivNw2rexi/HNzo8zlRx3dRI
         iBOjnT2vbmF14XrFWhAcGHVqQlHixVvrFLByd2VxydHBiQDdXb7btFwdVNoZL/musIp1
         xtTU4vyABBhTBY+wM3em7EkkhUGZOpETZcpyLCbxwB2epAdYLCG9IMPw2sGbwjtMR3lQ
         VumQ==
X-Gm-Message-State: AOJu0YwPAfsnLYE4Kj8ccKEvSalG+4UK7P6QJtJUm7jKKWFWFEN15gnM
	DM/2Y6xagMyv0XirEQjJwcWlvw==
X-Google-Smtp-Source: AGHT+IH4bzAeeYdxryFqi17NUYVW5UsmYhLWSTUCigieIHr7c5swW3uUM3EOV8t/mdnyfou3jNyCSA==
X-Received: by 2002:a19:6505:0:b0:4fe:2815:8ba7 with SMTP id z5-20020a196505000000b004fe28158ba7mr3312316lfb.25.1699278266334;
        Mon, 06 Nov 2023 05:44:26 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id w25-20020a19c519000000b004fe2de20d88sm1123959lfe.232.2023.11.06.05.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 05:44:25 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 06 Nov 2023 14:44:25 +0100
Subject: [PATCH] powerpc: Fix signature of pfn_to_kaddr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-virt-to-pfn-fix-ppc-v1-1-93197a7ccab4@linaro.org>
X-B4-Tracking: v=1; b=H4sIALjtSGUC/x2MQQqAIBAAvxJ7bsG1UOor0SF0q72YaEgg/T3pO
 AwzFTIn4QxzVyFxkSxXaEB9B+7cwsEovjFopQciZbBIuvG+MO4Bd3kwRod+Is+jdUaRhVbGxE3
 912V93w8BGl8jZQAAAA==
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.4
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a const in the returned value from pfn_to_kaddr()
but there are consumers that want to modify the result
and the generic function pfn_to_virt() in <asm-generic/page.h>
does allow this, so let's relax this requirement and do not
make the returned value const.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311061940.4pBrm44u-lkp@intel.com/
Fixes: 58b6fed89ab0 ("powerpc: Make virt_to_pfn() a static inline")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
The remaining warnings from the test robot appear a bit bogus.
If someone knows what to do about them, please help. The warnings
often properly uncovers problems that have been around forever
due to these functions being disguised as macros.
---
 arch/powerpc/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index e5fcc79b5bfb..5243e48dc13a 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -230,7 +230,7 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
 	return __pa(kaddr) >> PAGE_SHIFT;
 }
 
-static inline const void *pfn_to_kaddr(unsigned long pfn)
+static inline void *pfn_to_kaddr(unsigned long pfn)
 {
 	return __va(pfn << PAGE_SHIFT);
 }

---
base-commit: d2f51b3516dade79269ff45eae2a7668ae711b25
change-id: 20231106-virt-to-pfn-fix-ppc-d91de47c6017

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

