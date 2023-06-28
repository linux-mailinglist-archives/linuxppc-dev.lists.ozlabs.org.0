Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E195D7408F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 05:30:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrRt95lRyz3bWr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 13:30:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nfschina.com (client-ip=42.101.60.195; helo=mail.nfschina.com; envelope-from=yunchuan@nfschina.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 122 seconds by postgrey-1.37 at boromir; Wed, 28 Jun 2023 12:45:12 AEST
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lists.ozlabs.org (Postfix) with SMTP id 4QrQt05GPjz2xqd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 12:45:12 +1000 (AEST)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id D81EF6032EB52;
	Wed, 28 Jun 2023 10:42:44 +0800 (CST)
X-MD-Sfrom: yunchuan@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: wuych <yunchuan@nfschina.com>
To: andrew@lunn.ch,
	f.fainelli@gmail.com,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	irusskikh@marvell.com,
	yisen.zhuang@huawei.com,
	salil.mehta@huawei.com,
	jesse.brandeburg@intel.com,
	anthony.l.nguyen@intel.com,
	steve.glendinning@shawell.net,
	iyappan@os.amperecomputing.com,
	keyur@os.amperecomputing.com,
	quan@os.amperecomputing.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	mostrows@earthlink.net,
	xeb@mail.ru,
	qiang.zhao@nxp.com
Subject: [PATCH net-next 00/10] Remove unnecessary (void*) conversions
Date: Wed, 28 Jun 2023 10:41:21 +0800
Message-Id: <20230628024121.1439149-1-yunchuan@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Jun 2023 13:30:01 +1000
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
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux@rempel-privat.de, intel-wired-lan@lists.osuosl.org, yangyingliang@huawei.com, yunchuan@nfschina.com, linuxppc-dev@lists.ozlabs.org, ansuelsmth@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove (void*) conversions under "drivers/net" directory.
According to the suggestion[1] of Jakub Kicinski, send these patches
in series of 10. 

wuych (10):
  net: dsa: ar9331: remove unnecessary (void*) conversions
  net: dsa: qca8k: remove unnecessary (void*) conversions
  atlantic:hw_atl2:hw_atl2_utils_fw: Remove unnecessary (void*)
    conversions
  ice: Remove unnecessary (void*) conversions
  ethernet: smsc: remove unnecessary (void*) conversions
  net: hns: Remove unnecessary (void*) conversions
  net: hns3: remove unnecessary (void*) conversions
  net: mdio: Remove unnecessary (void*) conversions
  net: ppp: remove unnecessary (void*) conversions
  net: wan: Remove unnecessary (void*) conversions

 drivers/net/dsa/qca/ar9331.c                     | 16 ++++++++--------
 drivers/net/dsa/qca/qca8k-8xxx.c                 |  2 +-
 drivers/net/dsa/qca/qca8k-common.c               |  6 +++---
 .../aquantia/atlantic/hw_atl2/hw_atl2_utils_fw.c |  2 +-
 .../net/ethernet/hisilicon/hns3/hns3_ethtool.c   |  2 +-
 drivers/net/ethernet/hisilicon/hns_mdio.c        | 10 +++++-----
 drivers/net/ethernet/intel/ice/ice_main.c        |  4 ++--
 drivers/net/ethernet/smsc/smsc911x.c             |  4 ++--
 drivers/net/ethernet/smsc/smsc9420.c             |  4 ++--
 drivers/net/mdio/mdio-xgene.c                    |  8 ++++----
 drivers/net/ppp/pppoe.c                          |  4 ++--
 drivers/net/ppp/pptp.c                           |  4 ++--
 drivers/net/wan/fsl_ucc_hdlc.c                   |  2 +-
 13 files changed, 34 insertions(+), 34 deletions(-)

[1] https://lore.kernel.org/all/20230518194627.4f9a6b04@kernel.org/
-- 
2.30.2

