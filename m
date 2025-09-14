Return-Path: <linuxppc-dev+bounces-12174-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6546BB566FA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 07:31:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPcGf2BNsz3cmC;
	Sun, 14 Sep 2025 15:31:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757822016;
	cv=none; b=WOfzq//fOyRE/gU5eP34H/5dJ1DLC+TpG3HnDSVEzxdFgo3Jkzr+eeUXKOM+tedVaqvr7+LnwtWTqeukEKuiu2LcexoVrLPoOF34Xbqc3ir0sNGDnenlGMy9iqkNmkkQjFgM6B6j8LPBsUQhR8R5fm6GgX9W9qiYSBPU0YoC2j0jxBsNqR5RjE2lG2ZWeOmFApLPlB59BInlnSGy6BZ5OCoROGiNMeo4DuDu0wvOCBbEG8wWG3sYhaWKhVQ5P743kZjVZnhDnMXatmmV18plOO8XRBhStxPc/3kF3hLR1u5N0WpYFXlExNknhoWyC8xATEoUpcBAPdJIBpDVxtjTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757822016; c=relaxed/relaxed;
	bh=PB2E9PPBAv72v29AyxICCzYyZlb0WEV+ovfXoPOatKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Svj73TYLMaUOQU4neQgQDHSVw4CAdLEAc/NOd1pEq+w1yzcplB3tRRzrO6OIlHbZJuW25zOHGiDQEB7+7yF5AhrPC7HBE7zdyEhI8h2pOcu//Y8TS007HTrRwmPCFTj36ftQXXukKo5HVRs8imMiV5Lj0F0Bd14gmsMtlrotI2+761LAeVLQaV7IOeu5tXb3pGY9HNW60aDZKHbYzyI5HLJFhGd5CvaJZxjmb02B1c0Ym7ehQuFTch8VCFkiiPYZO9dB09WfKvPHquSHmHY3qe+EcDXEq2DsTr8eioRmtHPLyPavr37P24RM6aN08d8KdzhtAU46LbpsdL6IBD2+AQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R3bT3k1L; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R3bT3k1L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPZ5W4vYDz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Sep 2025 13:53:35 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-62ef469bb2cso2847380a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 20:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822013; x=1758426813; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB2E9PPBAv72v29AyxICCzYyZlb0WEV+ovfXoPOatKs=;
        b=R3bT3k1LoU0CP1Ni/x8nWWXTewRch+VN6og/wrhNGmVi1/jkvzldSd9WtJm6F7DtTO
         v/0WAUblpQgt+vsoZcNwzEP6p7ONgMMsDkW/H21z48XSd/5XZXie0qfaFqS7MrpJDIeE
         Hh9iyyinu/DPQvVG/3k6dZo/bpyilXYPg3sgITYxY5ZCcwE7uK2g10utizUdeBXs0mjk
         5YToVOjvjY70KddUlG4DQLmyUIjCR04YYVBtFeC/0+hZB85rp9CdYMxfakLX/06vwHuI
         pP7/sv/Ja2PRvuraWKHYldqfZZfPycJWwlKZvDBdxR35btp871CPIzzyIDZDs2qyhKFv
         9lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822013; x=1758426813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PB2E9PPBAv72v29AyxICCzYyZlb0WEV+ovfXoPOatKs=;
        b=AHUgVo3/zncbQz9Hw/t2mhIAjvGTf1XR+q+0yGjOotIT5XMCriXuZ8h1pgdXcOxj4w
         sQSzum6RGrmugQa9sWN7wWp19UBK27R2yhH/TAvJPgiwTF9kqZaUqMCVq0nkKSR1zTHY
         q9TPWlNc1Aqr8xNIz/as+tRtrIZNCtSlAh8cqYq0lpLqp9iD5AjbuPwhuD4brgbY7vgg
         mLgq1z6YVZBxeD8vrwZnVAmsOiVvhah7xaaT7p4AgxLjApJBG1LiWaE/lGzOQMnlNCnr
         S7Vj1EqTJ0oVQRaWDKpIdvWK7Zmg3Ht/v00h0VYgCMZhEIP0BYBDS2YNwOgKd8QxB494
         dhJA==
