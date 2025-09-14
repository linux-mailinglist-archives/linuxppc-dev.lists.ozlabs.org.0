Return-Path: <linuxppc-dev+bounces-12151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FA4B566CA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 06:37:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPb4f3jZdz3cZ0;
	Sun, 14 Sep 2025 14:37:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822701;
	cv=none; b=StJm33dXpKNrOqa6E7hwuaURIz6Vk2XR2u6S88eaI+fa7mq/lCgEcP9M5XhAagubMD4SqmwFMrqFDNT9VwADl6S52HYm0DZaDOnIa/2x7hl3MMCfYLOf/eyOp3yjX2WCVi0tNPHP+P+WSpRMWke6EiEEYFliJvSEkO55blaThmjwRfxazsTzPGsxRAjCskNLvB1sJUOKzCU//64FG/bOkp4hpohQyPQ7dCz27WKbZXNlc7fl4FGqf+QI/Hp3Zqefoesit3tqSo2xqLWEKUqOwE1hL3MSCNeXk0Cfrrlp0iiwHXKPmQguZEYV43FQcdG5Fe8K3TkNWbDKvDEdLO/boQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822701; c=relaxed/relaxed;
	bh=Mw6NNXq6XfJ0FNmZ5frjZGClHo0iZVSxbFf+bMTHIN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQyW2YW/om4S7c3xLQrZoPdlGx00GAAoPxD+Kjxj3RpNHY/204dO0cebS3WVKY7LojRLgbJy9gPi85C8fkV6Qz/V0LGDf6d2mLHjlOrT/8SJfQ96Bab3HN8/uhSYgtsAxVRIrahe55ExYvnsAAaeDhDd/hPxXYp1fpy2JFF7BXr+4nqD+jDZBdeuqoI30q7xrugX08MlEecZ5I2tqMmC3Ymru+g17LNeIb39KLq1cIQv3mZwtgQAzknDqCnkQ8mwJYg+2kZm/FvCOwdiNJnO2asEttp73a7L0KgK0iuVHmb8qhzXnazOXpHnf7uxD65q+HyB3Q41MoSiTOYa7TAOMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AuUuGAQD; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AuUuGAQD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZLh5x83z2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 14:05:00 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b07c081660aso429397866b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 21:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822698; x=1758427498; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mw6NNXq6XfJ0FNmZ5frjZGClHo0iZVSxbFf+bMTHIN8=;
        b=AuUuGAQDhSphUzopMfU00GvsuReAYHXLXMz3vfW16zT8qhzxvC7PkEARC2DfDkZnVX
         xKdYnmwrOT4VM6enrfIqRxB+QOYESfJ9HgQemhVN+HdZY1R5oO6Cz43T4BecE3RXIo0/
         +F6HwvEKPbg6lzTSL21o1fClu93bEgjemZpODMzAKzD4ihJOh1ZVB3MnhVm2YaJsA5Kp
         8q744xzIhxhHNOSGyF33YCMjP1WIL4E/bmGifSjslcOtCevecmLLMLB9R3dGYHgK0h01
         siw6/ot1tBBIxo9/cZziUe9qcscehjS4KKBzK3ZzY3T9/HSp/XWnvPfYifTmx35RrT3K
         TaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822698; x=1758427498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mw6NNXq6XfJ0FNmZ5frjZGClHo0iZVSxbFf+bMTHIN8=;
        b=B1TRGqSwt0pbyRDlQT9Ffw1/SqiYbpwDuh95aH5LDrqaXhq7CTHASY/T0UQXstzWZh
         8GpTgewOH0JP2FcHBCg16JjNHAhljWRTXo0f4EQeMoQQ+7KNryt73pi/s4DKEwNC3L30
         qA4qTENLt3RYTlDTeUITxbfTE5avWpvth8JPrimgeKsIqu7Uqg1NAuSKpkI62wOpgofm
         efxq6NSLAOX92wyGSEu8v+mvBuZwwEmoGxbOC5EndBe5HQFpoGw3IUDEwhw26EswhvB7
         tty5yPhbbNSK/4nTzVcQoRrbKyy79Q+Gm/UOku+NdoZGIDtaEp/TkQCON63QiVZDz4G9
         15Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXWKrAjfsZwNzJpXOd1/SG7kWDVphC8LZ7vD4zmmt6X6g07PWPcX78mQ+KegT5wO98CZwj/TBVrfCiu9vI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzM6XmSWOYrEQFmT7XI2ziuzJeHVRT9Crv6fKTKaPs0hV1tfrm1
	XRHmZwLhA4eYhGR35SwxsV8vJSSwNlVXk04l8WHpi8wd8IW1EP4JrbF5
