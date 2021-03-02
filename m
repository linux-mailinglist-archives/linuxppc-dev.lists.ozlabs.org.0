Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84537329677
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 07:43:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqSJq49P5z3cnx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 17:43:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=jslaby@suse.cz;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1273 seconds by postgrey-1.36 at boromir;
 Tue, 02 Mar 2021 17:43:39 AEDT
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqSJW5dvwz2xxj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 17:43:39 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54BE3B03F;
 Tue,  2 Mar 2021 06:22:22 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: gregkh@linuxfoundation.org
Subject: [PATCH 40/44] tty: hvc, drop unneeded forward declarations
Date: Tue,  2 Mar 2021 07:22:10 +0100
Message-Id: <20210302062214.29627-40-jslaby@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302062214.29627-1-jslaby@suse.cz>
References: <20210302062214.29627-1-jslaby@suse.cz>
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
Cc: linuxppc-dev@lists.ozlabs.org, Jiri Slaby <jslaby@suse.cz>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Forward declarations make the code larger and rewrites harder. Harder as
they are often omitted from global changes. Remove forward declarations
which are not really needed, i.e. the definition of the function is
before its first use.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: linuxppc-dev@lists.ozlabs.org
---
 drivers/tty/hvc/hvcs.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/tty/hvc/hvcs.c b/drivers/tty/hvc/hvcs.c
index c90848919644..0b89d878a108 100644
--- a/drivers/tty/hvc/hvcs.c
+++ b/drivers/tty/hvc/hvcs.c
@@ -290,36 +290,11 @@ static LIST_HEAD(hvcs_structs);
 static DEFINE_SPINLOCK(hvcs_structs_lock);
 static DEFINE_MUTEX(hvcs_init_mutex);
 
-static void hvcs_unthrottle(struct tty_struct *tty);
-static void hvcs_throttle(struct tty_struct *tty);
-static irqreturn_t hvcs_handle_interrupt(int irq, void *dev_instance);
-
-static int hvcs_write(struct tty_struct *tty,
-		const unsigned char *buf, int count);
-static int hvcs_write_room(struct tty_struct *tty);
-static int hvcs_chars_in_buffer(struct tty_struct *tty);
-
-static int hvcs_has_pi(struct hvcs_struct *hvcsd);
-static void hvcs_set_pi(struct hvcs_partner_info *pi,
-		struct hvcs_struct *hvcsd);
 static int hvcs_get_pi(struct hvcs_struct *hvcsd);
 static int hvcs_rescan_devices_list(void);
 
-static int hvcs_partner_connect(struct hvcs_struct *hvcsd);
 static void hvcs_partner_free(struct hvcs_struct *hvcsd);
 
-static int hvcs_enable_device(struct hvcs_struct *hvcsd,
-		uint32_t unit_address, unsigned int irq, struct vio_dev *dev);
-
-static int hvcs_open(struct tty_struct *tty, struct file *filp);
-static void hvcs_close(struct tty_struct *tty, struct file *filp);
-static void hvcs_hangup(struct tty_struct * tty);
-
-static int hvcs_probe(struct vio_dev *dev,
-		const struct vio_device_id *id);
-static int hvcs_remove(struct vio_dev *dev);
-static int __init hvcs_module_init(void);
-static void __exit hvcs_module_exit(void);
 static int hvcs_initialize(void);
 
 #define HVCS_SCHED_READ	0x00000001
-- 
2.30.1

