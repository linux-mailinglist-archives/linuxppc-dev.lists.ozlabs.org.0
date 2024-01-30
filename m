Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CC3841E35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 09:45:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=MsIQ/ckY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPJdk0fSLz3cY2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 19:45:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=MsIQ/ckY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPJXm5CXhz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 19:40:56 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 5EA5960004;
	Tue, 30 Jan 2024 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706604046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AUeV+yMhbxDVAjRgWk2k0aDLQD1BT6Nz6bBduK/S5sI=;
	b=MsIQ/ckYWPcngblsFQZGtyAcbNgNbSOxM/uyYSWrBoI9SM0ZBpH8rtdFeA7pHblETcOOIN
	efPRUQZn6IcKQodfZGfhc2xGqOTWlSxVx4WyPiyVHBMyidiJsOyIyLCkv9Z+x32KPQfMYD
	jIDY9iwmb6UDFZKVoboPJ57r4G89T/nAro4ppMgxon1JnOF0MH7nxMGX5tELjzpIfnx8XF
	P8wr/2woAGhiHUrJ40p/2iTAQtbs8+jtF4MM4zCCakjEff6HGofSUdySLpbWKxVh+4zgLj
	AnI/qlnkw6yQsIn4UMCZRPKUD+BEhjM0yf9OBgYWGV9Tsq8plsTIccl5KEk/nQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 0/6] Add support for QMC HDLC
Date: Tue, 30 Jan 2024 09:40:15 +0100
Message-ID: <20240130084035.115086-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This series introduces the QMC HDLC support.

Patches were previously sent as part of a full feature series and were
previously reviewed in that context:
"Add support for QMC HDLC, framer infrastructure and PEF2256 framer" [1]

In order to ease the merge, the full feature series has been split and
needed parts were merged in v6.8-rc1:
 - "Prepare the PowerQUICC QMC and TSA for the HDLC QMC driver" [2]
 - "Add support for framer infrastructure and PEF2256 framer" [3]

This series contains patches related to the QMC HDLC part (QMC HDLC
driver):
 - Introduce the QMC HDLC driver (patches 1 and 2)
 - Add timeslots change support in QMC HDLC (patch 3)
 - Add framer support as a framer consumer in QMC HDLC (patch 4)

Compare to the original full feature series, a modification was done on
patch 3 in order to use a coherent prefix in the commit title.

I kept the patches unsquashed as they were previously sent and reviewed.
Of course, I can squash them if needed.

Compared to the previous iteration:
  https://lore.kernel.org/lkml/20240123164912.249540-1-herve.codina@bootlin.com/
this v2 series:
- Update the qmc_hdlc initialisation in qmc_hcld_recv_complete()
- Use WARN_ONCE()
- Add a new bitmap function and use bitmap_*() in the QMC HDLC driver.

Best regards,
Hervé

[1]: https://lore.kernel.org/linux-kernel/20231115144007.478111-1-herve.codina@bootlin.com/
[2]: https://lore.kernel.org/linux-kernel/20231205152116.122512-1-herve.codina@bootlin.com/
[3]: https://lore.kernel.org/linux-kernel/20231128132534.258459-1-herve.codina@bootlin.com/

Changes v1 -> v2
  - Patch 1
    Use the same qmc_hdlc initialisation in qmc_hcld_recv_complete()
    than the one present in qmc_hcld_xmit_complete().
    Use WARN_ONCE()

  - Patch 3 (new patch in v2)
    Make bitmap_onto() available to users

  - Patch 4 (new patch in v2)
    Introduce bitmap_off()

  - Patch 5 (patch 3 in v1)
    Use bitmap_*() functions

  - Patch 6 (patch 4 in v1)
    No changes

Changes compare to the full feature series:
  - Patch 3
    Use 'net: wan: fsl_qmc_hdlc:' as commit title prefix

Patches extracted:
  - Patch 1 : full feature series patch 7
  - Patch 2 : full feature series patch 8
  - Patch 3 : full feature series patch 20
  - Patch 4 : full feature series patch 27

Herve Codina (6):
  net: wan: Add support for QMC HDLC
  MAINTAINERS: Add the Freescale QMC HDLC driver entry
  bitmap: Make bitmap_onto() available to users
  bitmap: Introduce bitmap_off()
  net: wan: fsl_qmc_hdlc: Add runtime timeslots changes support
  net: wan: fsl_qmc_hdlc: Add framer support

 MAINTAINERS                    |   7 +
 drivers/net/wan/Kconfig        |  12 +
 drivers/net/wan/Makefile       |   1 +
 drivers/net/wan/fsl_qmc_hdlc.c | 806 +++++++++++++++++++++++++++++++++
 include/linux/bitmap.h         |   3 +
 lib/bitmap.c                   |  45 +-
 6 files changed, 873 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/wan/fsl_qmc_hdlc.c

-- 
2.43.0

