Return-Path: <linuxppc-dev+bounces-12119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCA2B55E01
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:17:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxKn5P4cz3d9H;
	Sat, 13 Sep 2025 13:17:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757725184;
	cv=none; b=E1b0dBdNq8WCsn+mJ/Z4rTCHh6Frz/z52t+8ho2VT6nuexMPuMSyez+QavqfHnThuxReK63RfT/GWng13sWuDE1vTeYEwAdH1A/2f9Sok3HbokicrUCGZ/g3lqra/16C99Ql3j0WpDkHqDuEBljXxTIsnpC0pdXe3anG3yh6QjW1REFR29SvUiCpb11nljYd1dUEK7z7A62dDJ00FRUZxrtSRLqY7Prb63/hwszrveqO197sHN2RPFj90AaTRf/cO8XVtwCwyFjBcWBkFjub/y0Igb6MSny+GPisHkLnRHW4YVU07GMizZnH3z0/xiuzIdcJfwM/yKowCkTO1ISYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757725184; c=relaxed/relaxed;
	bh=6fWPoN959WwxjoYegCw0rDaXLTHmPmQJSliJ+OqkRJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cj7oXhAf1TDRJrUojN3tPDz+VPPA/xpMfGKDDNN4eeZc3oNHkZIvKs30rpNL6+9Jt0wvBGWUGfVe+w9H8u66DdA3Fzm2IMO2JihkNLP88LLSONvKNWyx/L+lTFpxyxi6eNRvmGj/K2ljyI2cXvJQrAaBo+NbrBwjCFbDZ7tm4LPT+uAErHJNJ+xL8MVsT7seFlUEVB8N4p6TUw+/yJIin5PvlrFj+6Kv3RRRYRYB0v0LEJxRZ1Y0KkjeMv/4+ql27KJGDl9WG2zCMSrCTjPS+OC96EqQw1s0wsM8mFP9BSvvdsTrNs8xfngH7/sLOYFo6jAMBq/uf6i7oIOH/o8Low==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NdUMdTHU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NdUMdTHU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtHM2R2Pz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:59:43 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b07e081d852so68050666b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725180; x=1758329980; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fWPoN959WwxjoYegCw0rDaXLTHmPmQJSliJ+OqkRJY=;
        b=NdUMdTHUrpLPjdhnEizjUa/FqLkenwppatw3qGRsjy5PtnkoOGXsha+HT89e4alzz7
         J2Fv5tYRbkWXuUBQirTJRCBvqoXQyKBFXjyf2sucY+7W0Tz/+4CC+O9AFQzV70Txh4uO
         jSyUftHKuWZPgbYvysVE7C0wzPV/htwvbXVUNpbC6cuRCS68ZdT3AE0XIAmz2B/HqXEV
         seCsOISMK1wpaj9qjpK0DuTo+XvdysTe77odFeBMEH/HgKqazUo5T/yHWHcQg0z2jxYu
         pGf/mdTDAExIjq/4RW2qXqWFx3cloYc/oyN2vmG6hvHt/rC9iGRFz6R9xrILkxPGqn7w
         4I1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725180; x=1758329980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fWPoN959WwxjoYegCw0rDaXLTHmPmQJSliJ+OqkRJY=;
        b=TP0McNNnWSenn5z/YtH1rF+MHSg6DNST2pHe5NymfkhiqEOghpZtmOAsiOI6GHjZJB
         z/PzyqXH3OXFEdOKq6VRZ5NG88pq1rUlrhjhMoWbnT2XNxiBQFZS0N3eiuk7AlNC4yTZ
         UI0LP16Ra36XQUcJkRfMoeO8MPYJZEWXt+vSq98UdlUdZOznuv9XTgLP4kMnQbMMZoxG
         a3R2nVMINlbARSjbP0CuTv/VDTk/wHCd6BrdGvNJamsxKisyrQ9TETu+TJnQriUS9hFr
         RRXaVuLJclqMn/+tB5qnUyKK5zZXqSOjxQENFC/ELKRUyl/jBxeukuH/Y7JJ8vnjBZMW
         YRug==
X-Forwarded-Encrypted: i=1; AJvYcCUEo27WZeSwDGHDAlUpt0XCevipMnbR2+UzvByFu/ae43QPLJf9uKr2qQOM+Ob/wBgtbXQhp9BvjSlK7dk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwWBR1PeuYNpawDXFyp6y/4q3iBQ84lk4LwprTjujlJQK+WsJYZ
	3YIYxdpon/UNO2rN2t9pRoAzreAuj69Qm8nkRCNAetsnZM1WtH6fjd2b
