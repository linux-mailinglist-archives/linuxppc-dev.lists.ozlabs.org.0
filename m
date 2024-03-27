Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9213E88EFDD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 21:07:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=YTJxsMbN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4d4r2S41z3vbg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 07:07:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=YTJxsMbN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4cyV014Jz3vWy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 07:02:09 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e0f3052145so2329025ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569728; x=1712174528; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZE0ell9od5iMx/niXSnkXHAkP7o0Zji40W4vIuo5Ic=;
        b=YTJxsMbNwDcEv2dJODAvA0yGEni19wOeJ2wSi3vJSmTNLYXbVKqjK0OHetkbHb33B4
         IAjrvqbJ4XvZ4JZX8cEek9qWMDgHN6BsBa01io/wX83HWziZVSYoF11r00iaZ4Z/VOhA
         LzpwRD6vRFCoD8sXXh3SXLS7tkG1e87vto3dPTYeYsG2xbSMjjPP1C5qtikNdDdf/iat
         EG3gQlUqQY9+dyZZG0CwKcHz7d0XLvkVQLPSoM9xuxPUeP8+B73M4s73JO6q1vAKZowL
         oT4ysdxQLstEn2oqmhGkxLRRrZdVg21Pd5a+qeEXv9BcZtd/bkcRZ/s01UybutbScvqv
         MGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569728; x=1712174528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZE0ell9od5iMx/niXSnkXHAkP7o0Zji40W4vIuo5Ic=;
        b=wyy6xofspzaAKTz+MxOXOIjrC6fVvNwaJJXU2UxRf3M1E37Gc0xZIYXWUNZekPfKFx
         NDQm9Zp2nG3n6VGsPO4UejmbBO6PQ/olRbw3G+et2Grk7+YicMOSCi6Jqj9eq1y6Yy6L
         p9/gKHIId9bmZ7by3IFNe0T+sHqzg8orCsAtvwNTyuUjgTko9lO4LdO2diWkfHUYw0qO
         w8MhssyiBqGgSgrDnZAZoHS7TJhQlww4S3dQ1BTfXYtUSSR/6gJhFBQu66Sw6YmXd3Qv
         BiO6gh6nWvJE6+3bP679kfW3h7JDPEVuF7e65OwN9B+/qjAhsfKPCikoyhRLnbgoQetR
         1hVA==
X-Forwarded-Encrypted: i=1; AJvYcCXr/JzhH+WpzOV9LCbVyBLtggQ7UWpN+iY5t+DZkUPGomTt5f9LMwOVLJvxbVbgev4xwqSsLKW8GHR/t4w9IfiVpb/gejK0yqfPaYTnXA==
X-Gm-Message-State: AOJu0YxVkr/XumeKFQs3GBRQzQt/1d3LapaC87Bqt4QYQQ980d6/oqta
	BLXxkZIr4wPRBEQih0stAIOrHMdYLy8CWyGkHO2aFGln4RenxhBZG0ok+XcGJMg=
X-Google-Smtp-Source: AGHT+IGM9v2q1Bg0jHlsJFItc73WPBzqi9soPcoc57OB2ZggdclEbNRISa4ohk9keY4487ms+Vhuaw==
X-Received: by 2002:a17:902:d4d0:b0:1de:fbc2:99f0 with SMTP id o16-20020a170902d4d000b001defbc299f0mr957547plg.2.1711569728307;
        Wed, 27 Mar 2024 13:02:08 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:07 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v3 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:38 -0700
Message-ID: <20240327200157.1097089-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
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
2.43.1

