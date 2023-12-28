Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB62A81F3F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 02:48:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Zz7hnR0w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0ry64PBbz3vby
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 12:48:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Zz7hnR0w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0rqF75Hjz30g7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 12:42:33 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3bbce1202ebso337408b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 17:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727751; x=1704332551; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+RheApEuJN9kaaLRvICyPNbTjOVIvY5kEzb7DbTZjA=;
        b=Zz7hnR0wG40rqZmDuatuFiBPTn5409QiShpaCthANJaclAz3lxWHen0ZLU27jIGkpv
         PB7TaxwukFIMW8jgYsaiKka+qY3benqDLJ5Rwa2SKMybmvShq/W5yzbOjOdSEXnE+RFr
         t4T67KeYvjQ/xoMsPqh+PcKHSA4bsd4Vhc6Fm6aVbMAA9DjgQbdN5vIhhvtparL8/Hlo
         b9Z7picSG6gIAYaEz9Ltp2GyWUWgPK4nBs3S/VA1SORPwPu21Xquw7ZC3Lp3UXzWSsDe
         cOHmutmGN1uDpWHY02rOnTTmTuM193AG3DJTJw2HzPWplcKLq+Vt5F8O/O7b18G7zK01
         zyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727751; x=1704332551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+RheApEuJN9kaaLRvICyPNbTjOVIvY5kEzb7DbTZjA=;
        b=OGF4HgeYxmyKL7p3ABbig1XCXnltH5XRnLdCEWA7jo+upyX35gh93fygF8xRIepir4
         lNlBX2yQ1MgT3ZAHmiqBIkBJMmeLyd/TKtNBmCf8LvJVQ1oIJxr5k3Aqp9Ql9Tvpa0t3
         /2kDUzja2lhP3gpOnUxD/5ABmZBV7FaMaWaPvlWwqP5WWvknYrO+nW/udvgvY/2XFXDS
         0j3CGaw6jgyRYRsKRMhn57F1H0nuht1Fj/cjCU9+ctaAvAeIE77q+Jaav+j3fNTfrRxn
         ujxsu+jVxBreiXjpheUeWrFutt31+cJcmvbXA4ORJu63GbslNyvoeQTYLwGiG71Uqgyh
         V10w==
X-Gm-Message-State: AOJu0YwrNrvFsGekF4m9NTONe03+jfGQ8yfR8LOUlAeKRaJoet73tXup
	qTQiBOxWu/NIa4l0098UxJduuUecOteLhw==
X-Google-Smtp-Source: AGHT+IFlYg0OgNqHd1istrtt2UTcBedE87vqCIVNtp3f0Z5ptnzM2zYPRY9OCADmqV6QIO1pVX8ZnQ==
X-Received: by 2002:a05:6808:6544:b0:3bb:b063:1afe with SMTP id fn4-20020a056808654400b003bbb0631afemr7698441oib.113.1703727751522;
        Wed, 27 Dec 2023 17:42:31 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:31 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Dec 2023 17:41:57 -0800
Message-ID: <20231228014220.3562640-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
asm/fpu.h, so it only needs to add kernel_fpu_available() and export
the CFLAGS adjustments.

Acked-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/loongarch/Kconfig           | 1 +
 arch/loongarch/Makefile          | 5 ++++-
 arch/loongarch/include/asm/fpu.h | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index ee123820a476..65d4475565b8 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -15,6 +15,7 @@ config LOONGARCH
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if CPU_HAS_FPU
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 4ba8d67ddb09..1afe28feaba5 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -25,6 +25,9 @@ endif
 32bit-emul		= elf32loongarch
 64bit-emul		= elf64loongarch
 
+CC_FLAGS_FPU		:= -mfpu=64
+CC_FLAGS_NO_FPU		:= -msoft-float
+
 ifdef CONFIG_DYNAMIC_FTRACE
 KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
 CC_FLAGS_FTRACE := -fpatchable-function-entry=2
@@ -46,7 +49,7 @@ ld-emul			= $(64bit-emul)
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
2.42.0

