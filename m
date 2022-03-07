Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 598264D0686
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 19:29:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KC6Rl22sHz3bym
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 05:29:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cdl0uoIz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cdl0uoIz; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KC6Q85mF0z3bbB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 05:27:43 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id g19so3290174pfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Mar 2022 10:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xLhzOZfiSqjqlwLqL5zd/t/2T3kyAguFpM7SN7VkuXA=;
 b=cdl0uoIzZQDfTEovBL2q8L8AAZLyfKd9TNGPfyDmgf6yUAgtIqzuW9kRhYEqcTnl1A
 p0U7jfdpi9eJ2sV/hpKZ6npqQsGjOO00qK1uF+8MP9oaw+c+IUyU3O87hedufpJIYKQu
 6fJUquzV/tUofIlpEYobUUl/19SC+elWYyPLyzLAiofyQ9PUQzWFKaQkuQGdlbzT8Jnm
 pDm/13zcDW4zGtwfGOlFr6EslQoIp0fM89iKgajkyxpOVfSmWZa0U1KjQS1EqA8m9odU
 IdxGBHQe3NNULZThkuZEEfssi6FOWTtmB1XRveQjOJP6RmVWlSvoZI5KGbKmwS2rYov6
 MbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xLhzOZfiSqjqlwLqL5zd/t/2T3kyAguFpM7SN7VkuXA=;
 b=PgoomyDr25Bi5pgCIWRv7j1GdjqmHxAUbhhZqIFAw0dBgX62QAvdufqA166IozneLQ
 MIPxXg+NbCOh1PkLyDzuRVs4YhUkbp8TCkbKK5misyTGIt+zoZVOf2afyM4aTV3b7QeI
 q0DEo50N8/hQppvfGKvGWGnR8pxWDZWxQ5COmpw38SMBjIYlaQ/tlau7L6uEQqWDItLJ
 47AWefYsI600Km8OxdIdAHTF8kqPPwp3qPujcRE6N3CN4eWteCxOpO14m+lNbhRkE9p9
 Tc6GipYFpxEFc+WH0nNj04cPWskihFwZC19B6uTf0/nASOpnrhC/ok0A3dA0p9N5zCI7
 JKOg==
X-Gm-Message-State: AOAM531R80fr6PQyrIuKUfdZb8w69Jvrm5AdKtzQ3a5ujNGKXBPAzYpP
 OwPCaSuwSBvujVUJLotHUDkvSJyxAIg=
X-Google-Smtp-Source: ABdhPJyb+wng4BGrFYxQR7j4UOJwr0GQhQzPuMjg3QRUI/t0AIXKZ5jSe3qCioJoQgxK7VwFGcauTg==
X-Received: by 2002:a63:c011:0:b0:378:74a6:9c31 with SMTP id
 h17-20020a63c011000000b0037874a69c31mr10860828pgg.585.1646677660505; 
 Mon, 07 Mar 2022 10:27:40 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a17090ad59600b001b7deb42251sm68767pju.15.2022.03.07.10.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:27:40 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64: Bump SIGSTKSZ and MINSIGSTKSZ
Date: Tue,  8 Mar 2022 04:27:33 +1000
Message-Id: <20220307182734.289289-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sad tale of SIGSTKSZ and MINSIGSTKSZ is documented in glibc.git
commit f7c399cff5bd ("PowerPC SIGSTKSZ"), which explains why glibc
does not use the kernel defines for these constants. Since then in
fact there has been a further expansion of the signal stack frame size
on little-endian with linux commit 573ebfa6601f ("powerpc: Increase
stack redzone for 64-bit userspace to 512 bytes"), which has caused
it to exceed even the glibc defines.

Increase MINSIGSTKSZ to 8192 which is double the current glibc value
and fits the current stack frame with room to grow. SIGSTKSZ is set
to 4x the minimum as convention.

glibc will have to be updated as well.

Cc: Alan Modra <amodra@gmail.com>
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/uapi/asm/signal.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/signal.h b/arch/powerpc/include/uapi/asm/signal.h
index 04873dd311c2..81fa9d90be80 100644
--- a/arch/powerpc/include/uapi/asm/signal.h
+++ b/arch/powerpc/include/uapi/asm/signal.h
@@ -62,8 +62,13 @@ typedef struct {
 
 #define SA_RESTORER	0x04000000U
 
+#ifdef __powerpc64__
+#define MINSIGSTKSZ	8192
+#define SIGSTKSZ	32768
+#else
 #define MINSIGSTKSZ	2048
 #define SIGSTKSZ	8192
+#endif
 
 #include <asm-generic/signal-defs.h>
 
-- 
2.23.0