X-Gm-Gg: ASbGnctjdu3fOzBVn+YZStZtkG8NZzBaMspkMFHF8FRgyXZ8d8Ppr1ji/fg5yS99vjS
	lj8OGF9Kso7XXTFvOJkqzZIUoNAFsedRcFRLBNdiGayI7PJiAC/oG42/fsUSiBl67xMZI4ECCKW
	iNZM5jJfAW5Nz7chUe/OoHaTDVw+F1fusJ3/d9vdtb9vQEmRkcomqcdWs1JVVFKtYr4TjbCZ0dw
	cKEVy3BoaOsQl2Sqv+zmgA6ZcfPb8TEmwHl2Y/WxWUYLY2lkGzQyzNNjGtcsg0sSXymEGP+McMn
	WdmeMRun9BQTLvckaKXAjvvWYFOMIXN2grQaADuNDpd4loq4bxRBIQ2JWfiHPPf40fwnzET8KpW
	AAGop2AdSIT7JrDj68Cw=
X-Google-Smtp-Source: AGHT+IGLvsatTRrbnodGqisgzpCsfnT+5kjCyZkQGsCYdRKthq/XXLBOPdic+fyhUVGMnj7YztyCUg==
X-Received: by 2002:a17:907:3f1a:b0:b04:ae7c:703e with SMTP id a640c23a62f3a-b07c35bca5fmr458205966b.24.1757725180390;
        Fri, 12 Sep 2025 17:59:40 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b3347a2dsm471368266b.98.2025.09.12.17.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:59:39 -0700 (PDT)
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
Subject: [PATCH RESEND 18/62] doc: modernize Documentation/driver-api/early-userspace/early_userspace_support.rst
Date: Sat, 13 Sep 2025 00:37:57 +0000
Message-ID: <20250913003842.41944-19-safinaskar@gmail.com>
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

Update it to reflect initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../early_userspace_support.rst                | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/driver-api/early-userspace/early_userspace_support.rst b/Documentation/driver-api/early-userspace/early_userspace_support.rst
index 61bdeac1bae5..0ca923c1007b 100644
--- a/Documentation/driver-api/early-userspace/early_userspace_support.rst
+++ b/Documentation/driver-api/early-userspace/early_userspace_support.rst
@@ -127,28 +127,22 @@ mailing list at https://www.zytor.com/mailman/listinfo/klibc
 How does it work?
 =================
 
-The kernel has currently 3 ways to mount the root filesystem:
+The kernel has currently 2 ways to mount the root filesystem:
 
 a) all required device and filesystem drivers compiled into the kernel, no
-   initrd.  init/main.c:init() will call prepare_namespace() to mount the
+   initramfs.  init/main.c:kernel_init_freeable() will call prepare_namespace() to mount the
    final root filesystem, based on the root= option and optional init= to run
-   some other init binary than listed at the end of init/main.c:init().
+   some other init binary than listed at the end of init/main.c:kernel_init().
 
-b) some device and filesystem drivers built as modules and stored in an
-   initrd.  The initrd must contain a binary '/linuxrc' which is supposed to
-   load these driver modules.  It is also possible to mount the final root
-   filesystem via linuxrc and use the pivot_root syscall.  The initrd is
-   mounted and executed via prepare_namespace().
-
-c) using initramfs.  The call to prepare_namespace() must be skipped.
+b) using initramfs.  The call to prepare_namespace() must be skipped.
    This means that a binary must do all the work.  Said binary can be stored
    into initramfs either via modifying usr/gen_init_cpio.c or via the new
-   initrd format, an cpio archive.  It must be called "/init".  This binary
+   initramfs format, an cpio archive.  It must be called "/init".  This binary
    is responsible to do all the things prepare_namespace() would do.
 
    To maintain backwards compatibility, the /init binary will only run if it
    comes via an initramfs cpio archive.  If this is not the case,
-   init/main.c:init() will run prepare_namespace() to mount the final root
+   init/main.c:kernel_init_freeable() will run prepare_namespace() to mount the final root
    and exec one of the predefined init binaries.
 
 Bryan O'Sullivan <bos@serpentine.com>
-- 
2.47.2


