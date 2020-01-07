Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D1F132D8A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 18:51:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sg0S02fzzDqMH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 04:51:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=pokefinder.org (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa+renesas@sang-engineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=sang-engineering.com
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 47sfx86SXzzDqHV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 04:48:10 +1100 (AEDT)
Received: from localhost (p5486CF8B.dip0.t-ipconnect.de [84.134.207.139])
 by pokefinder.org (Postfix) with ESMTPSA id D79E72C05BA;
 Tue,  7 Jan 2020 18:48:05 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 00/12] i2c: convert subsystem to use i2c_new_client_device()
Date: Tue,  7 Jan 2020 18:47:34 +0100
Message-Id: <20200107174748.9616-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series converts the I2C subsystem to use the new API. Drivers
have been build tested. There is one user left in the SMBus part of the
core which will need a seperate series because all users of this
function need to be checked/converted, too.

Except for documentation patches, the conversion has been done with a
coccinelle script and further simplification have been applied when
proofreading the patches.

A branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/i2c/new_client_device

Looking forward to comments...

Wolfram Sang (12):
  i2c: cht-wc: convert to use i2c_new_client_device()
  i2c: i801: convert to use i2c_new_client_device()
  i2c: nvidia-gpu: convert to use i2c_new_client_device()
  i2c: ocores: convert to use i2c_new_client_device()
  i2c: powermac: convert to use i2c_new_client_device()
  i2c: taos-evm: convert to use i2c_new_client_device()
  i2c: xiic: convert to use i2c_new_client_device()
  i2c: i2c-core-acpi: convert to use i2c_new_client_device()
  i2c: i2c-core-base: convert to use i2c_new_client_device()
  i2c: i2c-core-of: convert to use i2c_new_client_device()
  docs: i2c: use the new API in 'instantiating-devices.rst'
  docs: i2c: use the new API in 'writing-clients'

 Documentation/i2c/instantiating-devices.rst |  8 ++++----
 Documentation/i2c/writing-clients.rst       | 20 ++++++++++----------
 drivers/i2c/busses/i2c-cht-wc.c             |  6 +++---
 drivers/i2c/busses/i2c-i801.c               |  6 +++---
 drivers/i2c/busses/i2c-nvidia-gpu.c         |  6 +++---
 drivers/i2c/busses/i2c-ocores.c             |  2 +-
 drivers/i2c/busses/i2c-powermac.c           |  8 ++++----
 drivers/i2c/busses/i2c-taos-evm.c           |  4 ++--
 drivers/i2c/busses/i2c-xiic.c               |  2 +-
 drivers/i2c/i2c-core-acpi.c                 | 12 ++++--------
 drivers/i2c/i2c-core-base.c                 | 13 ++++++-------
 drivers/i2c/i2c-core-of.c                   |  7 +++----
 12 files changed, 44 insertions(+), 50 deletions(-)

-- 
2.20.1

