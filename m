Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED5C460D14
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:15:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2VpM6gk4z3ckF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:15:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qy+cwSRE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Qy+cwSRE; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Vfr3hwrz3cNl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:36 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id k4so10980734plx.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XuRZuXMp4TxqU1SsXIYoSuXCGrcjNgo7TLmZp/yqIWg=;
 b=Qy+cwSREsQyr250EhlBG8dhSHKEE1/OtOeL/D6Mb00iRY6nTjI0C+i1okMFjm0Rv7i
 HjdUndhSWm2XFH1umBGiMYZbKmZsC6Li3VOU6YCT7ZbktxFw1/KwRTxIoubIKJSOTmXm
 ZonsJOseJMibixxdP+ga/r/vWbkoT8hCWryYfl2/XQL/NW0LUu2C/wnyRM9RvGF5Ezi1
 zHBCQAwutW9ZZkUZg/OnMndBlN79iEKIaNGved0eW6gOWLbYV74RAxrrfIioo4EGg801
 xjrCkGZqZoed5l0W0lAUrDwI1S57ln4pAy2TaxUAugpZz8q1h20bGs+XUpObf4xvJefc
 RbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XuRZuXMp4TxqU1SsXIYoSuXCGrcjNgo7TLmZp/yqIWg=;
 b=Yg0O/TbhD1EhP7zyXPoaHfN0vm5oObO1dmhcmugq9CoAVCnHaBMZyUaky/dNVCE2+1
 cclu/JP/SJnaVYn8ehsaXhXnh223sMepZSEizDt1pJYlkV2o/5coH8WN5E5mZy1Fw3hE
 H4yxOqfXEuHGgVFbVwGMFk9JOdilao2Ctq8VFsxiSe9qqeVmUuDJteYGYoEeK4gwyK06
 aU2jAsRqCspCv/VhSlOTHO6Mhwto/qbRf8lmHL31zQJmcd8OQeFYZmCVb2ALWBLbqFvR
 s76b41gGd8wDmno76I5Al5vHS8W5XNX3qPyFIrmtKvty+mCahnZbtpNj4cmZ6ChKkhS6
 dTvA==
X-Gm-Message-State: AOAM531w/CplHJ1hzAOs6W6GYe4ute+mxc8+jPUWxLQMjGTcy5/luNi9
 iDyZ9JrqnpmljiB7pE6CDjvyWyygi4g=
X-Google-Smtp-Source: ABdhPJzwO2ro8P/IO18d2V4KzEYLsDsi8SVW970xBm8v0mzmv6AMaBVHVG4deeyy4omWAjWKEK+/bQ==
X-Received: by 2002:a17:903:286:b0:142:4abc:88b8 with SMTP id
 j6-20020a170903028600b001424abc88b8mr57128540plr.25.1638155314424; 
 Sun, 28 Nov 2021 19:08:34 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 10/17] powerpc/64s: Rename hash_hugetlbpage.c to
 hugetlbpage.c
Date: Mon, 29 Nov 2021 13:07:56 +1000
Message-Id: <20211129030803.1888161-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211129030803.1888161-1-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This file contains functions and data common to radix, so rename it to
remove the hash_ prefix.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/Makefile                              | 2 +-
 arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (100%)

diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 1579e18e098d..501efadb287f 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_PPC_HASH_MMU_NATIVE)	+= hash_native.o
 obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_pgtable.o radix_tlb.o
 obj-$(CONFIG_PPC_4K_PAGES)	+= hash_4k.o
 obj-$(CONFIG_PPC_64K_PAGES)	+= hash_64k.o
-obj-$(CONFIG_HUGETLB_PAGE)	+= hash_hugetlbpage.o
+obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 ifdef CONFIG_HUGETLB_PAGE
 obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_hugetlbpage.o
 endif
diff --git a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
similarity index 100%
rename from arch/powerpc/mm/book3s64/hash_hugetlbpage.c
rename to arch/powerpc/mm/book3s64/hugetlbpage.c
-- 
2.23.0

