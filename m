Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D40174CDEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 09:09:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qzw9q34Lbz3c4Z
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 17:09:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nfschina.com (client-ip=42.101.60.195; helo=mail.nfschina.com; envelope-from=suhui@nfschina.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 121 seconds by postgrey-1.37 at boromir; Mon, 10 Jul 2023 16:40:59 AEST
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lists.ozlabs.org (Postfix) with SMTP id 4QzvXW6J5Vz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 16:40:59 +1000 (AEST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 95B15602A11D5;
	Mon, 10 Jul 2023 14:38:41 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: wg@grandegger.com,
	mkl@pengutronix.de,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	irusskikh@marvell.com,
	rmody@marvell.com,
	skalluru@marvell.com,
	GR-Linux-NIC-Dev@marvell.com,
	yisen.zhuang@huawei.com,
	salil.mehta@huawei.com,
	jesse.brandeburg@intel.com,
	anthony.l.nguyen@intel.com,
	steve.glendinning@shawell.net,
	iyappan@os.amperecomputing.com,
	keyur@os.amperecomputing.com,
	quan@os.amperecomputing.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	mostrows@earthlink.net,
	xeb@mail.ru,
	qiang.zhao@nxp.com
Subject: [PATCH net-next v2 00/10] Remove unnecessary (void*) conversions
Date: Mon, 10 Jul 2023 14:38:28 +0800
Message-Id: <20230710063828.172593-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Jul 2023 17:09:26 +1000
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
Cc: uttenthaler@ems-wuensche.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, intel-wired-lan@lists.osuosl.org, wuych <yunchuan@nfschina.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: wuych <yunchuan@nfschina.com>

Changes in v2:
	move declarations to be reverse xmas tree.
	compile it in net and net-next branch.
	remove some error patches in v1.

PATCH v1 link:
https://lore.kernel.org/all/20230628024121.1439149-1-yunchuan@nfschina.com/

wuych (10):
  net: wan: Remove unnecessary (void*) conversions
  net: atlantic: Remove unnecessary (void*) conversions
  net: ppp: Remove unnecessary (void*) conversions
  net: hns3: remove unnecessary (void*) conversions
  net: hns: Remove unnecessary (void*) conversions
  ice: remove unnecessary (void*) conversions
  ethernet: smsc: remove unnecessary (void*) conversions
  net: mdio: Remove unnecessary (void*) conversions
  can: ems_pci: Remove unnecessary (void*) conversions
  net: bna: Remove unnecessary (void*) conversions

 drivers/net/can/sja1000/ems_pci.c             |  6 +++---
 .../aquantia/atlantic/hw_atl2/hw_atl2.c       | 12 ++++++------
 .../atlantic/hw_atl2/hw_atl2_utils_fw.c       |  2 +-
 drivers/net/ethernet/brocade/bna/bnad.c       | 19 +++++++++----------
 .../ethernet/hisilicon/hns3/hns3_ethtool.c    |  2 +-
 drivers/net/ethernet/hisilicon/hns_mdio.c     | 10 +++++-----
 drivers/net/ethernet/intel/ice/ice_main.c     |  4 ++--
 drivers/net/ethernet/smsc/smsc911x.c          |  4 ++--
 drivers/net/ethernet/smsc/smsc9420.c          |  4 ++--
 drivers/net/mdio/mdio-xgene.c                 |  4 ++--
 drivers/net/ppp/pppoe.c                       |  4 ++--
 drivers/net/ppp/pptp.c                        |  4 ++--
 drivers/net/wan/fsl_ucc_hdlc.c                |  6 +++---
 13 files changed, 40 insertions(+), 41 deletions(-)

-- 
2.30.2

