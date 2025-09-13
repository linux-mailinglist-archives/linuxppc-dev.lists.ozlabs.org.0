Return-Path: <linuxppc-dev+bounces-12110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A5B55DF7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:15:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxJ36Sj2z3cZ9;
	Sat, 13 Sep 2025 13:15:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757725775;
	cv=none; b=hEDk4dkhFM+IKTeAIzQWvLwcwAn0o0bKyCfOX5fGT4YVs0pTQPFi87co6webtsVXBJUimriH4pjG7DBNmlCCU/RAkrFJxUEijxL+z7p4amk58lERuaIC2MwbL/yV/+B8ZO1OzVIqq3W/96CvWenJKZZeCyUyS8d9N9e+MG9vSMRd1cCpCA9lC9e0+95LyvYcDtNJ5A3JdGPCPLCIk7G9fXO0OHm3feh6GkDGCZ6FDaUp5A+sTHAheG3ltk4+zVyrgKMfRlw9uZRGK8UX81HNR7vSCBFutDoq1e4qfhteGz2yCyZoKiLogJv/OMa9RSqhF/8QKIhvpQghP4P0Sn64CA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757725775; c=relaxed/relaxed;
	bh=2pGfjPJCmTgFBTQIPRnE53dxXo3SbfDBvMh6uq5akyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iRh+WPagg+mrczUPusJ7ljnY+Av99LkOHk6bMC+nL7C/pW61Kv50FbaSiLWEIublgBqlDJyuOF/d9MYMoosCfdRualMDME/4Eugg0gEjzBHAf8F96xeHTKi5zskPKBDedSh8/vVloj9t582uS/X2K6IapHDo4mgMZMWmL62GWovRPfVOCOYkRFI5lNGb3tArrLeHmcoHN/0xAsPBTVBbc9vI5p87pBXvxDYgRBHr9jXUp7OY0Hurcq+PXTLIzW2LpUM5ZuLED9e28s0DWMPdC8bSzgV41/WxIsCbZ577bGYCmOb1W5n0l8Eo5A2B7xVoxAkPnCweG5A7maNPpaB3FA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mFZ0aToQ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mFZ0aToQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtVk5CFLz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:09:34 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b07ba1c3df4so345545966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725772; x=1758330572; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pGfjPJCmTgFBTQIPRnE53dxXo3SbfDBvMh6uq5akyU=;
        b=mFZ0aToQsJL4sNlujXNNBAOLSrdrrpxKhmd4gMlJGw2BYyN4ckr+5ZhJrSfT3G10uj
         1ZhD6W6cisF3SnATwRsRi/SDLXASiOgC+U7smvY7clhkIFO2J6t3BFVSl+xPUEKH5Uxl
         AkbKCXGjCszl3yXbdGnpY7ke6GcuKB/y8/m0Gba+tkKEQaKh+sSIAlLkjnyuQJAW+xDq
         8RRGurD9MNyhXBPwF454WWyUpqQlLcBNjOi2eIo9YeQt+n7QrpLQhDQ6FhWy/hqj/HsS
         nsmX2NybXc7u/rGYY1cF9foQZN0lmAlMkxjFSF1rzxaW81DORJX8u9TBZZtNjqd71rlv
         hR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725772; x=1758330572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pGfjPJCmTgFBTQIPRnE53dxXo3SbfDBvMh6uq5akyU=;
        b=rbbHGiAYfCPVNn1PciIxlQiUikbX0/FjmFFiGX9A/pXz8l11JHS5XA9o1dpfA8ATW6
         vMd9leuK9Xeht6H1o6cnATCCgr6zjVKEED9r7rYFVosGw8lO1WCvPbxeKmIFSs+Jnycf
         dxCxvnW+GKBgC2Z2YZzrPmqAEj9d9sypbxLMEz85VwRbAPEJyFI5gO8l9vkXyUfCAdO9
         JSVizTzAEnJW5LBvr7HEDIvmffj5NwhXtcf1WS/OIyESZlFaEgPjx7NcZdGwIvYwtDK1
         nDJAnSJf3SchM6kMMXYPlvduxZhDkPd9D5A/27fzOfLa6CLZVEtjE6VFKunfrUsIu3Kv
         t0Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXXBkRYDyluYwBo6m7sCa549AnKGGY0TWsZOyKaTUF1DohtxL87QdOYYgmLcakxBigZaszNQuqOk0JPLZk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxDGIP/oUMaBFTJMqvXvOA6X65J/weatn+pOl4pNZ1yOfy7X2tb
	3b9boZszAgBJz075TkrhpEnSe/6p3iLZn6eaHipa8B64jgJi1RcE4QY5
X-Gm-Gg: ASbGnctFsNRg4VISV29Qz679na5PnlGCbUxma++Kq916+U29REspU/CSvO9Ba+iSNh6
	PxZmXvOaFCzbj8VpcG2V7EvIWYI5u9AKAziFyoKxLNoWSy5UfjjHf/JY1x+OmZJleeW3IRha6MR
	VrbasSF9ZtHCJBSREAiPX10RMbu+9KIMY64xqZbEd8rP0GJhzdxV3lXI6ojhy9nBjs5JohWp/xn
	NlLpsxPfZeHXnK/rdXFvRw3YbFNnai2mfmur/1BQmcy1UcrDsKLbZez97yCc+8YwTf67BJVz3Dm
	A6mlbP6jhN69zH6ZbOQxE0VvecB8jlpGKR71pFO7owywiaHFsWl330rKk9eeMknhq93CPPoRTaR
	vKGAusRJn4o76Ryi9bfc=
X-Google-Smtp-Source: AGHT+IHrHcZIQpP/M06nOcq3Snl8FXkxUTmgmKKbhKMXWfrO9iWe4P5Ilwjf7ocqvFrLGTk9+k818w==
X-Received: by 2002:a17:907:3d0c:b0:b04:250d:ee7 with SMTP id a640c23a62f3a-b07c37dca1emr487688066b.31.1757725771595;
        Fri, 12 Sep 2025 18:09:31 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07da7a8918sm104574066b.56.2025.09.12.18.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:09:31 -0700 (PDT)
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
Subject: [PATCH RESEND 27/62] init: alpha: remove "extern unsigned long initrd_start, initrd_end"
Date: Sat, 13 Sep 2025 00:38:06 +0000
Message-ID: <20250913003842.41944-28-safinaskar@gmail.com>
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

These variables already declared in <linux/initrd.h>, which is
included

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/alpha/kernel/core_irongate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/core_irongate.c b/arch/alpha/kernel/core_irongate.c
index 05dc4c1b9074..3411564144ae 100644
--- a/arch/alpha/kernel/core_irongate.c
+++ b/arch/alpha/kernel/core_irongate.c
@@ -225,8 +225,6 @@ albacore_init_arch(void)
 	alpha_mv.min_mem_address = pci_mem;
 	if (memtop > pci_mem) {
 #ifdef CONFIG_BLK_DEV_INITRD
-		extern unsigned long initrd_start, initrd_end;
-
 		/* Move the initrd out of the way. */
 		if (initrd_end && __pa(initrd_end) > pci_mem) {
 			unsigned long size;
-- 
2.47.2


