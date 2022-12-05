Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 065AF642D85
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 17:49:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQqKG5r54z3cJY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 03:49:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=vDsXVUhl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=outlook.com (client-ip=2a01:111:f403:700c::814; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=set_pte_at@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=vDsXVUhl;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn20814.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::814])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQnjf0rbrz3bXd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 02:37:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYyNM5umB/YlYyZFjHHO83Nsk29pNBut/O3cYc6qwQImzDXea5JAaDwaiA5JyYfxifWl1vwR5/6+g8puQUU7FljDX3Z8Jji/Jxm5J0eGNI0TLnxGtNJVMaQ51wmllQRgBHWWQp1Oa7lPbo6JanngWlg8hw9RTIuz2qXJ9q6zbCNN1CMRCrjsFhjiRxZS6pcAUsf2jDq1yAVDWDk96bTN09aaCCFgQ0qQNQW+vse0oaa3YF/CA13Bd8bRICjgKw0hhr09oPetcgae2pFLvqtuGPSgxRhN0SUDtkt+L4ibeGP1/qnawhEhB9ouCZbMgukGUo0vLEBHabfy+jE9TBMYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idjo0qiw5FRuENJqgeM1GJb0xhD361R10FEVg+6EwgI=;
 b=grQV9OBfNncScimeEqcCsVRnAKQKBpUbGR6clhTSMxy9GeKRV8CSIJsp4KSYtBc6xkHAi6dYM66J3SQbstkTITdY8XgdgKWUHK9fJ8xmSmmY1e/2zWoeCdbSZ0rSTXdqYlTyNh+wBEYUgwGL5dW2wFLc7pnxnk1tcZjdy1fRNGmR042c0JAYJvzIBHnRhudhu0dn/uBPrt9P8yb8oL0N/7S5fZZxId25hOK2asTvWRoI3tEtkYEmWNX35yZp8f4zIXtU8pUZ5wkkIkt9Cnfp540PIs//rUN11X6sc4paa14pU4fua3wK98xuHD/0bE7I7ywSAvD9ScbfOyBP3xS2RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idjo0qiw5FRuENJqgeM1GJb0xhD361R10FEVg+6EwgI=;
 b=vDsXVUhltjwMXORD4KVdUt1GOkZIu1tdiTJ3BOgVzx0KMEzqjh89CWCetQMV0MyTgCdA4wqLphkA1XWc/fFVnzvb6Ukt73yun15vq31uj16L0Cw5UPaLcIgKKnG4q4IWeqsDWZLFD+BLe1Ar40HJNZHWLPg3XS+AlEx6q7oOZui11xUUYuW8yuUfiKWViATafCUJJdXOOMElIGRjuEwmcPD9ehhqfpXkyzE7Rl6KYHLSQ4qDjQj0PNyy0krIL4e2Hss6nM9F4xaEzaWaFI390C+m6/16s80jUO4zf2u7nrIS4wR6c9IlV55VjNMvv1SOkA6xx7IZ8n4mZVHUMPVuxg==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYYP286MB1787.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 15:37:00 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%5]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 15:37:00 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH 0/6] Make remove() of any bus based driver void returned
