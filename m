Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 935DC85FB1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 15:23:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=bkB7s9nP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tgb3t3qSRz3dTt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 01:23:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=bkB7s9nP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tgb2K5xlnz3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 01:22:31 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 1F5181BF20A;
	Thu, 22 Feb 2024 14:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708611748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zhx1gNduZdrAxbKpizueNk61Hz1DSX29IWeNJrNnfCE=;
	b=bkB7s9nPVSNwrpQTUYlLCMUPWFqLWWsOmeePeDdlyKL1je+UibdaL0z7bYSPHxJxdl5RWf
	9HKteaQ8KZS6weJep/vs/4A5JPJhIcJ6YRJtyRXP3/5Dmpw0XS5ZkKm81dDPhRWrMGNP4Q
	3cm7sHJowVnyykPmQCc9wtFWroiIlGO+oCAsaVIVJPVHcQNgHin9oTBasWEZJY+QptH+ym
	7z/E6uw/fwdX3eN22cg9iiPhETsg9yaR0nhleF9Jzt0mLBhVvZ56qDejtBSlMinlJFPRUS
	EZwZCd1PdTehxHeF837cN7DArKwOkzMOPC+XNiOr5kk/kOMBXHiSKjc8C0w2nw==
From: Herve Codina <herve.codina@bootlin.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Yury Norov <yury.norov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v4 0/5] Add support for QMC HDLC
Date: Thu, 22 Feb 2024 15:22:13 +0100
Message-ID: <20240222142219.441767-1-herve.codina@bootlin.com>
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
  https://lore.kernel.org/linux-kernel/20240212075646.19114-1-herve.codina@bootlin.com/
this v4 series mainly:
- Introduces and use bitmap_{scatter,gather}().

Best regards,
Hervé

[1]: https://lore.kernel.org/linux-kernel/20231115144007.478111-1-herve.codina@bootlin.com/
[2]: https://lore.kernel.org/linux-kernel/20231205152116.122512-1-herve.codina@bootlin.com/
[3]: https://lore.kernel.org/linux-kernel/20231128132534.258459-1-herve.codina@bootlin.com/

Changes v3 -> v4
  - Patch 1
    Remove of.h and of_platform.h includes, add mod_devicetable.h.
    Add a blank line in the includes list.

  - Path 2
    No changes.

  - v3 patches 3 and 4 removed

  - Patch 3 (new patch in v4)
    Introduce bitmap_{scatter,gather}() based on the original patch done
    by Andy Shevchenko.
    Address comments already done on the original patch:
    https://lore.kernel.org/lkml/20230926052007.3917389-3-andriy.shevchenko@linux.intel.com/
      - Removed the returned values.
      - Used 'unsigned int' for all indexes.
      - Added a 'visual' description of the operations in kernel-doc.
      - Described the relationship between bitmap_scatter() and
        bitmap_gather().
      - Moved bitmap_{scatter,gather}() to the bitmap.h file.
      - Improved bitmap_{scatter,gather}() test.
      - Reworked the commit log.

  - Patch 4 (v3 patch 5)
    Use bitmap_{scatter,gather}()

  - Patches 5 (v3 patch 6)
    No changes.

Changes v2 -> v3
  - Patch 1
    Remove 'inline' function specifier from .c file.
    Fix a bug introduced when added WARN_ONCE(). The warn condition must
    be desc->skb (descriptor used) instead of !desc->skb.
    Remove a lock/unlock section locking the entire qmc_hdlc_xmit()
    function.

  - Patch 5
    Use bitmap_from_u64() everywhere instead of bitmap_from_arr32() and
    bitmap_from_arr64().

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

Andy Shevchenko (1):
  lib/bitmap: Introduce bitmap_scatter() and bitmap_gather() helpers

Herve Codina (4):
  net: wan: Add support for QMC HDLC
  MAINTAINERS: Add the Freescale QMC HDLC driver entry
  net: wan: fsl_qmc_hdlc: Add runtime timeslots changes support
  net: wan: fsl_qmc_hdlc: Add framer support

 MAINTAINERS                    |   7 +
 drivers/net/wan/Kconfig        |  12 +
 drivers/net/wan/Makefile       |   1 +
 drivers/net/wan/fsl_qmc_hdlc.c | 807 +++++++++++++++++++++++++++++++++
 include/linux/bitmap.h         | 101 +++++
 lib/test_bitmap.c              |  42 ++
 6 files changed, 970 insertions(+)
 create mode 100644 drivers/net/wan/fsl_qmc_hdlc.c

-- 
2.43.0

