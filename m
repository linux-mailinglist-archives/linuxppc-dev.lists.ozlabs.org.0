Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3683489AB34
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 15:58:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VBcQ11HGwz3vb5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Apr 2024 00:58:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:4f8:150:2161:1:b009:f23e:0; helo=bmailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 315 seconds by postgrey-1.37 at boromir; Sun, 07 Apr 2024 00:57:27 AEDT
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VBcP35nwgz3dCH
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Apr 2024 00:57:27 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 94813100D943C;
	Sat,  6 Apr 2024 15:51:59 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 3B10F233389; Sat,  6 Apr 2024 15:51:59 +0200 (CEST)
Message-Id: <cover.1712410202.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sat, 6 Apr 2024 15:52:00 +0200
Subject: [PATCH 0/2] Deduplicate bin_attribute simple read() callbacks
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
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
Cc: intel-gvt-dev@lists.freedesktop.org, linux-efi@vger.kernel.org, Zhi Wang <zhi.wang.linux@gmail.com>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, linux-acpi@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Jean Delvare <jdelvare@suse.com>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For my upcoming PCI device authentication v2 patches, I have the need
to expose a simple buffer in virtual memory as a bin_attribute.

It turns out we've duplicated the ->read() callback for such simple
buffers a fair number of times across the tree.

So instead of reinventing the wheel, I decided to introduce a common
helper and eliminate all duplications I could find.

I'm open to a bikeshedding discussion on the sysfs_bin_attr_simple_read()
name. ;)

Lukas Wunner (2):
  sysfs: Add sysfs_bin_attr_simple_read() helper
  treewide: Use sysfs_bin_attr_simple_read() helper

 arch/powerpc/platforms/powernv/opal.c              | 10 +-------
 drivers/acpi/bgrt.c                                |  9 +-------
 drivers/firmware/dmi_scan.c                        | 12 ++--------
 drivers/firmware/efi/rci2-table.c                  | 10 +-------
 drivers/gpu/drm/i915/gvt/firmware.c                | 26 +++++----------------
 .../intel/int340x_thermal/int3400_thermal.c        |  9 +-------
 fs/sysfs/file.c                                    | 27 ++++++++++++++++++++++
 include/linux/sysfs.h                              | 15 ++++++++++++
 init/initramfs.c                                   | 10 +-------
 kernel/module/sysfs.c                              | 13 +----------
 10 files changed, 56 insertions(+), 85 deletions(-)

-- 
2.43.0

