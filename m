Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 505B0577234
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 01:10:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlkV127yCz3f1y
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 09:10:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.154.54.12; helo=smtpbg.qq.com; envelope-from=dengshaomin@cdjrlc.com; receiver=<UNKNOWN>)
Received: from smtpbg.qq.com (biz-43-154-54-12.mail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LlZCq6bMLz2x9v
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 02:57:43 +1000 (AEST)
X-QQ-mid: bizesmtp65t1657990605t8bp26sw
Received: from dengVM.. ( [117.176.186.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 17 Jul 2022 00:56:34 +0800 (CST)
X-QQ-SSF: 01000000002000305000B00A0000000
X-QQ-FEAT: BYUemv+qiN3/9/vLY1i02sXWgxukErvdo4j5XnjFneZ0Pjwt1A9kwMxja9+il
	SPkFx/dYqCecn6eKrcemypcEuoZGvBRJijdCzyJNwb/Zfv8ir9OskP2L6kxPM5fsdDmBmpQ
	tOvBoYXhBJKZbghdUlKtyRZaFtrBpraYLedQD6Hp9YkB12bYOrQJXnExWD0WUFdKiRhgSZJ
	JsBSZOWGBmmgdzz7orlJ8m+4EI/T9CTXhrsc5M53uhcm4uIMQF61U/HO5IzRoH2IJSe4OOk
	VkoZV/9GT6JZwhR8nBxB0ZXxFcQ9OY0hv0AQX436mrTCB/DUcl3eKyxIMvbNEyMNe3oxoYn
	FDYclbUmhyTFPrkgbEQ5Hm7wxvIr0ppbnxNbh4tO6QNo5VoqU4=
X-QQ-GoodBg: 0
From: shaom Deng <dengshaomin@cdjrlc.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net
Subject: [PATCH] cyrpto:delete the rebundant word "block" in comments
Date: Sun, 17 Jul 2022 00:56:33 +0800
Message-Id: <20220716165633.17822-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Sun, 17 Jul 2022 09:09:19 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, shaom Deng <dengshaomin@cdjrlc.com>, paulus@samba.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

there is rebundant word "block" in comments, so remove it

Signed-off-by: shaom Deng <dengshaomin@cdjrlc.com>
---
 arch/powerpc/crypto/aes-spe-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/crypto/aes-spe-glue.c b/arch/powerpc/crypto/aes-spe-glue.c
index e8dfe9fb0266..efab78a3a8f6 100644
--- a/arch/powerpc/crypto/aes-spe-glue.c
+++ b/arch/powerpc/crypto/aes-spe-glue.c
@@ -28,7 +28,7 @@
  * instructions per clock cycle using one 32/64 bit unit (SU1) and one 32
  * bit unit (SU2). One of these can be a memory access that is executed via
  * a single load and store unit (LSU). XTS-AES-256 takes ~780 operations per
- * 16 byte block block or 25 cycles per byte. Thus 768 bytes of input data
+ * 16 byte block or 25 cycles per byte. Thus 768 bytes of input data
  * will need an estimated maximum of 20,000 cycles. Headroom for cache misses
  * included. Even with the low end model clocked at 667 MHz this equals to a
  * critical time window of less than 30us. The value has been chosen to
-- 
2.34.1

