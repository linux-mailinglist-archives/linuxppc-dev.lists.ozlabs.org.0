Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F93809C0A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 06:55:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Tttrp8cy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmgNk28hJz3dJp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 16:55:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Tttrp8cy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmgMv3KqTz3cCS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 16:55:06 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5c66418decaso1226874a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Dec 2023 21:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014904; x=1702619704; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cT/f+zG+eBk9GDNM3PRDRS7FWs4vWVwDUJpda1v2enk=;
        b=Tttrp8cyBNmtdpxKzAto9XSNXCMFM20ryU8cUAY9FTt70Hy4TsYgxZ0BxhxagYx4DQ
         kY8JztOFQrsQ4DKcA5UoSmoPEoqKPwYhkSV96D0pJ129FPg6Ubj41qTNTwOHx2q4Rd1U
         ipzlLpxRHJ4lb6gufX5gfpr17Po8teJO/S4ow8MZQMgIJCfREHGdgqmKIUKhpPOqWdJE
         5NgXPAsdupNlHr/FYYJ+Vl1/5o2ZRpAAvUmFUoEySp9R3W1J/Ph58rXikFcSZ0cOrw7E
         7PFtptB/3H+lNOHZA9X3kBFPAb0utdCk4CQjARsIr/XKhSZR6mPZZ7DeKYbM8rd9ijtZ
         D40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014904; x=1702619704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cT/f+zG+eBk9GDNM3PRDRS7FWs4vWVwDUJpda1v2enk=;
        b=Su930RDBYW1pLOb5loHpWu7EniR9ewghqSmM7T+zveeMukuLpmMlg2jpvGbJ3GAPTG
         qlXjJ3Ign42frGh/N91J4znxgWL0srXb5hCiFm9qEywUACIC/x0v0LCbWcOx/BYa02eh
         Y2zWMJhxFZsggFNEa2g/1uVkTXJ0XkczGC4hsztp/QtHv2XVws9N8tq2Wvfe2vqYFbI1
         88IZhjI2GTeVEBKMV9EMBTa/HxG3nYExDSlOP3G5o+Uu+0Tbt+9jfJ5ZNGOgid3d1BAe
         QriVHgVL/FbZZ7m7RYwmKGDuoUN4GZKHTVCv56cTDdXfcIMTJtssQGclA6TtdQBTUMOI
         K/7g==
X-Gm-Message-State: AOJu0YzumdwoggsiBwcpq96EfCbQ34Q+XOlmQuW/vibziiC6wb+Q4hn3
	xaVUtuiJQ0hvuvUheaCLJxH27g==
X-Google-Smtp-Source: AGHT+IHjHZOPQupU2gBIY1LJy6ZLE2Spe4muScdMLjHj9er/qEsoCLB+Of3eLXhwYzBMH5NUihe96w==
X-Received: by 2002:a05:6a20:160a:b0:190:14d9:4797 with SMTP id l10-20020a056a20160a00b0019014d94797mr1355279pzj.4.1702014904099;
        Thu, 07 Dec 2023 21:55:04 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:03 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Subject: [RFC PATCH 01/12] arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Thu,  7 Dec 2023 21:54:31 -0800
Message-ID: <20231208055501.2916202-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Several architectures provide an API to enable the FPU and run
floating-point SIMD code in kernel space. However, the function names,
header locations, and semantics are inconsistent across architectures,
and FPU support may be gated behind other Kconfig options.

Provide a standard way for architectures to declare that kernel space
FPU support is available. Architectures selecting this option must
implement what is currently the most common API (kernel_fpu_begin() and
kernel_fpu_end(), plus a new function kernel_fpu_available()) and
provide the appropriate CFLAGS for compiling floating-point C code.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 Makefile     | 4 ++++
 arch/Kconfig | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/Makefile b/Makefile
index 511b5616aa41..e65c186cf2c9 100644
--- a/Makefile
+++ b/Makefile
@@ -969,6 +969,10 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_CFI)
 export CC_FLAGS_CFI
 endif
 
+# Architectures can define flags to add/remove for floating-point support
+export CC_FLAGS_FPU
+export CC_FLAGS_NO_FPU
+
 ifneq ($(CONFIG_FUNCTION_ALIGNMENT),0)
 KBUILD_CFLAGS += -falign-functions=$(CONFIG_FUNCTION_ALIGNMENT)
 endif
diff --git a/arch/Kconfig b/arch/Kconfig
index f4b210ab0612..6df834e18e9c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1478,6 +1478,15 @@ config ARCH_HAS_NONLEAF_PMD_YOUNG
 	  address translations. Page table walkers that clear the accessed bit
 	  may use this capability to reduce their search space.
 
+config ARCH_HAS_KERNEL_FPU_SUPPORT
+	bool
+	help
+	  An architecture should select this option if it supports running
+	  floating-point code in kernel space. It must export the functions
+	  kernel_fpu_available(), kernel_fpu_begin(), and kernel_fpu_end() from
+	  <asm/fpu.h>, and define CC_FLAGS_FPU and/or CC_FLAGS_NO_FPU as
+	  necessary in its Makefile.
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
-- 
2.42.0

