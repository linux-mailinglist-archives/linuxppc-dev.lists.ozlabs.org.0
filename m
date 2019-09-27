Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B53C147A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2019 14:53:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46h57B4BLWzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2019 22:53:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=ddstreet@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fsSv2mM0zDqfW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 23:04:31 +1000 (AEST)
Received: from mail-yw1-f70.google.com ([209.85.161.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <ddstreet@canonical.com>) id 1iDpv9-0007ZP-1w
 for linuxppc-dev@lists.ozlabs.org; Fri, 27 Sep 2019 13:04:27 +0000
Received: by mail-yw1-f70.google.com with SMTP id 123so888074ywq.21
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 06:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g2422qWCHM5rl0rhUoaf7+HFNjo5Bz0O/sMP9pLF2y0=;
 b=DGwWV6oYM+Vsx7FE13Qlh5YRka2M+J2flGSalclpVQsV0j7xHtemDizpTdy7LMgTpU
 dmpSynF7DBcug6n6M8WBiDIuzCsWRRsCqBcGKWmKVU0RQpYOjq6FsqnFqbJcJ2vTOpEg
 LtgNjMA6xKjorgQEQYGTWyw+CmdOmM2FF01XgT+3e15uKeIT8RfE73QiQ1dUt7mjhyKd
 HufWv3QqjJWZNszLTi/Nyph5bbXDG/3djN/KyLak9cmtWC/bOY4BbiZfTpf3mtqJJ08Z
 7FQcuYOZHVuAjWH7fgQ55aMOsrxe2GddOXHxwVBOv6IW4yOhGFWPOQuKKhCKtmSkGIlh
 iEcw==
X-Gm-Message-State: APjAAAVrtgsNBeG2NPvV+vy2DZy8Vz4UBTbF3miw8T+VZq9Vy4tSzqUk
 XtEOkUzUJ6e8DNdoKG3SZbhtoB2MKQhuHiD3kdvEns34pfsqxAVODUBssQQflajb/Gx29VALa3K
 qNpPJGhUBsIp3W73DylcOPl3KCQIET0XJ62a4CLxvgRM=
X-Received: by 2002:a25:6e04:: with SMTP id j4mr5456855ybc.247.1569589466060; 
 Fri, 27 Sep 2019 06:04:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNyrIpPwjsOyG40TGlnqldKE9gez7r5ejHg/79HBnlJm06dD/CVL8kRGzPsYgyzEnCA72Qwg==
X-Received: by 2002:a25:6e04:: with SMTP id j4mr5456828ybc.247.1569589465668; 
 Fri, 27 Sep 2019 06:04:25 -0700 (PDT)
Received: from thorin.lan (45-27-90-188.lightspeed.rlghnc.sbcglobal.net.
 [45.27.90.188])
 by smtp.gmail.com with ESMTPSA id h136sm569448ywc.83.2019.09.27.06.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 06:04:25 -0700 (PDT)
From: Dan Streetman <ddstreet@canonical.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/vio: use simple dummy struct device as bus parent
Date: Fri, 27 Sep 2019 09:04:02 -0400
Message-Id: <20190927130402.687-1-ddstreet@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 29 Sep 2019 22:51:39 +1000
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
Cc: Rob Herring <robh@kernel.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Dan Streetman <ddstreet@canonical.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The dummy vio_bus_device creates the /sys/devices/vio directory, which
contains real vio devices under it; since it represents itself as having
a bus = &vio_bus_type, its /sys/devices/vio/uevent does call the bus's
.uevent function, vio_hotplug(), and as that function won't find a real
device for the dummy vio_dev, it will return -ENODEV.

One of the main users of the uevent node is udevadm, e.g. when it is called
with 'udevadm trigger --devices'.  Up until recently, it would ignore any
errors returned when writing to devices' uevent file, but it was recently
changed to start returning error if it gets an error writing to any uevent
file:
https://github.com/systemd/systemd/commit/97afc0351a96e0daa83964df33937967c75c644f

since the /sys/devices/vio/uevent file has always returned ENODEV from
any write to it, this now causes the udevadm trigger command to return
an error.  This may be fixed in udevadm to ignore ENODEV errors, but the
vio driver should still be fixed.

This patch changes the arch/powerpc/platform/pseries/vio.c 'dummy'
parent device into a real dummy device with no .bus, so its uevent
file will stop returning ENODEV and simply do nothing and return 0.

Signed-off-by: Dan Streetman <ddstreet@canonical.com>
---
 arch/powerpc/platforms/pseries/vio.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 79e2287991db..63bc16631680 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -32,11 +32,8 @@
 #include <asm/page.h>
 #include <asm/hvcall.h>
 
-static struct vio_dev vio_bus_device  = { /* fake "parent" device */
-	.name = "vio",
-	.type = "",
-	.dev.init_name = "vio",
-	.dev.bus = &vio_bus_type,
+static struct device vio_bus = {
+	.init_name	= "vio",
 };
 
 #ifdef CONFIG_PPC_SMLPAR
@@ -1412,7 +1409,7 @@ struct vio_dev *vio_register_device_node(struct device_node *of_node)
 	set_dev_node(&viodev->dev, of_node_to_nid(of_node));
 
 	/* init generic 'struct device' fields: */
-	viodev->dev.parent = &vio_bus_device.dev;
+	viodev->dev.parent = &vio_bus;
 	viodev->dev.bus = &vio_bus_type;
 	viodev->dev.release = vio_dev_release;
 
@@ -1499,7 +1496,7 @@ static int __init vio_bus_init(void)
 	 * The fake parent of all vio devices, just to give us
 	 * a nice directory
 	 */
-	err = device_register(&vio_bus_device.dev);
+	err = device_register(&vio_bus);
 	if (err) {
 		printk(KERN_WARNING "%s: device_register returned %i\n",
 				__func__, err);
-- 
2.20.1

