Return-Path: <linuxppc-dev+bounces-12125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04990B55E07
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:17:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxLb4P3dz3chF;
	Sat, 13 Sep 2025 13:17:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757724791;
	cv=none; b=fGbfgsHLKGChBdG1IEJmxz5s6vbL9W2FIzO7lLRHTVPVSvIBLqXMc9WkkYrBhLSCkSW55XOAydR4sCvCwfSu07MtlZO0HuYHzH5qNiRdUj1L2Faktg+EQW19J1JfKbcN1eJQ8NZQA05TFy3rOiXyV1DJPgEEyPDPFl73QJP039CKKADBXfVApX8xFdy14i+bh/qWNNkKjqzjgF/AGU1pD9ELrn4KLt9WwE7xXmwUyGhQl93CCnrB3q3wfGqiiN/UMJkTp1xZU9tNCEdIX6cFMVHe+Z+HIpR/AdEwLqq1jZdn/YVTx4sm6iA5/pVGvrzbVa+gpk7EvE4mir+GfDidqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757724791; c=relaxed/relaxed;
	bh=qPSAK5Fj4YQSUyCSJit30V41XYzOMHEP2qtV3SbNp88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PuKx1SOqned+gW0hURl4U0uBQp/SlQOBbGec4JXn/wyqlICuuPIO4lrS5MCnYsLZS723JBkiJA9X/R4FQ73tbn3ZgLaUazJRZPOjsEBQZij/RTHnNy1VCWRMQlc2FDGmhQ9VZeQ6hRPt4QCWbMtVAz16CzCDgTSlDLbrqcfu36YKj2Gk9doCauvg6XifYPrXGLnsWpM4gkFjZl7jVHYx/Dn5EpZY8eMxoRmOm+FTERUz96UMu32mPfV/dUrzUOVKsFfIgR7KZIhTzDtdYucK23Qcu19xqzWG0x7HdsnxkyIftP8dDVRiu37hmFZRK3GDvCw3fr2DfVUc2B5mpCTTkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fqE6IvHl; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fqE6IvHl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNt7p68Fgz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:53:10 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b079c13240eso406061766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724788; x=1758329588; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPSAK5Fj4YQSUyCSJit30V41XYzOMHEP2qtV3SbNp88=;
        b=fqE6IvHlcLzlDYxedSP2kyblQhYBr8uje9qclFBmlWo7j9wWYolYh8qfx8qfyf+AK7
         4pqYYXtDlvYw8ecW46S2bD10LSyhg/Iwy1SLlXw+NyBWuTrC+3AiKxLk34fjJLYef/KH
         L4CTvJp8nq/I7ngToBPw1u0hk19536QVsokJaYVjvQmsDBgjB9SqtygmjGFB6OfGHoPl
         DG+ba6ES/qh6zeTVmdiwyyccr3YrT3ERSIMctEHqLyVcIA7hvCeXU0q+6lpexxAGODoG
         4CX45ee1Zx9Dp0ir4ujfcEp6SQ0eVc5HY1oIO2T3rCgB+HfD7RUffxD5fKt99njSozvD
         Uygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724788; x=1758329588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPSAK5Fj4YQSUyCSJit30V41XYzOMHEP2qtV3SbNp88=;
        b=WKUUEbFrelRIUD7eauDVU0qdD4CYlz5e9vCnJVc7KUC7WQZaWC0sMp+MEf4n57zhyp
         0fikIBfRfa18GOXXOOHo7tjJqCIMpKbSgksSe+JM3ouDwJ1vU5iWvotV0guXd3C2nMvx
         ttncbtt6xrzol53o0vHmpQDtD+m/898ezJnCWa6j3Mq5l7HF3r9dY58c7mtDz3zH+q+3
         T+C28tuNd8WqSF/1Wojn4Dddd7HxX8hOa2kjkaicY1tOeaFQcPCf3GjQ0iTbVrqGCMYc
         XUSMweWk+iCW1Oega+DyDsTm/ga64waGkPguyaclCiLhsOpDeumcK6p57eAT0JhsIgTr
         rcgA==
X-Forwarded-Encrypted: i=1; AJvYcCX6WNsJkt2q/Bd7rzWC7yuiCrpAffwRSdEnrdD8kbhgcdLatn5jmmd5FCwvSqazvNWBBnR9gka9rIEbgCg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyolGfwB8ldXuqYXXwPDDGY8XjbkXVMDjlrylTC5hBFG//Pw1RD
	ahm1tmwJ57lRkIifyp73IOI9z9ObOXZE9PFb36zD3FBHzfNfRgMPUOVS
