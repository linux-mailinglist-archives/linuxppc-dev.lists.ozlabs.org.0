Return-Path: <linuxppc-dev+bounces-12124-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D190B55E06
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:17:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxLT5x2tz3dJd;
	Sat, 13 Sep 2025 13:17:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757724857;
	cv=none; b=Ra3/re2zliHYD+Rp4hLkH4Lnp7axD3NSaF2nPC5ZHtl4Z5RNdsm14KQQHS9RgSAHEr0PWUtRueuf4gAEOo9h4Q5FJpt6o5vluZwQiMmTiGOKq6pphUmmEBh2eEbqGXAFJf+/YnD75WkfEu68TqAjxPFu8w8XuFF+7aJXr0cx43Y1z1sbDUabga/sowoeZQwVhF9FOfVKgeayk0N1M4KEKDJyansMre39gn5A6HSRLwrBs85JtwAB3xIEPQ3V+zwpwZSHVQ8cftpa+7sLqG4v++x92wT/IHFL3u4276AHuf4mfIjQ2piye2gSLV0PeB1NCzdoGhAvZOwQi30Di8qpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757724857; c=relaxed/relaxed;
	bh=HNaBVV0FpkKN0cdUwxCZ8fQss5eC0TEeX4co/5GJ2YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZMa+P18Pl0J4OudIHm9DYn/DSj899WqDDBOZYdrs4bz6wFThbvIwu2iecG04EAjU0HihnqFkEGv+TgZxvPTsd6F9v91h6tYcv41e21wcN8a1jUJvcsrS20s5g1qnR0b8q97SUedvH0s4dV8BdWKK1sAf4vU2pGCA6mcSAo5HbC8ETvz8KmyHMbb6UfCwTmNOKr6OjSppkIRtUz2IIzKDdyHYcioXyPz+R4WnKKbBPCoa/k6WmYIslnCgFb/4RQmgzKTHJTfYRK4A44Dpad4LIdqrYd+FIyt4jI3OQbk5KLnMGphwNDwbso5Co9+Crme8Gu9EccNDZK6ESQxoO0cpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lRDTVt3T; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lRDTVt3T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNt9424xjz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:54:16 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-61cc281171cso4444828a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724853; x=1758329653; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNaBVV0FpkKN0cdUwxCZ8fQss5eC0TEeX4co/5GJ2YQ=;
        b=lRDTVt3TEXTrmiI5Ln/LynfbXArqxfQ1gAyVe+ZfvrG0gKlVu1pq8JRdgfTxcrwNzv
         lXO4ZshCnKIngBvu1s5sECYrIS0+2s92k1/BMU3Yj/NqNayLApAetRKzNuhBANR83nSQ
         dfFpAr9hqoG2ipOvaRiTHhAHQz01qXC6/qt5qawp00uw4CFkTJCgJYKi2WiCzx0zjJrR
         LWaJwOQVgiEshKacRRdt2sNMekIaYOYitN5AOgPcRJgzYHg+4qNSDryeFgUogax0XCB3
         jQYY3xHHkfNq6A2/I2qPaOC4zcD6+mvEavcjNTY4NgeC2tbioUksb3os/VF2waT0+ziU
         QlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724853; x=1758329653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNaBVV0FpkKN0cdUwxCZ8fQss5eC0TEeX4co/5GJ2YQ=;
        b=VrSTjUkAGau2sG2cHCCcBz6XtVOjVs1UwZFsN561I1mkb3Gox1zDLgGAMrwmWJyMvD
         aNo+Q14s8iCgAX09/bHeWwrAtxti/xNIH+TnOHvbiijXV7dppa5C+k2BhFjyVGpOxPhM
         IOH64WaktUD4SitIvRlhDyb9SFTBNr6olGMpoCOeU2z/9kJS0NUSVb7s2rupttfxoC4J
         GO8juoV8n9PB8LysglbWVdXDBs5cEdpVG1bJXWv+xA4kpQ3KKAzB2WxAkV6E/p1RpeSt
         D0LNCHONr/9F86cQfRk0n9D7hqSSlhZwiSOKUwLe4CwycFNILIhVIuUyROxmUXqTu93/
         qD1g==
