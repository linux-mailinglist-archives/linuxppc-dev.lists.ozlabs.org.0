Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE36A444EB2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 07:18:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlD315D0gz2ywf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 17:18:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b7L7/Tpz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=davidcomponentone@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=b7L7/Tpz; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlD2J1JxGz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 17:17:25 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id u17so5542108plg.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Nov 2021 23:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qwY/0Yret/ZeU+RSixeWoCXh4kAArCYXsS+DBE2iOpM=;
 b=b7L7/Tpz1l/HxDPeN39J9BMcBjMJwNyQ/xfaESAkuJ4b9f8p2/XbcsNDU5693ndSId
 WEYzqyFy8I6fSDQcl1pD8kFsvySUaedoqOEjWXx0FVRUkdwwi95TmLyBOdB0KgQeKilq
 e10V6iLB67OtwudJy5YWsAdvLmn4pt2i0ee/Xj/3lwdpgDH10tdSMRkgfslGMvURgLNy
 cQnp5we2TjPYoKHjr/ClxG+RESgKks0lBKJcUVt0wf3ZrvOqiz/Ln7utxCtBKMzXJ1EC
 iewav8hFSyuofy1lTTYo9qqF0EPGS8xo9DBpxrIHutJmYLkmX2OeSZxxWBVsgJjbP5i8
 lLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qwY/0Yret/ZeU+RSixeWoCXh4kAArCYXsS+DBE2iOpM=;
 b=nO5Zpso0xwdB5b6/4XxhKeI0E603n1qKItOTWUBYayVyvhP8++ySKfvf9i4FfQDNLd
 iubG7YEEHgQQICEhJU36HNw1Pc2t5VC+plB9po/wtHdycDkiCKjT5x6M9UrUSwE13lvn
 Qi43cNq4zxE0tFW1iKvV19mhIC4PvPH7rI6Zj1xV3HWT77AqaOT3gx6qbyBWLcUjDg+p
 99VrgqgJZOkPd2UfrR5siPREW/bsLzsTBudeJKfTk9Uj0Vkl0vtvil1XUpfb4f1GnOa8
 29m2DWtg1VJB91cMLodfQE2WhbHStidFse0nSdScMggnNbbi6XIopcnt1NJBBMVbXFsI
 l2JQ==
X-Gm-Message-State: AOAM5317D5pQuc5FgxDDRAneYVUvdTaG8WllOvpKj+hNMdB6dV+6pElM
 hLQj8EYlMqHe/uvgPUyMR3M=
X-Google-Smtp-Source: ABdhPJyJuRHN9mD8kGYSac3FNpwwDOidKHwy/xInjRGJxG7R0xX2xZ2j2x96d36H2Lo6RqJecqNk8w==
X-Received: by 2002:a17:90a:f182:: with SMTP id
 bv2mr19780432pjb.139.1636006641455; 
 Wed, 03 Nov 2021 23:17:21 -0700 (PDT)
Received: from debian11-dev-61.localdomain (192.243.120.180.16clouds.com.
 [192.243.120.180])
 by smtp.gmail.com with ESMTPSA id a10sm3193010pgw.25.2021.11.03.23.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 23:17:21 -0700 (PDT)
From: davidcomponentone@gmail.com
X-Google-Original-From: yang.guang5@zte.com.cn
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: use swap() to make code cleaner
Date: Thu,  4 Nov 2021 14:17:09 +0800
Message-Id: <20211104061709.1505592-1-yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.30.2
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
Cc: sfr@canb.auug.org.au, sxwjean@gmail.com, Zeal Robot <zealci@zte.com.cn>,
 davidcomponentone@gmail.com, linux-kernel@vger.kernel.org, nathan@kernel.org,
 yang.guang5@zte.com.cn, paulus@samba.org, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Yang Guang <yang.guang5@zte.com.cn>

Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
opencoding it.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
---
 arch/powerpc/kernel/fadump.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index b7ceb041743c..5b40e2d46090 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1265,7 +1265,6 @@ static void fadump_release_reserved_area(u64 start, u64 end)
 static void sort_and_merge_mem_ranges(struct fadump_mrange_info *mrange_info)
 {
 	struct fadump_memory_range *mem_ranges;
-	struct fadump_memory_range tmp_range;
 	u64 base, size;
 	int i, j, idx;
 
@@ -1281,9 +1280,7 @@ static void sort_and_merge_mem_ranges(struct fadump_mrange_info *mrange_info)
 				idx = j;
 		}
 		if (idx != i) {
-			tmp_range = mem_ranges[idx];
-			mem_ranges[idx] = mem_ranges[i];
-			mem_ranges[i] = tmp_range;
+			swap(mem_ranges[idx], mem_ranges[i]);
 		}
 	}
 
-- 
2.30.2

