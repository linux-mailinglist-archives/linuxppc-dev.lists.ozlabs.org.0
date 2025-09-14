Return-Path: <linuxppc-dev+bounces-12170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC866B566F6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 07:30:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPcFk496kz3cft;
	Sun, 14 Sep 2025 15:30:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757821872;
	cv=none; b=E1MNSdjdZL59RfdfYDfyjrQCjfL+xN6bJ5CHC2vx6X7duPGIpK+VeKzReaVQISU6L94ZPBhIPSxZxjaz/aveSeRd+0gr13lOCV7br1baBjODyMAde7XdFUuPHGx3NOPn1FOQRuoZWHY/KI+zARmBt/+0LyXL5WISTWKFyr4TJnGkiZGcvPt5t/++Vp2JMytF5GCxBJ1wPyLHNX6C4055zUnoWofKgw9Kcv8iEIebfE+Z0p4c0xvfo3KrnuY4xr7BMMcYSZCZR6VqT0alC4EZ1UpmkYobzBurc35o+kiuHQ/tQM+iyOuJDjVC40oEm1QBsOA5vXMn04raqI2GGABNfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757821872; c=relaxed/relaxed;
	bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCX6TtU6376otOrtucjrI698Lkma1AuHVw1t1kdI6pa7W9Pvsdkfa8B/xX/ITCk7uVZxLdEKXvyGf1hfVMos3UQ5//HuNqJ5RpETtDPx43gudFERi6GvQdQ2PTh2mrpAbBGy4spX4T6g46ds3/7sGWFmJOBE1viU3/ARUkckIx3FhmvK01gBhgO3efpRWGkMZyuT+VJb50UZUHaxcfxZ1VIynp1o5ELG3B+yOHIGDyA2xgFAitUahmmmGsN/qMwgVc8Mg/FMOWwSmbBfUqDoulmOIk48PVFjEEkUA5TYlHMSdASPLFQVf5Mpu4L7nZy0KXuigQMruW4rAS7OZJfEew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V0vpUzP4; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V0vpUzP4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZ2l3Sb5z2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:51:11 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b0aaa7ea90fso92710066b.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821868; x=1758426668; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
        b=V0vpUzP4/M4UkXGTEl6awuxk8qJBfgZ4nhjZR0Ie/ogAR3wRXMzALlYiVFawInZF5y
         Q6y/XsEkFBS1ugn0s8ZAXahm3ehgw/wgjI5iNbBqVwLgltdwzkK+nDDcSXkVFUkVVU3F
         GPMj43hvnD6iJjk8ugo/cC9UgGvfAnb0s8PHtnb/M+tMRHeD+FCe+XETEk68Li31ZTCr
         VO4/sxC0I/AIE7wBPOgS2GNke/ot4Ps8t22VNpoe/Tahdk6NzFMLRXUB0zXg2rsWEbb+
         d1TIrqJJ73PZMjhf1cn5wkqFHMg1uhdBcJxCsg59LJ9Oudxld6Ar/Qw6D7hMld7sHZ4B
         biqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821868; x=1758426668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgyNirakXvU+05rXEnyXXLzO67oYWYN1IcZHpjjqHUg=;
        b=Rw5TCpJEG3jzz7Ft3Vut2sBI3FSc3u9/4+w2WZ6sHZOKdXs86qnx+iJiAERiZ4fLQ3
         hlZo/bCEwv0emHKnSOZTafCXuml/FoUUKKdjij6GfcYIGgLv75Ifc1wRA4EkEspjV7wX
         K5IpgeWFTqcJBZS7KzhSWB6Lkcs4kHm2X1lVyxKL/mFK7E9X6ug0GzHVhHIlsus7k8+B
         MnpJWGDXFdbjdV2512Guvt1UqHpPC4gTsdcDaqCGaZbfNKTdqHRqXthiUM/J1RXslhZs
         dAG64q4XUzd6+ubvIFQhoNAkpDQ+I3w8yNcEOWFMHX24XnMxk+slsJQuXSawRORbb3ms
         FLXA==
X-Forwarded-Encrypted: i=1; AJvYcCXVAVkyI6DeOzWPlamqnas5MzSWD76sZ6MUswpI54ui+nhxTmkPxos2XQEVR9cQaUHMWhChhY8hQZBGzvo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx28MIFvMiI4eB5LrPo685by5p8YZiqO/tdDz/dXNs16oDCOKeH
	vPh6H9waDNKYd2WTfaFmWOcUvYadqltCqXsdQQ2CWr1lJKM/gzFftkd2
X-Gm-Gg: ASbGncvlIMVyrFqq8VNs6c8+8KBQCRy3UjrpVW98Js3XSmxn+HzfNpJsG6+Vuln90zw
	o/oASZ2EBlyt/h9OAHjB8ce5VTS2l83f/eStdaPA9zEoBbqOd0Q8n3qhTwoxGtdU/1fyI4zGok+
	g4TsZ6qrkSEOCFHZXtgxrbKU83LhsxXGA9TKuYhF0QI2ujbiUbgGpGG88KxxU+bcfbvj9BBSD/2
	/cBj9ee17Oz3mbOVju8e4LoOzxAHB/3UMzK9VIlXVKZYRzDZKxtm9mDBIUrtscgrE5v1e6mEyL/
	qU+kJtRdZRXWb2BnzBvZrRLegRVmFdotYDovOEORNTOftwTENjyrvKFZXDKgQsjVZUNbTruFjN1
	w++nwj8euxQADbLCdrb4=
X-Google-Smtp-Source: AGHT+IGYiK6likOM/TjE1BLl/jI3UX22nGT0EQIxF87CUWohx3tkGnMcAa8PzC4lwu+rbC2577QTfw==
X-Received: by 2002:a17:906:46c7:b0:b07:da17:79fd with SMTP id a640c23a62f3a-b07da178367mr507229866b.17.1757821868321;
        Sat, 13 Sep 2025 20:51:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b3347b6fsm679031866b.111.2025.09.13.20.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:51:07 -0700 (PDT)
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
Subject: [PATCH RESEND 39/62] init: make console_on_rootfs static
Date: Sun, 14 Sep 2025 06:51:03 +0300
Message-ID: <20250914035103.3619203-1-safinaskar@gmail.com>
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
 include/linux/initrd.h | 2 --
 init/main.c            | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 364b603215ac..55239701c4e0 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -23,6 +23,4 @@ extern unsigned long phys_external_initramfs_size;
 extern char __builtin_initramfs_start[];
 extern unsigned long __builtin_initramfs_size;
 
-void console_on_rootfs(void);
-
 #endif /* __LINUX_INITRD_H */
diff --git a/init/main.c b/init/main.c
index 58a7199c81f7..f119460bf8e1 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1533,7 +1533,7 @@ static int __ref kernel_init(void *unused)
 }
 
 /* Open /dev/console, for stdin/stdout/stderr, this should never fail */
-void __init console_on_rootfs(void)
+static void __init console_on_rootfs(void)
 {
 	struct file *file = filp_open("/dev/console", O_RDWR, 0);
 
-- 
2.47.2


