Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA529408B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 18:31:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFzff4xJ0zDqfk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 03:31:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=vivier.eu
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=laurent@vivier.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vivier.eu
X-Greylist: delayed 340 seconds by postgrey-1.36 at bilbo;
 Wed, 21 Oct 2020 03:29:13 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFzbY2pbmzDqf0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 03:29:13 +1100 (AEDT)
Received: from localhost.localdomain ([82.252.146.14]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MvrRB-1kBaLT25Nn-00stxd; Tue, 20 Oct 2020 18:23:08 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] serial: pmac_zilog: don't init if zilog is not available
Date: Tue, 20 Oct 2020 18:23:03 +0200
Message-Id: <20201020162303.1730562-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bKHy5QQSiE77OMXPCG5t3IA6kn0O8DJhl6MV+YUQP93v0wYpsUL
 coTYiKGAtOBLA3PVaVWj8x5zDK9kGX+W2jYNGYsoMOJ+HEuJCUxIACpOjZfKt0VmMqsTss8
 oVtH8p5n8HCTCqiQGfX6xdIAfG94PL2nv6jie7AOlG5rdMQJGKfXBCXpbqfcyprrUMeyXxf
 NqH1bsfQST/Ym95UPoE9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jLcdZxQQ/jk=:s20Da3hP6S9SPdnAfUuWLQ
 vJ/XDq5qM5R1XMLm29A5BPAZUPZa4wSLR1UWNXnwE3OnFMDkjy1zUaeN5USNDDCPx3mjvD2ev
 IR/Jk9x1ifbY9pBkLzqu16bF0sIJlqU6fryqBxqzWSSK3JxFXcyHcjxhkD2zJa95TYEnyw4ee
 GdpGZPzVtzDx6RX6shOqMRr2lRxdaklxRGFm/6iKJJBHJe+HEnep8jG0t8L0kulj/mt30woS5
 4RFfRTxMZLZqCU9daULLrw/AayyCmLEVdMLY8tZcYKLI0qIDvo3zsDHlVZGvuf3nNYOObdDxw
 qBx4JWJkW+/1VRX6CwkYi28jNOsdO/I9rSkuhmYF7v+zTRICeG4ItLiBtdPL4OsVvoYk7UXA3
 iysr4IosTI83elPB//JKbtpXIeidrgcaYkszR74oOfqjYHfGDEr2kmGGscSZS7JWfVUnEtOFR
 qoUI95A40g==
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
Cc: Laurent Vivier <laurent@vivier.eu>, linux-m68k@lists.linux-m68k.org,
 Paul Mackerras <paulus@samba.org>, linux-serial@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We can avoid to probe for the Zilog device (and generate ugly kernel warning)
if kernel is built for Mac but not on a Mac.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 drivers/tty/serial/pmac_zilog.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index 063484b22523..d1d2e55983c3 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -1867,6 +1867,12 @@ static struct platform_driver pmz_driver = {
 static int __init init_pmz(void)
 {
 	int rc, i;
+
+#ifdef CONFIG_MAC
+	if (!MACH_IS_MAC)
+		return -ENODEV;
+#endif
+
 	printk(KERN_INFO "%s\n", version);
 
 	/* 
@@ -2034,6 +2040,11 @@ static int __init pmz_console_setup(struct console *co, char *options)
 
 static int __init pmz_console_init(void)
 {
+#ifdef CONFIG_MAC
+	if (!MACH_IS_MAC)
+		return -ENODEV;
+#endif
+
 	/* Probe ports */
 	pmz_probe();
 
-- 
2.26.2