Date: Mon,  5 Dec 2022 23:36:38 +0800
Message-ID:  <TYCP286MB23234ABCCF40E3FC42FD09A4CA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [UNXCpyl4RA3GK+ciwc5f+GWb8JB5tMkE]
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID:  <20221205153644.60909-1-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYYP286MB1787:EE_
X-MS-Office365-Filtering-Correlation-Id: aedce035-d51e-41c8-6e4b-08dad6d68b90
X-MS-Exchange-SLBlob-MailProps: 	ZRuQdVKRmYsFuMRaXb5//B01o/cN+noGWrg39EjfTQXunQwIDnBNGuuug4/KoHir8EFf0cr6w6gPVExnXvsev3xsuBD1BIaekqlE/uEzcar4E7aoIN5bHHWITdhmJaYXDpd2HhJ3IAFOHLAbqtmiSvinQwUiPLaEyPm9vT8zZrNiqCMSBC05XKFo/uDKXwjVjxlkFEK3e3rg5N0Q5L22vuMhcTe2EGhHqtDomBhXjX30qXqKLq9J4g3VEqSgx4zLmuOhQPIy2VO4rtZz4M11WAswWRGLfW0APpfqcV3IN0LtccA9TptjLTABsB47yWZVdyb7o+tCgAb5NeEb0Oo7kQg0ULtoR4+qLRx0KU12DgccklSt38OPJhKFa3PnXjLhpAI4jcHDXHqx3NIE8jdq2C4HS7igGHXO5B3CnXCzCx1EWhidysbyP4K2A9hc1ENARed57QK31bHvb5BH+6ZeBNCI8OmnbRJt6bG9PSe1L34f55RGXCGqqhwV7m41Se6ysolhquogekoWbDLZH5bSRxifpbdEEIxU/sCcMFxvqtAWR+AiQCmwaR72ottkjxbIM4BXPAAhrIXF+USAlrCJOqOzSxuMu1U/clROYqxwUV6vFyLMGp7Muxm2z689tT2K9HlaJRkAJxH47uUfpOL2WrUl3IxDEQzCNppe+yCIJihgwsZu+Hhj3RF9OLwPnELMuGJyZNC3zhLga7o7wYdGT2v2H4fcm1bH
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zGLnvyXv0fD6CDEHBIolniphzNkSmzBHMpXSdaYDHfiFUo506g9rEVf1fEJ45TUnM2aq5pjVIx3FKoZ94IhH2ranBQWlRiuxF6NRlH/kB+N8GAiLLbyIFD9qyrv5C8bk2h/i6ZV9yeENrY1e2SbZU4RXurxXaUZ1i9Amsq5tKmrEl8RSzcZ1r24MIF1p6zI+BjZSgokOZUunPrY5cDtq/PJzxD1EYVZnaq8o4t2+4xNvWJ/86jo/NspBOHOt7Wr355BVQabP5xU5CuXst41Z8ABPti/kmb0IS8urxRTboYB9r+Kc5K/4MdqDaKeB7YTQUgcBX2AQ7P4kmSaEPgQ5dKJJ6KIRSoQC3m8a5kt8k4wSYdCoDOJbMO5mDtQFaZo6xCvqiPoA6cWo5sQtY9j/F1croiOQFteX9Cn1AhTCyzRWkhnoY3swt5SP//843zbfYdpmfOoXHQ/pBJUs7k+BxKnPZi2svhH73cm+LujSUcje5baRUWtQm9gffSjivZR+yEtCVVckjYmf71iJnMfcWTs01Gog8SFAmOzGjOlXFjdUWs1IL3rp9XNbNDpvqUj6nDcAIXVYqzH6GwnPZa7qdtqZ7mCGJR2xzrhQ4C4XgrCj80grl2tkzk24fwQLgiYx91LCWm112cCSMBXC6gwrRQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?QRBTP8FnMx9BraTxM3xGIeujBWDR1n1+I3fxhWoTJSykREz6EqHLu90Zidj+?=
 =?us-ascii?Q?6UOogrOop8rfehSZb1RqSN5+dqjHmo0ByE3kyOrpY9T8UQGYAvXdOBPzv2BM?=
 =?us-ascii?Q?iyUiOESAAGutorftWnaH6GFJPdCjantLSBEyUXH+oNOnurQJv65ds6gzcGgc?=
 =?us-ascii?Q?p2OS6DCPFzLBsYgm42evehpZVjWh/5MBX8CGjtveguaxihJD94Vld7p1rBY3?=
 =?us-ascii?Q?6K3tzfEZYtFWnoiCUhYSkdJoNmwoo1zzx4d40kQy+dAyn2HVsmDGxQIVutO9?=
 =?us-ascii?Q?xEplfkhbLDdZcgSYqEXcJvSJOQU2BYXBrUmWAPqeNNd7lz/XMe8N3u22kAWZ?=
 =?us-ascii?Q?EeK2EtBbEznK4IhILxnb5rMS6pNjicdH2RpenTnLT7y2IrwG7K+nkFVRtCbs?=
 =?us-ascii?Q?RtEhltW46OZkxIFsAsUd5kZpffYoPjYEKdCTVOodl46+4dReg26gO0KFAp3t?=
 =?us-ascii?Q?vvjzoWow6VIBfWXUD/ftguEJPfLeLA9TSVDUKbtwivzKrnxDlnrgyYzqtl96?=
 =?us-ascii?Q?FbGnPqXNJufWQIBCESeiHYKpWW10OB0R7+tobIPI72Dgcw1dVfPy9uxjSVpd?=
 =?us-ascii?Q?aM0L9r8/ikA4aOLLzzAw5u87v9MmWN0wvvmAO80pMb5eefKlTYH9AVhXzgX/?=
 =?us-ascii?Q?qy+iM4b3xo0WFVRljQ0wzA/514sxeOOyauGNJxa0OrLo2dsBQP5KUSY4rpp0?=
 =?us-ascii?Q?yySYPsbsP92rBnryZSgHLzRclhq3Dr5LoFNHQlvfNG0YQWvo5XSUr/z/3Lju?=
 =?us-ascii?Q?yLTaFgHlFOCXXzB611uLgcQz2SdI0ZctPCC1jRG5A7Xu4nzW7pkT1Tr7Dtz9?=
 =?us-ascii?Q?AZ/T3JMRN5fvG5KJNg4wiTTXBIOsHasT7+shJIN0VAbdf63EQo/iHQWXDWY+?=
 =?us-ascii?Q?QuoIuURBpTxW34FpEQyMDUNrhluNKmrc1Hg2/Bs2zcJDlU1iVRyZNkQjqPvX?=
 =?us-ascii?Q?BgO+W0BY1IIu6V3mrEyc9J0Qjkbk7UeX1iavS+2rGLHeYzjKhiJkiazDilMR?=
 =?us-ascii?Q?EeYsJxiHj4+K7PPru7RYrtYnghs2RsrSzzxFA18VihfPgqKsPaWp5t3cXdpU?=
 =?us-ascii?Q?pEGR9UxdUuw67b7kLXZ1ncKkcHcrIPN5/6wYuC/5eON0mmxLIkcK6WbXfXrP?=
 =?us-ascii?Q?/Qvo7nzmjz7SO/ItZhpOEOx6xoaH/mUB6E3uE4MPjc9RYUTLmqv6WNx1+sds?=
 =?us-ascii?Q?DDTliP/mBqgvUQeM7pYBzyo40XQzuL3Ppq0XJIHDj9tK6b4zJHaewNFWXnjH?=
 =?us-ascii?Q?ojHK1SmW45QnQOaPqs1nZafLveMIfUwNN+ITvqj+gw=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aedce035-d51e-41c8-6e4b-08dad6d68b90
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 15:37:00.2471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB1787
X-Mailman-Approved-At: Tue, 06 Dec 2022 03:48:37 +1100
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
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org, linux-hyperv@vger.kernel.org, haiyangz@microsoft.com, linuxppc-dev@lists.ozlabs.org, decui@microsoft.com, alsa-devel@alsa-project.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com, robert.jarzmik@free.fr, Dawei Li <set_pte_at@outlook.com>, roger.pau@citrix.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For bus-based driver, device removal is implemented as:
device_remove() => bus->remove() => driver->remove()

