Return-Path: <linuxppc-dev+bounces-12162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FCCB566D6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 06:40:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPb7F1zTrz3d31;
	Sun, 14 Sep 2025 14:40:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822303;
	cv=none; b=XGxaRZmqKZLaybGg410Ti8rIfIBNVs7EYNe2x8K3jSG8FQUBb3GlDVoAEewRlW3iUpDnOlS8JG5axDe5j9zgJwwU5SDV0NZw/PBD6i9o20/PinaZzU4bsDy6BLLZG5asC2FmorGq+L/jA0WHwtUXlYWv188qQPmjWEvEJZBWXoo4vmNwZnOZXdn2sBbVyMCBqjdiEZinVOERQ6CxfbpAKu06BL67QG7OPadN3qzxL/b4FBgsRjKl72FJ2LjZjXw+V8kWQZ0xVOLzV20ZFa7ajFDqBkxCRqpNkvarfEF8apFzxc+O6c6U01wmCgLx2qBkNOB2jmRuEcP07291LSrQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822303; c=relaxed/relaxed;
	bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0qrsUeYcSfIMOgQifeRtEaBmvxHmLPFQ40ZPUZ/GQVfheymkrM4ptI+KGGbUm1UaZAHrt25EfV/sE21I37FMTwpFhOS0wnMfTo3nJalmMCPtkX0bkbEmA0JHFVoMJ6mOpiWmSnkmqry77Lgc8PDgFinlxjqFKIN4Itclm6yR0TSGtrNRDHbQEUQcS/YZshC/tBtAk2boNhtpMNdAhWOUlQclOhiHTbV5mojJQ8RTLSE+1D3OOaK80AsrN4FyUnNq+4xouamRZMqQg9VnX1bPPpWFn7ByY5NxP+SMlC1nfTxxg+xDwpFkkKcReYocV1gVFjB0gBF+ysefNG66vkAbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SFjVTvcN; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SFjVTvcN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZC256Pvz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:58:22 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-62f28da25b9so366157a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822300; x=1758427100; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=;
        b=SFjVTvcNVKSchADniQJ/50vNE/yI3RXR6uXTAqk4qnT6u+XXTnW2l0cV2QZ1n7AHSZ
         93R7ZhHFXPmP01j5xxzVfVnzkXETyEazVWJ2u/oqMWzngSRlOntnTVthCwXrxw0wzNEk
         U8gA31AWI1vn0LSeetezNh9s+HW3svotylnjdgvgj2KhEwS4C/qekAeZLI5j7KlgMUSV
         lYvjxYUFjIbryWYBFWfDrBdFEtNpu6kkmLbQJu3gldP115mUgSw8kgoJ1Xiii3l7y8KO
         PitAZMBiTA1rLz5TJuDGFiBknV/BpjsfGeKrRejPeyfxOF7pwaMju7QDppQmp6/W6r4r
         SzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822300; x=1758427100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PVDclpYQ6Nji01yBeit38rRV0WhZ/F6Ahkj7S8LBJ4=;
        b=W7BIuvBxWHjm1BrnorigYQDg+oYwno58WIKP2jsTIFji5xpoYNf+nKjcFMh+l4Jkpf
         YqehJ2aSEt58hXTMVSIqnqcLGMMPS7wxTPdC4wuX7S06Hd5uua3YM31XaUpwoSJCgAkx
         5fIYGI63qMXJLZreS+KNhSRDH/Eu2C4tuGOwMjYlr1LgHANhSW0KmYYr4JCVRfjcLjk0
         x9KjGDdJiGgmyugQAfCl1f18ZbEYfA1pp0t9eoTyn6QNiOAow3/ONvP+kPmZjruHHpN7
         Q8QO7u9muIYheAxrTWY2tztfXEX+gv9BHO7QCr11InE5o38DOCoKv4wwU/qgWfC/WT5G
         6ZEA==
