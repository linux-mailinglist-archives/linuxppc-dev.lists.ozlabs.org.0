Return-Path: <linuxppc-dev+bounces-12111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0790B55DF8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:15:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxJ93Y3cz3cZn;
	Sat, 13 Sep 2025 13:15:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757725709;
	cv=none; b=jxqShQebuMrIuRcBS3s1qt8UkA/YbukAlXlvrpVgeMIScY3ou9V1WSVFzlP7qy8lHnvhb+VA3EcE3ZSVuimPKAxFrLZHY71COAAxnn7HnoK9vj3QNcLAlknE0XC9NdObOHwhD+GSfOFUwxdcJftgUoAB917SdyZVCtUuFozAxqgAgUvdcbUSZh4AYY1Uuug8jNytf4zbC7hFrFBLbZyVDwcYLXv+AmMMfUI9r12IeSoGDDaUAKCOex0O5ajE0XjWa8dbcqah4KvmxegW8tNxrxiIV8sBwrQ1aftkcexgBPYEzIVuwLRApoks/gXKLfTF1Zm++lUPDJaJcTD9N01VDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757725709; c=relaxed/relaxed;
	bh=076xoEVbaVUh2WXJ09mT2DE1QkI5WvxeMmJOzlrP1Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQXUn3YdzyNjSfw2e1lz861SdtxQP+uosMuAkI9F/eefETlY9ld1EcviiqxqabmPWkwrDONGUJy+MEZCKWcXlhjQYD2sDWpe8NByhHZy4AeDERiIzeK9OBnDOp7u5ggOzcPpq3TIbtdJLoHi7ujsQ4qp2l7WjKNVyYDfsw7jZH9p01RoWQRQYGEVTqFpe89GiIbZ0kYgobD9kwS5qjwj1OH2oBGXoxFM6TfJacsmW25vRjWdglXYOmE+qj+pxe0idlDURiv4DuIw8pLYInJFmzC3XZScHGyBsqQzDmErM9ZM+S32QAHex2Yq2dEDTzz+yeMkVd8QxbpR46nEgoWwDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WFUx4hQo; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WFUx4hQo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtTS74lcz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:08:28 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-61cb4374d2fso3678399a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725706; x=1758330506; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=076xoEVbaVUh2WXJ09mT2DE1QkI5WvxeMmJOzlrP1Zs=;
        b=WFUx4hQogaa3SS+1xLcG5V8pjxTtdcr72XMrAFOeCEzqQWiTlXG2IfepeVJSe0zBc6
         0utThOlfZhQghF2XMjrVshREYjHwjnrQrW+McXihC3knzIFtqCQySgbX3AbYOtrJ+9+V
         MypL92Mu9e4Q/mo2Mol/yQzahVpeYLbjGkFwam4j1a3ix0ZYl2EufeD4tgzawUmX/cM6
         WLw4m9VY2E3pBvUyJLivRcMq5qX/jhL4WK0YpJI55QgqVMMLsLH0AsiWV/st0XUSeiof
         U3bjwRSBvwrKM+Gjj4bHBhOnzfyiBhrLlD5r1/fZt0EI7aSTv2vVaxTxcCUrUkvz8K+Q
         DZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725706; x=1758330506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=076xoEVbaVUh2WXJ09mT2DE1QkI5WvxeMmJOzlrP1Zs=;
        b=GoccEzqC4jeUnoo86iwW1rkoIArWbAP6vhw7ycMJOC/FMxhMgGAVgG0htrDeIuYTvz
         a1wIDbjNxYg6hzMY52Li7C+D7jJsSIhbPq6tvHYxXdCdUqFlZXecrQWECeXHf63FucrP
         GUvI4+4zTxTMt3swNdpMSKiBkaxaT2d9xT5gquPcnEw6k3Dn0+9SJoRELx3JnpRBlKBW
         KUd2yNGYQf+XYxEWZ1DAYS9TTjyw6I6p+0q3HNm1DTA0FAKRTgurLz/X2ovkXPXPzfTA
         CVvglhp13CIHcgW8hnmo4HN4EoxGSJB5wLnlag3O/iu/6Oqp2jkWu2JTTBlmdN9U3ZNI
         HYAg==
X-Forwarded-Encrypted: i=1; AJvYcCXqCutrJRXqHBfsRHCQCgwqAKheG9D8OKVuP10oP6b24n51EkWIKpiVA0BdL/tCzsa5oB52sTVCMy7IWSc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx/1JmBp1P4tPdrfQLyMgq8ku+S4q5hECx+KrNX2oVZ33uU/iU3
	3cHrYWlEvhy2aaBWZcum7+YhUKThj4gSoKndxS8zGAH/CFt5kMMcdA28
X-Gm-Gg: ASbGncvwE+PkHaV5do6YhkkA5ZPVCRqqFimRbnDeKB2Xvmv8JShiLQluCR8Okhx54F8
	38xMw75tfoY1NKvabNwMtiVOe7Ye5Qb45y/rer27o/nwcJoiyz3M//hSXPNL1GJngKcYxJhdE3v
	wp5MO6z6cfHsokB3f2bKr3DESGfIJgiGJ5XPsWt9DMRMo2+jZWG2BLBgIp9UrTmbXwUX4aB/sVK
	Erbkc1yagQqwwjbkIZiEV9cGzMC+uZKsDb1AYFL08cqVUnYvHlGc3CpQYSDNANSpscA1VRqm6Y2
	IktuVRiBJXXmP6ox2O89WbRJENgYcWop6U2x0YDzpuGIf93sNZGwpaaWYtMSgN1ONdVUCrW1gLl
	dLMbQix9rIQSXpEGKksgI6YjQV0cuvA==
X-Google-Smtp-Source: AGHT+IGdk3XVuMADNouJH/aBQO3dgisawWr0ra1gK5dmtwng/BJ+8DUWD+mdbhpnTmhbFrSAIQbncg==
X-Received: by 2002:a05:6402:26d0:b0:62e:e5b3:6388 with SMTP id 4fb4d7f45d1cf-62ee5b367b9mr3462166a12.19.1757725706048;
        Fri, 12 Sep 2025 18:08:26 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62eff1a5c6esm720024a12.50.2025.09.12.18.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:08:24 -0700 (PDT)
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
Subject: [PATCH RESEND 26/62] init: move phys_external_initramfs_{start,size} to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:05 +0000
Message-ID: <20250913003842.41944-27-safinaskar@gmail.com>
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

Move definitions of phys_external_initramfs_start and
phys_external_initramfs_size to init/initramfs.c

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts_initrd.c | 3 ---
 init/initramfs.c        | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 444182a76999..06be76aa602c 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -15,9 +15,6 @@
 unsigned long initrd_start, initrd_end;
 int initrd_below_start_ok;
 
-phys_addr_t phys_external_initramfs_start __initdata;
-unsigned long phys_external_initramfs_size __initdata;
-
 static int __init early_initrdmem(char *p)
 {
 	phys_addr_t start;
diff --git a/init/initramfs.c b/init/initramfs.c
index 6abe0a3ca4ce..5242d851e839 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -600,6 +600,9 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
+phys_addr_t phys_external_initramfs_start __initdata;
+unsigned long phys_external_initramfs_size __initdata;
+
 static BIN_ATTR(initrd, 0440, sysfs_bin_attr_simple_read, NULL, 0);
 
 void __init reserve_initrd_mem(void)
-- 
2.47.2


