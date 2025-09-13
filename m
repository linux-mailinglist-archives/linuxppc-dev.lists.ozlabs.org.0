Return-Path: <linuxppc-dev+bounces-12108-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F155DB55DF5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:15:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxHd4rzDz3cYV;
	Sat, 13 Sep 2025 13:15:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757725907;
	cv=none; b=RcX8FGyHfyA3J8cXN1tLLNXgqEw0iWvP2Enux+KYC3yfsN80Wyv/j3kGksyJ5rdEAbBRk+TwcGO7wGtf1XvsMco+V+eB0XwtcCPQANlH+gWymuX58DIWSxr2tb9PCeyjo9ulTdW7PkBrsnp+ez6n8EoWa4KCBgNFUGNVVpiCydt2AzrIWCABZQznaP8VCl57F7UCQirUOoRtecO5Zh/m6yeGptHIxFU9CsiGskYcNwCFEUAtMuXNqklsJMuPaopnjCde0PM5EWMVwMLk92vei+p4Sxn2+27y+r2rR70+Ur9rjsuz1OOhA4jSDFm6ik7SmUH4C7mxiJSJ+zyYhDYb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757725907; c=relaxed/relaxed;
	bh=h6O+lfSZLBCLtFpNKL/1anVub0eApVizJE0pmHD2kMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAJeuG1diCfXQiNf3+NA12FPvMAgY62kF0z6/kzq1nrUxNYX5HwMGN98l+62AVghmmJTNz0Ekd3N2/2ZHu1Ayf04D737CcGgEyU/wP3bIBYSgHRqpC5ofmG42Qp45+48tIXvqInId/YZ+wEBd3cdIlWJIda6taaGMZFd7haP4aMFWHI1NmSwfBx2Ew5wvZScCO8bIZ8ME/eJxP4p/EQZoSylnm1uw51eZuLM4/mqOYPV9kg2OTrY63i/3gqq07SqTZZzEks8G3YUYott9KnqJocg7UFKMjvhS9tJGgv144IrPf4s+F3CfgyGGZFKUVyQkne8kPhtEiE4TR1t/pv2Gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dPpkfahh; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dPpkfahh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtYH17xnz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:11:47 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-625e1ef08eeso4239907a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725904; x=1758330704; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6O+lfSZLBCLtFpNKL/1anVub0eApVizJE0pmHD2kMo=;
        b=dPpkfahhyZLj4CYVb4p9H8pvpSWF+Yc5a9njTRNMrEiCV6yw0M+EMq0FOJtl/QG9fH
         lusS5wMU/N2NV8MhTlanMh/CY64g4sUplApHpR+ynL+9WFH+zUQtyfuiA93EMwMDUNMg
         5pcsD6mLUIXvIZgPwur+CNWtqoI9HZiI2PSiRfigLvIjjOJejR+urGdqEAMGvk0S/1+8
         V2n6vENbfjj0t/lj5TaoE3w+s3Apoc+kLL3qJ2Kd5H2+MwHn+g6huZyEQJ3WE4tWnq+A
         lDtuvwnRC1d/mMBg0D85sTyTI2TSfGj6uYJgDbaH/fy0z+YeBAQOcDx+wXXhQPupu389
         bAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725904; x=1758330704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6O+lfSZLBCLtFpNKL/1anVub0eApVizJE0pmHD2kMo=;
        b=kPjKTkxXYMofUhSHvpV1U7t1wRX5KQiDZQPbCaqxhg9wgjd17W/n49sAZtfhVk0y2p
         pljcQrhzLB4AHS1hTxfxEB9diy8ZRooOFxS2MEgGR3aKirWdXsdr9Qh+Zps+p2BHuIuJ
         MdexdlXQKlRtj/JGBnq2RZDyI/EaKSuEb3wjBG1ZiL5G27yJ7TWxPTJ6RA7oa/aMeluH
         COeeuk6PboGk5pdkyY5vPxUtjIXorILQdAgIqCBI66q100yEKbCzmUFfys0tBiCm0z4M
         ueNUHO4JL7tz7vpa8TndbjYTDUTwSq6b5cV+8Cb3dvPMZPqIpHqYIvF7+zdUS9WUT5HM
         Klkw==
X-Forwarded-Encrypted: i=1; AJvYcCViKWlbWCrkSQzG99pG6o5hfwIvCp9kakKAEyr+2I3E6uDnry/54CmMVAqx+5rexIu0W8UwcBGnykgUjuU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwB7ZZumHZEcqapV0zQ/3bgMCozsY/+WSQjhPuOry3lBcmsz3B1
	5DFFo4QwnCYximK5B6LNoncz7YuYolueKBo9+CuU7wKVbo7DmS18HTgE
X-Gm-Gg: ASbGnctNq3X40IW9yjxRo3vQbinaL19ukfL227xNSt17zzqhJ8mj5r+yWrkWNQLeNwo
	9eemVVV3rExjuKib/rhN3uu+UgszZnerH65O5axOWrANaQ+fiyRKfvN/Mb9HRU8xwpCZmVNV+r8
	AwLuXmzGDbj91BCI0J4OVgGeRSDi5kkZ5L7VCDFic+79OIGskeSbRgFOzvOZBYAtEVjYYnxmgYM
	dcAD3+4sqUaaQEhB432taJR/2pu1ysut2XMxxDL5/Cpf443ZX8urFYE+KGd0rU1Gqoio7ywsGSE
	dr8EoAq8ko5kESlK5FsrdhtieaMzQ4zQr3BlZEllBAicW73QMo6vn1ctZTkx2sglOjkXMZp7cp0
	v1cT6OfE3S1GoArH6REw=
X-Google-Smtp-Source: AGHT+IEEs4w0VYWOrTZ2mf5mPdRdgIBBMsi5zMJEle+Jt2EK6Q+4TbCNWtdbvmdxcJfUUMXxxDwLfQ==
X-Received: by 2002:a05:6402:5242:b0:628:a4fb:3b44 with SMTP id 4fb4d7f45d1cf-62ed825998fmr4990182a12.1.1757725904210;
        Fri, 12 Sep 2025 18:11:44 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62efb5b8b0asm913566a12.20.2025.09.12.18.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:11:43 -0700 (PDT)
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
Subject: [PATCH RESEND 29/62] init: move virt_external_initramfs_{start,end} to init/initramfs.c
Date: Sat, 13 Sep 2025 00:38:08 +0000
Message-ID: <20250913003842.41944-30-safinaskar@gmail.com>
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

Move definitions of virt_external_initramfs_start and
virt_external_initramfs_end to init/initramfs.c

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 init/do_mounts_initrd.c | 1 -
 init/initramfs.c        | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 8bdeb205a0cd..535ce459ab94 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -12,7 +12,6 @@
 
 #include "do_mounts.h"
 
-unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
 int initrd_below_start_ok;
 
 static int __init early_initrdmem(char *p)
diff --git a/init/initramfs.c b/init/initramfs.c
index 9a221c713c60..d2301cc6c470 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -600,6 +600,8 @@ __setup("initramfs_async=", initramfs_async_setup);
 #include <linux/initrd.h>
 #include <linux/kexec.h>
 
+unsigned long virt_external_initramfs_start, virt_external_initramfs_end;
+
 phys_addr_t phys_external_initramfs_start __initdata;
 unsigned long phys_external_initramfs_size __initdata;
 
-- 
2.47.2


