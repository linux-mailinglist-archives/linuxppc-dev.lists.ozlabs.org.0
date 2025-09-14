Return-Path: <linuxppc-dev+bounces-12161-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03988B566D5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 06:40:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPb716ZQ2z3cfW;
	Sun, 14 Sep 2025 14:39:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822339;
	cv=none; b=PdLc75hD0Ewc6xkeTkJ86GRAWXGsJOC0RE3CHwaIvu3GmF/miQafxKcxNo2aHM8O/m7p+YlhwyT1npU5LaEkVGqBe0j/A3RFpwUEGSFkwvIEUptLSKGo6my8LKfaZFf31BvgBvt92T+9D3rWMfqFDtmnNqe5n+kyRjU5RP2/+khl0sUnyoaFvVc6SPydQXCU3alVu1FD5SEH1rNAF+v29ZP6+CIl7OaiSY18DFUrYrisRRJySLI4nWh/72d8TrqDsA/+WeuwuMqb9xrAtBkeOib3UvWrGif4bZti9o6e/S+zQyFq13bf2/4LNQ/KrYoPwuonSZ7Lrij+NS5PvSbHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822339; c=relaxed/relaxed;
	bh=8LDuJwsx1JnhEieEawhozXv7eEPm7AwX4v3UgIhLgCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSVmSiFqppi7Tbaa/WWqGu3/wLNKN3oy9i01oR5ILCp9jP4Rc0I+Jhgauih/u/o1z9PLS6iXPLq/wpDqdy5nymAEOGHH0GXCimhAIUJ+n6aux+9j9yJCk77OZS3ZNehPJE/s84+kScyQFKJQiPZALcfpxvywEWiqESjUqBOtSGDO1kVTZQvIppWkcyhfOjgaFBTPlKqfnhjH9giCt5Fv+9oqXRRKJ9zxlK87Kbp9dXf2F6mn/WQiLgfkVSoWDwO3ty4xkzxM4gjjCTUmTukT0+xJ75DRdAiprz29wJaKUway2ETeF4wu6ckLdwEa/GsCyxOEQgnUQsuUmsBrtIom7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K4K/mgFi; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K4K/mgFi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZCl0MBHz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:58:58 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b07d01fd4fbso242218266b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822336; x=1758427136; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LDuJwsx1JnhEieEawhozXv7eEPm7AwX4v3UgIhLgCc=;
        b=K4K/mgFiV/EUNoyEZIT7fHhImVTRh93FPCy/vnsSija6O+OxNfxJLqJ/1GXZjdUDsL
         4338iV7QH4UvfsWzuMJQ9saiJ3+hIk4W05XE10RqKUZAbi25u8wQtK8kRqDYXorPxWZF
         AKwfIN54+9So/ld6oRHVywFZFtfrW4d4nM6ygAjzcKgQEJmAraaTcYZsDSDqB+x5G9Wa
         zY5cjUsIX3uU3ayE8ITaLIKttVqBgJ8aRlO+L63A9w0h2RLmFcSameAFCoWPVpU//QQd
         nBWI0AlgRsM7vEqJZX0zZWcUrqvRLHdy6skK6e2bj4lav/RJr0cVHaVcQUxdr0W437w9
         wu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822336; x=1758427136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LDuJwsx1JnhEieEawhozXv7eEPm7AwX4v3UgIhLgCc=;
        b=qByvZEofRxEdVPkJw4cHYHADO5CqkQz+ylE/fxBXwijkYWjotATJLmWHtcAjQqHBfB
         yrBO58dji2hvloC4MIKGUCmx/49r95y5OJq3HLDbxDz+LeTFxIX1MjrWW975aTet6+Jo
         q2Q32XBOY/SQggtB/yqoBbIhy9c30HjFNsuTX36qAyLLpXjxq9EhUucBgtaCUTQYwIzt
         9sHxk+vt2YdbozZ9LZR1+bXNRSjv9VD0Zszeiw6gOQed5MGOGOvoh+TlE8EMpjk1iW7S
         0btPmSOz/v6FZgBcq/LiXlvrHhUWISJTI65h2EarrTk3hyx6jTEchnfrmkCfg1imeWzY
         MCew==
