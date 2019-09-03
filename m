Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EDCA66AF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:39:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N3P26FTMzDqT4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:39:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lVOh+2TG"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N2tf6hm9zDqbg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:16:58 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id x15so8869754pgg.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 03:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=05Vyqz31lkSBSHimWc8LeK1vxaNJj9AkkIin081cPB0=;
 b=lVOh+2TG4GeZaoEhC5SE3DSH1n5V4QZ9KkaFPB0AHua+OJ5bDVP6GkRllZ8pYb/+u9
 izo0Ubyj6MiY4Y9bjhRZQweDaFu7i0gW/URDPPoKHTloQvsJzr2rCtfq7Dc4LvCWZE8z
 wLyAUA3dFzWgW4AciM3lwnSeIgrdgkuGwpwfEUoTx6yysrMdxSLEZPo//X87KUw03bod
 TKImDlOO16ozT7Jpk69xZMTpW/CED42UeYj+X2TSpXye2+Igv7EqkEUBYqaqBIGI9pJW
 J8qhj7sjK65GiqZzKLXDsw/LQKGioUU855wRNPJjItdb70XENBHg9tR7zRGyAwJDmvC8
 1n4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=05Vyqz31lkSBSHimWc8LeK1vxaNJj9AkkIin081cPB0=;
 b=sM0+oo4U+8w1Qi4h1eQ9YacugTjc50H0XDo4fMDW19hk/NRiiNXMQN8hUr+q/EEDbL
 jhs22oyu0DvVN7A0RLeWgngB1mSEmRWYADjCcRfj8Pbvre+yudsalCbW/7cZrnr5DEUi
 kJMqeFFRJwYejNYfcN5yla2+YejcExPo44ZmZYaGiM9y0MDnHLdCktwkMEsxnoqaIw3O
 fL8RPOWDb5V/LjuVYTgudP6D3qQDn/VS9gK4XQVcjRKV/yevtqW+AEccKbtEK7vbNzSN
 UvhoADV4ee/JT38rPjotBhOOdOn250r2nX/dCw/Z+PVBKyi2ddSt9HEh52wjChNg1ssb
 EnAg==
X-Gm-Message-State: APjAAAXAbIwRHMEfBaLDKr5+Iw4NCjjBkZqGtG8gyOH5HlORkMYi0kq0
 j2zizlCwIgiCjyPyCFm4Wl9EjrUg
X-Google-Smtp-Source: APXvYqxVxt5pHTstbtVzOB/+6xxmYHttb25PkmeZzsFcUs27yOoPL4ubPc5ChPZJ0omcJlb9iLDETA==
X-Received: by 2002:a63:20a:: with SMTP id 10mr29131113pgc.226.1567505816491; 
 Tue, 03 Sep 2019 03:16:56 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id e24sm19676701pgk.21.2019.09.03.03.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:16:56 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/14] pci-hotplug/pnv_php: Add support for IODA3 Power9 PHBs
Date: Tue,  3 Sep 2019 20:16:00 +1000
Message-Id: <20190903101605.2890-10-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903101605.2890-1-oohall@gmail.com>
References: <20190903101605.2890-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently we check that an IODA2 compatible PHB is upstream of this slot.
This is mainly to avoid pnv_php creating slots for the various "virtual
PHBs" that we create for NVLink. There's no real need for this restriction
so allow it on IODA3.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci.c | 3 ++-
 drivers/pci/hotplug/pnv_php.c        | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 6104418c9ad5..2825d004dece 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -54,7 +54,8 @@ int pnv_pci_get_slot_id(struct device_node *np, uint64_t *id)
 			break;
 		}
 
-		if (!of_device_is_compatible(parent, "ibm,ioda2-phb")) {
+		if (!of_device_is_compatible(parent, "ibm,ioda2-phb") &&
+		    !of_device_is_compatible(parent, "ibm,ioda3-phb")) {
 			of_node_put(parent);
 			continue;
 		}
diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index b0e243dabf77..6fdf8b74cb0a 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -994,6 +994,9 @@ static int __init pnv_php_init(void)
 	for_each_compatible_node(dn, NULL, "ibm,ioda2-phb")
 		pnv_php_register(dn);
 
+	for_each_compatible_node(dn, NULL, "ibm,ioda3-phb")
+		pnv_php_register(dn);
+
 	return 0;
 }
 
@@ -1003,6 +1006,9 @@ static void __exit pnv_php_exit(void)
 
 	for_each_compatible_node(dn, NULL, "ibm,ioda2-phb")
 		pnv_php_unregister(dn);
+
+	for_each_compatible_node(dn, NULL, "ibm,ioda3-phb")
+		pnv_php_unregister(dn);
 }
 
 module_init(pnv_php_init);
-- 
2.21.0