X-Forwarded-Encrypted: i=1; AJvYcCUXgphDltXW779W+OonzsierfbSbdUoI69Y0uFdneF3xcujJf7fjTKdq9hnthW7Ps/SlajJ4CCb1b8NT8Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQ/cLeymjhqp/YLkXo1az6N51Rzly+kNL6sCFiScdkH8y34vae
	MhlxCS10ZA7mt8ZR0nDVSIgMccZznV0MaTsBO5iXkPKvUmWIBCUkDWJg
X-Gm-Gg: ASbGnct1CtelR70fVptgnXDfM9m7LPni+oOlJSQS+4i1U6Z6jrECGh87rOSQd2PznKe
	SfsbPbgzr+SA0hAC8K/mcoETfCyp6yNuy5d5R3emz+Z2ARA5Mh+bpbodPbPHeg7gjXSpSyXH3US
	Eh+z80rOhHv7s66mJ/fodOpqFcFEFVEgipxrvb1hS31678nv4OZvnv33MIFcG/C8yMXJorIlfkL
	8+uM8OvW2YW/J5Qfn/f4YsUIJnPXEqF2Z/nfDZjL4tkOiVpN6jsvWmrGFsUY7xLaXPfYSikCquG
	5oGXHy6/GSJLMFgfX4Yxovy8YJwj9sD+I5D5Ao496FSypTnvjfHxKgEcp2ahh6vLc5B8b1YxWIx
	5kM90rtOZwdN20r7da/L0/2YQrwdTNQ==
X-Google-Smtp-Source: AGHT+IFRAhwUW5zsVWdQl7rom9u+xngcdJiQFGIxNb9yv6sUT2JdEwHxw5AIwBj5WkuunZa0hzcUAQ==
X-Received: by 2002:a17:907:7e8c:b0:b04:3513:5138 with SMTP id a640c23a62f3a-b07c37fca87mr474198766b.41.1757724853144;
        Fri, 12 Sep 2025 17:54:13 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b30da310sm465332066b.20.2025.09.12.17.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:54:12 -0700 (PDT)
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
Subject: [PATCH RESEND 13/62] ext2: remove ext2_image_size and associated code
Date: Sat, 13 Sep 2025 00:37:52 +0000
Message-ID: <20250913003842.41944-14-safinaskar@gmail.com>
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

It is not used anymore

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 fs/ext2/ext2.h          |  9 ---------
 include/linux/ext2_fs.h | 13 -------------
 2 files changed, 22 deletions(-)

diff --git a/fs/ext2/ext2.h b/fs/ext2/ext2.h
index cf97b76e9fd3..d623a14040d9 100644
--- a/fs/ext2/ext2.h
+++ b/fs/ext2/ext2.h
@@ -608,15 +608,6 @@ struct ext2_dir_entry_2 {
 					 ~EXT2_DIR_ROUND)
 #define EXT2_MAX_REC_LEN		((1<<16)-1)
 
-static inline void verify_offsets(void)
-{
-#define A(x,y) BUILD_BUG_ON(x != offsetof(struct ext2_super_block, y));
-	A(EXT2_SB_MAGIC_OFFSET, s_magic);
-	A(EXT2_SB_BLOCKS_OFFSET, s_blocks_count);
-	A(EXT2_SB_BSIZE_OFFSET, s_log_block_size);
-#undef A
-}
-
 /*
  * ext2 mount options
  */
diff --git a/include/linux/ext2_fs.h b/include/linux/ext2_fs.h
index 1fef88569037..e5ebe6cdf06c 100644
--- a/include/linux/ext2_fs.h
+++ b/include/linux/ext2_fs.h
@@ -27,17 +27,4 @@
  */
 #define EXT2_LINK_MAX		32000
 
-#define EXT2_SB_MAGIC_OFFSET	0x38
-#define EXT2_SB_BLOCKS_OFFSET	0x04
-#define EXT2_SB_BSIZE_OFFSET	0x18
-
-static inline u64 ext2_image_size(void *ext2_sb)
-{
-	__u8 *p = ext2_sb;
-	if (*(__le16 *)(p + EXT2_SB_MAGIC_OFFSET) != cpu_to_le16(EXT2_SUPER_MAGIC))
-		return 0;
-	return (u64)le32_to_cpup((__le32 *)(p + EXT2_SB_BLOCKS_OFFSET)) <<
-		le32_to_cpup((__le32 *)(p + EXT2_SB_BSIZE_OFFSET));
-}
-
 #endif	/* _LINUX_EXT2_FS_H */
-- 
2.47.2


