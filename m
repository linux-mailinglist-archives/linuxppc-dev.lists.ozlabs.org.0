Return-Path: <linuxppc-dev+bounces-15412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52733D01DF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 10:38:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dn0GJ0n0Lz2yN2;
	Thu, 08 Jan 2026 20:38:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767860436;
	cv=none; b=EbzS7mVr0oYKEUCezruIxgXrWKQTzNMBmO0XnQKnR49vQvSaNnCpNKbg47cDqNdi1RkeB1Mi1Cbgp7pwKBA4WC1PAPwurNCP7w17Bw6NRX+P1SNayxiK5ODKk6dBaB5afzcJNKpuLlJyEy2KEY45qjsGBYFBbK4cq+4E8Awjb5/5kUyz2BI0rZ5g28OTX6uec0G4verNiWDoRkBh+EjNQMBa+ZAjgo0OnZEkrZWVshVwHNu1wlEWw9ILvXcsnc+MiXOmR+yylnnkpS0bdDhj3c1gg0CKR1JTwyikwQOj3sX6MOBsp9NxybkiPI5r4NKFkh74+xzV1WT1qhpUOJat5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767860436; c=relaxed/relaxed;
	bh=fHAmKcdoN135Asq9ijVI3O1LODaST52jtA9RClzYjcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jo/fqO5GNopaXChFMZLiw5rG8SHiVIM2101wPhGXkZ64IudiBbm8Ido81j5JBjXk+5yeNWfXJ8ZHnWZB1lLxA4NmHuF5vSATnUyYcZxrr2RvL9eofv138JPqUjmDxoCFtRBCiJ15Q5/3XsNxj+0QzBMvje4XqlxCZoafGHghjcGBjWR+N5pnX6+DPuKgwcl6nTyfOjZMTEgpfukVlplPWxAplhZiJCPFdirJ2rHw+KftNjw4JLEJ+6sIAdLyB/pDYlVAEExvmX/CI3uYsCmI9nVy6Sw5lxR9owcv85DszYDOqKodyOhSGGf+bYnOMv3ZNCIucrur0CxRrrpCIqJk+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YMOCfPoo; dkim-atps=neutral; spf=pass (client-ip=209.85.216.42; helo=mail-pj1-f42.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YMOCfPoo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.42; helo=mail-pj1-f42.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmyX35tcpz2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 19:20:34 +1100 (AEDT)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so2419526a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 00:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767860372; x=1768465172; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fHAmKcdoN135Asq9ijVI3O1LODaST52jtA9RClzYjcQ=;
        b=YMOCfPooGSQTMZnu8VLyYZeiVgWTZ9ayPTseN2nbwT6lpjdFDZykyPy3QBEFkG2Wi8
         H6KKKgyIrgB79RuTwxNVFe+iueOMk6Q7VGi8FMNNfQHU1GU38tsyrMil9vraAv/kPFO9
         gpUU0g6gWMq1SR/uYvgAT17ZuhmoJvstnzhp7aXPPTmDUHkPbuAY7043jJ+MdaSYr553
         XFt7j/BicHgFVqWB8RkqtQGMDz1gYrwKxvDyG538s26gCrOo4QFPnMR3xH82FEl8e2bl
         pld8BgAD3MpWpTrUgTfsxZY423uN/DNquBtbfGDfOnByHNVIarmPAvj/eUiLEH1m5BHp
         9prQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767860372; x=1768465172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHAmKcdoN135Asq9ijVI3O1LODaST52jtA9RClzYjcQ=;
        b=XQSrgIEE4aeEbwOgmvAwoN5N2X4npuIzXzsdeFD+uGfAxfd6URhOkoKfgq+H0yeg9i
         IQ4Kulsb+kUjsc1XKJ6rYlqij0ONWznu/vcdvijis/lyzcgYFfm5YHVAcQGInLbz5gXz
         +VFxSbXTrNj9l/WXeRmU5sWBf7CVMNKw6OsiwubA0Z22yDIGJFRnDolz8Wcem0x+15B2
         25S+0oG5cXJMjcF4v4P/4UlzkRv5LAu4HRSH4X0RDerhXDFWTX9i+4o32qtD2ohvc7gL
         b7UGoX/GkTfFCDQm1gSKqFI3O50nIl7fRmEcyXMtKEp/LrqDNrSIXYLH6muD66IVmtse
         E+HA==
X-Forwarded-Encrypted: i=1; AJvYcCU5ILrHgBDKn0diy0piWTxznfvSgzPXdNmuz/rHopLz19jOJ0JD6X5ztFy/PvO4KGb6YxU7kAlpu5W3t9U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyOdJ1+xLsfm5a9THeThKT9ZUJ0M4kxdkze3DI2zWNpCQlYeo5u
	voiHNuMUQbEu4zVcjBnkcnd2Us2tcPkgjn779Xfnf3SIXdzmHM7PaLM=
X-Gm-Gg: AY/fxX6zSQv0x1iaT4Bwb4KbhBt4OfmhKHpCPP1GPIOBRDq3IW2xWJebmpB9LfeCPEr
	T+4mQ+obLzXHRGYIxTGnGJEYD78NsH9KYKdevdmZFwEAoAL5YUuXE/4caTLEAH7t20Q6JY9eAty
	6A6E+ZenpuPpTA0kgQkzCmV3aDmYfKuIlkG0evC4k3AaduT03jyg297BumMZb4npD/9nHQQDg1I
	42ZabZjmI/b/6SZHRGXqdcqDxWtpTMGrrA8MWh9EPPXA5T3InCP3uoRkeGeCQLcXCsgbK52tqLu
	RKJtKuahhJw6n5uMQIJJ/CCCSc/meX0Xl1LL00M7k2N++TwdmB/nN8GwDMG9ITPtHZMp270meHP
	dNMmEEV6rWabXNKeqyVKrV4yGEtRR4yeuorvEwM9pIKFU4dn3lfbW4rTzKBJlbiBP9tVYACfH0u
	Ji2+8GUoPgK/zmxvs=
X-Google-Smtp-Source: AGHT+IFDK5YD6a2Lz09PpXPJx2QnY/5/782hB7zl/Zgtvf8GF5ogkiCdodmnp0MwEz339uVRHb9Okw==
X-Received: by 2002:a17:90b:4c11:b0:338:3d07:5174 with SMTP id 98e67ed59e1d1-34f68c7a647mr5191292a91.5.1767860371991;
        Thu, 08 Jan 2026 00:19:31 -0800 (PST)
Received: from at.. ([171.61.166.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b19ebsm6979077a91.3.2026.01.08.00.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:19:31 -0800 (PST)
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
	Feng Tang <feng.tang@linux.alibaba.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Thu,  8 Jan 2026 08:18:53 +0000
Message-ID: <20260108081904.2881-1-atharvatiwarilinuxdev@gmail.com>
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
	*      [209.85.216.42 listed in wl.mailspike.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.216.42 listed in list.dnswl.org]
	*  0.0 RCVD_IN_MSPIKE_WL Mailspike good senders
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Changes since v1:
	Transferred log

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
Changes in v2:
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


