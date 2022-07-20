Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C1A57B6AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 14:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnwP03RBcz3cfh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 22:43:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=smtpbg.qq.com; envelope-from=gaoxin@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 156 seconds by postgrey-1.36 at boromir; Wed, 20 Jul 2022 22:11:23 AEST
Received: from smtpbg.qq.com (unknown [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnvgb5567z3bdF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 22:11:21 +1000 (AEST)
X-QQ-mid: bizesmtp89t1658318845tsiobkqm
Received: from harry-jrlc.. ( [182.148.15.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 Jul 2022 20:07:15 +0800 (CST)
X-QQ-SSF: 0100000000600030C000B00A0000020
X-QQ-FEAT: hJ5650VbgwCQmPp6NqHSO23DqJ2SgkjVfT10KlF04he/S0phvOifnwV9XMxd0
	4ZbgrrNL6nqFXPxEq7PQZhOeE3J8EPAY+lBT1JrxPFCv9f4dPi4+xbWg+Q0iSqYl3bO58Ts
	Cg/irCjX4tmD1GAqLQgineiq/eJm41f4Lm+7tDIsmah5oejPw3TARFPmdNfGsAYezFFYTkI
	YEM92fy2NxWpVRFUOlmCbz741fzf6a97g85OEUrXFRbgS6+i/uix9bvFz7bAwxpiJX8+y4F
	JRWoBhXfcGYEBwMMQWTOJKqMmoJJZ6iK33042QlZm3Widp5a96NqUEgPHfPhfByWar+ilJc
	ici6gFVOlTu8U7O0hxvcWbCraduvnfIpp2oyrvSJTTK8kotqoeLpnHmq+XcYrMSQRPFCFTy
X-QQ-GoodBg: 0
From: Xin Gao <gaoxin@cdjrlc.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net
Subject: [PATCH] crypto:repeated word: 'block'.
Date: Wed, 20 Jul 2022 20:07:13 +0800
Message-Id: <20220720120713.3700-1-gaoxin@cdjrlc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Wed, 20 Jul 2022 22:42:51 +1000
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
Cc: linux-kernel@vger.kernel.org, paulus@samba.org, linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Xin Gao <gaoxin@cdjrlc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

repeated word: 'block'.

Signed-off-by: Xin Gao <gaoxin@cdjrlc.com>
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
2.30.2