Driver core needs no feedback from bus driver about the result of
remove callback. In which case, commit fc7a6209d571 ("bus: Make
remove callback return void") forces bus_type::remove be void-returned.

Now we have the situation that both 1st & 2nd part of calling chain
are void returned, so it does not make much sense for the last one
(driver->remove) to return non-void to its caller.

So the basic idea behind this patchset is making remove() callback of
any bus-based driver to be void returned.

This patchset includes changes for drivers below:
1. hyperv
2. macio
3. apr
4. xen
5. ac87
6. soundbus

Q: Why not platform drivers?
A: Too many of them.(maybe 4K+)

Dawei Li (6):
  hyperv: Make remove callback of hyperv driver void returned
  macio: Make remove callback of macio driver void returned
  apr: make remove callback of apr driver void returned
  xen: make remove callback of xen driver void returned
  ac97: make remove callback of ac97 driver void returned
  soundbus: make remove callback of soundbus driver void returned

 arch/powerpc/include/asm/macio.h                | 12 ++++++------
 drivers/ata/pata_macio.c                        |  4 +---
 drivers/block/xen-blkback/xenbus.c              |  4 +---
 drivers/block/xen-blkfront.c                    |  3 +--
 drivers/char/tpm/xen-tpmfront.c                 |  3 +--
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c         |  4 +---
 drivers/gpu/drm/xen/xen_drm_front.c             |  3 +--
 drivers/hid/hid-hyperv.c                        |  4 +---
 drivers/hv/hv_balloon.c                         |  5 +----
 drivers/hv/hv_util.c                            |  4 +---
 drivers/input/misc/xen-kbdfront.c               |  5 ++---
 drivers/input/serio/hyperv-keyboard.c           |  4 +---
 drivers/macintosh/rack-meter.c                  |  4 +---
 drivers/mfd/wm97xx-core.c                       |  4 +---
 drivers/net/ethernet/apple/bmac.c               |  4 +---
 drivers/net/ethernet/apple/mace.c               |  4 +---
 drivers/net/hyperv/netvsc_drv.c                 |  4 +---
 drivers/net/wireless/intersil/orinoco/airport.c |  4 +---
 drivers/net/xen-netback/xenbus.c                |  3 +--
 drivers/net/xen-netfront.c                      |  4 +---
 drivers/pci/controller/pci-hyperv.c             |  3 +--
 drivers/pci/xen-pcifront.c                      |  4 +---
 drivers/scsi/mac53c94.c                         |  5 +----
 drivers/scsi/mesh.c                             |  5 +----
 drivers/scsi/storvsc_drv.c                      |  4 +---
 drivers/scsi/xen-scsifront.c                    |  4 +---
 drivers/tty/hvc/hvc_xen.c                       |  4 ++--
 drivers/tty/serial/pmac_zilog.c                 |  7 ++-----
 drivers/uio/uio_hv_generic.c                    |  5 ++---
 drivers/usb/host/xen-hcd.c                      |  4 +---
 drivers/video/fbdev/hyperv_fb.c                 |  5 +----
 drivers/video/fbdev/xen-fbfront.c               |  6 ++----
 drivers/xen/pvcalls-back.c                      |  3 +--
 drivers/xen/pvcalls-front.c                     |  3 +--
 drivers/xen/xen-pciback/xenbus.c                |  4 +---
 drivers/xen/xen-scsiback.c                      |  4 +---
 include/linux/hyperv.h                          |  2 +-
 include/linux/soc/qcom/apr.h                    |  2 +-
 include/sound/ac97/codec.h                      |  6 +++---
 include/xen/xenbus.h                            |  2 +-
 net/9p/trans_xen.c                              |  3 +--
 net/vmw_vsock/hyperv_transport.c                |  4 +---
 sound/ac97/bus.c                                |  5 ++---
 sound/aoa/fabrics/layout.c                      |  3 +--
 sound/aoa/soundbus/i2sbus/core.c                |  4 +---
 sound/aoa/soundbus/soundbus.h                   |  6 +++---
 sound/soc/qcom/qdsp6/q6core.c                   |  4 +---
 sound/xen/xen_snd_front.c                       |  3 +--
 48 files changed, 63 insertions(+), 137 deletions(-)

-- 
2.25.1

