Return-Path: <linuxppc-dev+bounces-912-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D579969B6C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 13:19:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wyjp45VZGz2xZj;
	Tue,  3 Sep 2024 21:19:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725362396;
	cv=none; b=j1d9IB/KjAIZVGxE7Zs7hVkoi3DidjH08oUDHrpy3YN5BXHkE+ddW2JMw+0hWqVe5CW26TY0sS/516PM6QZaGKWX3ZHzjY+5gN/0Dh2zwU8UDtXzqzo7nh65FaGt5xW7B21xpnp1Fpo3fvNTE8xFdZ6oqlDM0bMpHNxGy5kmiY+kJ20Cjst5VGndkEOZlVGQzzR+aSeYDVLD6+I5XvlWkiNf/TOOLysJ9Cj/hZmBxUBbP8OyLdo96KbTqVWQhAWxpVzjIw5OsEK2ze6DHG/8Lm4vatliAMrZz8dvxd729KpQozjPyLHW/n67WHw93a0XcykcoOBi5dM9x7KmeG3FfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725362396; c=relaxed/relaxed;
	bh=0XWe4jlkjRvvT5OZDQf9KggcfIeIrKPURNrmTo4iNzg=;
	h=DKIM-Signature:From:To:Subject:Date:Message-ID:MIME-Version; b=NC2rK60E25B8hQBKc6a90ygbxirPoPwjxahQhYB0H3318UdbpNBy+UCsNR+NpUd8u9HZwqtn4kkwjfbAJW1kp+CR5zXGvVgiL2Cv5ilikHHRL4LQRXWo4+6PD6mlF+rTb2/tPzV2CDdq3BjEfChdjDx0JjDUm+u8rL2GVF+FUYb3c6d7ZIcH+4wNq0uaMyF1sUmeyoIUTRlqWZtb68V39n3iyKRibPgJZ7Ty/JZS36vc+7AZOi6J84YyYyWKTUmK9JE8Fqm78Gm6fCD3kSamjF8+pkIDfKLKxqNcFwuyZKGGByUkxA8/mWvVsUKQAS/GberuZv8u5gXJp7KLHsNFnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lTBizGzn; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lTBizGzn;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wyjp34kHDz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 21:19:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725362395;
	bh=0XWe4jlkjRvvT5OZDQf9KggcfIeIrKPURNrmTo4iNzg=;
	h=From:To:Subject:Date:From;
	b=lTBizGznFRaxenmCe0NW2a53KBfwzWtQtR9oDGNLyRU0BIEZixZccOlaLpSCNbh6M
	 CuiJ9kDNsg817l15b09ObF1PCJVrNtA5KvP1rM+Zpp8PQYMDzfaB+QsZV6k6meSlL7
	 yaPoBU4UCB0gTM5gv+o1Cz9BRKM7i3FQfI1wiOPDkApYiSfoSkTID5Z9h3/NXBS6PW
	 WIuMliFCryTvf6boJvDmi36eN1IJY4BjxqHzmrIc7G6XYAUGcW4LVdNlJPxrWt2ru8
	 X36w+dc95DzReNXKxn1aNwJ/IMeGRG45N/XKYHBiohCUN253CNyScNvt1/UhekJhLn
	 pDLQ+6hOIKcDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wyjp26y9Rz4wnt;
	Tue,  3 Sep 2024 21:19:54 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Stop using no_llseek
Date: Tue,  3 Sep 2024 21:19:51 +1000
Message-ID: <20240903111951.141376-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 868941b14441 ("fs: remove no_llseek"), no_llseek() is
simply defined to be NULL, and a NULL llseek means seeking is
unsupported.

