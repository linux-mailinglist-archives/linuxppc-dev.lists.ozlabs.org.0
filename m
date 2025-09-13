Return-Path: <linuxppc-dev+bounces-12101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B441B55DEE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:13:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxFZ0wcCz303X;
	Sat, 13 Sep 2025 13:13:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757726373;
	cv=none; b=hrrxM0cq91RZP+mJ02pjJnec3ZwYX+lI1KtVicaPwwaVWoohqbs7CJLd1311gh6eMZ+fr0bcqtoUcPzABBjE5rMu5qVZbhAGI5YS5B8DkIz6zbW6I9crHK8bhmluNKhRyLn98vUP3FBZpLfYMXhfw6bjLTZpI9UXKbpMMaQhTS+cODjpWPXnjiJxz/U7DpknrTFyIVMbfjWfSAcq/eqT50+l0RGlrBFFR1LpZeEBWnHoYbrXeoMjAI2Ju4Zb7Ng+p4pfm5lglms7PsMSGn5b4IzEzKPddy0GPiEMn95bhhA6O2brFwKKNXtLbbskfy6h0UFGvgkH9o7BhtlSnIkcxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757726373; c=relaxed/relaxed;
	bh=01GQX+A5wcxVOfa45EtHUSgPI4YB4B2sFvA+zw7J76I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gaHoQE3RyLgHqMTqqiDy0v/I1d4jrJG+IhuiVSmlkW8lOeKoXFqDzCdpghlsWCYbI7CvwWibkO5j2M/wZGZkEREJu+PHCkrmGypwYuffQ1c3PG+nxxVxiXc9PWAyEb/9LTGxry837BDUhVGuF44HmyqeinY6NYnSdZ4m8q8ipZbIX9pS5Y0v43joc/of0JZF6X9Kcse9IUrAuxRrW9ljBIyQnGvYDApZji7dsjfMgkg+Q6jBup0QLFObwqNAJthWMg88ffktRyIxnz/SmfcAspsgcX410egoXko3ZOK9KFfiF/NL0V8k1FJobknVF/NA55JDr/FEFAVMXXWVDtEK5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LrCJn0Nz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LrCJn0Nz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtkD6Lwgz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:19:32 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso4287501a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757726370; x=1758331170; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01GQX+A5wcxVOfa45EtHUSgPI4YB4B2sFvA+zw7J76I=;
        b=LrCJn0Nz/C+IS5V5PmHN7/6aCv/0n5iDyMTad7piwOxykP/FfjdJEQDQCqxnlMAS3d
         tcmLWlwx4k5dQTLbp5/lE9c2XVb/blODVzMMpump+KmTa/mq+u4k2P747YxqwpEP9o2O
         ShmjnNS3hCnz60viLvgtl5QOCfT1FK136O7cyL3P4DFZCHnqPKRwrBifgvSAzJEgTj+V
         t6a5e5y1UowBC3yKIRjhl1pcUCuFhNg7dl+6jkXVMRMIMHnS4OuYoqtbYGTv3bl+lvPH
         hZFLjydRkNwc3Jp6rXFIDZc2PDr8gPxQnGwopTTY5x/4OmBNcqRWHlpsvPHgBRwBh87r
         2AYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757726370; x=1758331170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01GQX+A5wcxVOfa45EtHUSgPI4YB4B2sFvA+zw7J76I=;
        b=CpVqnFoKPx7PojBh992ysF8wRp57+1gPAakduQKN+jYzMBN/W0BO6Y+BRtT+WivZBI
         9Qq9C0NmEeZIy94EuZxpNMeFANIpdXrGKfriwXQ/LZc7k8x1OF+o/P73yDS/+jZL7AS1
         +OSa5sBouGRt/0T75rAmJCGhO5ho/lhXDaaNe7y7hJqvv/ZZUpLjU7hOjjLAaS+85WTD
         u4/1bls1rq9Zd8L0B5ZHC2L6VAC3imBeIuwY/Gnkhco2s+kzC8e/lkMzfOIpIpXxtxCY
         DFFdbbVOaff9/DCwpWas1N1tlZ54rmekX/tX9p4ktD8iFngMFwSMOCihdCw8A95Ba1Gw
         jv2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbFklTAqosI+5PnQeXIdY0qsJ7jqkdwg7xIHzRuuntpKNfTyxFcklwR2drMIsaPp/AlnxGDJu3QR5E84M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwrkzPYVXWnAve8g8dThG5AhMdJLTZQmrvRVTNl0nILwaKcIKes
	ilh1cXtHFcI5RoHlhlTrfViQ1tEVJ4GfAV1DsY9+BPNS/ZkHylUMc7rl
X-Gm-Gg: ASbGncu9Oc29IQu4FXSgFGqVXai6F5ybfFaf3JRDEUbGX9Wq/T3NZveNZbzLAVwbFvo
	hmvuEN+552njO4UPOf/WlsWo6s1gEfYytjd8Rol5qPS0ktcVX4zkXpwD9xPcT7sfFjsACrt6UvS
	iqTA1ygj2KgvIebarPWMjCe4SgfFHHvuli4gWrRcoO39bCi3nz2goNyGruOZFH64n+627ETM+tW
	haeNY7+SoO0kVaGWTTSvaXrQt+whVM4knmTslK1td1fhzSNBYOncJQcmUec+rK5F6Qasg9VrlXW
	qglxXLorOF8U4AkS5hUA9Nm/dZuGAFMirJon0NHbUeY6YbTAIUtT5Gpg881DzVlMaph8L1D0dYm
	T3GmGFtWSLy4mAhYeGu9QUin7q3tK5g==
X-Google-Smtp-Source: AGHT+IEzeVwYKpSq5hVwsza+AqQmwMGGceGxnApLyMFPwDCsoulMW4PoMJQ37ACnH/5BZ1euJLookQ==
X-Received: by 2002:a17:906:2493:b0:b04:9822:1ab4 with SMTP id a640c23a62f3a-b07c35fb2e4mr458597866b.27.1757726369974;
        Fri, 12 Sep 2025 18:19:29 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd5bfsm465661666b.63.2025.09.12.18.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:19:29 -0700 (PDT)
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
Subject: [PATCH RESEND 36/62] init: make mount_root static
Date: Sat, 13 Sep 2025 00:38:15 +0000
Message-ID: <20250913003842.41944-37-safinaskar@gmail.com>
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
index c722351c991f..7ec5ee5a5c19 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -381,7 +381,7 @@ static inline void mount_block_root(char *root_device_name)
 }
 #endif /* CONFIG_BLOCK */
 
-void __init mount_root(char *root_device_name)
+static void __init mount_root(char *root_device_name)
 {
 	switch (ROOT_DEV) {
 	case Root_NFS:
diff --git a/init/do_mounts.h b/init/do_mounts.h
index f291c30f7407..90422fb07c02 100644
--- a/init/do_mounts.h
+++ b/init/do_mounts.h
@@ -12,7 +12,6 @@
 #include <linux/task_work.h>
 #include <linux/file.h>
 
-void  mount_root(char *root_device_name);
 extern int root_mountflags;
 
 /* Ensure that async file closing finished to prevent spurious errors. */
-- 
2.47.2


