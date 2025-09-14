Return-Path: <linuxppc-dev+bounces-12168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35629B566F4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 07:30:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPcFG6TpJz3cbF;
	Sun, 14 Sep 2025 15:30:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757821429;
	cv=none; b=duPK6cYxaYhgL8jgZOy/UrziykSh3X3pr+6KR+ytFe0waLzX0+Vm3tLeFlC7A5bGqX08lzdovoG9vdyb786tMpqtyu0VfgLx029KNd4rQWacjZbBKOpXeLjY7kLxiZsDFAgqaTJl53QOqpxGG9mdVpTUYj0Der+tMoNkrBjidFxmx2Up/xfnBEqherEwKyzopek+44etDTdfrKX21K5xR/Ii2ByLZ8w8GS3ZTQtPGr+1RaMpjlduk2WiWwgtXQgOTpFSVftqWvmwX+/nzxx05nC1FxEejgqApZoLU1CqpFxNtYBpq7PUbV+tNsU0D10Yvnijc05IymzmSGyNOkYI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757821429; c=relaxed/relaxed;
	bh=Edp+OfqM1e00xcpSWGvAGWC/LGQGu+BMiq7TC0KqX/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bYuV20XdVtSrpueyA+KKXTmoPY7+4OVIwUz5asHZGxepDiIWGXuBHF9nA5QIK9C8cK9fFHa8n+o/EdnHpFVKsrW+la1HChoQrV38A0otAoD8jHW8ZgWGNW39Vof968XupdDRVOAUDFdO/HeXKV2UKTFVnqtO8i1g5aUHv50vhVonwlj7Y9liF4GF6fY2L2I2Mjwl0I2WsKtdEt7hc7ZoM4aL2U4SjCvKXlRVZMisAf38e1jwfQHNfrFytohFu4JCrQOTlKuRDO0qVkxFMADux7R5CiW0CC2YMQoW3/9lBzkQaszOEJu9DgVvjTDeltVu/2CCn1UBt5z/zYxTiE2g/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BY7h6R8P; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BY7h6R8P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPYtC498Zz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:43:46 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-62f1987d49fso1099419a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757821422; x=1758426222; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Edp+OfqM1e00xcpSWGvAGWC/LGQGu+BMiq7TC0KqX/w=;
        b=BY7h6R8PH6z95pbD7bxEVV51Pn8Q+Uum4HfG5hmLNLp3xTQii6X17bUla7vUrMaQoq
         WsdE/oHIyQ3mY3vR/Db46TKySssv8xSblBgzZ2EXuAmQ1HWVLrqeTe3UXoTb2QOcT8VW
         Zn2UU40JuVwmYK0BSzRWuO3g1L+bwmYMb+KQPRYNuvdyU5hicF1yMUc+75qSz7gsMjzd
         GYGABy0/SXz46HxnNFvMO0CESutrY0F18a3PeHEZCyAvA8p0SWTfLf6ntnpOJJPQcwLR
         r5183rksk9te0N9obSx7npuH+ffIFXKv8ZtXQXEdVg9PxuuxZLz0GpBufTUcYqQW6cy2
         f3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757821422; x=1758426222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Edp+OfqM1e00xcpSWGvAGWC/LGQGu+BMiq7TC0KqX/w=;
        b=IS/uJnN1XFj1L9Gh/S6udouy8GOL1HILHADmrxCBlVqGjEB9PxzW9Ta/vzSrA01E2b
         yQnh8+mFN4HH6M1R2Osfcyy5h4JdzjWIXmf+NZorx2O4STcbU6b3hxORomkZPRff+iTe
         Iyti3bpU7PaKayyk47FQtdsDJamZ6dUhN5uG4oaLS/7jZfyS/idD33skdDltvb5zk/QA
         9izZoRZGOJAArun8id1ORZjoINSQ2kGTbZIZNXoAymno5tFRwhLn7WdNynoogQg7y62Y
         pEpwEmcdLSq9fxQSJ2c/3XXCpXhV6bXwp/ZTnRD7QvjEaqQq0ZhEMd2zVVcfR4GjUtVp
         y4iA==
X-Forwarded-Encrypted: i=1; AJvYcCW1Ovwoeg0WHbVlPeP59hBhL8wD1MAQOA9bQkLBmhhb2XNifLikG0C8kRJLJ4pNZSSWmvt2OPKpkn45hkY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwsVRj774l3SiXTJx4FLdmO7+PmAw0zT9zk+B4MejzZ9fZ+q7lB
	kVk0Ke8qb/tVqj19ymPt9Z+pk9ay0XKDDPpJGo12WqDC8ZERqBojEegQ
X-Gm-Gg: ASbGncs6vrcua9y5v5BhrISehrM62khyGiSLRv4bbsp+YeMoKzcj4igpG8CSlAZn+TP
	wrXYDLfq+nZreopAareBtsoVPEimqaysp8KzoKpaQMxnzRz32e3Lz7VrVZBxFaj9D/Do2Q8IYoW
	2bsWlbl+ARiWVAmUQDSRUe9OVgM19E4U3kFdpfKq9SE/zyFVoQjj9PmJiPd12wtOzf45ocAks0e
	N/DB/qOrsHrdzTj+ufcv0YVVHQ88Gd8cdBTljndmbnswUhqlUVXla0VU3zmsatfpaRtQlOd4Vfq
	v7n2XorZ5IQR393pXhk1n3i4IDmx/h9+9GQvCQL3HAzNZB/2NhO1Pt5FG0B6MacA+HRNZlKE8K8
	TW5emH2nqh8kNMqs4UPo=
X-Google-Smtp-Source: AGHT+IET6lw3qY9XyvNvb3pybcnRN4nnQ2bci5TeiF0EBvfDGIL/USbY9x3ZkIUotRlW6z+hFZZ7Dw==
X-Received: by 2002:a17:907:72c9:b0:af9:6bfb:58b7 with SMTP id a640c23a62f3a-b07c354e9b4mr721980466b.5.1757821422077;
        Sat, 13 Sep 2025 20:43:42 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07d2870da1sm345137366b.13.2025.09.13.20.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:43:40 -0700 (PDT)
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
Subject: [PATCH RESEND 37/62] init: remove root_mountflags from init/do_mounts.h
Date: Sun, 14 Sep 2025 06:43:35 +0300
Message-ID: <20250914034335.3506706-1-safinaskar@gmail.com>
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

It is already declared in include/linux/kernel.h

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/init/do_mounts.h b/init/do_mounts.h
index 90422fb07c02..e225d594dd06 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -12,8 +12,6 @@
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-extern int root_mountflags;
-
 /* Ensure that async file closing finished to prevent spurious errors. */
 static inline void init_flush_fput(void)
 {
-- 
2.47.2


