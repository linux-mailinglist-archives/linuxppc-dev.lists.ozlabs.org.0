Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 044035AC82C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 01:48:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLSyx6P8Xz3c1c
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 09:48:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.154.221.58; helo=smtpbg.qq.com; envelope-from=dengshaomin@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 322 seconds by postgrey-1.36 at boromir; Mon, 05 Sep 2022 01:57:22 AEST
Received: from smtpbg.qq.com (bg4.exmail.qq.com [43.154.221.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLGW63fpbz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 01:57:21 +1000 (AEST)
X-QQ-mid: bizesmtp87t1662306671tmv035sy
Received: from localhost.localdomain ( [182.148.14.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 04 Sep 2022 23:51:03 +0800 (CST)
X-QQ-SSF: 01000000002000C0C000B00A0000000
X-QQ-FEAT: NCCf6GxSCjvo3D104b/s79LMaDnXrlH3yWApB9Kiw1UuCK5jrEEGBZj+kksyg
	+XN8hrxxEpyqXVD7YYcnKmrRe4SBtgo5S/BIWPThuUK+QBSSsHTjT1tALP8Rvv2vG+fQvP7
	4G5RoulEwth17qlo+OA8/R78mOKHQZsOvOL7dD7Jf/R7q7W/cR41ZnJLB3+fkm847WJLHXB
	vtRYdvYdhIORt+1YEymXQcsuFHJJYXM7TtsyOzAhLX/RP6EUKQnNa8PfHecWoMKG2zNUok1
	J1rf15FmtWQpDXyciMSgfJicY96xg6BparsepH3ryNjn943WHThcODbGmgKJ1CmaYI/vQyw
	w1r6EBNqeqJ4MHca+UYCNEebEsVzbWr5BYMLBEF1I/JCFzgEcs=
X-QQ-GoodBg: 0
From: Shaomin Deng <dengshaomin@cdjrlc.com>
To: geoff@infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] drivers/ps3: Fix double word in comments
Date: Sun,  4 Sep 2022 11:51:02 -0400
Message-Id: <20220904155102.26957-1-dengshaomin@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Mon, 05 Sep 2022 09:48:22 +1000
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
Cc: Shaomin Deng <dengshaomin@cdjrlc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop the repeated word "when" in comments.

Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
---
 drivers/ps3/ps3-lpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ps3/ps3-lpm.c b/drivers/ps3/ps3-lpm.c
index 65512b6cc6fd..200ad8751860 100644
--- a/drivers/ps3/ps3-lpm.c
+++ b/drivers/ps3/ps3-lpm.c
@@ -1066,7 +1066,7 @@ EXPORT_SYMBOL_GPL(ps3_disable_pm_interrupts);
  *  instance, specified by one of enum ps3_lpm_tb_type.
  * @tb_cache: Optional user supplied buffer to use as the trace buffer cache.
  *  If NULL, the driver will allocate and manage an internal buffer.
- *  Unused when when @tb_type is PS3_LPM_TB_TYPE_NONE.
+ *  Unused when @tb_type is PS3_LPM_TB_TYPE_NONE.
  * @tb_cache_size: The size in bytes of the user supplied @tb_cache buffer.
  *  Unused when @tb_cache is NULL or @tb_type is PS3_LPM_TB_TYPE_NONE.
  */
-- 
2.35.1


