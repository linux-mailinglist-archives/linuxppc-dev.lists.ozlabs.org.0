Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51356F132F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 11:02:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477MXR0b4hzF5lP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 21:02:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=pokefinder.org (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa+renesas@sang-engineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=sang-engineering.com
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 477MQy0gTnzF5kK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 20:57:46 +1100 (AEDT)
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
 by pokefinder.org (Postfix) with ESMTPSA id 65D0A2C053B;
 Wed,  6 Nov 2019 10:50:33 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [RFC PATCH 00/12] i2c: replace i2c_new_probed_device with an ERR_PTR
 variant
Date: Wed,  6 Nov 2019 10:50:18 +0100
Message-Id: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
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
Cc: linux-fbdev@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Wolfram Sang <wsa@the-dreams.de>

In the on-going mission to let i2c_new_* calls return an ERR_PTR instead
of NULL, here is a series converting i2c_new_probed_device(). A new
function called i2c_new_scanned_device() is introduced with the new
retval, but for now, a compatibility helper is provided until all users
are converted. The rest of the patches convert all current in-tree
users.

Note that these patches are RFC because I want feedback on the approach
and hopefully collect acks on the driver conversions. If all goes well,
I'll apply the first two patches for the next merge window. Then, once
this dependency is upstream, I'll resend this series with all issues
fixed and acks collected.

Core changes tested on a Renesas Salvator-XS board (R-Car M3-N), driver
patches build tested by me and buildbot.

Wolfram Sang (12):
  i2c: replace i2c_new_probed_device with an ERR_PTR variant
  i2c: icy: convert to i2c_new_scanned_device
  macintosh: convert to i2c_new_scanned_device
  platform: chrome: convert to i2c_new_scanned_device
  video: fbdev: matrox: convert to i2c_new_scanned_device
  input: mouse: convert to i2c_new_scanned_device
  media: pci: cx23885: convert to i2c_new_scanned_device
  media: pci: cx88: convert to i2c_new_scanned_device
  media: pci: bt8xx: convert to i2c_new_scanned_device
  media: pci: cx18: convert to i2c_new_scanned_device
  media: pci: ivtv: convert to i2c_new_scanned_device
  media: v4l2-core: convert to i2c_new_scanned_device

 Documentation/i2c/instantiating-devices.rst | 10 ++++-----
 Documentation/i2c/writing-clients.rst       |  8 +++----
 drivers/i2c/busses/i2c-icy.c                |  8 +++----
 drivers/i2c/i2c-core-base.c                 | 25 ++++++++++++++++-----
 drivers/input/mouse/psmouse-smbus.c         |  8 ++++---
 drivers/macintosh/therm_windtunnel.c        |  4 ++--
 drivers/media/pci/bt8xx/bttv-input.c        |  6 ++---
 drivers/media/pci/cx18/cx18-i2c.c           |  2 +-
 drivers/media/pci/cx23885/cx23885-i2c.c     |  4 ++--
 drivers/media/pci/cx88/cx88-input.c         |  2 +-
 drivers/media/pci/ivtv/ivtv-i2c.c           |  6 ++---
 drivers/media/pci/ivtv/ivtv-i2c.h           |  2 +-
 drivers/media/v4l2-core/v4l2-i2c.c          | 10 ++++-----
 drivers/platform/chrome/chromeos_laptop.c   | 18 ++++++++-------
 drivers/video/fbdev/matrox/i2c-matroxfb.c   |  4 ++--
 include/linux/i2c.h                         | 12 +++++++---
 16 files changed, 76 insertions(+), 53 deletions(-)

-- 
2.20.1

