Return-Path: <linuxppc-dev+bounces-12163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5642B566D7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 06:40:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPb7R5jyDz3d8F;
	Sun, 14 Sep 2025 14:40:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822267;
	cv=none; b=Vc1OaUJCPSEKDQBVncbQOBe+6wKV0f4DJlvJa/Xh3aQUSl7WrOk4mViXizj1ka0PwkxS87IBZaTK7vnX+jQRyUmWitJZZI+w9I24rMYmQ0X++rQN9wfWy2tLFwpWYUhXkkf2yi30vwck2or+bWAYGBvnJbfc00fog/q4mnrgIUYD4sggpVKum+Ah9Zq6MDKveTuNPoApyuXb04g1qIgWSmSZyOqFRQujg9QWt0aLTQBujTXvHypJjBL5S3TNEcFvjQsAzkWyVV0Xxf1iEC0lArLgDhctU5nC+boORlnwTYuPpV1wFo9aLo8l50McYBE8/31TQ0nB3HpyTyLeyJSI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822267; c=relaxed/relaxed;
	bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brrcykrH2Rg5PPMOoW+lBf40Mpg/JwwPXFtW6K1yjK0u1nVy8fFBJh5jgwBfQ0OaYmId/V9koquQcn0fEua7SQLMTR8NjXLOsQkvO8s+f1QX6en/8l14QeW9qbHYU/KsCBhSweQOWpnncYV+Yo2U6nEQDBQZl5AbipBM7iQuYiITX7rIquvtt0pPsEn6aklrMD4V1eqnHhP1cFDq0Lc6BQA3XmZETywQga9qQjbJ3CGFEmNTe7nsNbpolXaNz1g0PO4zj+b9yY8JNdAM1rvHfNdNqy9bfFFDT5fsrYkEf7ecrSvp5LLdjBSA4uyf7Oh9Hpnx+PbTu4050JoXhmlDUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NaZNc5Dv; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NaZNc5Dv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZBL4SMZz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:57:46 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b04ba3de760so404121366b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822264; x=1758427064; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=NaZNc5DvqK66tI+QBPOOgNS77uvNSoDTAiMFNWO/nZt82wGgO7HhP+g1X7HJp1v2Qc
         lOp009X7/dICgjObdH3lcM2uSAtzoaO4u1ZcnlgX8wnoCZwSR/p/Vfw5iNpuKBcyTcp+
         gM53iQafv0IqdeCuj7mLMK7B3FMwo/4ckXmchfWWltNclj6a3btsqpdPUAb5b7lijEj+
         aJWqTJ2Rbo9eDctJ6ow5jflhAISs1JtMzUnD+xPOMlyQ4gzbJ7GM++syg5nL5JoLGdCe
         SXRzoTR4zG38Xp5zQAHsqQc2ZCYa11oYo0lD5YhYWVdskeghcwx0Sft0CfuFWWMsIMvN
         N4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822264; x=1758427064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLgSWRUhBJ+Eb73oE0EhwiwscJ+skfUSjN5GwJ3O/gU=;
        b=Nqr0VU1RoY2/TMT5bdbns44dna5/nV1wpf+R4M+d6eOEWVc4dMA2H3PQpJME6b8uTn
         L/a5PY7w6bDKT9IzkweOcymWm5uVvRBFRp/i2jsxsBYMLBAqHYcxERRzSI5UkZ9kY6ES
         mIb3M6stwmFwMSEOIyNffT85BGJ3tHjbj0qsZRFKHZBA3apxfH/thdoyW4PrDOiRBtJo
         G+UNWw128FK2Vts7VPWmU6fMJjrevCJr6oIWQWE7RDQlEa11ETzlq4kcjTBqBz/Es/eE
         AxI0DO8HviT6kBfd1hg2LPt9e9SakqK5tFhc/M6+6/GRQqmGhsLizzDgChP0N9nF2N0e
         4rvA==
X-Forwarded-Encrypted: i=1; AJvYcCW12gwjTOYKEki5v8GT1TvTuRZxR/2gSXUYxM+0sowhbBSWyt3Msvz2E4Ax+Ea2XGGFpLZK8n2WL1lArDk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwY9KAmQJ9SVQ3TroJ/T1TSl60AMglGvvCgyxAmyd4NrAx6Jtx3
	wLokWUyfSfSxBpJtDffmMNfA1Enyaibteia/7SU6e7o+pyQ3zgC6Typa
X-Gm-Gg: ASbGnct1KuL3RtLrvA+WjrHbTrSYO5wfa5xANoEegqddVw7+JX8GQCEe9wSTBdUmnt+
	qfl0YNkK14qpFEbZjyJLztKrQsfBJDovLmaTjjDD3YOcc2HUKiGei8/dbXmQbAvAj/SM8mfXUyd
	yqpXWlwVoAAyWlyToc75HLHJqNmHSxm39Y/02yO2+fFgJSt8RE1wB1hZ9+Wl93BWFgafvRrXqs5
	OkkMGJCpJYoXLARVY7QOh+9/7G4LzCGRHFRh7NdhZOlG+nTiz01zpAq2DolJ9OrfaQXpddmIIDc
	OXz7a/SDdYtZHHRYyb75zOJPNwgsG/lOcNTfhwBuPR58BCh4ivDQ/hAYZcaF7MVqwUc1+hrUEfL
	vY2RT2gwXs+gpVC+6ajxvP5kM5V9krA==
X-Google-Smtp-Source: AGHT+IGOdPvfXOVddm8G6LJhfH2nNJDoTTLKR/3NE7kowNRoQPIuzhxmV+feQvXrrMYzfjsz5Ubcxg==
X-Received: by 2002:a17:906:a84d:b0:b07:cf04:8a43 with SMTP id a640c23a62f3a-b07cf049441mr520202566b.41.1757822263792;
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b31287cesm676665366b.30.2025.09.13.20.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:57:43 -0700 (PDT)
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
Subject: [PATCH RESEND 50/62] init: rename ramdisk_command_access to initramfs_command_access
Date: Sun, 14 Sep 2025 06:57:38 +0300
Message-ID: <20250914035738.3741007-1-safinaskar@gmail.com>
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
 init/main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/init/main.c b/init/main.c
index cbebd64f523c..a42f1f0fce84 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1587,11 +1587,11 @@ static noinline void __init kernel_init_freeable(void)
 	 * check if there is an early userspace init.  If yes, let it do all
 	 * the work
 	 */
-	int ramdisk_command_access;
-	ramdisk_command_access = init_eaccess(initramfs_execute_command);
-	if (ramdisk_command_access != 0) {
+	int initramfs_command_access;
+	initramfs_command_access = init_eaccess(initramfs_execute_command);
+	if (initramfs_command_access != 0) {
 		pr_warn("check access for rdinit=%s failed: %i, ignoring\n",
-			initramfs_execute_command, ramdisk_command_access);
+			initramfs_execute_command, initramfs_command_access);
 		initramfs_execute_command = NULL;
 		prepare_namespace();
 	}
-- 
2.47.2


