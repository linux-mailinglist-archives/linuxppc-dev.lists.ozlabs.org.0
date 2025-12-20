Return-Path: <linuxppc-dev+bounces-14920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CB5CD2F6F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Dec 2025 13:58:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dYPbd3Zq3z2yFQ;
	Sat, 20 Dec 2025 23:58:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.10.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766235517;
	cv=none; b=HV8BNQkIy7DOixt1wBoW3dCCewAODgRbN9Cut8JDfrlC67VS75WdE5FPTwP2Qtvti79fpnzGWcFUGN7oJmHh8K+mVeUq9RMdDoPFRC9mfwHTImDHr38q0+ZPGYCfQFJuh+hPINJ8h8n7qTFfPpUk+Z3d0dNxObQZckA1SC9CN/Z9Ih9pYlzjZtKEIHkf2DVzkBeetkkH4IMG8dwS7wgWlWKYM1TqIblfqRwAETzhoSqdaVLfProTgVm5sb0GNNdhiqOeu0Q9B2oO+bzTlji46cGWHlM+/og6NyttQMbkxeW50LChZ8P2UbXxrqaxbXczmNcolEXzXHYB2fGos9IPxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766235517; c=relaxed/relaxed;
	bh=bIk7+Oeov4iE49MSABnClqVr3hXCaOM4JLVr8/OtUKg=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=i251FzU1aNa2dKZDlDP3wWgA64yQp+OT5bLzv8Y38/yfLPUWymrpaXDUSrNLqf1QojhJWLQHxTZheDvDt6ctZFpQ9QiUJi6K1bJQQsna6aTalj8ipznwXrlwo+Zh+H6VrLGDTLoNOkqwoaEx7IAh80qytgSH0GVbcwsjwgP/Vwl+p+ljh2Q2AK/piRFNjTNww2XAQVV3O/oXh5MXVHyKSLl6ItI4T1zcVAJfmwyk/yc1dU6EBpzHnki0OvQDoZPfEoaKjQzCMemrGDf2+6pwvLDeYkQWWDmugJvXAYpw9H7Tw8uqQfBuFZmmk4LhbA1kwQ7+EcZsB99E4xi5rwtUhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de; dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=nuXbbARs; dkim-atps=neutral; spf=pass (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org) smtp.mailfrom=exactco.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.a=rsa-sha256 header.s=x header.b=nuXbbARs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=exactco.de (client-ip=176.9.10.151; helo=exactco.de; envelope-from=rene@exactco.de; receiver=lists.ozlabs.org)
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dYPbZ4Q8vz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Dec 2025 23:58:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=bIk7+Oeov4iE49MSABnClqVr3hXCaOM4JLVr8/OtUKg=; b=n
	uXbbARs7+OzEqb/SX/d7JYixx44tQue1PfiJJQfM0Ibf8xntcNgzRuDlN5DHUgpaSrRTyhJKPBg/p
	5m2kHFMfvNqpgaT2/SlMApm0miM04utkzLuffw3Cy3BMcZM8asxxVvxZlhI6/eH+DllUeylEARjyZ
	JlbUepXnnYAKLrzuuXY7BJvawrn72mzLNPVtjbUkRoeVVsdaHQWPdrU6UoQJ1fXUFjLy/YH7qNdOh
	DSRr/87W++NuMXsbIY0IefwePu8WTtGc9fOQG0Liz34dzGqBzi8wvkUGVx7/gMsH5AMvq2elEhs6O
	6FSCkXv+vESFGSzw6yvMaK2o0HHEX06qQ==;
Date: Sat, 20 Dec 2025 13:58:41 +0100 (CET)
Message-Id: <20251220.135841.1580468505634251616.rene@exactco.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] partitions: mac: fix exposing free space as partitions
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
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
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The mac partitions code creates partitions for unallocated, free
space, and even the partition map itself. Fix by checking the VALID
and ALLOCATED bits. Fix checkpatch trailing whitespace error while at
it.

t2:/# parted /dev/sda print free
Disk /dev/sda: 34.4GB
Sector size (logical/physical): 512B/512B
Partition Table: mac
Disk Flags:
Number  Start   End     Size    File system  Name   Flags
 1      512B    32.8kB  32.3kB               Apple
        32.8kB  99.6MB  99.6MB  Free Space
 2      99.6MB  1000MB  901MB                linux
        1000MB  34.4GB  33.4GB  Free Space

before:
[   67.108282]  sda: [mac] sda1 sda2 sda3 sda4

patched:
[   67.108110]  sda: [mac] sda2

Signed-off-by: René Rebe <rene@exactco.de>
---
 block/partitions/mac.c | 9 ++++++---
 block/partitions/mac.h | 2 ++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/partitions/mac.c b/block/partitions/mac.c
index b02530d98629..fc0ba1c8ec6e 100644
--- a/block/partitions/mac.c
+++ b/block/partitions/mac.c
@@ -96,9 +96,12 @@ int mac_partition(struct parsed_partitions *state)
 		part = (struct mac_partition *) (data + pos%512);
 		if (be16_to_cpu(part->signature) != MAC_PARTITION_MAGIC)
 			break;
+		if ((be32_to_cpu(part->status) & (MAC_STATUS_VALID | MAC_STATUS_ALLOCATED)) !=
+		    (MAC_STATUS_VALID | MAC_STATUS_ALLOCATED))
+			continue;
 		put_partition(state, slot,
-			be32_to_cpu(part->start_block) * (secsize/512),
-			be32_to_cpu(part->block_count) * (secsize/512));
+				be32_to_cpu(part->start_block) * (secsize/512),
+				be32_to_cpu(part->block_count) * (secsize/512));
 
 		if (!strncasecmp(part->type, "Linux_RAID", 10))
 			state->parts[slot].flags = ADDPART_FLAG_RAID;
@@ -112,7 +115,7 @@ int mac_partition(struct parsed_partitions *state)
 
 			mac_fix_string(part->processor, 16);
 			mac_fix_string(part->name, 32);
-			mac_fix_string(part->type, 32);					
+			mac_fix_string(part->type, 32);
 		    
 			if ((be32_to_cpu(part->status) & MAC_STATUS_BOOTABLE)
 			    && strcasecmp(part->processor, "powerpc") == 0)
diff --git a/block/partitions/mac.h b/block/partitions/mac.h
index 0e41c9da7532..10828c5d53d2 100644
--- a/block/partitions/mac.h
+++ b/block/partitions/mac.h
@@ -30,6 +30,8 @@ struct mac_partition {
 	/* there is more stuff after this that we don't need */
 };
 
+#define MAC_STATUS_VALID	1	/* partition is valid */
+#define MAC_STATUS_ALLOCATED	2	/* partition is allocated */
 #define MAC_STATUS_BOOTABLE	8	/* partition is bootable */
 
 #define MAC_DRIVER_MAGIC	0x4552
-- 
2.52.0


-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

