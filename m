Return-Path: <linuxppc-dev+bounces-15482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C004AD0D2BC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jan 2026 08:36:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp9SL5CmWz2yFk;
	Sat, 10 Jan 2026 18:36:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767939614;
	cv=none; b=jkLDs1wqV9VrRmyBx8jADr1n4axSmkdavySgb6Z79qBzq2Fb9oHtEYFtgYKakPqQ2BpaizZzlenJA6jXT47L99XY4Gc4wtRduBuvT0zEu+nuMdWngs84GLiwdZbYlpXzfzatzsesAsYigQDcfXYozEaBoi25z6ciYdme3BXKN8jfryv+Vmt/aRNC2LAPXVK4GP3ItzP4GCe/yAh5ziGgVH0YA7uRGVwGClOV9QQVeFRKF43+szWVq8PTrb/V6EoEzzHvsjopkM+HPj5uc6T6Yg6udbcYk1Q13/XrkSZBox3TGnMzKrEi8LRZShWGxzvgKTS1lKF7LY3d1tHbAYyjJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767939614; c=relaxed/relaxed;
	bh=mxcIAZdi8DSHabnzsxkENQYm/KIvgyHbwki+UOtqU4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W2bBWGNVoDgEp3BMJuVPJK1EU2YqFfLyZEX2iqiR5Pcq03bs323C9wKkxv8UopPik0M4Hz+W8xN3WezlSLjOG7O5gJLF9uqTEF9tfLdjuJptThqvOqLRklVRVvWHyLY4R/ZD++4xoC1Ie3orY4F9fM2R5S3znhz5akwp8Ie5qPUq3tsTOnt7kjG5nIr+9DIa0K+CK1gNsyfRelISlB4xAkHDrGflKlgVI81q7GmOnVyXRhuWksmWHaWuPRH7mZkzDgZOYsK27NjOxEIULmTp2zB82Ktmux1mAC7PD/3br87hJfK1q8U+MslFwB6VNtSSaIn1/X7uWEIcEdnjGqffXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LBIchNj6; dkim-atps=neutral; spf=pass (client-ip=209.85.214.181; helo=mail-pl1-f181.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LBIchNj6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.181; helo=mail-pl1-f181.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnWpj6SkMz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 17:20:13 +1100 (AEDT)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0d6f647e2so41809335ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 22:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767939551; x=1768544351; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mxcIAZdi8DSHabnzsxkENQYm/KIvgyHbwki+UOtqU4s=;
        b=LBIchNj6130OT6ygm9E7XDOVHVSbGOCQR8Y5eH91cy4eDH90jHZAw7rpyJPvVeOG1a
         J7ANJa0zk7vSJusZbsLYardnGEYbhL2+b/DDRMYzQXoOkM0VQGMm2ucQptNXn8TXHyW7
         yP6FG7hetdwmwjJSiqf4Y8YbTMug9N43pZC/Npz85o27pyKiNn3KqL69I8S9exOkUvUy
         SWblWKc8L6kek4/XqH7JLYigcdyQGHihMzFvjTv770jUlWuf1SBTe1humxP0axHZSO2B
         wFAMtr1k7LfBrIVUNacJMz3YLjLgkH8bjmYu+W8aedXXImAl6r57dh2I9PwVPPnCkBxa
         X4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767939551; x=1768544351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxcIAZdi8DSHabnzsxkENQYm/KIvgyHbwki+UOtqU4s=;
        b=NZmY2rZXHsri+XkjIaJeYj0ZJbVgbuh8quu81ZRmiSRJyayRn80YnDUROBouKeaJG8
         GhucddY2Q9gE3uRBlIKEUHVgsSm1d/GLJbrQjYQIdahOSkh7uRgg/tpOqiXSYfDvWHF1
         18q3rY7XRDNP1E3mldejJtsz+nnprVuYVySIRqQR0lBn/zsX6gzAw1453+ZXyYkVk5gE
         VMTXvwCpoI9d5hKXdWJSrs/v0BS9OUf8nH5RuYmBQcEtGsshDniycTjUsz7vMkB9SnQs
         lSRy7pBF8yjFs0KflRcTZksxneZ8GgfRIqJAXYoeiFcjljh9ZTl/JTEcunbr1N6LSZRc
         0Xmg==
X-Forwarded-Encrypted: i=1; AJvYcCWy0XFFxm8u3QdjrHG4qKab6NgeY0tbZLyhk/smMMtzjl6mNU714YeKtLOSQ1jn+JCU5L697Q+KN1cGHJ0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHq5NR5ZxcqMISWCftyZW5Ro5wWe7ix/SQ7mDJIbpz9ALI35Oo
	QqXC6pAhIkvFz2u4AY2BqDVk1k3adoNNLAznAqXyGPj8L+icPSMk0ho=
X-Gm-Gg: AY/fxX4TCvytyFoE1yDJU2DnKbKhAzwQr53O/BAITZPYH/79i75lNngJdWm/Or3o2V0
	AkkzE2297pQkPue/8WxByHIC3NQxyOR6MVvzYVn+hVItSLE2x2fTCLqh+In8HqGjzns5ynfsNfh
	5OO3+2p7K1e16LO/X2W/PRQ+/5gxFXOZX+eSTpPTunQpEyjnJ8IBb40q6kZHBO2J2MCkk+m0njl
	RInm/C50MlheScZNTFIVbGS3g0u+V6O4LVPVOL3DPRFb3ZIJG1D2pnSVSj6+CXCEdLVslCMSCo1
	B00IDA5geSR6XdhSmVXDOGrnMqsQgbyWMlwp58wgKhJCcXCgZsgZ5KF4WDo0ECDkYjcwU1o1Mjk
	Rljz0T2KdSB1ABa3v0rq4FK6T01BhANjtVpA9uVU+zdOA9nFyc3VYYrr+Tw7jn48B75R7g6Gxcs
	dxktrs12rJeWPrCM8=
X-Google-Smtp-Source: AGHT+IGN1WYQT2EKc4h3GaCwKE2jZCARir0K7jCaV93K9/r5xtWTUECgPBy7LokTrS9Cz97x/QdO2A==
X-Received: by 2002:a17:902:ccd0:b0:298:2cdf:56c8 with SMTP id d9443c01a7336-2a3ee4c46d4mr71063545ad.60.1767939551278;
        Thu, 08 Jan 2026 22:19:11 -0800 (PST)
Received: from at.. ([171.61.163.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c530133csm9272546b3a.31.2026.01.08.22.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 22:19:10 -0800 (PST)
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
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Fri,  9 Jan 2026 06:18:53 +0000
Message-ID: <20260109061901.3127-1-atharvatiwarilinuxdev@gmail.com>
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
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      [atharvatiwarilinuxdev(at)gmail.com]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.214.181 listed in list.dnswl.org]
	*  0.0 RCVD_IN_MSPIKE_H3 RBL: Good reputation (+3)
	*      [209.85.214.181 listed in wl.mailspike.net]
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [171.61.163.202 listed in zen.spamhaus.org]
	*  0.0 RCVD_IN_MSPIKE_WL Mailspike good senders
X-Spam-Level: ***
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
index 25076a5acd96..850bfe03a685 100644
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
+	if (dmi_match(DMI_BOARD_VENDOR, "Apple"))
+		pdev->no_aer = 1;
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15ea, quirk_disable_aer);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15eb, quirk_disable_aer);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15ec, quirk_disable_aer);
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