X-Forwarded-Encrypted: i=1; AJvYcCXpC4x+H0+MBWveQjnHJ/0wnOexOTJLz+XkI6K+SXhAvJEZiRGFtWQfWZgTyyU7yOPA6ebrQKOXskpLUG8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyDtToGLVRr1/7YPohAvQN4oHOxS+Lb0yrNcWxgF+IugKolgPXv
	Qr5jebQfvIQ/UpGmkwI+97Y+KaYmHScGEi0XZKVRLsTrj7vDqUeEWyRd
X-Gm-Gg: ASbGnculRxkpJQLqOCyaALRcc5WsyWTdXbl4j+89cZH73oWdtaS3avfPIKdh0xubY6R
	Jb7Bm+4bO93DyQYNu36KQJ2yYPASpxsgfw+z2p3ysZ9XocQj3ab+5SbhmT0yRXTJdB30QHjNiny
	OewQZNBwVxAWE16i5tK2pbhBxodf0aSPcMnSU3txdz0te7WSYgCKcvEEX1k0JpbumqJq/nSECsZ
	MPPI93GZHU12H8s8ax+zcYRvzNKHBLnwqjh3UMZAjWt+3ul0JSPu/s7bZL37ldXt1WAfLapYHT3
	Anxp76Zgc+sDocL1PWMeCgyBTMkexOMSEixrJ3orHwYLrcZMoe5vC/aFkPAQdGJHMVW/YJy8dly
	vyHV+dyY94xmAOSveDi4=
X-Google-Smtp-Source: AGHT+IEs7a72WksMtWatD4lSFnDxnNg7+5MS1D9GOkH6MKg4k8K6DTsXjCx54xq6hKPtDzIS4c8/bw==
X-Received: by 2002:a05:6402:42d2:b0:627:f47c:b199 with SMTP id 4fb4d7f45d1cf-62ed82599f7mr8759493a12.8.1757822299751;
        Sat, 13 Sep 2025 20:58:19 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62edb7d9cbbsm4735738a12.15.2025.09.13.20.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:58:18 -0700 (PDT)
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
	patches@lists.linux.dev
Subject: [PATCH RESEND 51/62] init: rename get_boot_config_from_initrd to get_boot_config_from_initramfs
Date: Sun, 14 Sep 2025 06:58:14 +0300
Message-ID: <20250914035814.3752803-1-safinaskar@gmail.com>
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

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index a42f1f0fce84..c535e0613df8 100644
--- a/init/main.c
+++ b/init/main.c
@@ -264,7 +264,7 @@ static int __init loglevel(char *str)
 early_param("loglevel", loglevel);
 
 #ifdef CONFIG_BLK_DEV_INITRD
-static void * __init get_boot_config_from_initrd(size_t *_size)
+static void * __init get_boot_config_from_initramfs(size_t *_size)
 {
 	u32 size, csum;
 	char *data;
@@ -311,7 +311,7 @@ static void * __init get_boot_config_from_initrd(size_t *_size)
 	return data;
 }
 #else
-static void * __init get_boot_config_from_initrd(size_t *_size)
+static void * __init get_boot_config_from_initramfs(size_t *_size)
 {
 	return NULL;
 }
@@ -420,7 +420,7 @@ static void __init setup_boot_config(void)
 	char *err;
 
 	/* Cut out the bootconfig data even if we have no bootconfig option */
-	data = get_boot_config_from_initrd(&size);
+	data = get_boot_config_from_initramfs(&size);
 	/* If there is no bootconfig in initrd, try embedded one. */
 	if (!data)
 		data = xbc_get_embedded_bootconfig(&size);
@@ -479,7 +479,7 @@ static void __init exit_boot_config(void)
 static void __init setup_boot_config(void)
 {
 	/* Remove bootconfig data from initrd */
-	get_boot_config_from_initrd(NULL);
+	get_boot_config_from_initramfs(NULL);
 }
 
 static int __init warn_bootconfig(char *str)
-- 
2.47.2


