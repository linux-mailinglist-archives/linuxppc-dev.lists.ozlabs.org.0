Return-Path: <linuxppc-dev+bounces-12164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D3B566D8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 06:40:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPb7b6rPnz3d9H;
	Sun, 14 Sep 2025 14:40:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822232;
	cv=none; b=Ts7eyKaHkkHHrDepxtO7HQTqCXX4RV83RVpBGs5N8qKG2PmkqiM1QSHn1o74hxeGBU6AaVkgw60VChHZDFGIU+XmjkhpfyeYjWwM/ugKgP2gVVBEv4zMAxIaXv/yViO++fCDg2IL2TTEk3YlTZsQK9XnK/SVv2mqGoM4+DEDWIrBNvmXzMKQ0/reFA8ipOsdb5B2/9oMTZYr8K90CFdnV0HylpdXgIRMjhX/2xlzjIFZXaU85fjCL6a/ND6OYAQM4a7Y6ZAOsfl6z9+5Kocigs4Z3F3HAG7qe22rJOQAUSe9/xnWQC4ObJzrINwBbEDg53ATv95cPWDDD7zoAFsq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822232; c=relaxed/relaxed;
	bh=Y7psSH4JIkuISYR7xy9RNjBVG2GzEUFc3+zgpdmbt9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiuTtCFX88cEAqQ4xzKILLd7WVoPCCBT/EMOBPGCVoBRDYkGomYB0guDtNrcBNTt8pCGjCbKXDkGGvvdo3u4VULCjMyCzESgYpxidnRs2V+NBLlZx0rMgwHBXCJ4xjyNjL1/bytTflTCFrEqRHxPRGD7tqzsOCC/BCtUgvAEYuCOsbepi69HLM193U4Cdf/M20uKRTYVqj/eFMO/A1vWWekV/bKGAk3lYFYFYkksQzmRjZlSM14MuCIjQ+K4buPTryiN0nSr7YTKGVkx8+s87R12MwlgZNIEACpdtc9LF+wuOzCU5pLsz/GD+Ohj0TyHpAAj/lZHPz5SKaXaQgxGkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dZ+lYjR3; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dZ+lYjR3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZ9g1svCz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:57:11 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb7ae31caso554620666b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822228; x=1758427028; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7psSH4JIkuISYR7xy9RNjBVG2GzEUFc3+zgpdmbt9Y=;
        b=dZ+lYjR38SGM3yY3lJIbBGaEm4Xf/vLsqiR+13NaqNkqUjaqIKlj7WcppNRxkPch1Y
         O5n1edzKd89Rxdv0mBoJINP7nfsFnSnUG1UgQ6kOvPB7+ihQv+kNuvvPSOoBIBZocVsq
         6WT2OB5/Yc3a+FrnkGEtG6yikT8tNyX+rKLNxLmBUMT5HmEm5gK/klpzGk3PFeYF0RhC
         j7OqlJ6Lv7b0va/1vhdSK6kXsXIQyWNKLko4x4olntLKgdPXdK/EqafAzCN42o7TqfYc
         c14PphgtARkSaVEHQU0N3OErHjwYWNPJ7Rm2pfJqlnFQAlkU7P62Adqqhdqg3f8zCoJE
         CpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822228; x=1758427028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7psSH4JIkuISYR7xy9RNjBVG2GzEUFc3+zgpdmbt9Y=;
        b=J4dzGXJJbdGDS+JOVLr9Wh9vro1z2mkUGDLRpPGoGpWApuDrrA+/FnXwGC5pDBYV6G
         0BsPSbDW9dUUg23fO08XSBW1z6wVve/c92I07HlMAWIXONL2OpRr/K9Rmv+9yjF6jlYN
         CafCMjmMzGbiJwZjVwfD0W18KT6Dfj3YhMDJfZhl9mDLNmDrOFT6n/PM1sspQ6TtU6uN
         F6qjsMrbnBsuHgYxrOC2zjbvDdsOgiO2gUI2bCFQEHA4zwHw4DX7++efg3+o+CnsEeQp
         a9TA+hKgJAND2WOEi97ZLafwLqLGh6sNxw0S0J9bQNNiyMuHoSIgevCEx/2ODgKCA2by
         NPsA==
