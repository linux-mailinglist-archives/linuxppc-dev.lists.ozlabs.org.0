Return-Path: <linuxppc-dev+bounces-12105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE95B55DF2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:14:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxHD2yzLz3cYr;
	Sat, 13 Sep 2025 13:14:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757726109;
	cv=none; b=kQW+bVFCQl7NhQa9Za7f2ayHtvs6Ne43TEwZqjaGdcWiVWpB5Ac7sIToRaFpeIEhL9L5EDnLP+7o+2cjYLXGJxQ3eqsJTpNkIjZU+x6BB5Nb9jE9Tr8sVrnvn2eDiYiYHr95Wt4vDO3RkMqTf5FSM1RCoBOaXjJ14dQYujNjJTlyTLnEFLPzPVtPl7pj9Gf/8wCyRcdj3E3VprNsRcM7c68aPz8KbP2ycgBGswGAXbeOF/nsSds0Pp48RkXWXUVUaU6e5J+uWOoEPOcXDmITYPOWZuZnRsMScekhjcQW/dlB3mIZmmqrBx64iXErqKPHvwpBJQYbQluHnssKZl/pZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757726109; c=relaxed/relaxed;
	bh=OGsRGTypi9NqdtciySRZZEpkGgKS+BdOkJag/Ax3VcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mlAE2gZ+iyEZ4OsxKXERa6OoHhqBCMPCS9fgbpcvVub855spx5P+ywEXVe0ia/3z1LMfz/RMJF/FJyqHmk6Rlcvasa1svyGuQykT6TDMTBMe+9fyJgt6E6ndhwbY+qvAYkARUthQwiPwyq3+OfpY+LIQvFvvdg7by0KgUb66qOrkrk4CTb+LDBsnZvG074oAh0nUsaJG4g5WFZNneLUi3XQltSPURNKGvYWGqo60uwMM/wklZCKH8Cz2JGrB0qGrCZS2ujruDgctTnU2IQYq9Jq/RkF8tFMwmGn6cjwOHUF6+nV/bRaHfWr2pe962orNUXKOzoI1U3YcfZJKCgrk3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IqUc0J/2; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IqUc0J/2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtd86Ykjz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:15:08 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b07dac96d1eso101248466b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726106; x=1758330906; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGsRGTypi9NqdtciySRZZEpkGgKS+BdOkJag/Ax3VcI=;
        b=IqUc0J/2fmehgm6nXNgO6sQapw0TFIrVTx6VPs5l9LjjqLDOQm+kXEA0/lrcaBfY9x
         SFhYIhDDVS7g3W4jh1HyF37z/8P/DZxi3yb4knPRQvlRw/miovjm7pEKrosmcFksEXm6
         m2LxsdW81sqlWVNSSWnfCXbWWRO9I0FtQPNpL4ZqlqktXp7HumotxjRPCap57vDj2YTl
         65maKv9ThsLlR2Y+fXLEedkPrtuGMxH2oYQu48rGpSVtgN0bkj+LuQ36cwv4oDfwBX3U
         fjma+5r+M3g2SA8h2kfgjviO4QqjU8Toh8rldU/ScHnK7f8c46AMUInxmdTXuWqUGW7g
         nI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726106; x=1758330906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGsRGTypi9NqdtciySRZZEpkGgKS+BdOkJag/Ax3VcI=;
        b=g2krPQTRSc/oRhSSF6JNumWj4otM1qMKSuR2IjPDmXQC2WMnwN81RH1U6nNfWbb9bX
         EiZeK0tRmx6D6Dxr+6KXjY4nFmZopNCM+8iflIfcyzi59/fQ7jDRdCgy0VGI8Vbb0aAZ
         Pf0wJ88V+Cdjj0vEMpIE9gUtQH+Nf9DFpectrOkGU+4xh7e5fHGMR7oQv320yUdjXgYH
         Btj9ZMMBKHvBJPcLVVyXYLXPkcxXwAMxg8LHiF2ZrVgXVFiua50P7vj70PYdFTHnUXIt
         Nre0+tsQF3xje2JVAST7zvNYR1mMb8+dQo7NBOCrWY12VvI6edDycGhWIGGD+cC/0q8o
         oVmg==
X-Forwarded-Encrypted: i=1; AJvYcCUH+dKMP+WAzda5vIlBIPZGjGb7Jo2KV6XxFYIRBMituB+Cw8STCd0WAd3DK1MO6tZUJQQGzvX5awHHlCA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyu7op2JQaAUivISXetYAxqw8mSatcPAoajwzIy6iafvnWvOE44
	MQcVysmIH9wz4Z5Ok904BxDhpF1RRrXZ0aE0CTUtR/CPQPQYCkDSJ/hE
X-Gm-Gg: ASbGnctMtXbXY8xG2SaxjqttIwBrrnrN/++Udan+jPuMnxnlmFAeIAs2HMKQSIaD198
	RBQwmW9U2v8MOeG3o/0aefdNiki3EHpIbSIsQJKqMDaB7Cu6FzMDKxeE6AZ1y/Mab2gUlotRtqm
	cZxTEJFkQWFgVbikkmZnEAsNtiRscfRlWbWbH2IYNkXRPh6hbRXePsX7aNJCL889weBRKre/T/W
	CinV5YkadrNYd9Yn++036JUfxcvnToibEbRsYE+n8aDgJ3DPziij4IcfjDHjEx5Zu7iL8/eDFL0
	JllK1YX73C6olPztHBK2ytr5AIcvqu9V6GSAZGbZ4YpFiTcs2hjfkvfxsue+/XEJf6nqk9aJw9+
	LT6cmQK8ycqk4CY/iMnU=
X-Google-Smtp-Source: AGHT+IF9BfFXzJCfAH1j6Whgn4db4w3JHUdrGBSr/SBtjDaVKK8KXKnwXgawQKNvW2//sA4Wp0ETBg==
X-Received: by 2002:a17:906:794f:b0:b07:b19c:1389 with SMTP id a640c23a62f3a-b07c2543931mr499914966b.23.1757726105874;
        Fri, 12 Sep 2025 18:15:05 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b334e4fesm475799966b.106.2025.09.12.18.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:15:05 -0700 (PDT)
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
Subject: [PATCH RESEND 32/62] init: move initramfs_below_start_ok to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:11 +0000
Message-ID: <20250913003842.41944-33-safinaskar@gmail.com>
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
 init/do_mounts_initrd.c | 2 --
 init/initramfs.c        | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index d8b809ced11b..509f912c0fce 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -12,8 +12,6 @@
 
 #include "do_mounts.h"
 
-int initramfs_below_start_ok;
-
 static int __init early_initrdmem(char *p)
 {
 	phys_addr_t start;
diff --git a/init/initramfs.c b/init/initramfs.c
index a9c5d211665d..90096177a867 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -601,6 +601,7 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/kexec.h>
 
 unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
+int initramfs_below_start_ok;
 
 phys_addr_t phys_external_initramfs_start __initdata;
 unsigned long phys_external_initramfs_size __initdata;
-- 
2.47.2


