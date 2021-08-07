Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CD73E33F7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 09:25:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhYm82zfxz3d7k
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 17:25:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=109.244.180.96; helo=smtpbg.qq.com;
 envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 114 seconds by postgrey-1.36 at boromir;
 Sat, 07 Aug 2021 17:25:25 AEST
Received: from smtpbg.qq.com (smtpbg127.qq.com [109.244.180.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhYln1M2Jz3086
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 17:25:24 +1000 (AEST)
X-QQ-mid: bizesmtp46t1628320958tjmcxxi0
Received: from localhost.localdomain (unknown [125.69.42.194])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sat, 07 Aug 2021 15:22:36 +0800 (CST)
X-QQ-SSF: 01000000002000B0C000B00A0000000
X-QQ-FEAT: Cjrn31CahfWgDw7UMKXdHlRwa6tXiaeZj606PdrsMAHJvFwTr0Ol7tAVgd2t8
 8UQrp4Od/ZW3X5HNjCgZFyNBvEbu9AafqzaF99RZi+ml2VeAYkbD7ps6SEejQPt3ujh/POt
 DnmqPAWay4LJ405EYx/Q2B6R32YTkLL7cfXmULMmWM8k+mB7j5GX3BlgLNtX5bbFKUzhMRc
 LcOdf4GZqbUdeHMjDZdMUEVRN7ILm9Nuy84E6fQq9/iD4FT+SJa4Egus2qLMfxzwNHL0vb8
 PaJSpLQmJw1g1FBgJpkg40ic34WVJ1QG+y81CR+1XCc/A3NkDtCUVVqsw5sEpF0MMJIdXOU
 aLLtFZw1qbGWCmoRNc=
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: use strscpy to replace strlcpy
Date: Sat,  7 Aug 2021 15:21:54 +0800
Message-Id: <20210807072154.64512-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam1
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 wangborong@cdjrlc.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The strlcpy should not be used because it doesn't limit the source
length. As linus says, it's a completely useless function if you
can't implicitly trust the source string - but that is almost always
why people think they should use it! All in all the BSD function
will lead some potential bugs.

But the strscpy doesn't require reading memory from the src string
beyond the specified "count" bytes, and since the return value is
easier to error-check than strlcpy()'s. In addition, the implementation
is robust to the string changing out from underneath it, unlike the
current strlcpy() implementation.

Thus, We prefer using strscpy instead of strlcpy.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/powerpc/platforms/powermac/bootx_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/bootx_init.c b/arch/powerpc/platforms/powermac/bootx_init.c
index d20ef35e6d9d..741aa5b89e55 100644
--- a/arch/powerpc/platforms/powermac/bootx_init.c
+++ b/arch/powerpc/platforms/powermac/bootx_init.c
@@ -243,7 +243,7 @@ static void __init bootx_scan_dt_build_strings(unsigned long base,
 		DBG(" detected display ! adding properties names !\n");
 		bootx_dt_add_string("linux,boot-display", mem_end);
 		bootx_dt_add_string("linux,opened", mem_end);
-		strlcpy(bootx_disp_path, namep, sizeof(bootx_disp_path));
+		strscpy(bootx_disp_path, namep, sizeof(bootx_disp_path));
 	}
 
 	/* get and store all property names */
-- 
2.32.0

