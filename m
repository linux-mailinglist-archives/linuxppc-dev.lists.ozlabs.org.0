Return-Path: <linuxppc-dev+bounces-12138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C580B55E14
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:21:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxQQ30zrz2yrt;
	Sat, 13 Sep 2025 13:21:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=136.143.188.95 arc.chain=zohomail.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757717169;
	cv=pass; b=oH2jAVAwgnkq3h8VeuhEMHJpebwv4gkfbJ9lPkyr7aeAdlnRu3s9PDLg3po6xYRN6Bd/yUg0HuiTrG4J3sW0QPq0xJ+ouc1dQFg6Q4Zbu42SQ2+UUZXTf2UN0D4AKRmXel3guTaNkpGT5qguX9++XEcTZ0ZLSLPLIXumGHB+x9qMb1bW+MD7RrW2nUZRYEBwSjTPIi44rjYFalPWlTBNH9/HzliLjkGXzim60KmDz0iH6QNeQ86MEa+k9TQn8QzD38GiBGN9f9iVf/+/oSh/0QP9rgen3yjpopyD/ppS7It8xZ8zpIPg6GcXJCU21fdSRo4ftgahS9M6W0pvkPm7Xg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757717169; c=relaxed/relaxed;
	bh=q9iQK8EdIF6RRP4HkX18/uU6rY0egPm6PmmgTdmDikE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yyd4bqTCgGuGDbkU+nqMX9Kuc+yqypO8DFdTZo8ePnWtVAiysa+BJtv0VO8ohk7mT904v6fFGxG55T6gjHSzTVAo7JGjCvzGgWs2WRsdjnYeucGF6sg0Qtub8b9JOMW8nKJNBYkY+HZMOSdQyfTGyt8EFmF7NT9k3lDjUIiW2f0uofVXtrbiSpDZhQcWgUf9+/53LED6iPegvPxZPISaEe7aNQFhjH259zg9OSxx+h0ELnJczhJ6tUULfwJKkThLITdBuFllLFvw5IypuAAWVAjtH0W2Vx7rpocY1/9hqf33bfvV9tz9WJ8TqgnsfekaiGOMPW4Xv7VwGPDTtTx4cA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; dkim=pass (1024-bit key; unprotected) header.d=zohomail.com header.i=safinaskar@zohomail.com header.a=rsa-sha256 header.s=zm2022 header.b=acIupnwF; dkim-atps=neutral; spf=pass (client-ip=136.143.188.95; helo=sender4-pp-o95.zoho.com; envelope-from=safinaskar@zohomail.com; receiver=lists.ozlabs.org) smtp.mailfrom=zohomail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohomail.com header.i=safinaskar@zohomail.com header.a=rsa-sha256 header.s=zm2022 header.b=acIupnwF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zohomail.com (client-ip=136.143.188.95; helo=sender4-pp-o95.zoho.com; envelope-from=safinaskar@zohomail.com; receiver=lists.ozlabs.org)
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNqKF0L0jz2xnr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 08:46:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1757716883; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cYmkTWVTcQlLmLr5V8p1CrwhziHK5jWEHqN1/x0dbbnP4N6eqwJhNpFD+YvvcG1JcA1pILR0lg+/Ny7uiewAqWrYp0xgwBVqCid/qUwxU2pBACMW8E+qi9+gH5uFDpaMNSKBUmBcqwPg32DVp6NEprKLCwOzLldRlExaYRgKRTw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757716883; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q9iQK8EdIF6RRP4HkX18/uU6rY0egPm6PmmgTdmDikE=; 
	b=Ju1dqMVIkIYpU5LdsWBIf/CGwDsN0K99qbvJhITUG43b4iO5ReBci570gSrCvJZpIaavRZGeh519zGwQ3xzl9eLPP7B/6fd5qSQvFqfvp30skE+0PjF0wF1ZPM088gDBmx9lu1/Hmu9iiGaXsgt143EyXlTcYz1mO0b4E8ZkWow=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757716883;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=q9iQK8EdIF6RRP4HkX18/uU6rY0egPm6PmmgTdmDikE=;
	b=acIupnwFZvyRH5FokPCft4nvGFUMr39pqEpKs0NtNZVw5kg9Xyn8fLnVwVnsMrYi
	icAGCn5xQY/D8nPVu8I73mfObC5kAiAiUgDDUOK0dT7tuN6mPBE7LpoJ79v5Pcf1s+2
	+A3prhgVdkGFxaNK2Z8tJ6RB7TjqHAI2HFOwbXVs=
Received: by mx.zohomail.com with SMTPS id 1757716881894668.1339002049043;
	Fri, 12 Sep 2025 15:41:21 -0700 (PDT)
From: Askar Safin <safinaskar@zohomail.com>
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
Subject: [PATCH 03/62] init: sh, sparc, x86: remove unused constants RAMDISK_PROMPT_FLAG and RAMDISK_LOAD_FLAG
Date: Fri, 12 Sep 2025 22:38:38 +0000
Message-ID: <20250912223937.3735076-4-safinaskar@zohomail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250912223937.3735076-1-safinaskar@zohomail.com>
References: <20250912223937.3735076-1-safinaskar@zohomail.com>
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
Feedback-ID: rr080112274be46f51a3e6d7b65453b8c4000084fba7464352cc4dc9cd50377fd7f09b0684ed62a16f1e6eeb:zu08011227aebba3291345918c920d3b3a00008f86ff3411911b832b8b206255ff0b95bb9fe1592be8b5327b:rf0801122cd997ff081c6a0f543772417b00002b369a2b05bf7efffc2b9c1c1140566e0d80ce0978fa409c151951bada9a:ZohoMail
X-ZohoMailClient: External
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

They were used for initrd before c8376994c86.

c8376994c86c made them unused and forgot to remove them

Fixes: c8376994c86c ("initrd: remove support for multiple floppies")
Cc: <stable+noautosel@kernel.org> # because changes uapi headers
Signed-off-by: Askar Safin <safinaskar@zohomail.com>
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


