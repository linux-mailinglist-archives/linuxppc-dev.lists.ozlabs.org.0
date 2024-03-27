Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD8388EFC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 21:04:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=i+0PPP4x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4d1W62hYz3vgr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 07:04:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=i+0PPP4x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4cyP1Jdfz3dXg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 07:02:04 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e0b889901bso2370155ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 13:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569723; x=1712174523; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3VQJildZHY1Bgj6r2iljFMqpw+vWq4Si7He8vtNBY4=;
        b=i+0PPP4xHxdPitOQe3jsfCrAEyUhqQ8sWtxvQIVtGQldhiMNTfAhG11TTKqwsvnYr3
         AS9/FEipATlsHkMmD3jUtbwVJS2JhGhXwsNcjciTw9R46Gya+X5Au8aUluzx9mCWBydj
         XkL/ZYLjkSagpOuWnfHMQ7p0nsxNFu4CKTIKXa6KIZlfYgY9LJxIo74OibkW+8zMZFQ6
         Sd6tPUOTI4odJhF2h75A+O6SDPl+Dqs1p0sYWLIZuYYl1eOHwSpuomTW9USdogrQ+7w+
         1il4DxWLPbli1MsYC3zDFFmdjBowmZt3dPVCVPBosXoAyXhY3kfEwdInYzA2jqrPsxuj
         AkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569723; x=1712174523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3VQJildZHY1Bgj6r2iljFMqpw+vWq4Si7He8vtNBY4=;
        b=PbGM5AQgAD221ItI5fOEMd98labWRB9H0Onb23KS5PUpNTbZDQiYLsKlSROls7Zhx9
         YOttSn7ApmCAK5K7D/lmHJs2Tv6IZLCYVH95lR+Nlvj8sYbATTKTQS0KTc2MgCDad1UZ
         SKptiY0yhJsNfgDnYq0UauKnMu4ZRqoemZvrqMTMd/Rf0Beber5BK3YtyTYJYlcsZiAv
         n4l/8HgJxMYGSfi7KJWy1fzR+ZL/rGkfEPE0TuEAPXder/xtjTrgSMGIWkbc4atO1oFg
         oyt8Hl//79xT56wNMP/5E/v5XVr51drmX1yG7isGhEpSRS7+SWZxNR0DjtlRhVqwDfCe
         cO8A==
X-Forwarded-Encrypted: i=1; AJvYcCWtYxIqfldyB8VxyH8WHCntjVhLGEeNYKmo9opPD6gsAR0SwgEg6XLw7DR3YoLehNaF+hDy0enOUWafGvm08fHfgIbTPDyVnfZ/M9RA0A==
X-Gm-Message-State: AOJu0YzwHtjIgvU5ZzIijAX96ivI6P6MF3L6FQHbK6GskYvQ6Yypf9Ik
	cajFQtUyJsR9AH/mZ19Mc5HrwRCNxcLFvXUEZOCzXncbIfXfe8PXGbIzbZu9xi8=
X-Google-Smtp-Source: AGHT+IHYrCNFuZi7JM5PzLehk0tocOhYuLDObxCk9XIqMJvg9sySawc5MBuX1NvDT7qWP/3i+9Szlw==
X-Received: by 2002:a17:902:cece:b0:1dd:c7ea:81f3 with SMTP id d14-20020a170902cece00b001ddc7ea81f3mr964085plg.1.1711569722972;
        Wed, 27 Mar 2024 13:02:02 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:02 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v3 03/14] ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
Date: Wed, 27 Mar 2024 13:00:34 -0700
Message-ID: <20240327200157.1097089-4-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, loongarch@lists.linux.dev, Russell King <linux@armlinux.org.uk>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
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
2.43.1

