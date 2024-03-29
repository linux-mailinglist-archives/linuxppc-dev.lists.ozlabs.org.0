Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4AC891459
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 08:30:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=YRWe4zVr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5XB13gTRz3vhB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 18:30:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=YRWe4zVr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5X3p6LYWz3cSd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 18:24:54 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so1028258a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 00:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697092; x=1712301892; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F18yE3QV4MW8RCzD1e25jw8k09/j20Bb+PnplrzhdA4=;
        b=YRWe4zVrHrO/l8PiuQ+4mKEqgNPEdpzMMcAbqGmksyAxJ5ZGNAvF9I/XNKJUFmoqnB
         Zc7TvPmSDOZYVsNlCd922zDhw+e1DVOxx/HK6V/4wgzgijkbtG4AgIfrCHrzUFR0RwTZ
         cCXvz1R1rx+1ACKV4+uQq8qAGOrE/8cvEzwarfxBvF4OxAidCcUdALtbsMraxVfzGbgL
         TlmPMmZDRKmuDJiJaxhImMCMZBAdpd7g69EygGovuJJyfSA2JO6ktMPeBVOCtshfch3p
         oCJpywErmYi4xUPO4ODzPirryse30bNufU1XBtTsAfgRfx9WmijecS34i6IPa+A3t3nc
         OOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697092; x=1712301892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F18yE3QV4MW8RCzD1e25jw8k09/j20Bb+PnplrzhdA4=;
        b=U34FMEDLDBjY6RMclnU3NwZo1YMq1nevgp4sCAo3tyE0mNxc0rrpTZiZec+nVWuHav
         OQObtCWuKOUoSaOw0akLWrEpV5GvEQUrjK3b0q3HoS1SpKi9ma7nSdXNxohZkVHlf7zr
         NRXu0dxr5zpdpRyT6Gmi0vEFYwQ9Nq4U4xUY/ZteLwZEAIuXKup/El+edFLQ2IqUvLsc
         cQKllLjCURPGJ7TiBLhS5xqNmF3Tj3xXCgyhXo7Qr3+bHH8KIRt0xDHBhIotszHc+Y/q
         J7n588+FesAlPqizXdLDYpbgXmLPxwe5ISMdXOAk4djOgUPqb/9TPY7yebuAqWUPyEg+
         hLfg==
X-Forwarded-Encrypted: i=1; AJvYcCX/cSPPaQyH/Z5bcO157fmmgmUVc5U1xAewiG+9fRedzK/O+CrICH5Jj00e/pli3rsXl9p52inAO+nAGIHsDjV9ZzpsPi/EyqnFwNBGXQ==
X-Gm-Message-State: AOJu0Ywzsin6D3Nkepxpksz8K3a1eAJAc4Dvhb1dlY5RkH/OMjii66Wx
	ZRpcfFhX62LErtZmHT+52QUbwf331hEIqIRLdirUSDzDElpWA5K7L+coqla/cbtffyI0moXOecp
	2
X-Google-Smtp-Source: AGHT+IFY/yzEzRZYFdEySbj/sKHZJd/DWAHR82okZCfCkYYQ9Rz+9YBmaRZXyDE1LpyvvN0Ey140hg==
X-Received: by 2002:a17:90a:fe85:b0:29f:ea48:25dd with SMTP id co5-20020a17090afe8500b0029fea4825ddmr1492025pjb.33.1711697092415;
        Fri, 29 Mar 2024 00:24:52 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:52 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v4 07/15] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:22 -0700
Message-ID: <20240329072441.591471-8-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
asm/fpu.h, so it only needs to add kernel_fpu_available() and export
the CFLAGS adjustments.

Acked-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v3)

Changes in v3:
 - Rebase on v6.9-rc1

 arch/loongarch/Kconfig           | 1 +
 arch/loongarch/Makefile          | 5 ++++-
 arch/loongarch/include/asm/fpu.h | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index a5f300ec6f28..2266c6c41c38 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -18,6 +18,7 @@ config LOONGARCH
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if CPU_HAS_FPU
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index df6caf79537a..efb5440a43ec 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -26,6 +26,9 @@ endif
 32bit-emul		= elf32loongarch
 64bit-emul		= elf64loongarch
 
+CC_FLAGS_FPU		:= -mfpu=64
+CC_FLAGS_NO_FPU		:= -msoft-float
+
 ifdef CONFIG_UNWINDER_ORC
 orc_hash_h := arch/$(SRCARCH)/include/generated/asm/orc_hash.h
 orc_hash_sh := $(srctree)/scripts/orc_hash.sh
@@ -59,7 +62,7 @@ ld-emul			= $(64bit-emul)
 cflags-y		+= -mabi=lp64s
 endif
 
-cflags-y			+= -pipe -msoft-float
+cflags-y			+= -pipe $(CC_FLAGS_NO_FPU)
 LDFLAGS_vmlinux			+= -static -n -nostdlib
 
 # When the assembler supports explicit relocation hint, we must use it.
diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/asm/fpu.h
index c2d8962fda00..3177674228f8 100644
--- a/arch/loongarch/include/asm/fpu.h
+++ b/arch/loongarch/include/asm/fpu.h
@@ -21,6 +21,7 @@
 
 struct sigcontext;
 
+#define kernel_fpu_available() cpu_has_fpu
 extern void kernel_fpu_begin(void);
 extern void kernel_fpu_end(void);
 
-- 
2.44.0

