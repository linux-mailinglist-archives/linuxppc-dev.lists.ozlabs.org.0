Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B189144D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 08:28:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=jz4RoHoJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5X8R3lXxz3vsW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 18:28:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=jz4RoHoJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5X3n0Rdvz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 18:24:52 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6b5432439so1557677b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 00:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697090; x=1712301890; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPRyZsExaX9jqH4yhl7xuz7hAOg3yG/uDoq2R6sqbZQ=;
        b=jz4RoHoJDGJFdkfHxTm/BvLzi1h+R1gkmgzmnCJlbKAVZZ9aNaOAOaye+iopBWIXVJ
         u0NsX+6Z/ksdwfFkh1/N0QmGgCjVAVEDh+oz5Tg4okO1JGcVAQbej2OCRKVi5roZIXCM
         uPrxvr35XJ5WHWNQSJ6elLb6ntJC1eyPYInD8AQXD53sCIrA8fFhBXTSON/gyjtRiNj4
         ssC+o99Y80E1N+BN560bvsTgf+AlN8SAgXlfsaC4OAcJuGQLNW4VzuWIYUnJ30NQypTF
         6Yx7ORIy8w19sVsPdRmsejSvUNWJOGoOt9GgMUZzuPgXOIU1wuzmNm4KFzmdWnBtb8b3
         oOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697090; x=1712301890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPRyZsExaX9jqH4yhl7xuz7hAOg3yG/uDoq2R6sqbZQ=;
        b=tyLfCEtBMWnFlo8zGO0SgBwfGUU1rCjszURW1eLeoEBTLnKiBwcCNhiq41DCZZ28Ce
         M4NFRb94a8QFw5hz8EUuiBMIvsGbtMPsedJycZXQtEzzBsWyEG3XdrOryssgPRm9ciRd
         0ooAiyMyCLtXX29d6d0mtM7uxhZLFPiP2XkwSzsV4WoUQGErqKZu32isI8ZRID+NjvLh
         nkf7xJPoLNliPG5wrgaZ3d81cDYZjQoFS71J1lMfUQQsAdb+UoucYusC3orWmhTOAIom
         UnosxcdQjiMxhFueqMa3E1sF4e1gzPuQspwywmDsSv3+ZJ72SUM21zdcQ7hJbe2ldMF/
         S/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt4eOfRZRRc9SMZqMkx5FaRJ01KbaMut4rmXunjBM+jxQMFY93wtS7QYiWJvssJrILwbFyi3vgP+gkMG9Y7gdu1LyJS3NHVQTAWpV2ig==
X-Gm-Message-State: AOJu0YyT5urZUs7esfkwr3ph6cPFfLrVnVVh/XSWcq1j+Xjz/JzWkpSR
	UUr+LuduWD6OOK56sfQ2QPAGYwqctoxHSkdeR3/e/vR3MPvGssNkW78/LckJap0=
X-Google-Smtp-Source: AGHT+IGTP4+TuVjePLHUufBWyrdagoR69ieuL91+Fm218jTRMOa2nDQVrtkL7zzrGfUrh4aL4xmRCg==
X-Received: by 2002:a05:6a20:2db:b0:1a3:71f7:df3d with SMTP id 27-20020a056a2002db00b001a371f7df3dmr1114388pzb.30.1711697089806;
        Fri, 29 Mar 2024 00:24:49 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:49 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v4 05/15] arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Fri, 29 Mar 2024 00:18:20 -0700
Message-ID: <20240329072441.591471-6-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 arch/arm64/lib/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 29490be2546b..13e6a2829116 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -7,10 +7,8 @@ lib-y		:= clear_user.o delay.o copy_from_user.o		\
 
 ifeq ($(CONFIG_KERNEL_MODE_NEON), y)
 obj-$(CONFIG_XOR_BLOCKS)	+= xor-neon.o
-CFLAGS_REMOVE_xor-neon.o	+= -mgeneral-regs-only
-CFLAGS_xor-neon.o		+= -ffreestanding
-# Enable <arm_neon.h>
-CFLAGS_xor-neon.o		+= -isystem $(shell $(CC) -print-file-name=include)
+CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
-- 
2.44.0