So for statically defined file_operations, such as all these, there's no
need or benefit to set llseek = no_llseek.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/eeh.c                    |  4 ----
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c    |  1 -
 arch/powerpc/platforms/cell/spufs/file.c     | 17 -----------------
 arch/powerpc/platforms/powernv/eeh-powernv.c |  1 -
 arch/powerpc/platforms/pseries/dtl.c         |  1 -
 5 files changed, 24 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index d03f17987fca..2f7f0efd564a 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1682,7 +1682,6 @@ static ssize_t eeh_force_recover_write(struct file *filp,
 
 static const struct file_operations eeh_force_recover_fops = {
 	.open	= simple_open,
-	.llseek	= no_llseek,
 	.write	= eeh_force_recover_write,
 };
 
@@ -1726,7 +1725,6 @@ static ssize_t eeh_dev_check_write(struct file *filp,
 
 static const struct file_operations eeh_dev_check_fops = {
 	.open	= simple_open,
-	.llseek	= no_llseek,
 	.write	= eeh_dev_check_write,
 	.read   = eeh_debugfs_dev_usage,
 };
@@ -1846,7 +1844,6 @@ static ssize_t eeh_dev_break_write(struct file *filp,
 
 static const struct file_operations eeh_dev_break_fops = {
 	.open	= simple_open,
-	.llseek	= no_llseek,
 	.write	= eeh_dev_break_write,
 	.read   = eeh_debugfs_dev_usage,
 };
@@ -1893,7 +1890,6 @@ static ssize_t eeh_dev_can_recover(struct file *filp,
 
 static const struct file_operations eeh_dev_can_recover_fops = {
 	.open	= simple_open,
-	.llseek	= no_llseek,
 	.write	= eeh_dev_can_recover,
 	.read   = eeh_debugfs_dev_usage,
 };
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 2bd6abcdc113..1ea591ec6083 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -644,7 +644,6 @@ static int mpc52xx_wdt_release(struct inode *inode, struct file *file)
 
 static const struct file_operations mpc52xx_wdt_fops = {
 	.owner		= THIS_MODULE,
-	.llseek		= no_llseek,
 	.write		= mpc52xx_wdt_write,
 	.unlocked_ioctl = mpc52xx_wdt_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
diff --git a/arch/powerpc/platforms/cell/spufs/file.c b/arch/powerpc/platforms/cell/spufs/file.c
index 7f4e0db8eb08..d5a2c77bc908 100644
--- a/arch/powerpc/platforms/cell/spufs/file.c
+++ b/arch/powerpc/platforms/cell/spufs/file.c
@@ -453,7 +453,6 @@ static const struct file_operations spufs_cntl_fops = {
 	.release = spufs_cntl_release,
 	.read = simple_attr_read,
 	.write = simple_attr_write,
-	.llseek	= no_llseek,
 	.mmap = spufs_cntl_mmap,
 };
 
@@ -634,7 +633,6 @@ static ssize_t spufs_mbox_read(struct file *file, char __user *buf,
 static const struct file_operations spufs_mbox_fops = {
 	.open	= spufs_pipe_open,
 	.read	= spufs_mbox_read,
-	.llseek	= no_llseek,
 };
 
 static ssize_t spufs_mbox_stat_read(struct file *file, char __user *buf,
@@ -664,7 +662,6 @@ static ssize_t spufs_mbox_stat_read(struct file *file, char __user *buf,
 static const struct file_operations spufs_mbox_stat_fops = {
 	.open	= spufs_pipe_open,
 	.read	= spufs_mbox_stat_read,
-	.llseek = no_llseek,
 };
 
 /* low-level ibox access function */
@@ -769,7 +766,6 @@ static const struct file_operations spufs_ibox_fops = {
 	.open	= spufs_pipe_open,
 	.read	= spufs_ibox_read,
 	.poll	= spufs_ibox_poll,
-	.llseek = no_llseek,
 };
 
 static ssize_t spufs_ibox_stat_read(struct file *file, char __user *buf,
@@ -797,7 +793,6 @@ static ssize_t spufs_ibox_stat_read(struct file *file, char __user *buf,
 static const struct file_operations spufs_ibox_stat_fops = {
 	.open	= spufs_pipe_open,
 	.read	= spufs_ibox_stat_read,
-	.llseek = no_llseek,
 };
 
 /* low-level mailbox write */
@@ -901,7 +896,6 @@ static const struct file_operations spufs_wbox_fops = {
 	.open	= spufs_pipe_open,
 	.write	= spufs_wbox_write,
 	.poll	= spufs_wbox_poll,
-	.llseek = no_llseek,
 };
 
 static ssize_t spufs_wbox_stat_read(struct file *file, char __user *buf,
@@ -929,7 +923,6 @@ static ssize_t spufs_wbox_stat_read(struct file *file, char __user *buf,
 static const struct file_operations spufs_wbox_stat_fops = {
 	.open	= spufs_pipe_open,
 	.read	= spufs_wbox_stat_read,
-	.llseek = no_llseek,
 };
 
 static int spufs_signal1_open(struct inode *inode, struct file *file)
@@ -1056,7 +1049,6 @@ static const struct file_operations spufs_signal1_fops = {
 	.read = spufs_signal1_read,
 	.write = spufs_signal1_write,
 	.mmap = spufs_signal1_mmap,
-	.llseek = no_llseek,
 };
 
 static const struct file_operations spufs_signal1_nosched_fops = {
@@ -1064,7 +1056,6 @@ static const struct file_operations spufs_signal1_nosched_fops = {
 	.release = spufs_signal1_release,
 	.write = spufs_signal1_write,
 	.mmap = spufs_signal1_mmap,
-	.llseek = no_llseek,
 };
 
 static int spufs_signal2_open(struct inode *inode, struct file *file)
@@ -1195,7 +1186,6 @@ static const struct file_operations spufs_signal2_fops = {
 	.read = spufs_signal2_read,
 	.write = spufs_signal2_write,
 	.mmap = spufs_signal2_mmap,
-	.llseek = no_llseek,
 };
 
 static const struct file_operations spufs_signal2_nosched_fops = {
@@ -1203,7 +1193,6 @@ static const struct file_operations spufs_signal2_nosched_fops = {
 	.release = spufs_signal2_release,
 	.write = spufs_signal2_write,
 	.mmap = spufs_signal2_mmap,
-	.llseek = no_llseek,
 };
 
 /*
@@ -1343,7 +1332,6 @@ static const struct file_operations spufs_mss_fops = {
 	.open	 = spufs_mss_open,
 	.release = spufs_mss_release,
 	.mmap	 = spufs_mss_mmap,
-	.llseek  = no_llseek,
 };
 
 static vm_fault_t
@@ -1401,7 +1389,6 @@ static const struct file_operations spufs_psmap_fops = {
 	.open	 = spufs_psmap_open,
 	.release = spufs_psmap_release,
 	.mmap	 = spufs_psmap_mmap,
-	.llseek  = no_llseek,
 };
 
 
@@ -1732,7 +1719,6 @@ static const struct file_operations spufs_mfc_fops = {
 	.flush	 = spufs_mfc_flush,
 	.fsync	 = spufs_mfc_fsync,
 	.mmap	 = spufs_mfc_mmap,
-	.llseek  = no_llseek,
 };
 
 static int spufs_npc_set(void *data, u64 val)
@@ -2102,7 +2088,6 @@ static ssize_t spufs_dma_info_read(struct file *file, char __user *buf,
 static const struct file_operations spufs_dma_info_fops = {
 	.open = spufs_info_open,
 	.read = spufs_dma_info_read,
-	.llseek = no_llseek,
 };
 
 static void spufs_get_proxydma_info(struct spu_context *ctx,
@@ -2159,7 +2144,6 @@ static ssize_t spufs_proxydma_info_read(struct file *file, char __user *buf,
 static const struct file_operations spufs_proxydma_info_fops = {
 	.open = spufs_info_open,
 	.read = spufs_proxydma_info_read,
-	.llseek = no_llseek,
 };
 
 static int spufs_show_tid(struct seq_file *s, void *private)
@@ -2442,7 +2426,6 @@ static const struct file_operations spufs_switch_log_fops = {
 	.read		= spufs_switch_log_read,
 	.poll		= spufs_switch_log_poll,
 	.release	= spufs_switch_log_release,
-	.llseek		= no_llseek,
 };
 
 /**
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 3d072a7455bf..db3370d1673c 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -99,7 +99,6 @@ static ssize_t pnv_eeh_ei_write(struct file *filp,
 
 static const struct file_operations pnv_eeh_ei_fops = {
 	.open	= simple_open,
-	.llseek	= no_llseek,
 	.write	= pnv_eeh_ei_write,
 };
 
diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index 3f1cdccebc9c..8cb9d36ea491 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -325,7 +325,6 @@ static const struct file_operations dtl_fops = {
 	.open		= dtl_file_open,
 	.release	= dtl_file_release,
 	.read		= dtl_file_read,
-	.llseek		= no_llseek,
 };
 
 static struct dentry *dtl_dir;
-- 
2.46.0


