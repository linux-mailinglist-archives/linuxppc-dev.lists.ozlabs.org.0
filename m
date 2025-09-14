Return-Path: <linuxppc-dev+bounces-12165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71250B566DB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 06:40:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPb7l1VGXz3dBq;
	Sun, 14 Sep 2025 14:40:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822196;
	cv=none; b=KM1eGCOFIwiWmE/lAMmFxUajpLDIF/HL6g8oBQ09yusqf4Pv5YSDKol17eUfKnuTOThqrlrXGeZ82WPL3ghmMw+wtxInzqs2SVe6Vo0bkMZPYZjI9SOzWBH0I0Xl5YukGNpVTvAwhqpHR953IN/MMscLkl6W+iwYYmBURQY9INJGQ95TSYjF0Ye3fz5+HsA+RS7JOL1ZZ2nfGtMhpLUGUKApIP1iKCLkiyGkgmf3QUGhmKtDKhL3fh8hDa28NSD4dWRetiLunA2yfTESqnrN0GhrN+adexUqVWfzkzsus/P39RdzsOzAFwDX+EJD5Xz+jgslkBCmeh/3wH+D5KiaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822196; c=relaxed/relaxed;
	bh=ukssGXUYVXOD0e/noqLCBxDtEOgQieVYL/7Zl394zX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6IdxBukzPdqQauz68VydzSe/X8UnMOlQOLloteqcgHiRlZYG15l76/dxfsZo5s7LkgB6YWNmFq/thW/ROz7oR1J5bqJFHNXHbjkYCv2wPhwg8tYThdbHFtqaaIzOKX83EJ4N6hgP3PAMBZoKzsM4T4R2PJ39xRdppK08q9GMBbRyBHjIQcumXd2enIpgqLjvtxMf2YBKnE98Tzu+mNR+aD1Lfss2qvHSWp8qvZX7CjnBqvfB6TCZ6+2yHbJcARXpwXBvnoIjfA4f2qLwL4CswyqSUeybZfWXCcLQqdk4EtVTt2Uo3DFOkSPbRrrcW128juU/Np5Ty26fbAyXJbzbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i75Eol3X; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i75Eol3X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZ8z5Knkz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:56:35 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso1757496a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822193; x=1758426993; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukssGXUYVXOD0e/noqLCBxDtEOgQieVYL/7Zl394zX0=;
        b=i75Eol3XlpR918Fol/oBDMvIrJ/ZYlnMX80mkVbR14oC2zHGXArK6165woFXUSgDew
         LqZqvTXqd3FVbb1vukyPN6wNqtK1cXh6y7NrB/9vjSpUSmzrq8wEHua7j3zYBr4Lvg/2
         BcTF+DMrtFRaVOjAV3E2VXGuZg1McPFFhfzDd4TyenDFWJ6nYME2GCsi/lmgwW+aY2kk
         fyDSadzanCIvntNazLuvgkRTgqWyboNYFXjdpusZ4cN6ZhVnn2FXM2SkoC3WaA1E3PVs
         QDVQEGd68qIFAaPUWg8uHTLi+wDcnLKq3FZg641j8VFWSB6DDDRGDkGLr4g24cgZ/eR4
         rHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822193; x=1758426993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukssGXUYVXOD0e/noqLCBxDtEOgQieVYL/7Zl394zX0=;
        b=vo2DJ58eOuPFzdMYGB7av2KU+CXGsBRrvfiCx7WIxS8fWsx+5zgM1Bd3O/7LpfNVxw
         2HCobLTsBppaT71IexRW6KDw0neDz9IjDkmYRe8xUe6XiuAZSQvRq2M71x+wgSeqc3TN
         CsPao8Ljxut7kr5qYmUTNEoWU1DU9OxI+3Uwu1rwzb30CJ+zM9EJ5Bi2TlCEo0j0GQ2D
         9pYYbJecq3Te45eQxfA3h7vY+ScBWn1T+wnhY/lgrOtNWKkTnpUeHrqzenrY1K8E/OUU
         HMjurvLPEiiYnIJbfP7unYwvVCosnbSHBsloHA8CI2uAuYwGLkKtuZFkVNY3Ry6EYVc6
         Aetg==
X-Forwarded-Encrypted: i=1; AJvYcCVN7Likf0Y96g2r+RmyOAtItC0r0mMM/3d861DQFgIYumfCyNW5NGM3PxYmJ/afgZGQ+wrOBM1XOqw3i+Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyd8guTY0o3YezOe53zlDjFyctA4Thqr7NxM+rtWmy8D8nCi2Un
	a1IbnCSjIDVaMqntPe1SB9mWnJPBXQZukP3Qicf2pHq9Z/6Axv2XNamF
X-Gm-Gg: ASbGncu6i5fjR504H+bGQ59+kEurE8FLBgRpMtV6xiEM0hwYPnc/8TDJQoRXzzt075W
	ksaRh6Yykm/2L/sV96vBAzcEElWYLLufYbqpu8+gMXgfRTOC5/UE0E76L1YWIMrtR73WIvvWyaY
	8kQlgu24EQDR3pw5uSLzEpA8CeUWmU+kKepeQZx5grMq9jiej1U5PJBee34qMfmjVhDCg5FCVci
	e7NsD/Wt/xTZbRTXEtXUMExEdWCh4dbVubzrk0Wp1jhwFB4e2aBjIeQBn7T9XHNexftIIARkgrg
	XiCHrssIQiKnlcz7iTNOq/EI298zX65EbHuG5O8OOW4RtNM1fF2wwLoU+lzeLCtdVF8bQGYP+E3
	6x4nOVswCmO8HsuF2BD4=
X-Google-Smtp-Source: AGHT+IEh42ac6WqH282xp0DieWYXKfg+ycti4urbWWAb1GXqLLNoKNDdAlfHKjc5T4lrTIZzL6YLwA==
X-Received: by 2002:a05:6402:2815:b0:61c:e1d6:6bf6 with SMTP id 4fb4d7f45d1cf-62ed80fd3fdmr8226990a12.7.1757822192729;
        Sat, 13 Sep 2025 20:56:32 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33ad2d6sm6510443a12.18.2025.09.13.20.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:56:32 -0700 (PDT)
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
Subject: [PATCH RESEND 48/62] init: fix comment
Date: Sun, 14 Sep 2025 06:56:26 +0300
Message-ID: <20250914035626.3718268-1-safinaskar@gmail.com>
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

Make #endif match #ifdef

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/initramfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index cf19b7c0c358..30e94ebf4902 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -717,7 +717,7 @@ static inline bool kexec_free_initrd(void)
 {
 	return false;
 }
-#endif /* CONFIG_KEXEC_CORE */
+#endif /* CONFIG_CRASH_RESERVE */
 
 static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 {
-- 
2.47.2


