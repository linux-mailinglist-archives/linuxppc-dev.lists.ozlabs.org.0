Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C39A88594
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 00:07:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464zqr6m0QzDqRL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 08:07:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com;
 envelope-from=3yo1nxqwkdms4uv9rb24zv89x55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UAy9ZliJ"; 
 dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464zm3026mzDr6t
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 08:03:55 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id n9so57025304pgq.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2019 15:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=u8woyYEIswYwSZI+RYUkZJav0hcCzSUKciws/3A8eFI=;
 b=UAy9ZliJfC3GBJda6OupIsMHCFcE4vNQm2ZAXWx+g5D+Xc+o6gxSBXsGdAj1BhAOjY
 hSwd/IwvlqOvSdqSMQOmX9p/+rpqBYA08jtB9SYYVtWwVhP7F0S622nlMFQWmNLSOXa3
 xK91hSiDK4QDyJzR0q2MhImhCKHoS3RNPrDf6KkCrCzwJ9qA7xvxtKRhQmrAjnEm4sf9
 /2O4fsBnrhfr0f7F3ao8dLP9ZWeAKno01jBit4kG+8z8xxpdQrLtWxrKEPh5HqYs6E3a
 L6e15UPxTBSSjZnDQZBhDAF4sY05lkmSxhnOiLpve//mGS5PNXfR1Sq+Vwdl1F283s11
 EXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=u8woyYEIswYwSZI+RYUkZJav0hcCzSUKciws/3A8eFI=;
 b=fPPEqPK36tYKrpzV8M16Gm4z3Zz3BO8u4ezA64nq1FjN3P5xEf6LzYYmC3ObX1o18q
 3V76iTpCnZz+2h0j64nK7mI61cwbuPFTD92X0pY/bwLM+Mc01V3y2rXzHdz6IG+FrdSb
 n7yS1BGn9oTHqAdGm2C8qn+LJuF1qvGpFAbPWQBPiqLmS8Eiy/Z7I/54FZaPYTPyV5dX
 wEQx465/nyhJUjVEgS7CbIl7HAGjYFMNWpOa+4n40vmlMkvJqBYTA09P4PvGFk/oudsl
 HxFqGwA2aMy4NTuQkyJV60phLbhk5Hj1pTGso5nwGzNWXNj8YdIrB/+9bl8wL9xJp6O1
 o9jQ==
X-Gm-Message-State: APjAAAWXkCjV+8rFbfEEsHNyK5sr4El2XmYQRoOc7WX1LLTHKcEpLWsG
 EJkNu1RHoRmX6DgSWj3Up9Xv3QI1A3jsETi54Vo=
X-Google-Smtp-Source: APXvYqzyM1XJN7FOkuZaGwj9xH3x7cZlnraGtnkG5xN3p+7O5NNPZIyQr9Gfn94WugA8q8zgwEwvJofBRod2VyPs1Tc=
X-Received: by 2002:a63:6a81:: with SMTP id
 f123mr19637717pgc.348.1565388232571; 
 Fri, 09 Aug 2019 15:03:52 -0700 (PDT)
Date: Fri,  9 Aug 2019 15:03:47 -0700
In-Reply-To: <20190809220301.Horde.AR6y4Bx4WGIq58V9K0En9g4@messagerie.si.c-s.fr>
Message-Id: <20190809220348.127314-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20190809220301.Horde.AR6y4Bx4WGIq58V9K0En9g4@messagerie.si.c-s.fr>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v3] Revert "powerpc: slightly improve cache helpers"
From: Nick Desaulniers <ndesaulniers@google.com>
To: mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
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
Cc: arnd@arndb.de, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 kbuild test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 6c5875843b87c3adea2beade9d1b8b3d4523900a.

Work around Clang bug preventing ppc32 from booting.

Link: https://bugs.llvm.org/show_bug.cgi?id=42762
Link: https://github.com/ClangBuiltLinux/linux/issues/593
Debugged-by: Nathan Chancellor <natechancellor@gmail.com>
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Reported-by: kbuild test robot <lkp@intel.com>
Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V2 -> V3:
* Just revert, as per Christophe.
Changes V1 -> V2:
* Change to ouput paremeter.


 arch/powerpc/include/asm/cache.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index b3388d95f451..45e3137ccd71 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -107,22 +107,22 @@ extern void _set_L3CR(unsigned long);
 
 static inline void dcbz(void *addr)
 {
-	__asm__ __volatile__ ("dcbz %y0" : : "Z"(*(u8 *)addr) : "memory");
+	__asm__ __volatile__ ("dcbz 0, %0" : : "r"(addr) : "memory");
 }
 
 static inline void dcbi(void *addr)
 {
-	__asm__ __volatile__ ("dcbi %y0" : : "Z"(*(u8 *)addr) : "memory");
+	__asm__ __volatile__ ("dcbi 0, %0" : : "r"(addr) : "memory");
 }
 
 static inline void dcbf(void *addr)
 {
-	__asm__ __volatile__ ("dcbf %y0" : : "Z"(*(u8 *)addr) : "memory");
+	__asm__ __volatile__ ("dcbf 0, %0" : : "r"(addr) : "memory");
 }
 
 static inline void dcbst(void *addr)
 {
-	__asm__ __volatile__ ("dcbst %y0" : : "Z"(*(u8 *)addr) : "memory");
+	__asm__ __volatile__ ("dcbst 0, %0" : : "r"(addr) : "memory");
 }
 #endif /* !__ASSEMBLY__ */
 #endif /* __KERNEL__ */
-- 
2.23.0.rc1.153.gdeed80330f-goog