X-Gm-Gg: ASbGnct/Pz62zJn/6c1F3GCQNh72tq2qrc5OToBaErkA4Odb0fs+soeZj6FrrBTfi0B
	mDD9jC6LS2eGs4mTYqC+KYlWsUrTypNnDsFH+ErQ2xpu+n6PsdJywFL3y1iYHypBEXCCZqhViND
	NkiYF8pFvWNr6rbslJnPiBiAW7dDezSwExEycolplDW1ryEkxsI70ejJe7eyjz053uMPQNz2ZB3
	tA2yuyBcL4NeYCNMiY5LPvrCdtR11fOmRenbwccZev20ugpsHkhl3SI4Xcojr9j2Bxoz6iRkiRL
	+R5OZFx5JBsuCuilksEGzKspxH8rruJVvBszb4Vp74GfYO/jnW1ZDQzBeMwJNubEdwYI/LjO/Y0
	cRDWzjCoK+jeUUbQjgIEY0U7cXhiLSw==
X-Google-Smtp-Source: AGHT+IFLH7pCvIgBYHEI5BCYMw7iR++gatKVbesXKTxSAgJfhChwCe/V59YIUp3mRnJ55soXUGFMnw==
X-Received: by 2002:a17:907:da4:b0:b04:2cc2:e49c with SMTP id a640c23a62f3a-b07c35bbcbbmr535243766b.19.1757724787764;
        Fri, 12 Sep 2025 17:53:07 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32f22e8sm477916866b.87.2025.09.12.17.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:53:07 -0700 (PDT)
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
Subject: [PATCH RESEND 12/62] init: remove /proc/sys/kernel/real-root-dev
Date: Sat, 13 Sep 2025 00:37:51 +0000
Message-ID: <20250913003842.41944-13-safinaskar@gmail.com>
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

It was used for initrd support, which was removed in previous
commits

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/sysctl/kernel.rst |  6 ------
 include/uapi/linux/sysctl.h                 |  1 -
 init/do_mounts_initrd.c                     | 20 --------------------
 3 files changed, 27 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 8b49eab937d0..cc958c228bc2 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1215,12 +1215,6 @@ that support this feature.
 ==  ===========================================================================
 
 
-real-root-dev
-=============
-
-See Documentation/admin-guide/initrd.rst.
-
-
 reboot-cmd (SPARC only)
 =======================
 
diff --git a/include/uapi/linux/sysctl.h b/include/uapi/linux/sysctl.h
index 63d1464cb71c..1c7fe0f4dca4 100644
--- a/include/uapi/linux/sysctl.h
+++ b/include/uapi/linux/sysctl.h
@@ -92,7 +92,6 @@ enum
 	KERN_DOMAINNAME=8,	/* string: domainname */
 
 	KERN_PANIC=15,		/* int: panic timeout */
-	KERN_REALROOTDEV=16,	/* real root device to mount after initrd */
 
 	KERN_SPARC_REBOOT=21,	/* reboot command on Sparc */
 	KERN_CTLALTDEL=22,	/* int: allow ctl-alt-del to reboot */
diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index bec1c5d684a3..d5264e9a52e0 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -14,30 +14,10 @@
 
 unsigned long initrd_start, initrd_end;
 int initrd_below_start_ok;
-static unsigned int real_root_dev;	/* do_proc_dointvec cannot handle kdev_t */
 
 phys_addr_t phys_initrd_start __initdata;
 unsigned long phys_initrd_size __initdata;
 
-#ifdef CONFIG_SYSCTL
-static const struct ctl_table kern_do_mounts_initrd_table[] = {
-	{
-		.procname       = "real-root-dev",
-		.data           = &real_root_dev,
-		.maxlen         = sizeof(int),
-		.mode           = 0644,
-		.proc_handler   = proc_dointvec,
-	},
-};
-
-static __init int kernel_do_mounts_initrd_sysctls_init(void)
-{
-	register_sysctl_init("kernel", kern_do_mounts_initrd_table);
-	return 0;
-}
-late_initcall(kernel_do_mounts_initrd_sysctls_init);
-#endif /* CONFIG_SYSCTL */
-
 static int __init early_initrdmem(char *p)
 {
 	phys_addr_t start;
-- 
2.47.2


