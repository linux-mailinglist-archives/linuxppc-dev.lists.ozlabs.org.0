Return-Path: <linuxppc-dev+bounces-12102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9253CB55DEF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:13:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxG23s0Gz305n;
	Sat, 13 Sep 2025 13:13:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757726309;
	cv=none; b=D4yG5MLpiTeD0pkTZ2n4kPqt4IYOnxz6kYgNvmncCjPrhPZdjzAHsgU6nz8ikUQX0wosTYDfZrpZivVH89mVJCCBVMC/u6qckNzhpNLdfl4EdPa9zazUZ4mO+m8d4WMnLLjPgsNQAoGiHxdXvFmVlvWWMtNDRGL4YHfVtIIOpk0AkqzFtvbLrKsWDQmevuNHE0FsLrIxqiBXjFBhnxk925bdv+ePaOKdjQV4WDqbyifbk4VJgAVzXwpBu4uoMpXXWt4CYB8HTPMFz7ThEHh0EsFAYFqdm+d1Hc/UuLEeeJIEPAQb0aH8nlnFxQU+yw899mY5eEPcqZPrBeO6EZqxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757726309; c=relaxed/relaxed;
	bh=azZv/jvf6IRhG0wveCq5ECQcNHAHnPNLNif/IfsLlkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkgUqUiU49j460civNV4HWa1UiSyPsai9geOKwUygn2udkIyqrQTP2pEI3DX43fLJggp1nt9CljRteuarNoj6L2ot5FDzEVaxnYV9+hMy+9o5H7R6epHghymxueU/OFXUcK9U6xymwCWhRBu8v2BeeTc+KRhCwviyWssApSn2PozEdQY3d1iI7o1WU2yw8NnegDvc+XXWpKN8NeKAfcu5OCSFxdImLVUpOGmYHkevJ+yZJuqWY0GzNd/vjTGqzJe5nKA1D6esdHy+lOelviCeuhrK48MU8zarUC4A7QySYqzEkqsbt9vgVuIVUs6aXfrj1Vmi42CDD/iYSGaCfNzOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WDaKuJZZ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WDaKuJZZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtj0237Fz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:18:27 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-625e1ef08eeso4245064a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726305; x=1758331105; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azZv/jvf6IRhG0wveCq5ECQcNHAHnPNLNif/IfsLlkA=;
        b=WDaKuJZZuPUt879aAgFRg9vsTzXb7/C31dSWoIqNKtn9PS0H45arWN2923Qc5Asngv
         tr7xA/nt7Nh9qviiHvFF/PxEMAx4tjxzezyhZQeU6phhCiKJmEVPgiDV1RhEvaXbSqEP
         +n6hKG0UmfUVo49fR2bnALnoqDKy0m6dWAmpmC8DnWAePyyiefVHw2RA2UdFHprqRL2o
         v/urrSann+Lpr57eS5XYSe02pyhHMwyjL07PoQIeOvOfUjM9HxtAzPniLQy7VX2ttIy+
         WSiTguly+qcsthP6J6jJ+A41tUFG6v4S5jMnRrq1pYK77+iY8dPsnx7ivQFHv60Lr6Nn
         faqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726305; x=1758331105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azZv/jvf6IRhG0wveCq5ECQcNHAHnPNLNif/IfsLlkA=;
        b=EHzOyNxdFYOB0kPajkCp0rPZSUzgutwhabYmlSnERtOk/CZyW58fMXIyT6VPURWHeq
         1reKA3CHoub08S8MAJQ/gKsKDhmGCzJ/eS+8xlI6tLi3IGXYv2zm17WctxwFrGB1tQjS
         A1/tFAyK4AE3wi2WkOZ8Kb8auAfpELx0dCNop/BrpJRoJZVK1pcVzHx7OZ/O43aQGzYQ
         3N5zGhnHcT6KOihMTtb5vf1G92sPA6THi0uAjm6YFz5CjF3Il/riYELDwpNuHXTExM9g
         6f05xzODRxUd4KcrCalF2mkeiaUwkPuisk5eZeKqm8YPyxse/5gHU/8mAnkoChgAY+Ye
         ePDg==
X-Forwarded-Encrypted: i=1; AJvYcCVo3B9gD5/f82KDb7+pzbGWBf5RVjZr8QBtFxOKIkkHsGDjqru2TnmqpXHC5q0XR6fdKvGoD2HeH4bBcsY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxs7jvd7m8bR+qKufiotebP5HcCB3+5DiPbIk4SAVPseqisDYlE
	nD47MtMDSlMIMafgk001tiO8AjBk44E8vNTnf/qFAGhHkZCS61sbOcj4
X-Gm-Gg: ASbGncsfN3Y27ULrGEyJItsbRhVSLbzEPHxb4l5VgFRe8+KNsUaWNNPzAmf5zsnrNO/
	ULH+Wz6tlLPXjQVlycoES5EAnroaE/OeLtyIHOOP+0DM2GIEf5kOxWK0WqUGerVx43zmrQIxlo6
	AH2kQwSi0SLyGOfzxMgTZdvqWPK+CPk91NuKK0fnZmoWGWUSFrOVsN3QpBukNWGo+kEYFVE0rc9
	A7iY5C7k6HXW6LtQcjX9weBC9SYuvQWSuHp1WASwmvscxe9sRaxcCi+uh6kuH+Nvm80OkWfxb2F
	CTiEXtW19ZYdytCJyWZWIAxG0WKFRM8VR64iFV/QJA9Xb3vol0t7yuYpevH8eaStUG1wmGH8fNf
	ZTn0Ugk7QVK2iEKivIi4=
X-Google-Smtp-Source: AGHT+IExQyu+Z7m4GD3MP2gVTN78xlktku98kUsQddou1aWuxY/hOtzAat6yYKAto7vnFggGkvcCIA==
X-Received: by 2002:a17:907:3f18:b0:b04:45e1:5929 with SMTP id a640c23a62f3a-b07c35cd746mr507554266b.28.1757726304508;
        Fri, 12 Sep 2025 18:18:24 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd309sm475244766b.53.2025.09.12.18.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:18:24 -0700 (PDT)
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
Subject: [PATCH RESEND 35/62] init: make mount_root_generic static
Date: Sat, 13 Sep 2025 00:38:14 +0000
Message-ID: <20250913003842.41944-36-safinaskar@gmail.com>
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
 init/do_mounts.c | 2 +-
 init/do_mounts.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 60ba8a633d32..c722351c991f 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -174,7 +174,7 @@ static int __init do_mount_root(const char *name, const char *fs,
 	return ret;
 }
 
-void __init mount_root_generic(char *name, char *pretty_name, int flags)
+static void __init mount_root_generic(char *name, char *pretty_name, int flags)
 {
 	struct page *page = alloc_page(GFP_KERNEL);
 	char *fs_names = page_address(page);
diff --git a/init/do_mounts.h b/init/do_mounts.h
index f3df9d697304..f291c30f7407 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -12,7 +12,6 @@
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-void  mount_root_generic(char *name, char *pretty_name, int flags);
 void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
-- 
2.47.2


