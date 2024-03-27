Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA788EFD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 21:07:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=DCUGKiKZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4d432gXDz3vls
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 07:06:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=DCUGKiKZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4cyS4cQHz3vYg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 07:02:08 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e0f2798cd8so2273115ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 13:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569727; x=1712174527; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhRrF1Pu1wTofDEF5NDtSjXNjQrJmyXSgj6gSsLdD3o=;
        b=DCUGKiKZFwwfUbZQWF/NhVCzPZseZj21MU/N7wqPVYPho/G2Z1dDsYjwy6FmxOxW7B
         bIddwo1TCvg7A208cqZeD5nWVMvI0lKygK2Uf6yQKYleOduy+UgaU3LeHWtl52BfVjbZ
         1fyBX2vg52wlfbTTF0wH+W7GWWx+OUrKP9Acd8c2UQZSky4kNGhGSQKHR3VuQ93PqwZ0
         hANh5LpYhRrBf0JwQWd7DHgbiKRXqevQQxYlDtvaoC7hZj5mL6GioAjL2TsjcsPJuuk7
         00lDA6SY4PCxs0eHyG3TohA0dKJSZo6n4rqhCvwoHHIfAFw1RLeJ8RYL8txJGUnKLxOl
         M24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569727; x=1712174527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhRrF1Pu1wTofDEF5NDtSjXNjQrJmyXSgj6gSsLdD3o=;
        b=Wit3JQHeFlNTdBesIxErQuefXghXTyUIF4IQnh+C11tOXo7pFL2qE8pw+25lqa0zMl
         0QFRU7o3uh+He5dbclyxJ/e4S/x8/XBI6X0ebpzlmxbm01u17TUQW7jqWe/nfKG88eXa
         HVTr+hKJQKQMnc+bgtbDCXzOsG8bBtxEb6KdHCbHtCPrewu2xcHdxs3UMx370YRvw/yg
         t8GWEPs99nP+Ql0BVOUo2yjMgGxt5yYHa/NQrfUZzdsOEfyWxqPMnAmh8Tfj8qSeydos
         I8K7OrheiqIj+3HuBnGQCT2dl94jXxZu1kN4zF+J3LIgcuOs6FxhI5B1CNM4ukTRCuaT
         AsSw==
X-Forwarded-Encrypted: i=1; AJvYcCX6b3Uqi/It0wP8+stwqp8KE1NVHBwbd/5cNW/rPrSknT4wgMpQcdMPzmHmsz/j+ke3g/59Y3mRxv65+QnQ4yyNsRRQw40XyQJeWVlwBQ==
X-Gm-Message-State: AOJu0Yw8R2OwLKUE/sRP7xbEZpa5HVC0PreNkWd9EN2D4SgTIuuhbuPi
	GqPjN11tO9GwfYKR0dpAaxqYm1CWVP/p+ipNzZIjdMNFIaWGgBhWQuBngdgpSIc=
X-Google-Smtp-Source: AGHT+IFTdj+7xjr/hkuUZrog62OKlzxWVPjf6p/E+DdPaik3Rv7nG00gWJ8Kh9j7qP1eqTQJrGE0sw==
X-Received: by 2002:a17:902:650e:b0:1de:eca6:483d with SMTP id b14-20020a170902650e00b001deeca6483dmr724908plk.27.1711569726983;
        Wed, 27 Mar 2024 13:02:06 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:06 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v3 06/14] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Mar 2024 13:00:37 -0700
Message-ID: <20240327200157.1097089-7-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, loongarch@lists.linux.dev, Russell King <linux@armlinux.org.uk>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 lib/raid6/Makefile | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 385a94aa0b99..c71984e04c4d 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -33,25 +33,6 @@ CFLAGS_REMOVE_vpermxor8.o += -msoft-float
 endif
 endif
 
-# The GCC option -ffreestanding is required in order to compile code containing
-# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
-ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
-NEON_FLAGS := -ffreestanding
-# Enable <arm_neon.h>
-NEON_FLAGS += -isystem $(shell $(CC) -print-file-name=include)
-ifeq ($(ARCH),arm)
-NEON_FLAGS += -march=armv7-a -mfloat-abi=softfp -mfpu=neon
-endif
-CFLAGS_recov_neon_inner.o += $(NEON_FLAGS)
-ifeq ($(ARCH),arm64)
-CFLAGS_REMOVE_recov_neon_inner.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon1.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon2.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon4.o += -mgeneral-regs-only
-CFLAGS_REMOVE_neon8.o += -mgeneral-regs-only
-endif
-endif
-
 quiet_cmd_unroll = UNROLL  $@
       cmd_unroll = $(AWK) -v N=$* -f $(srctree)/$(src)/unroll.awk < $< > $@
 
@@ -75,10 +56,14 @@ targets += vpermxor1.c vpermxor2.c vpermxor4.c vpermxor8.c
 $(obj)/vpermxor%.c: $(src)/vpermxor.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
 
-CFLAGS_neon1.o += $(NEON_FLAGS)
-CFLAGS_neon2.o += $(NEON_FLAGS)
-CFLAGS_neon4.o += $(NEON_FLAGS)
-CFLAGS_neon8.o += $(NEON_FLAGS)
+CFLAGS_neon1.o += $(CC_FLAGS_FPU)
+CFLAGS_neon2.o += $(CC_FLAGS_FPU)
+CFLAGS_neon4.o += $(CC_FLAGS_FPU)
+CFLAGS_neon8.o += $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_neon1.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon2.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon4.o += $(CC_FLAGS_NO_FPU)
+CFLAGS_REMOVE_neon8.o += $(CC_FLAGS_NO_FPU)
 targets += neon1.c neon2.c neon4.c neon8.c
 $(obj)/neon%.c: $(src)/neon.uc $(src)/unroll.awk FORCE
 	$(call if_changed,unroll)
-- 
2.43.1

