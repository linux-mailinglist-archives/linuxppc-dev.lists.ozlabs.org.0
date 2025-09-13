Return-Path: <linuxppc-dev+bounces-12103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EC1B55DF0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:14:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxGy1b0Tz303X;
	Sat, 13 Sep 2025 13:14:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757726242;
	cv=none; b=des+ryA8fLokimxkYI8r6NXk+PxX7908W9h60+fmXJzATs4JcJ5JC8AXX6Cvm4VAwip/vtTN//myHtkNm0DpZzcl8WKBOblU+IHAudJU9Wb6/UVtR2dSfgx0osX+BUVmVT7IjqZ1kixRzW1spXrgx4TEwJ7/IuT5FQgu0SLQ8usmmgvgeuyIID2yeMmU63Z/H3JTtU8w4I5Loxam1qsDDWcBkzGRKlwmtkHUBVdz3AtegkzhNryMSdYdKsZK7JyieG+b4lyALtqVTpVmoLJsRAWogurCs7OVAFq6BVo96Ii+AlWM0x3HwDCKwoblVzeTbWilUR4IuFRRBVhbsNav6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757726242; c=relaxed/relaxed;
	bh=lOKK4KIFki64V1O84ArLWA6Jx4UbLCdmK3IY8vRFz3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnZSr6P1g9z+lItCuCVFoXt87t3mzKFeHSZO2gLs3MaquemG0UUIomLcXLZtnbuRN6D92rKqikMa6eUxPJ+WUz5PtCR94QHRxj6PiOfyoT0WF0lR1ztqDh8/Wo8rf5XZi2Kt3+JN2CmyNYZs/oe5sr6Sou2aokvmSRG3iwMLTG/oiekj/hG2srGs2gdlVn+52oXXXwwbkDmd2qkYBE4F67ddDaGipcTGXw07mZMm3+3KPdqQDkqAY4fnctwNHRshm+8agvkgwSeesxzUFDYD5+NDWpnL7zsTelumn+ptqqxIjw/rvNI6fosXeBEPs30LrwdSIejZd607qgDU7+RwdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PJKyF5cm; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PJKyF5cm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtgj6MwXz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:17:21 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b07c28f390eso259448666b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726239; x=1758331039; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOKK4KIFki64V1O84ArLWA6Jx4UbLCdmK3IY8vRFz3o=;
        b=PJKyF5cm957fsn5UIGkgEGViZn8l6D6RavpHYU4tT2A8UYUWIzEG9TJ3zY3n+G9P1l
         wmTmngbxMir9Y1kd0Sd9+Dx1JTdnbmgiJ9rmq92lxbLoZXX/8aod6kEQuKmNmBp5V4lA
         mpYo4I2BBHQDbSwPRwzin5u31c+wAj3RsEaMzpdF8VZt73mHE8+3ZAMwqZVETFQx8WBR
         Y8/BMsy9o1VbKW7h7z9gJAFzo20vPE9NJddgblIjSvbYe9sTJldIwufpdVvrZtylaIJO
         HCKKJZD6W/893436IWlcLn7/WMTrxSr7mYRDiJzr/b8Vgy8TD8pIfCm6f5l1l6f58PNp
         Xeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726239; x=1758331039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOKK4KIFki64V1O84ArLWA6Jx4UbLCdmK3IY8vRFz3o=;
        b=cRfcsxcHuRUM1aqiJ1B26ZeBxLw0KudrDwG2vQLuGVbU27S6jegFCoaakyO+PZ3ELO
         4l3Xm5OV6DvCg5W6lrHj2FtyTyZ5yV2HUexpk88QkoCLFDP2YP8LD5k4ZBgsuPy82CQr
         OzrxVFRlwz6Z7BN14RQzJ2Rm4z6LwyrKmW1xgJi9htnmQv0123eY2thVGlP+mOuP8NJS
         0Dhn6KRoedrijhRVNqhfQN60WjTfwQk1tocbIn58r05gGu8H9tyxBcXRyGwoC8Xn5ShI
         a3a5oMHxkFT+mAXKIYeIeSYlAX7slENiQe70tVTL7dhDr6uK3e5hdx3XiYRfaum7b+lG
         ak/g==
