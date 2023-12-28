Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD681F3E5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 02:47:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=XvnINab6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0rwM3HSkz3cVg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 12:46:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=XvnINab6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0rqC3v2tz30gL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 12:42:31 +1100 (AEDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-204520717b3so3179293fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 17:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727748; x=1704332548; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJe+2iWG7zhbu2gjOAPKG3r+a1/tBb6PXcWtzUfSG2Y=;
        b=XvnINab64AFvirxxxDPcw2IvNWPCNQw+sGes9ap4GCe7Qgv9NSVhfdMv1rqdCfJVfB
         AK7BuTMB/9U+fD9Yv8aX3O2eV/WwP3q7A1kD455h5N3Wb/Sara6mnE9yGKPni41z6FJu
         0eu8hK9Jn9F9ni+VN1RQYB7cBwVWIQeXcnCoQ7xjTOXsZYKdOnhALWq6XsNKUQNERB/6
         OvPmWYGjGisyqrN9PneWS7lM+SeHYASOpJM+2yfM7Bqs68pN7F+0r5UUCuOZcMATxpV+
         zYoEK1zL1hwMMQsSfYZ6JvKjd56VjO6vaHIy1tQqFErKJ/8hO3LRqgoITeYzUIYmskwL
         OkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727748; x=1704332548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJe+2iWG7zhbu2gjOAPKG3r+a1/tBb6PXcWtzUfSG2Y=;
        b=Q9aiTu2bCYLrOHc7HG13PWsDyZHOPIVZS3dpGdSLkRmXZCOxpKsPrJVpUOHX999yaG
         9Ta0O5cmnMuqZDhOySAX8ZE6n/gFAF7hKZvw+zPXCntIvxfMuRj1QfthSWWAZEpJbuuN
         g7dmwt6rxt6sPvYAFjRFGd3odWW0bBeNpSFjLcZW3mMEFK8s5Myd8SAX/+nptGP3pr3V
         SsPEDXpsuItuXm1VeNj55TQ+HhqwqPV+zZoA5t+H7Vd80xcdwUpblpWUOQcySIT0DYvt
         lv2sEiXxmpjKeM8JH/J1wGtHJKs3OgjYnmvuMZ9ZME75PSE7VZLrqKE+9gBrPmiLIXKq
         0aqw==
X-Gm-Message-State: AOJu0YwlkmaQErkZBvmqPDjeVrPFzl7sW5EBqCKzAGD/6B0lBK8b6PX5
	7O3xfXf3HG3OrkWDPcGg+KJeJYXVrmmvXw==
X-Google-Smtp-Source: AGHT+IHYZaSMdp2QaO80SoY2qT34DsaM+IszcA+ix/EbDuC7szn+dKwMtM8zlpfibfh9dbJ1h4v/ng==
X-Received: by 2002:a05:6870:355:b0:203:e0bc:5e11 with SMTP id n21-20020a056870035500b00203e0bc5e11mr10237951oaf.70.1703727746413;
        Wed, 27 Dec 2023 17:42:26 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:26 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 03/14] ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Dec 2023 17:41:53 -0800
Message-ID: <20231228014220.3562640-4-samuel.holland@sifive.com>
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
2.42.0

