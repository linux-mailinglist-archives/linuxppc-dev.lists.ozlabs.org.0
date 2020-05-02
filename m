Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E53F91C22EE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 06:30:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Dblc0ryPzDqlV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 14:30:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=bmeng.cn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S2CIR5df; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DbjZ1PwJzDq9s
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 14:29:02 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 18so2535516pfx.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 May 2020 21:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QoY6NuAT/vtfmoytNr3fNpL4SjPDh/q4KrkvGuETEeI=;
 b=S2CIR5dfRAeMTD5/O6ohPQeT37++k1qHB9i2UXd+4z+L51Qfm150t7EABeAjA9uCap
 kFsyRBu0TBKuYULnhB1+YWEi4+mo2CA0gzafkKnnJxQ23DdTKvyzivTUFiqDR1SUVk7j
 CrUxvHl10pjKpWYcgF7vxg+p0tl96eFyxEZh4POPvQK5q6eYdMfa0/bt7khAGZQLphOn
 hhscCjyFvkmeG87zi5x1QyV8d/vUFE7NKuHSm/jKBwkKbmNTf22/OyULT82sLxr48U2Q
 zCJw2i66VFLSL8tgfmH9wmW+EyRo12SeNPUdNC08dh/N+7Gq603h0QBDduE+RIwsT0y4
 /1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QoY6NuAT/vtfmoytNr3fNpL4SjPDh/q4KrkvGuETEeI=;
 b=CzBKhX+dLx+bxi5Sw7S4jfIMqEJ8wvY19/Y6XkapaUgtaxhXCqJmdcR/TSZdkriP1u
 XAbLhWYIMGhl++9c4+2HI7cQLsPv3ZQHobzv/84JkENs3gkX3ST4zokUFVZlRCuNblMe
 jga/7mvA7o+tZtERHzP9eBWUbxQWIGE6maDR6mV/bDieaO5cM75bqZWpKnjYGrtKMvAG
 XdyYb9QV5y7ZaJDT5JutqV0KeUspwrg+XW9hTVht8g6g4gYvAOl+sbROPJDCztFl79Mm
 a43Hvqzhb6z+c2eGbTkjImqvdAZwmqA7fxth5orAfF6EX8Qzt6rjdknFPYWF+cwolrEi
 Tklw==
X-Gm-Message-State: AGi0PuZL3+wNFGiuWmOU1Y5e/IUXAV3WgJTsbocMBoz4XFhrdwrTFQn2
 dm1cJnvSLqb7yfnuD78e0qY8nmOZ
X-Google-Smtp-Source: APiQypJMDaa8Hq/Ud0P/Mr/ErtBfUjYMXu+r/tWaElslWPw6CY0/HG+cTpaUWPuP+1ELtPgK93X6kw==
X-Received: by 2002:a63:1a16:: with SMTP id a22mr7397389pga.264.1588393739396; 
 Fri, 01 May 2020 21:28:59 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id q14sm3130682pgq.60.2020.05.01.21.28.58
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 01 May 2020 21:28:58 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: Drop CONFIG_MTD_M25P80 in 5xx-hw.config
Date: Fri,  1 May 2020 21:28:54 -0700
Message-Id: <1588393734-31734-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bin Meng <bin.meng@windriver.com>

Drop CONFIG_MTD_M25P80 that was removed in
commit b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 arch/powerpc/configs/85xx-hw.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
index b507df6..524db76 100644
--- a/arch/powerpc/configs/85xx-hw.config
+++ b/arch/powerpc/configs/85xx-hw.config
@@ -67,7 +67,6 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_NAND_FSL_ELBC=y
 CONFIG_MTD_NAND_FSL_IFC=y
 CONFIG_MTD_RAW_NAND=y
-- 
2.7.4

