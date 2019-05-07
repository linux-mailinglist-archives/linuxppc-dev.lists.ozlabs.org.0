Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 936DB16DA9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 00:52:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zFHh4PjkzDqMg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 08:52:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QpLCCGwM"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zFGF5MpgzDqLT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 08:51:29 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id g9so1475606plm.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 15:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=zqjU7Kqphpvey584m7PYkn4clDjLsGfPvcRFWol1jUw=;
 b=QpLCCGwMqhVERlHz2h8cPPE5/geeHbfdAPQfGoqNtq2z5wglciwshLpXhmAVsKaFSw
 lIMtHGDVZo7++JRdjrfCCst3KKZUEdp0aUfI8Z0cW25aLR/DBnVAxrtdOFjZCfu6XUJw
 sCgkEyvyXfqTq91STfwwu26tyeR8rna1xe4R7vLmzjTXFT2ycSJjs4KG5793YqS6ASMZ
 o5wS/YkLzgEZcFyyVMPC91mfWOIeBGa90Ts6FmpTf0X9c0wlwiGaqOdaH2uNOq8TcNWC
 ax6qRS+HBFzjcaH0ET9iVH1QZ3ldp+aUPMAj2FU3bXgoPmQkMNJ96CChuuCaKvA74wVX
 WQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zqjU7Kqphpvey584m7PYkn4clDjLsGfPvcRFWol1jUw=;
 b=jCb2Pwl1JSP/YK/RoBJki1da3t0m59YgRvBCvTuacgoJ4YUIMyheBPQOsfyoqeWaRU
 D+fp5FKm0nMpp2YXdL74Y161C/Tdg3TMGILpzyNl4v/lRpb//lo9P/J+SG3RxaDTX73k
 EoL8W+taRJt1L6/7B4MPvDjKml9MSgRcUMGWc7Nekfh5mKrso49SkDaqHFjaUlzzgLQa
 YBRWJOoK6pmh9Wb34Z6aauDGAjkO8Q+D81H1QVL/uskIqfniugAp46lvjuGV5KgEkqte
 9BlNIlgFi8Mkb3D2lDWPuSFCvwM2Y3DlWbGp/bje3Hih7jLwnZyCBWzH0JSgX5HexjWz
 NLmg==
X-Gm-Message-State: APjAAAVPjSwUA6jZBj8kjDr2tyfyh2KAw2GcQedztQ5jCU25GJ7nsHqu
 ujNVpjMyLjBKNBCBHpiybo4=
X-Google-Smtp-Source: APXvYqxOHVoT3+eSkoT/sHSCD3EM9x42XnLI9W5qBxIp/iNIOiJsrzdiJ2SmN3NZi3fIiQPqv+GMVA==
X-Received: by 2002:a17:902:2bc5:: with SMTP id
 l63mr44418160plb.202.1557269486243; 
 Tue, 07 May 2019 15:51:26 -0700 (PDT)
Received: from localhost ([2601:640:2:82fb:19d3:11c4:475e:3daa])
 by smtp.gmail.com with ESMTPSA id z124sm19980997pfz.116.2019.05.07.15.51.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 15:51:25 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@marvell.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Breno Leitao <leitao@debian.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: restore current_thread_info()
Date: Tue,  7 May 2019 15:51:21 -0700
Message-Id: <20190507225121.18676-1-ynorov@marvell.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Yury Norov <ynorov@marvell.com>, Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit ed1cd6deb013 ("powerpc: Activate CONFIG_THREAD_INFO_IN_TASK")
removes the function current_thread_info(). It's wrong because the
function is used in non-arch code and is part of API.

For my series of arm64/ilp32, after applying the patch
https://github.com/norov/linux/commit/b269e51eee66ffec3008a3effb12363b91754e49
it causes build break.

This patch restores current_thread_info().

Signed-off-by: Yury Norov <ynorov@marvell.com>
---
 arch/powerpc/include/asm/thread_info.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 8e1d0195ac36..f700bc80a607 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -19,6 +19,7 @@
 
 #ifndef __ASSEMBLY__
 #include <linux/cache.h>
+#include <asm/current.h>
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/accounting.h>
@@ -57,6 +58,11 @@ struct thread_info {
 #define THREAD_SIZE_ORDER	(THREAD_SHIFT - PAGE_SHIFT)
 
 /* how to get the thread information struct from C */
+static inline struct thread_info *current_thread_info(void)
+{
+	return (struct thread_info *)current;
+}
+
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
 #ifdef CONFIG_PPC_BOOK3S_64
-- 
2.17.1

