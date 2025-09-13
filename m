Return-Path: <linuxppc-dev+bounces-12128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F8AB55E0A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:18:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxLy4JrJz3chb;
	Sat, 13 Sep 2025 13:18:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757724595;
	cv=none; b=SS1WoETRaR+3x+Yc2POY4BeXX7NuXwbh9Re4XC6B9Uzmx0NQxkzgMMXyEqvS+fH/+jM6aECspVj0dCvvH2IS0nfv3sJhP46STUApgwC+vlZXV0vw6Rhgwz/F8B/xQ+dNoO7Gq2TmRsebcrTk1dMpkX66n+sS2Y62mDSSfflQZgl8lt8DS7EaQ+xTsf7YUzj1JFLG1v4g97xOcTMAjbXMTmvsFFeGQn9l6YN2e1O2pfHgugLzugSHFyIU6oHlfUv7tqI9OdejSYblM9TzFjxx1j5bO2etE3SgyQnl1lavbtriMALMYnvTvAUPyn729FNWvCf3eWhctkDWFtAzwREDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757724595; c=relaxed/relaxed;
	bh=k6cH8q1TrVQNxjzjuQXybOp7uw+/s7mQTk4MQOvceKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MeqRthLsrMUYXec6QbWSB0ojaskEvEpWA/EZx3sufInKupCYMCIg5YkpSD8jCiiQfz0FcPZ2deMEIxENA+/K0hY5BHTfRoYxGIntUDXYB+A94JN9x6jTE4r32kEK0J7KhU4hcUJFDh9o8jO9WjywxGVUpe8G4yqRRO2C3+d5LJtd/xSCtiXzsKjXwgxs/lnKIYCzGxeZjOdyCWduPEyb8PKE2azuL1YBnoJaMs1ZP6VbAyW2R0se1Vg+JBaNwgfsw28ZNls9UUOPGDenwWwpqI1ckR2yaqShAYJkcImNF8ShmCyaj+7i66nXMdp9EyOed07PZDs3gEheDy0zOqi5vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MRqzJB1t; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MRqzJB1t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNt424xN9z2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:49:54 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-62f0411577aso364995a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724592; x=1758329392; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6cH8q1TrVQNxjzjuQXybOp7uw+/s7mQTk4MQOvceKM=;
        b=MRqzJB1tUF/YG22j3/Pr6MNWEgC3mOgndzIJOeeUY3E0BIasNAZu41MBV8Lme7KBZL
         HbyAgAwDhRFBg5GUPF675S+lbDnRSJdPXEsZ/eOj8mYNR8P8XzELOs176FpO0SPUM5T4
         NP8U3G9hdOKhJcvKsiV3+GRn75JThOV3Hxlt6xzSC4Jlol/RocW98x6Gmz3GM2GwoEYQ
         88psmHCojGkau+m2xdM5pHurbdHaKzO5XO618gJAqyG2oBnHLyrHFpQe9aGIi4OoopIf
         tT0eYznXu2yx9TP5UcTa4jpK4Bj3jhHlQOovWVL+LM//LanmoNrDnWuEzO5qCC01vMKb
         dIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724592; x=1758329392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6cH8q1TrVQNxjzjuQXybOp7uw+/s7mQTk4MQOvceKM=;
        b=IvQRCq5tHtHxYVzNe1UfhIUtbaK25nMJvxkfz7afIrdM6gEB4xwnccGOarxe2eO55o
         Q4DSm3cImLa60fu4SUpZv7dbyzVSFBacrKAti007G5mob5PQSUixPqVAPuieykpmw93a
         RSfJLOQopbaMSqHpuJyd3uDTq7qjifmgbbayKV49DEcP/WLU95doFO39S1+xC0EMRU8a
         G4XwT5RCOsDHWcJlAoQ+/Aq/s+jcAceGpYW9DHW4ifVANqB1oIY5NBvfnUulFZWG3wl5
         6U1IZfgoE9M3hBU1arni+GQ1mOpcamENvAi7V9D0i84NBuWa0zrE1xshhMpRfjGMgy0A
         1IYA==
X-Forwarded-Encrypted: i=1; AJvYcCUL8KCFVcktZB4eizvwReScWitzcyzuripHvup991EzqysVNrH+tXf34CWtZ2ZkekDCBCQzjurwCJ5PvT8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxCHjWpqYZsxi/NEbZr+5ZK9zI/bPeBidOmgsRXQjX6ayqKAHA5
	Vi/2sfAbYXNQ8A2EJ1Uuxw8hqHNZYGHcBqSesR5IR6rz3l0qhdyKgM9u
X-Gm-Gg: ASbGnculT0T54Qab5/G6rpFXicvAT0gTPbRJtviIF1ML5YiEFT1sYiChcBmbzJWll7E
	8vgr+4G50/FJz7yBpbfKCe3hNunGRt9VIX/Ojd7gZA9KZpkGlFLUiL7Cz+7b0AeIH0WOVRFB2oh
	TYe03/jd+U47SJJj5JNq51EfUkfXZzWPv53z3kUgTK8Z/n6W5OPaQqHsj3plTFaWN75LclWU3Qr
	LvD2PYMVlsJpyw1LozFIcSbLt3DQW8Gpkdn8kHuUrQD4a5/wXM9ZKb/4XfTQEwWpcRwoRJkC2Se
	TGq7sRBhFLQvAJtmGHJf3vOIvkz/J7y8Em+n660qchcUkHcFNcdMEXk35fhoyuW2NJHvpjAx/Xd
	fFdxo3k4BsvGqLMlvUl4fKkxsHgKYPg==
X-Google-Smtp-Source: AGHT+IFuaD6uE53o0kMUFqkBYFUIpIv4YZNYfnndGaXs7B0K4+B96SRU2dTVgEWhisS3xuLKgCtRtQ==
X-Received: by 2002:a05:6402:4316:b0:62e:df3b:79a6 with SMTP id 4fb4d7f45d1cf-62edf3b81cemr3814693a12.1.1757724591635;
        Fri, 12 Sep 2025 17:49:51 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f3b6csm4149162a12.32.2025.09.12.17.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:49:51 -0700 (PDT)
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
Subject: [PATCH RESEND 09/62] arm: init: document rd_start (in param_struct) as obsolete
Date: Sat, 13 Sep 2025 00:37:48 +0000
Message-ID: <20250913003842.41944-10-safinaskar@gmail.com>
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

It is unused now

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/arch/arm/setup.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/setup.rst b/Documentation/arch/arm/setup.rst
index be77d4b2aac1..01257f30d489 100644
--- a/Documentation/arch/arm/setup.rst
+++ b/Documentation/arch/arm/setup.rst
@@ -86,7 +86,7 @@ below:
    initial ramdisk.
 
  rd_start
-   Start address in sectors of the ramdisk image on a floppy disk.
+   This is now obsolete, and should not be used.
 
  system_rev
    system revision number.
-- 
2.47.2


