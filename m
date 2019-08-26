Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0CF9CE78
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 13:47:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H9HB0724zDqVV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 21:47:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pjRaJmdD"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H6jS2TZZzDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 19:51:49 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id d16so15184725wme.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 02:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bdmKhVsf2XwxhKkj21KNp57P6t/lfQgh9WrNnl0h77Q=;
 b=pjRaJmdDhBq6nrZeEPzuRis8Uk9Kz4zPHfrfq0xCRFIJorlN6KPMu6gpYzYcrN/Lxg
 bkk9FyFsaRb9RjNKLFPWjbUe/vvucGzLSWvkOLgh225dTGlezgAk3JjgTCYQRCMUait2
 F62atwh0b3M3sjEYNkGLu9DZHnhhKzD4GeZspT6pkR9uGwm9KdFu/KAuOu04GMIeVsI0
 WKbRby1S8wbq2kaG70eV71THRo/5dPmbAhDNSHAdEEGGeQ0RVWjhy6T8jVa1cjGmnVDC
 WadyLhobcN45osbOAitpxZpfbvzRnhhX6Ky2NUdAXqtCtH7IuFJ+f52UH4KiU8GDv0Vk
 AKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bdmKhVsf2XwxhKkj21KNp57P6t/lfQgh9WrNnl0h77Q=;
 b=miJ8VzfbzOzG/6td/PT/Nht037ach9cZQ8ZIwHxNkz6Q2ZxM9ETrnAaxvPsR/NQfXw
 FLX3+S5NRYjC+y0LFfqy8nDCLBaooQ0gDm4F5Xj5j39tkVQnsFKGLXyM2sSUTw+rzxX0
 zxQi2b3F0AXHvlZZaw7JdxgRo3HbURWfXzw50Ef5lSxs/PJ2LS+dLKNyVzKG44lX9DqT
 Fg6AwZttjd41RqJqik2UeDPuBtj5jC8cus9INR5dl5oraBdnYRsUcOOdgjBsB+9Y/dPv
 ALED+Q8QaQ2U7fomwWJhXqwGFrbi22aAWfv4ZMEwChpeQ0SCUK6lAwRqwDTub0rrFhJ0
 3EIQ==
X-Gm-Message-State: APjAAAUkoi8Bvz41NmgdW8XvBdgFFrWzFpv4H6AI6k09vdZl4zmF5XeB
 7VZXk+rPE2kBrwl3kzfcH8M=
X-Google-Smtp-Source: APXvYqyfSXYCXi59//fK6HqOrzjSVNVIFBBxyHN7H9vziw7LDfK15wJcF/6Ao7CJ8feIDd5iU66a3A==
X-Received: by 2002:a1c:f103:: with SMTP id p3mr19846034wmh.18.1566813105790; 
 Mon, 26 Aug 2019 02:51:45 -0700 (PDT)
Received: from localhost.localdomain (ip5b4096c3.dynamic.kabel-deutschland.de.
 [91.64.150.195])
 by smtp.gmail.com with ESMTPSA id a17sm6121113wmm.47.2019.08.26.02.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 02:51:44 -0700 (PDT)
From: Krzysztof Wilczynski <kw@linux.com>
To: Scott Murray <scott@spiteful.org>
Subject: [PATCH] PCI: hotplug: Remove surplus return from a void function
Date: Mon, 26 Aug 2019 11:51:43 +0200
Message-Id: <20190826095143.21353-1-kw@linux.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Aug 2019 21:45:20 +1000
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, YueHaibing <yuehaibing@huawei.com>,
 Sebastian Ott <sebott@linux.ibm.com>, linux-pci@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Lukas Wunner <lukas@wunner.de>,
 Bjorn Helgaas <helgaas@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove unnecessary empty return statement at the end of a void
function in the following:

  - drivers/pci/hotplug/cpci_hotplug_core.c: cleanup_slots()
  - drivers/pci/hotplug/cpqphp_core.c: pci_print_IRQ_route()
  - drivers/pci/hotplug/cpqphp_ctrl.c: cpqhp_pushbutton_thread()
  - drivers/pci/hotplug/cpqphp_ctrl.c: interrupt_event_handler()
  - drivers/pci/hotplug/cpqphp_nvram.h: compaq_nvram_init()
  - drivers/pci/hotplug/rpadlpar_core.c: rpadlpar_io_init()
  - drivers/pci/hotplug/rpaphp_core.c: cleanup_slots()

