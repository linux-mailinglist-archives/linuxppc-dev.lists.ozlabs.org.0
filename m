Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A806729635
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 12:03:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcxV902s2z3fL1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 20:03:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kPOtd26Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kPOtd26Y;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcxRM6sz7z3f0M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 20:00:47 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b038064d97so5124185ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 03:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686304845; x=1688896845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxWsuGJbXj52lRlkVMBXqBUlVvD+pV5/Oic8AfJwtb0=;
        b=kPOtd26YXIUpHQBBaXUsZg3wsRm0POQGNOqB/PAlr9OPkgFBDfw2tux9AZsMYwHNeS
         hSFsiiKIT0YOrXw5ge0U52BQOCQyKw4+sNAQ6oFrDdvjOnmSm9Z+sywbgQlaChl0yFhi
         REe5myMgl3zI1fm19Dtyb6XTJIoZdMK7KWXQP25gwFXGiB5IyZKqOdJ+3o1itilg49M+
         bzGeMJyuqD1sSwvlsqVTR5y7s4ZpTHOsz511HshOEQzMHMBlqsZpad+Xx6sbiqk3B7B4
         jd4c5cPb45jxGqUE4Nc2Oj5OL3p36bYnJ3k3LRXAUuLY5qadPaaEfMgK40i/OQv8Lfee
         sAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304845; x=1688896845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxWsuGJbXj52lRlkVMBXqBUlVvD+pV5/Oic8AfJwtb0=;
        b=kAXtPwfOUib4U5gbnpHdRALLqxsX8jzdsUVkWgMMgMDFBFeRXZYat++9d/JpxAySQd
         amMHXsacaz4LGET+RuEtzr9cjxHgFQyU1sCXW0uQpF6Ja1SXpN/t2wW3KYlFqlxpbAdo
         Woc48fmfCNiFPiPwLiKt2yk8fs91nH9VsBSnWBj6DZc9x/0IPH1BAwdJFnUGeug78RbY
         BNooEdVU5uyakvQqBhRb6A8hdRPv/qn8u5oAu7+W83mG5fLkqFk0mbsSgnGTeMvVxNTO
         TDqPQgGn7y9S/x9QUkY2aZOcPHpHkIMNu8c0cihQ6llpT0bZ8jrjg9fIUHSemBXI8Bp6
         8svA==
X-Gm-Message-State: AC+VfDyuLWOGDUXd80ugAKOMXyMFgZyNqVVXh5QieXmXWBmrEyXEUxTD
	GgFbWicZ+6JuLj2cbmi6BoAGoHyiNXI=
X-Google-Smtp-Source: ACHHUZ7u6/OC+t418wTZQIyUrGNXLfyEomS8uxijqhQGUUmSBxizj/2IVZLyycJvgcyZ+PZR70idQA==
X-Received: by 2002:a17:902:ea10:b0:1af:ea40:34f2 with SMTP id s16-20020a170902ea1000b001afea4034f2mr1695645plg.11.1686304844949;
        Fri, 09 Jun 2023 03:00:44 -0700 (PDT)
Received: from wheely.local0.net ([193.114.110.224])
        by smtp.gmail.com with ESMTPSA id jh11-20020a170903328b00b001b077301a58sm2912864plb.79.2023.06.09.03.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 03:00:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc/64s: Use stncisync instruction for smp_wmb() when available
Date: Fri,  9 Jun 2023 20:00:25 +1000
Message-Id: <20230609100026.8946-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609100026.8946-1-npiggin@gmail.com>
References: <20230609100026.8946-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

stncisync orders less than lwsync (only cacheable store-store, not
load-load or load-store) so it should be as cheap or cheaper.

Microbenchmarks with no actual loads to order shows that the basic
execution cost is the same on POWER10.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/barrier.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index b95b666f0374..f0ff5737b0d8 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -6,6 +6,8 @@
 #define _ASM_POWERPC_BARRIER_H
 
 #include <asm/asm-const.h>
+#include <asm/cputable.h>
+#include <asm/feature-fixups.h>
 
 #ifndef __ASSEMBLY__
 #include <asm/ppc-opcode.h>
@@ -41,7 +43,12 @@
 
 /* The sub-arch has lwsync */
 #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
-#    define SMPWMB      LWSYNC
+#    define SMPWMB					\
+	BEGIN_FTR_SECTION;				\
+	LWSYNC;						\
+	FTR_SECTION_ELSE;				\
+	.long PPC_RAW_STNCISYNC();			\
+	ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_31)
 #elif defined(CONFIG_BOOKE)
 #    define SMPWMB      mbar
 #else
-- 
2.40.1

