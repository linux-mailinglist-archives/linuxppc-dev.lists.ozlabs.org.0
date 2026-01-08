Return-Path: <linuxppc-dev+bounces-15411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 097BAD01DEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 10:38:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dn0G44H6zz2yGD;
	Thu, 08 Jan 2026 20:38:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767860787;
	cv=none; b=VIqchScBYqu/unNgRAiQmJmJ+2wfH5RAIvHurnzQtsSEZUZ9zQI7v0tEFFV5Dzi4rP7U2LTmzED5wrR+mnrIDDxMJhZib22IICElghr8v2r6kUYtsxDU5egeoaXx/VmxGQPmxUBAsyq5fsLYRkKrm2lmHP4orr2KMUmDnOUnfQrtxxuv68RShuOKXFO/jcT7Qcs8BO4TjCBYD4K6KXgzFh7DYJYVhaM3EZSacEOk6ledVaqfx2j59MYlSE0gf5O/OBELr3C9tM1iYIz65e5JOKcVY9u1MkL1KHZgyvT2+SFenpolXUfIxC2+yNmIA88d3jlAAV3w76eIZ47M8M32xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767860787; c=relaxed/relaxed;
	bh=x8t1+RviBZBkQiz1+F0jLoZoAGkcEhuc2rfeggUJxJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c4XrkOQpXR9pjq/mpS9nljHdlX/tDiQ+AgjD/59q6Mm5t8eZDDUfRpvmKLTtGlfsNQfHwHbdZivFhAw+pizfQ3Grv2Afs2/Vmt56GGjxTOBIB8pZhGgp9vrup5bvWlacyc6gGIeiEjqfHQP0HbyZep6LUr663vsBWmYncHqSXCbBsEDtBGQwYOvSqQ6ePvKmTNrUqGbTcpzSsHEw45L08a8+GjN84SRJf5l4QTCTusP7Dp6I9gzmC3L5Qal+dGlnJ7MeOVPStecj2ALw8vFoeEHoRimiE/g0DIXjgton0M3SROu1aDZUlfmH5Ml4KlO+5NnRE/j9CvqeqntHZzsE+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VlObGF3v; dkim-atps=neutral; spf=pass (client-ip=209.85.214.180; helo=mail-pl1-f180.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VlObGF3v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.180; helo=mail-pl1-f180.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmyfp4sNXz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 19:26:25 +1100 (AEDT)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0ac29fca1so22960775ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 00:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767860724; x=1768465524; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8t1+RviBZBkQiz1+F0jLoZoAGkcEhuc2rfeggUJxJA=;
        b=VlObGF3vYzWEBe6fSRKgdM6wxtXpiZOozioHwfVVrKLzk51rKJS79+pHpYrv+vFAbA
         7P+mAPOIyhgqpXc6axTHvuqNrmW/1Lb2D1PDhc1o+aQSgsjCDCW7J0a6ZIx10mhnb/Tx
         XxAzACKnHPVu2m4/9+pAjAS9ySJR6ksYSMQBWSXQ2Yp5I9kgZHqbW9J8RklZdZq36ozo
         F7uOoH9L2sz1W1tWPSjM2K+zZSZFViiIs1G9jDxNxIgYk0TxPf4F+0xw9o7bxQ2MWnl8
         H5c8ah+pUVceYFoRkwu/caISnMkDHTf14ZcRc95zEVr3vY/jwynZGL9/T54j5JyVgYqd
         h/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767860724; x=1768465524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8t1+RviBZBkQiz1+F0jLoZoAGkcEhuc2rfeggUJxJA=;
        b=B7f9GE7tq24fDV/VspyfhCx95qMpkE3WDrxdsfRwKtTwuVgLLJY8vz1S0v0Jv3RzWD
         MfnX6x6SqdSY3JMQVswjRbeJd27ZkTByANBgts76/JfvekXX3tFr4pngE3mIb7+rDlVF
         UqqiBhwI/qJxmagjWsTWPgWT0kKnN1cV8DGNFxY3XvWqPkBnRmhD2QeR1PF7lSER0PEz
         FHdsuaOKDXukl9fc10aNjESa5kfzQsjIny2A52dyC2c/lLh92wNffhmHdQfJzMXnXRwn
         CAvet7itmrTVGirclKdDJpy7A0XU6cm/QbsqffiZa/m0TI2V8knyGXIA07muQlgc2qkS
         na2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEgLaQooEVOZKacWnyVucmwoi1Go0g6HSA7tN6nW3oztoBgZ7E41HGxTOTUin94/jDgbfnZEQRw/ks6ns=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQErf/EWhTeFGI+aTGHfuVSlsKKrCqu5IOHveGf23gfBkU4DIt
	hYmqK5Bm6NXFQKH8tTpSZ93zJKZ8u2WHeCRuRjb6hDtEWk0Sm0khbA0=
X-Gm-Gg: AY/fxX59iE9AOoY/rkp6H+vk71MmXlloQiRHfrwS+f/v0VSgMcDDXOimOUHNF4vkvjx
	aaIXB/uaADZNltGNAEv3LMp2ww5yAbR+e5/sLJqowdQL2HBmggCP7oF4gpZjLi6nLzm6cRZT0wM
	teufTk9eMn61DbpqId5xZIgQxnSkB26pCzM4i+CDMZWd8Z253sigvXLsa9IflOil9jhGgTQcoRa
	5LxdmaqTN/FZc3CWkZ6ENaHOBhFLv/c25Zdm3VowOZrVK4sanM1GjyV69xv0Lg0qjUX5tzGyLQT
	i/3oaKpgpnjcSiD8jKC1qj5GuihVz2jVMq3UVGfS5PdN4Z8hgts25WsZg2q/yR5qeCOk8WKk554
	7KOSHbSFYvfdyRuzRg0DuCmJJ6Y4OTbNv3mqBT8qtmXf9sF1eaYeD/cAihlr6SmaDkH3i3ZbymH
	JaVni5lE9mtikqRHM=
X-Google-Smtp-Source: AGHT+IFlqu/P/5sh9z5DWE3DsjYa1JH40CTlBeUg8uyttdF4r71Kg5WERp3YCavi1Kt+WDXEmDPaOw==
X-Received: by 2002:a17:903:3c30:b0:2a0:fe4a:d67c with SMTP id d9443c01a7336-2a3ee437a5dmr49953365ad.10.1767860724001;
        Thu, 08 Jan 2026 00:25:24 -0800 (PST)
Received: from at.. ([171.61.166.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c47303sm70625825ad.24.2026.01.08.00.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:25:23 -0800 (PST)
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
	Feng Tang <feng.tang@linux.alibaba.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Thu,  8 Jan 2026 08:25:03 +0000
Message-ID: <20260108082509.3028-1-atharvatiwarilinuxdev@gmail.com>
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
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [171.61.166.195 listed in zen.spamhaus.org]
	*  0.0 RCVD_IN_MSPIKE_H3 RBL: Good reputation (+3)
	*      [209.85.214.180 listed in wl.mailspike.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.214.180 listed in list.dnswl.org]
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
index 25076a5acd96..bd72f7cf5db9 100644
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
+	if (dmi_match(DMI_SYS_VENDOR, "Apple"))
+		pdev->no_aer = 1;
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15EA, quirk_disable_aer);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15EB, quirk_disable_aer);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15EC, quirk_disable_aer);
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


