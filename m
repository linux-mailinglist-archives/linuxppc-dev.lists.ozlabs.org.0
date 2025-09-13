Return-Path: <linuxppc-dev+bounces-12130-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB3B55E0C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:18:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxM73ftQz3dVL;
	Sat, 13 Sep 2025 13:18:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757724464;
	cv=none; b=FV7/+Z7u2PTSQNVUCyo2xsCKZf1Dzmaf7dfhFybbSxc9p/V/vW3CegQGniaMiM/E+5BImqAUa3DiMSuhkH4xnwXrgZETMw62KGcddYpCqKTl/ka6bBAZHhOFL/PkTpCbbhjVz7hCK/+5emfN5bTXzjuz19ARAGebsc6cGRvvbtKuiCxuiEDioqrmftkmSqBPRn/+nnT+UY3hfOgiELNBXvO+BNczNpOK1Zi7NHe88npK34sCHkuPK0dOz907HGXkZIUXo28L9ewcdNmxT+ul1PgnvYyqpVwJhECtXqxMe9CW3fc1VlcID5WQg7t9K80cy7d+voC/rmiAsxMCrcli9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757724464; c=relaxed/relaxed;
	bh=4fVjgLbGK8Q3VzkUirE6fakA1teoXIVC6opbXGA1ZT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XrIjU+mQSakKZX2HIU+zZYnydfDmQjMQlAJWdxD79fL5YimgpD2tjmoPI0nYMZAyXdpTBDfZHhgu4Ojh16JZr+YcGzqRWuAe7bO/XuotJObPW9qdXKCpthsXM0ixneCzSUYX2K2sx3ncvB1qLlSMyd0pGgHrePiZ6eEgmudNqQeEDfSI06stA9JDpKeVS4B5pzN14RXlfKZaP8A30QJhgLN0PXvsWbckUTISFe/lJbRtgiIqLoHRFK/lmb1K6uaz8gnvBrJIk5SzAm5yOWvtlfcY2OYUZfQEIHeNEqBpDYIvJM+M+Zn/sjc5DPeT7nPfsQQvMeeXW3ulQDsdgJG3dA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BurJxc3D; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BurJxc3D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNt1W25dZz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:47:43 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-62f0bf564e4so149928a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724460; x=1758329260; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fVjgLbGK8Q3VzkUirE6fakA1teoXIVC6opbXGA1ZT4=;
        b=BurJxc3DF/DFsFmwcTfgEUVoR4jbAjPW/2RlLG1rfR/gam9VRfHXZzpM5J6cYpQUCm
         wLKooD6wnld2AdJcQLw/Urd3aJWhOVXSCdvwhBOW/6pGJ2b4PDBEz9zhCw+VZzJFciPA
         VuITOOUnhOdQLAvX14uUjK5N4NJZ13ettil0w6TtocMxwXN4ct4AbCzYBtzmNIzQoUGh
         +VtOF8Jw3wGUKtv6CP9OoZrW0ndUDyHM0SRM+Yi4sel3uLYy4UGhdsZIy7YGhaM1Ku7O
         DXqxyYg1KbHc3Q/1nD+1a33667V7gXZzwCBVsni5fUSELFieuGJBN1rGv1GuMb1L8OBi
         j2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724460; x=1758329260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fVjgLbGK8Q3VzkUirE6fakA1teoXIVC6opbXGA1ZT4=;
        b=FplYB+Dgqm9cTeVwN5Kc5bMq57SOIVhd5sb6kfxUIP3CiMUAPAjyCvNdemg2uG+82o
         KxxZeG0+5BVYqLrLI/0Ro3AbORcfoptHtgxnag507DbixgwYBz2r4ZGiTcw+UaG1Ii4H
         /qNjAZKytkobYGUIIMH/qpl5g2she4fbYLQCdgC7Zshsl+RJtPrb/eN+2u8ifmhXRd2R
         nxRRHOBQdrU/d0nnCNU83SW3k3RfTMrf0zFPkaRkNs3Z+vxKgBqaTEh7kwTSBu9lYBES
         BP0D7w12N5Zapb9htdIYNxLo3UG8Nt9ENLVfi3G8Q/4L9949zcYavlxRMozlowDhYexA
         LOKg==
X-Forwarded-Encrypted: i=1; AJvYcCXJumIZCramYnaVreuE4di2C+cYlcyejtJ5BV9Mxc9osgtDezgtD7OjJ0u3t4o0NcjgijO9lHfNj9oCg7g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxiSqc5slIeWe/l3qyYxOEiajRep9VsW3eqHHXoYfCxntx7lTsn
	ifDWcvjww1MnINI2CJjgujtZa6Ya95jdz0UxFpa2ZEec4ATHBp82xjsg
