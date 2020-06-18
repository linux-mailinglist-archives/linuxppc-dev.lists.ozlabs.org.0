Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 383171FE9BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 06:03:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nSwk2grLzDrLK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 14:03:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=TispCKQ9; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nPRl0pzYzDqQ4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 11:26:59 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBFF121D7A;
 Thu, 18 Jun 2020 01:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443616;
 bh=oqIcZ64gHNPxT0KHLAgO/j9K6bCutIfJbvYtWmH2lWQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TispCKQ9ZF9BFIuJua/OFPk5CU7uuXYf2hcKVsmYBpGbBSN2Sf9F5J3DdYlDdDixq
 SFIZY2TyhQMwZV2LE1VLh/uLe/5LCn1AEM09usO+xun5KghrbMl7dgDILYXhsDnL7y
 LT6IF7diZfEtfRur6z4OqoyKW7QDA940WOIiuLO4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 043/108] tty: hvc: Fix data abort due to race in
 hvc_open
Date: Wed, 17 Jun 2020 21:24:55 -0400
Message-Id: <20200618012600.608744-43-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012600.608744-1-sashal@kernel.org>
References: <20200618012600.608744-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Raghavendra Rao Ananta <rananta@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Raghavendra Rao Ananta <rananta@codeaurora.org>

[ Upstream commit e2bd1dcbe1aa34ff5570b3427c530e4332ecf0fe ]

Potentially, hvc_open() can be called in parallel when two tasks calls
open() on /dev/hvcX. In such a scenario, if the hp->ops->notifier_add()
callback in the function fails, where it sets the tty->driver_data to
NULL, the parallel hvc_open() can see this NULL and cause a memory abort.
Hence, serialize hvc_open and check if tty->private_data is NULL before
proceeding ahead.

The issue can be easily reproduced by launching two tasks simultaneously
that does nothing but open() and close() on /dev/hvcX.
For example:
$ ./simple_open_close /dev/hvc0 & ./simple_open_close /dev/hvc0 &

Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
Link: https://lore.kernel.org/r/20200428032601.22127-1-rananta@codeaurora.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/hvc/hvc_console.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index d52221ae1b85..663cbe3669e1 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -88,6 +88,8 @@ static LIST_HEAD(hvc_structs);
  */
 static DEFINE_SPINLOCK(hvc_structs_lock);
 
+/* Mutex to serialize hvc_open */
+static DEFINE_MUTEX(hvc_open_mutex);
 /*
  * This value is used to assign a tty->index value to a hvc_struct based
  * upon order of exposure via hvc_probe(), when we can not match it to
@@ -332,16 +334,24 @@ static int hvc_install(struct tty_driver *driver, struct tty_struct *tty)
  */
 static int hvc_open(struct tty_struct *tty, struct file * filp)
 {
-	struct hvc_struct *hp = tty->driver_data;
+	struct hvc_struct *hp;
 	unsigned long flags;
 	int rc = 0;
 
+	mutex_lock(&hvc_open_mutex);
+
+	hp = tty->driver_data;
+	if (!hp) {
+		rc = -EIO;
+		goto out;
+	}
+
 	spin_lock_irqsave(&hp->port.lock, flags);
 	/* Check and then increment for fast path open. */
 	if (hp->port.count++ > 0) {
 		spin_unlock_irqrestore(&hp->port.lock, flags);
 		hvc_kick();
-		return 0;
+		goto out;
 	} /* else count == 0 */
 	spin_unlock_irqrestore(&hp->port.lock, flags);
 
@@ -369,6 +379,8 @@ static int hvc_open(struct tty_struct *tty, struct file * filp)
 	/* Force wakeup of the polling thread */
 	hvc_kick();
 
+out:
+	mutex_unlock(&hvc_open_mutex);
 	return rc;
 }
 
-- 
2.25.1

