Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC89A66BF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:47:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N3ZN2XHhzDqNp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:47:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="p81+yNP+"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N2tq1H7NzDqbW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:17:07 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n190so8891838pgn.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+TfXIH0JHrv6KFRGhRuIfBcE9uunCD5gj920FOI6KEY=;
 b=p81+yNP+T53tOSFNeLpEKW+OTmOl/JTOR3nSNdM6vvq1d2qblRKN3ZPbKczNIFLtY5
 X85bBwX2aa9/qX0gIdXIqm3oc1ZmfQbS1+nsZtY+LVG1il7IhKpgsDXpLAtqD9aOQGgk
 IbWyxHRLR73iN8Icm0enuc+CMw1US62ZH7oUSXJyft3y+vARv0H+oXnKPj848RindzVS
 ibAqn0XDrmpwHW8P8xuvJKhRpLC08mksWRbfVmmEEYFyP0xJI4OVimCtEYerCcVxx5fC
 9YnPFCUnooeuYPgFIqzrk+8KmQV8Anb1425ZiMF0LX71HSYXtVyxcb7ZKHTNjzdBTwaO
 ULCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+TfXIH0JHrv6KFRGhRuIfBcE9uunCD5gj920FOI6KEY=;
 b=sMbU3ePGx9A5YJwogARHOeVtpfBlRvoHOFn5+7kOwCXjpsFVXA9GCocmHm9FwtgkzJ
 pyyZ+t1A1f/X4cVENxLrKfis4OIVjklp8Si8d7FI7c5PnXZN/v1TqF9DuCbaSrn8DDXB
 WvVPmTT2CnAWXJaPVO5WOMibsS9CBdZ4cBExk4P6A6zBRTt/v7pkUq8Ten1nGZWDXPWO
 31Vlpudv8McjjzArw2v1LJz1zGq3WPoa5Vs+Tde6zd9Jf5XbR5/I3N+f5TjUoNbpImf/
 5hla3thUQaYs2eBXOUQgCiN4qja7F8SkdB7mRpCLomM0Y2U7UEg2a0oHAmKO34nCeUCw
 aWbQ==
X-Gm-Message-State: APjAAAWaDoQ+MprwCX1BD8ySiKKJpZD4EBiakUP5L1P1PfmOZuzRs7WC
 lG6e5CsLDMbNGNb7SkkoNsP45VLy
X-Google-Smtp-Source: APXvYqxCkDpCPBP4JHWQft0MKSZbvl9irPdENIrgyrHEeT21rJ4eyJfFlSZQr6e9qM6K30oBnGZ8Xg==
X-Received: by 2002:a63:9e43:: with SMTP id r3mr30116524pgo.148.1567505825060; 
 Tue, 03 Sep 2019 03:17:05 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id e24sm19676701pgk.21.2019.09.03.03.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:17:04 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/14] powerpc/eeh: Add a eeh_dev_break debugfs interface
Date: Tue,  3 Sep 2019 20:16:04 +1000
Message-Id: <20190903101605.2890-14-oohall@gmail.com>
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

Add an interface to debugfs for generating an EEH event on a given device.
This works by disabling memory accesses to and from the device by setting
the PCI_COMMAND register (or the VF Memory Space Enable on the parent PF).

