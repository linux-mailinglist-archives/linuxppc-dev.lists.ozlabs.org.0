Return-Path: <linuxppc-dev+bounces-12104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BFCB55DF1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:14:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxH46rD4z3cZ1;
	Sat, 13 Sep 2025 13:14:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757726175;
	cv=none; b=M2GhsAbXJxkZLE55gqTlClOrjej9Le438Bg9p1CeXWn8Vranutr2AyHYNb6/RdQoiCjM1afmOGmhT7BYYnrgINfgMrjxGjmT7opSY9IJ602z6SVBZd1h+zdB19XBlzGL1vj6L2xJvunrk2WFwo5qcwffZ8eNgjdJEztFe4zKATzotcX12pHVbTrpgJMoGgBEts4KBkiJB+iGn2S2Do2euX1uFfSMwwzpvar1QduI4PsWURHx7KjTVFSWG1hmpGbYOZj8L78/7G0mm5xmswJKowzjQy4BJX8ms8DlJaU5Gk3bri6t7RdKptHhpixYq3yjNQQeMu41sEDhhdH5L4IuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757726175; c=relaxed/relaxed;
	bh=IjswgxWrFNOKRwzjkiuQ0bl5mmgWmo9Cqzfehf6N75I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ho3YWpGQN8THYPjCnDHYI1h90BKHr03GS7hc7OSWuFVTFKGr+CXul6HxT8IMxhdcvreTmKJwqH1e4lfNPlx+lUZsjYbaaOm6LNbY/QSW19IYHnJRl/2hw49eqXGStwiywqNfDFh5TU/eE0uQF187gDbIKpFT80og0lF2cY/wFmwAy67lkaeItJ5kdBccPR5wtnGgFYRHVFwWhk26E/8jlJo90cwL4BiNoL/CVQcyQJ3TcBZtMa72NogOXIhMRY4lu2ksqh1X4VmO4cwhtgoAa14Ok31ITmwCaC3YU2YqaqgF3C5z2rQzYhOoV9Da0yC4epXz6QzSaO5m2YNYhzRL3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KC44TPOt; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KC44TPOt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtfQ6xyqz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:16:14 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-61cd6089262so3763356a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726172; x=1758330972; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjswgxWrFNOKRwzjkiuQ0bl5mmgWmo9Cqzfehf6N75I=;
        b=KC44TPOtEN8helkFOKVrd9Sj6vcBL1RiD2ABXE65au++JxPJysBS5JE+KLw7RX0N9X
         zcYHtQ17qk7u3m3KbahSTcArYp4Usojtarqhaqi1EMHFlEoHP5qGVEv5kHTQRUyp2YSC
         XSbdKnpy66S82W5PWnL8zqzv+TiRNOFHyKRR2SaGZKKrdnObznya4F9GE2Gqkn0tuIol
         uvYDyvjF1Os4BTFl75xpO5Y39areh6LiwvC5QlCaVa14D0rPNYzACv/ZlouXMZS3DrV4
         cSEhJvgHkW98ErR0jmYflRBjN3hrIj7fd0CpBMiFd/taRBCnh01sOUUeAvK9uxqmVbsg
         x92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726172; x=1758330972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjswgxWrFNOKRwzjkiuQ0bl5mmgWmo9Cqzfehf6N75I=;
        b=VVQR/+RVHkpyq6sdJek5xVX+yvsaUTWqQnzN3BQO8sRDFfwTFZGV2VDdQEa2UzYblD
         8D73xewko4uIfwzYBxiC26uziVBkAsJi0g1+xHPybuDs24Bx+BBNeB0Ba2LP8tHPTBcc
         hUCz762IFcMjT7zLGZb6VXao0EoiuOz5bNGMK0IwC9A5Y+8DtBXKiIo2foLdHE8nnum0
         CDrKsFXcyMLMUKaXda2lLFYyt1Kufm/cXt+C2o5xLohtsuvcHaBxqWkeC+2eWKRRKFHg
         NP4UNQnLqVRLxksqOg5wftjvJ3HD2QuW0zYrAU79EBQvC3C6RSaoXG+cgHGfC6iJSSEu
         uTng==
X-Forwarded-Encrypted: i=1; AJvYcCXBtq0Ex4qI2Q1o4fwtqUkv8zH8WjB04wosgS2AkyUu0yhsjM6amNXrSgAIF5BgVPCWYzOzeMb0D8ah/JI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJrz2qxEeEMgTj3tPLWd1vGxW3Bq8ASOIY0lVcrQNiiry79hMs
	1jtoJbNMCsipyfFg3fF6+lRDgwBRUWUZeUg0RdB7glx45YL0e/GEVq5I
