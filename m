Return-Path: <linuxppc-dev+bounces-12175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB6B566FB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 07:31:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPcH01Wl9z3chZ;
	Sun, 14 Sep 2025 15:31:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822052;
	cv=none; b=O03e1Ls7VJscw0RYL9fZfGFAhhf4zYggcK/XYxnWisun5d+PIwLiLZdnAHfBbU3Yqbz/zPZW42pce3zp8zV3Y2gPrujDWw6gtvHIv9WnfFNvHGvt7SoUmS0c0HvuSrhXUlUrZQPzn0wF74Lj1K6Zdo4BBAlzsgBMwAVUysyUFW13tB8jvhK1N5M5k0gjE0kch/PZDVXTxUsb6QOhdTtAUevmknt4qndaRyxC7O+MdvDhvHd8XV8u0mbPeW7kGK8v9y5eKrLcTAXqLkctpYIVB+8GeLE013FNiBlO/Fj6qQbjgSMtXVjX5TWLFcEXVb986abVVc73OjaLFzZpliYwMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822052; c=relaxed/relaxed;
	bh=U0YiDU4Bzw7IKNW2/fgCfvKW6iRx1DQ4l7Ssn455PQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIF9lR3hsaFoOJfccLb7Li1f6S+LqqVXMlCf3eV7u9YozrIPPPMv1nnQVvsTNWX80gpubXCjBsk3fC1cLBw1nkj6scZpZy0KuzjP0ZOWLiTpnah2zUIiuJrZnCDplhNQJd/ufp/WV2uqk4vIlShjyGZVIqxc6pVlCB995xXVRdWPCR5722NAjuzu3twAYVVkbRP3HXAnzB1k1H3PU2vqBz9bZI3TWU4uAof7+vW0unnYq2eNLWTM7Yavw417kXDf3IYBbDm7ACLDgt4FX0zBv+rxcd7NWCKrvSqx1FLzv4cM0mYJGYajCxoJ4kftZkc/nmEOFsk8nuKFkB9kahmjzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lgqpggj0; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lgqpggj0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZ6C0YDRz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:54:11 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-62f28da25b9so363824a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822048; x=1758426848; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0YiDU4Bzw7IKNW2/fgCfvKW6iRx1DQ4l7Ssn455PQA=;
        b=lgqpggj0smhBpAvun/ChzTldmjrQCE/fntQDQGx0dR6pRr3Z9vP/WFqTKd9qEjIylN
         eYIb0Ur8wx4RYpgnVhhaoaiYMzNTo/BTn1LOMttg4jdu1BNHsxl6IxEQeyp/H2dpNN1v
         xaOwQIeRxOS7ev2ntT7LvCF2DmDRSPBQp74qZHL1Vqos3ZFLnPUwTX9McL/ESQzuO6Eq
         GIVgm1BigG+kyQDCoJW+GBqV8rnhslnLGV3ctPacMMomLT6ufy+q1S710GvsKjJoG0Bj
         MFI40GYR25RIz0YZC097VbkptrcPrKP1OZqCW5j9M/eVD02U+EeqX+NAd21MRt1PfQBn
         r6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822048; x=1758426848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U0YiDU4Bzw7IKNW2/fgCfvKW6iRx1DQ4l7Ssn455PQA=;
        b=TyKXCGZFcRq39sanaLbT30qywfF0G6DkCl2Sj3ilvhtyf1Bz9v/Dv8fAd6liWanUZS
         tP3ZbGk1D+gdcUiuADC+NDEyrKps2aHAmuh52Bj5VxwZ0EpGZuH/whDehWt0vOCo4N3a
         Jv4V0YmK5FS0JTPGEFtQKwcGJu5wPTe+3oXjPz9+gczIx77HhjZSf5dmWXLzaP94+oL8
         PNrOOmw+mKJjmZCwrgYiRVtDs8/Hc216krE3cahGChZGogQfTpOLVCJDrp2AmEFb03ot
         EdYQgdXXFC4HxCmNsAYq1FVjCRIfBawP0vUyyTxkXhSTvWh6s12fQ2JpV0TqlAuy0XXk
         MjRg==
X-Forwarded-Encrypted: i=1; AJvYcCXnWSvqBOWZgvOtOH54o6rjLZwshlRkexw/giWIdTWplXQpWj432lewaqmR2COMbel5ImiO5D8xns34qJM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFZjeOgA/hPIZm7WPiLo2g4ltJ7puLs7WpamDwRsc8+2b0AxJL
	vmrKuZZxz7txK+K9A7IVEM+B6iPzkx3KkFmUcs9eqA+dYBxrd/s/4tMw
X-Gm-Gg: ASbGncsO0nyR4eTqd77rkuRUf/tZjVUD9/ujJwVF7d17se2AnBdRYrYmmbZLs0r/nBf
	XYd4Tg+4tDaBBrjGLxbxwIR7UcD7RVCgJlvCM/X4N9wTvWB4ZtRjj+iJtCnsbhNtNV2JayLKd/y
	gUmtUNAhdCQnCr6XjuimfjlKQF9KSPTSuibh5M3NSXQsJNlpZnAa/Y4mOB1tSl0KbBrBT3GJp1O
	QfrqduX4qEQeO/RCp/nqqv7vtmj//sDdvUanBdAtwKPxfbWmgeIS5CCel4OdlJIx8+lOou7wpus
	vNKAoTbmE8mwnikG0gGgJkXMEjSVbW+tjsfJLijdQoA2YpzuJh6cIdCykKeMPqVUrY1R4OmIwvT
	D7O2SmcBYediVkS8jfO+TdKQk0K5Teg==
X-Google-Smtp-Source: AGHT+IEVLkeZlLSkzoTpPLzlBRvNTQ9m/bl133jXYp2zZldNvB+tlYKH8pXYzZ5ISfOO2+UjGM6RFg==
X-Received: by 2002:a17:907:e8d:b0:b0e:3d88:27fd with SMTP id a640c23a62f3a-b0e3d97e027mr75192266b.8.1757822048020;
        Sat, 13 Sep 2025 20:54:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07da7a8918sm303079766b.56.2025.09.13.20.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:54:07 -0700 (PDT)
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
Subject: [PATCH RESEND 44/62] doc: kernel-parameters: remove [RAM] from reserve_mem=
Date: Sun, 14 Sep 2025 06:54:02 +0300
Message-ID: <20250914035402.3670906-1-safinaskar@gmail.com>
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

This parameter has nothing to do with ramdisk

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a259f2bdba0f..0805d3ebc75a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6277,8 +6277,7 @@
 			them.  If <base> is less than 0x10000, the region
 			is assumed to be I/O ports; otherwise it is memory.
 
-	reserve_mem=	[RAM]
-			Format: nn[KMG]:<align>:<label>
+	reserve_mem=	Format: nn[KMG]:<align>:<label>
 			Reserve physical memory and label it with a name that
 			other subsystems can use to access it. This is typically
 			used for systems that do not wipe the RAM, and this command
-- 
2.47.2


