Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B07281F3EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 02:47:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=k1rQeAMD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0rxF0cWvz3dXW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 12:47:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=k1rQeAMD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0rqC5WLQz30h0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 12:42:31 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6d9b13fe9e9so2461544b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 17:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727750; x=1704332550; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jd6BNzjMN3b9R+N9FmyfxlTWIL2mCpzUIRSa4mv1F0=;
        b=k1rQeAMDFH1T8GgeBapt0gesGB4vAp9T5qZsJpDBZsXRlCHVNamNUB0s77tzQdC+nv
         m1y5IBtvftVt87uX/DFkgW8yz7iH/hzcq5jL5tdTt6R2yra367PfTySa7lT84qzH79Ct
         rd2wDXygXcnYpGrsNa11Y0OtMWcyqsJhbv0V93fU/peCgK/IrQcOHP4mwHCkdiXhkwwY
         H5T14ZpbfterrrdmE6D/dB4defY+eMRnsSWi3PH7fHUHfFT2DjXbz6WTgb9eSPc25ye1
         m0wIUdJyo5C433ch8GEd3g+Lx2FJ71CWYuTuBw/c77j2VOjCbhvomWvVK1GyRqxRat0P
         E2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727750; x=1704332550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jd6BNzjMN3b9R+N9FmyfxlTWIL2mCpzUIRSa4mv1F0=;
        b=dJsCxqkqwo8ZCzJSZkbhaHttwHvqVMWsXFc5c7dYRxQt0KRJ4PslkDF210Q6vL7klv
         4xKexBY/cEYonPPGw0ZLuSUshZNAhGsv1EMkkccpZ6cOD5hlrLRwYxJM0c/N7yCMwCV9
         nRl5RjRhV4iEsLppAjoHPwP9GNFyWzCc/IRPpznNBIxiw6FZjpWkhLFpBZjqtrEIJEux
         bMnmpeZBmr7PElPmToVhLM/0Utr7iFz4jGS+zpDEbLAYfoqgoqukEDmd5bih4JDL7eZc
         B5aIeJ9Fx6XiahLrDghLsFH4/xsrXn3qwVToIzClyYBXK6dp3G8PJ68NiZGtHa85OuG6
         tfow==
X-Gm-Message-State: AOJu0YxPixkvBSYEwMaO7g90BLgUcNr6qwYscx3zdjLSDmq480UZpIiY
	VDt7D6e2gR9CPAMbFUe25BesgCES/F6nEw==
X-Google-Smtp-Source: AGHT+IE0nmjtDXMxXkCsxA9jA/OWEHDhYnPM1dnj251PyNU2gTBGhxX93h+FmlGsyJJp6FOxSnIuVA==
X-Received: by 2002:a05:6a00:214d:b0:6d9:f66a:b5f6 with SMTP id o13-20020a056a00214d00b006d9f66ab5f6mr2059083pfk.34.1703727750207;
        Wed, 27 Dec 2023 17:42:30 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:29 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 06/14] lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Dec 2023 17:41:56 -0800
Message-ID: <20231228014220.3562640-7-samuel.holland@sifive.com>
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

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 lib/raid6/Makefile | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 1c5420ff254e..309fea97efc6 100644
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
2.42.0