X-Gm-Gg: ASbGncvRj1HdhRw4BchJ14lSwNJ1Rm8j4f5pCXspXEJzmQHDHHKywLP5HXFkYB2KDJA
	vdaXdYj/iaKVkaKJM1ZXhRo+ChbBl6wt430qmuSj252HXv8PehkE+u+T1qW+O1bGxplhjjnMTVt
	W4fPZ67V8V/hMtKRp73LNL5QZXfiTYeFdU2Fs+7xwXI6iNNHtQvN2llMrL52+oxzgPFM7uaNWS1
	VQMtEx1RhTbhZNO+r6L/jsPGHVHjvGgDG43utlrviGBae0z2zsqZDEmFMykhddCpKuEoSmJZ2wL
	xzC8iHHYyI6mb4snhCrr227BkPM6A4qNxNK8L09/czq6a5ZdfM35sJaKjrYiJITrg5psLzlTCYl
	/Hqvv4Sdx+a8pxYXpWGQ=
X-Google-Smtp-Source: AGHT+IEn7MCXvWnM/H721JcTSYIJ22gozO3aCU54l5QL6th5VdkTEU9iyn+bkfXPUmCFMabMmsyKeA==
X-Received: by 2002:a05:6402:40c9:b0:62e:ed71:601a with SMTP id 4fb4d7f45d1cf-62eed71640amr2549162a12.36.1757724460211;
        Fri, 12 Sep 2025 17:47:40 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f3c01sm4224385a12.34.2025.09.12.17.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:47:39 -0700 (PDT)
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
Subject: [PATCH RESEND 07/62] arm: init: remove ATAG_RAMDISK
Date: Sat, 13 Sep 2025 00:37:46 +0000
Message-ID: <20250913003842.41944-8-safinaskar@gmail.com>
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

Previous commit removed last reference to ATAG_RAMDISK,
so let's remove it

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/arm/Kconfig                  |  2 +-
 arch/arm/include/uapi/asm/setup.h | 10 ----------
 arch/arm/kernel/atags_compat.c    |  8 --------
 3 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b1f3df39ed40..afc161d76c5f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1479,7 +1479,7 @@ config ARM_ATAG_DTB_COMPAT
 	depends on ARM_APPENDED_DTB
 	help
 	  Some old bootloaders can't be updated to a DTB capable one, yet
-	  they provide ATAGs with memory configuration, the ramdisk address,
+	  they provide ATAGs with memory configuration,
 	  the kernel cmdline string, etc.  Such information is dynamically
 	  provided by the bootloader and can't always be stored in a static
 	  DTB.  To allow a device tree enabled kernel to be used with such
diff --git a/arch/arm/include/uapi/asm/setup.h b/arch/arm/include/uapi/asm/setup.h
index 8e50e034fec7..3a70890ce80f 100644
--- a/arch/arm/include/uapi/asm/setup.h
+++ b/arch/arm/include/uapi/asm/setup.h
@@ -59,15 +59,6 @@ struct tag_videotext {
 	__u16		video_points;
 };
 
-/* describes how the ramdisk will be used in kernel */
-#define ATAG_RAMDISK	0x54410004
-
-struct tag_ramdisk {
-	__u32 flags;	/* bit 0 = load, bit 1 = prompt */
-	__u32 size;	/* decompressed ramdisk size in _kilo_ bytes */
-	__u32 start;	/* starting block of floppy-based RAM disk image */
-};
-
 /* describes where the compressed ramdisk image lives (virtual address) */
 /*
  * this one accidentally used virtual addresses - as such,
@@ -150,7 +141,6 @@ struct tag {
 		struct tag_core		core;
 		struct tag_mem32	mem;
 		struct tag_videotext	videotext;
-		struct tag_ramdisk	ramdisk;
 		struct tag_initrd	initrd;
 		struct tag_serialnr	serialnr;
 		struct tag_revision	revision;
diff --git a/arch/arm/kernel/atags_compat.c b/arch/arm/kernel/atags_compat.c
index 10da11c212cc..b9747061fa97 100644
--- a/arch/arm/kernel/atags_compat.c
+++ b/arch/arm/kernel/atags_compat.c
@@ -122,14 +122,6 @@ static void __init build_tag_list(struct param_struct *params, void *taglist)
 	tag->u.core.pagesize = params->u1.s.page_size;
 	tag->u.core.rootdev = params->u1.s.rootdev;
 
-	tag = tag_next(tag);
-	tag->hdr.tag = ATAG_RAMDISK;
-	tag->hdr.size = tag_size(tag_ramdisk);
-	tag->u.ramdisk.flags = (params->u1.s.flags & FLAG_RDLOAD ? 1 : 0) |
-			       (params->u1.s.flags & FLAG_RDPROMPT ? 2 : 0);
-	tag->u.ramdisk.size  = params->u1.s.ramdisk_size;
-	tag->u.ramdisk.start = params->u1.s.rd_start;
-
 	tag = tag_next(tag);
 	tag->hdr.tag = ATAG_INITRD;
 	tag->hdr.size = tag_size(tag_initrd);
-- 
2.47.2