X-Forwarded-Encrypted: i=1; AJvYcCVDpTzEloT3x+0SWmum7jnKRBumJuqynt4TkAcldivTyZAFWQ/lRR3ZgDyu1VjxKFLwoqJee6EY+s6+rew=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxzd9ftRuqJc92HXTNzHZrU3jofU8OWcb93p3sU4Twajnj6FCsj
	7KajRuF9GevQw9gjczbYGChWEGEf9MF31dZHaDsvRbGELn4u5uFKzlMX
X-Gm-Gg: ASbGncuC3MfZtH0irZAMppbIdz6V4M1kzUPXGyTs2n1813sI2OVrQdKEg4upBTRWZgx
	BljOWu2eyYhfAyArNHP0iWFkwRC3EFsoqFHojwkfDByJZZBIOs4FjQiiou7U+E18qPEujhRZRWv
	qxIF+shW3L+52nXsGlB0VflNDZhDtfZKZk7gbHBisfemxNRCGcD7+oZ0LtKvOqSsfiAzL9gJbMY
	ycNchzb13pu5sXX/gCqMwmOVFhzMIJMTM72/OTykxwZVUlUuJ1s8EiUj9Kc+tm7fm18rwNGOj7I
	UD/6/Db//ocxlNqM4a0Y6UWxNsXlyTaf+0gZWJBJC9w1BXKnAWWeCzUmTsLnLgV+DgFfI8C/4WM
	8HWC5UFutoLG3LOD/2x+g/LWYCshjyw==
X-Google-Smtp-Source: AGHT+IHHnPU+sOVT053l7deT3P8z3LJVFAOiksWjmZKd0Ub2gBIDgZK1/4gCPHfUrNaBqPQVOEAIKA==
X-Received: by 2002:a17:907:d16:b0:b04:6338:c936 with SMTP id a640c23a62f3a-b07c35b8e53mr876582466b.17.1757822228258;
        Sat, 13 Sep 2025 20:57:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32f1e54sm673986866b.75.2025.09.13.20.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:57:07 -0700 (PDT)
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
Subject: [PATCH RESEND 49/62] init: rename ramdisk_execute_command to initramfs_execute_command
Date: Sun, 14 Sep 2025 06:57:03 +0300
Message-ID: <20250914035703.3729713-1-safinaskar@gmail.com>
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
 init/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/init/main.c b/init/main.c
index 5186233c64fd..cbebd64f523c 100644
--- a/init/main.c
+++ b/init/main.c
@@ -160,7 +160,7 @@ static size_t initargs_offs;
 #endif
 
 static char *execute_command;
-static char *ramdisk_execute_command = "/init";
+static char *initramfs_execute_command = "/init";
 
 /*
  * Used to generate warnings if static_key manipulation functions are used
@@ -609,7 +609,7 @@ static int __init rdinit_setup(char *str)
 {
 	unsigned int i;
 
-	ramdisk_execute_command = str;
+	initramfs_execute_command = str;
 	/* See "auto" comment in init_setup */
 	for (i = 1; i < MAX_INIT_ARGS; i++)
 		argv_init[i] = NULL;
@@ -1491,12 +1491,12 @@ static int __ref kernel_init(void *unused)
 
 	do_sysctl_args();
 
-	if (ramdisk_execute_command) {
-		ret = run_init_process(ramdisk_execute_command);
+	if (initramfs_execute_command) {
+		ret = run_init_process(initramfs_execute_command);
 		if (!ret)
 			return 0;
 		pr_err("Failed to execute %s (error %d)\n",
-		       ramdisk_execute_command, ret);
+		       initramfs_execute_command, ret);
 	}
 
 	/*
@@ -1588,11 +1588,11 @@ static noinline void __init kernel_init_freeable(void)
 	 * the work
 	 */
 	int ramdisk_command_access;
-	ramdisk_command_access = init_eaccess(ramdisk_execute_command);
+	ramdisk_command_access = init_eaccess(initramfs_execute_command);
 	if (ramdisk_command_access != 0) {
 		pr_warn("check access for rdinit=%s failed: %i, ignoring\n",
-			ramdisk_execute_command, ramdisk_command_access);
-		ramdisk_execute_command = NULL;
+			initramfs_execute_command, ramdisk_command_access);
+		initramfs_execute_command = NULL;
 		prepare_namespace();
 	}
 
-- 
2.47.2


