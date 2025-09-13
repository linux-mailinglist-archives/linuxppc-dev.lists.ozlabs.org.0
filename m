Return-Path: <linuxppc-dev+bounces-12107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E16EB55DF4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:15:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxHV11zHz3ccw;
	Sat, 13 Sep 2025 13:15:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757725974;
	cv=none; b=dCSkieo/xZkAFTeH2wZCML2xcRinnT+v1qgjwIn0wtQwiyPxuO9NK1mt3WREFIt25XUYwYMiMH0JirxvJ1RiqJaZp/IhxmN8s4M3eNWFo7bC02ZwyONxoVvlP+sAutlfVG/RIqi7tLXGwK6p9LcB85StMZic1KA6QgRvZF0wsuUyqdBVVC8KqtVttHPSUZKiHk+Kr4nHcKJ0lUbaYW3oRQAwFeeZaDakHTp8mGe8XRRJ+P8GBOEFyqreU1EoOdLPwOX2WxKYLeYN8Dto7Q/KbtkePg5syOHtAdDYAaNzOFLzx7FvQz/YUg0BVgUUuDgtpBx196EyFHo6ua6AFd7d8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757725974; c=relaxed/relaxed;
	bh=CPS175BLdkdbkMvPyh09bMwfY79gXnuJYPms+9/x8xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzaRsNKehiAmPDSYUhPZUf5HG6RGQoMhaRCJEEx9278TZhLHuq94gyWLMlE+6ghBUrupyQy0v/jsaRwlslTW3QEixPugwe6YZ60ocRI/c+CTMJRvSHd4W5SfT517XyGrM1vCn5fjZmap9EvgDMlL0X1xUA0tbBMq/mHEracMVun7QXNM/T/YpmRN3Cy3FkZHrsouQCLKRHPTY/r4KGcPp6e5IchQgOwB/JCkNSCSXwehjDNxrW/fdOiUa3fuFBBdULuIW525RSa94KRbDgBPepqHMwmDaG8gUOwrrR0TF8RY6c7Fr0OGBhvQIxg+XbEAOa6ekQBIs9nJvVttYeeUNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vyrp69Sv; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vyrp69Sv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtZY64PRz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:12:52 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b07d01fd4fbso150673666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725970; x=1758330770; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPS175BLdkdbkMvPyh09bMwfY79gXnuJYPms+9/x8xc=;
        b=Vyrp69SvLu9/7Xd99NEIquKta/7wse+TYJU0qY7MW2QE6ll5+n71Cp1QuHHf/yXT8L
         3rWlaExLkc2IW1BFSDZuwmnj2SM4/fHK42r8YE7s+Xk5gjZZhhspeCTy4dwFbv5HYiz1
         WiLySd2Ion0uyt6dhvvYYQonTEVR0vufgI2HY2EmPlFyak0lDTHwszxS7I+uNxf/J4kW
         8AEWcV3YZ+PCNYqSm6McX0ETvnrE2vm2fanl4xNFGsXBO2mzc8rdZKt9Glgp0yM7Rtt3
         6MpCj9zxODi0d/XoErFS9ktfyLD9ZyBKnd2dcLPilTSvxM7C4iqlzV+0ZzpxsRsVY/TV
         T+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725970; x=1758330770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPS175BLdkdbkMvPyh09bMwfY79gXnuJYPms+9/x8xc=;
        b=rqLlrx41eKiWPsNU8l9b3IXuPb+JUuhKUm49MFLeUZ3LffXJt51N0gKWMbYGeDUK7e
         /Vqv2rkG0/i4m3BledH2x4PX/SPhqvLhDX9xoOaSwkwfyPW/I07akJ5PoJOhx2J58lL5
         XNJ36otTYyPAJCllvJhm80mF1IGIue5wT/sQB3KqcvrTdBKJAKUu8Tp7Xp05lLRNdu6c
         w4UVZjHMP+HUfFpNbr6aUzYuXQ+fvD0Mbwp3E68aoRlTY4rH4vOioc+SueSaccKSC3CH
         Zh07OVdMQl8qoNjoXGyvxpaM3WAeOrkOHlgrAdUbukssuKIFOlCQZ8CF6R9kxqnsz+QW
         spfA==
X-Forwarded-Encrypted: i=1; AJvYcCUKvz/YwsUbTTb/8Q0m8RfojNq/fLeMvaPnIYBAziWt/gJuZCLYTg/2izFEWKwu2e7xR5W2I4bNOQX8XCc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxiw9DLjVa2j5wtQUYkOirBWfJo0OjkD2Cy3fmI3SkG2ZNNnXFR
	FT3ML4eZjpTBUPMnV80Vp/W5qhCT0YIHh9HIOabu5rJRSus/uBqhccqb
X-Gm-Gg: ASbGnctnQkan6eTvfMJeXii5t6BLRbG0VmR/NwKRenLPArStdZlqKslfL907ZXd95Rq
	0sOALGLrSPRQzsVwFnKrxRYsi6UG+sOc4NG6xLeCkovoyaW+EhamEbjG3KpB0rwoDq4o+oc4lyQ
	o9gWycATm9zSaUbcUiyQ6lcEk65P+9TzFN/57iVXdJ5Acynti4NHKFDyQswL0T5Mq0B3StYbUfG
	Ry69uB+kHLfAxfDqJSGVL446glXjvSD2xWn8uRWeIDl5nf44LBN3sukG1r9QKitiGhWSazzzK8+
	jcAM14BMH+ehZcLGhoouMRkPnmA+11ahv+jIhBdbRW93kPqzdgZzuKx1USVUXyuwqsFtEtnE2vd
	9rBbhxzFwQz4/iALWzXUQAg3H8hg10YeFDVtJIGJJ
X-Google-Smtp-Source: AGHT+IExCbHobezsJZBylPatDCb3rXiTmvHjuHynF55nxxCc14bpP2oPLB71sx+Li40Hkl4GjqRelQ==
X-Received: by 2002:a17:907:97d2:b0:b04:31c6:a434 with SMTP id a640c23a62f3a-b07c324cf12mr467235966b.0.1757725969783;
        Fri, 12 Sep 2025 18:12:49 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b30da327sm479612566b.11.2025.09.12.18.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:12:49 -0700 (PDT)
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
Subject: [PATCH RESEND 30/62] doc: remove documentation for block device 4 0
Date: Sat, 13 Sep 2025 00:38:09 +0000
Message-ID: <20250913003842.41944-31-safinaskar@gmail.com>
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

It doesn't work. I tested this both in system booted
using initramfs and in system booted from real root
device directly

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/devices.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index 27835389ca49..6ce0940233a8 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -138,12 +138,6 @@
 		number for BSD PTY devices.  As of Linux 2.1.115, this
 		is no longer supported.	 Use major numbers 2 and 3.
 
-   4 block	Aliases for dynamically allocated major devices to be used
-		when its not possible to create the real device nodes
-		because the root filesystem is mounted read-only.
-
-		   0 = /dev/root
-
    5 char	Alternate TTY devices
 		  0 = /dev/tty		Current TTY device
 		  1 = /dev/console	System console
-- 
2.47.2


