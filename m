Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C3E411134
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 10:44:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCdR573v8z2yLZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 18:44:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCdQh4Kthz2yKF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 18:44:28 +1000 (AEST)
Received: from localhost.localdomain (ip5f5aef72.dynamic.kabel-deutschland.de
 [95.90.239.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3FBA161E5FE33;
 Mon, 20 Sep 2021 10:44:25 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v3] lib/zlib_inflate/inffast: Check config in C to avoid
 unused function warning
Date: Mon, 20 Sep 2021 10:43:33 +0200
Message-Id: <20210920084332.5752-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.33.0
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, llvm@lists.linux.dev,
 Zhen Lei <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building Linux for ppc64le with Ubuntu clang version 12.0.0-3ubuntu1~21.04.1
shows the warning below.

    arch/powerpc/boot/inffast.c:20:1: warning: unused function 'get_unaligned16' [-Wunused-function]
    get_unaligned16(const unsigned short *p)
    ^
    1 warning generated.

Fix it, by moving the check from the preprocessor to C, so the compiler
sees the use.

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
v2: Use IS_ENABLED
v3: Use if statement over ternary operator as requested by Christophe

 lib/zlib_inflate/inffast.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/lib/zlib_inflate/inffast.c b/lib/zlib_inflate/inffast.c
index f19c4fbe1be7..2843f9bb42ac 100644
--- a/lib/zlib_inflate/inffast.c
+++ b/lib/zlib_inflate/inffast.c
@@ -253,13 +253,12 @@ void inflate_fast(z_streamp strm, unsigned start)
 
 			sfrom = (unsigned short *)(from);
 			loops = len >> 1;
-			do
-#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
-			    *sout++ = *sfrom++;
-#else
-			    *sout++ = get_unaligned16(sfrom++);
-#endif
-			while (--loops);
+			do {
+			    if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
+				*sout++ = *sfrom++;
+			    else
+				*sout++ = get_unaligned16(sfrom++);
+			} while (--loops);
 			out = (unsigned char *)sout;
 			from = (unsigned char *)sfrom;
 		    } else { /* dist == 1 or dist == 2 */
-- 
2.33.0

