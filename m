Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F73581F3DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 02:46:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=frzZ+pGD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0rvT6SbKz3dK0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 12:46:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=frzZ+pGD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0rqC2z1nz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 12:42:31 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6d99980b2e0so3360891b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 17:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727749; x=1704332549; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoxXzLgzl7b5Y0xu5pjyo/VkU/XWb+SGTLxU4jp8p0k=;
        b=frzZ+pGDWECETl2lLstTYnu36XYq44pgQh8SMpHOtZtG0E1FCL/YmBnY8wwh7heVq2
         WRflSUr/T3iW0fX4LTn6t0B47w+zNwZ3oZliqzGOzPFX99penO9ONWyVqmE36LoqWJvL
         Mka/EmzPW5GgRn00BrZCgZV7gV+cqV8SOFrDCJCHC/w6T4hM4Ft1NlNdTIHZhPLignZA
         0udWR3K9ycA+hoFTOe+ggocvXaIA+YiDRsS+9CcUaUwkTZSK7ZM4WMJhbVfFfT0PZkug
         +5caqlqpC21EK55725cIyVUChdvfpp/y7mCi8uWAq03qTZKOGR1iTrlcUtizXb2EJQVV
         +fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727749; x=1704332549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoxXzLgzl7b5Y0xu5pjyo/VkU/XWb+SGTLxU4jp8p0k=;
        b=BbcTk7VkxAUAHQisvlopt4gENbj+Wdw7sJBPX0EA40PIbE7znuMeSswB8ZQe/76i+o
         ktalcemqrhjki5rvLsA0nX/pzfqxwr8z8svK6bYlN+3h2jZIuAXjhpnNlC7B32FDoKku
         Mjr39In5fFgscoam7o51za+4K158SVQyPNV4Zy+pgiHkznvf4AHV0qKTV2FIXJjcMqgp
         zZZPiCBxE8u+S77yUTR0ny5EStrcW+xF/l6e1JbfbYElvzMpyi2f9sM6lTGbFWdSFQXh
         Jk6nhnLU1UYKLw+WYY9xSWvfLFrhr7+393i2tX4kRlOP0tvusZERUU2vTZGUgLBTTAlI
         S5Gw==
X-Gm-Message-State: AOJu0Yyvlw1Gsntae8iKXGgHlGYtWx6X+m+xlylUYRrF+3W/ETKBx4DI
	u6U6VVCZExT+PKWe1WaPdp9JlmoEfZP93Q==
X-Google-Smtp-Source: AGHT+IFXwothAr5BJIcCMrRvq4/mKzewsdDIu4/j3geKR8xiDFkrXQfFhz/93Qk1mZI7uGYnkNSdng==
X-Received: by 2002:a05:6a00:4c81:b0:6d9:bc67:82a with SMTP id eb1-20020a056a004c8100b006d9bc67082amr5349494pfb.54.1703727748958;
        Wed, 27 Dec 2023 17:42:28 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:28 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 05/14] arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Dec 2023 17:41:55 -0800
Message-ID: <20231228014220.3562640-6-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, Samuel Holland <samuel.holland@sifive.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

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
2.42.0

