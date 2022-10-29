Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 626B061220D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 11:55:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mzvsx2Hg8z3ccs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 20:55:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.154.221.58; helo=bg4.exmail.qq.com; envelope-from=dengshaomin@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 452 seconds by postgrey-1.36 at boromir; Sat, 29 Oct 2022 20:54:45 AEDT
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.221.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzvsK4RVlz3bjy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 20:54:45 +1100 (AEDT)
X-QQ-mid: bizesmtp62t1667036809t7njbpzb
Received: from localhost.localdomain ( [182.148.13.81])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 29 Oct 2022 17:46:44 +0800 (CST)
X-QQ-SSF: 01000000002000D0E000B00A0000000
X-QQ-FEAT: D6RqbDSxuq6cl7v6+jiUzOwsMIqLKR3vyxMmJUI7LbiJuMEO0xzlTsP1JQPEv
	mWGLT9H0GslUYISo6RVuqOdBRtSdgzbRohNS30tbt4OyKxbV9EfU6alLVINk0cLS8AJGNOW
	+Arn+7QyDYlpZVfoAVtkUTNmZxcUE3EtuYHGr0hQ5GOW+GoBKWzF3j+iiDu65AYSxkOQe4q
	KvZeWyhgtxzfuCwK+jvoM6o4fW2RnflgwDHuUGAloPtyAQvJ3wQystrdiBVj8rpHrPJkSg4
	+LlFUfq2SegkwOPF85ah5YGbpKywZJE7wVUkALHXVb2a8k6BKAkMXhKmLbfA0/dvMYgv3mG
	gLjEbywiQoUNZAoTfgxK8eBED3C+c0Rr/4l2TieDCXskIqa8YGW2/DoD7zxPQ==
X-QQ-GoodBg: 0
From: Shaomin Deng <dengshaomin@cdjrlc.com>
To: shuah@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/powerpc: Remove repeated word in comments
Date: Sat, 29 Oct 2022 05:46:43 -0400
Message-Id: <20221029094643.5595-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
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
Cc: Shaomin Deng <dengshaomin@cdjrlc.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the repeated word "not" in comments.

Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
---
 tools/testing/selftests/powerpc/include/pkeys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
index 3312cb1b058d..51729d9a7111 100644
--- a/tools/testing/selftests/powerpc/include/pkeys.h
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -24,7 +24,7 @@
 #undef PKEY_DISABLE_EXECUTE
 #define PKEY_DISABLE_EXECUTE	0x4
 
-/* Older versions of libc do not not define this */
+/* Older versions of libc do not define this */
 #ifndef SEGV_PKUERR
 #define SEGV_PKUERR	4
 #endif
-- 
2.35.1

