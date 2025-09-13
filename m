Return-Path: <linuxppc-dev+bounces-12134-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 440AFB55E10
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:19:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxMx4Qrzz3cjL;
	Sat, 13 Sep 2025 13:18:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757724202;
	cv=none; b=jQxzsbog4YUoNLMeRqWSdfst1vLe2bJNra8gHcAWB8qc49WufFu+l8BdVtsXDVh+qIT/ov3B6icbi+NwAHF3KnCKYC1y9KogcATGyxAZqlewiqvxaiaszuZ2s3E3MbqFUdtZqIzoUJCIvIiaKzxRIwzlw3/02Dme5TCVK3DF1o1J939XWLr5HmMVLNl6UkfxSU7ssE7qHMnbcEj8YuU08BmVUuNjXhIr9n5rTWV1DogqsqUojvbSNUv89q7CL1nI3dhukaSUyPIFUyEQQes6xHIkFFW70JkGEYGD0hxjIzBnxqUzeCvhOdVA99jELJOaK2xVM8F0BS2ZdjBbmjueUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757724202; c=relaxed/relaxed;
	bh=nBhZ+rO7As9Va0yYpTLBkeUqDA8zrexqjuJeztCSNI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CLVn2zTckl3SUaGNy0tKnFFZAuMXaOMu3f2mQyAniTNLu17Rz4ju2egpHNL9RX1xsfsbqDojMLYTWvXu2ZrevQtPEzUa91fD2KsU+CVKRxmEJP3ecE1s7qqX+22EiuOmepVqyQgroLuBfJsn2Wyhk2xHcHqKbc70xHKTTJVul6QQjYpK9pvmjpCDJE3vwg/lqwbqRF+oD8VvuKpBzQRv2ZDln7rsM6r63mFO0PD3DqKvyEWUDqzU5By6JZ7ZZQ2sFLzN4D4RYQQ7xffxE3ZdWuALXUd42pIxnfATHAsTRz+hVnXn6bbSKByDTKL6y6EKbzro379bhvhLy9pHeEQVWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B3LESnf8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B3LESnf8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNswS5Wlzz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:43:20 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-62ecd3c21d3so3046026a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724198; x=1758328998; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBhZ+rO7As9Va0yYpTLBkeUqDA8zrexqjuJeztCSNI4=;
        b=B3LESnf80IMXMg2opU+0nEncZl2si1qMz4o1ue66TaCbjokENnHtNSl2UYQx7TYz6/
         7mrJuqy76BwG89DtODvcLeLrVPQtsmg1rmlapDOdqMO0BC6XYaaFao+H4eEv5Jw2LWjz
         ZM5Ka0iZQ9dBYheLvXYnKZhjgdC/SvvT1Zh1MCgJOk18ou1vaXGoX0uTssxUFjaj3QH4
         O/1rc2GlBB0kRBzYF28a/gFWd3j8bnK4qgJwj8eLzy0ylKa+Ikgkkqg4ymL2t23zPKfC
         u6QhrusEsSPnNWw9fha9pOICyGgCGmvB3S4Ads597AfsaRBrllYCOdE8CXoM4wUvRsIG
         oHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724198; x=1758328998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBhZ+rO7As9Va0yYpTLBkeUqDA8zrexqjuJeztCSNI4=;
        b=uWZ9equzEpN0dYV7zqZoU596n7nzGXNFmmNFoPQn6k3/paxLP4NuIB+gOpVcs9J6Os
         wjFaPJYEeWZ2dcIKJhpdW1CF0CnSyQMcVHEj4hGp1f64JhZ67tQwu2EKREStHQCahvn2
         5fNBF8R9KrsX86pIuAisO8vkwYuppTcB3HyEEJj97Udhes/j6o6bXZTOWl+7p7AbxMPX
         G27Pmc/eg4V1EzZwfKJ586/Jf/E5CJQ1Fea5fOj5Ug/qwbOYfJoqJB18hMaZppWFqgRO
         b28orXkzluz6aGVqDu+2s0XL3/rgR6UyjlO4mdok+G0acbj7/5G1MyCelMjoGj0oK3KT
         ruTw==
X-Forwarded-Encrypted: i=1; AJvYcCWwfbcBw+ORbkc7NXGRaryU6In4YTB2tf3FM1ZaKVAcDXe1L3KN+kAs6Tf7azwMuHVfGNoec1DMc4dpors=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9SLPngXtNVTsO8XkSwcEgUpcrF37V2BKhSyFu4Yle4olMhmqX
	hbtvqAKpd5vpgOEpXtbFYnRJcYpURUAHqPsSPNh8g5p3llY+jpIU1L08