X-Forwarded-Encrypted: i=1; AJvYcCWzA8NaQNyCmaTdy4AB8A7PXa8q0i2HfV6UkKUx+nNaS/lCr4zSLTlZn5uvVWgkIfSta+5j6ZYX/eClyXk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwXECZBxqy1329C1hMl0DTUY58XNxCI63KtzDjsVjr5czjh7F1Y
	Ylw0NCuMM0Fr9KF2EwVdFTbdj2Ka8nv2C03+8jI6mtpLB3669qDvieh2
X-Gm-Gg: ASbGnct9EIueqBJzqP5AUk+HWXu66ZfNXVY5zcqDN1/w8xhGoj93++1tR+WjrWwB4iu
	C5zGNp6wX7jxw4494Jk+YBfUSmeLXIuKLYbjp6uaIy1r7oS5wfSC9rhGFTJZmkMxBJPm3mzFvnK
	+dyGtH5DWVRwTa1Ht9Jz2fy3c+QslqXlO/LKZzzgvWOE68sGmx1jCMHj+Y0z/9gZLUBA2puZgQV
	7K6CxxIrqLLGHNf8gw+Yu/scunf8klOaczK6qlpz+zRcbYQCwqg3KLmbhtujcpf2hlN0uuzdcmw
	ngvunoQEN2EmYz2z1nUoGPpZFqHHMzUokJs3V/UO95aqxZxTHca21L3Oob5mX0qWiVOlUYAIis5
	3yXTPgeXMbVPMEWyi67M=
X-Google-Smtp-Source: AGHT+IGWcEC7VhNjJKZzReFkWP7F1gkqH4tvvChKQBMnzdm+44287e9kqOEvM9aYYFOmJE4OYY5/Qw==
X-Received: by 2002:a17:906:4788:b0:b04:b435:fc6b with SMTP id a640c23a62f3a-b07c3a79fefmr497358466b.60.1757726238469;
        Fri, 12 Sep 2025 18:17:18 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33ae181sm4478774a12.22.2025.09.12.18.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:17:17 -0700 (PDT)
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
Subject: [PATCH RESEND 34/62] init: inline create_dev into the only caller
Date: Sat, 13 Sep 2025 00:38:13 +0000
Message-ID: <20250913003842.41944-35-safinaskar@gmail.com>
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
 init/do_mounts.c | 5 ++++-
 init/do_mounts.h | 6 ------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 5c407ca54063..60ba8a633d32 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -366,7 +366,10 @@ static int __init mount_nodev_root(char *root_device_name)
 #ifdef CONFIG_BLOCK
 static void __init mount_block_root(char *root_device_name)
 {
-	int err = create_dev("/dev/root", ROOT_DEV);
+	int err;
+
+	init_unlink("/dev/root");
+	err = init_mknod("/dev/root", S_IFBLK | 0600, new_encode_dev(ROOT_DEV));
 
 	if (err < 0)
 		pr_emerg("Failed to create /dev/root: %d\n", err);
diff --git a/init/do_mounts.h b/init/do_mounts.h
index 6c7a535e71ce..f3df9d697304 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -16,12 +16,6 @@ void  mount_root_generic(char *name, char *pretty_name, int flags);
 void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
-static inline __init int create_dev(char *name, dev_t dev)
-{
-	init_unlink(name);
-	return init_mknod(name, S_IFBLK | 0600, new_encode_dev(dev));
-}
-
 /* Ensure that async file closing finished to prevent spurious errors. */
 static inline void init_flush_fput(void)
 {
-- 
2.47.2


