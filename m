Return-Path: <linuxppc-dev+bounces-12169-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E479EB566F5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 07:30:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPcFT6Thrz3cfx;
	Sun, 14 Sep 2025 15:30:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757821838;
	cv=none; b=Xgtcd8/1h5KCzXN6uQzc9QjL3Na9yImXgOz6jUcIBoP42qHorIP4CrKtw+29GMoImy0Xxs1CIsnroAEKSQ9wNUkJj2qs3hlsXAOlNDKC1S22LnC3aEULkhenntWGCQvsJY0+PPJ1xLZCLfivih7cOUKgjDa7nqi3z3aDPxvasFfOM8NsMu0Dd/8Rba5l9fl6bDvq/jqpHuLKo1R4t72RBYRgOzW6nxccuypxVBNBI2WT39gdZ/MS4yQNe/lOs9V9Vimkc0oYNoMUuFJptr9sTHM6FspriemYbW8aPEKAnHyAWb5TMer0j2uWk9HZjHPoNmrKw7FyoqYvr/c4rg1X7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757821838; c=relaxed/relaxed;
	bh=xULsRy9EzPzDuVUBFXoTlnqFZHMdg+FSwp5f1Vonn0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8Bp1SBhwKG6JVUeiSruMbuh4R7+iiPh9N4vcu4Iq0T2F/twc61ag5pzMvveTNEXX4+C3Wf5WaXSQHY5cJ8s1NqbYPpqfQaL3tt8yfejzAY9djTMd9Z/zrwN0OR6n/rI9s8ZwQldQQlumuEVdTFTZ+XzicwzU5QWs/kq3CuJcAgCfTK2stI12pMnpipiogdoZREVeA9VD9uqtS+b1i1u8nS6LbgefA4flydys5HRKhElGYuNiHKn2Ux1hMpZ3tfX8l1T6twa3mL79054YEI6n+Q7UGZwiFYc2cUfDKIEKvCZHuTq9ZqDDMq5uskHOxe6JewybxddPWdCEGyEcHuycQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g9Pj1bms; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g9Pj1bms;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZ250dSbz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:50:36 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-62ee43b5e5bso3292144a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821833; x=1758426633; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xULsRy9EzPzDuVUBFXoTlnqFZHMdg+FSwp5f1Vonn0Q=;
        b=g9Pj1bms/uSBjgpKhoLZPKhOaoUlVaSttKOxuyxj55ISTpZiMsxNWLmd8SjrBl0WeV
         RyhQ5B7fOYkoRkQAHc+57A+pp40x3zZ30yZA0I0fBWK+1T7IOrKM3NTGreFkrNkBiZ1g
         YYCw9mi/88wkyk9a42kvRkQH7dcMaoKx3kA94L/QdEVWNVLaMtwouCjcyC/7d5VI5wyy
         ZaO8yYSR9jaK2IWEKOjIC8/RDY1VCKI/VqNvz4zzAc6wKucJXIfu4BPMPhe8vMB6rqkW
         Er7ON3A5baOfoOL1y8DUwIQi4UeljrvFu2jv6uvESnpza1+7fIEJ7eleDAMmLKuoBbzH
         loQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821833; x=1758426633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xULsRy9EzPzDuVUBFXoTlnqFZHMdg+FSwp5f1Vonn0Q=;
        b=MqtOEP8/6D7mrFJJVGT3clzN3GsBh2vspY+gh7ymMWFTKi6SsNd613q+dje1g5e8u9
         n51XocU7p2qIIB/ZNfOyEBs9B4Akpu2ZQMxswjYo3GsBMwyl2zAiWf/mnY34xeolMWAI
         SkZ5fcNYHzvTshVZJAULJ4og4F2fTLI7kL39wk6G8zVfjQacrCTuH9vKekbERVGxdPCH
         z+yIgY7Vl+SONNiHETsh31qxH0+yvqHGkDjKqVzrpb5Ok74/n7mbTMPRhr4g0T5wbImg
         5fDl9i7054Vt+svHrw/oU893Q6MBJLRgn3p0YaVYnLR9BhSjoXwP/bzMP+MOkrHDCy6h
         d0jw==
X-Forwarded-Encrypted: i=1; AJvYcCW/t8YrtF/kIHmfI1rmiCFWmXzX0v1Mkd4tTvsQMeJt8Df0n/G+nbAVSJ/bqifbRpOjtacVPaLHH04aBdc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxVrHwYnfJqHdCzTzpAXtlseu9DTKbkHX/clIf4fOq5d7VA+WVS
	BYffcpm+DnQL3AhoWs1ZADtMthicTw1rbqXdsLM8Un/dyDieMgPtrXwx
X-Gm-Gg: ASbGncv70H/P9JlOztvfx3dcFNZDRcgQcrznYM+M3FuKkgTmL8KeoXcV7LSwpuzTlvc
	Eu5cvt1B8Nv9zx/tDNMqm71UnF4mTmqlk89reN2+xmjf/RhSOC28+USEy5Bb0fHFqgCLsOlP2v2
	NsnQfMV/WbdpfsAgsTEWeofPKseAo8ElYM/ads6khmtDpzqqZiTL8tbe9xo6I6wb7qO7o7tYma2
	TGFanxV7hwthjICmQMvgeX7/ijz/vWvv+zyGbr1oYHeCwqKg/HMSHHCQEyxD0eyQ6OAPT8/3iKT
	o/5a3/TyNdpP8Ms3mq1VltoAeu+ssdmlYo1tbBrF0BVWyD6FY6QcvZl+D3Raz2Dc9AWfJJBuy0Z
	9eHbHlbTn+vy8LirURoBkl5noCjSZww==
X-Google-Smtp-Source: AGHT+IHE3K7efxQ+hk8pVBE6YY31PD4G3LjwwPuEi1DqCDNI+Ud0foCSPIjpPnt40T661VaNMc1/Ow==
X-Received: by 2002:a17:907:3e8c:b0:b07:8836:dea9 with SMTP id a640c23a62f3a-b07c3819dc5mr855439466b.39.1757821832889;
        Sat, 13 Sep 2025 20:50:32 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd3efsm668828766b.55.2025.09.13.20.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:50:32 -0700 (PDT)
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
Subject: [PATCH RESEND 38/62] init: remove most headers from init/do_mounts.h
Date: Sun, 14 Sep 2025 06:50:27 +0300
Message-ID: <20250914035027.3609569-1-safinaskar@gmail.com>
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
 init/do_mounts.c |  2 ++
 init/do_mounts.h | 10 ----------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 7ec5ee5a5c19..5b55d0035e03 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -5,12 +5,14 @@
 #include <linux/fd.h>
 #include <linux/tty.h>
 #include <linux/suspend.h>
+#include <linux/blkdev.h>
 #include <linux/root_dev.h>
 #include <linux/security.h>
 #include <linux/delay.h>
 #include <linux/mount.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/init_syscalls.h>
 #include <linux/fs.h>
 #include <linux/initrd.h>
 #include <linux/async.h>
diff --git a/init/do_mounts.h b/init/do_mounts.h
index e225d594dd06..53e60add795a 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -1,14 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#include <linux/kernel.h>
-#include <linux/blkdev.h>
-#include <linux/init.h>
-#include <linux/syscalls.h>
-#include <linux/unistd.h>
-#include <linux/slab.h>
-#include <linux/mount.h>
-#include <linux/major.h>
-#include <linux/root_dev.h>
-#include <linux/init_syscalls.h>
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-- 
2.47.2


