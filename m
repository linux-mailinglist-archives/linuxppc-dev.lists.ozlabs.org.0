Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9495516F670
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:27:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S2nk3H5RzDqfs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:27:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q3Jsef18; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S2NN6jtTzDqcc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:08:36 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id r77so616047pgr.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 20:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U6WL9Y/MTZo3dWx1aWHSwPME6m+tIQJX3bqtQMSqhek=;
 b=q3Jsef18HDij0wjkTzfcCJNemWBgaAV/oo559gfI6J428X7tyqUJxBcwzaRAhRgF1w
 uV5zkvE5ICgA5Y9+0eTt0146PQJE+tK2fWr+kMvx6CLct/DY3t5Iau/9IaxidBeYnjbj
 BS324rxxuX8cT3C3ler799k5pt388LRWTcLvkz367X4j99giw3kB5sYXaK3oAoSHiDkw
 uxLUP1+8ibf6b/4TbqMT1L/kVB/ICdUgYplxTPrS9jHLzFTNaB1adLTTP0sav2bU2FA1
 lXYWKnE82lw2IR/0IJRq1Ybw4yj98C85xnFa7ArQyZOLOI9uOVjqxbtZ/pg1iECJjsPR
 vLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U6WL9Y/MTZo3dWx1aWHSwPME6m+tIQJX3bqtQMSqhek=;
 b=Z7oNIEL/Ooj3lhRKMKFYsnmAqn0m1fzjLTrhCjOQi/rLQW1K75IMaFLf3OkcgXsFGZ
 qekviTBWz9KK62QxkznMU41e0sZ5R9b/yPrqONXN4gQ9QfYB7ayVL9waMlOp3mYeQxmO
 jQt+2kJJyvAGSMPN4r+W2sgSKfEvncYq+droUghYGXcKdJektujCPCvqlmuL8dawyEod
 xXEkGbaZTnxGVow3I2ca3Ly0ctG8xaPPunGPsUkBupPSmHBC2WK3iTkXV+zeakiF4R/b
 7/83lxL4hrHrP6S/9RUT5rF0qw6mw5igm9TqX+5h0+k/DaJjhhB5VOQZ2ASKvfPE3S/j
 AyUw==
X-Gm-Message-State: APjAAAXBDP0XQDH+n6zjER+KHzqDL6QWLgm2EFE6MgK1n96VQhPFbG0Y
 PYvMqig+08hgKLWcTXEerz2l8Ko3A7k=
X-Google-Smtp-Source: APXvYqwL+y0CJxWv/vIF6mdr2pEtIuDec3mR9ZVLl921PExns0U9HicPH0P/i3G5u0rJF8p5v1/aZQ==
X-Received: by 2002:a62:f94d:: with SMTP id g13mr2171598pfm.60.1582690114922; 
 Tue, 25 Feb 2020 20:08:34 -0800 (PST)
Received: from tee480.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d4sm604681pjg.19.2020.02.25.20.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 20:08:34 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/14] powerpc/xmon: Remove store_inst() for
 patch_instruction()
Date: Wed, 26 Feb 2020 15:07:10 +1100
Message-Id: <20200226040716.32395-9-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226040716.32395-1-jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: alistair@popple.id.au, bala24@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For modifying instructions in xmon, patch_instruction() can serve the
same role that store_inst() is performing with the advantage of not
being specific to xmon. In some places patch_instruction() is already
being using followed by store_inst(). In these cases just remove the
store_inst(). Otherwise replace store_inst() with patch_instruction().

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/xmon/xmon.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 897e512c6379..a673cf55641c 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -325,11 +325,6 @@ static inline void sync(void)
 	asm volatile("sync; isync");
 }
 
-static inline void store_inst(void *p)
-{
-	asm volatile ("dcbst 0,%0; sync; icbi 0,%0; isync" : : "r" (p));
-}
-
 static inline void cflush(void *p)
 {
 	asm volatile ("dcbf 0,%0; icbi 0,%0" : : "r" (p));
@@ -882,8 +877,7 @@ static struct bpt *new_breakpoint(unsigned long a)
 	for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
 			bp->address = a;
-			bp->instr[1] = bpinstr;
-			store_inst(&bp->instr[1]);
+			patch_instruction(&bp->instr[1], bpinstr);
 			return bp;
 		}
 	}
@@ -913,7 +907,7 @@ static void insert_bpts(void)
 			bp->enabled = 0;
 			continue;
 		}
-		store_inst(&bp->instr[0]);
+		patch_instruction(&bp->instr[0], bp->instr[0]);
 		if (bp->enabled & BP_CIABR)
 			continue;
 		if (patch_instruction((unsigned int *)bp->address,
@@ -923,7 +917,6 @@ static void insert_bpts(void)
 			bp->enabled &= ~BP_TRAP;
 			continue;
 		}
-		store_inst((void *)bp->address);
 	}
 }
 
@@ -958,8 +951,6 @@ static void remove_bpts(void)
 			(unsigned int *)bp->address, bp->instr[0]) != 0)
 			printf("Couldn't remove breakpoint at %lx\n",
 			       bp->address);
-		else
-			store_inst((void *)bp->address);
 	}
 }
 
-- 
2.17.1

