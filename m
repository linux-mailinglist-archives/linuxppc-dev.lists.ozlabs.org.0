Return-Path: <linuxppc-dev+bounces-15657-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA43CD1AA7F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 18:35:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drGbZ07Jrz2xjb;
	Wed, 14 Jan 2026 04:35:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768325705;
	cv=none; b=onhI8Ti3Nfvz6vMZ3ynpcZP2w6t+9Sp27dPDycXFhCfS6w4mr5vzq2SNaqm6r3K3negSoSopItN0SRD7ROLNTzEnXjLHi/EwitCVM3qvdTBBHPapR5JVglhG5WxAH9rjrV2M6gcOHhKcj5GN17x9kiomTGwr3jK0XeG3kQGKQNE1Xhq8cXhl7vZZ8rohXjYNbNS6VbsJJVS1O4eJkDq0SC4OOB2ErIDQ9A9Wqpm8MjjoXxVjeAj0N4rxc5nQ8VqSI6shW6WK5nsQvT9Ouc00QOD/wSb5mTyR5G31isquYO0FK1Ka+JlU/3DxMkWhxOKiC9/v9bolxCX1vTQQ27ps8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768325705; c=relaxed/relaxed;
	bh=o9AYRVJbls5kMz4af/phakvFWuIaNCCibN2SZ7D9nuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FY4RM0AiSVytLkiR5sdHjayi49jvYOJs6f17KudYLnbhSmsYmh1y6pTZ1mg2O9OaL8/jsSbEKqWaNflbeL6b9a1zx2mzC3co8FBne8vljisRPc/cSQQIq7XL5gy4oagkRDLA+gv3QQhRMBu/+X1v2keq7XTMFMtuo4rQma0Gt+M93jhWg8yEKZcJYtYDGsV2n0A6HEDkjiCwTeI1YqmH7h66Aem8cuhzzWR/W8B7N3MIP+usbOqa1NoWXayTf27HN+QICRV0/dTBF6BMh/9PkPcWsC030yVwpFWKbjr9nk+O+Mt5H6G0VdaH0rcrqkKJUCrbGMtYkanSewSRNILqlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m1VpwzuP; dkim-atps=neutral; spf=pass (client-ip=209.85.215.178; helo=mail-pg1-f178.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m1VpwzuP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.215.178; helo=mail-pg1-f178.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drGbX4ZF7z2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 04:35:03 +1100 (AEDT)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-bde0f62464cso3227513a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 09:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768325641; x=1768930441; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o9AYRVJbls5kMz4af/phakvFWuIaNCCibN2SZ7D9nuU=;
        b=m1VpwzuP4AvUl/ruO5vieaR1Y43Uvvg/lsOKX7+a4rQcxuXHxla31qHLAfF9RQPsCU
         7yGKYihw89W3RPKgYXMN/GHH+WPzzHuH348zB6EuS38gyogsZYn6QHTQh0/q8686z5Eb
         c/Cke57w/+YT8XXIjiqHuiwB/EnaLRBE6fMWomyoEY8DyvYD/PUArCgmY2WT56+VyTj0
         gl53OrjnsQH/AgU55bu49hBlO+4Y0qfAmMom0GEJcc8DQ89uPLFE+2wiTlfD4Za91fkd
         +IBAc0Na99d1p0fvcX5ZYbd5xjWKqYp6DgJrUWNPg7ZU/F6WgQNDiEk4mCzzlWtiC5Ny
         h20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768325641; x=1768930441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9AYRVJbls5kMz4af/phakvFWuIaNCCibN2SZ7D9nuU=;
        b=fiqkK3ZIe0g7NehwEes3N/ZntfIRehYdV3G8IXGvhYj142RmrXieS8481HZU2rhdZ2
         Dm2XdviKnD+tO3ODxqKvIhRJSDipclzHXV7uh5A74gsHBUk60HJabTu5hzQCAkViZKmW
         seq0ou/30RR/A+ZRrLJ6+Z0vpf/QUuOiuFvVU3SQvynIgztg6ex74XCKeu5vNL2kw6h5
         qqmDIM6vx8Kss1z1Of44j+JPNlnliYQZSwXYScGPxivUMFq+twDbxpSWWxxJUyPTP9mP
         EwByytba10iOQrvjACIfa+IOzGEe5ty9XaKHxp9RcIS8tnD0bSfcol8/u9NSitBOrNYi
         C1Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWLJ2y7vyiua5H13kBWXlPy1E6Jr+pWSa23wyrTd930EjJZuGRocFi/69UOLKRdBRXgz8m24uNsgAVzLFo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzL2xb6kSkk3xlDADMWPBOQ/HbxSI5rC4czhdmZf1m98lCqjVmY
	ECDwH9wCO7HeOcF6s1V6e/jv/JcU/pCuAtQyN989NiDo+xO5fPjZn6g=
X-Gm-Gg: AY/fxX7JGsKKupOw9p4ESv/IrGW7fdeOl0EVr6ovIdjaw6uJZpf883LgxsBbt9up688
	YrE8b1AQnUQoadEV5KpG6IpnUG3OuyslB7sI/2iJkvLxyK0usSRhy5TmOBy6stsY15+pIP4uBzX
	R2gm/6sGaa3ttPWk5II/mDMkqU07H+/8PBngxKiwrk+o4ioPJ0tLjqMH/xTTfeCkI9RmGTBZ8W3
	xG+y1sGevu+1T45l8iD8ARj1snM6k9Zo/T/3v4VuB2XVvAmnfYygDLBp53hyRFyUgC3yqaZLz3V
	dXhKEwEHXIJ2Rgy8UvRog011ol3WSty0J7n8ORgL2k9gPKVb8Rt+Za5ywDVLRDDq3HD/VI+MIPb
	OV0Hs9wehca38qF9AE/ZZRE6kk42vRnxv1DcB9RR8eai5KU6rJMHTd9ihah7EWCGzUgzIReKHcp
	gOpWJfK8QPFZ+vaYZJOQ==
X-Google-Smtp-Source: AGHT+IFVIOA0i/RAZfOle5Rnk5OR3hAeebkOKtj4cj5B/mfjbUzBpEhX9pRkYTvlm8gfa3/cjIZpdw==
X-Received: by 2002:a05:6a20:2450:b0:361:3bdb:26df with SMTP id adf61e73a8af0-3898f889453mr21192202637.5.1768325640779;
        Tue, 13 Jan 2026 09:34:00 -0800 (PST)
Received: from at.. ([171.61.166.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f66f9cf38sm4568854b3a.53.2026.01.13.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:34:00 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Dave Jiang <dave.jiang@intel.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: [PATCH RESEND v6] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Tue, 13 Jan 2026 17:33:41 +0000
Message-ID: <20260113173351.1417-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Disable AER for Intel Titan Ridge 4C 2018
(used in T2 iMacs, where the warnings appear)
that generate continuous pcieport warnings. such as:

pcieport 0000:00:1c.4: AER: Correctable error message received from 0000:07:00.0
pcieport 0000:07:00.0: PCIe Bus Error: severity=Correctable, type=Data Link Layer, (Receiver ID)
pcieport 0000:07:00.0:   device [8086:15ea] error status/mask=00000080/00002000
pcieport 0000:07:00.0:    [ 7] BadDLLP

macOS also disables AER for Thunderbolt devices and controllers in their drivers.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220651
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

---
Changes since v5:
- Used the correct name for DMI check
- Used DECLARE_PCI_FIXUP_EARLY instead of DECLARE_PCI_FIXUP_FINAL
  to disable aer, before the aer init function
Changes since v4:
- Used lowercase hex letters
- Used DMI_BOARD_VENDOR instead of DMI_SYS_VENDOR
Chnages since v3:
- Fixed Grammer mistakes
Changes since v2:
- Transferred logic to arch/x86/pci/fixup.c to only target x86
- Added DMI quirk to only target Apple Systems
Changes since v1:
- Transferred logic to drivers/pci/quicks.c
---
---
 arch/x86/pci/fixup.c       | 12 ++++++++++++
 drivers/pci/pcie/aer.c     |  3 +++
 drivers/pci/pcie/portdrv.c |  2 +-
 include/linux/pci.h        |  1 +
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/x86/pci/fixup.c b/arch/x86/pci/fixup.c
index 25076a5acd96..402387e41450 100644
--- a/arch/x86/pci/fixup.c
+++ b/arch/x86/pci/fixup.c
@@ -1081,3 +1081,15 @@ static void quirk_tuxeo_rp_d3(struct pci_dev *pdev)
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AMD, 0x1502, quirk_tuxeo_rp_d3);
 #endif /* CONFIG_SUSPEND */
+
+#ifdef CONFIG_PCIEAER
+
+static void quirk_disable_aer(struct pci_dev *pdev)
+{
+	if (dmi_match(DMI_BOARD_VENDOR, "Apple Inc."))
+		pdev->no_aer = 1;
+}
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x15ea, quirk_disable_aer);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x15eb, quirk_disable_aer);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x15ec, quirk_disable_aer);
+#endif /* CONFIG_PCIEAER */
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e0bcaa896803..45604564ce6f 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -389,6 +389,9 @@ void pci_aer_init(struct pci_dev *dev)
 {
 	int n;
 
+	if (dev->no_aer)
+		return;
+
 	dev->aer_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
 	if (!dev->aer_cap)
 		return;
diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
index 38a41ccf79b9..ab904a224296 100644
--- a/drivers/pci/pcie/portdrv.c
+++ b/drivers/pci/pcie/portdrv.c
@@ -240,7 +240,7 @@ static int get_port_device_capability(struct pci_dev *dev)
 	if ((pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT ||
              pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC) &&
 	    dev->aer_cap && pci_aer_available() &&
-	    (pcie_ports_native || host->native_aer))
+	    (pcie_ports_native || host->native_aer) && !dev->no_aer)
 		services |= PCIE_PORT_SERVICE_AER;
 #endif
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 864775651c6f..f447f86c6bdf 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -440,6 +440,7 @@ struct pci_dev {
 	unsigned int	multifunction:1;	/* Multi-function device */
 
 	unsigned int	is_busmaster:1;		/* Is busmaster */
+	unsigned int	no_aer:1;		/* May not use AER */
 	unsigned int	no_msi:1;		/* May not use MSI */
 	unsigned int	no_64bit_msi:1;		/* May only use 32-bit MSIs */
 	unsigned int	block_cfg_access:1;	/* Config space access blocked */
-- 
2.43.0


