Return-Path: <linuxppc-dev+bounces-12129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98169B55E0B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:18:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxM26rnpz3dTk;
	Sat, 13 Sep 2025 13:18:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757724529;
	cv=none; b=W4Anhw/KCqC7f+XOZ8H+yuyALZZJW6L8W040BnUKu2x2HlJHwmIT7Wxo3GMz1cXazHMtlgHPXvIkKDNIGmIw+8ppDgfV6fk53uYqcSwTYw1jOjX0tRn5BE1cZhDcC7/PODvPuZJwZUpxNECVWq4Cff0AZIVMUWd2D06uy6tT/LpVWPndiebtWPMQHZlBA0UhLZbj8/Hn9GuvLqWpkLguHPCggl0CV/81ZCZCen2s6XszhJF9KjpUytcAYgz4tIfXFOt1DaATGu2Nbj5yM5D0g0O6rIo3OXGQmgzCZNTFx9TD9ulpDN9iTJKDXJcV7rfE/EonhWz4gskXElTKtqlQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757724529; c=relaxed/relaxed;
	bh=AaXPZ8GS+1OiGE0ZCje70+VbQ3y123W+k6t1ILETLlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3Yce6TXpPpGVbOxiU1Lv+i/7aV1xM5oTOZvJv/TCxzqNecT88ReUMzUExgj4sbmTjYXOOXy1F1mh+b+wdhmdYaEQJT5GBiejo7BanPxk8uOgEFhslQW7bt254cmhxlBeZaP8jukFKHaXx4bxncNFRiO4Jk52eYOKeSHGzMGBldmVHnNrQRs4k0CGdVzCUdC+MCh15P/sWL8Kh2lHuYt616Qbc1FmvJ8P1poxW1tMLbsXZGSZEhdUQUqAkJKLrKok7gse5GaCIHNxmwZBbqKnCDldVyaZBv8uwFm03ZlQYdLgb65ZdheM71EhOND3BFjJcVT1OeGJBd4mCUrQIiFjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HeH8LsBC; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HeH8LsBC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNt2m3yrwz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 10:48:48 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-62ed3e929d1so3232975a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 17:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724526; x=1758329326; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaXPZ8GS+1OiGE0ZCje70+VbQ3y123W+k6t1ILETLlQ=;
        b=HeH8LsBCCgeXheTm3ExtOsV9SRSQEX753HQDMIOhvyWYv/XLYiN3VNWgqLIs/7bKkO
         JnWOOrlHl5SjprDQSn4z/crKcqU+7UJysnGNYpVAlqGPH+7F751Io2ryUV30uItybNPk
         xxVyICsQ+3YmZQLDlyCTcmmphtCoQ19fimSXACAJs2CsDQSYeJIonGFNfUCj6qHiF2jD
         5xMgSAxirwV2J0vjHUuJqw75skvZIMOhTExvRzb6Xh5cSS9g4cI2hJ9097byhR6hUVRi
         YfUo8y++2tC2tgYN/Xg++2FAfWPmmg/NQLVxh3SqTX+5Ol6bFK2Enn5BYHJzCKaEPfAU
         goGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724526; x=1758329326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaXPZ8GS+1OiGE0ZCje70+VbQ3y123W+k6t1ILETLlQ=;
        b=lESP6hrP2LzfZvG+TuVRrqepMHqzkG57an5mQsGCOSMV1b2fGsrhfXrJ2/KNX6hyx7
         dQedFoMhyEoAgyakw19DGFJIaQDwZBokNy9/oDWeJrZ5tyL4S6X6A9n1CcosrPTDB51U
         8rsFHpaFpgBFQ+C4lrTgxYiQy1yaNFod6QM3B6v88OGkVdmgiGv+i0hH1ycSmXaNbLTi
         i41F8qXMv3IqulyPggEum1ng8HMfooFOs0j7JLBSudr5R2pzKjR6F7HGJtzJGw2UcsMF
         0LnYv3l5rVwyWiXRSLb3YuZZmQXYC/sn9uLG6gjTM8mDpu7tXq/zNc5XdbV7n0q2Gv9D
         b/wA==
