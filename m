Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9197891440
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 08:27:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=njGi8o5j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5X6s4fHKz3vnS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 18:27:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=njGi8o5j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5X3j5w2vz3cPm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 18:24:48 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5dbd519bde6so1255908a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 00:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697087; x=1712301887; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDl3drvCV8mQminB8cd0FWY5ZeQD5iRDfGVHISUC3N8=;
        b=njGi8o5jjpkVCDR7HgE9z5QEVbPLkioexGquAFmOQ2nv0ZMUSp7FYNe1tpdeHgnyJ8
         VkgUehm5LLPumzcLybVvgIXrNrwIh0c6vsGEhhsIwTuhwNXj6Xl9cNSYShcXIdjP0pUd
         phffgV0X1H3UsgYyCXIaRIgTZaaf5Jc50af27vR5zb/aTYCnzx0mZ6q6iQP0VBGZ95Gy
         wuR24Uip+tBFSFNQoCE0a/RwHHQWC6KhVKqdTqbKeajrcS8UxuISuVbvfTAnQWco782s
         kbMu9uRBFVHd531s8yl1RgG13bagOLp3L38JjUN9NcVqlMtFT03+D/damKh+MbhAa236
         HfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697087; x=1712301887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDl3drvCV8mQminB8cd0FWY5ZeQD5iRDfGVHISUC3N8=;
        b=LQHqCR1PVZJ5/igOmBdwnVJFpSvsgJW5+mf3+m43lEeJ+KKo9fpyoGcJbchPcDOQne
         kKEJp5zYD/k8CJOg0ho43E1uUVhmdDI5JjSRemK9S19vN8XYr8E0K4qy7WDtF4AUG/ky
         YAIw1rC65lI75R6IUooKbChG0A74NaY74AuI1QwNWgs8aTofGnK06U7RsT54XoHQCtn5
         BleMW2Py8dBdfeXaIYVIpe2tCy+Ef4Nug/Ciqym5BMhCyj4chFu62d/E0RHPR1GA7OWi
         LNpCOCPL2f+vk3JXEmSlMYP86mPyhkzjbHIr5fCc4/vrMnLtiUO3PQtYY+iFkcgdtem/
         WyLA==
X-Forwarded-Encrypted: i=1; AJvYcCUL6nkTsin96NFeeVI/wA9wv53zojo6ha5YaF0ktKRwDRKOqQctk4uiIeFjNIQvDDxxPa/4Hzv+19cG67VsaF2txsH9AIjV08cyVhG8og==
X-Gm-Message-State: AOJu0YwHtAiYMP7Uxc/gRim0fTT7JNV19Xv1drc/TOzCm6zCTJ0poSoU
	J+TzV6pkmPKBk+NPJAYCn2H5K49YbqoGmBnW5/5XF1ZeqajYRZbXtaCRAf1QuWU=
X-Google-Smtp-Source: AGHT+IF+FV+uMuQXtJuoJZDILLDfziMVBq/KUES3aiEW6OY8o73iJ5kWmw5SdybGS1gXP7gvN622NQ==
X-Received: by 2002:a05:6a20:394d:b0:1a3:647b:b895 with SMTP id r13-20020a056a20394d00b001a3647bb895mr1477372pzg.47.1711697087156;
        Fri, 29 Mar 2024 00:24:47 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:46 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v4 03/15] ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Fri, 29 Mar 2024 00:18:18 -0700
Message-ID: <20240329072441.591471-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, loongarch@lists.linux.dev, Russell King <linux@armlinux.org.uk>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/arm/lib/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 650404be6768..0ca5aae1bcc3 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -40,8 +40,7 @@ $(obj)/csumpartialcopy.o:	$(obj)/csumpartialcopygeneric.S
 $(obj)/csumpartialcopyuser.o:	$(obj)/csumpartialcopygeneric.S
 
 ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
-  NEON_FLAGS			:= -march=armv7-a -mfloat-abi=softfp -mfpu=neon
-  CFLAGS_xor-neon.o		+= $(NEON_FLAGS)
+  CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
   obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
 endif
 
-- 
2.44.0

