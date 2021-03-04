Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8759832CB9C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 05:51:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drdjg1jVzz3d9L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 15:51:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LJzlu1eA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=menglong8.dong@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LJzlu1eA; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrdhL24bzz3dKH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 15:49:52 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id 192so11034759pfv.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Mar 2021 20:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z9XcVy6AJTokIzTljF0EFRLCvXqasp1w3tskzqtsRk4=;
 b=LJzlu1eACs+yu7D22SxzqAvbQTTf4LAtrRt/ALmphbrNE41CSxb/XjQevN0zaJ0KTl
 NAcSuPj5r2p/jrgVJiGZsAGkjm6KzzCu11Do9yXIiJc5fB/vQDTQGIMHTgBy4MWb3n7U
 m5+350HJtNS0VhfaMtfdotbbHebO0ufp8TojtSfe5MkegdsD/GW6pPMtvKBEC0GFZvJl
 EMqmKMb6FPIMrJ57B+Uq3jqPDCWtYL//V/yyZqXl95SqnkIZo451kB2KoS/ij45QU6QW
 iCcJk70vXHAH96B4hRlzq6DHYF15szNy+8y5I3y2EuZxSPzA0r3eDcsxc65T9NH5n4Tb
 Gqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z9XcVy6AJTokIzTljF0EFRLCvXqasp1w3tskzqtsRk4=;
 b=erJssfhZIxyziXTUN9EmaYFOs85Xv46njRrNlDVfnAJh8yjz7Xxxtjlm+jTU73bq31
 Ihbk+U8kBO4Fy5MaYo/MM8qDAUEF1IcRxxD5P47MCH7Qt8ipVm6yPmfkeRf2eRQnEpIn
 Cj1fiFicPkXTqR2wnH1nUw8lSWqaBL6YVF/jt2h7KsvqvGB99thnnJ5XgReaNB2ayea7
 71FqRgkcSHoZ6Xz8uL8It6bPDuX4WOPOFIPlzSpbLN/Gfm5sTPcnmdVHmE0P0+XSDJ21
 VMH28eDCgf1FtYjooc1jhtEP0bVERAP2dnoudTG7KDCXnkw2DECYj6sNfttPN+J6sUJh
 AC5Q==
X-Gm-Message-State: AOAM533JpEkKvlQbq4t9TElN/Eb4wJpvJSkxCz3MAVLch3uC3sMeMMRQ
 zgUwPIM/JX6wxRMuZ7O35gAlLxkzdt4=
X-Google-Smtp-Source: ABdhPJzzlPflua+YuDG5NPzQvi4HwYJUunChRht3+FWKm6EVAa8quJ9p90kR3WPEmIw0jqWWIInq2Q==
X-Received: by 2002:a63:1648:: with SMTP id 8mr2177585pgw.392.1614833391144;
 Wed, 03 Mar 2021 20:49:51 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
 by smtp.gmail.com with ESMTPSA id a2sm25736950pfi.64.2021.03.03.20.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 20:49:50 -0800 (PST)
From: menglong8.dong@gmail.com
X-Google-Original-From: zhang.yunkai@zte.com.cn
To: npiggin@gmail.com
Subject: [PATCH] arch:powerpc:kernel: remove duplicate include in traps.c
Date: Wed,  3 Mar 2021 20:49:43 -0800
Message-Id: <20210304044943.190613-1-zhang.yunkai@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: gregkh@linuxfoundation.org, peterz@infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Zhang Yunkai <zhang.yunkai@zte.com.cn>, paulus@samba.org,
 alistair@popple.id.au, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

'asm/tm.h' included in 'traps.c' is duplicated.
It is also included in the 62th line.

Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 arch/powerpc/kernel/traps.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 1583fd1c6010..dcdb93588828 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -53,7 +53,6 @@
 #ifdef CONFIG_PPC64
 #include <asm/firmware.h>
 #include <asm/processor.h>
-#include <asm/tm.h>
 #endif
 #include <asm/kexec.h>
 #include <asm/ppc-opcode.h>
-- 
2.25.1