X-Forwarded-Encrypted: i=1; AJvYcCWSftS3Rs9Vu2DRCMkXgcOQEurajLjx+QdC/jvVSWQ4N3qG7SiLQfXKUvynqNNlyY4L1BRaMfYBIp1CFeg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzmJ/TLsBF5zcXDLGXKwWmW1AOwf5DB6895egsm6Hv3p5JD9Xix
	BQLVNoxMpahz9eNgo8TPFuJ68l+UMn2dTu/AEa9AgSeDFoWzv/eQVDie
X-Gm-Gg: ASbGncu3eQlw7rAdwZBAdeOLKbqAs4EQYCtw+eIuNmuKCN6bswFIyE2XUCa/amqiRXp
	eeU1/EIitFKQVuNqndcTs8yPthVpLUd58MIRix52xGRrMcDvpe251lyGXe3/YKxgogp8Mu7TL9r
	2CzLF+5PeBiA8HdL+AEyjkK/kPJNRn9/rstTkbofgC0Eg0hbXLC8Po+sCGabL2XXrDoecdqfZKn
	HezFTtmwrArrhcqUW5akeEqR8NCBlTInkW/TDgmLINUhklosug32+9J3+wIGEwLCrdyHtisuWH5
	3L3rC56q+Pqi9utwKtQs3+Te0rSi4jYwzEKnHIU0CqLzkz5QbIckBr+nJxBTXMw/Ph+jpTNLorN
	EwpVKarOKShLZZjwdLmc=
X-Google-Smtp-Source: AGHT+IG9OWg6vz1Y30fO80tUWulNMPWiUpAt7xVByuYcp52he6rblxs++6dTXTQkGfdvR2czpiOABA==
X-Received: by 2002:a17:907:d88:b0:af9:add3:6bbb with SMTP id a640c23a62f3a-b07c35fb469mr433586666b.29.1757724525627;
        Fri, 12 Sep 2025 17:48:45 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd5bfsm461777466b.63.2025.09.12.17.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:48:45 -0700 (PDT)
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
Subject: [PATCH RESEND 08/62] arm: init: remove FLAG_RDLOAD and FLAG_RDPROMPT
Date: Sat, 13 Sep 2025 00:37:47 +0000
Message-ID: <20250913003842.41944-9-safinaskar@gmail.com>
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

They are unused since previous commit

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/arch/arm/setup.rst | 4 ++--
 arch/arm/kernel/atags_compat.c   | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/arm/setup.rst b/Documentation/arch/arm/setup.rst
index 8e12ef3fb9a7..be77d4b2aac1 100644
--- a/Documentation/arch/arm/setup.rst
+++ b/Documentation/arch/arm/setup.rst
@@ -35,8 +35,8 @@ below:
     =====   ========================
     bit 0   1 = mount root read only
     bit 1   unused
-    bit 2   0 = load ramdisk
-    bit 3   0 = prompt for ramdisk
+    bit 2   unused
+    bit 3   unused
     =====   ========================
 
  rootdev
diff --git a/arch/arm/kernel/atags_compat.c b/arch/arm/kernel/atags_compat.c
index b9747061fa97..8d04edee3066 100644
--- a/arch/arm/kernel/atags_compat.c
+++ b/arch/arm/kernel/atags_compat.c
@@ -44,8 +44,6 @@ struct param_struct {
 	    unsigned long ramdisk_size;		/*  8 */
 	    unsigned long flags;		/* 12 */
 #define FLAG_READONLY	1
-#define FLAG_RDLOAD	4
-#define FLAG_RDPROMPT	8
 	    unsigned long rootdev;		/* 16 */
 	    unsigned long video_num_cols;	/* 20 */
 	    unsigned long video_num_rows;	/* 24 */
-- 
2.47.2


