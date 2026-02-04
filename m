Return-Path: <linuxppc-dev+bounces-16570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CegM5fFgmkTawMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 05:05:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 014CEE1767
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 05:05:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5Rb71NKFz3c8s;
	Wed, 04 Feb 2026 15:05:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=82.65.109.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770177923;
	cv=none; b=YsQ7Ti2uhWqkTb+fF+YlyRoQqCq9Oua1bO6ZJqM1i7WgLMTF6kjLoepT8BbrT/sbqysq9QsQAOfwtdaRNOprgtG0wxNSLlhKwaSjcmDmlB7BhdFeQZu7ShXTvRxUXbL/rXeveXZ5B6iADEB3QJuIAutHVnQiI+hPsyNpf9gc3Hy2jGzFu4PJUoTK0YS18LcV2Z2HjliIQIktKLwHAi3Eqmw8YrQpOs4SklSI2ww1CjNa36+AIGQmgBu249v8wzxBPHbeFgPgPXu+yAODJkbCUjWL1x8NX6Mkd39JyMHfy/h9jXvYgbw4CYL5FxMPui7iyUBFb575UVJ+NvG6CUASug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770177923; c=relaxed/relaxed;
	bh=Ar6nggKJFDjMDK6w2BDdOQI16S0Y4MxKDel9zT3R9IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=atXsDCkfINDo5WCsfgiaol9j3FtWAi9xmMp/4ooBXCo7Lz52mvCLwniTKn7cmr0GJmU9mGblwNjQ3e6Xxu1gFyhjcIqvBELgslAp1y+h9BDZu/nbcBV6hlzPM6JayJctoiSuPaX0yMUL+a5TLX90d+Z0fSPXAgHUfabQ1eQy5sHAYzJzhajz2aWOHqRxbuVp8PqrgB5G2lS0Otx4Xq/HVmqPl+AsqSc16UlkIfsuQRAMND7pFa/z50r9wIF/QyPlIOw6wpkejweuUp9RyLWZF7bB99F1KWWyzKa5pUm7JhpzZdak9n6yRKDO/1pHuttK/du4ctbtqC6CGxuT24HARg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org) smtp.mailfrom=linkmauve.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org)
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5Rb567Chz3c2k
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 15:05:21 +1100 (AEDT)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id EE3ADF43B4B; Wed, 04 Feb 2026 05:05:09 +0100 (CET)
From: Link Mauve <linkmauve@linkmauve.fr>
To: rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	officialTechflashYT@gmail.com,
	Ash Logan <ash@heyquark.com>,
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v2 3/4] nvmem: Replace the Wii and Wii U OTP driver with a Rust one
Date: Wed,  4 Feb 2026 05:05:00 +0100
Message-ID: <20260204040505.8447-4-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204040505.8447-1-linkmauve@linkmauve.fr>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
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
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linkmauve.fr];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16570-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:rust-for-linux@vger.kernel.org,m:linkmauve@linkmauve.fr,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srini@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:ardb@kernel.org,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:gregkh@linuxfoundation.org,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:viresh.kumar@linaro.org,m:lorenzo.stoakes@oracle.com,m:tamird@kernel.org,m:fujita.tomonori@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:lina@asahilina.net,m:fujitatomonori@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,oracle.com,linuxfoundation.org,redhat.com,asahilina.net,linaro.org,lists.ozlabs.org,vger.kernel.org,heyquark.com,gmx.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,config.dev:url,config.name:url,wiiubrew.org:url]
X-Rspamd-Queue-Id: 014CEE1767
X-Rspamd-Action: no action

I wrote this driver long ago, and wanted to try seeing how hard it would
be to convert it to Rust.

It is a very simple driver, we write the address we want to read in one
memory address, and read the data from a second memory address.  A third
memory address can be used to disable all reads in a range until the
system has been rebooted, but I didn’t find any reason to expose that
feature.

I made sure to use no unsafe in this driver, to make sure the API
exposed in the previous commit is usable.

Ideally we wouldn’t have to impl the write() function in
NintendoOtpProvider, but currently the vtable requires both.

I have tested this driver only on a Wii so far, but I assume it will
work the same on a Wii U, just exposing more memory banks.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/nvmem/Kconfig         |   1 +
 drivers/nvmem/Makefile        |   2 +-
 drivers/nvmem/nintendo-otp.c  | 122 --------------------------------
 drivers/nvmem/nintendo_otp.rs | 127 ++++++++++++++++++++++++++++++++++
 4 files changed, 129 insertions(+), 123 deletions(-)
 delete mode 100644 drivers/nvmem/nintendo-otp.c
 create mode 100644 drivers/nvmem/nintendo_otp.rs

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index bf47a982cf62..c23d338f820a 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -241,6 +241,7 @@ config NVMEM_MXS_OCOTP
 
 config NVMEM_NINTENDO_OTP
 	tristate "Nintendo Wii and Wii U OTP Support"
