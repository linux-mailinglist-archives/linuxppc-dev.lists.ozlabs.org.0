Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F50B723DE6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 11:40:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb5732v5Sz3f7Y
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 19:40:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZYE3ynDi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZYE3ynDi;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb55K2fmSz3cdy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 19:38:45 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b039168ba0so51015805ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 02:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686044322; x=1688636322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpeeZgd8dl7+jipG6unqIFCk/08w4lAYvrkv9b5E8wM=;
        b=ZYE3ynDi4GphKxtLGj5SZaxE9q1eGFCPc/WBAMAHKkUNuoCYED+aUjEDNLPCen/ia6
         nl2kTKhig2Z7yBwrckmrSswvCSCLN2AroJ2vrU7TBRNmICyg6Gb53uNbyovTewNYOm7v
         +k/kIuhpCM8gfNdRv7EdQo5ZH87D0fjUv14wkiUF7RADobNBdgfMCbPeV83FL0AwSIYu
         Z8CEXZBHYtN+MlUkNCMbjmWQXGX5Ll6PNBdlS+Z+txDixPaZiHEsWiCut2SHpYneb+iS
         QB9gGp21lQTxO6nPWZ95LqeoYaiU/oeH+HhlfQslaL+H5D/PFKrSDAP7nQEGEUEJznjG
         B8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686044322; x=1688636322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpeeZgd8dl7+jipG6unqIFCk/08w4lAYvrkv9b5E8wM=;
        b=G0V0m2tSwOcsOijEc06k7StlPZRVHYcp6dpoAXXO8z0uITotUz+YkZ3kpa5ncKHf0o
         FZrnnHrp6boG86yqFuIel2PsZjt1T0QW1ikP3nJbLQFOPD5wvlU+plrXKu+U46KD3s0P
         m8blCu9KwJSW/tMi10HZmE+rmblz1WaMbap3LYAYViqPQZ3lokriT9veOpuI7fbpupb9
         BCoV6Sd5BUPH2j9+8NKsjULSbsLZ1EG5PYKxMti6IaKeoFBJONgOchi2NiijAQ00tXve
         FexI5j3T0esfhWCYx68VqpuHC/dno2oPB3JjLCrywH0YQG0k6wpkWgVVDqRlBiqtYPvb
         45/Q==
X-Gm-Message-State: AC+VfDz8QenmFHGEdwSLBH7tgYZgisRTRUFvNKD7IUzNV0x8JcE33xoK
	ADzljdxaxR4Uf8FSn+uTUL5dAywK5W/ShQ==
X-Google-Smtp-Source: ACHHUZ43RrlFMTKqF13b6+SdFVTlnxkb8X7i4iyW38D4qoPadtkGWVxMmp9wzGgyXisfGa/Y25TA1g==
X-Received: by 2002:a17:902:d2c4:b0:1ae:622c:e745 with SMTP id n4-20020a170902d2c400b001ae622ce745mr2125866plc.1.1686044322070;
        Tue, 06 Jun 2023 02:38:42 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902ea0800b001ac8218ddb7sm8048442plg.84.2023.06.06.02.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:38:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/4] powerpc/64: Force ELFv2 when building with LLVM linker
Date: Tue,  6 Jun 2023 19:38:29 +1000
Message-Id: <20230606093832.199712-2-npiggin@gmail.com>
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
Cc: Nathan Chancellor <nathan@kernel.org>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The LLVM linker does not support ELFv1 at all, so BE kernels must be
built with ELFv2. The LLD version check was added to be conservative,
LLD simply fails to link ELFv1 entirely, effectively requiring LLD >= 15
and ELFv2 for BE builds. Instead remove that restriction until proven
otherwise (LLD 14.0 links a booting ELFv2 BE vmlinux for me).

The minimum GNU binutils has increased such that ELFv2 is always
supported, so remove that check while we're here.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index bff5820b7cda..e34ff0e59585 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -624,10 +624,10 @@ config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
-	bool "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)"
+	prompt "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)" if LD_IS_BFD
+	def_bool y if LD_IS_LLD
 	depends on PPC64 && CPU_BIG_ENDIAN
 	depends on CC_HAS_ELFV2
-	depends on LD_VERSION >= 22400 || LLD_VERSION >= 150000
 	help
 	  This builds the kernel image using the "Power Architecture 64-Bit ELF
 	  V2 ABI Specification", which has a reduced stack overhead and faster
@@ -638,8 +638,6 @@ config PPC64_BIG_ENDIAN_ELF_ABI_V2
 	  it is less well tested by kernel and toolchain. However some distros
 	  build userspace this way, and it can produce a functioning kernel.
 
-	  This requires GCC and binutils 2.24 or newer.
-
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on PPC64 || (FLATMEM && (44x || PPC_85xx))
-- 
2.40.1