Signed-off-by: Krzysztof Wilczynski <kw@linux.com>
---
 drivers/pci/hotplug/cpci_hotplug_core.c | 1 -
 drivers/pci/hotplug/cpqphp_core.c       | 1 -
 drivers/pci/hotplug/cpqphp_ctrl.c       | 4 ----
 drivers/pci/hotplug/cpqphp_nvram.h      | 5 +----
 drivers/pci/hotplug/rpadlpar_core.c     | 1 -
 drivers/pci/hotplug/rpaphp_core.c       | 1 -
 6 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/pci/hotplug/cpci_hotplug_core.c b/drivers/pci/hotplug/cpci_hotplug_core.c
index 603eadf3d965..d0559d2faf50 100644
--- a/drivers/pci/hotplug/cpci_hotplug_core.c
+++ b/drivers/pci/hotplug/cpci_hotplug_core.c
@@ -563,7 +563,6 @@ cleanup_slots(void)
 	}
 cleanup_null:
 	up_write(&list_rwsem);
-	return;
 }
 
 int
diff --git a/drivers/pci/hotplug/cpqphp_core.c b/drivers/pci/hotplug/cpqphp_core.c
index 16bbb183695a..b8aacb41a83c 100644
--- a/drivers/pci/hotplug/cpqphp_core.c
+++ b/drivers/pci/hotplug/cpqphp_core.c
@@ -173,7 +173,6 @@ static void pci_print_IRQ_route(void)
 		dbg("%d %d %d %d\n", tbus, tdevice >> 3, tdevice & 0x7, tslot);
 
 	}
-	return;
 }
 
 
diff --git a/drivers/pci/hotplug/cpqphp_ctrl.c b/drivers/pci/hotplug/cpqphp_ctrl.c
index b7f4e1f099d9..68de958a9be8 100644
--- a/drivers/pci/hotplug/cpqphp_ctrl.c
+++ b/drivers/pci/hotplug/cpqphp_ctrl.c
@@ -1872,8 +1872,6 @@ static void interrupt_event_handler(struct controller *ctrl)
 			}
 		}		/* End of FOR loop */
 	}
-
-	return;
 }
 
 
@@ -1943,8 +1941,6 @@ void cpqhp_pushbutton_thread(struct timer_list *t)
 
 		p_slot->state = STATIC_STATE;
 	}
-
-	return;
 }
 
 
diff --git a/drivers/pci/hotplug/cpqphp_nvram.h b/drivers/pci/hotplug/cpqphp_nvram.h
index 918ff8dbfe62..70e879b6a23f 100644
--- a/drivers/pci/hotplug/cpqphp_nvram.h
+++ b/drivers/pci/hotplug/cpqphp_nvram.h
@@ -16,10 +16,7 @@
 
 #ifndef CONFIG_HOTPLUG_PCI_COMPAQ_NVRAM
 
-static inline void compaq_nvram_init(void __iomem *rom_start)
-{
-	return;
-}
+static inline void compaq_nvram_init(void __iomem *rom_start) { }
 
 static inline int compaq_nvram_load(void __iomem *rom_start, struct controller *ctrl)
 {
diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
index 182f9e3443ee..977946e4e613 100644
--- a/drivers/pci/hotplug/rpadlpar_core.c
+++ b/drivers/pci/hotplug/rpadlpar_core.c
@@ -473,7 +473,6 @@ int __init rpadlpar_io_init(void)
 void rpadlpar_io_exit(void)
 {
 	dlpar_sysfs_exit();
-	return;
 }
 
 module_init(rpadlpar_io_init);
diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index c3899ee1db99..18627bb21e9e 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -408,7 +408,6 @@ static void __exit cleanup_slots(void)
 		pci_hp_deregister(&slot->hotplug_slot);
 		dealloc_slot_struct(slot);
 	}
-	return;
 }
 
 static int __init rpaphp_init(void)
-- 
2.22.1

