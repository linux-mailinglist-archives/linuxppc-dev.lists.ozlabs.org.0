Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A63456C2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 10:16:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwWHh2Hlpz3bNy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 20:16:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwWHD587zz2yX8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 20:15:50 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HwWH42d7dz9sS7;
 Fri, 19 Nov 2021 10:15:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IzBEoI5QMUda; Fri, 19 Nov 2021 10:15:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HwWH31fGqz9sS9;
 Fri, 19 Nov 2021 10:15:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 26D1B8B7CA;
 Fri, 19 Nov 2021 10:15:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kuJ7z3R-ev94; Fri, 19 Nov 2021 10:15:43 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.70])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D17A08B765;
 Fri, 19 Nov 2021 10:15:42 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1AJ9FTtr226635
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 10:15:29 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1AJ9FSsd226631;
 Fri, 19 Nov 2021 10:15:28 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Evgeniy Polyakov <zbr@ioremap.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] w1: Misuse of get_user()/put_user() reported by sparse
Date: Fri, 19 Nov 2021 10:15:09 +0100
Message-Id: <2163689da6544c289254b3c69848acc36db998f5.1637313047.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1637313307; l=2180; s=20211009;
 h=from:subject:message-id; bh=q/d/etASjF0BJaz00Cw2nQuOF/9xqsT75b2K9Cobhpw=;
 b=BZ4sI+SyXh/G9MdGf3byD4ZeBOqz32LykJgsN/lXyYS4KGA4n88TSMhO8wCPf1Zsy+l6pcA/lB+p
 OPuqwvTDCkwTJLxU8KQksyjCspjbkSPyuwzhK3e06mWs6gIcH7fW
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

sparse warnings: (new ones prefixed by >>)
>> drivers/w1/slaves/w1_ds28e04.c:342:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char [noderef] __user *_pu_addr @@     got char *buf @@
   drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     expected char [noderef] __user *_pu_addr
   drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     got char *buf
>> drivers/w1/slaves/w1_ds28e04.c:356:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __user *_gu_addr @@     got char const *buf @@
   drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     expected char const [noderef] __user *_gu_addr
   drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     got char const *buf

The buffer buf is a failsafe buffer in kernel space, it's not user
memory hence doesn't deserve the use of get_user() or put_user().

Access 'buf' content directly.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202111190526.K5vb7NWC-lkp@intel.com/T/
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/w1/slaves/w1_ds28e04.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds28e04.c b/drivers/w1/slaves/w1_ds28e04.c
index e4f336111edc..d75bb16fb7a1 100644
--- a/drivers/w1/slaves/w1_ds28e04.c
+++ b/drivers/w1/slaves/w1_ds28e04.c
@@ -339,10 +339,7 @@ static BIN_ATTR_RW(pio, 1);
 static ssize_t crccheck_show(struct device *dev, struct device_attribute *attr,
 			     char *buf)
 {
-	if (put_user(w1_enable_crccheck + 0x30, buf))
-		return -EFAULT;
-
-	return sizeof(w1_enable_crccheck);
+	return sprintf(buf, "%d", w1_enable_crccheck);
 }
 
 static ssize_t crccheck_store(struct device *dev, struct device_attribute *attr,
@@ -353,11 +350,8 @@ static ssize_t crccheck_store(struct device *dev, struct device_attribute *attr,
 	if (count != 1 || !buf)
 		return -EINVAL;
 
-	if (get_user(val, buf))
-		return -EFAULT;
-
 	/* convert to decimal */
-	val = val - 0x30;
+	val = *buf - 0x30;
 	if (val != 0 && val != 1)
 		return -EINVAL;
 
-- 
2.33.1

