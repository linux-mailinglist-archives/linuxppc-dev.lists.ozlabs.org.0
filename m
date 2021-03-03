Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F164B32B492
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 06:28:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dr2b76vjBz3dDF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 16:28:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bV4dO9I1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=syl.loop@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bV4dO9I1; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dr21J3G9Wz3cG7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 16:02:25 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id o10so15461920pgg.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Mar 2021 21:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kxs4zdW6EpTQ1WfyGGPHPV1+xFIcOWqo8CYwcjQtMxA=;
 b=bV4dO9I1oawjEP9Qq7F/QgMlby/KIy4G26dTxfaz6xHrODvzgOMgEIeq9xmT6siMn3
 kEclcKGR5nSJViY7RKiyLE2BKMcPGytbNemHDqx68z5CYe+QSEuu0w2fYfmZ8crhqHDm
 adJwkkKwSBiB7qGySwUH0Krn2fdrZuuvfpk0Z4Vm3cE7x/7WY+oqZzgIL/9k4Ot+NjJf
 uMGtdLJCDPso50e4BXmFwABJ+KbJ+TBk1R/QdgYtieL1aFiOf7IGvU9XCOKs39Ql42TT
 28AEHWXQI5Ltd/MfLKyWYlxQFjVmzw7yQJRaRoCCz7k6f2YcMVPa5Vb1SfDwotvwPt5c
 EPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kxs4zdW6EpTQ1WfyGGPHPV1+xFIcOWqo8CYwcjQtMxA=;
 b=PZ1WFgsAoegU/gxH+doaAfUeu4ESW5+0b9IYnWE3Las5u1pWvOeikjTt2Cf7LN5Wtm
 AACJ9AHqvhLfvhDNLWf3I2sW9hWVbqPDQXO+zNi4h4cgozLIHlnueUOE1I74dhdHamqQ
 WteZYS+Kp0xBCYx9DAhP9qTV6u0GUzDfhl3TOwb6P1Cw+6OD7Uz3WSStkWpEnrwqmAbw
 wsx54k4xiQCzxiCA0mKjxiu8ulcr0hPg0X4JOF2NJW2Zd5kKhlQ0YlqQMHXKNHK6Mq2z
 TNzkPZsRS5DJrHtA9hk1eNuqhgU8EC7j6BVOh7GSE8fL3xjtMB0VlwLmxW6zOpZStg+8
 iBHQ==
X-Gm-Message-State: AOAM531Mm+imv8Zy+4HGvLzfgjea595hx73dxHppf7q9jZZej/A/ceu0
 CUF4lVVJ9wATzkBSCnIGJYI=
X-Google-Smtp-Source: ABdhPJzyEC1xG6CI9hXhjtN0nDSDSGYy4pYdU4SzeMAPYfSFTPG+xWIdCLZtmgJuUh4KrQhPr5NCMw==
X-Received: by 2002:a63:d618:: with SMTP id q24mr21086317pgg.283.1614747735788; 
 Tue, 02 Mar 2021 21:02:15 -0800 (PST)
Received: from localhost.localdomain ([116.246.26.51])
 by smtp.gmail.com with ESMTPSA id a199sm13844738pfa.49.2021.03.02.21.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 21:02:15 -0800 (PST)
From: Youlin Song <syl.loop@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc/prom: move the device tree to the right space
Date: Wed,  3 Mar 2021 13:00:54 +0800
Message-Id: <20210303050054.3343-1-syl.loop@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 Mar 2021 16:27:13 +1100
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
Cc: Youlin Song <syl.loop@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the device tree has been allocated memory and it will
be in the memblock reserved space.Obviously it is in a
valid memory declaration and will be mapped by the kernel.

Signed-off-by: Youlin Song <syl.loop@gmail.com>
---
 arch/powerpc/kernel/prom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 9a4797d1d40d..ef5f93e7d7f2 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -121,7 +121,7 @@ static void __init move_device_tree(void)
 	size = fdt_totalsize(initial_boot_params);
 
 	if ((memory_limit && (start + size) > PHYSICAL_START + memory_limit) ||
-	    !memblock_is_memory(start + size - 1) ||
+	    (!memblock_is_memory(start + size - 1) && !memblock_is_reserved(start + size - 1)) ||
 	    overlaps_crashkernel(start, size) || overlaps_initrd(start, size)) {
 		p = memblock_alloc_raw(size, PAGE_SIZE);
 		if (!p)
-- 
2.25.1

