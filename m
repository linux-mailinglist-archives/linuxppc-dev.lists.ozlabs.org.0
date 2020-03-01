Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0840B174DD9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 15:47:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VmM62Cs1zDr0p
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 01:46:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=leon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=dOzzEBsJ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VmJw6XcWzDr0P
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 01:45:04 +1100 (AEDT)
Received: from localhost (unknown [193.47.165.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 674A120880;
 Sun,  1 Mar 2020 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583073901;
 bh=kt741SrzGymR/U+kiWUmgrZjC78gpmkY1yf0gURzkCE=;
 h=From:To:Cc:Subject:Date:From;
 b=dOzzEBsJPve5MnjWSoDv41KxBMEx4EU9TJ/uQBkv5y0Kx0SbhxJJpfh/K4elLU0W6
 DhoOKm0/eT5xUOpGtESCGzcNMHdIIb1VKe4TSdTMRWyb/xXSDlckPzugyZ4Wo1Z03+
 Eq4V462zCZhyJn8cu0wifNqJ7GfungYAXs/gS/SU=
From: Leon Romanovsky <leon@kernel.org>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 00/23] Clean driver, module and FW versions
Date: Sun,  1 Mar 2020 16:44:33 +0200
Message-Id: <20200301144457.119795-1-leon@kernel.org>
X-Mailer: git-send-email 2.24.1
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
Cc: Ajit Khaparde <ajit.khaparde@broadcom.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Denis Kirjanov <kda@linux-powerpc.org>,
 Prashant Sreedharan <prashant@broadcom.com>,
 Govindarajulu Varadarajan <_govind@gmx.com>,
 Somnath Kotur <somnath.kotur@broadcom.com>,
 Vishal Kulkarni <vishal@chelsio.com>, GR-everest-linux-l2@marvell.com,
 Casey Leedom <leedom@chelsio.com>, Doug Berger <opendmb@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Linus Walleij <linus.walleij@linaro.org>, Sunil Goutham <sgoutham@marvell.com>,
 Parvi Kaustubhi <pkaustub@cisco.com>, Ariel Elior <aelior@marvell.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Satanand Burla <sburla@marvell.com>, Felix Manlunas <fmanlunas@marvell.com>,
 Leon Romanovsky <leonro@mellanox.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Sathya Perla <sathya.perla@broadcom.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-arm-kernel@lists.infradead.org,
 Raghu Vatsavayi <rvatsavayi@caviumnetworks.com>, GR-Linux-NIC-Dev@marvell.com,
 Fugang Duan <fugang.duan@nxp.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 linux-parisc@vger.kernel.org, Siva Reddy Kallam <siva.kallam@broadcom.com>,
 Rasesh Mody <rmody@marvell.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Robert Richter <rrichter@marvell.com>, Derek Chickles <dchickles@marvell.com>,
 linuxppc-dev@lists.ozlabs.org, Sudarsana Kalluru <skalluru@marvell.com>,
 Christian Benvenuti <benve@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Leon Romanovsky <leonro@mellanox.com>

Hi,

This is second batch of the series which removes various static versions
in favour of globaly defined Linux kernel version.

The first part with better cover letter can be found here
https://lore.kernel.org/lkml/20200224085311.460338-1-leon@kernel.org

The code is based on
68e2c37690b0 ("Merge branch 'hsr-several-code-cleanup-for-hsr-module'")

and WIP branch is
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=ethtool

Thanks

Leon Romanovsky (23):
  net/broadcom: Clean broadcom code from driver versions
  net/broadcom: Don't set N/A FW if it is not available
  net/brocade: Delete driver version
  net/liquidio: Delete driver version assignment
  net/liquidio: Delete non-working LIQUIDIO_PACKAGE check
  net/cavium: Clean driver versions
  net/cavium: Delete N/A assignments for ethtool
  net/chelsio: Delete drive and  module versions
  net/chelsio: Don't set N/A for not available FW
  net/cirrus: Delete driver version
  net/cisco: Delete driver and module versions
  net/cortina: Delete driver version from ethtool output
  net/davicom: Delete ethtool version assignment
  net/dec: Delete driver versions
  net/dlink: Remove driver version and release date
  net/dnet: Delete static version from the driver
  net/emulex: Delete driver version
  net/faraday: Delete driver version from the drivers
  net/fealnx: Delete driver version
  net/freescale: Clean drivers from static versions
  net/freescale: Don't set zero if FW not-available in dpaa
  net/freescale: Don't set zero if FW not-available in ucc_geth
  net/freescale: Don't set zero if FW iand bus not-available in gianfar

 drivers/net/ethernet/broadcom/b44.c           |  5 ----
 drivers/net/ethernet/broadcom/bcm63xx_enet.c  | 10 ++-----
 drivers/net/ethernet/broadcom/bcmsysport.c    |  1 -
 drivers/net/ethernet/broadcom/bnx2.c          | 11 --------
 drivers/net/ethernet/broadcom/bnx2x/bnx2x.h   |  8 +++++-
 .../ethernet/broadcom/bnx2x/bnx2x_ethtool.c   |  7 -----
 .../net/ethernet/broadcom/bnx2x/bnx2x_main.c  |  7 -----
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  8 ------
 drivers/net/ethernet/broadcom/bnxt/bnxt.h     |  4 ++-
 .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c |  1 -
 drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c |  1 -
 .../net/ethernet/broadcom/genet/bcmgenet.c    |  1 -
 drivers/net/ethernet/broadcom/tg3.c           | 11 +-------
 drivers/net/ethernet/brocade/bna/bnad.c       |  4 ---
 drivers/net/ethernet/brocade/bna/bnad.h       |  2 --
 .../net/ethernet/brocade/bna/bnad_ethtool.c   |  1 -
 .../ethernet/cavium/liquidio/lio_ethtool.c    |  2 --
 .../net/ethernet/cavium/liquidio/lio_main.c   |  8 ------
 .../ethernet/cavium/liquidio/lio_vf_main.c    |  5 ++--
 .../cavium/liquidio/liquidio_common.h         |  6 -----
 .../ethernet/cavium/liquidio/octeon_console.c | 10 ++-----
 .../net/ethernet/cavium/octeon/octeon_mgmt.c  |  6 -----
 .../ethernet/cavium/thunder/nicvf_ethtool.c   |  2 --
 drivers/net/ethernet/chelsio/cxgb/common.h    |  1 -
 drivers/net/ethernet/chelsio/cxgb/cxgb2.c     |  3 ---
 .../net/ethernet/chelsio/cxgb3/cxgb3_main.c   |  4 ---
 drivers/net/ethernet/chelsio/cxgb3/version.h  |  2 --
 drivers/net/ethernet/chelsio/cxgb4/cxgb4.h    |  3 +--
 .../ethernet/chelsio/cxgb4/cxgb4_ethtool.c    |  6 +----
 .../net/ethernet/chelsio/cxgb4/cxgb4_main.c   | 10 -------
 .../ethernet/chelsio/cxgb4vf/cxgb4vf_main.c   |  9 -------
 .../ethernet/chelsio/libcxgb/libcxgb_ppm.c    |  2 --
 drivers/net/ethernet/cirrus/ep93xx_eth.c      |  2 --
 drivers/net/ethernet/cisco/enic/enic.h        |  2 --
 .../net/ethernet/cisco/enic/enic_ethtool.c    |  1 -
 drivers/net/ethernet/cisco/enic/enic_main.c   |  3 ---
 drivers/net/ethernet/cortina/gemini.c         |  2 --
 drivers/net/ethernet/davicom/dm9000.c         |  2 --
 drivers/net/ethernet/dec/tulip/de2104x.c      | 15 -----------
 drivers/net/ethernet/dec/tulip/dmfe.c         | 14 ----------
 drivers/net/ethernet/dec/tulip/tulip_core.c   | 26 ++-----------------
 drivers/net/ethernet/dec/tulip/uli526x.c      | 13 ----------
 drivers/net/ethernet/dec/tulip/winbond-840.c  | 12 ---------
 drivers/net/ethernet/dlink/dl2k.c             |  9 -------
 drivers/net/ethernet/dlink/sundance.c         | 20 --------------
 drivers/net/ethernet/dnet.c                   |  1 -
 drivers/net/ethernet/dnet.h                   |  1 -
 drivers/net/ethernet/emulex/benet/be.h        |  1 -
 .../net/ethernet/emulex/benet/be_ethtool.c    |  1 -
 drivers/net/ethernet/emulex/benet/be_main.c   |  5 +---
 drivers/net/ethernet/faraday/ftgmac100.c      |  2 --
 drivers/net/ethernet/faraday/ftmac100.c       |  3 ---
 drivers/net/ethernet/fealnx.c                 | 20 --------------
 .../ethernet/freescale/dpaa/dpaa_ethtool.c    | 11 --------
 .../net/ethernet/freescale/enetc/enetc_pf.c   | 13 ----------
 .../net/ethernet/freescale/enetc/enetc_vf.c   | 12 ---------
 drivers/net/ethernet/freescale/fec_main.c     |  1 -
 .../ethernet/freescale/fs_enet/fs_enet-main.c |  2 --
 .../net/ethernet/freescale/fs_enet/fs_enet.h  |  2 --
 drivers/net/ethernet/freescale/gianfar.c      |  2 --
 drivers/net/ethernet/freescale/gianfar.h      |  1 -
 .../net/ethernet/freescale/gianfar_ethtool.c  |  4 ---
 drivers/net/ethernet/freescale/ucc_geth.c     |  1 -
 drivers/net/ethernet/freescale/ucc_geth.h     |  1 -
 .../net/ethernet/freescale/ucc_geth_ethtool.c |  2 --
 65 files changed, 22 insertions(+), 346 deletions(-)

--
2.24.1