X-Gm-Gg: ASbGnctHP6m3lj23hPB6OvaNivBsyVk/mGLhRrLqwyCWZKHH4gGhZ9F8cGgsrM/vsTi
	7UwyuZWjKq9cdzX1K04jFfhkCP73Fu/zOTB3rA0vuCUQ7xaIM0qs7f1NeyXuenSupvfnl546Ku1
	ygAmw2+c4/10XFjurseRXPMGRGAyES4dRZqrVScoFxCxZ0Y4Y37ZWttEQlSxMryMTzEY4lktgXl
	jOm+vcW1oK1A51ZbvDSJYzHIYXd3ExczBCBf5SLN2MjFvEkPUURmTdCaJ72xnXRS2/5ZTslYdc3
	PwujqqXIXSaZHeNIAQQtwfrW6gZX2MfAlf4ljLQPdcEFX9aR4TEmto6a5aX21zU+zM+Hh0BrSxX
	kpXbds4IG4N9gaTd0LbY=
X-Google-Smtp-Source: AGHT+IHHzjbduKroQCN+yZXT2xkuDjXRSEwS3nHiIMvASVJIn5ZPiks4NchkJZtKdw5/XwXcHwo3Pw==
X-Received: by 2002:a17:907:9405:b0:b07:c9b2:dbd with SMTP id a640c23a62f3a-b07c9b20f2cmr456569266b.4.1757724197720;
        Fri, 12 Sep 2025 17:43:17 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07cd14268fsm196477866b.3.2025.09.12.17.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:43:17 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev,
	stable+noautosel@kernel.org
Subject: [PATCH RESEND 03/62] init: sh, sparc, x86: remove unused constants RAMDISK_PROMPT_FLAG and RAMDISK_LOAD_FLAG
Date: Sat, 13 Sep 2025 00:37:42 +0000
Message-ID: <20250913003842.41944-4-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

They were used for initrd before c8376994c86.

c8376994c86c made them unused and forgot to remove them

Fixes: c8376994c86c ("initrd: remove support for multiple floppies")
Cc: <stable+noautosel@kernel.org> # because changes uapi headers
Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/sh/kernel/setup.c                | 2 --
 arch/sparc/kernel/setup_32.c          | 2 --
 arch/sparc/kernel/setup_64.c          | 2 --
 arch/x86/include/uapi/asm/bootparam.h | 2 --
 arch/x86/kernel/setup.c               | 2 --
 5 files changed, 10 deletions(-)

diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index 039a51291002..d66f098e9e9f 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -71,8 +71,6 @@ EXPORT_SYMBOL(sh_mv);
 extern int root_mountflags;
 
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 static char __initdata command_line[COMMAND_LINE_SIZE] = { 0, };
 
diff --git a/arch/sparc/kernel/setup_32.c b/arch/sparc/kernel/setup_32.c
index 704375c061e7..eb60be31127f 100644
--- a/arch/sparc/kernel/setup_32.c
+++ b/arch/sparc/kernel/setup_32.c
@@ -172,8 +172,6 @@ extern unsigned short root_flags;
 extern unsigned short root_dev;
 extern unsigned short ram_flags;
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 extern int root_mountflags;
 
diff --git a/arch/sparc/kernel/setup_64.c b/arch/sparc/kernel/setup_64.c
index 63615f5c99b4..f728f1b00aca 100644
--- a/arch/sparc/kernel/setup_64.c
+++ b/arch/sparc/kernel/setup_64.c
@@ -145,8 +145,6 @@ extern unsigned short root_flags;
 extern unsigned short root_dev;
 extern unsigned short ram_flags;
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 extern int root_mountflags;
 
diff --git a/arch/x86/include/uapi/asm/bootparam.h b/arch/x86/include/uapi/asm/bootparam.h
index dafbf581c515..f53dd3f319ba 100644
--- a/arch/x86/include/uapi/asm/bootparam.h
+++ b/arch/x86/include/uapi/asm/bootparam.h
@@ -6,8 +6,6 @@
 
 /* ram_size flags */
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 /* loadflags */
 #define LOADED_HIGH	(1<<0)
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 1b2edd07a3e1..6409e766fb17 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -223,8 +223,6 @@ extern int root_mountflags;
 unsigned long saved_video_mode;
 
 #define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
 
 static char __initdata command_line[COMMAND_LINE_SIZE];
 #ifdef CONFIG_CMDLINE_BOOL
-- 
2.47.2