X-Gm-Gg: ASbGncseJPwinxZe/KbHb0Bld83nB4V/G4rOIv1eZBliomFvAHjSWOw9C5KFPV06BKz
	v3Zqk4rbHYT45amNGwsQ2lDVHwaf37l6c/WZP6yCVr4CjEHYYdP+nYUfcXhlL0XMwW6IBNIGTVb
	61mEjo98gBf+hvZu5WKzL0j27Xw5rBoShw1WGVpvrm/3/bC5l4SuHLTrLp3eQaxapt6Jy91axfO
	1XD2ygafYMsQT6bxIPOOsfCKkFpnhOqLhZoZWBSdppDL/oNUkDiCKTjln7ifKLxuOXUe65Rm8mz
	lRWM8LCv0v5vf8ExjnopLraEglGWo7TQ7DRQSiHxp1TdszijyCGUuPOhziUJVjPq34/NN5m0sxb
	ZKXxygNEzHi/qndAPvt2CvCNEadpCcg==
X-Google-Smtp-Source: AGHT+IE1vl5AoL08hnxvihV4MKDaztrK6JygVC9P3kqlNeKyWBvnhpYqmVFYWjhHgbqbRt0/sx/2Sg==
X-Received: by 2002:a05:6402:40d3:b0:61e:ae59:5f07 with SMTP id 4fb4d7f45d1cf-62ed82718ddmr4360854a12.20.1757726172015;
        Fri, 12 Sep 2025 18:16:12 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33ac2efsm4135647a12.12.2025.09.12.18.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:16:10 -0700 (PDT)
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
Subject: [PATCH RESEND 33/62] init: remove init/do_mounts_initrd.c
Date: Sat, 13 Sep 2025 00:38:12 +0000
Message-ID: <20250913003842.41944-34-safinaskar@gmail.com>
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
 init/Makefile           |  1 -
 init/do_mounts_initrd.c | 36 ------------------------------------
 init/initramfs.c        | 23 +++++++++++++++++++++++
 3 files changed, 23 insertions(+), 37 deletions(-)
 delete mode 100644 init/do_mounts_initrd.c

diff --git a/init/Makefile b/init/Makefile
index b020154b3d2a..09657c0274eb 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -17,7 +17,6 @@ obj-$(CONFIG_INITRAMFS_TEST)   += initramfs_test.o
 obj-y                          += init_task.o
 
 mounts-y			:= do_mounts.o
-mounts-$(CONFIG_BLK_DEV_INITRD)	+= do_mounts_initrd.o
 
 #
 # UTS_VERSION
diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
deleted file mode 100644
index 509f912c0fce..000000000000
--- a/init/do_mounts_initrd.c
+++ /dev/null
@@ -1,36 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/unistd.h>
-#include <linux/kernel.h>
-#include <linux/fs.h>
-#include <linux/minix_fs.h>
-#include <linux/romfs_fs.h>
-#include <linux/initrd.h>
-#include <linux/sched.h>
-#include <linux/freezer.h>
-#include <linux/kmod.h>
-#include <uapi/linux/mount.h>
-
-#include "do_mounts.h"
-
-static int __init early_initrdmem(char *p)
-{
-	phys_addr_t start;
-	unsigned long size;
-	char *endp;
-
-	start = memparse(p, &endp);
-	if (*endp == ',') {
-		size = memparse(endp + 1, NULL);
-
-		phys_external_initramfs_start = start;
-		phys_external_initramfs_size = size;
-	}
-	return 0;
-}
-early_param("initrdmem", early_initrdmem);
-
-static int __init early_initrd(char *p)
-{
-	return early_initrdmem(p);
-}
-early_param("initrd", early_initrd);
diff --git a/init/initramfs.c b/init/initramfs.c
index 90096177a867..8ed352721a79 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -606,6 +606,29 @@ int initramfs_below_start_ok;
 phys_addr_t phys_external_initramfs_start __initdata;
 unsigned long phys_external_initramfs_size __initdata;
 
+static int __init early_initrdmem(char *p)
+{
+	phys_addr_t start;
+	unsigned long size;
+	char *endp;
+
+	start = memparse(p, &endp);
+	if (*endp == ',') {
+		size = memparse(endp + 1, NULL);
+
+		phys_external_initramfs_start = start;
+		phys_external_initramfs_size = size;
+	}
+	return 0;
+}
+early_param("initrdmem", early_initrdmem);
+
+static int __init early_initrd(char *p)
+{
+	return early_initrdmem(p);
+}
+early_param("initrd", early_initrd);
+
 static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
 
 void __init reserve_initrd_mem(void)
-- 
2.47.2