X-Gm-Gg: ASbGnctACeRn9cU64IvfnT0leeVPFEr3gDmzyleYw2DMRLUzEgwMgF3Q3S8DBil3XW9
	jeGzIU0LPvkTwZv0N6WkWKhaO3EGIGxi++gQspiWrv84jU3kffBDuQ5epHD7oDLM5aODEnKFapW
	RzncglS0Dpd1XE1uAV7vwz4KjvKZo1wUFRiznWp5fIouW7EBAvRfLqZqM5LtBZw3kFOQe/GGxL/
	2V4K97lTNMlCWA8oaq1ENDEL7gbYi3xL6qcy6pypZ3ltX7eAe4XeZGBFaBhT28mteDTg1l5h7of
	b1wgl70JaBSUq7kdblDTuOeCg5xyD8PnEzHUXHZ2vi4JaO97vy3ZWEjEClqbzsZxbtI6+gGbVij
	eFnGNrWdeQl1lLrAnOok=
X-Google-Smtp-Source: AGHT+IEha/cEycx+vu0xF7TxjEegwfvZABBYj962u8Q3zWPEYF1LD+BxwewIqIoCpytaOJDSx3nrIQ==
X-Received: by 2002:a17:907:3d8e:b0:b04:706a:bcfc with SMTP id a640c23a62f3a-b07c37fd45cmr876333266b.33.1757822697695;
        Sat, 13 Sep 2025 21:04:57 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07dbf5dbf5sm308085466b.79.2025.09.13.21.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:04:57 -0700 (PDT)
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
Subject: [PATCH RESEND 62/62] init: rename CONFIG_RD_ZSTD to CONFIG_INITRAMFS_DECOMPRESS_ZSTD
Date: Sun, 14 Sep 2025 07:04:51 +0300
Message-ID: <20250914040451.3848715-1-safinaskar@gmail.com>
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

Initrd support was removed,
and CONFIG_RD_ZSTD has nothing to do with ramdisks.

Update your configs

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/riscv/configs/nommu_k210_defconfig | 2 +-
 usr/Kconfig                             | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 6e961256a941..68cae0496b54 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -7,7 +7,7 @@ CONFIG_INITRAMFS=y
 # CONFIG_INITRAMFS_DECOMPRESS_XZ is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZO is not set
 # CONFIG_INITRAMFS_DECOMPRESS_LZ4 is not set
-# CONFIG_RD_ZSTD is not set
+# CONFIG_INITRAMFS_DECOMPRESS_ZSTD is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_SYSFS_SYSCALL is not set
 # CONFIG_FHANDLE is not set
diff --git a/usr/Kconfig b/usr/Kconfig
index 3a891a0c9ef4..06e1c1474b68 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -100,7 +100,7 @@ config INITRAMFS_DECOMPRESS_LZ4
 	  Support loading of a LZ4 encoded initial ramfs.
 	  If unsure, say N.
 
-config RD_ZSTD
+config INITRAMFS_DECOMPRESS_ZSTD
 	bool "Support initial ramfs compressed using ZSTD"
 	default y
 	select DECOMPRESS_ZSTD
@@ -206,7 +206,7 @@ config INITRAMFS_COMPRESSION_LZ4
 
 config INITRAMFS_COMPRESSION_ZSTD
 	bool "ZSTD"
-	depends on RD_ZSTD
+	depends on INITRAMFS_DECOMPRESS_ZSTD
 	help
 	  ZSTD is a compression algorithm targeting intermediate compression
 	  with fast decompression speed. It will compress better than GZIP and
-- 
2.47.2


