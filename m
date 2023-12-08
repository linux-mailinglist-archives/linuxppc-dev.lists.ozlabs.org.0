Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD72F809C15
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 06:58:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=NcT1CMBk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmgRW0YsFz3dBD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 16:58:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=NcT1CMBk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmgMx1MQLz3cCv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 16:55:09 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d0c4d84bf6so12995765ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Dec 2023 21:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014906; x=1702619706; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqG7sh4TEQnomN1Pb8iughMffScuejFKYmgaMeTCLmM=;
        b=NcT1CMBkHpSDeWuhmYwKKyoqKLQhAu7TK71KmXkBRb6eVFLn1HnukwBp+qTf5Z9mGg
         QQWM0qO+lHn8+/WTXKLZP05CHEg/GwSG8G0AsGQYh4WU/r3dLLzrolu5Rf/naHChlkkV
         9MpJs5+hPV7OjoYgHMfKfBkRbR/OBsFHwioIog8myqq40bcncOTvA/cFhIJpQ0lUKnL6
         8TFBr5rTChc64lhkdMC/2Os36e0u6RUHH7d5pqwTO2pJzKBhICxfyYeWW1Z8Muj8dHP0
         z8dDuYSoUZTVoNCqZJyamiyuyv6dKPwcJ+SXN/gONBBjvg5VOG5j2VEmVBnQTGxXLiqg
         wiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014906; x=1702619706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqG7sh4TEQnomN1Pb8iughMffScuejFKYmgaMeTCLmM=;
        b=LtDtuA/xBokU3u04UyYzhxqS8n1eYkKhtgCwwaUxVIXt9ySe/GPL8D4W6iEgXoeSW/
         5e11Ws874iwtn5CBjKpLl6vz2HLnS4icqEdvmf+DlEaYTe9adoUmbZ3E1lpqSUrJjM0g
         q8OcsnZ8lQC3c4HM+xdPE96mqKO2ciTUjUtiNFb3IGheXSaLnZ3dWJcY9oU2l22IkwWl
         VtVPlPkgtS9G5uMbXx9YuuHEK8GKmPL9yi6CdCtY1ewcr4tIqH//oCaLeMAEC6OkPujz
         12zuLFSOPzXts4No7L7l2OGe6tVaYrVLuXgjvE0dMRtYUXqX0nAZO1/Rir8k883yoCww
         w0ew==
X-Gm-Message-State: AOJu0Yw5TQEyFSIwIYEwKfgvqm0Jc0vTR32W32Sa5nYCHoD1RwuRPCn5
	CZ3qpBCFqswV+AgWgNwv4WmDtw==
X-Google-Smtp-Source: AGHT+IFmoFC5Jy7QDutaZzebMhgROVCbFnFB+FkSDZrKf0b9QQV81pWWj0y7Aq09xAemAJ7UXgVmYQ==
X-Received: by 2002:a17:902:ee45:b0:1d0:6ffd:f205 with SMTP id 5-20020a170902ee4500b001d06ffdf205mr3064563plo.91.1702014906581;
        Thu, 07 Dec 2023 21:55:06 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:06 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Subject: [RFC PATCH 03/12] ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Thu,  7 Dec 2023 21:54:33 -0800
Message-ID: <20231208055501.2916202-4-samuel.holland@sifive.com>
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

Now that CC_FLAGS_FPU is exported and can be used anywhere in the source
tree, use it instead of duplicating the flags here.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

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

