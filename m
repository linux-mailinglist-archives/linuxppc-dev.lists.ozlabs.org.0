Return-Path: <linuxppc-dev+bounces-12160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774CB566D4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 06:39:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPb6r6tqXz3cn9;
	Sun, 14 Sep 2025 14:39:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822375;
	cv=none; b=deBLv97OvQsB8Ho2edmq1JZNi2jAjQO78WFrqETHThOl7ZKJgRA7ZK3IPR+XPEuI1pIcBwIhUc/WUkUXBPktz9WSuoAV0FGyV1Wn0oUbubDwD5vkqlxcapP3UoDNjp6fOs2Rvxu+4uZg1bOO4h7Mvsu8mb9aBfkmjSFaljLZC0jwzyw6e185NYter039XvBb31hbNwLUkvUWzNsEK2WID18yuikJ8f9QfFTxrcJIJH53M0pDgNUSIqxx/exlcgu9fJ2T9sTYmMyMWremrwLMOeApKJb2mRVQSuryVVr6kSmc1ggJG7taGHwz67i6ixx1ct8alyERQdCoxXpNEy1zxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822375; c=relaxed/relaxed;
	bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lfvWTGR9sk3YgaCoyEjGFdZ3PzU6S85IKLYrxoqAWJn4une+eE1VXtSp/YwZMwU31wjMB0xoA7sRulb+B0/MFtEQEGnD1ms6gjpnVBIsPQTPmkfNZYv56TW5yYeAYlWciK/zcJU+OqZ7ZKdPpixtIPO3qPsQjBzsXQh+ljF8pW8+o6/6TF+8iVxZ1sK1ZDQzfBpKP0kamEZzLWC2cAuVLjIflpd1R79VuSrktx5fV9XSt4npL86BKXpTwkiwmU0s0VG2XBo+Ngb2j+hctkt8NkErQSjsFXNKZjrHqxvZoO8UHT3cxVJwMacLVVueo2gEbmsi4GJdF7gYZP4+wXYjnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gy+eedIV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gy+eedIV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZDQ3PQhz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:59:34 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so479129066b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822372; x=1758427172; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
        b=gy+eedIVc6E45pW+93epkaNs6nfL78NbvfOBI+Umu9C850Ht/5uuP2jlTJygdS3Syu
         jL/DOJ5HY3bfMamqZvHYlLS6ATmvqpHotbWmfvjiOXGZdoi2mpjlZ2WKcjD6iv/E84Ml
         yaK2nWbvHJT2uq1jbhuEmd2de9YKVWAAYQmwvjfGvT5CuiytxWI06iaRVoR44bEgFtHB
         hnNDwQ0JvQEHV0xrlxxt5m/J76bBaXkb3a+XCjBKqSxQNR/57WA+o9WDJXhT6RP3bDCn
         aCVxOKUWh9sIyAPHJogxrMIb3HwanAfWveEmLG7A1pMYtuwF3tYyAwxzecwrVCKfTy07
         dh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822372; x=1758427172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9abWz0+AALTE1DyE86pUo1tihrL6Hn8wt7mMTmG960=;
        b=skLqVfpxdnO8hA4ebWOTGdVbs0shQoabgrI6mzG68p2aIgSqll5IeiDXndZQXPDeCT
         XC8Z72qW/mA3EEYJmJOnNiq80rB6BkCUgVbzT3MeAF6BCE0aOQW4wIA3Z4rqf0RP8qQ0
         Gbevm9oNCJafoD7yIFpy6vWQDDBKBojyv0rxOi7o9JRb8UH9qobW/M7RAYdutd2UoS0c
         Y5RHsxdKgPvXDXMSPNsSd6obaaKJVAku5oO+HL3v4STzlRs1a+J46awZR3IPulVu1ela
         AIjFaQnAhJ8UYZPLkA2L8K0mKfX7YkUMop4La4Y2QjJc2tHQ4KEl/r/lUU1b467p85gj
         GAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXitMXJQ3DA/xJd4+X9Q3cdxiBGNR+HmWW6x6iro2hKFECAQlRhihIJB7tbIDCLukhEMqbdcWgetGPVCXM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzxMYNgpehU3lc4ugFFTj5z1L5zZgUuqN35ViL8swWlGhed/Lhh
	OknbzN96CEY2y+HoNz72frCrsSORK2hXW9hPdtR1Xk8MK/OOMy3qjglY
X-Gm-Gg: ASbGncs244a5sBmyli5HJkKJEHwDFeTtkKi8jmPE+9aaSAKdwwpOjY60R5g+KtOHrwL
	C1kzNZcxQo287pmW9WdDaKNosfipuHOMZdGhN9Qy1+OStOJMRFuSvdbPTOuxPI1zbwtJ5bpdkpw
	DIeExtRGlhPS1u1enDQBF2GdbKW5KRHuRFJ9fpK3lBr+LT23qWJUGn55iX6CI7iQ4Sc0jKcBaxl
	t9lUs9tcOA89tqeCge/ve8VKZO26zvWfAvdd13IrfPvSGbcC9iMOL1ANMBlQ5uIT7OcMbf6HWqO
	BTz7819dn4aJWenm/Apr6ZiUZwfL7ImrxZwrI9/68HBGkshKWb4g4Bqfs1wOfxadcrddzfEH8Jv
	ttpoocgdSQwiZcf0/YCo=
X-Google-Smtp-Source: AGHT+IHIaNmlQUOqaI2XvHaD2x2sJJCA+iwXMxeIqgPaozK4MzRrxS2gXxwIxVkINaRf0GrOSh3U1Q==
X-Received: by 2002:a17:907:3ea6:b0:b09:48c6:b7ad with SMTP id a640c23a62f3a-b0948c6c6a4mr387666066b.57.1757822371514;
        Sat, 13 Sep 2025 20:59:31 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07de03d93csm287001766b.12.2025.09.13.20.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:59:31 -0700 (PDT)
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
Subject: [PATCH RESEND 53/62] init: rename kexec_free_initrd to kexec_free_initramfs
Date: Sun, 14 Sep 2025 06:59:26 +0300
Message-ID: <20250914035926.3770703-1-safinaskar@gmail.com>
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
 init/initramfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index 40c8e4b05886..d52314b17c25 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -690,7 +690,7 @@ void __weak __init free_initramfs_mem(unsigned long start, unsigned long end)
 }
 
 #ifdef CONFIG_CRASH_RESERVE
-static bool __init kexec_free_initrd(void)
+static bool __init kexec_free_initramfs(void)
 {
 	unsigned long crashk_start = (unsigned long)__va(crashk_res.start);
 	unsigned long crashk_end   = (unsigned long)__va(crashk_res.end);
@@ -713,7 +713,7 @@ static bool __init kexec_free_initrd(void)
 	return true;
 }
 #else
-static inline bool kexec_free_initrd(void)
+static inline bool kexec_free_initramfs(void)
 {
 	return false;
 }
@@ -743,7 +743,7 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	 * If the initrd region is overlapped with crashkernel reserved region,
 	 * free only memory that is not part of crashkernel region.
 	 */
-	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initrd()) {
+	if (!retain_initramfs && virt_external_initramfs_start && !kexec_free_initramfs()) {
 		free_initramfs_mem(virt_external_initramfs_start, virt_external_initramfs_end);
 	} else if (retain_initramfs && virt_external_initramfs_start) {
 		bin_attr_initrd.size = virt_external_initramfs_end - virt_external_initramfs_start;
-- 
2.47.2