X-Forwarded-Encrypted: i=1; AJvYcCV6fNUqFQTGVLyimmBcf8P8YUNrdTkc/ixw2f1NMm9tCuDz9mFYDdyDpWojZyLsQKFtQgvKVl67WDkmF08=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzX4qNRQ4Z9QilYw0bJiFkTlzSM6PGHbzu4GOJDbUZX6QxbK5b4
	qQav6Coyh8la+8q1Bt+IoqEErEVJlYLzR0biqiIjdGp0eQH88KWJszSa
X-Gm-Gg: ASbGncv3oHm8/21DuRosYqOPQ8cCL6S93PmRZU3mvIk2OSo4YmxT9gs+mVKdtoUZ3eW
	nOyvMo/xCLvQw/rpSGlYqkYcP2r5WDJZk5zlDFitAwE4/DRh317zjW47wkJPK6NmxNQxStzZQgQ
	xnsNTbyNCDcLtrKoW2pJdaUXV85HdMAvZWGmKnX1Zif4acNY0NJP8mIghPYQYiDBq7VaBk/T0x2
	TXT99SzBlaQgZZU5JyS26HtGZ4JkUT5rA7qUv8d+tptDeMYzuwAyTv/Yx4//dMG1It6wxNi/Zom
	xkX+2vN5Uud4Z2rlIrxsPzYM9gHEqqUkqdu9TB1lkUNKWPDPhlAn5FuIvsWWeK9YC5pPJRcMJZN
	OvmE990l/3lDNVMiIzy7vjk5JtOEPVA==
X-Google-Smtp-Source: AGHT+IHNLaKXJiC+zXQ2uAPY4azg+7W3/1g8JczFufMn8mQqgVOZ73ifHuYY/OKrygFTvfUSeCcOcw==
X-Received: by 2002:a17:907:3e90:b0:afe:cbee:7660 with SMTP id a640c23a62f3a-b07c34d63c8mr797483566b.21.1757822335865;
        Sat, 13 Sep 2025 20:58:55 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b0cf2112639sm91581266b.104.2025.09.13.20.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:58:55 -0700 (PDT)
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
Subject: [PATCH RESEND 52/62] init: rename do_retain_initrd to retain_initramfs
Date: Sun, 14 Sep 2025 06:58:50 +0300
Message-ID: <20250914035850.3762697-1-safinaskar@gmail.com>
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
 init/initramfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 30e94ebf4902..40c8e4b05886 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -570,13 +570,13 @@ char * __init unpack_to_rootfs(char *buf, unsigned long len)
 	return message;
 }
 
-static int __initdata do_retain_initrd;
+static int __initdata retain_initramfs;
 
 static int __init retain_initrd_param(char *str)
 {
 	if (*str)
 		return 0;
-	do_retain_initrd = 1;
+	retain_initramfs = 1;
 	return 1;
 }
 __setup("retain_initrd", retain_initrd_param);
@@ -584,7 +584,7 @@ __setup("retain_initrd", retain_initrd_param);
 #ifdef CONFIG_ARCH_HAS_KEEPINITRD
 static int __init keepinitrd_setup(char *__unused)
 {
-	do_retain_initrd = 1;
+	retain_initramfs = 1;
 	return 1;
 }
 __setup("keepinitrd", keepinitrd_setup);
@@ -743,9 +743,9 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	 * If the initrd region is overlapped with crashkernel reserved region,
 	 * free only memory that is not part of crashkernel region.
 	 */
-	if (!do_retain_initrd && virt_external_initramfs_start && !kexec_free_initrd()) {
+	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initrd()) {
 		free_initramfs_mem(virt_external_initramfs_start, virt_external_initramfs_end);
-	} else if (do_retain_initrd && virt_external_initramfs_start) {
+	} else if (retain_initramfs && virt_external_initramfs_start) {
 		bin_attr_initrd.size = virt_external_initramfs_end - virt_external_initramfs_start;
 		bin_attr_initrd.private = (void *)virt_external_initramfs_start;
 		if (sysfs_create_bin_file(firmware_kobj, &bin_attr_initrd))
-- 
2.47.2