+	depends on RUST
 	depends on WII || COMPILE_TEST
 	help
 	  This is a driver exposing the OTP of a Nintendo Wii or Wii U console.
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 7252b8ec88d4..3d40a0a23f76 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -51,7 +51,7 @@ nvmem_mtk-efuse-y			:= mtk-efuse.o
 obj-$(CONFIG_NVMEM_MXS_OCOTP)		+= nvmem-mxs-ocotp.o
 nvmem-mxs-ocotp-y			:= mxs-ocotp.o
 obj-$(CONFIG_NVMEM_NINTENDO_OTP)	+= nvmem-nintendo-otp.o
-nvmem-nintendo-otp-y			:= nintendo-otp.o
+nvmem-nintendo-otp-y			:= nintendo_otp.o
 obj-$(CONFIG_NVMEM_QCOM_QFPROM)		+= nvmem_qfprom.o
 nvmem_qfprom-y				:= qfprom.o
 obj-$(CONFIG_NVMEM_QCOM_SEC_QFPROM)	+= nvmem_sec_qfprom.o
diff --git a/drivers/nvmem/nintendo-otp.c b/drivers/nvmem/nintendo-otp.c
deleted file mode 100644
index 355e7f1fc6d5..000000000000
--- a/drivers/nvmem/nintendo-otp.c
+++ /dev/null
@@ -1,122 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Nintendo Wii and Wii U OTP driver
- *
- * This is a driver exposing the OTP of a Nintendo Wii or Wii U console.
- *
- * This memory contains common and per-console keys, signatures and
- * related data required to access peripherals.
- *
- * Based on reversed documentation from https://wiiubrew.org/wiki/Hardware/OTP
- *
- * Copyright (C) 2021 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
- */
-
-#include <linux/device.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/mod_devicetable.h>
-#include <linux/nvmem-provider.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
-
-#define HW_OTPCMD  0
-#define HW_OTPDATA 4
-#define OTP_READ   0x80000000
-#define BANK_SIZE  128
-#define WORD_SIZE  4
-
-struct nintendo_otp_priv {
-	void __iomem *regs;
-};
-
-struct nintendo_otp_devtype_data {
-	const char *name;
-	unsigned int num_banks;
-};
-
-static const struct nintendo_otp_devtype_data hollywood_otp_data = {
-	.name = "wii-otp",
-	.num_banks = 1,
-};
-
-static const struct nintendo_otp_devtype_data latte_otp_data = {
-	.name = "wiiu-otp",
-	.num_banks = 8,
-};
-
-static int nintendo_otp_reg_read(void *context,
-				 unsigned int reg, void *_val, size_t bytes)
-{
-	struct nintendo_otp_priv *priv = context;
-	u32 *val = _val;
-	int words = bytes / WORD_SIZE;
-	u32 bank, addr;
-
-	while (words--) {
-		bank = (reg / BANK_SIZE) << 8;
-		addr = (reg / WORD_SIZE) % (BANK_SIZE / WORD_SIZE);
-		iowrite32be(OTP_READ | bank | addr, priv->regs + HW_OTPCMD);
-		*val++ = ioread32be(priv->regs + HW_OTPDATA);
-		reg += WORD_SIZE;
-	}
-
-	return 0;
-}
-
-static const struct of_device_id nintendo_otp_of_table[] = {
-	{ .compatible = "nintendo,hollywood-otp", .data = &hollywood_otp_data },
-	{ .compatible = "nintendo,latte-otp", .data = &latte_otp_data },
-	{/* sentinel */},
-};
-MODULE_DEVICE_TABLE(of, nintendo_otp_of_table);
-
-static int nintendo_otp_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	const struct of_device_id *of_id =
-		of_match_device(nintendo_otp_of_table, dev);
-	struct nvmem_device *nvmem;
-	struct nintendo_otp_priv *priv;
-
-	struct nvmem_config config = {
-		.stride = WORD_SIZE,
-		.word_size = WORD_SIZE,
-		.reg_read = nintendo_otp_reg_read,
-		.read_only = true,
-		.root_only = true,
-	};
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->regs))
-		return PTR_ERR(priv->regs);
-
-	if (of_id->data) {
-		const struct nintendo_otp_devtype_data *data = of_id->data;
-		config.name = data->name;
-		config.size = data->num_banks * BANK_SIZE;
-	}
-
-	config.dev = dev;
-	config.priv = priv;
-
-	nvmem = devm_nvmem_register(dev, &config);
-
-	return PTR_ERR_OR_ZERO(nvmem);
-}
-
-static struct platform_driver nintendo_otp_driver = {
-	.probe = nintendo_otp_probe,
-	.driver = {
-		.name = "nintendo-otp",
-		.of_match_table = nintendo_otp_of_table,
-	},
-};
-module_platform_driver(nintendo_otp_driver);
-MODULE_AUTHOR("Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>");
-MODULE_DESCRIPTION("Nintendo Wii and Wii U OTP driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/nvmem/nintendo_otp.rs b/drivers/nvmem/nintendo_otp.rs
new file mode 100644
index 000000000000..04ba3591d674
--- /dev/null
+++ b/drivers/nvmem/nintendo_otp.rs
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+//! Nintendo Wii and Wii U OTP driver
+//!
+//! This is a driver exposing the OTP of a Nintendo Wii or Wii U console.
+//!
+//! This memory contains common and per-console keys, signatures and
+//! related data required to access peripherals.
+//!
+//! Based on reversed documentation from https://wiiubrew.org/wiki/Hardware/OTP
+//!
+//! Copyright (C) 2021 Link Mauve <linkmauve@linkmauve.fr>
+
+use kernel::{
+    device::Core,
+    devres::Devres,
+    io::{mem::ExclusiveIoMem, Io},
+    nvmem::{self, NvmemConfig, NvmemProvider},
+    of::{DeviceId, IdTable},
+    platform,
+    prelude::*,
+};
+
+const HW_OTPCMD: usize = 0;
+const HW_OTPDATA: usize = 4;
+const OTP_READ: u32 = 0x80000000;
+const BANK_SIZE: u32 = 128;
+const WORD_SIZE: u32 = 4;
+
+struct Info {
+    name: &'static CStr,
+    num_banks: u32,
+}
+
+const WII_INFO: Info = Info {
+    name: c"wii-otp",
+    num_banks: 1,
+};
+
+const WIIU_INFO: Info = Info {
+    name: c"wiiu-otp",
+    num_banks: 8,
+};
+
+struct NintendoOtpDriver {
+    #[expect(dead_code)]
+    iomem: Pin<KBox<Devres<ExclusiveIoMem<8>>>>,
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <NintendoOtpDriver as platform::Driver>::IdInfo,
+    [
+        (DeviceId::new(c"nintendo,hollywood-otp"), WII_INFO),
+        (DeviceId::new(c"nintendo,latte-otp"), WIIU_INFO),
+    ]
+);
+
+#[derive(Default)]
+struct NintendoOtpProvider;
+
+#[vtable]
+impl NvmemProvider for NintendoOtpProvider {
+    type Priv = Io<8>;
+
+    fn read(io: &Self::Priv, mut reg: u32, mut data: &mut [u8]) -> Result {
+        while let Some(bytes) = data.split_off_mut(..4) {
+            let bank = (reg / BANK_SIZE) << 8;
+            let addr = (reg / WORD_SIZE) % (BANK_SIZE / WORD_SIZE);
+            io.write32be(OTP_READ | bank | addr, HW_OTPCMD);
+            let elem = io.read32be(HW_OTPDATA);
+            bytes.copy_from_slice(&elem.to_be_bytes());
+            reg += WORD_SIZE;
+        }
+
+        Ok(())
+    }
+
+    fn write(_context: &Self::Priv, _offset: u32, _data: &[u8]) -> Result {
+        Err(ENODEV)
+    }
+}
+
+impl platform::Driver for NintendoOtpDriver {
+    type IdInfo = Info;
+    const OF_ID_TABLE: Option<IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(
+        pdev: &platform::Device<Core>,
+        info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> {
+        let dev = pdev.as_ref();
+
+        let Some(Info { name, num_banks }) = info else {
+            return Err(EINVAL);
+        };
+
+        dev_info!(dev, "got '{name}', num_banks = {num_banks}\n");
+
+        let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
+        let iomem = request.iomap_exclusive_sized::<8>();
+        let iomem = KBox::pin_init(iomem, GFP_KERNEL)?;
+        let io = iomem.access(dev)?;
+
+        let config = NvmemConfig::<NintendoOtpProvider>::default()
+            .with_name(name)
+            .with_type(nvmem::Type::Otp)
+            .with_size((num_banks * BANK_SIZE) as i32)
+            .with_word_size(WORD_SIZE as i32)
+            .with_stride(WORD_SIZE as i32)
+            .with_read_only(true)
+            .with_root_only(true);
+
+        dev.nvmem_register(config, io);
+
+        Ok(Self { iomem })
+    }
+}
+
+kernel::module_platform_driver! {
+    type: NintendoOtpDriver,
+    name: "nintendo-otp",
+    authors: ["Link Mauve <linkmauve@linkmauve.fr>"],
+    description: "Nintendo Wii and Wii U OTP driver",
+    license: "GPL v2",
+}
-- 
2.52.0


