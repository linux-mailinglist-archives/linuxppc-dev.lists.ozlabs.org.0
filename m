Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3042A3BBA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 06:17:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQJ2R2ZVGzDqWS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:17:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i35ly/+5; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQHzj5D80zDqXs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 16:15:28 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id t22so8003775plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 21:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ail4gPbM6KYhcHl/X1E86yuCBJMivDSBFsI62nnOZZI=;
 b=i35ly/+5tSJBMlc6oh6Z2u6MqAFEoYXqT5fbVnsPAF3r/Pt9QXivANWSkY5n0588TV
 ZiGxwwKpGrPaiz00rOrDQv5Uq7knbVX6mjbpCchVaykaSf7/Q9+LWr/91Tx/cUZ+QRwZ
 cOkPp7Dsid5iEYmo3P5TpcfKLPu8jPLVOJluSqnOsSbLVgCOzcdElQ/4jA/hD37pvTQr
 6k5u1Nx5QTm4+FCpFHdCiXRCYT/k/1AlTcJ8KoCpn5wQ2PLiMdlpv3zNIr+UewkjPNcf
 uql90uDs5btkOmz/DAmV0HvwNWkfywfUXKBg8ULGv4eaL2rD8ea6F5EAGEvA/Js3gyTd
 oHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ail4gPbM6KYhcHl/X1E86yuCBJMivDSBFsI62nnOZZI=;
 b=nZ4T8aFX0x6DSd6ZikW60776MLXfiHpCohrwzfyO15MkECOf/k9EdM/8Mkqp/rCdj/
 fVxrGMddTKwlhaPPEEy/9lUJCDAq9J6/kF9oMBz3SZJnwnFG4kmAudZ+w32YJrF2loUR
 hWpwAbSlADJEFNFsm+ScLY6ygAYeKqZ6DXj3uV7sJUMQswqg/XdB5CJer9WDtF9pcLFX
 lC10ZwvduJldefN9w6om4uNgR38+a0WsT9+J749gwdHrXFSnTBCOs+/WwHWJqTq0gKLs
 3sJmWGTSjy+jlP7bmfBFLgyWMkVjMOq6RRP4hx8FSjPVb5Oeux3hfWswu9jYbX2bl0yg
 /XWw==
X-Gm-Message-State: AOAM533CJJTt77gCespkJcHyR1v01scGtk7xyfjblXF0pKSZG7H3aDg8
 eQWYOrPPqgt3vFDbxj5Xp6ex5nfaMDE=
X-Google-Smtp-Source: ABdhPJzHhRHZ9e+taImMI0DE83pc38IhFJ6v3j9w30SeeXMaaiCukc0CCPOVo6HaapkQRao4NbPLjw==
X-Received: by 2002:a17:902:c3c9:b029:d6:7e88:cfa9 with SMTP id
 j9-20020a170902c3c9b02900d67e88cfa9mr23077620plj.64.1604380522380; 
 Mon, 02 Nov 2020 21:15:22 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id 26sm4225357pgm.92.2020.11.02.21.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 21:15:21 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/eeh: Rework pci_dev lookup in debugfs attributes
Date: Tue,  3 Nov 2020 16:15:11 +1100
Message-Id: <20201103051512.919333-1-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pull the string -> pci_dev lookup stuff into a helper function. No functional change.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh.c | 71 ++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 813713c9120c..f9182ff57804 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1596,6 +1596,35 @@ static int proc_eeh_show(struct seq_file *m, void *v)
 }
 
 #ifdef CONFIG_DEBUG_FS
+
+
+static struct pci_dev *eeh_debug_lookup_pdev(struct file *filp,
+					     const char __user *user_buf,
+					     size_t count, loff_t *ppos)
+{
+	uint32_t domain, bus, dev, fn;
+	struct pci_dev *pdev;
+	char buf[20];
+	int ret;
+
+	memset(buf, 0, sizeof(buf));
+	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
+	if (!ret)
+		return ERR_PTR(-EFAULT);
+
+	ret = sscanf(buf, "%x:%x:%x.%x", &domain, &bus, &dev, &fn);
+	if (ret != 4) {
+		pr_err("%s: expected 4 args, got %d\n", __func__, ret);
+		return ERR_PTR(-EINVAL);
+	}
+
+	pdev = pci_get_domain_bus_and_slot(domain, bus, (dev << 3) | fn);
+	if (!pdev)
+		return ERR_PTR(-ENODEV);
+
+	return pdev;
+}
+
 static int eeh_enable_dbgfs_set(void *data, u64 val)
 {
 	if (val)
@@ -1688,26 +1717,13 @@ static ssize_t eeh_dev_check_write(struct file *filp,
 				const char __user *user_buf,
 				size_t count, loff_t *ppos)
 {
-	uint32_t domain, bus, dev, fn;
 	struct pci_dev *pdev;
 	struct eeh_dev *edev;
-	char buf[20];
 	int ret;
 
-	memset(buf, 0, sizeof(buf));
-	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
-	if (!ret)
-		return -EFAULT;
-
-	ret = sscanf(buf, "%x:%x:%x.%x", &domain, &bus, &dev, &fn);
-	if (ret != 4) {
-		pr_err("%s: expected 4 args, got %d\n", __func__, ret);
-		return -EINVAL;
-	}
-
-	pdev = pci_get_domain_bus_and_slot(domain, bus, (dev << 3) | fn);
-	if (!pdev)
-		return -ENODEV;
+	pdev = eeh_debug_lookup_pdev(filp, user_buf, count, ppos);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
 
 	edev = pci_dev_to_eeh_dev(pdev);
 	if (!edev) {
@@ -1717,8 +1733,8 @@ static ssize_t eeh_dev_check_write(struct file *filp,
 	}
 
 	ret = eeh_dev_check_failure(edev);
-	pci_info(pdev, "eeh_dev_check_failure(%04x:%02x:%02x.%01x) = %d\n",
-			domain, bus, dev, fn, ret);
+	pci_info(pdev, "eeh_dev_check_failure(%s) = %d\n",
+			pci_name(pdev), ret);
 
 	pci_dev_put(pdev);
 
@@ -1829,25 +1845,12 @@ static ssize_t eeh_dev_break_write(struct file *filp,
 				const char __user *user_buf,
 				size_t count, loff_t *ppos)
 {
-	uint32_t domain, bus, dev, fn;
 	struct pci_dev *pdev;
-	char buf[20];
 	int ret;
 
-	memset(buf, 0, sizeof(buf));
-	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
-	if (!ret)
-		return -EFAULT;
-
-	ret = sscanf(buf, "%x:%x:%x.%x", &domain, &bus, &dev, &fn);
-	if (ret != 4) {
-		pr_err("%s: expected 4 args, got %d\n", __func__, ret);
-		return -EINVAL;
-	}
-
-	pdev = pci_get_domain_bus_and_slot(domain, bus, (dev << 3) | fn);
-	if (!pdev)
-		return -ENODEV;
+	pdev = eeh_debug_lookup_pdev(filp, user_buf, count, ppos);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
 
 	ret = eeh_debugfs_break_device(pdev);
 	pci_dev_put(pdev);
-- 
2.26.2

