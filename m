Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDC2723DF9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 11:41:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb57z15QVz3f6p
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 19:41:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Bf0Iilwt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Bf0Iilwt;
	dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb55M5Ph1z3dt3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 19:38:47 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-39a505b901dso5106447b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 02:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686044324; x=1688636324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amUxvwZP6+WobxnUM7Wj7zQ1DycHLz6BAAYtZzcHcqg=;
        b=Bf0IilwtiiOhxvyeX/8ZDi9fpO1cUQ7oQSblaHmucQ6y11hItNjxoe+jq/Lna3lykP
         dBcS0HUMYFYV+97wkpv6+xAQIcJXiXAqIuwnf5I8IL8j/6eQxzk5FvmDUFZvMM1PZ922
         /anJ/9IKNXQSLb5XJJtEVzQb2TNQBoA+APEB4jdvhaRGKXTDvMxkLTMaUbnqtv/ZkTBo
         mod8VkKAF5AmGOrWRjNZEBYYxabPArtDe4pw0BGo8+2vN+Zpj5opxAUXyz4rXZjzL0IM
         EPf1B0+UYJjA4MisYwgk0qraLIK/3SnsDvWmWjnh7mHvylT1cJJfQF8K4PsmuMnvDX93
         8wVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686044324; x=1688636324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amUxvwZP6+WobxnUM7Wj7zQ1DycHLz6BAAYtZzcHcqg=;
        b=BRkMhybX+1prkI+disOuj0g/8xlHGB1Enmf8tQ4LaZARBjIXKJo7g2chJcE1ePgFfJ
         2g3Es3tJ352M8CaeqRzhuPfag6r5nWeUbWT8Zr2MiJt/3eky5lwMu4cx7a8JF8YZpvUr
         a6D+sbXC5oQuvG5TaQv/x7+dvWoFvDDBl8EsGL1KhVczhIKEeRyJyFfcj3S6ety359ch
         5bjjzLlHxm91kZPgYWorZ1Cyda4CtFX3KkdsyiRwa06TZvbD5XJgNmpFC945YmoEfokj
         rOO7vPFZMcmZF/g7HAz6IoRXrheTk3fcBFtJPhpO14XCcio5a8X7LKYY25WvlPYizbbG
         G72g==
X-Gm-Message-State: AC+VfDxODtysgMz/yrhsG/9UPw7Htj0IwCC+BKJDSPdrdkpzAArPGEN/
	/opv6ts5kgaYSjnavelMkW32Cn3Z9NgWhA==
X-Google-Smtp-Source: ACHHUZ7rrlk/ecvGwC30wg3olSPf2BIjdkvr09D7ZgS1g7sJpq7PMxakH7SnhQSyW/59UEB8IuBPpw==
X-Received: by 2002:a54:4588:0:b0:39c:4553:9644 with SMTP id z8-20020a544588000000b0039c45539644mr1676002oib.42.1686044324780;
        Tue, 06 Jun 2023 02:38:44 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902ea0800b001ac8218ddb7sm8048442plg.84.2023.06.06.02.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:38:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/4] powerpc/64: Make ELFv2 the default for big-endian builds
Date: Tue,  6 Jun 2023 19:38:30 +1000
Message-Id: <20230606093832.199712-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606093832.199712-1-npiggin@gmail.com>
References: <20230606093832.199712-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All supported toolchains now support ELFv2 on big-endian, so flip the
default on this and hide the option behind EXPERT for the purpose of
bug hunting.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e34ff0e59585..296e0448b5fc 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -624,8 +624,10 @@ config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
-	prompt "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)" if LD_IS_BFD
-	def_bool y if LD_IS_LLD
+	# Option is available to BFD, but LLD does not support ELFv1 so this is
+	# always true there.
+	prompt "Build big-endian kernel using ELF ABI V2" if LD_IS_BFD && EXPERT
+	def_bool y
 	depends on PPC64 && CPU_BIG_ENDIAN
 	depends on CC_HAS_ELFV2
 	help
-- 
2.40.1

