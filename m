Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 919DA8AE9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 07:14:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46718k6QfhzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 15:13:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bygqX4ft"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4671783Lz8zDqRy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 15:12:36 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id c14so48689745plo.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 22:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r+iTRIEqOQlykhaeqTQ39cZqiYX7NSa3vJReOAXVBzA=;
 b=bygqX4ftIBhdyz3iBDTNLkFW1QSGfU98OOzaZ9Q0I24xQUXSEKybgjdYoehYyE3nWd
 RoaCVJpTp1grs+yh5iiICBAb1Co3Kv7j5zMTflDHKBVOrdZmcvc+lVn8/G+CCG60Y59P
 fMo+uCrTfBU84oQ2+lRuk5BdoUczRoWHiajgNpGzPvyxRXn9PcmVelwXTK1Q/NSuY53V
 we6/KskHKH1Ar1nNAKexWzJn2q++uu3yVbLiNaFWJX0NUuJVnr68lgqKbEBQxniZWryq
 ycIDDuzLojVUgPjoDNQzcQgUk5bIGks/2HWj0Wr93ZF9CaF098nJBVuAtfggx7hmX0WB
 epcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r+iTRIEqOQlykhaeqTQ39cZqiYX7NSa3vJReOAXVBzA=;
 b=n/nYU7o+NS3MhL9P+qV8gONUSdCFmcCNUaHDx+nPfKtwNH02xj2xm/IKlDNONte68p
 20BUIN372eyoipd14pFoZVx06FEkWsh6w/mAptwdR+nQhIIGgOU/2thdwL8j7zesmXHU
 RlYOY9CQ42PL3WKvo6HhMKVYr+4gkjgwucxRTs4WTYhCuKF3uNOLSMyyyn2ExqQ5UQoN
 gkXGmF9/yPWxUY2PnaAjaiSyZ0UlFTNTC/kfgFmyRsKc0uoaPoDaN+NnAIDQcEO6/hNO
 AyTp14XjOc3DazcD4g7y10ktU8qqgJVef9XTFS7F49yHqSzPuXv3hSANYBGolPYjeaj1
 kl2g==
X-Gm-Message-State: APjAAAUbJ9uXryIKhdR7QlFpYZ+Vdpg/e+QpV32Ts8ypKQdr6J/4zij8
 X/Zb+DczzjJ+P5cRke+TEkgunfX1
X-Google-Smtp-Source: APXvYqyGrR87XQEeSrFAkv5ChMd25Nwcl1wwIcSYSnkmN+OYUTPW89pwdBHorvuiW3jyDNyOchVw7A==
X-Received: by 2002:a17:902:b415:: with SMTP id
 x21mr36067996plr.287.1565673152335; 
 Mon, 12 Aug 2019 22:12:32 -0700 (PDT)
Received: from pasglop.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y194sm114975542pfg.116.2019.08.12.22.12.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 22:12:31 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Remove empty comment
Date: Tue, 13 Aug 2019 15:12:12 +1000
Message-Id: <20190813051212.6387-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 2874c5fd2842 ("treewide: Replace GPLv2 boilerplate/reference with
SPDX - rule 152") left an empty comment in machdep.h, as the boilerplate
was the only text in the comment. Remove the empty comment.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/machdep.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index c43d6eca9edd..ab6c94c650e7 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -3,9 +3,6 @@
 #define _ASM_POWERPC_MACHDEP_H
 #ifdef __KERNEL__
 
-/*
- */
-
 #include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/dma-mapping.h>
-- 
2.20.1

