Return-Path: <linuxppc-dev+bounces-12166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F959B566DC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 06:40:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPb7z1KdQz3cgW;
	Sun, 14 Sep 2025 14:40:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822161;
	cv=none; b=mQdh9sHef8VPOggmDYin1dEQopvGnW7supLrq4SNJFNyiaTN2T05tEXuQ8aSzD/5gFK9wR+kNifPK9UAT1iPuPFil99rBu2X79PUa/H9TcQqxIJylM4f5fsp8tB3SgTn/49RHopnXp4o+eQU+Wm+aNhfJqUIQ8ka1SSLDRnx7Vli30xZQtm7EUajxGNBMOUQ4k7fA/f2zQyRKRl3AiBqLPnq5HoARB0s9RFmDk4gmPO23bIuMGVs1Z8ILEgVRzr7D2OLTq76a23RYwTFwn4lGI4m0G3OjTVB+ckHV8LESXMlkf2t3H3ObMrJrx6XfuarxFXaa1WedxQPo+m+nYXX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822161; c=relaxed/relaxed;
	bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+ebJLcIdlHlqmyCSQEzwAMHDoi9T0r4EldOiaoCNJLNa/4rDq+CpmZTx4mzL2PzP8oRC90kaz0F41VeERey6YKOhU0JMCycoiUhYa67vAcoBgedDzCnX0/WINi7upB+5lCF1dgRYsIiG/t7CuknUcqfXnmAmw6jhF5AXZ22tRvtS6ZCP3URLhhwEmTrYWl47hnfdFvXwg42KLk205dcCCMc+VTQHqRlNcVqSzE9IfzEb+1+7akqn3ZVdz2sJ0EaKcydESPiaQ4KqKUcFFR5hAbZ4eyvw+ht/g8NfR3OhqTMV8HP5OWCLd+2WOhf0XJB5VjhQT8FqxC9X0rL/AsX9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hynnXE8j; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hynnXE8j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZ8J1x2Sz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:55:59 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-62f330eeb86so55276a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822157; x=1758426957; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
        b=hynnXE8jag8q+y/N5QGuzMx3w6gqKCBNg9wZ7O6X8ZZOWBEjY/Krt5ED3hT7+qnyXl
         B4V8DXHpz+It/1CM5VW+7lM3Br6eOwvPSVynccb3MzQI4AvjVnMpyrFOql45X4MpUfsa
         QMtbMfmNtVvMwXwyJITzTkS7MCk4a55QOZXenIRfiGiM7V7ABl+8oLBxtT63j6kfjoRu
         7/PlM64G6iKjCrhIBff5MKlYufn9561jpt+BxEjEkWUXankLd/0bKwmsxMF/3seA4C87
         nn5lcFkHTTydrjJhsd7qecaDKsF/b1C0xjPtt8E7w1ans8hbZAfNNL5iSXn7FXcd8HBB
         a4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822157; x=1758426957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZ7mWaMdZxGJK1wTX4F7lWg1sPAH5qiKx6l6RS6EW/U=;
        b=Risf9TbHBSpmPzSKWN9yr2acZrfClLT8xjOPZLiVGMdE0uGGeM+O53zfDl1KdzXVsu
         9RPJy5sVFW37b6EQakhyZMF4YCW77qlkayavSWSePhRtQCF6rXhtuY2ubxtH7Y9O5twL
         A6iiUXCgL1RJ7bChzJ2YAMjK/WMV7CnrVOchW3nr3eh53d+5cpIlJiCZQoE3V8V6+O0B
         7D82sqoOYUS+7r1ZJNsOKCZxdsCt3NWtcSoS1+Hh+eP5b8R9LEz9MR2dAkKSWvhmfR3k
         FTLPjSfJ5WaLWDsgj+B7imPer4mkm0KzaDokYaWKWS8VqyctBYQxdiuU95Qz5q2FwW34
         z4dQ==
X-Forwarded-Encrypted: i=1; AJvYcCViV1HqU852EyG3uA9CGK88Ycbx4Am6Rv5IQwnLrTtkE3HgEGSds3hAGOORaiNDGHriv0KDaUdq2zz7LNk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxlJ5p8YrMat/FusTmEhtW/Hw1Mu5vX+lduLV0pnPukSVtAILeA
	gtxFOqxoetOVJZS+zdR1eEO6vwSBTbkL+W7oSPnVC03vyXMbRoMQlzkx
X-Gm-Gg: ASbGncudX+iwVD1DN7vQYvAd+XTCVIs99y9TO9vPNCK5aWSJjFbmCxZx3buet3RLgrI
	E/0/v5Hlay/SwT6kpw/gInr/hFUyI6v2E0if3obyaq9Eh0v0BfciZTD3F7mj5/cLEWYExVJ2AQa
	RDD20q27YOq0QXkYjD8wVZIebAXcCrUw9xaN5mAWTvX7p5GUxh9+A5vvd100CHHQrhxgcpy5LPB
	ISPEU2A7xgrTAn/1MZce5UGgem0uKcbGcTA4suLmpy0QRfv6p9VEFaiahg/NMT6tFASKeHKPaT2
	iK7zUFLZW1ksunIzwdLeG8XgD54DeEzTubFWmz0+CTLe0+XbVZ0mJKqxT48yTD1IX0v+SbW8XBC
	wRHk4Im28h+Q3RatC2R5/QCjcjj8+Ow==
X-Google-Smtp-Source: AGHT+IHVlqrM3WGO2PMhAdJqFymXZDFmcHUFnmRqsIL52zZcyiB7/sntw8UcjJnO5qIuj3xo01B0kw==
X-Received: by 2002:a05:6402:278f:b0:62f:26f8:fea0 with SMTP id 4fb4d7f45d1cf-62f26f91103mr1500285a12.33.1757822156480;
        Sat, 13 Sep 2025 20:55:56 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62f2b2a8c38sm677327a12.31.2025.09.13.20.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:55:55 -0700 (PDT)
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
Subject: [PATCH RESEND 47/62] init: fix typo: virtul => virtual
Date: Sun, 14 Sep 2025 06:55:50 +0300
Message-ID: <20250914035550.3706342-1-safinaskar@gmail.com>
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

Fix typo

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/initramfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 8b648b09247a..cf19b7c0c358 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -636,7 +636,7 @@ void __init reserve_initramfs_mem(void)
 	phys_addr_t start;
 	unsigned long size;
 
-	/* Ignore the virtul address computed during device tree parsing */
+	/* Ignore the virtual address computed during device tree parsing */
 	virt_external_initramfs_start = virt_external_initramfs_end = 0;
 
 	if (!phys_external_initramfs_size)
-- 
2.47.2


