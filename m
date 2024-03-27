Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3865888EFD3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 21:06:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=SFvlTTTn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4d3F72nrz3vqg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 07:06:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=SFvlTTTn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4cyS2LZNz3vYb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 07:02:08 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1def59b537cso1590845ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 13:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569726; x=1712174526; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9egB7QSoDAHRW6tgRYqVd+NUTiSQfL/JcKX7OjtD5w=;
        b=SFvlTTTn0c3GXkNjT3TY40JmaNlVc1NtyhZHyvteh4RSyM+wtu19E26Jg9mHfJe1TO
         c/4IS6JYOMB20AlmVKrmZzZ/oR12SEyZI9mQaHmXUFj95/FHUObj2/8T3thnUkOvpWI+
         wTVjgWLZ5LoRV+SQp+HUOGPbzioSXxdtJeOAOkuD+mbjaLAG10CGwuVbu7rVad4Ig9Wn
         chQpyxNKu3GgZ5H7sp3hH+x6yLySZWcDAUNFB6ANL1TVRu/XJjklJmroIbVjf37vQWtT
         +WKuHWVJMDGp6FwZ5jPukTyRPlcYW2jejbryyPvaeaZyYNCb46yB5w2cj7Ft7emSqaOK
         Gykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569726; x=1712174526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9egB7QSoDAHRW6tgRYqVd+NUTiSQfL/JcKX7OjtD5w=;
        b=oozfsRcyUJL81kA0ZUorDl/ajTAr7E7sIuHZK+J8FaIfELNYdUAUDuQyC2r/1fIBE/
         pVaBjfMDmPHokIXiBHppjsRDB0sBRbFm2yp/2SHaf+2cXs4iUuVFYkwwjA7bhvK3D+Ko
         nTxyDIEtTYowG/ik3WtJ7Kk+0W62hXjoWyH6v+sTdiXolf6gbrHVO2wCZzXbBfwkxvvf
         X36+y67b6e5oMhQaYxOVPS7WKhZcNAU3mpR8HrMvYUntbK5foa4wEWNgFjqqLcUZlWdM
         BTqjcke0o1AE4wYD5iI5J/x5/nCmu3p3Q7vQU0IAGyQ0d4xh4LzMKzCKuglKJ2trO8p7
         tX/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlTtHi1+9Q2vuoi/EMtVQm5MYcHI3/wJ0gnNh3HtJhu9v/xFk8vvKF9Gf346EZfi+kZ+x/QF2JjbMVQwD4t0uxtd+SFTpwgqItXdI20Q==
X-Gm-Message-State: AOJu0Yw+Razop8XtetpAhPQviS+BNHL92LdJ3EVDKoL2coMotwLlrxPr
	AiafyxkE259MTTgoOPMN8pK9s+U4oOvIW2akvDgv9jPGtaNwwqRRexVdYyrPIWs=
X-Google-Smtp-Source: AGHT+IFGHdi74bAZSMUCS5nBpcP7LI5Cfqz6VZFaIDx36rlYRojmLVaB4TIyZga5IdN5tuwaxR1nKA==
X-Received: by 2002:a17:903:2b05:b0:1dc:a605:5435 with SMTP id mc5-20020a1709032b0500b001dca6055435mr854470plb.31.1711569725718;
        Wed, 27 Mar 2024 13:02:05 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:05 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v3 05/14] arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Mar 2024 13:00:36 -0700
Message-ID: <20240327200157.1097089-6-samuel.holland@sifive.com>
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
2.43.1

