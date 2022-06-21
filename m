Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B453558B6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 00:57:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTbHf1hHBz3dpq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 08:57:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=106.55.201.18; helo=smtpbg.qq.com; envelope-from=jiangjian@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 68 seconds by postgrey-1.36 at boromir; Tue, 21 Jun 2022 22:56:23 AEST
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LS62v2FlZz3bXg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 22:56:22 +1000 (AEST)
X-QQ-mid: bizesmtp85t1655816007tx16ubgh
Received: from ubuntu.localdomain ( [106.117.99.68])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jun 2022 20:53:22 +0800 (CST)
X-QQ-SSF: 0100000000700050B000B00A0000000
X-QQ-FEAT: rCzLTtzQ0geQp+pbd93/gnp9dHiIBybiXO88mAETAH6V50Mq1S6Da4uNbPpKg
	hutvFwg6dHO7XAmvQgxuOW0+u4ckVI2yIZbf5JH/TsbWo6GkMAhl+x0iofAybpKF8Z4JKxs
	b/7pGt+Qs17VqDN4zMVjTtZ2UcIMyhIwujdv9NK0wWOh48Xtis1rL7TlXv/ecZAZ0xeclVy
	zlJUB6Y3a2oQfouHuRFEb5DVsRC1Nku/jzJtAQLIT1ZsJHADUFKx9x4hPQg3VBcsdNMdoTB
	mJY4CmnHOOn8A2G3EyAx81cBQBBf2x9LzhD9j2Htn8vjw2QToIjTalS64tkiEqJVLD1uUHg
	Oi6XsErJHDKu7zmxPcVBSC2CI7MCw==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	arnd@arndb.de
Subject: [PATCH] cxl: drop unexpected word "the" in the comments
Date: Tue, 21 Jun 2022 20:53:21 +0800
Message-Id: <20220621125321.122280-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-Mailman-Approved-At: Fri, 24 Jun 2022 08:56:56 +1000
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
Cc: gregkh@linuxfoundation.org, Jiang Jian <jiangjian@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

there is an unexpected word "the" in the comments that need to be dropped

file: drivers/misc/cxl/cxl.h
line: 1107
+/* check if the given pci_dev is on the the cxl vphb bus */
changed to
+/* check if the given pci_dev is on the cxl vphb bus */

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/misc/cxl/cxl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cxl/cxl.h b/drivers/misc/cxl/cxl.h
index 7a6dd91987fd..0562071cdd4a 100644
--- a/drivers/misc/cxl/cxl.h
+++ b/drivers/misc/cxl/cxl.h
@@ -1104,7 +1104,7 @@ extern const struct cxl_backend_ops cxl_native_ops;
 extern const struct cxl_backend_ops cxl_guest_ops;
 extern const struct cxl_backend_ops *cxl_ops;
 
-/* check if the given pci_dev is on the the cxl vphb bus */
+/* check if the given pci_dev is on the cxl vphb bus */
 bool cxl_pci_is_vphb_device(struct pci_dev *dev);
 
 /* decode AFU error bits in the PSL register PSL_SERR_An */
-- 
2.17.1