This is a somewhat portable alternative to using the platform specific
error injection mechanisms since those tend to be either hard to use, or
straight up broken. For pseries the interfaces also requires the use of
/dev/mem which is probably going to go away in a post-LOCKDOWN world
(and it's a horrific hack to begin with) so moving to a kernel-provided
interface makes sense and provides a sane, cross-platform interface for
userspace so we can write more generic testing scripts.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh.c | 139 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 138 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index ace1c5a6b8ed..a55d2f01da1d 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1894,7 +1894,8 @@ static ssize_t eeh_dev_check_write(struct file *filp,
 	char buf[20];
 	int ret;
 
-	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
+	memset(buf, 0, sizeof(buf));
+	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
 	if (!ret)
 		return -EFAULT;
 
@@ -1931,6 +1932,139 @@ static const struct file_operations eeh_dev_check_fops = {
 	.read   = eeh_debugfs_dev_usage,
 };
 
+static int eeh_debugfs_break_device(struct pci_dev *pdev)
+{
+	struct resource *bar = NULL;
+	void __iomem *mapped;
+	u16 old, bit;
+	int i, pos;
+
+	/* Do we have an MMIO BAR to disable? */
+	for (i = 0; i <= PCI_STD_RESOURCE_END; i++) {
+		struct resource *r = &pdev->resource[i];
+
+		if (!r->flags || !r->start)
+			continue;
+		if (r->flags & IORESOURCE_IO)
+			continue;
+		if (r->flags & IORESOURCE_UNSET)
+			continue;
+
+		bar = r;
+		break;
+	}
+
+	if (!bar) {
+		pci_err(pdev, "Unable to find Memory BAR to cause EEH with\n");
+		return -ENXIO;
+	}
+
+	pci_err(pdev, "Going to break: %pR\n", bar);
+
+	if (pdev->is_virtfn) {
+#ifndef CONFIG_IOV
+		return -ENXIO;
+#else
+		/*
+		 * VFs don't have a per-function COMMAND register, so the best
+		 * we can do is clear the Memory Space Enable bit in the PF's
+		 * SRIOV control reg.
+		 *
+		 * Unfortunately, this requires that we have a PF (i.e doesn't
+		 * work for a passed-through VF) and it has the potential side
+		 * effect of also causing an EEH on every other VF under the
+		 * PF. Oh well.
+		 */
+		pdev = pdev->physfn;
+		if (!pdev)
+			return -ENXIO; /* passed through VFs have no PF */
+
+		pos  = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
+		pos += PCI_SRIOV_CTRL;
+		bit  = PCI_SRIOV_CTRL_MSE;
+#endif /* !CONFIG_IOV */
+	} else {
+		bit = PCI_COMMAND_MEMORY;
+		pos = PCI_COMMAND;
+	}
+
+	/*
+	 * Process here is:
+	 *
+	 * 1. Disable Memory space.
+	 *
+	 * 2. Perform an MMIO to the device. This should result in an error
+	 *    (CA  / UR) being raised by the device which results in an EEH
+	 *    PE freeze. Using the in_8() accessor skips the eeh detection hook
+	 *    so the freeze hook so the EEH Detection machinery won't be
+	 *    triggered here. This is to match the usual behaviour of EEH
+	 *    where the HW will asyncronously freeze a PE and it's up to
+	 *    the kernel to notice and deal with it.
+	 *
+	 * 3. Turn Memory space back on. This is more important for VFs
+	 *    since recovery will probably fail if we don't. For normal
+	 *    the COMMAND register is reset as a part of re-initialising
+	 *    the device.
+	 *
+	 * Breaking stuff is the point so who cares if it's racy ;)
+	 */
+	pci_read_config_word(pdev, pos, &old);
+
+	mapped = ioremap(bar->start, PAGE_SIZE);
+	if (!mapped) {
+		pci_err(pdev, "Unable to map MMIO BAR %pR\n", bar);
+		return -ENXIO;
+	}
+
+	pci_write_config_word(pdev, pos, old & ~bit);
+	in_8(mapped);
+	pci_write_config_word(pdev, pos, old);
+
+	iounmap(mapped);
+
+	return 0;
+}
+
+static ssize_t eeh_dev_break_write(struct file *filp,
+				const char __user *user_buf,
+				size_t count, loff_t *ppos)
+{
+	uint32_t domain, bus, dev, fn;
+	struct pci_dev *pdev;
+	char buf[20];
+	int ret;
+
+	memset(buf, 0, sizeof(buf));
+	ret = simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, count);
+	if (!ret)
+		return -EFAULT;
+
+	ret = sscanf(buf, "%x:%x:%x.%x", &domain, &bus, &dev, &fn);
+	if (ret != 4) {
+		pr_err("%s: expected 4 args, got %d\n", __func__, ret);
+		return -EINVAL;
+	}
+
+	pdev = pci_get_domain_bus_and_slot(domain, bus, (dev << 3) | fn);
+	if (!pdev)
+		return -ENODEV;
+
+	ret = eeh_debugfs_break_device(pdev);
+	pci_dev_put(pdev);
+
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static const struct file_operations eeh_dev_break_fops = {
+	.open	= simple_open,
+	.llseek	= no_llseek,
+	.write	= eeh_dev_break_write,
+	.read   = eeh_debugfs_dev_usage,
+};
+
 #endif
 
 static int __init eeh_init_proc(void)
@@ -1949,6 +2083,9 @@ static int __init eeh_init_proc(void)
 		debugfs_create_file_unsafe("eeh_dev_check", 0600,
 				powerpc_debugfs_root, NULL,
 				&eeh_dev_check_fops);
+		debugfs_create_file_unsafe("eeh_dev_break", 0600,
+				powerpc_debugfs_root, NULL,
+				&eeh_dev_break_fops);
 		debugfs_create_file_unsafe("eeh_force_recover", 0600,
 				powerpc_debugfs_root, NULL,
 				&eeh_force_recover_fops);
-- 
2.21.0

