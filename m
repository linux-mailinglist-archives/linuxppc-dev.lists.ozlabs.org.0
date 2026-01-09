Return-Path: <linuxppc-dev+bounces-15485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EA2D0D2C5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jan 2026 08:38:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp9V00Slmz2yG0;
	Sat, 10 Jan 2026 18:38:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767944629;
	cv=none; b=AjKSvT4/aEU3F4hP7ky1BHNPFSs8O7VTaQ6KB6LZOiOHAhJuUzV17OdQjqICHlW3Rw34FEtJQiNrxZ+Hn4HMUeCLwgCr0AWO0Hiw3YaGBYibv6aHcc9WfMaFZlK7VkNpuTG9YUmCvJRVY3c1ICSLn1HRQ34XwqzgiqUBRJffBHgxpuo7gbhlQ1sFYY2Vm0h7CJLSbDnQwG09T8rITgRALWD1f5AJeDNCie76WV8TJ6bYoNR2MSnAhjmdSGEsWSnaDFI1KgAK8aWR5haYjw0hGhCdolxCqxGmpKYCb7zfEZHFvMQ8DhmoISs2DmjrMfxNftnMKATEE9ff0YdObJSh3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767944629; c=relaxed/relaxed;
	bh=o9AYRVJbls5kMz4af/phakvFWuIaNCCibN2SZ7D9nuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NKn6JlckeSmH9Q2AiPhWyMThS80goijNDOh5tudtJrtwethGBR6qkcxjlgXgVF901Df6q0lTU3j9Ee5DvYqCz5D1YZy1TplxiyYSS7eT5Skk+ufBfK0EtWL0jBw2Og7e/uaBOUT3eMnWGiHfCNzNnwAyRHcdRSE0mu/4D4UMV4NF1kMWu/RDrzK72Gq0RgEZO2jT/SWhedDC8acFDmd6OEpX+fdtG6zOxI0imAWN+U+OGmCQ0c845rPeFw6qY01SScHWbKiNXrNnb0gwCbybxxdRw1tymHsIUTwylqpAvOmaSlIeN2XSNDqZtn1/sXUzPkueZdkQuWld1gtFM0+0EA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cg7QV81q; dkim-atps=neutral; spf=pass (client-ip=209.85.215.177; helo=mail-pg1-f177.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cg7QV81q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.215.177; helo=mail-pg1-f177.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnYg71fFWz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 18:43:46 +1100 (AEDT)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c227206e6dcso2593057a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 23:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767944562; x=1768549362; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o9AYRVJbls5kMz4af/phakvFWuIaNCCibN2SZ7D9nuU=;
        b=Cg7QV81qHRgkxUSYvMv6tQe3qQGJ8MFEYDszPe83cHcXeHwg7B9Dw3STAbHpDj4pNA
         hE0lYMiE25IT5C5O1pkDxQv4MsAkkkTRqBwsXMSPC8mjBs7g2JD3LcKT62P9NQOWvlI6
         AkgfzKnP46t7rJI0GS0xQ2RkjtIkxCTHIi+6OW+7pt38iUE691LsStw5RW8Crkia5GSB
         4TgsJE4jlbZCXNdXuTdFKp2wTOeDopbrlIxHU+39etlECNRqywCl2uvvuLLsLCAWmbqS
         bPjQh4rlZOcomwisGP2EwFtwVHl4UPsKDpJf3Mnb5exKOsDp33O0cS2AuoylPk0p+pCz
         G8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767944562; x=1768549362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9AYRVJbls5kMz4af/phakvFWuIaNCCibN2SZ7D9nuU=;
        b=NLUpTQlvP9NIhQtm12GI4P146coeq+F6vuSGuLw59RL8BZDX0c3qPl4a17VZGswl27
         7A+OohntBLDBgsXbaVHXTkWF9uJ7I5nIIpDxrvzyep1QtJKIo/WuY4WC3bItTER16/sV
         slsc2atRQc8f7iVpMKYAFOoISCbRNXnp0OZk3hxA8etDUt+h40VWhWRsev0PgY6JdB3V
         Pjo5TyRaNLEjAa54XO5VqeDkVRp8FciyYyASxmyTDRQ4OMRWGIvqLDz2j9bYsw7gWsLg
         UVXjqHkwE0+GNNKmh06XcrULWl1+CoAJKI1okCCVp4OMnqEoKVWm4Se4DHSYy39vSGK/
         GJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3343QVxad+a73wux7pk+V6wUZQUYyAmXpeViSdf2gZLKW5DYn0dU/8gOm0R63xTdLm7jNyLEbFsdfANk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwNQBuJLbaaCxfECGN5G5bk51WSy/5/pwMPl2oGcHYe3KDVsfYp
	d+amFQLns+jfrFG177qhYZKoaS2/IKuF6ImSa91nCT7HQF1oxyzQCS4=
X-Gm-Gg: AY/fxX7fLIrWgmsRF/7Wg6FVr7g/0ylxiqWo0hFI7PVA9j1N2wgej9abkzbdbOtrZ1X
	sLoYmWK5IzDp/S1+iKTO8IcDqYhEhZIGztCL7EaD08mgzqdZv9WpUkcw/1C5usb/2FulfBOaLkq
	9P/xD4KcdZHMCBbfvSWsILYFkko703BiCm2t+X6k4yiVnY7opH/udN0AMZ735cMo/zMqGCs04Uv
	GXEk/OmBDZv1n3qNHhbe7QDi/N9qg6sNmU0RYMMzLgS7WrIcUVrc4+yJ7oH65I+n844wsjoqBrh
	ANaPZAlapjBhMBOjflSmydx4h+o3CDVixLHSfOI+ly2sbVj2Syvk8jALdlJrdYdCtnfOGsZPHXR
	/N2LT12ZWz5f8ZK+OfecSFAbhCZEauuaGNoy8zHph/uTGm8/qAekEG1nRmbaDZeRL4H0sEo6PP0
	+qB+h41tjMKw1ezws=
X-Google-Smtp-Source: AGHT+IHJ/rsYu1MTPilthw7eQlciakMyESsgvffAUTB6sGttF8HsOFwXFQjB3kokh4VKOvwm/Db7+Q==
X-Received: by 2002:a05:6a20:a10e:b0:33c:2154:d4f4 with SMTP id adf61e73a8af0-3898f9975b1mr8593154637.49.1767944562266;
        Thu, 08 Jan 2026 23:42:42 -0800 (PST)
Received: from at.. ([171.61.163.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbf28fa85sm9756036a12.5.2026.01.08.23.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:42:41 -0800 (PST)
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
	Dave Jiang <dave.jiang@intel.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Fri,  9 Jan 2026 07:42:24 +0000
Message-ID: <20260109074232.2545-1-atharvatiwarilinuxdev@gmail.com>
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
	*  0.0 RCVD_IN_MSPIKE_H3 RBL: Good reputation (+3)
	*      [209.85.215.177 listed in wl.mailspike.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.215.177 listed in list.dnswl.org]
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


