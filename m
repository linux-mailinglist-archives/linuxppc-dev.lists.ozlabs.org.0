Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 795866F7DAA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 09:20:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCMXj1hQtz3cNJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 17:20:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IUAHmtjf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IUAHmtjf;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCMVy0M1Hz3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 17:19:05 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6439df6c268so326137b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 00:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683271143; x=1685863143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07Y2VAMLZfkfk2PerNNUHNU7F7KB4NjdI7LTkxpUBug=;
        b=IUAHmtjfN70TdhCAIG94eKiuFCPZHWBXM0l+1Tq/s8xQJ48y8UpCoTV/qCsLKMYvyy
         +UnAOkrhjKVT+ITJOkM63dEXHmtQAA2BYxC0WeNCNW37yn05wkN+S254UQZTXas1NPSh
         K3/OtZ2j7uXbEQUTLQfMChmSVE4t8RyjwI2hzdz9ZmBkK3/GUZFTOIvitgRAOnSrIZmF
         YywRNNLPHGdykhcihedT0tkuoG4WDF7xK4KFXITCkCcXPlx/MN8HWsd604dSGfe03hFq
         XTNsbP5yN/M3bVG7ujBJvTcT0J0qXYvmrXdQ3uB61PmzFJMcejJbLQgAEloaR83xCpGP
         CoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683271143; x=1685863143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07Y2VAMLZfkfk2PerNNUHNU7F7KB4NjdI7LTkxpUBug=;
        b=Q28BelKRr4HO0sEoPs8wio/ojaOEAyHU5ywuGimUi1X1qT0EmNfRnIwk2stRWG7W00
         bbCZKWLYcGtfRVLNt/9mwCXuj9jxQ8p+HAB0CCGgWXkXWVD1/h/deyO6rIYBIznpNEhe
         gCljvupHJfV/rfnph4NlzF8TBEPRmCL7ujczT7aw8k6W1ZEijgnL/mtsHOJhYlHYBRdo
         qRWXc1Mfo/HTeGFz8pJ5Os9xPkUBRZuaY1KPSfvs0NWHdilLAraR+cxGVoTG745IYnXj
         KBS9XS2toEGOr/2EvmWew0T4lsJhVkTwZa6qdiQF+eQBw6RUMieZ81GrkwSN8dIjOXz2
         Gd2Q==
X-Gm-Message-State: AC+VfDz9mE7B3PRf8i/J0B2tVDYT1Qsg3TFU/Ht6mqbnpXLjZ9syUJbe
	9oh0Kds98xXvdYoIVul3u2xaHeSSvkc=
X-Google-Smtp-Source: ACHHUZ7uaP9yIZDK7G4RbChMCDFIs07TseMK85R+GOm8bb84OEdNMz3PlgSuc04M2uirAYQXfEGvTA==
X-Received: by 2002:a05:6a00:8cf:b0:640:e12a:3a20 with SMTP id s15-20020a056a0008cf00b00640e12a3a20mr1322451pfu.1.1683271143539;
        Fri, 05 May 2023 00:19:03 -0700 (PDT)
Received: from wheely.local0.net ([203.59.190.92])
        by smtp.gmail.com with ESMTPSA id i10-20020aa78d8a000000b00625d84a0194sm915384pfr.107.2023.05.05.00.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:19:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/64: Force ELFv2 when building with LLVM linker
Date: Fri,  5 May 2023 17:18:47 +1000
Message-Id: <20230505071850.228734-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505071850.228734-1-npiggin@gmail.com>
References: <20230505071850.228734-1-npiggin@gmail.com>
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
Cc: Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The LLVM linker does not support ELFv1 at all, so BE kernels must be
built with ELFv2. The LLD version check was added to be conservative,
but previous LLD versions would simply fail to link ELFv1 entirely. The
only would be to require LLD >= 15 for BE builds, but let's instead
remove that restriction until proven otherwise (LLD 14.0 links a booting
ELFv2 BE vmlinux for me).

The minimum binutils has increased such that ELFv2 is always supported,
so remove that check while we're here.

Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index acffffbd5d77..e5d81645c902 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -624,10 +624,11 @@ config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
-	bool "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)"
+	prompt "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)" if LD_IS_BFD
+	bool
+	default y if LD_IS_LLD
 	depends on PPC64 && CPU_BIG_ENDIAN
 	depends on CC_HAS_ELFV2
-	depends on LD_VERSION >= 22400 || LLD_VERSION >= 150000
 	help
 	  This builds the kernel image using the "Power Architecture 64-Bit ELF
 	  V2 ABI Specification", which has a reduced stack overhead and faster
@@ -638,8 +639,6 @@ config PPC64_BIG_ENDIAN_ELF_ABI_V2
 	  it is less well tested by kernel and toolchain. However some distros
 	  build userspace this way, and it can produce a functioning kernel.
 
-	  This requires GCC and binutils 2.24 or newer.
-
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on PPC64 || (FLATMEM && (44x || PPC_85xx))
-- 
2.40.1