X-Forwarded-Encrypted: i=1; AJvYcCU/xqPShqTxHdTJNIxgZPDzQgDHSa2gAneFD67U5CBF8J8gpCjpwRhjtAGAWdQkPOSizo6sQ4f7axzxYi4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHvP1/pGXi+OHDqHljnlFehxMjcbJgA3MwLTcta28JVUV84dFd
	hxYCkMx+B5xhwDPMkBGAyBVNk8QcfFkP5zkNIgF8QVYU71yU2o5QV3o/
X-Gm-Gg: ASbGncuZcAdxoyEvvdl1KSlfpSHcZifPA4m1euzNRodcSvb3C1jprB0/TGKTrDYji/O
	h+JhJktFxZ4aRVoSruEoOcx/Mb6eCDTUjA/ATLL/qkeBE7WP8C5F1EFgy+nw2VwrXyn0JRqLsKy
	zYNsnlRM01awwdVY5+VE1hcsTGttuvP1Ffu8pyiXZGCF2SyjdYLNzdWVv1RHZ/eCFAoDGaurjOo
	65KyfF4C35bx7QQVIlYdjsgFhNrHUhlB7Jy1G7xVNobZfEs7ieNUGJfp10bDaWvDNWdyhKe1zzE
	3gAJ0jILGKUh5xOCmadgK/zixE5uWJT1TP7eAGASLYD5w/GRQo5PPOaI8oCzfHUCSrypjq69Kdf
	6NeM8idm/bKuLuFebm/GLYL+CbNjTog==
X-Google-Smtp-Source: AGHT+IGUQXhZVcMzH5x4qrxgNQpCZ4sYyZ3ugDsvfNumu2I8pECs9df4oC+H+CMnm997jPnr5crTug==
X-Received: by 2002:a05:6402:2111:b0:61d:2096:1e92 with SMTP id 4fb4d7f45d1cf-62ed82614c4mr7020136a12.15.1757822012514;
        Sat, 13 Sep 2025 20:53:32 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f3a5esm6570485a12.30.2025.09.13.20.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:53:32 -0700 (PDT)
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
Subject: [PATCH RESEND 43/62] setsid: inline ksys_setsid into the only caller
Date: Sun, 14 Sep 2025 06:53:26 +0300
Message-ID: <20250914035326.3661003-1-safinaskar@gmail.com>
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
 include/linux/syscalls.h | 1 -
 kernel/sys.c             | 7 +------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 77f45e5d4413..75e9ee03d19b 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1231,7 +1231,6 @@ int ksys_fchown(unsigned int fd, uid_t user, gid_t group);
 ssize_t ksys_read(unsigned int fd, char __user *buf, size_t count);
 void ksys_sync(void);
 int ksys_unshare(unsigned long unshare_flags);
-int ksys_setsid(void);
 int ksys_sync_file_range(int fd, loff_t offset, loff_t nbytes,
 			 unsigned int flags);
 ssize_t ksys_pread64(unsigned int fd, char __user *buf, size_t count,
diff --git a/kernel/sys.c b/kernel/sys.c
index 1e28b40053ce..66e1e2dfd585 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1265,7 +1265,7 @@ static void set_special_pids(struct pid **pids, struct pid *pid)
 		change_pid(pids, curr, PIDTYPE_PGID, pid);
 }
 
-int ksys_setsid(void)
+SYSCALL_DEFINE0(setsid)
 {
 	struct task_struct *group_leader = current->group_leader;
 	struct pid *sid = task_pid(group_leader);
@@ -1300,11 +1300,6 @@ int ksys_setsid(void)
 	return err;
 }
 
-SYSCALL_DEFINE0(setsid)
-{
-	return ksys_setsid();
-}
-
 DECLARE_RWSEM(uts_sem);
 
 #ifdef COMPAT_UTS_MACHINE
-- 
2.47.2


