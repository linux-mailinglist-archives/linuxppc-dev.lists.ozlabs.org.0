Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF0D593BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 07:51:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zm9N5xpPzDr5Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 15:51:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JsNgZIdI"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zlmr0TKGzDqng
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 15:33:48 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id r7so2385141pfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 22:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yO8RgdYCvFnv4t3OEmjJ+RrgMbRvwazUZBbfyzgc0A0=;
 b=JsNgZIdIfI4H9KOenvXN3/nH+s3I8GjXVws5ISohvxjePcj6u9wFwF0WBsreIYjn39
 Rkkq3usddLcwgXgO1MGrbDhOJOp3WyucAReAyndrlH0kJsPp+JyUrygIA2uFxZE/Ur7B
 u3ZOw4A+wmlC9nJnekS+fnN6pwZJQc+c0gTLNFJ0x0u6gd0Pd5Wp7Ps2UsbjGxLC6YlO
 f36OIA7kmM0K5K26p7MC95LBXxafcA0s/1ADQ5DJZfp9xzcKxCctMf6GIIayYzY/9xnt
 YJ97dluAzRbqBPytuQceYmjQlUu/KwdsHVrHTaGIqw23N/5S3oCYEWYviV6Kff5ptFB6
 K5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yO8RgdYCvFnv4t3OEmjJ+RrgMbRvwazUZBbfyzgc0A0=;
 b=J8C1edYRbZWYOJBweISvzsaGg51wi+jB42L8eijgeXanWZnh7UsZKst0QHm0QJ6uU4
 qm0mMpYlDtQYU37eUZ4HDTIIyxJc71r4fq0kmpSMF4CanqH5dPkW69+H0c4nmxRGd5kQ
 NBr8kDWsLr8TKvYYhUqxbOvmDtA+3Z5knWdH+ge7g/kTml+bJ8oewIs+FO/QMWmrcnB9
 HeMgT8lxwqxjkgxMYKO30vkgXcWzdDGdNYuCUf4UGAb08lkXIl+gV+7LuVVs6GHHPAcc
 wVpKQk7msakMsWKYJ9leKI58sF3AkC6eDuVdHXBRAqMdq2CsBRfjjnzRTwEPf/nrkzrD
 5wsA==
X-Gm-Message-State: APjAAAVasOcYh6D4mpbhaScqSSm8V1axAM0VAXAS8hnRJtc34V18bTQd
 3Ajlif2DQ3WhIP1zpCQ9jhyImaWq
X-Google-Smtp-Source: APXvYqwocqz+Acn2xiJPIXw6B30yghbsbud6Z9QsqNwEdj1fKVDYyor37eDNqn5EUIjme0COw8v2/g==
X-Received: by 2002:a65:448b:: with SMTP id l11mr7354782pgq.74.1561700026282; 
 Thu, 27 Jun 2019 22:33:46 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 125sm1272614pfg.23.2019.06.27.22.33.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 22:33:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 11/13] powerpc/64s/exception: denorm handler use standard
 scratch save macro
Date: Fri, 28 Jun 2019 15:33:30 +1000
Message-Id: <20190628053332.22366-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628053332.22366-1-npiggin@gmail.com>
References: <20190628053332.22366-1-npiggin@gmail.com>
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

Although the 0x1500 interrupt only applies to bare metal, it is better
to just use the standard macro for scratch save.

Runtime code path remains unchanged (due to instruction patching).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f193a67f02ba..bbe29cd80440 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1925,7 +1925,7 @@ EXC_REAL_NONE(0x1400, 0x100)
 EXC_VIRT_NONE(0x5400, 0x100)
 
 EXC_REAL_BEGIN(denorm_exception_hv, 0x1500, 0x100)
-	mtspr	SPRN_SPRG_HSCRATCH0,r13
+	SET_SCRATCH0(r13)
 	EXCEPTION_PROLOG_0 PACA_EXGEN
 	EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 0, 0x1500, 0, 0, 0
 
-- 
2.20.1

