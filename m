Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19010599177
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 01:45:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M81jK05Lwz3cfD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 09:45:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=XLJz6K2X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mail.zeus03.de (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=XLJz6K2X;
	dkim-atps=neutral
X-Greylist: delayed 103 seconds by postgrey-1.36 at boromir; Fri, 19 Aug 2022 07:01:41 AEST
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7y452sN4z3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 07:01:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=k1; bh=IyCxl2UgKSDx8Aw7j0AznxrlFMm
	i1K4/GJEh9af0zg0=; b=XLJz6K2XYDjJmmY3wUW0N75ZCwRpBCk3mSX+gHRhRSy
	xN94iRKzutm2M5hRJ2ncR1KGY2x6yvwu6GfjrtiqzfMUc4IDf1gqj32fnPM1RZpm
	7TuyTXBvSo/FDHhco8EgRiR1IWUkU25/CXRnzvtFluLcgXaDb3x7XACyvNc7R4NM
	=
Received: (qmail 3960930 invoked from network); 18 Aug 2022 23:00:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Aug 2022 23:00:51 +0200
X-UD-Smtp-Session: l3s3148p1@gGHJRormjNMucref
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] net: move from strlcpy with unused retval to strscpy
Date: Thu, 18 Aug 2022 23:00:34 +0200
Message-Id: <20220818210050.7108-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Aug 2022 09:45:05 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Igor Russkikh <irusskikh@marvell.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>, David Dillow <dave@thedillows.org>, Somnath Kotur <somnath.kotur@broadcom.com>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, "K. Y. Srinivasan" <kys@microsoft.com>, linux-stm32@st-md-mailman.stormreply.com, Andy Gospodarek <andy@greyhouse.net>, Wei Liu <wei.liu@kernel.org>, Manish Chopra <manishc@marvell.com>, Samuel Holland <samuel@sholland.org>, Madalin Bucur <madalin.bucur@nxp.com>, Christian Lamparter <chunkeey@googlemail.com>, Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>, Franky Lin <franky.lin@broadcom.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Chris Lee <christopher.lee@cspi.com>, Nick Child <nnac123@linux.ibm.com>, Jiri Pirko <jiri@resnulli.us>, Jay Vosburgh <j.vosburgh@gmail.com>, Vinay Kumar Yadav <vinay.yadav@chelsio
 .com>, Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Igor Mitsyanko <imitsyanko@quantenna.com>, Krzysztof Halasa <khalasa@piap.pl>, Shay Agroskin <shayagr@amazon.com>, linux-omap@vger.kernel.org, Petr Machata <petrm@nvidia.com>, libertas-dev@lists.infradead.org, Rasesh Mody <rmody@marvell.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Douglas Miller <dougmill@linux.ibm.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, Ralf Baechle <ralf@linux-mips.org>, Vivien Didelot <vivien.didelot@gmail.com>, Ion Badulescu <ionut@badula.org>, Hartley Sweeten <hsweeten@visionengravers.com>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, Jon Mason <jdmason@kudzu.us>, Vladimir Oltean <olteanv@gmail.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Christian Benvenuti <benve@cisco.com>, Samuel Chessman <chessman@tux.org>, linux-usb@vger.kernel.org, Ronak Doshi <doshir@vmware.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Chris Snook <chris.snook@gmail.com>,
  Denis Kirjanov <kda@linux-powerpc.org>, Prashant Sreedharan <prashant@broadcom.com>, virtualization@lists.linux-foundation.org, Daniele Venzano <venza@brownhat.org>, Eric Dumazet <edumazet@google.com>, Zhu Yanjun <zyjzyj2000@gmail.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Arthur Kiyanovski <akiyano@amazon.com>, Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Sergey Matyukevich <geomatsi@gmail.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Rain River <rain.1986.08.12@gmail.com>, Veaceslav Falico <vfalico@gmail.com>, Martin Habets <habetsm.xilinx@gmail.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Wolfgang Grandegger <wg@grandegger.com>, Steve Glendinning <steve.glendinning@shawell.net>, Tom Lendacky <thomas.lendacky@amd.com>, Michael Hennerich <michael.hennerich@analog.com>, Ido Schimmel <idosch@nvidia.com>, Sean Wang <sean.wang@mediatek.com>, linuxppc-dev@lists.ozlabs.org, linux-can@vger.kernel.org, Siva Reddy Kallam <siva.kallam@broadcom.com
 >, Claudiu Manoil <claudiu.manoil@nxp.com>, Doug Berger <opendmb@gmail.com>, Simon Kelley <simon@thekelleys.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, Mirko Lindner <mlindner@marvell.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Nicolas Pitre <nico@fluxnic.net>, David Arinzon <darinzon@amazon.com>, Rohit Maheshwari <rohitm@chelsio.com>, Tariq Toukan <tariqt@nvidia.com>, Sudarsana Kalluru <skalluru@marvell.com>, Taras Chornyi <tchornyi@marvell.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-mediatek@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>, linux-wireless@vger.kernel.org, Ajit Khaparde <ajit.khaparde@broadcom.com>, Petko Manolov <petkan@nucleusys.com>, Andreas Larsson <andreas@gaisler.com>, Jason Wang <jasowang@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, linux-hyperv@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, oss-drivers@corigine.com, netdev@vger.kernel.org, 
 Subbaraya Sundeep <sbhatta@marvell.com>, Hin-Tak Leung <htl10@users.sourceforge.net>, Jassi Brar <jaswinder.singh@linaro.org>, Noam Dagan <ndagan@amazon.com>, Stanislaw Gruszka <stf_xl@wp.pl>, Ajay Singh <ajay.kathat@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>, Dave Jiang <dave.jiang@intel.com>, linux-rdma@vger.kernel.org, Guo-Fu Tseng <cooldavid@cooldavid.org>, Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, b43-dev@lists.infradead.org, Simon Horman <simon.horman@corigine.com>, Paolo Abeni <pabeni@redhat.com>, Allen Hubbe <allenbh@gmail.com>, Shahed Shaikh <shshaikh@marvell.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Byungho An <bh74.an@samsung.com>, Haiyang Zhang <haiyangz@microsoft.com>, Francois Romieu <romieu@fr.zoreil.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, Don Fry <pcnet32@fr
 ontier.com>, John Crispin <john@phrozen.org>, Michael Chan <michael.chan@broadcom.com>, Salil Mehta <salil.mehta@huawei.com>, GR-Linux-NIC-Dev@marvell.com, linux-parisc@vger.kernel.org, Geoff Levand <geoff@infradead.org>, linux-sunxi@lists.linux.dev, Edward Cree <ecree.xilinx@gmail.com>, Bryan Whitehead <bryan.whitehead@microchip.com>, Saeed Bishara <saeedb@amazon.com>, Mark Einon <mark.einon@gmail.com>, Geetha sowjanya <gakula@marvell.com>, Oliver Neukum <oneukum@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Govindarajulu Varadarajan <_govind@gmx.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ayush Sawal <ayush.sawal@chelsio.com>, UNGLinuxDriver@microchip.com, linux-acenic@sunsite.dk, Herton Ronaldo Krzesinski <herton@canonical.com>, Rahul Verma <rahulv@marvell.com>, Russell King <linux@armlinux.org.uk>, SHA-cyfmac-dev-list@infineo
 n.com, Lino Sanfilippo <LinoSanfilippo@gmx.de>, intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>, Steffen Klassert <klassert@kernel.org>, Sunil Goutham <sgoutham@marvell.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jes Sorensen <jes@trained-monkey.org>, nic_swsd@realtek.com, Ariel Elior <aelior@marvell.com>, Jouni Malinen <j@w1.fi>, Kalle Valo <kvalo@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Marcin Wojtas <mw@semihalf.com>, brcm80211-dev-list.pdl@broadcom.com, Sridhar Samudrala <sridhar.samudrala@intel.com>, David Ahern <dsahern@kernel.org>, linux-mips@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Stephen Hemminger <stephen@networkplumber.org>, hariprasad <hkelam@marvell.com>, ntb@lists.linux.dev, Raju Rangoju <rajur@chelsio.com>, Larry Finger <Larry.Finger@lwfinger.net>, Saeed Mahameed <saeedm@nvidia.com>, Felix Fietkau <nbd@nbd.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Follow the advice of the below link and prefer 'strscpy' in this
subsystem. Conversion is 1:1 because the return value is not used.
Generated by a coccinelle script.

Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/net/Space.c                              |  2 +-
 drivers/net/bonding/bond_main.c                  |  2 +-
 drivers/net/can/sja1000/peak_pcmcia.c            |  2 +-
 drivers/net/can/usb/peak_usb/pcan_usb_core.c     |  2 +-
 drivers/net/dsa/b53/b53_common.c                 |  2 +-
 drivers/net/dsa/bcm_sf2_cfp.c                    |  2 +-
 drivers/net/dsa/hirschmann/hellcreek.c           |  2 +-
 drivers/net/dsa/mv88e6xxx/chip.c                 |  2 +-
 drivers/net/dummy.c                              |  2 +-
 drivers/net/ethernet/3com/3c509.c                |  2 +-
 drivers/net/ethernet/3com/3c515.c                |  2 +-
 drivers/net/ethernet/3com/3c589_cs.c             |  2 +-
 drivers/net/ethernet/3com/3c59x.c                |  6 +++---
 drivers/net/ethernet/3com/typhoon.c              |  8 ++++----
 drivers/net/ethernet/8390/ax88796.c              |  6 +++---
 drivers/net/ethernet/8390/etherh.c               |  6 +++---
 drivers/net/ethernet/adaptec/starfire.c          |  4 ++--
 drivers/net/ethernet/aeroflex/greth.c            |  4 ++--
 drivers/net/ethernet/agere/et131x.c              |  4 ++--
 drivers/net/ethernet/alacritech/slicoss.c        |  4 ++--
 drivers/net/ethernet/allwinner/sun4i-emac.c      |  4 ++--
 drivers/net/ethernet/alteon/acenic.c             |  4 ++--
 drivers/net/ethernet/amazon/ena/ena_ethtool.c    |  4 ++--
 drivers/net/ethernet/amazon/ena/ena_netdev.c     |  2 +-
 drivers/net/ethernet/amd/amd8111e.c              |  4 ++--
 drivers/net/ethernet/amd/au1000_eth.c            |  2 +-
 drivers/net/ethernet/amd/nmclan_cs.c             |  2 +-
 drivers/net/ethernet/amd/pcnet32.c               |  4 ++--
 drivers/net/ethernet/amd/sunlance.c              |  2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c     |  4 ++--
 .../net/ethernet/aquantia/atlantic/aq_ethtool.c  |  2 +-
 drivers/net/ethernet/arc/emac_main.c             |  2 +-
 drivers/net/ethernet/atheros/ag71xx.c            |  4 ++--
 .../net/ethernet/atheros/atl1c/atl1c_ethtool.c   |  4 ++--
 .../net/ethernet/atheros/atl1e/atl1e_ethtool.c   |  6 +++---
 drivers/net/ethernet/atheros/atlx/atl1.c         |  4 ++--
 drivers/net/ethernet/atheros/atlx/atl2.c         |  6 +++---
 drivers/net/ethernet/broadcom/b44.c              |  6 +++---
 drivers/net/ethernet/broadcom/bcm63xx_enet.c     |  4 ++--
 drivers/net/ethernet/broadcom/bcmsysport.c       |  4 ++--
 drivers/net/ethernet/broadcom/bgmac.c            |  6 +++---
 drivers/net/ethernet/broadcom/bnx2.c             |  6 +++---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c  |  2 +-
 .../net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c  |  6 +++---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c |  2 +-
 .../net/ethernet/broadcom/bnx2x/bnx2x_sriov.h    |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c |  2 +-
 .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c    |  8 ++++----
 drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c    |  2 +-
 drivers/net/ethernet/broadcom/genet/bcmgenet.c   |  2 +-
 drivers/net/ethernet/broadcom/tg3.c              |  6 +++---
 drivers/net/ethernet/brocade/bna/bnad_ethtool.c  |  6 +++---
 drivers/net/ethernet/cavium/octeon/octeon_mgmt.c |  2 +-
 .../net/ethernet/cavium/thunder/nicvf_ethtool.c  |  4 ++--
 drivers/net/ethernet/chelsio/cxgb/cxgb2.c        |  4 ++--
 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c  |  4 ++--
 .../net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c   |  4 ++--
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c  |  4 ++--
 .../net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c  |  4 ++--
 .../chelsio/inline_crypto/chtls/chtls_main.c     |  2 +-
 drivers/net/ethernet/cirrus/ep93xx_eth.c         |  2 +-
 drivers/net/ethernet/cisco/enic/enic_ethtool.c   |  6 +++---
 drivers/net/ethernet/davicom/dm9000.c            |  4 ++--
 drivers/net/ethernet/dec/tulip/de2104x.c         |  4 ++--
 drivers/net/ethernet/dec/tulip/dmfe.c            |  4 ++--
 drivers/net/ethernet/dec/tulip/tulip_core.c      |  4 ++--
 drivers/net/ethernet/dec/tulip/uli526x.c         |  4 ++--
 drivers/net/ethernet/dec/tulip/winbond-840.c     |  4 ++--
 drivers/net/ethernet/dlink/dl2k.c                |  4 ++--
 drivers/net/ethernet/dlink/sundance.c            |  4 ++--
 drivers/net/ethernet/dnet.c                      |  4 ++--
 drivers/net/ethernet/emulex/benet/be_cmds.c      | 12 ++++++------
 drivers/net/ethernet/emulex/benet/be_ethtool.c   |  6 +++---
 drivers/net/ethernet/faraday/ftgmac100.c         |  4 ++--
 drivers/net/ethernet/faraday/ftmac100.c          |  4 ++--
 drivers/net/ethernet/fealnx.c                    |  4 ++--
 .../net/ethernet/freescale/dpaa/dpaa_ethtool.c   |  4 ++--
 drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c |  2 +-
 .../net/ethernet/freescale/enetc/enetc_ethtool.c |  4 ++--
 drivers/net/ethernet/freescale/fec_main.c        |  8 ++++----
 drivers/net/ethernet/freescale/fec_ptp.c         |  2 +-
 .../ethernet/freescale/fs_enet/fs_enet-main.c    |  2 +-
 drivers/net/ethernet/freescale/gianfar_ethtool.c |  2 +-
 .../net/ethernet/freescale/ucc_geth_ethtool.c    |  4 ++--
 drivers/net/ethernet/fujitsu/fmvj18x_cs.c        |  4 ++--
 drivers/net/ethernet/hisilicon/hip04_eth.c       |  4 ++--
 drivers/net/ethernet/ibm/ehea/ehea_ethtool.c     |  4 ++--
 drivers/net/ethernet/ibm/emac/core.c             |  4 ++--
 drivers/net/ethernet/ibm/ibmveth.c               |  4 ++--
 drivers/net/ethernet/intel/e100.c                |  4 ++--
 drivers/net/ethernet/intel/e1000/e1000_ethtool.c |  4 ++--
 drivers/net/ethernet/intel/e1000e/ethtool.c      |  4 ++--
 drivers/net/ethernet/intel/e1000e/netdev.c       |  6 +++---
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c   |  6 +++---
 drivers/net/ethernet/intel/i40e/i40e_main.c      | 16 ++++++++--------
 drivers/net/ethernet/intel/i40e/i40e_ptp.c       |  2 +-
 drivers/net/ethernet/intel/iavf/iavf_ethtool.c   |  6 +++---
 drivers/net/ethernet/intel/igb/igb_ethtool.c     |  6 +++---
 drivers/net/ethernet/intel/igb/igb_main.c        |  2 +-
 drivers/net/ethernet/intel/igbvf/ethtool.c       |  4 ++--
 drivers/net/ethernet/intel/ixgb/ixgb_ethtool.c   |  4 ++--
 drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c |  6 +++---
 drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c    |  2 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c    |  4 ++--
 drivers/net/ethernet/intel/ixgbevf/ethtool.c     |  4 ++--
 drivers/net/ethernet/jme.c                       |  6 +++---
 drivers/net/ethernet/korina.c                    |  6 +++---
 drivers/net/ethernet/marvell/mv643xx_eth.c       |  8 ++++----
 drivers/net/ethernet/marvell/mvneta.c            |  6 +++---
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c  |  6 +++---
 .../marvell/octeontx2/nic/otx2_ethtool.c         |  8 ++++----
 .../ethernet/marvell/prestera/prestera_ethtool.c |  4 ++--
 drivers/net/ethernet/marvell/pxa168_eth.c        |  8 ++++----
 drivers/net/ethernet/marvell/skge.c              |  6 +++---
 drivers/net/ethernet/marvell/sky2.c              |  6 +++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c      |  4 ++--
 drivers/net/ethernet/mediatek/mtk_star_emac.c    |  2 +-
 drivers/net/ethernet/mellanox/mlx4/en_ethtool.c  |  6 +++---
 drivers/net/ethernet/mellanox/mlx4/fw.c          |  2 +-
 .../net/ethernet/mellanox/mlx5/core/en_ethtool.c |  4 ++--
 drivers/net/ethernet/mellanox/mlx5/core/en_rep.c |  2 +-
 .../ethernet/mellanox/mlx5/core/ipoib/ethtool.c  |  2 +-
 drivers/net/ethernet/mellanox/mlxsw/core.c       |  2 +-
 drivers/net/ethernet/mellanox/mlxsw/minimal.c    |  4 ++--
 .../ethernet/mellanox/mlxsw/spectrum_ethtool.c   |  6 +++---
 drivers/net/ethernet/micrel/ks8851_common.c      |  6 +++---
 drivers/net/ethernet/micrel/ksz884x.c            |  6 +++---
 drivers/net/ethernet/microchip/enc28j60.c        |  6 +++---
 drivers/net/ethernet/microchip/encx24j600.c      |  6 +++---
 drivers/net/ethernet/microchip/lan743x_ethtool.c |  4 ++--
 drivers/net/ethernet/myricom/myri10ge/myri10ge.c |  8 ++++----
 drivers/net/ethernet/natsemi/natsemi.c           |  6 +++---
 drivers/net/ethernet/natsemi/ns83820.c           |  6 +++---
 drivers/net/ethernet/neterion/s2io.c             |  6 +++---
 .../net/ethernet/netronome/nfp/nfp_net_ethtool.c |  6 +++---
 drivers/net/ethernet/ni/nixge.c                  |  4 ++--
 drivers/net/ethernet/nvidia/forcedeth.c          |  6 +++---
 drivers/net/ethernet/nxp/lpc_eth.c               |  6 +++---
 .../ethernet/oki-semi/pch_gbe/pch_gbe_ethtool.c  |  6 +++---
 drivers/net/ethernet/packetengines/hamachi.c     |  6 +++---
 drivers/net/ethernet/packetengines/yellowfin.c   |  6 +++---
 .../ethernet/qlogic/netxen/netxen_nic_ethtool.c  |  6 +++---
 drivers/net/ethernet/qlogic/qed/qed_int.c        |  2 +-
 drivers/net/ethernet/qlogic/qede/qede_ethtool.c  |  4 ++--
 drivers/net/ethernet/qlogic/qede/qede_main.c     |  2 +-
 drivers/net/ethernet/qlogic/qla3xxx.c            |  6 +++---
 .../net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c  |  6 +++---
 drivers/net/ethernet/qualcomm/qca_debug.c        |  8 ++++----
 drivers/net/ethernet/rdc/r6040.c                 |  6 +++---
 drivers/net/ethernet/realtek/8139cp.c            |  6 +++---
 drivers/net/ethernet/realtek/8139too.c           |  6 +++---
 drivers/net/ethernet/realtek/r8169_main.c        |  6 +++---
 drivers/net/ethernet/rocker/rocker_main.c        |  4 ++--
 .../net/ethernet/samsung/sxgbe/sxgbe_ethtool.c   |  4 ++--
 drivers/net/ethernet/sfc/efx.c                   |  2 +-
 drivers/net/ethernet/sfc/efx_common.c            |  2 +-
 drivers/net/ethernet/sfc/ethtool_common.c        |  6 +++---
 drivers/net/ethernet/sfc/falcon/efx.c            |  4 ++--
 drivers/net/ethernet/sfc/falcon/ethtool.c        |  8 ++++----
 drivers/net/ethernet/sfc/falcon/falcon.c         |  2 +-
 drivers/net/ethernet/sfc/falcon/nic.c            |  2 +-
 drivers/net/ethernet/sfc/mcdi_mon.c              |  2 +-
 drivers/net/ethernet/sfc/nic.c                   |  2 +-
 drivers/net/ethernet/sfc/siena/efx.c             |  2 +-
 drivers/net/ethernet/sfc/siena/efx_common.c      |  2 +-
 drivers/net/ethernet/sfc/siena/ethtool_common.c  |  6 +++---
 drivers/net/ethernet/sfc/siena/mcdi_mon.c        |  2 +-
 drivers/net/ethernet/sfc/siena/nic.c             |  2 +-
 drivers/net/ethernet/sgi/ioc3-eth.c              |  6 +++---
 drivers/net/ethernet/sis/sis190.c                |  6 +++---
 drivers/net/ethernet/sis/sis900.c                |  6 +++---
 drivers/net/ethernet/smsc/epic100.c              |  6 +++---
 drivers/net/ethernet/smsc/smc911x.c              |  6 +++---
 drivers/net/ethernet/smsc/smc91c92_cs.c          |  4 ++--
 drivers/net/ethernet/smsc/smc91x.c               |  6 +++---
 drivers/net/ethernet/smsc/smsc911x.c             |  6 +++---
 drivers/net/ethernet/smsc/smsc9420.c             |  6 +++---
 drivers/net/ethernet/socionext/netsec.c          |  4 ++--
 drivers/net/ethernet/socionext/sni_ave.c         |  4 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c |  8 ++++----
 drivers/net/ethernet/sun/cassini.c               |  6 +++---
 drivers/net/ethernet/sun/ldmvsw.c                |  4 ++--
 drivers/net/ethernet/sun/niu.c                   |  6 +++---
 drivers/net/ethernet/sun/sunbmac.c               |  4 ++--
 drivers/net/ethernet/sun/sungem.c                |  6 +++---
 drivers/net/ethernet/sun/sunhme.c                |  6 +++---
 drivers/net/ethernet/sun/sunqe.c                 |  4 ++--
 drivers/net/ethernet/sun/sunvnet.c               |  4 ++--
 .../net/ethernet/synopsys/dwc-xlgmac-common.c    |  4 ++--
 .../net/ethernet/synopsys/dwc-xlgmac-ethtool.c   |  6 +++---
 drivers/net/ethernet/tehuti/tehuti.c             |  8 ++++----
 drivers/net/ethernet/ti/am65-cpsw-ethtool.c      |  4 ++--
 drivers/net/ethernet/ti/cpmac.c                  |  4 ++--
 drivers/net/ethernet/ti/cpsw.c                   |  6 +++---
 drivers/net/ethernet/ti/cpsw_new.c               |  6 +++---
 drivers/net/ethernet/ti/davinci_emac.c           |  4 ++--
 drivers/net/ethernet/ti/tlan.c                   |  6 +++---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c     |  4 ++--
 .../net/ethernet/toshiba/spider_net_ethtool.c    |  8 ++++----
 drivers/net/ethernet/toshiba/tc35815.c           |  6 +++---
 drivers/net/ethernet/via/via-rhine.c             |  4 ++--
 drivers/net/ethernet/via/via-velocity.c          |  8 ++++----
 drivers/net/ethernet/wiznet/w5100.c              |  6 +++---
 drivers/net/ethernet/wiznet/w5300.c              |  6 +++---
 .../net/ethernet/xilinx/xilinx_axienet_main.c    |  4 ++--
 drivers/net/ethernet/xilinx/xilinx_emaclite.c    |  2 +-
 drivers/net/ethernet/xircom/xirc2ps_cs.c         |  2 +-
 drivers/net/ethernet/xscale/ixp4xx_eth.c         |  4 ++--
 drivers/net/fjes/fjes_ethtool.c                  |  6 +++---
 drivers/net/geneve.c                             |  4 ++--
 drivers/net/hamradio/hdlcdrv.c                   |  2 +-
 drivers/net/hyperv/netvsc_drv.c                  |  4 ++--
 drivers/net/ipvlan/ipvlan_main.c                 |  4 ++--
 drivers/net/macvlan.c                            |  4 ++--
 drivers/net/net_failover.c                       |  4 ++--
 drivers/net/netconsole.c                         | 10 +++++-----
 drivers/net/ntb_netdev.c                         |  6 +++---
 drivers/net/phy/adin.c                           |  2 +-
 drivers/net/phy/bcm-phy-lib.c                    |  2 +-
 drivers/net/phy/marvell.c                        |  2 +-
 drivers/net/phy/micrel.c                         |  2 +-
 drivers/net/phy/mscc/mscc_main.c                 |  2 +-
 drivers/net/phy/phy_device.c                     |  2 +-
 drivers/net/rionet.c                             |  8 ++++----
 drivers/net/team/team.c                          |  4 ++--
 drivers/net/tun.c                                |  8 ++++----
 drivers/net/usb/aqc111.c                         |  2 +-
 drivers/net/usb/asix_common.c                    |  4 ++--
 drivers/net/usb/catc.c                           |  4 ++--
 drivers/net/usb/pegasus.c                        |  2 +-
 drivers/net/usb/r8152.c                          |  6 +++---
 drivers/net/usb/rtl8150.c                        |  4 ++--
 drivers/net/usb/sierra_net.c                     |  4 ++--
 drivers/net/usb/usbnet.c                         |  6 +++---
 drivers/net/veth.c                               |  4 ++--
 drivers/net/virtio_net.c                         |  6 +++---
 drivers/net/vmxnet3/vmxnet3_ethtool.c            |  6 +++---
 drivers/net/vrf.c                                |  4 ++--
 drivers/net/vxlan/vxlan_core.c                   |  4 ++--
 drivers/net/wireless/ath/ath6kl/init.c           |  2 +-
 drivers/net/wireless/ath/carl9170/fw.c           |  2 +-
 drivers/net/wireless/ath/wil6210/main.c          |  2 +-
 drivers/net/wireless/ath/wil6210/netdev.c        |  2 +-
 drivers/net/wireless/ath/wil6210/wmi.c           |  2 +-
 drivers/net/wireless/atmel/atmel.c               |  2 +-
 drivers/net/wireless/broadcom/b43/leds.c         |  2 +-
 drivers/net/wireless/broadcom/b43legacy/leds.c   |  2 +-
 .../broadcom/brcm80211/brcmfmac/common.c         |  8 ++++----
 .../wireless/broadcom/brcm80211/brcmfmac/core.c  |  8 ++++----
 .../broadcom/brcm80211/brcmfmac/firmware.c       |  2 +-
 .../broadcom/brcm80211/brcmfmac/fwsignal.c       |  2 +-
 drivers/net/wireless/intel/ipw2x00/ipw2100.c     |  6 +++---
 drivers/net/wireless/intel/ipw2x00/ipw2200.c     |  6 +++---
 drivers/net/wireless/intel/iwlegacy/3945-mac.c   |  2 +-
 .../net/wireless/intersil/hostap/hostap_ioctl.c  |  2 +-
 drivers/net/wireless/marvell/libertas/ethtool.c  |  4 ++--
 drivers/net/wireless/microchip/wilc1000/mon.c    |  2 +-
 .../net/wireless/quantenna/qtnfmac/cfg80211.c    |  2 +-
 .../net/wireless/quantenna/qtnfmac/commands.c    |  2 +-
 .../net/wireless/realtek/rtl818x/rtl8187/leds.c  |  2 +-
 drivers/net/wireless/wl3501_cs.c                 |  8 ++++----
 261 files changed, 568 insertions(+), 568 deletions(-)

diff --git a/drivers/net/Space.c b/drivers/net/Space.c
index f475eef14390..83214e2e70ab 100644
--- a/drivers/net/Space.c
+++ b/drivers/net/Space.c
@@ -68,7 +68,7 @@ static int netdev_boot_setup_add(char *name, struct ifmap *map)
 	for (i = 0; i < NETDEV_BOOT_SETUP_MAX; i++) {
 		if (s[i].name[0] == '\0' || s[i].name[0] == ' ') {
 			memset(s[i].name, 0, sizeof(s[i].name));
-			strlcpy(s[i].name, name, IFNAMSIZ);
+			strscpy(s[i].name, name, IFNAMSIZ);
 			memcpy(&s[i].map, map, sizeof(s[i].map));
 			break;
 		}
diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 50e60843020c..3c846b8ea44e 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -5619,7 +5619,7 @@ static int bond_ethtool_get_link_ksettings(struct net_device *bond_dev,
 static void bond_ethtool_get_drvinfo(struct net_device *bond_dev,
 				     struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version), "%d",
 		 BOND_ABI_VERSION);
 }
diff --git a/drivers/net/can/sja1000/peak_pcmcia.c b/drivers/net/can/sja1000/peak_pcmcia.c
index 131a084c3535..ebd5941c3f53 100644
--- a/drivers/net/can/sja1000/peak_pcmcia.c
+++ b/drivers/net/can/sja1000/peak_pcmcia.c
@@ -478,7 +478,7 @@ static void pcan_free_channels(struct pcan_pccard *card)
 		if (!netdev)
 			continue;
 
-		strlcpy(name, netdev->name, IFNAMSIZ);
+		strscpy(name, netdev->name, IFNAMSIZ);
 
 		unregister_sja1000dev(netdev);
 
diff --git a/drivers/net/can/usb/peak_usb/pcan_usb_core.c b/drivers/net/can/usb/peak_usb/pcan_usb_core.c
index 8c9d53f6e24c..225697d70a9a 100644
--- a/drivers/net/can/usb/peak_usb/pcan_usb_core.c
+++ b/drivers/net/can/usb/peak_usb/pcan_usb_core.c
@@ -962,7 +962,7 @@ static void peak_usb_disconnect(struct usb_interface *intf)
 
 		dev_prev_siblings = dev->prev_siblings;
 		dev->state &= ~PCAN_USB_STATE_CONNECTED;
-		strlcpy(name, netdev->name, IFNAMSIZ);
+		strscpy(name, netdev->name, IFNAMSIZ);
 
 		unregister_netdev(netdev);
 
diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 48cf344750ff..59cdfc51ce06 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -972,7 +972,7 @@ void b53_get_strings(struct dsa_switch *ds, int port, u32 stringset,
 
 	if (stringset == ETH_SS_STATS) {
 		for (i = 0; i < mib_size; i++)
-			strlcpy(data + i * ETH_GSTRING_LEN,
+			strscpy(data + i * ETH_GSTRING_LEN,
 				mibs[i].name, ETH_GSTRING_LEN);
 	} else if (stringset == ETH_SS_PHY_STATS) {
 		phydev = b53_get_phy_device(ds, port);
diff --git a/drivers/net/dsa/bcm_sf2_cfp.c b/drivers/net/dsa/bcm_sf2_cfp.c
index edbe5e7f1cb6..22bc295bebdb 100644
--- a/drivers/net/dsa/bcm_sf2_cfp.c
+++ b/drivers/net/dsa/bcm_sf2_cfp.c
@@ -1296,7 +1296,7 @@ void bcm_sf2_cfp_get_strings(struct dsa_switch *ds, int port,
 				 "CFP%03d_%sCntr",
 				 i, bcm_sf2_cfp_stats[j].name);
 			iter = (i - 1) * s + j;
-			strlcpy(data + iter * ETH_GSTRING_LEN,
+			strscpy(data + iter * ETH_GSTRING_LEN,
 				buf, ETH_GSTRING_LEN);
 		}
 	}
diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hirschmann/hellcreek.c
index 01f90994dedd..ea8bbfce0f1f 100644
--- a/drivers/net/dsa/hirschmann/hellcreek.c
+++ b/drivers/net/dsa/hirschmann/hellcreek.c
@@ -288,7 +288,7 @@ static void hellcreek_get_strings(struct dsa_switch *ds, int port,
 	for (i = 0; i < ARRAY_SIZE(hellcreek_counter); ++i) {
 		const struct hellcreek_counter *counter = &hellcreek_counter[i];
 
-		strlcpy(data + i * ETH_GSTRING_LEN,
+		strscpy(data + i * ETH_GSTRING_LEN,
 			counter->name, ETH_GSTRING_LEN);
 	}
 }
diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 07e9a4da924c..22288d3e73a4 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -1128,7 +1128,7 @@ static void mv88e6xxx_atu_vtu_get_strings(uint8_t *data)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(mv88e6xxx_atu_vtu_stats_strings); i++)
-		strlcpy(data + i * ETH_GSTRING_LEN,
+		strscpy(data + i * ETH_GSTRING_LEN,
 			mv88e6xxx_atu_vtu_stats_strings[i],
 			ETH_GSTRING_LEN);
 }
diff --git a/drivers/net/dummy.c b/drivers/net/dummy.c
index f82ad7419508..aa0fc00faecb 100644
--- a/drivers/net/dummy.c
+++ b/drivers/net/dummy.c
@@ -102,7 +102,7 @@ static const struct net_device_ops dummy_netdev_ops = {
 static void dummy_get_drvinfo(struct net_device *dev,
 			      struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
 }
 
 static const struct ethtool_ops dummy_ethtool_ops = {
diff --git a/drivers/net/ethernet/3com/3c509.c b/drivers/net/ethernet/3com/3c509.c
index 846fa3af4504..fb68339e1511 100644
--- a/drivers/net/ethernet/3com/3c509.c
+++ b/drivers/net/ethernet/3com/3c509.c
@@ -1135,7 +1135,7 @@ el3_netdev_set_ecmd(struct net_device *dev,
 
 static void el3_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
 }
 
 static int el3_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/3com/3c515.c b/drivers/net/ethernet/3com/3c515.c
index 1d124b0f65e7..d2f4358cc550 100644
--- a/drivers/net/ethernet/3com/3c515.c
+++ b/drivers/net/ethernet/3com/3c515.c
@@ -1527,7 +1527,7 @@ static void set_rx_mode(struct net_device *dev)
 static void netdev_get_drvinfo(struct net_device *dev,
 			       struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
 	snprintf(info->bus_info, sizeof(info->bus_info), "ISA 0x%lx",
 		 dev->base_addr);
 }
diff --git a/drivers/net/ethernet/3com/3c589_cs.c b/drivers/net/ethernet/3com/3c589_cs.c
index 4673bc1604e7..82f94b1635bf 100644
--- a/drivers/net/ethernet/3com/3c589_cs.c
+++ b/drivers/net/ethernet/3com/3c589_cs.c
@@ -480,7 +480,7 @@ static void tc589_reset(struct net_device *dev)
 static void netdev_get_drvinfo(struct net_device *dev,
 			       struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
 	snprintf(info->bus_info, sizeof(info->bus_info),
 		"PCMCIA 0x%lx", dev->base_addr);
 }
diff --git a/drivers/net/ethernet/3com/3c59x.c b/drivers/net/ethernet/3com/3c59x.c
index ccf07667aa5e..082388bb6169 100644
--- a/drivers/net/ethernet/3com/3c59x.c
+++ b/drivers/net/ethernet/3com/3c59x.c
@@ -2959,13 +2959,13 @@ static void vortex_get_drvinfo(struct net_device *dev,
 {
 	struct vortex_private *vp = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
 	if (VORTEX_PCI(vp)) {
-		strlcpy(info->bus_info, pci_name(VORTEX_PCI(vp)),
+		strscpy(info->bus_info, pci_name(VORTEX_PCI(vp)),
 			sizeof(info->bus_info));
 	} else {
 		if (VORTEX_EISA(vp))
-			strlcpy(info->bus_info, dev_name(vp->gendev),
+			strscpy(info->bus_info, dev_name(vp->gendev),
 				sizeof(info->bus_info));
 		else
 			snprintf(info->bus_info, sizeof(info->bus_info),
diff --git a/drivers/net/ethernet/3com/typhoon.c b/drivers/net/ethernet/3com/typhoon.c
index cad4f354cc76..aaaff3ba43ef 100644
--- a/drivers/net/ethernet/3com/typhoon.c
+++ b/drivers/net/ethernet/3com/typhoon.c
@@ -969,12 +969,12 @@ typhoon_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 
 	smp_rmb();
 	if (tp->card_state == Sleeping) {
-		strlcpy(info->fw_version, "Sleep image",
+		strscpy(info->fw_version, "Sleep image",
 			sizeof(info->fw_version));
 	} else {
 		INIT_COMMAND_WITH_RESPONSE(&xp_cmd, TYPHOON_CMD_READ_VERSIONS);
 		if (typhoon_issue_command(tp, 1, &xp_cmd, 3, xp_resp) < 0) {
-			strlcpy(info->fw_version, "Unknown runtime",
+			strscpy(info->fw_version, "Unknown runtime",
 				sizeof(info->fw_version));
 		} else {
 			u32 sleep_ver = le32_to_cpu(xp_resp[0].parm2);
@@ -984,8 +984,8 @@ typhoon_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 		}
 	}
 
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(pci_dev), sizeof(info->bus_info));
 }
 
 static int
diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 1f8acbba5b6b..af603256b724 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -579,9 +579,9 @@ static void ax_get_drvinfo(struct net_device *dev,
 {
 	struct platform_device *pdev = to_platform_device(dev->dev.parent);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pdev->name, sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pdev->name, sizeof(info->bus_info));
 }
 
 static u32 ax_get_msglevel(struct net_device *dev)
diff --git a/drivers/net/ethernet/8390/etherh.c b/drivers/net/ethernet/8390/etherh.c
index e7b879123bb1..05d39ecb97ff 100644
--- a/drivers/net/ethernet/8390/etherh.c
+++ b/drivers/net/ethernet/8390/etherh.c
@@ -555,9 +555,9 @@ static int __init etherm_addr(char *addr)
 
 static void etherh_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, dev_name(dev->dev.parent),
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, dev_name(dev->dev.parent),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/adaptec/starfire.c b/drivers/net/ethernet/adaptec/starfire.c
index 8f0a6b9c518e..857361c74f5d 100644
--- a/drivers/net/ethernet/adaptec/starfire.c
+++ b/drivers/net/ethernet/adaptec/starfire.c
@@ -1844,8 +1844,8 @@ static int check_if_running(struct net_device *dev)
 static void get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
 	struct netdev_private *np = netdev_priv(dev);
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
 }
 
 static int get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/aeroflex/greth.c b/drivers/net/ethernet/aeroflex/greth.c
index 447dc64a17e5..9c4fe25aca6c 100644
--- a/drivers/net/ethernet/aeroflex/greth.c
+++ b/drivers/net/ethernet/aeroflex/greth.c
@@ -1112,9 +1112,9 @@ static void greth_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *in
 {
 	struct greth_private *greth = netdev_priv(dev);
 
-	strlcpy(info->driver, dev_driver_string(greth->dev),
+	strscpy(info->driver, dev_driver_string(greth->dev),
 		sizeof(info->driver));
-	strlcpy(info->bus_info, greth->dev->bus->name, sizeof(info->bus_info));
+	strscpy(info->bus_info, greth->dev->bus->name, sizeof(info->bus_info));
 }
 
 static void greth_get_regs(struct net_device *dev, struct ethtool_regs *regs, void *p)
diff --git a/drivers/net/ethernet/agere/et131x.c b/drivers/net/ethernet/agere/et131x.c
index d19d1579c415..28334b1e3d6b 100644
--- a/drivers/net/ethernet/agere/et131x.c
+++ b/drivers/net/ethernet/agere/et131x.c
@@ -2952,8 +2952,8 @@ static void et131x_get_drvinfo(struct net_device *netdev,
 {
 	struct et131x_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(info->driver, DRIVER_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(adapter->pdev),
+	strscpy(info->driver, DRIVER_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(adapter->pdev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/alacritech/slicoss.c b/drivers/net/ethernet/alacritech/slicoss.c
index ce353b0c02a3..4cea61f16be3 100644
--- a/drivers/net/ethernet/alacritech/slicoss.c
+++ b/drivers/net/ethernet/alacritech/slicoss.c
@@ -1531,8 +1531,8 @@ static void slic_get_drvinfo(struct net_device *dev,
 {
 	struct slic_device *sdev = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(sdev->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(sdev->pdev), sizeof(info->bus_info));
 }
 
 static const struct ethtool_ops slic_ethtool_ops = {
diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index 621ce742ad21..a94c62956eed 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -331,8 +331,8 @@ static int emac_dma_inblk_32bit(struct emac_board_info *db,
 static void emac_get_drvinfo(struct net_device *dev,
 			      struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, dev_name(&dev->dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, dev_name(&dev->dev), sizeof(info->bus_info));
 }
 
 static u32 emac_get_msglevel(struct net_device *dev)
diff --git a/drivers/net/ethernet/alteon/acenic.c b/drivers/net/ethernet/alteon/acenic.c
index 22fe98555b24..d7762da8b2c0 100644
--- a/drivers/net/ethernet/alteon/acenic.c
+++ b/drivers/net/ethernet/alteon/acenic.c
@@ -2691,12 +2691,12 @@ static void ace_get_drvinfo(struct net_device *dev,
 {
 	struct ace_private *ap = netdev_priv(dev);
 
-	strlcpy(info->driver, "acenic", sizeof(info->driver));
+	strscpy(info->driver, "acenic", sizeof(info->driver));
 	snprintf(info->fw_version, sizeof(info->version), "%i.%i.%i",
 		 ap->firmware_major, ap->firmware_minor, ap->firmware_fix);
 
 	if (ap->pdev)
-		strlcpy(info->bus_info, pci_name(ap->pdev),
+		strscpy(info->bus_info, pci_name(ap->pdev),
 			sizeof(info->bus_info));
 
 }
diff --git a/drivers/net/ethernet/amazon/ena/ena_ethtool.c b/drivers/net/ethernet/amazon/ena/ena_ethtool.c
index 39242c5a1729..98d6386b7f39 100644
--- a/drivers/net/ethernet/amazon/ena/ena_ethtool.c
+++ b/drivers/net/ethernet/amazon/ena/ena_ethtool.c
@@ -462,8 +462,8 @@ static void ena_get_drvinfo(struct net_device *dev,
 {
 	struct ena_adapter *adapter = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(adapter->pdev),
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(adapter->pdev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/amazon/ena/ena_netdev.c b/drivers/net/ethernet/amazon/ena/ena_netdev.c
index 6a356a6cee15..371269e0b2b9 100644
--- a/drivers/net/ethernet/amazon/ena/ena_netdev.c
+++ b/drivers/net/ethernet/amazon/ena/ena_netdev.c
@@ -3166,7 +3166,7 @@ static void ena_config_host_info(struct ena_com_dev *ena_dev, struct pci_dev *pd
 	host_info->bdf = (pdev->bus->number << 8) | pdev->devfn;
 	host_info->os_type = ENA_ADMIN_OS_LINUX;
 	host_info->kernel_ver = LINUX_VERSION_CODE;
-	strlcpy(host_info->kernel_ver_str, utsname()->version,
+	strscpy(host_info->kernel_ver_str, utsname()->version,
 		sizeof(host_info->kernel_ver_str) - 1);
 	host_info->os_dist = 0;
 	strncpy(host_info->os_dist_str, utsname()->release,
diff --git a/drivers/net/ethernet/amd/amd8111e.c b/drivers/net/ethernet/amd/amd8111e.c
index 5d1baa01360f..fb6a5f64d221 100644
--- a/drivers/net/ethernet/amd/amd8111e.c
+++ b/drivers/net/ethernet/amd/amd8111e.c
@@ -1364,10 +1364,10 @@ static void amd8111e_get_drvinfo(struct net_device *dev,
 {
 	struct amd8111e_priv *lp = netdev_priv(dev);
 	struct pci_dev *pci_dev = lp->pci_dev;
-	strlcpy(info->driver, MODULE_NAME, sizeof(info->driver));
+	strscpy(info->driver, MODULE_NAME, sizeof(info->driver));
 	snprintf(info->fw_version, sizeof(info->fw_version),
 		"%u", chip_version);
-	strlcpy(info->bus_info, pci_name(pci_dev), sizeof(info->bus_info));
+	strscpy(info->bus_info, pci_name(pci_dev), sizeof(info->bus_info));
 }
 
 static int amd8111e_get_regs_len(struct net_device *dev)
diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index d5f2c6989221..81d5af00d30d 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -650,7 +650,7 @@ au1000_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
 	struct au1000_private *aup = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
 	snprintf(info->bus_info, sizeof(info->bus_info), "%s %d", DRV_NAME,
 		 aup->mac_id);
 }
diff --git a/drivers/net/ethernet/amd/nmclan_cs.c b/drivers/net/ethernet/amd/nmclan_cs.c
index 30ee5329bd7c..df8874bd619a 100644
--- a/drivers/net/ethernet/amd/nmclan_cs.c
+++ b/drivers/net/ethernet/amd/nmclan_cs.c
@@ -815,7 +815,7 @@ static int mace_close(struct net_device *dev)
 static void netdev_get_drvinfo(struct net_device *dev,
 			       struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
 	snprintf(info->bus_info, sizeof(info->bus_info),
 		"PCMCIA 0x%lx", dev->base_addr);
 }
diff --git a/drivers/net/ethernet/amd/pcnet32.c b/drivers/net/ethernet/amd/pcnet32.c
index b5ff47283cfe..c9138175ec07 100644
--- a/drivers/net/ethernet/amd/pcnet32.c
+++ b/drivers/net/ethernet/amd/pcnet32.c
@@ -797,9 +797,9 @@ static void pcnet32_get_drvinfo(struct net_device *dev,
 {
 	struct pcnet32_private *lp = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
 	if (lp->pci_dev)
-		strlcpy(info->bus_info, pci_name(lp->pci_dev),
+		strscpy(info->bus_info, pci_name(lp->pci_dev),
 			sizeof(info->bus_info));
 	else
 		snprintf(info->bus_info, sizeof(info->bus_info),
diff --git a/drivers/net/ethernet/amd/sunlance.c b/drivers/net/ethernet/amd/sunlance.c
index 22d609563af8..4ed2ebbf9ff7 100644
--- a/drivers/net/ethernet/amd/sunlance.c
+++ b/drivers/net/ethernet/amd/sunlance.c
@@ -1276,7 +1276,7 @@ static void lance_free_hwresources(struct lance_private *lp)
 /* Ethtool support... */
 static void sparc_lance_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, "sunlance", sizeof(info->driver));
+	strscpy(info->driver, "sunlance", sizeof(info->driver));
 }
 
 static const struct ethtool_ops sparc_lance_ethtool_ops = {
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c b/drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c
index 6ceb1cdf6eba..6e83ff59172a 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c
@@ -402,8 +402,8 @@ static void xgbe_get_drvinfo(struct net_device *netdev,
 	struct xgbe_prv_data *pdata = netdev_priv(netdev);
 	struct xgbe_hw_features *hw_feat = &pdata->hw_feat;
 
-	strlcpy(drvinfo->driver, XGBE_DRV_NAME, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->bus_info, dev_name(pdata->dev),
+	strscpy(drvinfo->driver, XGBE_DRV_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->bus_info, dev_name(pdata->dev),
 		sizeof(drvinfo->bus_info));
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version), "%d.%d.%d",
 		 XGMAC_GET_BITS(hw_feat->version, MAC_VR, USERVER),
diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c b/drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c
index 1daecd483b8d..a08f221e30d4 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ethtool.c
@@ -238,7 +238,7 @@ static void aq_ethtool_get_drvinfo(struct net_device *ndev,
 		 "%u.%u.%u", firmware_version >> 24,
 		 (firmware_version >> 16) & 0xFFU, firmware_version & 0xFFFFU);
 
-	strlcpy(drvinfo->bus_info, pdev ? pci_name(pdev) : "",
+	strscpy(drvinfo->bus_info, pdev ? pci_name(pdev) : "",
 		sizeof(drvinfo->bus_info));
 	drvinfo->n_stats = aq_ethtool_n_stats(ndev);
 	drvinfo->testinfo_len = 0;
diff --git a/drivers/net/ethernet/arc/emac_main.c b/drivers/net/ethernet/arc/emac_main.c
index 288e2961823e..ba0646b3b122 100644
--- a/drivers/net/ethernet/arc/emac_main.c
+++ b/drivers/net/ethernet/arc/emac_main.c
@@ -91,7 +91,7 @@ static void arc_emac_get_drvinfo(struct net_device *ndev,
 {
 	struct arc_emac_priv *priv = netdev_priv(ndev);
 
-	strlcpy(info->driver, priv->drv_name, sizeof(info->driver));
+	strscpy(info->driver, priv->drv_name, sizeof(info->driver));
 }
 
 static const struct ethtool_ops arc_emac_ethtool_ops = {
diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index e461f4764066..cc932b3cf873 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -451,8 +451,8 @@ static void ag71xx_get_drvinfo(struct net_device *ndev,
 {
 	struct ag71xx *ag = netdev_priv(ndev);
 
-	strlcpy(info->driver, "ag71xx", sizeof(info->driver));
-	strlcpy(info->bus_info, of_node_full_name(ag->pdev->dev.of_node),
+	strscpy(info->driver, "ag71xx", sizeof(info->driver));
+	strscpy(info->bus_info, of_node_full_name(ag->pdev->dev.of_node),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_ethtool.c b/drivers/net/ethernet/atheros/atl1c/atl1c_ethtool.c
index e2eb7b8c63a0..0bce122c68f1 100644
--- a/drivers/net/ethernet/atheros/atl1c/atl1c_ethtool.c
+++ b/drivers/net/ethernet/atheros/atl1c/atl1c_ethtool.c
@@ -220,8 +220,8 @@ static void atl1c_get_drvinfo(struct net_device *netdev,
 {
 	struct atl1c_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver,  atl1c_driver_name, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->driver,  atl1c_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e_ethtool.c b/drivers/net/ethernet/atheros/atl1e/atl1e_ethtool.c
index 0cbde352d1ba..68f1832a198d 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e_ethtool.c
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e_ethtool.c
@@ -306,9 +306,9 @@ static void atl1e_get_drvinfo(struct net_device *netdev,
 {
 	struct atl1e_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver,  atl1e_driver_name, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->fw_version, "L1e", sizeof(drvinfo->fw_version));
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->driver,  atl1e_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->fw_version, "L1e", sizeof(drvinfo->fw_version));
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index ff1fe09abf9f..7fcfba370fc3 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -3340,8 +3340,8 @@ static void atl1_get_drvinfo(struct net_device *netdev,
 {
 	struct atl1_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver, ATLX_DRIVER_NAME, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->driver, ATLX_DRIVER_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index bbc4d7b08a49..1b487c071cb6 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -1980,9 +1980,9 @@ static void atl2_get_drvinfo(struct net_device *netdev,
 {
 	struct atl2_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver,  atl2_driver_name, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->fw_version, "L2", sizeof(drvinfo->fw_version));
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->driver,  atl2_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->fw_version, "L2", sizeof(drvinfo->fw_version));
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/broadcom/b44.c b/drivers/net/ethernet/broadcom/b44.c
index e5857e88c207..7821084c8fbe 100644
--- a/drivers/net/ethernet/broadcom/b44.c
+++ b/drivers/net/ethernet/broadcom/b44.c
@@ -1790,13 +1790,13 @@ static void b44_get_drvinfo (struct net_device *dev, struct ethtool_drvinfo *inf
 	struct b44 *bp = netdev_priv(dev);
 	struct ssb_bus *bus = bp->sdev->bus;
 
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
 	switch (bus->bustype) {
 	case SSB_BUSTYPE_PCI:
-		strlcpy(info->bus_info, pci_name(bus->host_pci), sizeof(info->bus_info));
+		strscpy(info->bus_info, pci_name(bus->host_pci), sizeof(info->bus_info));
 		break;
 	case SSB_BUSTYPE_SSB:
-		strlcpy(info->bus_info, "SSB", sizeof(info->bus_info));
+		strscpy(info->bus_info, "SSB", sizeof(info->bus_info));
 		break;
 	case SSB_BUSTYPE_PCMCIA:
 	case SSB_BUSTYPE_SDIO:
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 1c6aea12db72..d91fdb0c2649 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -1321,8 +1321,8 @@ static const u32 unused_mib_regs[] = {
 static void bcm_enet_get_drvinfo(struct net_device *netdev,
 				 struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, bcm_enet_driver_name, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->bus_info, "bcm63xx", sizeof(drvinfo->bus_info));
+	strscpy(drvinfo->driver, bcm_enet_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->bus_info, "bcm63xx", sizeof(drvinfo->bus_info));
 }
 
 static int bcm_enet_get_sset_count(struct net_device *netdev,
diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index 47fc8e6963d5..52144ea2bbf3 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.c
+++ b/drivers/net/ethernet/broadcom/bcmsysport.c
@@ -308,8 +308,8 @@ static const struct bcm_sysport_stats bcm_sysport_gstrings_stats[] = {
 static void bcm_sysport_get_drvinfo(struct net_device *dev,
 				    struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
-	strlcpy(info->bus_info, "platform", sizeof(info->bus_info));
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->bus_info, "platform", sizeof(info->bus_info));
 }
 
 static u32 bcm_sysport_get_msglvl(struct net_device *dev)
diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 93580484a3f4..29a9ab20ff98 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -1367,7 +1367,7 @@ static void bgmac_get_strings(struct net_device *dev, u32 stringset,
 		return;
 
 	for (i = 0; i < BGMAC_STATS_LEN; i++)
-		strlcpy(data + i * ETH_GSTRING_LEN,
+		strscpy(data + i * ETH_GSTRING_LEN,
 			bgmac_get_strings_stats[i].name, ETH_GSTRING_LEN);
 }
 
@@ -1395,8 +1395,8 @@ static void bgmac_get_ethtool_stats(struct net_device *dev,
 static void bgmac_get_drvinfo(struct net_device *net_dev,
 			      struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
-	strlcpy(info->bus_info, "AXI", sizeof(info->bus_info));
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->bus_info, "AXI", sizeof(info->bus_info));
 }
 
 static const struct ethtool_ops bgmac_ethtool_ops = {
diff --git a/drivers/net/ethernet/broadcom/bnx2.c b/drivers/net/ethernet/broadcom/bnx2.c
index b97ed9b5f685..b612781be893 100644
--- a/drivers/net/ethernet/broadcom/bnx2.c
+++ b/drivers/net/ethernet/broadcom/bnx2.c
@@ -7042,9 +7042,9 @@ bnx2_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
 	struct bnx2 *bp = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(bp->pdev), sizeof(info->bus_info));
-	strlcpy(info->fw_version, bp->fw_version, sizeof(info->fw_version));
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(bp->pdev), sizeof(info->bus_info));
+	strscpy(info->fw_version, bp->fw_version, sizeof(info->fw_version));
 }
 
 #define BNX2_REGDUMP_LEN		(32 * 1024)
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
index 712b5595bc39..e704e42446aa 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
@@ -150,7 +150,7 @@ void bnx2x_fill_fw_str(struct bnx2x *bp, char *buf, size_t buf_len)
 		phy_fw_ver[0] = '\0';
 		bnx2x_get_ext_phy_fw_version(&bp->link_params,
 					     phy_fw_ver, PHY_FW_VER_LEN);
-		strlcpy(buf, bp->fw_ver, buf_len);
+		strscpy(buf, bp->fw_ver, buf_len);
 		snprintf(buf + strlen(bp->fw_ver), 32 - strlen(bp->fw_ver),
 			 "bc %d.%d.%d%s%s",
 			 (bp->common.bc_ver & 0xff0000) >> 16,
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
index 0e319ac7799f..bda3ccc28eca 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
@@ -1112,7 +1112,7 @@ static void bnx2x_get_drvinfo(struct net_device *dev,
 	int ext_dev_info_offset;
 	u32 mbi;
 
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
 
 	if (SHMEM2_HAS(bp, extended_dev_info_shared_addr)) {
 		ext_dev_info_offset = SHMEM2_RD(bp,
@@ -1126,7 +1126,7 @@ static void bnx2x_get_drvinfo(struct net_device *dev,
 				 (mbi & 0xff000000) >> 24,
 				 (mbi & 0x00ff0000) >> 16,
 				 (mbi & 0x0000ff00) >> 8);
-			strlcpy(info->fw_version, version,
+			strscpy(info->fw_version, version,
 				sizeof(info->fw_version));
 		}
 	}
@@ -1135,7 +1135,7 @@ static void bnx2x_get_drvinfo(struct net_device *dev,
 	bnx2x_fill_fw_str(bp, version, ETHTOOL_FWVERS_LEN);
 	strlcat(info->fw_version, version, sizeof(info->fw_version));
 
-	strlcpy(info->bus_info, pci_name(bp->pdev), sizeof(info->bus_info));
+	strscpy(info->bus_info, pci_name(bp->pdev), sizeof(info->bus_info));
 }
 
 static void bnx2x_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index 962253db25b8..51b1690fd045 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -3385,7 +3385,7 @@ static void bnx2x_drv_info_ether_stat(struct bnx2x *bp)
 		&bp->sp_objs->mac_obj;
 	int i;
 
-	strlcpy(ether_stat->version, DRV_MODULE_VERSION,
+	strscpy(ether_stat->version, DRV_MODULE_VERSION,
 		ETH_STAT_INFO_VERSION_LEN);
 
 	/* get DRV_INFO_ETH_STAT_NUM_MACS_REQUIRED macs, placing them in the
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h
index 2dac704dc346..02a4e557e176 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_sriov.h
@@ -518,7 +518,7 @@ int bnx2x_vfpf_storm_rx_mode(struct bnx2x *bp);
 static inline void bnx2x_vf_fill_fw_str(struct bnx2x *bp, char *buf,
 					size_t buf_len)
 {
-	strlcpy(buf, bp->acquire_resp.pfdev_info.fw_ver, buf_len);
+	strscpy(buf, bp->acquire_resp.pfdev_info.fw_ver, buf_len);
 }
 
 static inline int bnx2x_vf_ustorm_prods_offset(struct bnx2x *bp,
diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c
index c9129b9ba446..0657a0f5170f 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c
@@ -380,7 +380,7 @@ int bnx2x_vfpf_acquire(struct bnx2x *bp, u8 tx_count, u8 rx_count)
 	bp->igu_base_sb = bp->acquire_resp.resc.hw_sbs[0].hw_sb_id;
 	bp->vlan_credit = bp->acquire_resp.resc.num_vlan_filters;
 
-	strlcpy(bp->fw_ver, bp->acquire_resp.pfdev_info.fw_ver,
+	strscpy(bp->fw_ver, bp->acquire_resp.pfdev_info.fw_ver,
 		sizeof(bp->fw_ver));
 
 	if (is_valid_ether_addr(bp->acquire_resp.resc.current_mac_addr))
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
index 87eb5362ad70..f57e524c7e30 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c
@@ -1371,9 +1371,9 @@ static void bnxt_get_drvinfo(struct net_device *dev,
 {
 	struct bnxt *bp = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
-	strlcpy(info->fw_version, bp->fw_ver_str, sizeof(info->fw_version));
-	strlcpy(info->bus_info, pci_name(bp->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->fw_version, bp->fw_ver_str, sizeof(info->fw_version));
+	strscpy(info->bus_info, pci_name(bp->pdev), sizeof(info->bus_info));
 	info->n_stats = bnxt_get_num_stats(bp);
 	info->testinfo_len = bp->num_tests;
 	/* TODO CHIMP_FW: eeprom dump details */
@@ -3876,7 +3876,7 @@ void bnxt_ethtool_init(struct bnxt *bp)
 		} else if (i == BNXT_IRQ_TEST_IDX) {
 			strcpy(str, "Interrupt_test (offline)");
 		} else {
-			strlcpy(str, fw_str, ETH_GSTRING_LEN);
+			strscpy(str, fw_str, ETH_GSTRING_LEN);
 			strncat(str, " test", ETH_GSTRING_LEN - strlen(str));
 			if (test_info->offline_mask & (1 << i))
 				strncat(str, " (offline)",
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c
index eb4803b11c0e..fcc65890820a 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c
@@ -222,7 +222,7 @@ static int bnxt_vf_rep_get_phys_port_name(struct net_device *dev, char *buf,
 static void bnxt_vf_rep_get_drvinfo(struct net_device *dev,
 				    struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
 }
 
 static int bnxt_vf_rep_get_port_parent_id(struct net_device *dev,
diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 8309fb993cdb..667e66079c73 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -1146,7 +1146,7 @@ static const struct bcmgenet_stats bcmgenet_gstrings_stats[] = {
 static void bcmgenet_get_drvinfo(struct net_device *dev,
 				 struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, "bcmgenet", sizeof(info->driver));
+	strscpy(info->driver, "bcmgenet", sizeof(info->driver));
 }
 
 static int bcmgenet_get_sset_count(struct net_device *dev, int string_set)
diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index db1e9d810b41..1ff27c548e7a 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -12302,9 +12302,9 @@ static void tg3_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info
 {
 	struct tg3 *tp = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
-	strlcpy(info->fw_version, tp->fw_ver, sizeof(info->fw_version));
-	strlcpy(info->bus_info, pci_name(tp->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->fw_version, tp->fw_ver, sizeof(info->fw_version));
+	strscpy(info->bus_info, pci_name(tp->pdev), sizeof(info->bus_info));
 }
 
 static void tg3_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
diff --git a/drivers/net/ethernet/brocade/bna/bnad_ethtool.c b/drivers/net/ethernet/brocade/bna/bnad_ethtool.c
index 8aca768571b2..5d2c68ee1ea9 100644
--- a/drivers/net/ethernet/brocade/bna/bnad_ethtool.c
+++ b/drivers/net/ethernet/brocade/bna/bnad_ethtool.c
@@ -283,7 +283,7 @@ bnad_get_drvinfo(struct net_device *netdev, struct ethtool_drvinfo *drvinfo)
 	struct bfa_ioc_attr *ioc_attr;
 	unsigned long flags;
 
-	strlcpy(drvinfo->driver, BNAD_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->driver, BNAD_NAME, sizeof(drvinfo->driver));
 
 	ioc_attr = kzalloc(sizeof(*ioc_attr), GFP_KERNEL);
 	if (ioc_attr) {
@@ -291,12 +291,12 @@ bnad_get_drvinfo(struct net_device *netdev, struct ethtool_drvinfo *drvinfo)
 		bfa_nw_ioc_get_attr(&bnad->bna.ioceth.ioc, ioc_attr);
 		spin_unlock_irqrestore(&bnad->bna_lock, flags);
 
-		strlcpy(drvinfo->fw_version, ioc_attr->adapter_attr.fw_ver,
+		strscpy(drvinfo->fw_version, ioc_attr->adapter_attr.fw_ver,
 			sizeof(drvinfo->fw_version));
 		kfree(ioc_attr);
 	}
 
-	strlcpy(drvinfo->bus_info, pci_name(bnad->pcidev),
+	strscpy(drvinfo->bus_info, pci_name(bnad->pcidev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c b/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
index 103591dcea1c..369bfd376d6f 100644
--- a/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
+++ b/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
@@ -1342,7 +1342,7 @@ static void octeon_mgmt_poll_controller(struct net_device *netdev)
 static void octeon_mgmt_get_drvinfo(struct net_device *netdev,
 				    struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
 }
 
 static int octeon_mgmt_nway_reset(struct net_device *dev)
diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_ethtool.c b/drivers/net/ethernet/cavium/thunder/nicvf_ethtool.c
index 5a9fad61e9ea..e5c71f907852 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_ethtool.c
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_ethtool.c
@@ -191,8 +191,8 @@ static void nicvf_get_drvinfo(struct net_device *netdev,
 {
 	struct nicvf *nic = netdev_priv(netdev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(nic->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(nic->pdev), sizeof(info->bus_info));
 }
 
 static u32 nicvf_get_msglevel(struct net_device *netdev)
diff --git a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c b/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
index f4054d2553ea..17043c4fce52 100644
--- a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
+++ b/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
@@ -429,8 +429,8 @@ static void get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
 	struct adapter *adapter = dev->ml_priv;
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(adapter->pdev),
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(adapter->pdev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c b/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
index 174b1e156669..a46afc0bf5cc 100644
--- a/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
@@ -1627,8 +1627,8 @@ static void get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 	t3_get_tp_version(adapter, &tp_vers);
 	spin_unlock(&adapter->stats_lock);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(adapter->pdev),
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(adapter->pdev),
 		sizeof(info->bus_info));
 	if (fw_vers)
 		snprintf(info->fw_version, sizeof(info->fw_version),
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
index 77897edd2bc0..8477a93cee6b 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c
@@ -199,8 +199,8 @@ static void get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 	struct adapter *adapter = netdev2adap(dev);
 	u32 exprom_vers;
 
-	strlcpy(info->driver, cxgb4_driver_name, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(adapter->pdev),
+	strscpy(info->driver, cxgb4_driver_name, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(adapter->pdev),
 		sizeof(info->bus_info));
 	info->regdump_len = get_regs_len(dev);
 
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
index d0061921529f..9cbce1faab26 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
@@ -3903,8 +3903,8 @@ static void cxgb4_mgmt_get_drvinfo(struct net_device *dev,
 {
 	struct adapter *adapter = netdev2adap(dev);
 
-	strlcpy(info->driver, cxgb4_driver_name, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(adapter->pdev),
+	strscpy(info->driver, cxgb4_driver_name, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(adapter->pdev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c b/drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c
index c2822e635f89..54db79f4dcfe 100644
--- a/drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c
@@ -1553,8 +1553,8 @@ static void cxgb4vf_get_drvinfo(struct net_device *dev,
 {
 	struct adapter *adapter = netdev2adap(dev);
 
-	strlcpy(drvinfo->driver, KBUILD_MODNAME, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->bus_info, pci_name(to_pci_dev(dev->dev.parent)),
+	strscpy(drvinfo->driver, KBUILD_MODNAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->bus_info, pci_name(to_pci_dev(dev->dev.parent)),
 		sizeof(drvinfo->bus_info));
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 		 "%u.%u.%u.%u, TP %u.%u.%u.%u",
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_main.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_main.c
index 9098b3eed4da..1e55b12fee51 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_main.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_main.c
@@ -193,7 +193,7 @@ static void chtls_register_dev(struct chtls_dev *cdev)
 {
 	struct tls_toe_device *tlsdev = &cdev->tlsdev;
 
-	strlcpy(tlsdev->name, "chtls", TLS_TOE_DEVICE_NAME_MAX);
+	strscpy(tlsdev->name, "chtls", TLS_TOE_DEVICE_NAME_MAX);
 	strlcat(tlsdev->name, cdev->lldi->ports[0]->name,
 		TLS_TOE_DEVICE_NAME_MAX);
 	tlsdev->feature = chtls_inline_feature;
diff --git a/drivers/net/ethernet/cirrus/ep93xx_eth.c b/drivers/net/ethernet/cirrus/ep93xx_eth.c
index 21ba6e893072..888506185326 100644
--- a/drivers/net/ethernet/cirrus/ep93xx_eth.c
+++ b/drivers/net/ethernet/cirrus/ep93xx_eth.c
@@ -689,7 +689,7 @@ static int ep93xx_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 
 static void ep93xx_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
 }
 
 static int ep93xx_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/cisco/enic/enic_ethtool.c b/drivers/net/ethernet/cisco/enic/enic_ethtool.c
index 60d8c0fbc037..08b7cc0a1809 100644
--- a/drivers/net/ethernet/cisco/enic/enic_ethtool.c
+++ b/drivers/net/ethernet/cisco/enic/enic_ethtool.c
@@ -131,10 +131,10 @@ static void enic_get_drvinfo(struct net_device *netdev,
 	if (err == -ENOMEM)
 		return;
 
-	strlcpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->fw_version, fw_info->fw_version,
+	strscpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->fw_version, fw_info->fw_version,
 		sizeof(drvinfo->fw_version));
-	strlcpy(drvinfo->bus_info, pci_name(enic->pdev),
+	strscpy(drvinfo->bus_info, pci_name(enic->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/davicom/dm9000.c b/drivers/net/ethernet/davicom/dm9000.c
index 0985ab216566..77229e53b04e 100644
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -540,8 +540,8 @@ static void dm9000_get_drvinfo(struct net_device *dev,
 {
 	struct board_info *dm = to_dm9000_board(dev);
 
-	strlcpy(info->driver, CARDNAME, sizeof(info->driver));
-	strlcpy(info->bus_info, to_platform_device(dm->dev)->name,
+	strscpy(info->driver, CARDNAME, sizeof(info->driver));
+	strscpy(info->bus_info, to_platform_device(dm->dev)->name,
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/dec/tulip/de2104x.c b/drivers/net/ethernet/dec/tulip/de2104x.c
index d51b3d24a0c8..cd3dc4b89518 100644
--- a/drivers/net/ethernet/dec/tulip/de2104x.c
+++ b/drivers/net/ethernet/dec/tulip/de2104x.c
@@ -1606,8 +1606,8 @@ static void de_get_drvinfo (struct net_device *dev,struct ethtool_drvinfo *info)
 {
 	struct de_private *de = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(de->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(de->pdev), sizeof(info->bus_info));
 }
 
 static int de_get_regs_len(struct net_device *dev)
diff --git a/drivers/net/ethernet/dec/tulip/dmfe.c b/drivers/net/ethernet/dec/tulip/dmfe.c
index 83f1727d1423..3188ba7b450f 100644
--- a/drivers/net/ethernet/dec/tulip/dmfe.c
+++ b/drivers/net/ethernet/dec/tulip/dmfe.c
@@ -1074,8 +1074,8 @@ static void dmfe_ethtool_get_drvinfo(struct net_device *dev,
 {
 	struct dmfe_board_info *np = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(np->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(np->pdev), sizeof(info->bus_info));
 }
 
 static int dmfe_ethtool_set_wol(struct net_device *dev,
diff --git a/drivers/net/ethernet/dec/tulip/tulip_core.c b/drivers/net/ethernet/dec/tulip/tulip_core.c
index b8e46c4849ef..ecfad43df45a 100644
--- a/drivers/net/ethernet/dec/tulip/tulip_core.c
+++ b/drivers/net/ethernet/dec/tulip/tulip_core.c
@@ -858,8 +858,8 @@ static struct net_device_stats *tulip_get_stats(struct net_device *dev)
 static void tulip_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
 	struct tulip_private *np = netdev_priv(dev);
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(np->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(np->pdev), sizeof(info->bus_info));
 }
 
 
diff --git a/drivers/net/ethernet/dec/tulip/uli526x.c b/drivers/net/ethernet/dec/tulip/uli526x.c
index 77d9058431e3..ff080ab0f116 100644
--- a/drivers/net/ethernet/dec/tulip/uli526x.c
+++ b/drivers/net/ethernet/dec/tulip/uli526x.c
@@ -971,8 +971,8 @@ static void netdev_get_drvinfo(struct net_device *dev,
 {
 	struct uli526x_board_info *np = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(np->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(np->pdev), sizeof(info->bus_info));
 }
 
 static int netdev_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/dec/tulip/winbond-840.c b/drivers/net/ethernet/dec/tulip/winbond-840.c
index 1db19463fd46..37fba39c0056 100644
--- a/drivers/net/ethernet/dec/tulip/winbond-840.c
+++ b/drivers/net/ethernet/dec/tulip/winbond-840.c
@@ -1374,8 +1374,8 @@ static void netdev_get_drvinfo (struct net_device *dev, struct ethtool_drvinfo *
 {
 	struct netdev_private *np = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
 }
 
 static int netdev_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/dlink/dl2k.c b/drivers/net/ethernet/dlink/dl2k.c
index a301f7e6a440..2c67a857a42f 100644
--- a/drivers/net/ethernet/dlink/dl2k.c
+++ b/drivers/net/ethernet/dlink/dl2k.c
@@ -1235,8 +1235,8 @@ static void rio_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info
 {
 	struct netdev_private *np = netdev_priv(dev);
 
-	strlcpy(info->driver, "dl2k", sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(np->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, "dl2k", sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(np->pdev), sizeof(info->bus_info));
 }
 
 static int rio_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/dlink/sundance.c b/drivers/net/ethernet/dlink/sundance.c
index 8dd7bf9014ec..43def191f26f 100644
--- a/drivers/net/ethernet/dlink/sundance.c
+++ b/drivers/net/ethernet/dlink/sundance.c
@@ -1644,8 +1644,8 @@ static int check_if_running(struct net_device *dev)
 static void get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
 	struct netdev_private *np = netdev_priv(dev);
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
 }
 
 static int get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/dnet.c b/drivers/net/ethernet/dnet.c
index 92462ed87bc4..99e6f76f6cc0 100644
--- a/drivers/net/ethernet/dnet.c
+++ b/drivers/net/ethernet/dnet.c
@@ -725,8 +725,8 @@ static struct net_device_stats *dnet_get_stats(struct net_device *dev)
 static void dnet_get_drvinfo(struct net_device *dev,
 			     struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, "0", sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, "0", sizeof(info->bus_info));
 }
 
 static const struct ethtool_ops dnet_ethtool_ops = {
diff --git a/drivers/net/ethernet/emulex/benet/be_cmds.c b/drivers/net/ethernet/emulex/benet/be_cmds.c
index b4f5e57d0285..08ec84cd21c0 100644
--- a/drivers/net/ethernet/emulex/benet/be_cmds.c
+++ b/drivers/net/ethernet/emulex/benet/be_cmds.c
@@ -1878,9 +1878,9 @@ int be_cmd_get_fw_ver(struct be_adapter *adapter)
 	if (!status) {
 		struct be_cmd_resp_get_fw_version *resp = embedded_payload(wrb);
 
-		strlcpy(adapter->fw_ver, resp->firmware_version_string,
+		strscpy(adapter->fw_ver, resp->firmware_version_string,
 			sizeof(adapter->fw_ver));
-		strlcpy(adapter->fw_on_flash, resp->fw_on_flash_version_string,
+		strscpy(adapter->fw_on_flash, resp->fw_on_flash_version_string,
 			sizeof(adapter->fw_on_flash));
 	}
 err:
@@ -2373,7 +2373,7 @@ static int lancer_cmd_write_object(struct be_adapter *adapter,
 
 	be_dws_cpu_to_le(ctxt, sizeof(req->context));
 	req->write_offset = cpu_to_le32(data_offset);
-	strlcpy(req->object_name, obj_name, sizeof(req->object_name));
+	strscpy(req->object_name, obj_name, sizeof(req->object_name));
 	req->descriptor_count = cpu_to_le32(1);
 	req->buf_len = cpu_to_le32(data_size);
 	req->addr_low = cpu_to_le32((cmd->dma +
@@ -2442,9 +2442,9 @@ int be_cmd_query_sfp_info(struct be_adapter *adapter)
 	status = be_cmd_read_port_transceiver_data(adapter, TR_PAGE_A0,
 						   0, PAGE_DATA_LEN, page_data);
 	if (!status) {
-		strlcpy(adapter->phy.vendor_name, page_data +
+		strscpy(adapter->phy.vendor_name, page_data +
 			SFP_VENDOR_NAME_OFFSET, SFP_VENDOR_NAME_LEN - 1);
-		strlcpy(adapter->phy.vendor_pn,
+		strscpy(adapter->phy.vendor_pn,
 			page_data + SFP_VENDOR_PN_OFFSET,
 			SFP_VENDOR_NAME_LEN - 1);
 	}
@@ -2473,7 +2473,7 @@ static int lancer_cmd_delete_object(struct be_adapter *adapter,
 			       OPCODE_COMMON_DELETE_OBJECT,
 			       sizeof(*req), wrb, NULL);
 
-	strlcpy(req->object_name, obj_name, sizeof(req->object_name));
+	strscpy(req->object_name, obj_name, sizeof(req->object_name));
 
 	status = be_mcc_notify_wait(adapter);
 err:
diff --git a/drivers/net/ethernet/emulex/benet/be_ethtool.c b/drivers/net/ethernet/emulex/benet/be_ethtool.c
index bd0df189d871..77edc3d9b505 100644
--- a/drivers/net/ethernet/emulex/benet/be_ethtool.c
+++ b/drivers/net/ethernet/emulex/benet/be_ethtool.c
@@ -220,15 +220,15 @@ static void be_get_drvinfo(struct net_device *netdev,
 {
 	struct be_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
 	if (!memcmp(adapter->fw_ver, adapter->fw_on_flash, FW_VER_LEN))
-		strlcpy(drvinfo->fw_version, adapter->fw_ver,
+		strscpy(drvinfo->fw_version, adapter->fw_ver,
 			sizeof(drvinfo->fw_version));
 	else
 		snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 			 "%s [%s]", adapter->fw_ver, adapter->fw_on_flash);
 
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index c03663785a8d..9277d5fb5052 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1063,8 +1063,8 @@ static int ftgmac100_mdiobus_write(struct mii_bus *bus, int phy_addr,
 static void ftgmac100_get_drvinfo(struct net_device *netdev,
 				  struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, dev_name(&netdev->dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, dev_name(&netdev->dev), sizeof(info->bus_info));
 }
 
 static void
diff --git a/drivers/net/ethernet/faraday/ftmac100.c b/drivers/net/ethernet/faraday/ftmac100.c
index 8a341e2d5833..598cdbb280de 100644
--- a/drivers/net/ethernet/faraday/ftmac100.c
+++ b/drivers/net/ethernet/faraday/ftmac100.c
@@ -807,8 +807,8 @@ static void ftmac100_mdio_write(struct net_device *netdev, int phy_id, int reg,
 static void ftmac100_get_drvinfo(struct net_device *netdev,
 				 struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, dev_name(&netdev->dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, dev_name(&netdev->dev), sizeof(info->bus_info));
 }
 
 static int ftmac100_get_link_ksettings(struct net_device *netdev,
diff --git a/drivers/net/ethernet/fealnx.c b/drivers/net/ethernet/fealnx.c
index b3939a5f7b03..ed18450fd2cc 100644
--- a/drivers/net/ethernet/fealnx.c
+++ b/drivers/net/ethernet/fealnx.c
@@ -1809,8 +1809,8 @@ static void netdev_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *i
 {
 	struct netdev_private *np = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
 }
 
 static int netdev_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
index 73f07881ce2d..769e936a263c 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
@@ -80,9 +80,9 @@ static int dpaa_set_link_ksettings(struct net_device *net_dev,
 static void dpaa_get_drvinfo(struct net_device *net_dev,
 			     struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, KBUILD_MODNAME,
+	strscpy(drvinfo->driver, KBUILD_MODNAME,
 		sizeof(drvinfo->driver));
-	strlcpy(drvinfo->bus_info, dev_name(net_dev->dev.parent->parent),
+	strscpy(drvinfo->bus_info, dev_name(net_dev->dev.parent->parent),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
index c9bee9a0c9b2..49ff85633783 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
@@ -549,7 +549,7 @@ void dpaa2_mac_get_strings(u8 *data)
 	int i;
 
 	for (i = 0; i < DPAA2_MAC_NUM_STATS; i++) {
-		strlcpy(p, dpaa2_mac_ethtool_stats[i], ETH_GSTRING_LEN);
+		strscpy(p, dpaa2_mac_ethtool_stats[i], ETH_GSTRING_LEN);
 		p += ETH_GSTRING_LEN;
 	}
 }
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
index ff872e40ce85..dec721e82938 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
@@ -236,7 +236,7 @@ static void enetc_get_strings(struct net_device *ndev, u32 stringset, u8 *data)
 	switch (stringset) {
 	case ETH_SS_STATS:
 		for (i = 0; i < ARRAY_SIZE(enetc_si_counters); i++) {
-			strlcpy(p, enetc_si_counters[i].name, ETH_GSTRING_LEN);
+			strscpy(p, enetc_si_counters[i].name, ETH_GSTRING_LEN);
 			p += ETH_GSTRING_LEN;
 		}
 		for (i = 0; i < priv->num_tx_rings; i++) {
@@ -258,7 +258,7 @@ static void enetc_get_strings(struct net_device *ndev, u32 stringset, u8 *data)
 			break;
 
 		for (i = 0; i < ARRAY_SIZE(enetc_port_counters); i++) {
-			strlcpy(p, enetc_port_counters[i].name,
+			strscpy(p, enetc_port_counters[i].name,
 				ETH_GSTRING_LEN);
 			p += ETH_GSTRING_LEN;
 		}
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index e8e2aa1e7f01..6b004267e00a 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -2104,13 +2104,13 @@ static int fec_enet_mii_probe(struct net_device *ndev)
 				continue;
 			if (dev_id--)
 				continue;
-			strlcpy(mdio_bus_id, fep->mii_bus->id, MII_BUS_ID_SIZE);
+			strscpy(mdio_bus_id, fep->mii_bus->id, MII_BUS_ID_SIZE);
 			break;
 		}
 
 		if (phy_id >= PHY_MAX_ADDR) {
 			netdev_info(ndev, "no PHY, assuming direct connection to switch\n");
-			strlcpy(mdio_bus_id, "fixed-0", MII_BUS_ID_SIZE);
+			strscpy(mdio_bus_id, "fixed-0", MII_BUS_ID_SIZE);
 			phy_id = 0;
 		}
 
@@ -2294,9 +2294,9 @@ static void fec_enet_get_drvinfo(struct net_device *ndev,
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
 
-	strlcpy(info->driver, fep->pdev->dev.driver->name,
+	strscpy(info->driver, fep->pdev->dev.driver->name,
 		sizeof(info->driver));
-	strlcpy(info->bus_info, dev_name(&ndev->dev), sizeof(info->bus_info));
+	strscpy(info->bus_info, dev_name(&ndev->dev), sizeof(info->bus_info));
 }
 
 static int fec_enet_get_regs_len(struct net_device *ndev)
diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 7d49c28215f3..36eab78737ea 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -582,7 +582,7 @@ void fec_ptp_init(struct platform_device *pdev, int irq_idx)
 	int ret;
 
 	fep->ptp_caps.owner = THIS_MODULE;
-	strlcpy(fep->ptp_caps.name, "fec ptp", sizeof(fep->ptp_caps.name));
+	strscpy(fep->ptp_caps.name, "fec ptp", sizeof(fep->ptp_caps.name));
 
 	fep->ptp_caps.max_adj = 250000000;
 	fep->ptp_caps.n_alarm = 0;
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index b3dae17e067e..5b760436bb01 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -791,7 +791,7 @@ static int fs_enet_close(struct net_device *dev)
 static void fs_get_drvinfo(struct net_device *dev,
 			    struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
 }
 
 static int fs_get_regs_len(struct net_device *dev)
diff --git a/drivers/net/ethernet/freescale/gianfar_ethtool.c b/drivers/net/ethernet/freescale/gianfar_ethtool.c
index 81fb68730138..b2b0d3c26fcc 100644
--- a/drivers/net/ethernet/freescale/gianfar_ethtool.c
+++ b/drivers/net/ethernet/freescale/gianfar_ethtool.c
@@ -163,7 +163,7 @@ static int gfar_sset_count(struct net_device *dev, int sset)
 static void gfar_gdrvinfo(struct net_device *dev,
 			  struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
 }
 
 /* Return the length of the register structure */
diff --git a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
index 69b2b98b1525..601beb93d3b3 100644
--- a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
+++ b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
@@ -337,8 +337,8 @@ static void
 uec_get_drvinfo(struct net_device *netdev,
                        struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->bus_info, "QUICC ENGINE", sizeof(drvinfo->bus_info));
+	strscpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->bus_info, "QUICC ENGINE", sizeof(drvinfo->bus_info));
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/net/ethernet/fujitsu/fmvj18x_cs.c b/drivers/net/ethernet/fujitsu/fmvj18x_cs.c
index b0d733e9a7c6..4859493471db 100644
--- a/drivers/net/ethernet/fujitsu/fmvj18x_cs.c
+++ b/drivers/net/ethernet/fujitsu/fmvj18x_cs.c
@@ -1046,8 +1046,8 @@ static void fjn_rx(struct net_device *dev)
 static void netdev_get_drvinfo(struct net_device *dev,
 			       struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
 	snprintf(info->bus_info, sizeof(info->bus_info),
 		"PCMCIA 0x%lx", dev->base_addr);
 }
diff --git a/drivers/net/ethernet/hisilicon/hip04_eth.c b/drivers/net/ethernet/hisilicon/hip04_eth.c
index c84ef494bd60..ddeceb26fb79 100644
--- a/drivers/net/ethernet/hisilicon/hip04_eth.c
+++ b/drivers/net/ethernet/hisilicon/hip04_eth.c
@@ -830,8 +830,8 @@ static int hip04_set_coalesce(struct net_device *netdev,
 static void hip04_get_drvinfo(struct net_device *netdev,
 			      struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, DRV_VERSION, sizeof(drvinfo->version));
+	strscpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, DRV_VERSION, sizeof(drvinfo->version));
 }
 
 static const struct ethtool_ops hip04_ethtool_ops = {
diff --git a/drivers/net/ethernet/ibm/ehea/ehea_ethtool.c b/drivers/net/ethernet/ibm/ehea/ehea_ethtool.c
index 6cb86032ce46..1db5b6790a41 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea_ethtool.c
+++ b/drivers/net/ethernet/ibm/ehea/ehea_ethtool.c
@@ -159,8 +159,8 @@ static int ehea_nway_reset(struct net_device *dev)
 static void ehea_get_drvinfo(struct net_device *dev,
 			       struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
 }
 
 static u32 ehea_get_msglevel(struct net_device *dev)
diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index fbea9f7efe8c..0a4d04a8825d 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -2284,8 +2284,8 @@ static void emac_ethtool_get_drvinfo(struct net_device *ndev,
 {
 	struct emac_instance *dev = netdev_priv(ndev);
 
-	strlcpy(info->driver, "ibm_emac", sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->driver, "ibm_emac", sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
 	snprintf(info->bus_info, sizeof(info->bus_info), "PPC 4xx EMAC-%d %pOF",
 		 dev->cell_index, dev->ofdev->dev.of_node);
 }
diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 5c6a04d29f5b..ee4548e08446 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -727,8 +727,8 @@ static void ibmveth_init_link_settings(struct net_device *dev)
 static void netdev_get_drvinfo(struct net_device *dev,
 			       struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, ibmveth_driver_name, sizeof(info->driver));
-	strlcpy(info->version, ibmveth_driver_version, sizeof(info->version));
+	strscpy(info->driver, ibmveth_driver_name, sizeof(info->driver));
+	strscpy(info->version, ibmveth_driver_version, sizeof(info->version));
 }
 
 static netdev_features_t ibmveth_fix_features(struct net_device *dev,
diff --git a/drivers/net/ethernet/intel/e100.c b/drivers/net/ethernet/intel/e100.c
index 11a884aa5082..560d1d442232 100644
--- a/drivers/net/ethernet/intel/e100.c
+++ b/drivers/net/ethernet/intel/e100.c
@@ -2431,8 +2431,8 @@ static void e100_get_drvinfo(struct net_device *netdev,
 	struct ethtool_drvinfo *info)
 {
 	struct nic *nic = netdev_priv(netdev);
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(nic->pdev),
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(nic->pdev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/intel/e1000/e1000_ethtool.c b/drivers/net/ethernet/intel/e1000/e1000_ethtool.c
index 32803b0cf1e8..d06d29c6c037 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_ethtool.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_ethtool.c
@@ -531,10 +531,10 @@ static void e1000_get_drvinfo(struct net_device *netdev,
 {
 	struct e1000_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver,  e1000_driver_name,
+	strscpy(drvinfo->driver,  e1000_driver_name,
 		sizeof(drvinfo->driver));
 
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/intel/e1000e/ethtool.c b/drivers/net/ethernet/intel/e1000e/ethtool.c
index b80ae9a82224..51a5afe9df2f 100644
--- a/drivers/net/ethernet/intel/e1000e/ethtool.c
+++ b/drivers/net/ethernet/intel/e1000e/ethtool.c
@@ -639,7 +639,7 @@ static void e1000_get_drvinfo(struct net_device *netdev,
 {
 	struct e1000_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver, e1000e_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->driver, e1000e_driver_name, sizeof(drvinfo->driver));
 
 	/* EEPROM image version # is reported as firmware version # for
 	 * PCI-E controllers
@@ -650,7 +650,7 @@ static void e1000_get_drvinfo(struct net_device *netdev,
 		 (adapter->eeprom_vers & 0x0FF0) >> 4,
 		 (adapter->eeprom_vers & 0x000F));
 
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 321f2a95ae3a..56984803c957 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -7267,7 +7267,7 @@ static void e1000_print_device_info(struct e1000_adapter *adapter)
 	ret_val = e1000_read_pba_string_generic(hw, pba_str,
 						E1000_PBANUM_LENGTH);
 	if (ret_val)
-		strlcpy((char *)pba_str, "Unknown", sizeof(pba_str));
+		strscpy((char *)pba_str, "Unknown", sizeof(pba_str));
 	e_info("MAC: %d, PHY: %d, PBA No: %s\n",
 	       hw->mac.type, hw->phy.type, pba_str);
 }
@@ -7480,7 +7480,7 @@ static int e1000_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	e1000e_set_ethtool_ops(netdev);
 	netdev->watchdog_timeo = 5 * HZ;
 	netif_napi_add(netdev, &adapter->napi, e1000e_poll, 64);
-	strlcpy(netdev->name, pci_name(pdev), sizeof(netdev->name));
+	strscpy(netdev->name, pci_name(pdev), sizeof(netdev->name));
 
 	netdev->mem_start = mmio_start;
 	netdev->mem_end = mmio_start + mmio_len;
@@ -7676,7 +7676,7 @@ static int e1000_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (hw->mac.type >= e1000_pch_cnp)
 		adapter->flags2 |= FLAG2_ENABLE_S0IX_FLOWS;
 
-	strlcpy(netdev->name, "eth%d", sizeof(netdev->name));
+	strscpy(netdev->name, "eth%d", sizeof(netdev->name));
 	err = register_netdev(netdev);
 	if (err)
 		goto err_register;
diff --git a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
index 156e92c43780..556df06359eb 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
@@ -2001,10 +2001,10 @@ static void i40e_get_drvinfo(struct net_device *netdev,
 	struct i40e_vsi *vsi = np->vsi;
 	struct i40e_pf *pf = vsi->back;
 
-	strlcpy(drvinfo->driver, i40e_driver_name, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->fw_version, i40e_nvm_version_str(&pf->hw),
+	strscpy(drvinfo->driver, i40e_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->fw_version, i40e_nvm_version_str(&pf->hw),
 		sizeof(drvinfo->fw_version));
-	strlcpy(drvinfo->bus_info, pci_name(pf->pdev),
+	strscpy(drvinfo->bus_info, pci_name(pf->pdev),
 		sizeof(drvinfo->bus_info));
 	drvinfo->n_priv_flags = I40E_PRIV_FLAGS_STR_LEN;
 	if (pf->hw.pf_id == 0)
diff --git a/drivers/net/ethernet/intel/i40e/i40e_main.c b/drivers/net/ethernet/intel/i40e/i40e_main.c
index b36bf9c3e1e4..aba29cfc6963 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_main.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
@@ -10699,7 +10699,7 @@ static void i40e_send_version(struct i40e_pf *pf)
 	dv.minor_version = 0xff;
 	dv.build_version = 0xff;
 	dv.subbuild_version = 0;
-	strlcpy(dv.driver_string, UTS_RELEASE, sizeof(dv.driver_string));
+	strscpy(dv.driver_string, UTS_RELEASE, sizeof(dv.driver_string));
 	i40e_aq_send_driver_version(&pf->hw, &dv, NULL);
 }
 
@@ -16047,23 +16047,23 @@ static int i40e_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 		switch (hw->bus.speed) {
 		case i40e_bus_speed_8000:
-			strlcpy(speed, "8.0", PCI_SPEED_SIZE); break;
+			strscpy(speed, "8.0", PCI_SPEED_SIZE); break;
 		case i40e_bus_speed_5000:
-			strlcpy(speed, "5.0", PCI_SPEED_SIZE); break;
+			strscpy(speed, "5.0", PCI_SPEED_SIZE); break;
 		case i40e_bus_speed_2500:
-			strlcpy(speed, "2.5", PCI_SPEED_SIZE); break;
+			strscpy(speed, "2.5", PCI_SPEED_SIZE); break;
 		default:
 			break;
 		}
 		switch (hw->bus.width) {
 		case i40e_bus_width_pcie_x8:
-			strlcpy(width, "8", PCI_WIDTH_SIZE); break;
+			strscpy(width, "8", PCI_WIDTH_SIZE); break;
 		case i40e_bus_width_pcie_x4:
-			strlcpy(width, "4", PCI_WIDTH_SIZE); break;
+			strscpy(width, "4", PCI_WIDTH_SIZE); break;
 		case i40e_bus_width_pcie_x2:
-			strlcpy(width, "2", PCI_WIDTH_SIZE); break;
+			strscpy(width, "2", PCI_WIDTH_SIZE); break;
 		case i40e_bus_width_pcie_x1:
-			strlcpy(width, "1", PCI_WIDTH_SIZE); break;
+			strscpy(width, "1", PCI_WIDTH_SIZE); break;
 		default:
 			break;
 		}
diff --git a/drivers/net/ethernet/intel/i40e/i40e_ptp.c b/drivers/net/ethernet/intel/i40e/i40e_ptp.c
index 2d3533f38d7b..ffea0c9c82f1 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_ptp.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_ptp.c
@@ -1390,7 +1390,7 @@ static long i40e_ptp_create_clock(struct i40e_pf *pf)
 	if (!IS_ERR_OR_NULL(pf->ptp_clock))
 		return 0;
 
-	strlcpy(pf->ptp_caps.name, i40e_driver_name,
+	strscpy(pf->ptp_caps.name, i40e_driver_name,
 		sizeof(pf->ptp_caps.name) - 1);
 	pf->ptp_caps.owner = THIS_MODULE;
 	pf->ptp_caps.max_adj = 999999999;
diff --git a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
index e535d4c3da49..a056e1545615 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_ethtool.c
@@ -581,9 +581,9 @@ static void iavf_get_drvinfo(struct net_device *netdev,
 {
 	struct iavf_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver, iavf_driver_name, 32);
-	strlcpy(drvinfo->fw_version, "N/A", 4);
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev), 32);
+	strscpy(drvinfo->driver, iavf_driver_name, 32);
+	strscpy(drvinfo->fw_version, "N/A", 4);
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev), 32);
 	drvinfo->n_priv_flags = IAVF_PRIV_FLAGS_STR_LEN;
 }
 
diff --git a/drivers/net/ethernet/intel/igb/igb_ethtool.c b/drivers/net/ethernet/intel/igb/igb_ethtool.c
index c14fc871dd41..e5f3e7680dc6 100644
--- a/drivers/net/ethernet/intel/igb/igb_ethtool.c
+++ b/drivers/net/ethernet/intel/igb/igb_ethtool.c
@@ -850,14 +850,14 @@ static void igb_get_drvinfo(struct net_device *netdev,
 {
 	struct igb_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver,  igb_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->driver,  igb_driver_name, sizeof(drvinfo->driver));
 
 	/* EEPROM image version # is reported as firmware version # for
 	 * 82575 controllers
 	 */
-	strlcpy(drvinfo->fw_version, adapter->fw_version,
+	strscpy(drvinfo->fw_version, adapter->fw_version,
 		sizeof(drvinfo->fw_version));
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 
 	drvinfo->n_priv_flags = IGB_PRIV_FLAGS_STR_LEN;
diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
index d8b836a85cc3..f2dc05824ce8 100644
--- a/drivers/net/ethernet/intel/igb/igb_main.c
+++ b/drivers/net/ethernet/intel/igb/igb_main.c
@@ -3138,7 +3138,7 @@ static s32 igb_init_i2c(struct igb_adapter *adapter)
 	adapter->i2c_algo.data = adapter;
 	adapter->i2c_adap.algo_data = &adapter->i2c_algo;
 	adapter->i2c_adap.dev.parent = &adapter->pdev->dev;
-	strlcpy(adapter->i2c_adap.name, "igb BB",
+	strscpy(adapter->i2c_adap.name, "igb BB",
 		sizeof(adapter->i2c_adap.name));
 	status = i2c_bit_add_bus(&adapter->i2c_adap);
 	return status;
diff --git a/drivers/net/ethernet/intel/igbvf/ethtool.c b/drivers/net/ethernet/intel/igbvf/ethtool.c
index 9d4322b74163..83b97989a6bd 100644
--- a/drivers/net/ethernet/intel/igbvf/ethtool.c
+++ b/drivers/net/ethernet/intel/igbvf/ethtool.c
@@ -169,8 +169,8 @@ static void igbvf_get_drvinfo(struct net_device *netdev,
 {
 	struct igbvf_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver,  igbvf_driver_name, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->driver,  igbvf_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/intel/ixgb/ixgb_ethtool.c b/drivers/net/ethernet/intel/ixgb/ixgb_ethtool.c
index 46efcfab7234..efa980514944 100644
--- a/drivers/net/ethernet/intel/ixgb/ixgb_ethtool.c
+++ b/drivers/net/ethernet/intel/ixgb/ixgb_ethtool.c
@@ -456,9 +456,9 @@ ixgb_get_drvinfo(struct net_device *netdev,
 {
 	struct ixgb_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver,  ixgb_driver_name,
+	strscpy(drvinfo->driver,  ixgb_driver_name,
 		sizeof(drvinfo->driver));
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
index 04f453eabef6..daa70149ac77 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
@@ -1106,12 +1106,12 @@ static void ixgbe_get_drvinfo(struct net_device *netdev,
 {
 	struct ixgbe_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver, ixgbe_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->driver, ixgbe_driver_name, sizeof(drvinfo->driver));
 
-	strlcpy(drvinfo->fw_version, adapter->eeprom_id,
+	strscpy(drvinfo->fw_version, adapter->eeprom_id,
 		sizeof(drvinfo->fw_version));
 
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 
 	drvinfo->n_priv_flags = IXGBE_PRIV_FLAGS_STR_LEN;
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c
index 0fcd82036d4e..7311bd545acf 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c
@@ -1004,7 +1004,7 @@ int ixgbe_fcoe_get_hbainfo(struct net_device *netdev,
 		 ixgbe_driver_name,
 		 UTS_RELEASE);
 	/* Firmware Version */
-	strlcpy(info->firmware_version, adapter->eeprom_id,
+	strscpy(info->firmware_version, adapter->eeprom_id,
 		sizeof(info->firmware_version));
 
 	/* Model */
diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
index d1e430b8c8aa..298cfbfcb7b6 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
@@ -10849,7 +10849,7 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	netdev->netdev_ops = &ixgbe_netdev_ops;
 	ixgbe_set_ethtool_ops(netdev);
 	netdev->watchdog_timeo = 5 * HZ;
-	strlcpy(netdev->name, pci_name(pdev), sizeof(netdev->name));
+	strscpy(netdev->name, pci_name(pdev), sizeof(netdev->name));
 
 	/* Setup hw api */
 	hw->mac.ops   = *ii->mac_ops;
@@ -11140,7 +11140,7 @@ static int ixgbe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	err = ixgbe_read_pba_string_generic(hw, part_str, sizeof(part_str));
 	if (err)
-		strlcpy(part_str, "Unknown", sizeof(part_str));
+		strscpy(part_str, "Unknown", sizeof(part_str));
 	if (ixgbe_is_sfp(hw) && hw->phy.sfp_type != ixgbe_sfp_type_not_present)
 		e_dev_info("MAC: %d, PHY: %d, SFP+: %d, PBA No: %s\n",
 			   hw->mac.type, hw->phy.type, hw->phy.sfp_type,
diff --git a/drivers/net/ethernet/intel/ixgbevf/ethtool.c b/drivers/net/ethernet/intel/ixgbevf/ethtool.c
index fed46872af2b..ccfa6b91aac6 100644
--- a/drivers/net/ethernet/intel/ixgbevf/ethtool.c
+++ b/drivers/net/ethernet/intel/ixgbevf/ethtool.c
@@ -213,8 +213,8 @@ static void ixgbevf_get_drvinfo(struct net_device *netdev,
 {
 	struct ixgbevf_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver, ixgbevf_driver_name, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->driver, ixgbevf_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 
 	drvinfo->n_priv_flags = IXGBEVF_PRIV_FLAGS_STR_LEN;
diff --git a/drivers/net/ethernet/jme.c b/drivers/net/ethernet/jme.c
index f43d6616bc0d..b56594407965 100644
--- a/drivers/net/ethernet/jme.c
+++ b/drivers/net/ethernet/jme.c
@@ -2332,9 +2332,9 @@ jme_get_drvinfo(struct net_device *netdev,
 {
 	struct jme_adapter *jme = netdev_priv(netdev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(jme->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(jme->pdev), sizeof(info->bus_info));
 }
 
 static int
diff --git a/drivers/net/ethernet/korina.c b/drivers/net/ethernet/korina.c
index df9a8eefa007..90e458de9aa2 100644
--- a/drivers/net/ethernet/korina.c
+++ b/drivers/net/ethernet/korina.c
@@ -938,9 +938,9 @@ static void netdev_get_drvinfo(struct net_device *dev,
 {
 	struct korina_private *lp = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, lp->dev->name, sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, lp->dev->name, sizeof(info->bus_info));
 }
 
 static int netdev_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index b6be0552a6c1..8b9abe622489 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -1603,12 +1603,12 @@ mv643xx_eth_set_link_ksettings(struct net_device *dev,
 static void mv643xx_eth_get_drvinfo(struct net_device *dev,
 				    struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, mv643xx_eth_driver_name,
+	strscpy(drvinfo->driver, mv643xx_eth_driver_name,
 		sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, mv643xx_eth_driver_version,
+	strscpy(drvinfo->version, mv643xx_eth_driver_version,
 		sizeof(drvinfo->version));
-	strlcpy(drvinfo->fw_version, "N/A", sizeof(drvinfo->fw_version));
-	strlcpy(drvinfo->bus_info, "platform", sizeof(drvinfo->bus_info));
+	strscpy(drvinfo->fw_version, "N/A", sizeof(drvinfo->fw_version));
+	strscpy(drvinfo->bus_info, "platform", sizeof(drvinfo->bus_info));
 }
 
 static int mv643xx_eth_get_coalesce(struct net_device *dev,
diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 0caa2df87c04..b500fe1dfa81 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -4656,11 +4656,11 @@ mvneta_ethtool_get_coalesce(struct net_device *dev,
 static void mvneta_ethtool_get_drvinfo(struct net_device *dev,
 				    struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, MVNETA_DRIVER_NAME,
+	strscpy(drvinfo->driver, MVNETA_DRIVER_NAME,
 		sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, MVNETA_DRIVER_VERSION,
+	strscpy(drvinfo->version, MVNETA_DRIVER_VERSION,
 		sizeof(drvinfo->version));
-	strlcpy(drvinfo->bus_info, dev_name(&dev->dev),
+	strscpy(drvinfo->bus_info, dev_name(&dev->dev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index b84128b549b4..38e5b4be6a4d 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -5425,11 +5425,11 @@ mvpp2_ethtool_get_coalesce(struct net_device *dev,
 static void mvpp2_ethtool_get_drvinfo(struct net_device *dev,
 				      struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, MVPP2_DRIVER_NAME,
+	strscpy(drvinfo->driver, MVPP2_DRIVER_NAME,
 		sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, MVPP2_DRIVER_VERSION,
+	strscpy(drvinfo->version, MVPP2_DRIVER_VERSION,
 		sizeof(drvinfo->version));
-	strlcpy(drvinfo->bus_info, dev_name(&dev->dev),
+	strscpy(drvinfo->bus_info, dev_name(&dev->dev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
index 3f60a80e34c8..5bd16e95370b 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
@@ -76,8 +76,8 @@ static void otx2_get_drvinfo(struct net_device *netdev,
 {
 	struct otx2_nic *pfvf = netdev_priv(netdev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(pfvf->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(pfvf->pdev), sizeof(info->bus_info));
 }
 
 static void otx2_get_qset_strings(struct otx2_nic *pfvf, u8 **data, int qset)
@@ -1313,8 +1313,8 @@ static void otx2vf_get_drvinfo(struct net_device *netdev,
 {
 	struct otx2_nic *vf = netdev_priv(netdev);
 
-	strlcpy(info->driver, DRV_VF_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(vf->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_VF_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(vf->pdev), sizeof(info->bus_info));
 }
 
 static void otx2vf_get_strings(struct net_device *netdev, u32 sset, u8 *data)
diff --git a/drivers/net/ethernet/marvell/prestera/prestera_ethtool.c b/drivers/net/ethernet/marvell/prestera/prestera_ethtool.c
index 1da7ff889417..2f52daba58e6 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_ethtool.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_ethtool.c
@@ -300,8 +300,8 @@ static void prestera_ethtool_get_drvinfo(struct net_device *dev,
 	struct prestera_port *port = netdev_priv(dev);
 	struct prestera_switch *sw = port->sw;
 
-	strlcpy(drvinfo->driver, driver_kind, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->bus_info, dev_name(prestera_dev(sw)),
+	strscpy(drvinfo->driver, driver_kind, sizeof(drvinfo->driver));
+	strscpy(drvinfo->bus_info, dev_name(prestera_dev(sw)),
 		sizeof(drvinfo->bus_info));
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 		 "%d.%d.%d",
diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
index 349b8a94e939..cf456d62677f 100644
--- a/drivers/net/ethernet/marvell/pxa168_eth.c
+++ b/drivers/net/ethernet/marvell/pxa168_eth.c
@@ -1354,10 +1354,10 @@ static void pxa168_eth_netpoll(struct net_device *dev)
 static void pxa168_get_drvinfo(struct net_device *dev,
 			       struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRIVER_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRIVER_VERSION, sizeof(info->version));
-	strlcpy(info->fw_version, "N/A", sizeof(info->fw_version));
-	strlcpy(info->bus_info, "N/A", sizeof(info->bus_info));
+	strscpy(info->driver, DRIVER_NAME, sizeof(info->driver));
+	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->fw_version, "N/A", sizeof(info->fw_version));
+	strscpy(info->bus_info, "N/A", sizeof(info->bus_info));
 }
 
 static const struct ethtool_ops pxa168_ethtool_ops = {
diff --git a/drivers/net/ethernet/marvell/skge.c b/drivers/net/ethernet/marvell/skge.c
index c1e985416c0e..bcc4aa59d10a 100644
--- a/drivers/net/ethernet/marvell/skge.c
+++ b/drivers/net/ethernet/marvell/skge.c
@@ -394,9 +394,9 @@ static void skge_get_drvinfo(struct net_device *dev,
 {
 	struct skge_port *skge = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(skge->hw->pdev),
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(skge->hw->pdev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/marvell/sky2.c b/drivers/net/ethernet/marvell/sky2.c
index bbea5458000b..e19acfcd84d4 100644
--- a/drivers/net/ethernet/marvell/sky2.c
+++ b/drivers/net/ethernet/marvell/sky2.c
@@ -3687,9 +3687,9 @@ static void sky2_get_drvinfo(struct net_device *dev,
 {
 	struct sky2_port *sky2 = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(sky2->hw->pdev),
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(sky2->hw->pdev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index d9426b01f462..4c75fa04bd11 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3554,8 +3554,8 @@ static void mtk_get_drvinfo(struct net_device *dev,
 {
 	struct mtk_mac *mac = netdev_priv(dev);
 
-	strlcpy(info->driver, mac->hw->dev->driver->name, sizeof(info->driver));
-	strlcpy(info->bus_info, dev_name(mac->hw->dev), sizeof(info->bus_info));
+	strscpy(info->driver, mac->hw->dev->driver->name, sizeof(info->driver));
+	strscpy(info->bus_info, dev_name(mac->hw->dev), sizeof(info->bus_info));
 	info->n_stats = ARRAY_SIZE(mtk_ethtool_stats);
 }
 
diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 3f0e5e64de50..f8db176c71ae 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1255,7 +1255,7 @@ static const struct net_device_ops mtk_star_netdev_ops = {
 static void mtk_star_get_drvinfo(struct net_device *dev,
 				 struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, MTK_STAR_DRVNAME, sizeof(info->driver));
+	strscpy(info->driver, MTK_STAR_DRVNAME, sizeof(info->driver));
 }
 
 /* TODO Add ethtool stats. */
diff --git a/drivers/net/ethernet/mellanox/mlx4/en_ethtool.c b/drivers/net/ethernet/mellanox/mlx4/en_ethtool.c
index 6400a827173c..7d45f1d55f79 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_ethtool.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_ethtool.c
@@ -89,15 +89,15 @@ mlx4_en_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *drvinfo)
 	struct mlx4_en_priv *priv = netdev_priv(dev);
 	struct mlx4_en_dev *mdev = priv->mdev;
 
-	strlcpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, DRV_VERSION,
+	strscpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, DRV_VERSION,
 		sizeof(drvinfo->version));
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 		"%d.%d.%d",
 		(u16) (mdev->dev->caps.fw_ver >> 32),
 		(u16) ((mdev->dev->caps.fw_ver >> 16) & 0xffff),
 		(u16) (mdev->dev->caps.fw_ver & 0xffff));
-	strlcpy(drvinfo->bus_info, pci_name(mdev->dev->persist->pdev),
+	strscpy(drvinfo->bus_info, pci_name(mdev->dev->persist->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlx4/fw.c b/drivers/net/ethernet/mellanox/mlx4/fw.c
index dcb9eb1899ce..fe48d20d6118 100644
--- a/drivers/net/ethernet/mellanox/mlx4/fw.c
+++ b/drivers/net/ethernet/mellanox/mlx4/fw.c
@@ -1779,7 +1779,7 @@ static void get_board_id(void *vsd, char *board_id)
 
 	if (be16_to_cpup(vsd + VSD_OFFSET_SIG1) == VSD_SIGNATURE_TOPSPIN &&
 	    be16_to_cpup(vsd + VSD_OFFSET_SIG2) == VSD_SIGNATURE_TOPSPIN) {
-		strlcpy(board_id, vsd + VSD_OFFSET_TS_BOARD_ID, MLX4_BOARD_ID_LEN);
+		strscpy(board_id, vsd + VSD_OFFSET_TS_BOARD_ID, MLX4_BOARD_ID_LEN);
 	} else {
 		/*
 		 * The board ID is a string but the firmware byte
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c b/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
index b811207fe5ed..b6d038f8d65e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
@@ -44,12 +44,12 @@ void mlx5e_ethtool_get_drvinfo(struct mlx5e_priv *priv,
 {
 	struct mlx5_core_dev *mdev = priv->mdev;
 
-	strlcpy(drvinfo->driver, KBUILD_MODNAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->driver, KBUILD_MODNAME, sizeof(drvinfo->driver));
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 		 "%d.%d.%04d (%.16s)",
 		 fw_rev_maj(mdev), fw_rev_min(mdev), fw_rev_sub(mdev),
 		 mdev->board_id);
-	strlcpy(drvinfo->bus_info, dev_name(mdev->device),
+	strscpy(drvinfo->bus_info, dev_name(mdev->device),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rep.c b/drivers/net/ethernet/mellanox/mlx5/core/en_rep.c
index 4c1599de652c..dff36b6fc16e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_rep.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rep.c
@@ -69,7 +69,7 @@ static void mlx5e_rep_get_drvinfo(struct net_device *dev,
 	struct mlx5e_priv *priv = netdev_priv(dev);
 	struct mlx5_core_dev *mdev = priv->mdev;
 
-	strlcpy(drvinfo->driver, mlx5e_rep_driver_name,
+	strscpy(drvinfo->driver, mlx5e_rep_driver_name,
 		sizeof(drvinfo->driver));
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 		 "%d.%d.%04d (%.16s)",
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ethtool.c b/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ethtool.c
index ac3757beaea2..1cae066bddf8 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ethtool.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/ipoib/ethtool.c
@@ -39,7 +39,7 @@ static void mlx5i_get_drvinfo(struct net_device *dev,
 	struct mlx5e_priv *priv = mlx5i_epriv(dev);
 
 	mlx5e_ethtool_get_drvinfo(priv, drvinfo);
-	strlcpy(drvinfo->driver, KBUILD_MODNAME "[ib_ipoib]",
+	strscpy(drvinfo->driver, KBUILD_MODNAME "[ib_ipoib]",
 		sizeof(drvinfo->driver));
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlxsw/core.c b/drivers/net/ethernet/mellanox/mlxsw/core.c
index 75553eb2c7f2..7331635607f7 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/core.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/core.c
@@ -633,7 +633,7 @@ static void mlxsw_emad_process_string_tlv(const struct sk_buff *skb,
 		return;
 
 	string = mlxsw_emad_string_tlv_string_data(string_tlv);
-	strlcpy(trans->emad_err_string, string,
+	strscpy(trans->emad_err_string, string,
 		MLXSW_EMAD_STRING_TLV_STRING_LEN);
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlxsw/minimal.c b/drivers/net/ethernet/mellanox/mlxsw/minimal.c
index bb1cd4bae82e..e3c045a82ae2 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/minimal.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/minimal.c
@@ -94,14 +94,14 @@ static void mlxsw_m_module_get_drvinfo(struct net_device *dev,
 	struct mlxsw_m_port *mlxsw_m_port = netdev_priv(dev);
 	struct mlxsw_m *mlxsw_m = mlxsw_m_port->mlxsw_m;
 
-	strlcpy(drvinfo->driver, mlxsw_m->bus_info->device_kind,
+	strscpy(drvinfo->driver, mlxsw_m->bus_info->device_kind,
 		sizeof(drvinfo->driver));
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 		 "%d.%d.%d",
 		 mlxsw_m->bus_info->fw_rev.major,
 		 mlxsw_m->bus_info->fw_rev.minor,
 		 mlxsw_m->bus_info->fw_rev.subminor);
-	strlcpy(drvinfo->bus_info, mlxsw_m->bus_info->device_name,
+	strscpy(drvinfo->bus_info, mlxsw_m->bus_info->device_name,
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c
index 915dffb85a1c..dcd79d7e2af4 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c
@@ -14,16 +14,16 @@ static void mlxsw_sp_port_get_drvinfo(struct net_device *dev,
 	struct mlxsw_sp_port *mlxsw_sp_port = netdev_priv(dev);
 	struct mlxsw_sp *mlxsw_sp = mlxsw_sp_port->mlxsw_sp;
 
-	strlcpy(drvinfo->driver, mlxsw_sp->bus_info->device_kind,
+	strscpy(drvinfo->driver, mlxsw_sp->bus_info->device_kind,
 		sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, mlxsw_sp_driver_version,
+	strscpy(drvinfo->version, mlxsw_sp_driver_version,
 		sizeof(drvinfo->version));
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 		 "%d.%d.%d",
 		 mlxsw_sp->bus_info->fw_rev.major,
 		 mlxsw_sp->bus_info->fw_rev.minor,
 		 mlxsw_sp->bus_info->fw_rev.subminor);
-	strlcpy(drvinfo->bus_info, mlxsw_sp->bus_info->device_name,
+	strscpy(drvinfo->bus_info, mlxsw_sp->bus_info->device_name,
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/micrel/ks8851_common.c b/drivers/net/ethernet/micrel/ks8851_common.c
index 691206f19ea7..ec8457e61b45 100644
--- a/drivers/net/ethernet/micrel/ks8851_common.c
+++ b/drivers/net/ethernet/micrel/ks8851_common.c
@@ -703,9 +703,9 @@ static const struct net_device_ops ks8851_netdev_ops = {
 static void ks8851_get_drvinfo(struct net_device *dev,
 			       struct ethtool_drvinfo *di)
 {
-	strlcpy(di->driver, "KS8851", sizeof(di->driver));
-	strlcpy(di->version, "1.00", sizeof(di->version));
-	strlcpy(di->bus_info, dev_name(dev->dev.parent), sizeof(di->bus_info));
+	strscpy(di->driver, "KS8851", sizeof(di->driver));
+	strscpy(di->version, "1.00", sizeof(di->version));
+	strscpy(di->bus_info, dev_name(dev->dev.parent), sizeof(di->bus_info));
 }
 
 static u32 ks8851_get_msglevel(struct net_device *dev)
diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/micrel/ksz884x.c
index 2b3eb5ed8233..468520079c65 100644
--- a/drivers/net/ethernet/micrel/ksz884x.c
+++ b/drivers/net/ethernet/micrel/ksz884x.c
@@ -5998,9 +5998,9 @@ static void netdev_get_drvinfo(struct net_device *dev,
 	struct dev_priv *priv = netdev_priv(dev);
 	struct dev_info *hw_priv = priv->adapter;
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(hw_priv->pdev),
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(hw_priv->pdev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/microchip/enc28j60.c b/drivers/net/ethernet/microchip/enc28j60.c
index 559ad94a44d0..176efbeae127 100644
--- a/drivers/net/ethernet/microchip/enc28j60.c
+++ b/drivers/net/ethernet/microchip/enc28j60.c
@@ -1467,9 +1467,9 @@ static void enc28j60_restart_work_handler(struct work_struct *work)
 static void
 enc28j60_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info,
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info,
 		dev_name(dev->dev.parent), sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/microchip/encx24j600.c b/drivers/net/ethernet/microchip/encx24j600.c
index dc1840cb5b10..d7c8aa77ec75 100644
--- a/drivers/net/ethernet/microchip/encx24j600.c
+++ b/drivers/net/ethernet/microchip/encx24j600.c
@@ -925,9 +925,9 @@ static void encx24j600_get_regs(struct net_device *dev,
 static void encx24j600_get_drvinfo(struct net_device *dev,
 				   struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, dev_name(dev->dev.parent),
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, dev_name(dev->dev.parent),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/microchip/lan743x_ethtool.c b/drivers/net/ethernet/microchip/lan743x_ethtool.c
index b1c74e6cb012..c739d60ee17d 100644
--- a/drivers/net/ethernet/microchip/lan743x_ethtool.c
+++ b/drivers/net/ethernet/microchip/lan743x_ethtool.c
@@ -579,8 +579,8 @@ static void lan743x_ethtool_get_drvinfo(struct net_device *netdev,
 {
 	struct lan743x_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(info->driver, DRIVER_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info,
+	strscpy(info->driver, DRIVER_NAME, sizeof(info->driver));
+	strscpy(info->bus_info,
 		pci_name(adapter->pdev), sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
index 971dde8c3286..9063e2e22cd5 100644
--- a/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
+++ b/drivers/net/ethernet/myricom/myri10ge/myri10ge.c
@@ -1647,10 +1647,10 @@ myri10ge_get_drvinfo(struct net_device *netdev, struct ethtool_drvinfo *info)
 {
 	struct myri10ge_priv *mgp = netdev_priv(netdev);
 
-	strlcpy(info->driver, "myri10ge", sizeof(info->driver));
-	strlcpy(info->version, MYRI10GE_VERSION_STR, sizeof(info->version));
-	strlcpy(info->fw_version, mgp->fw_version, sizeof(info->fw_version));
-	strlcpy(info->bus_info, pci_name(mgp->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, "myri10ge", sizeof(info->driver));
+	strscpy(info->version, MYRI10GE_VERSION_STR, sizeof(info->version));
+	strscpy(info->fw_version, mgp->fw_version, sizeof(info->fw_version));
+	strscpy(info->bus_info, pci_name(mgp->pdev), sizeof(info->bus_info));
 }
 
 static int myri10ge_get_coalesce(struct net_device *netdev,
diff --git a/drivers/net/ethernet/natsemi/natsemi.c b/drivers/net/ethernet/natsemi/natsemi.c
index 9aae7f1eb5d2..518b664a6908 100644
--- a/drivers/net/ethernet/natsemi/natsemi.c
+++ b/drivers/net/ethernet/natsemi/natsemi.c
@@ -2564,9 +2564,9 @@ static void set_rx_mode(struct net_device *dev)
 static void get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
 	struct netdev_private *np = netdev_priv(dev);
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
 }
 
 static int get_regs_len(struct net_device *dev)
diff --git a/drivers/net/ethernet/natsemi/ns83820.c b/drivers/net/ethernet/natsemi/ns83820.c
index 49ea130c9067..998586872599 100644
--- a/drivers/net/ethernet/natsemi/ns83820.c
+++ b/drivers/net/ethernet/natsemi/ns83820.c
@@ -1351,9 +1351,9 @@ static int ns83820_set_link_ksettings(struct net_device *ndev,
 static void ns83820_get_drvinfo(struct net_device *ndev, struct ethtool_drvinfo *info)
 {
 	struct ns83820 *dev = PRIV(ndev);
-	strlcpy(info->driver, "ns83820", sizeof(info->driver));
-	strlcpy(info->version, VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(dev->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, "ns83820", sizeof(info->driver));
+	strscpy(info->version, VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(dev->pci_dev), sizeof(info->bus_info));
 }
 
 static u32 ns83820_get_link(struct net_device *ndev)
diff --git a/drivers/net/ethernet/neterion/s2io.c b/drivers/net/ethernet/neterion/s2io.c
index 30f955efa830..d8a77b0db50d 100644
--- a/drivers/net/ethernet/neterion/s2io.c
+++ b/drivers/net/ethernet/neterion/s2io.c
@@ -5348,9 +5348,9 @@ static void s2io_ethtool_gdrvinfo(struct net_device *dev,
 {
 	struct s2io_nic *sp = netdev_priv(dev);
 
-	strlcpy(info->driver, s2io_driver_name, sizeof(info->driver));
-	strlcpy(info->version, s2io_driver_version, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(sp->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, s2io_driver_name, sizeof(info->driver));
+	strscpy(info->version, s2io_driver_version, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(sp->pdev), sizeof(info->bus_info));
 }
 
 /**
diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c b/drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c
index eeb1455a4e5d..cfae6a30bada 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net_ethtool.c
@@ -205,7 +205,7 @@ nfp_get_drvinfo(struct nfp_app *app, struct pci_dev *pdev,
 {
 	char nsp_version[ETHTOOL_FWVERS_LEN] = {};
 
-	strlcpy(drvinfo->driver, dev_driver_string(&pdev->dev),
+	strscpy(drvinfo->driver, dev_driver_string(&pdev->dev),
 		sizeof(drvinfo->driver));
 	nfp_net_get_nspinfo(app, nsp_version);
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
@@ -222,7 +222,7 @@ nfp_net_get_drvinfo(struct net_device *netdev, struct ethtool_drvinfo *drvinfo)
 	snprintf(vnic_version, sizeof(vnic_version), "%d.%d.%d.%d",
 		 nn->fw_ver.extend, nn->fw_ver.class,
 		 nn->fw_ver.major, nn->fw_ver.minor);
-	strlcpy(drvinfo->bus_info, pci_name(nn->pdev),
+	strscpy(drvinfo->bus_info, pci_name(nn->pdev),
 		sizeof(drvinfo->bus_info));
 
 	nfp_get_drvinfo(nn->app, nn->pdev, vnic_version, drvinfo);
@@ -233,7 +233,7 @@ nfp_app_get_drvinfo(struct net_device *netdev, struct ethtool_drvinfo *drvinfo)
 {
 	struct nfp_app *app = nfp_app_from_netdev(netdev);
 
-	strlcpy(drvinfo->bus_info, pci_name(app->pdev),
+	strscpy(drvinfo->bus_info, pci_name(app->pdev),
 		sizeof(drvinfo->bus_info));
 	nfp_get_drvinfo(app, app->pdev, "*", drvinfo);
 }
diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index 4b3482ce90a1..cf2929fa525e 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -990,8 +990,8 @@ static const struct net_device_ops nixge_netdev_ops = {
 static void nixge_ethtools_get_drvinfo(struct net_device *ndev,
 				       struct ethtool_drvinfo *ed)
 {
-	strlcpy(ed->driver, "nixge", sizeof(ed->driver));
-	strlcpy(ed->bus_info, "platform", sizeof(ed->bus_info));
+	strscpy(ed->driver, "nixge", sizeof(ed->driver));
+	strscpy(ed->bus_info, "platform", sizeof(ed->bus_info));
 }
 
 static int
diff --git a/drivers/net/ethernet/nvidia/forcedeth.c b/drivers/net/ethernet/nvidia/forcedeth.c
index 5116badaf091..7c0675ca337b 100644
--- a/drivers/net/ethernet/nvidia/forcedeth.c
+++ b/drivers/net/ethernet/nvidia/forcedeth.c
@@ -4291,9 +4291,9 @@ static void nv_do_stats_poll(struct timer_list *t)
 static void nv_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
 	struct fe_priv *np = netdev_priv(dev);
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, FORCEDETH_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, FORCEDETH_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
 }
 
 static void nv_get_wol(struct net_device *dev, struct ethtool_wolinfo *wolinfo)
diff --git a/drivers/net/ethernet/nxp/lpc_eth.c b/drivers/net/ethernet/nxp/lpc_eth.c
index f606d75b33b4..1a4a272f4c5c 100644
--- a/drivers/net/ethernet/nxp/lpc_eth.c
+++ b/drivers/net/ethernet/nxp/lpc_eth.c
@@ -1184,9 +1184,9 @@ static int lpc_eth_open(struct net_device *ndev)
 static void lpc_eth_ethtool_getdrvinfo(struct net_device *ndev,
 	struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, MODNAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, dev_name(ndev->dev.parent),
+	strscpy(info->driver, MODNAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, dev_name(ndev->dev.parent),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_ethtool.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_ethtool.c
index 84cc79e928c8..541b8bcd3223 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_ethtool.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_ethtool.c
@@ -169,9 +169,9 @@ static void pch_gbe_get_drvinfo(struct net_device *netdev,
 {
 	struct pch_gbe_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver, KBUILD_MODNAME, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, pch_driver_version, sizeof(drvinfo->version));
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->driver, KBUILD_MODNAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, pch_driver_version, sizeof(drvinfo->version));
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/packetengines/hamachi.c b/drivers/net/ethernet/packetengines/hamachi.c
index 9c408328be0d..1cc001087193 100644
--- a/drivers/net/ethernet/packetengines/hamachi.c
+++ b/drivers/net/ethernet/packetengines/hamachi.c
@@ -1819,9 +1819,9 @@ static void hamachi_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *
 {
 	struct hamachi_private *np = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
 }
 
 static int hamachi_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/packetengines/yellowfin.c b/drivers/net/ethernet/packetengines/yellowfin.c
index 03650022d444..640ac01689fb 100644
--- a/drivers/net/ethernet/packetengines/yellowfin.c
+++ b/drivers/net/ethernet/packetengines/yellowfin.c
@@ -1340,9 +1340,9 @@ static void yellowfin_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo
 {
 	struct yellowfin_private *np = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
 }
 
 static const struct ethtool_ops ethtool_ops = {
diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_ethtool.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_ethtool.c
index 3c4a84ea6321..8c4cb910e09b 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_ethtool.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_ethtool.c
@@ -65,9 +65,9 @@ netxen_nic_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *drvinfo)
 	u32 fw_minor = 0;
 	u32 fw_build = 0;
 
-	strlcpy(drvinfo->driver, netxen_nic_driver_name,
+	strscpy(drvinfo->driver, netxen_nic_driver_name,
 		sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, NETXEN_NIC_LINUX_VERSIONID,
+	strscpy(drvinfo->version, NETXEN_NIC_LINUX_VERSIONID,
 		sizeof(drvinfo->version));
 	fw_major = NXRD32(adapter, NETXEN_FW_VERSION_MAJOR);
 	fw_minor = NXRD32(adapter, NETXEN_FW_VERSION_MINOR);
@@ -75,7 +75,7 @@ netxen_nic_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *drvinfo)
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 		"%d.%d.%d", fw_major, fw_minor, fw_build);
 
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/qlogic/qed/qed_int.c b/drivers/net/ethernet/qlogic/qed/qed_int.c
index d701ecd3ba00..2661c483c67e 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_int.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_int.c
@@ -1119,7 +1119,7 @@ static int qed_int_deassertion(struct qed_hwfn  *p_hwfn,
 						snprintf(bit_name, 30,
 							 p_aeu->bit_name, num);
 					else
-						strlcpy(bit_name,
+						strscpy(bit_name,
 							p_aeu->bit_name, 30);
 
 					/* We now need to pass bitmask in its
diff --git a/drivers/net/ethernet/qlogic/qede/qede_ethtool.c b/drivers/net/ethernet/qlogic/qede/qede_ethtool.c
index 97a7ab0826ed..8034d812d5a0 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_ethtool.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_ethtool.c
@@ -624,7 +624,7 @@ static void qede_get_drvinfo(struct net_device *ndev,
 	struct qede_dev *edev = netdev_priv(ndev);
 	char mbi[ETHTOOL_FWVERS_LEN];
 
-	strlcpy(info->driver, "qede", sizeof(info->driver));
+	strscpy(info->driver, "qede", sizeof(info->driver));
 
 	snprintf(storm, ETHTOOL_FWVERS_LEN, "%d.%d.%d.%d",
 		 edev->dev_info.common.fw_major,
@@ -661,7 +661,7 @@ static void qede_get_drvinfo(struct net_device *ndev,
 			 "mfw %s", mfw);
 	}
 
-	strlcpy(info->bus_info, pci_name(edev->pdev), sizeof(info->bus_info));
+	strscpy(info->bus_info, pci_name(edev->pdev), sizeof(info->bus_info));
 }
 
 static void qede_get_wol(struct net_device *ndev, struct ethtool_wolinfo *wol)
diff --git a/drivers/net/ethernet/qlogic/qede/qede_main.c b/drivers/net/ethernet/qlogic/qede/qede_main.c
index f56b679adb4b..3c1bfff29157 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_main.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_main.c
@@ -1214,7 +1214,7 @@ static int __qede_probe(struct pci_dev *pdev, u32 dp_module, u8 dp_level,
 	/* Start the Slowpath-process */
 	memset(&sp_params, 0, sizeof(sp_params));
 	sp_params.int_mode = QED_INT_MODE_MSIX;
-	strlcpy(sp_params.name, "qede LAN", QED_DRV_VER_STR_SIZE);
+	strscpy(sp_params.name, "qede LAN", QED_DRV_VER_STR_SIZE);
 	rc = qed_ops->common->slowpath_start(cdev, &sp_params);
 	if (rc) {
 		pr_notice("Cannot start slowpath\n");
diff --git a/drivers/net/ethernet/qlogic/qla3xxx.c b/drivers/net/ethernet/qlogic/qla3xxx.c
index 06f4d9a9e938..31e3ab149727 100644
--- a/drivers/net/ethernet/qlogic/qla3xxx.c
+++ b/drivers/net/ethernet/qlogic/qla3xxx.c
@@ -1736,10 +1736,10 @@ static void ql_get_drvinfo(struct net_device *ndev,
 			   struct ethtool_drvinfo *drvinfo)
 {
 	struct ql3_adapter *qdev = netdev_priv(ndev);
-	strlcpy(drvinfo->driver, ql3xxx_driver_name, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, ql3xxx_driver_version,
+	strscpy(drvinfo->driver, ql3xxx_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, ql3xxx_driver_version,
 		sizeof(drvinfo->version));
-	strlcpy(drvinfo->bus_info, pci_name(qdev->pdev),
+	strscpy(drvinfo->bus_info, pci_name(qdev->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c
index 54a2d653be63..1ee491f78c6b 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c
@@ -277,10 +277,10 @@ qlcnic_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *drvinfo)
 	snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
 		"%d.%d.%d", fw_major, fw_minor, fw_build);
 
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
-	strlcpy(drvinfo->driver, qlcnic_driver_name, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, QLCNIC_LINUX_VERSIONID,
+	strscpy(drvinfo->driver, qlcnic_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, QLCNIC_LINUX_VERSIONID,
 		sizeof(drvinfo->version));
 }
 
diff --git a/drivers/net/ethernet/qualcomm/qca_debug.c b/drivers/net/ethernet/qualcomm/qca_debug.c
index 792ce9a323cd..f62c39544e08 100644
--- a/drivers/net/ethernet/qualcomm/qca_debug.c
+++ b/drivers/net/ethernet/qualcomm/qca_debug.c
@@ -164,10 +164,10 @@ qcaspi_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *p)
 {
 	struct qcaspi *qca = netdev_priv(dev);
 
-	strlcpy(p->driver, QCASPI_DRV_NAME, sizeof(p->driver));
-	strlcpy(p->version, QCASPI_DRV_VERSION, sizeof(p->version));
-	strlcpy(p->fw_version, "QCA7000", sizeof(p->fw_version));
-	strlcpy(p->bus_info, dev_name(&qca->spi_dev->dev),
+	strscpy(p->driver, QCASPI_DRV_NAME, sizeof(p->driver));
+	strscpy(p->version, QCASPI_DRV_VERSION, sizeof(p->version));
+	strscpy(p->fw_version, "QCA7000", sizeof(p->fw_version));
+	strscpy(p->bus_info, dev_name(&qca->spi_dev->dev),
 		sizeof(p->bus_info));
 }
 
diff --git a/drivers/net/ethernet/rdc/r6040.c b/drivers/net/ethernet/rdc/r6040.c
index a6bf7d505178..1aac2c3e5e0d 100644
--- a/drivers/net/ethernet/rdc/r6040.c
+++ b/drivers/net/ethernet/rdc/r6040.c
@@ -939,9 +939,9 @@ static void netdev_get_drvinfo(struct net_device *dev,
 {
 	struct r6040_private *rp = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(rp->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(rp->pdev), sizeof(info->bus_info));
 }
 
 static const struct ethtool_ops netdev_ethtool_ops = {
diff --git a/drivers/net/ethernet/realtek/8139cp.c b/drivers/net/ethernet/realtek/8139cp.c
index e0feeec13da6..f5786d78ed23 100644
--- a/drivers/net/ethernet/realtek/8139cp.c
+++ b/drivers/net/ethernet/realtek/8139cp.c
@@ -1382,9 +1382,9 @@ static void cp_get_drvinfo (struct net_device *dev, struct ethtool_drvinfo *info
 {
 	struct cp_private *cp = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(cp->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(cp->pdev), sizeof(info->bus_info));
 }
 
 static void cp_get_ringparam(struct net_device *dev,
diff --git a/drivers/net/ethernet/realtek/8139too.c b/drivers/net/ethernet/realtek/8139too.c
index 15b40fd93cd2..ab424b5b4920 100644
--- a/drivers/net/ethernet/realtek/8139too.c
+++ b/drivers/net/ethernet/realtek/8139too.c
@@ -2380,9 +2380,9 @@ static int rtl8139_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 static void rtl8139_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
 	struct rtl8139_private *tp = netdev_priv(dev);
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(tp->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(tp->pci_dev), sizeof(info->bus_info));
 }
 
 static int rtl8139_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index 1b7fdb4f056b..3845f9ae0fa5 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -1423,11 +1423,11 @@ static void rtl8169_get_drvinfo(struct net_device *dev,
 	struct rtl8169_private *tp = netdev_priv(dev);
 	struct rtl_fw *rtl_fw = tp->rtl_fw;
 
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
-	strlcpy(info->bus_info, pci_name(tp->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->bus_info, pci_name(tp->pci_dev), sizeof(info->bus_info));
 	BUILD_BUG_ON(sizeof(info->fw_version) < sizeof(rtl_fw->version));
 	if (rtl_fw)
-		strlcpy(info->fw_version, rtl_fw->version,
+		strscpy(info->fw_version, rtl_fw->version,
 			sizeof(info->fw_version));
 }
 
diff --git a/drivers/net/ethernet/rocker/rocker_main.c b/drivers/net/ethernet/rocker/rocker_main.c
index fc83ec23bd1d..9e7b62750bb0 100644
--- a/drivers/net/ethernet/rocker/rocker_main.c
+++ b/drivers/net/ethernet/rocker/rocker_main.c
@@ -2226,8 +2226,8 @@ rocker_port_set_link_ksettings(struct net_device *dev,
 static void rocker_port_get_drvinfo(struct net_device *dev,
 				    struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, rocker_driver_name, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, UTS_RELEASE, sizeof(drvinfo->version));
+	strscpy(drvinfo->driver, rocker_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, UTS_RELEASE, sizeof(drvinfo->version));
 }
 
 static struct rocker_port_stats {
diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_ethtool.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_ethtool.c
index 98edb01024f0..8ba017ec9849 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_ethtool.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_ethtool.c
@@ -175,8 +175,8 @@ static int sxgbe_set_eee(struct net_device *dev,
 static void sxgbe_getdrvinfo(struct net_device *dev,
 			     struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
 }
 
 static u32 sxgbe_getmsglevel(struct net_device *dev)
diff --git a/drivers/net/ethernet/sfc/efx.c b/drivers/net/ethernet/sfc/efx.c
index 153d68e29b8b..abed6188a8e6 100644
--- a/drivers/net/ethernet/sfc/efx.c
+++ b/drivers/net/ethernet/sfc/efx.c
@@ -778,7 +778,7 @@ static void efx_unregister_netdev(struct efx_nic *efx)
 		return;
 
 	if (efx_dev_registered(efx)) {
-		strlcpy(efx->name, pci_name(efx->pci_dev), sizeof(efx->name));
+		strscpy(efx->name, pci_name(efx->pci_dev), sizeof(efx->name));
 		efx_fini_mcdi_logging(efx);
 		device_remove_file(&efx->pci_dev->dev, &dev_attr_phy_type);
 		unregister_netdev(efx->net_dev);
diff --git a/drivers/net/ethernet/sfc/efx_common.c b/drivers/net/ethernet/sfc/efx_common.c
index a929a1aaba92..c2224e41a694 100644
--- a/drivers/net/ethernet/sfc/efx_common.c
+++ b/drivers/net/ethernet/sfc/efx_common.c
@@ -996,7 +996,7 @@ int efx_init_struct(struct efx_nic *efx, struct pci_dev *pci_dev)
 	efx->pci_dev = pci_dev;
 	efx->msg_enable = debug;
 	efx->state = STATE_UNINIT;
-	strlcpy(efx->name, pci_name(pci_dev), sizeof(efx->name));
+	strscpy(efx->name, pci_name(pci_dev), sizeof(efx->name));
 
 	efx->rx_prefix_size = efx->type->rx_prefix_size;
 	efx->rx_ip_align =
diff --git a/drivers/net/ethernet/sfc/ethtool_common.c b/drivers/net/ethernet/sfc/ethtool_common.c
index bc840ede3053..a8cbceeb301b 100644
--- a/drivers/net/ethernet/sfc/ethtool_common.c
+++ b/drivers/net/ethernet/sfc/ethtool_common.c
@@ -106,10 +106,10 @@ void efx_ethtool_get_drvinfo(struct net_device *net_dev,
 {
 	struct efx_nic *efx = efx_netdev_priv(net_dev);
 
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
 	efx_mcdi_print_fwver(efx, info->fw_version,
 			     sizeof(info->fw_version));
-	strlcpy(info->bus_info, pci_name(efx->pci_dev), sizeof(info->bus_info));
+	strscpy(info->bus_info, pci_name(efx->pci_dev), sizeof(info->bus_info));
 }
 
 u32 efx_ethtool_get_msglevel(struct net_device *net_dev)
@@ -468,7 +468,7 @@ void efx_ethtool_get_strings(struct net_device *net_dev,
 		strings += (efx->type->describe_stats(efx, strings) *
 			    ETH_GSTRING_LEN);
 		for (i = 0; i < EFX_ETHTOOL_SW_STAT_COUNT; i++)
-			strlcpy(strings + i * ETH_GSTRING_LEN,
+			strscpy(strings + i * ETH_GSTRING_LEN,
 				efx_sw_stat_desc[i].name, ETH_GSTRING_LEN);
 		strings += EFX_ETHTOOL_SW_STAT_COUNT * ETH_GSTRING_LEN;
 		strings += (efx_describe_per_queue_stats(efx, strings) *
diff --git a/drivers/net/ethernet/sfc/falcon/efx.c b/drivers/net/ethernet/sfc/falcon/efx.c
index a63f40b09856..f18418e07eb8 100644
--- a/drivers/net/ethernet/sfc/falcon/efx.c
+++ b/drivers/net/ethernet/sfc/falcon/efx.c
@@ -2329,7 +2329,7 @@ static void ef4_unregister_netdev(struct ef4_nic *efx)
 	BUG_ON(netdev_priv(efx->net_dev) != efx);
 
 	if (ef4_dev_registered(efx)) {
-		strlcpy(efx->name, pci_name(efx->pci_dev), sizeof(efx->name));
+		strscpy(efx->name, pci_name(efx->pci_dev), sizeof(efx->name));
 		device_remove_file(&efx->pci_dev->dev, &dev_attr_phy_type);
 		unregister_netdev(efx->net_dev);
 	}
@@ -2640,7 +2640,7 @@ static int ef4_init_struct(struct ef4_nic *efx,
 	efx->pci_dev = pci_dev;
 	efx->msg_enable = debug;
 	efx->state = STATE_UNINIT;
-	strlcpy(efx->name, pci_name(pci_dev), sizeof(efx->name));
+	strscpy(efx->name, pci_name(pci_dev), sizeof(efx->name));
 
 	efx->net_dev = net_dev;
 	efx->rx_prefix_size = efx->type->rx_prefix_size;
diff --git a/drivers/net/ethernet/sfc/falcon/ethtool.c b/drivers/net/ethernet/sfc/falcon/ethtool.c
index 907254b36663..3976a333f7e3 100644
--- a/drivers/net/ethernet/sfc/falcon/ethtool.c
+++ b/drivers/net/ethernet/sfc/falcon/ethtool.c
@@ -162,9 +162,9 @@ static void ef4_ethtool_get_drvinfo(struct net_device *net_dev,
 {
 	struct ef4_nic *efx = netdev_priv(net_dev);
 
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
-	strlcpy(info->version, EF4_DRIVER_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(efx->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->version, EF4_DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(efx->pci_dev), sizeof(info->bus_info));
 }
 
 static int ef4_ethtool_get_regs_len(struct net_device *net_dev)
@@ -412,7 +412,7 @@ static void ef4_ethtool_get_strings(struct net_device *net_dev,
 		strings += (efx->type->describe_stats(efx, strings) *
 			    ETH_GSTRING_LEN);
 		for (i = 0; i < EF4_ETHTOOL_SW_STAT_COUNT; i++)
-			strlcpy(strings + i * ETH_GSTRING_LEN,
+			strscpy(strings + i * ETH_GSTRING_LEN,
 				ef4_sw_stat_desc[i].name, ETH_GSTRING_LEN);
 		strings += EF4_ETHTOOL_SW_STAT_COUNT * ETH_GSTRING_LEN;
 		strings += (ef4_describe_per_queue_stats(efx, strings) *
diff --git a/drivers/net/ethernet/sfc/falcon/falcon.c b/drivers/net/ethernet/sfc/falcon/falcon.c
index 3324a6219a09..7a1c9337081b 100644
--- a/drivers/net/ethernet/sfc/falcon/falcon.c
+++ b/drivers/net/ethernet/sfc/falcon/falcon.c
@@ -2387,7 +2387,7 @@ static int falcon_probe_nic(struct ef4_nic *efx)
 	board->i2c_data.data = efx;
 	board->i2c_adap.algo_data = &board->i2c_data;
 	board->i2c_adap.dev.parent = &efx->pci_dev->dev;
-	strlcpy(board->i2c_adap.name, "SFC4000 GPIO",
+	strscpy(board->i2c_adap.name, "SFC4000 GPIO",
 		sizeof(board->i2c_adap.name));
 	rc = i2c_bit_add_bus(&board->i2c_adap);
 	if (rc)
diff --git a/drivers/net/ethernet/sfc/falcon/nic.c b/drivers/net/ethernet/sfc/falcon/nic.c
index 156da315ec89..78c851b5a56f 100644
--- a/drivers/net/ethernet/sfc/falcon/nic.c
+++ b/drivers/net/ethernet/sfc/falcon/nic.c
@@ -452,7 +452,7 @@ size_t ef4_nic_describe_stats(const struct ef4_hw_stat_desc *desc, size_t count,
 	for_each_set_bit(index, mask, count) {
 		if (desc[index].name) {
 			if (names) {
-				strlcpy(names, desc[index].name,
+				strscpy(names, desc[index].name,
 					ETH_GSTRING_LEN);
 				names += ETH_GSTRING_LEN;
 			}
diff --git a/drivers/net/ethernet/sfc/mcdi_mon.c b/drivers/net/ethernet/sfc/mcdi_mon.c
index 5954fcfee2b1..f5128db7c7e7 100644
--- a/drivers/net/ethernet/sfc/mcdi_mon.c
+++ b/drivers/net/ethernet/sfc/mcdi_mon.c
@@ -285,7 +285,7 @@ efx_mcdi_mon_add_attr(struct efx_nic *efx, const char *name,
 	struct efx_mcdi_mon *hwmon = efx_mcdi_mon(efx);
 	struct efx_mcdi_mon_attribute *attr = &hwmon->attrs[hwmon->n_attrs];
 
-	strlcpy(attr->name, name, sizeof(attr->name));
+	strscpy(attr->name, name, sizeof(attr->name));
 	attr->index = index;
 	attr->type = type;
 	if (type < ARRAY_SIZE(efx_mcdi_sensor_type))
diff --git a/drivers/net/ethernet/sfc/nic.c b/drivers/net/ethernet/sfc/nic.c
index 22fbb0ae77fb..63e2394382bb 100644
--- a/drivers/net/ethernet/sfc/nic.c
+++ b/drivers/net/ethernet/sfc/nic.c
@@ -465,7 +465,7 @@ size_t efx_nic_describe_stats(const struct efx_hw_stat_desc *desc, size_t count,
 	for_each_set_bit(index, mask, count) {
 		if (desc[index].name) {
 			if (names) {
-				strlcpy(names, desc[index].name,
+				strscpy(names, desc[index].name,
 					ETH_GSTRING_LEN);
 				names += ETH_GSTRING_LEN;
 			}
diff --git a/drivers/net/ethernet/sfc/siena/efx.c b/drivers/net/ethernet/sfc/siena/efx.c
index 63d999e63960..10734e828e51 100644
--- a/drivers/net/ethernet/sfc/siena/efx.c
+++ b/drivers/net/ethernet/sfc/siena/efx.c
@@ -775,7 +775,7 @@ static void efx_unregister_netdev(struct efx_nic *efx)
 	BUG_ON(netdev_priv(efx->net_dev) != efx);
 
 	if (efx_dev_registered(efx)) {
-		strlcpy(efx->name, pci_name(efx->pci_dev), sizeof(efx->name));
+		strscpy(efx->name, pci_name(efx->pci_dev), sizeof(efx->name));
 		efx_siena_fini_mcdi_logging(efx);
 		device_remove_file(&efx->pci_dev->dev, &dev_attr_phy_type);
 		unregister_netdev(efx->net_dev);
diff --git a/drivers/net/ethernet/sfc/siena/efx_common.c b/drivers/net/ethernet/sfc/siena/efx_common.c
index 954daf464abb..1fd396b00bfb 100644
--- a/drivers/net/ethernet/sfc/siena/efx_common.c
+++ b/drivers/net/ethernet/sfc/siena/efx_common.c
@@ -1006,7 +1006,7 @@ int efx_siena_init_struct(struct efx_nic *efx,
 	efx->pci_dev = pci_dev;
 	efx->msg_enable = debug;
 	efx->state = STATE_UNINIT;
-	strlcpy(efx->name, pci_name(pci_dev), sizeof(efx->name));
+	strscpy(efx->name, pci_name(pci_dev), sizeof(efx->name));
 
 	efx->net_dev = net_dev;
 	efx->rx_prefix_size = efx->type->rx_prefix_size;
diff --git a/drivers/net/ethernet/sfc/siena/ethtool_common.c b/drivers/net/ethernet/sfc/siena/ethtool_common.c
index 0207d07f54e3..f590e87e5a23 100644
--- a/drivers/net/ethernet/sfc/siena/ethtool_common.c
+++ b/drivers/net/ethernet/sfc/siena/ethtool_common.c
@@ -105,10 +105,10 @@ void efx_siena_ethtool_get_drvinfo(struct net_device *net_dev,
 {
 	struct efx_nic *efx = netdev_priv(net_dev);
 
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
 	efx_siena_mcdi_print_fwver(efx, info->fw_version,
 				   sizeof(info->fw_version));
-	strlcpy(info->bus_info, pci_name(efx->pci_dev), sizeof(info->bus_info));
+	strscpy(info->bus_info, pci_name(efx->pci_dev), sizeof(info->bus_info));
 }
 
 u32 efx_siena_ethtool_get_msglevel(struct net_device *net_dev)
@@ -467,7 +467,7 @@ void efx_siena_ethtool_get_strings(struct net_device *net_dev,
 		strings += (efx->type->describe_stats(efx, strings) *
 			    ETH_GSTRING_LEN);
 		for (i = 0; i < EFX_ETHTOOL_SW_STAT_COUNT; i++)
-			strlcpy(strings + i * ETH_GSTRING_LEN,
+			strscpy(strings + i * ETH_GSTRING_LEN,
 				efx_sw_stat_desc[i].name, ETH_GSTRING_LEN);
 		strings += EFX_ETHTOOL_SW_STAT_COUNT * ETH_GSTRING_LEN;
 		strings += (efx_describe_per_queue_stats(efx, strings) *
diff --git a/drivers/net/ethernet/sfc/siena/mcdi_mon.c b/drivers/net/ethernet/sfc/siena/mcdi_mon.c
index c7ea703c5d7a..56a9c56ed9e3 100644
--- a/drivers/net/ethernet/sfc/siena/mcdi_mon.c
+++ b/drivers/net/ethernet/sfc/siena/mcdi_mon.c
@@ -285,7 +285,7 @@ efx_mcdi_mon_add_attr(struct efx_nic *efx, const char *name,
 	struct efx_mcdi_mon *hwmon = efx_mcdi_mon(efx);
 	struct efx_mcdi_mon_attribute *attr = &hwmon->attrs[hwmon->n_attrs];
 
-	strlcpy(attr->name, name, sizeof(attr->name));
+	strscpy(attr->name, name, sizeof(attr->name));
 	attr->index = index;
 	attr->type = type;
 	if (type < ARRAY_SIZE(efx_mcdi_sensor_type))
diff --git a/drivers/net/ethernet/sfc/siena/nic.c b/drivers/net/ethernet/sfc/siena/nic.c
index abf9a4adf139..0ea0433a6230 100644
--- a/drivers/net/ethernet/sfc/siena/nic.c
+++ b/drivers/net/ethernet/sfc/siena/nic.c
@@ -458,7 +458,7 @@ size_t efx_siena_describe_stats(const struct efx_hw_stat_desc *desc, size_t coun
 	for_each_set_bit(index, mask, count) {
 		if (desc[index].name) {
 			if (names) {
-				strlcpy(names, desc[index].name,
+				strscpy(names, desc[index].name,
 					ETH_GSTRING_LEN);
 				names += ETH_GSTRING_LEN;
 			}
diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
index e2d009866a7b..8fc3f5272fa7 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -1158,9 +1158,9 @@ static inline unsigned int ioc3_hash(const unsigned char *addr)
 static void ioc3_get_drvinfo(struct net_device *dev,
 			     struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, IOC3_NAME, sizeof(info->driver));
-	strlcpy(info->version, IOC3_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(to_pci_dev(dev->dev.parent)),
+	strscpy(info->driver, IOC3_NAME, sizeof(info->driver));
+	strscpy(info->version, IOC3_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(to_pci_dev(dev->dev.parent)),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/sis/sis190.c b/drivers/net/ethernet/sis/sis190.c
index 216bb2d34d7c..dda4e488c77a 100644
--- a/drivers/net/ethernet/sis/sis190.c
+++ b/drivers/net/ethernet/sis/sis190.c
@@ -1769,9 +1769,9 @@ static void sis190_get_drvinfo(struct net_device *dev,
 {
 	struct sis190_private *tp = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(tp->pci_dev),
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(tp->pci_dev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/sis/sis900.c b/drivers/net/ethernet/sis/sis900.c
index 23a336c5096e..cb7fec226cab 100644
--- a/drivers/net/ethernet/sis/sis900.c
+++ b/drivers/net/ethernet/sis/sis900.c
@@ -2027,9 +2027,9 @@ static void sis900_get_drvinfo(struct net_device *net_dev,
 {
 	struct sis900_private *sis_priv = netdev_priv(net_dev);
 
-	strlcpy(info->driver, SIS900_MODULE_NAME, sizeof(info->driver));
-	strlcpy(info->version, SIS900_DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(sis_priv->pci_dev),
+	strscpy(info->driver, SIS900_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->version, SIS900_DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(sis_priv->pci_dev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/smsc/epic100.c b/drivers/net/ethernet/smsc/epic100.c
index 0329caf63279..83fe53401453 100644
--- a/drivers/net/ethernet/smsc/epic100.c
+++ b/drivers/net/ethernet/smsc/epic100.c
@@ -1392,9 +1392,9 @@ static void netdev_get_drvinfo (struct net_device *dev, struct ethtool_drvinfo *
 {
 	struct epic_private *np = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(np->pci_dev), sizeof(info->bus_info));
 }
 
 static int netdev_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/smsc/smc911x.c b/drivers/net/ethernet/smsc/smc911x.c
index 24d66af797d4..52ecfb461c41 100644
--- a/drivers/net/ethernet/smsc/smc911x.c
+++ b/drivers/net/ethernet/smsc/smc911x.c
@@ -1509,9 +1509,9 @@ smc911x_ethtool_set_link_ksettings(struct net_device *dev,
 static void
 smc911x_ethtool_getdrvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, CARDNAME, sizeof(info->driver));
-	strlcpy(info->version, version, sizeof(info->version));
-	strlcpy(info->bus_info, dev_name(dev->dev.parent),
+	strscpy(info->driver, CARDNAME, sizeof(info->driver));
+	strscpy(info->version, version, sizeof(info->version));
+	strscpy(info->bus_info, dev_name(dev->dev.parent),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/smsc/smc91c92_cs.c b/drivers/net/ethernet/smsc/smc91c92_cs.c
index 37c822e27207..29bb19f42de9 100644
--- a/drivers/net/ethernet/smsc/smc91c92_cs.c
+++ b/drivers/net/ethernet/smsc/smc91c92_cs.c
@@ -1909,8 +1909,8 @@ static int check_if_running(struct net_device *dev)
 
 static void smc_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
 }
 
 static int smc_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/smsc/smc91x.c b/drivers/net/ethernet/smsc/smc91x.c
index a31c159e96ea..35e99bf0c401 100644
--- a/drivers/net/ethernet/smsc/smc91x.c
+++ b/drivers/net/ethernet/smsc/smc91x.c
@@ -1588,9 +1588,9 @@ smc_ethtool_set_link_ksettings(struct net_device *dev,
 static void
 smc_ethtool_getdrvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, CARDNAME, sizeof(info->driver));
-	strlcpy(info->version, version, sizeof(info->version));
-	strlcpy(info->bus_info, dev_name(dev->dev.parent),
+	strscpy(info->driver, CARDNAME, sizeof(info->driver));
+	strscpy(info->version, version, sizeof(info->version));
+	strscpy(info->bus_info, dev_name(dev->dev.parent),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/smsc/smsc911x.c b/drivers/net/ethernet/smsc/smsc911x.c
index 3bf20211cceb..953489548b8d 100644
--- a/drivers/net/ethernet/smsc/smsc911x.c
+++ b/drivers/net/ethernet/smsc/smsc911x.c
@@ -1953,9 +1953,9 @@ static int smsc911x_set_mac_address(struct net_device *dev, void *p)
 static void smsc911x_ethtool_getdrvinfo(struct net_device *dev,
 					struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, SMSC_CHIPNAME, sizeof(info->driver));
-	strlcpy(info->version, SMSC_DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, dev_name(dev->dev.parent),
+	strscpy(info->driver, SMSC_CHIPNAME, sizeof(info->driver));
+	strscpy(info->version, SMSC_DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, dev_name(dev->dev.parent),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/smsc/smsc9420.c b/drivers/net/ethernet/smsc/smsc9420.c
index 0c68c7f8056d..229180aa86de 100644
--- a/drivers/net/ethernet/smsc/smsc9420.c
+++ b/drivers/net/ethernet/smsc/smsc9420.c
@@ -215,10 +215,10 @@ static void smsc9420_ethtool_get_drvinfo(struct net_device *netdev,
 {
 	struct smsc9420_pdata *pd = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->bus_info, pci_name(pd->pdev),
+	strscpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->bus_info, pci_name(pd->pdev),
 		sizeof(drvinfo->bus_info));
-	strlcpy(drvinfo->version, DRV_VERSION, sizeof(drvinfo->version));
+	strscpy(drvinfo->version, DRV_VERSION, sizeof(drvinfo->version));
 }
 
 static u32 smsc9420_ethtool_get_msglevel(struct net_device *netdev)
diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethernet/socionext/netsec.c
index b0c5a44785fa..85e62f5489b6 100644
--- a/drivers/net/ethernet/socionext/netsec.c
+++ b/drivers/net/ethernet/socionext/netsec.c
@@ -526,8 +526,8 @@ static int netsec_phy_read(struct mii_bus *bus, int phy_addr, int reg_addr)
 static void netsec_et_get_drvinfo(struct net_device *net_device,
 				  struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, "netsec", sizeof(info->driver));
-	strlcpy(info->bus_info, dev_name(net_device->dev.parent),
+	strscpy(info->driver, "netsec", sizeof(info->driver));
+	strscpy(info->bus_info, dev_name(net_device->dev.parent),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/socionext/sni_ave.c b/drivers/net/ethernet/socionext/sni_ave.c
index f0c8de2c6075..ee341a383e69 100644
--- a/drivers/net/ethernet/socionext/sni_ave.c
+++ b/drivers/net/ethernet/socionext/sni_ave.c
@@ -395,8 +395,8 @@ static void ave_ethtool_get_drvinfo(struct net_device *ndev,
 {
 	struct device *dev = ndev->dev.parent;
 
-	strlcpy(info->driver, dev->driver->name, sizeof(info->driver));
-	strlcpy(info->bus_info, dev_name(dev), sizeof(info->bus_info));
+	strscpy(info->driver, dev->driver->name, sizeof(info->driver));
+	strscpy(info->bus_info, dev_name(dev), sizeof(info->bus_info));
 	ave_hw_read_version(ndev, info->fw_version, sizeof(info->fw_version));
 }
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index d6a44d53fe08..f453b0d09366 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -287,15 +287,15 @@ static void stmmac_ethtool_getdrvinfo(struct net_device *dev,
 	struct stmmac_priv *priv = netdev_priv(dev);
 
 	if (priv->plat->has_gmac || priv->plat->has_gmac4)
-		strlcpy(info->driver, GMAC_ETHTOOL_NAME, sizeof(info->driver));
+		strscpy(info->driver, GMAC_ETHTOOL_NAME, sizeof(info->driver));
 	else if (priv->plat->has_xgmac)
-		strlcpy(info->driver, XGMAC_ETHTOOL_NAME, sizeof(info->driver));
+		strscpy(info->driver, XGMAC_ETHTOOL_NAME, sizeof(info->driver));
 	else
-		strlcpy(info->driver, MAC100_ETHTOOL_NAME,
+		strscpy(info->driver, MAC100_ETHTOOL_NAME,
 			sizeof(info->driver));
 
 	if (priv->plat->pdev) {
-		strlcpy(info->bus_info, pci_name(priv->plat->pdev),
+		strscpy(info->bus_info, pci_name(priv->plat->pdev),
 			sizeof(info->bus_info));
 	}
 }
diff --git a/drivers/net/ethernet/sun/cassini.c b/drivers/net/ethernet/sun/cassini.c
index 0b08b0e085e8..19a3eb6efc3a 100644
--- a/drivers/net/ethernet/sun/cassini.c
+++ b/drivers/net/ethernet/sun/cassini.c
@@ -4484,9 +4484,9 @@ static void cas_set_multicast(struct net_device *dev)
 static void cas_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
 	struct cas *cp = netdev_priv(dev);
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_MODULE_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(cp->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_MODULE_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(cp->pdev), sizeof(info->bus_info));
 }
 
 static int cas_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/sun/ldmvsw.c b/drivers/net/ethernet/sun/ldmvsw.c
index 0cd8493b810f..bc51a75a0e19 100644
--- a/drivers/net/ethernet/sun/ldmvsw.c
+++ b/drivers/net/ethernet/sun/ldmvsw.c
@@ -63,8 +63,8 @@ static struct vio_version vsw_versions[] = {
 static void vsw_get_drvinfo(struct net_device *dev,
 			    struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_MODULE_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_MODULE_VERSION, sizeof(info->version));
 }
 
 static u32 vsw_get_msglevel(struct net_device *dev)
diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index df70df29deea..204a29e72292 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -6798,12 +6798,12 @@ static void niu_get_drvinfo(struct net_device *dev,
 	struct niu *np = netdev_priv(dev);
 	struct niu_vpd *vpd = &np->vpd;
 
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_MODULE_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_MODULE_VERSION, sizeof(info->version));
 	snprintf(info->fw_version, sizeof(info->fw_version), "%d.%d",
 		vpd->fcode_major, vpd->fcode_minor);
 	if (np->parent->plat_type != PLAT_TYPE_NIU)
-		strlcpy(info->bus_info, pci_name(np->pdev),
+		strscpy(info->bus_info, pci_name(np->pdev),
 			sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/sun/sunbmac.c b/drivers/net/ethernet/sun/sunbmac.c
index 531a6f449afa..34b94153bf0c 100644
--- a/drivers/net/ethernet/sun/sunbmac.c
+++ b/drivers/net/ethernet/sun/sunbmac.c
@@ -1038,8 +1038,8 @@ static void bigmac_set_multicast(struct net_device *dev)
 /* Ethtool support... */
 static void bigmac_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, "sunbmac", sizeof(info->driver));
-	strlcpy(info->version, "2.0", sizeof(info->version));
+	strscpy(info->driver, "sunbmac", sizeof(info->driver));
+	strscpy(info->version, "2.0", sizeof(info->version));
 }
 
 static u32 bigmac_get_link(struct net_device *dev)
diff --git a/drivers/net/ethernet/sun/sungem.c b/drivers/net/ethernet/sun/sungem.c
index a14591b41acb..6fb89c55f957 100644
--- a/drivers/net/ethernet/sun/sungem.c
+++ b/drivers/net/ethernet/sun/sungem.c
@@ -2521,9 +2521,9 @@ static void gem_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info
 {
 	struct gem *gp = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(gp->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(gp->pdev), sizeof(info->bus_info));
 }
 
 static int gem_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/sun/sunhme.c b/drivers/net/ethernet/sun/sunhme.c
index 8594ee839628..1921054b7f7d 100644
--- a/drivers/net/ethernet/sun/sunhme.c
+++ b/drivers/net/ethernet/sun/sunhme.c
@@ -2467,11 +2467,11 @@ static void hme_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info
 {
 	struct happy_meal *hp = netdev_priv(dev);
 
-	strlcpy(info->driver, "sunhme", sizeof(info->driver));
-	strlcpy(info->version, "2.02", sizeof(info->version));
+	strscpy(info->driver, "sunhme", sizeof(info->driver));
+	strscpy(info->version, "2.02", sizeof(info->version));
 	if (hp->happy_flags & HFLAG_PCI) {
 		struct pci_dev *pdev = hp->happy_dev;
-		strlcpy(info->bus_info, pci_name(pdev), sizeof(info->bus_info));
+		strscpy(info->bus_info, pci_name(pdev), sizeof(info->bus_info));
 	}
 #ifdef CONFIG_SBUS
 	else {
diff --git a/drivers/net/ethernet/sun/sunqe.c b/drivers/net/ethernet/sun/sunqe.c
index efe0d33f6024..6418fcc3139f 100644
--- a/drivers/net/ethernet/sun/sunqe.c
+++ b/drivers/net/ethernet/sun/sunqe.c
@@ -684,8 +684,8 @@ static void qe_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 	struct sunqe *qep = netdev_priv(dev);
 	struct platform_device *op;
 
-	strlcpy(info->driver, "sunqe", sizeof(info->driver));
-	strlcpy(info->version, "3.0", sizeof(info->version));
+	strscpy(info->driver, "sunqe", sizeof(info->driver));
+	strscpy(info->version, "3.0", sizeof(info->version));
 
 	op = qep->op;
 	regs = of_get_property(op->dev.of_node, "reg", NULL);
diff --git a/drivers/net/ethernet/sun/sunvnet.c b/drivers/net/ethernet/sun/sunvnet.c
index da8119625cf3..042b50227850 100644
--- a/drivers/net/ethernet/sun/sunvnet.c
+++ b/drivers/net/ethernet/sun/sunvnet.c
@@ -60,8 +60,8 @@ static struct vio_version vnet_versions[] = {
 static void vnet_get_drvinfo(struct net_device *dev,
 			     struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_MODULE_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRV_MODULE_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_MODULE_VERSION, sizeof(info->version));
 }
 
 static u32 vnet_get_msglevel(struct net_device *dev)
diff --git a/drivers/net/ethernet/synopsys/dwc-xlgmac-common.c b/drivers/net/ethernet/synopsys/dwc-xlgmac-common.c
index 5c9b6c90942b..f8e133604146 100644
--- a/drivers/net/ethernet/synopsys/dwc-xlgmac-common.c
+++ b/drivers/net/ethernet/synopsys/dwc-xlgmac-common.c
@@ -54,8 +54,8 @@ static void xlgmac_default_config(struct xlgmac_pdata *pdata)
 	pdata->phy_speed = SPEED_25000;
 	pdata->sysclk_rate = XLGMAC_SYSCLOCK;
 
-	strlcpy(pdata->drv_name, XLGMAC_DRV_NAME, sizeof(pdata->drv_name));
-	strlcpy(pdata->drv_ver, XLGMAC_DRV_VERSION, sizeof(pdata->drv_ver));
+	strscpy(pdata->drv_name, XLGMAC_DRV_NAME, sizeof(pdata->drv_name));
+	strscpy(pdata->drv_ver, XLGMAC_DRV_VERSION, sizeof(pdata->drv_ver));
 }
 
 static void xlgmac_init_all_ops(struct xlgmac_pdata *pdata)
diff --git a/drivers/net/ethernet/synopsys/dwc-xlgmac-ethtool.c b/drivers/net/ethernet/synopsys/dwc-xlgmac-ethtool.c
index 49f8c6be9459..e794da727fe0 100644
--- a/drivers/net/ethernet/synopsys/dwc-xlgmac-ethtool.c
+++ b/drivers/net/ethernet/synopsys/dwc-xlgmac-ethtool.c
@@ -102,9 +102,9 @@ static void xlgmac_ethtool_get_drvinfo(struct net_device *netdev,
 	u32 ver = pdata->hw_feat.version;
 	u32 snpsver, devid, userver;
 
-	strlcpy(drvinfo->driver, pdata->drv_name, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, pdata->drv_ver, sizeof(drvinfo->version));
-	strlcpy(drvinfo->bus_info, dev_name(pdata->dev),
+	strscpy(drvinfo->driver, pdata->drv_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, pdata->drv_ver, sizeof(drvinfo->version));
+	strscpy(drvinfo->bus_info, dev_name(pdata->dev),
 		sizeof(drvinfo->bus_info));
 	/* S|SNPSVER: Synopsys-defined Version
 	 * D|DEVID: Indicates the Device family
diff --git a/drivers/net/ethernet/tehuti/tehuti.c b/drivers/net/ethernet/tehuti/tehuti.c
index 985073eba3bd..08ba658db987 100644
--- a/drivers/net/ethernet/tehuti/tehuti.c
+++ b/drivers/net/ethernet/tehuti/tehuti.c
@@ -2133,10 +2133,10 @@ bdx_get_drvinfo(struct net_device *netdev, struct ethtool_drvinfo *drvinfo)
 {
 	struct bdx_priv *priv = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver, BDX_DRV_NAME, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, BDX_DRV_VERSION, sizeof(drvinfo->version));
-	strlcpy(drvinfo->fw_version, "N/A", sizeof(drvinfo->fw_version));
-	strlcpy(drvinfo->bus_info, pci_name(priv->pdev),
+	strscpy(drvinfo->driver, BDX_DRV_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, BDX_DRV_VERSION, sizeof(drvinfo->version));
+	strscpy(drvinfo->fw_version, "N/A", sizeof(drvinfo->fw_version));
+	strscpy(drvinfo->bus_info, pci_name(priv->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
index abc1e4276cf0..c51e2af91f69 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
@@ -402,9 +402,9 @@ static void am65_cpsw_get_drvinfo(struct net_device *ndev,
 {
 	struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
 
-	strlcpy(info->driver, dev_driver_string(common->dev),
+	strscpy(info->driver, dev_driver_string(common->dev),
 		sizeof(info->driver));
-	strlcpy(info->bus_info, dev_name(common->dev), sizeof(info->bus_info));
+	strscpy(info->bus_info, dev_name(common->dev), sizeof(info->bus_info));
 }
 
 static u32 am65_cpsw_get_msglevel(struct net_device *ndev)
diff --git a/drivers/net/ethernet/ti/cpmac.c b/drivers/net/ethernet/ti/cpmac.c
index bef5e68dac31..ce92d335927e 100644
--- a/drivers/net/ethernet/ti/cpmac.c
+++ b/drivers/net/ethernet/ti/cpmac.c
@@ -851,8 +851,8 @@ static int cpmac_set_ringparam(struct net_device *dev,
 static void cpmac_get_drvinfo(struct net_device *dev,
 			      struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, "cpmac", sizeof(info->driver));
-	strlcpy(info->version, CPMAC_VERSION, sizeof(info->version));
+	strscpy(info->driver, "cpmac", sizeof(info->driver));
+	strscpy(info->version, CPMAC_VERSION, sizeof(info->version));
 	snprintf(info->bus_info, sizeof(info->bus_info), "%s", "cpmac");
 }
 
diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index ed66c4d4d830..312250c642bb 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1172,9 +1172,9 @@ static void cpsw_get_drvinfo(struct net_device *ndev,
 	struct cpsw_common *cpsw = ndev_to_cpsw(ndev);
 	struct platform_device	*pdev = to_platform_device(cpsw->dev);
 
-	strlcpy(info->driver, "cpsw", sizeof(info->driver));
-	strlcpy(info->version, "1.0", sizeof(info->version));
-	strlcpy(info->bus_info, pdev->name, sizeof(info->bus_info));
+	strscpy(info->driver, "cpsw", sizeof(info->driver));
+	strscpy(info->version, "1.0", sizeof(info->version));
+	strscpy(info->bus_info, pdev->name, sizeof(info->bus_info));
 }
 
 static int cpsw_set_pauseparam(struct net_device *ndev,
diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index 353e58b22c51..007de15179f0 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -1146,9 +1146,9 @@ static void cpsw_get_drvinfo(struct net_device *ndev,
 	struct platform_device *pdev;
 
 	pdev = to_platform_device(cpsw->dev);
-	strlcpy(info->driver, "cpsw-switch", sizeof(info->driver));
-	strlcpy(info->version, "2.0", sizeof(info->version));
-	strlcpy(info->bus_info, pdev->name, sizeof(info->bus_info));
+	strscpy(info->driver, "cpsw-switch", sizeof(info->driver));
+	strscpy(info->version, "2.0", sizeof(info->version));
+	strscpy(info->bus_info, pdev->name, sizeof(info->bus_info));
 }
 
 static int cpsw_set_pauseparam(struct net_device *ndev,
diff --git a/drivers/net/ethernet/ti/davinci_emac.c b/drivers/net/ethernet/ti/davinci_emac.c
index 2a3e4e842fa5..0d6a099d6b68 100644
--- a/drivers/net/ethernet/ti/davinci_emac.c
+++ b/drivers/net/ethernet/ti/davinci_emac.c
@@ -374,8 +374,8 @@ static char *emac_rxhost_errcodes[16] = {
 static void emac_get_drvinfo(struct net_device *ndev,
 			     struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, emac_version_string, sizeof(info->driver));
-	strlcpy(info->version, EMAC_MODULE_VERSION, sizeof(info->version));
+	strscpy(info->driver, emac_version_string, sizeof(info->driver));
+	strscpy(info->version, EMAC_MODULE_VERSION, sizeof(info->version));
 }
 
 /**
diff --git a/drivers/net/ethernet/ti/tlan.c b/drivers/net/ethernet/ti/tlan.c
index 741c42c6a417..b3da76efa8f5 100644
--- a/drivers/net/ethernet/ti/tlan.c
+++ b/drivers/net/ethernet/ti/tlan.c
@@ -762,12 +762,12 @@ static void tlan_get_drvinfo(struct net_device *dev,
 {
 	struct tlan_priv *priv = netdev_priv(dev);
 
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
 	if (priv->pci_dev)
-		strlcpy(info->bus_info, pci_name(priv->pci_dev),
+		strscpy(info->bus_info, pci_name(priv->pci_dev),
 			sizeof(info->bus_info));
 	else
-		strlcpy(info->bus_info, "EISA",	sizeof(info->bus_info));
+		strscpy(info->bus_info, "EISA",	sizeof(info->bus_info));
 }
 
 static int tlan_get_eeprom_len(struct net_device *dev)
diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index 3dbfb1b20649..6e838e8f79d0 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -1187,8 +1187,8 @@ int gelic_net_open(struct net_device *netdev)
 void gelic_net_get_drvinfo(struct net_device *netdev,
 			   struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
 }
 
 static int gelic_ether_get_link_ksettings(struct net_device *netdev,
diff --git a/drivers/net/ethernet/toshiba/spider_net_ethtool.c b/drivers/net/ethernet/toshiba/spider_net_ethtool.c
index 93110dba0bfa..fef9fd127b5e 100644
--- a/drivers/net/ethernet/toshiba/spider_net_ethtool.c
+++ b/drivers/net/ethernet/toshiba/spider_net_ethtool.c
@@ -63,12 +63,12 @@ spider_net_ethtool_get_drvinfo(struct net_device *netdev,
 	card = netdev_priv(netdev);
 
 	/* clear and fill out info */
-	strlcpy(drvinfo->driver, spider_net_driver_name,
+	strscpy(drvinfo->driver, spider_net_driver_name,
 		sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, VERSION, sizeof(drvinfo->version));
-	strlcpy(drvinfo->fw_version, "no information",
+	strscpy(drvinfo->version, VERSION, sizeof(drvinfo->version));
+	strscpy(drvinfo->fw_version, "no information",
 		sizeof(drvinfo->fw_version));
-	strlcpy(drvinfo->bus_info, pci_name(card->pdev),
+	strscpy(drvinfo->bus_info, pci_name(card->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
index 47aab9c132c8..b50be67b398b 100644
--- a/drivers/net/ethernet/toshiba/tc35815.c
+++ b/drivers/net/ethernet/toshiba/tc35815.c
@@ -1956,9 +1956,9 @@ static void tc35815_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *
 {
 	struct tc35815_local *lp = netdev_priv(dev);
 
-	strlcpy(info->driver, MODNAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(lp->pci_dev), sizeof(info->bus_info));
+	strscpy(info->driver, MODNAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(lp->pci_dev), sizeof(info->bus_info));
 }
 
 static u32 tc35815_get_msglevel(struct net_device *dev)
diff --git a/drivers/net/ethernet/via/via-rhine.c b/drivers/net/ethernet/via/via-rhine.c
index 509c5e9b29df..29cde0bec4b1 100644
--- a/drivers/net/ethernet/via/via-rhine.c
+++ b/drivers/net/ethernet/via/via-rhine.c
@@ -2281,8 +2281,8 @@ static void netdev_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *i
 {
 	struct device *hwdev = dev->dev.parent;
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->bus_info, dev_name(hwdev), sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->bus_info, dev_name(hwdev), sizeof(info->bus_info));
 }
 
 static int netdev_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethernet/via/via-velocity.c
index ff0c102cb578..5d710ebb9680 100644
--- a/drivers/net/ethernet/via/via-velocity.c
+++ b/drivers/net/ethernet/via/via-velocity.c
@@ -3419,13 +3419,13 @@ static void velocity_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo
 {
 	struct velocity_info *vptr = netdev_priv(dev);
 
-	strlcpy(info->driver, VELOCITY_NAME, sizeof(info->driver));
-	strlcpy(info->version, VELOCITY_VERSION, sizeof(info->version));
+	strscpy(info->driver, VELOCITY_NAME, sizeof(info->driver));
+	strscpy(info->version, VELOCITY_VERSION, sizeof(info->version));
 	if (vptr->pdev)
-		strlcpy(info->bus_info, pci_name(vptr->pdev),
+		strscpy(info->bus_info, pci_name(vptr->pdev),
 						sizeof(info->bus_info));
 	else
-		strlcpy(info->bus_info, "platform", sizeof(info->bus_info));
+		strscpy(info->bus_info, "platform", sizeof(info->bus_info));
 }
 
 static void velocity_ethtool_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/wiznet/w5100.c
index acd78120e53c..634946e87e5f 100644
--- a/drivers/net/ethernet/wiznet/w5100.c
+++ b/drivers/net/ethernet/wiznet/w5100.c
@@ -719,9 +719,9 @@ static void w5100_hw_close(struct w5100_priv *priv)
 static void w5100_get_drvinfo(struct net_device *ndev,
 			      struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, dev_name(ndev->dev.parent),
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, dev_name(ndev->dev.parent),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/wiznet/w5300.c b/drivers/net/ethernet/wiznet/w5300.c
index 773f8c77909a..b0958fe8111e 100644
--- a/drivers/net/ethernet/wiznet/w5300.c
+++ b/drivers/net/ethernet/wiznet/w5300.c
@@ -282,9 +282,9 @@ static void w5300_hw_close(struct w5300_priv *priv)
 static void w5300_get_drvinfo(struct net_device *ndev,
 			      struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, dev_name(ndev->dev.parent),
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, dev_name(ndev->dev.parent),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1760930ec0c4..52e05895823e 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1317,8 +1317,8 @@ static const struct net_device_ops axienet_netdev_ops = {
 static void axienet_ethtools_get_drvinfo(struct net_device *ndev,
 					 struct ethtool_drvinfo *ed)
 {
-	strlcpy(ed->driver, DRIVER_NAME, sizeof(ed->driver));
-	strlcpy(ed->version, DRIVER_VERSION, sizeof(ed->version));
+	strscpy(ed->driver, DRIVER_NAME, sizeof(ed->driver));
+	strscpy(ed->version, DRIVER_VERSION, sizeof(ed->version));
 }
 
 /**
diff --git a/drivers/net/ethernet/xilinx/xilinx_emaclite.c b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
index 016a9c4f2c6c..05848ff15fb5 100644
--- a/drivers/net/ethernet/xilinx/xilinx_emaclite.c
+++ b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
@@ -1060,7 +1060,7 @@ static bool get_bool(struct platform_device *ofdev, const char *s)
 static void xemaclite_ethtools_get_drvinfo(struct net_device *ndev,
 					   struct ethtool_drvinfo *ed)
 {
-	strlcpy(ed->driver, DRIVER_NAME, sizeof(ed->driver));
+	strscpy(ed->driver, DRIVER_NAME, sizeof(ed->driver));
 }
 
 static const struct ethtool_ops xemaclite_ethtool_ops = {
diff --git a/drivers/net/ethernet/xircom/xirc2ps_cs.c b/drivers/net/ethernet/xircom/xirc2ps_cs.c
index f9587e55b842..894e92ef415b 100644
--- a/drivers/net/ethernet/xircom/xirc2ps_cs.c
+++ b/drivers/net/ethernet/xircom/xirc2ps_cs.c
@@ -1402,7 +1402,7 @@ do_open(struct net_device *dev)
 static void netdev_get_drvinfo(struct net_device *dev,
 			       struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, "xirc2ps_cs", sizeof(info->driver));
+	strscpy(info->driver, "xirc2ps_cs", sizeof(info->driver));
 	snprintf(info->bus_info, sizeof(info->bus_info), "PCMCIA 0x%lx",
 		 dev->base_addr);
 }
diff --git a/drivers/net/ethernet/xscale/ixp4xx_eth.c b/drivers/net/ethernet/xscale/ixp4xx_eth.c
index 3591b9edc9a1..dc81674f5d38 100644
--- a/drivers/net/ethernet/xscale/ixp4xx_eth.c
+++ b/drivers/net/ethernet/xscale/ixp4xx_eth.c
@@ -999,11 +999,11 @@ static void ixp4xx_get_drvinfo(struct net_device *dev,
 {
 	struct port *port = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
 	snprintf(info->fw_version, sizeof(info->fw_version), "%u:%u:%u:%u",
 		 port->firmware[0], port->firmware[1],
 		 port->firmware[2], port->firmware[3]);
-	strlcpy(info->bus_info, "internal", sizeof(info->bus_info));
+	strscpy(info->bus_info, "internal", sizeof(info->bus_info));
 }
 
 static int ixp4xx_get_ts_info(struct net_device *dev,
diff --git a/drivers/net/fjes/fjes_ethtool.c b/drivers/net/fjes/fjes_ethtool.c
index 746736c83873..19c99529566b 100644
--- a/drivers/net/fjes/fjes_ethtool.c
+++ b/drivers/net/fjes/fjes_ethtool.c
@@ -151,11 +151,11 @@ static void fjes_get_drvinfo(struct net_device *netdev,
 
 	plat_dev = adapter->plat_dev;
 
-	strlcpy(drvinfo->driver, fjes_driver_name, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, fjes_driver_version,
+	strscpy(drvinfo->driver, fjes_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, fjes_driver_version,
 		sizeof(drvinfo->version));
 
-	strlcpy(drvinfo->fw_version, "none", sizeof(drvinfo->fw_version));
+	strscpy(drvinfo->fw_version, "none", sizeof(drvinfo->fw_version));
 	snprintf(drvinfo->bus_info, sizeof(drvinfo->bus_info),
 		 "platform:%s", plat_dev->name);
 }
diff --git a/drivers/net/geneve.c b/drivers/net/geneve.c
index 7962c37b3f14..ce3a710a9b4e 100644
--- a/drivers/net/geneve.c
+++ b/drivers/net/geneve.c
@@ -1200,8 +1200,8 @@ static const struct net_device_ops geneve_netdev_ops = {
 static void geneve_get_drvinfo(struct net_device *dev,
 			       struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->version, GENEVE_NETDEV_VER, sizeof(drvinfo->version));
-	strlcpy(drvinfo->driver, "geneve", sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, GENEVE_NETDEV_VER, sizeof(drvinfo->version));
+	strscpy(drvinfo->driver, "geneve", sizeof(drvinfo->driver));
 }
 
 static const struct ethtool_ops geneve_ethtool_ops = {
diff --git a/drivers/net/hamradio/hdlcdrv.c b/drivers/net/hamradio/hdlcdrv.c
index 8297411e87ea..a6184d6c7b15 100644
--- a/drivers/net/hamradio/hdlcdrv.c
+++ b/drivers/net/hamradio/hdlcdrv.c
@@ -600,7 +600,7 @@ static int hdlcdrv_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
 
 	case HDLCDRVCTL_DRIVERNAME:
 		if (s->ops && s->ops->drvname) {
-			strlcpy(bi.data.drivername, s->ops->drvname,
+			strscpy(bi.data.drivername, s->ops->drvname,
 				sizeof(bi.data.drivername));
 			break;
 		}
diff --git a/drivers/net/hyperv/netvsc_drv.c b/drivers/net/hyperv/netvsc_drv.c
index 15ebd5426604..5f08482065ca 100644
--- a/drivers/net/hyperv/netvsc_drv.c
+++ b/drivers/net/hyperv/netvsc_drv.c
@@ -935,8 +935,8 @@ int netvsc_recv_callback(struct net_device *net,
 static void netvsc_get_drvinfo(struct net_device *net,
 			       struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
-	strlcpy(info->fw_version, "N/A", sizeof(info->fw_version));
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->fw_version, "N/A", sizeof(info->fw_version));
 }
 
 static void netvsc_get_channels(struct net_device *net,
diff --git a/drivers/net/ipvlan/ipvlan_main.c b/drivers/net/ipvlan/ipvlan_main.c
index 49ba8a50dfb1..54c94a69c2bb 100644
--- a/drivers/net/ipvlan/ipvlan_main.c
+++ b/drivers/net/ipvlan/ipvlan_main.c
@@ -408,8 +408,8 @@ static int ipvlan_ethtool_get_link_ksettings(struct net_device *dev,
 static void ipvlan_ethtool_get_drvinfo(struct net_device *dev,
 				       struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, IPVLAN_DRV, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, IPV_DRV_VER, sizeof(drvinfo->version));
+	strscpy(drvinfo->driver, IPVLAN_DRV, sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, IPV_DRV_VER, sizeof(drvinfo->version));
 }
 
 static u32 ipvlan_ethtool_get_msglevel(struct net_device *dev)
diff --git a/drivers/net/macvlan.c b/drivers/net/macvlan.c
index 1080d6ebff63..713e3354cb2e 100644
--- a/drivers/net/macvlan.c
+++ b/drivers/net/macvlan.c
@@ -1043,8 +1043,8 @@ static int macvlan_fdb_del(struct ndmsg *ndm, struct nlattr *tb[],
 static void macvlan_ethtool_get_drvinfo(struct net_device *dev,
 					struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, "macvlan", sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, "0.1", sizeof(drvinfo->version));
+	strscpy(drvinfo->driver, "macvlan", sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, "0.1", sizeof(drvinfo->version));
 }
 
 static int macvlan_ethtool_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/net_failover.c b/drivers/net/net_failover.c
index 21a0435c02de..7a28e082436e 100644
--- a/drivers/net/net_failover.c
+++ b/drivers/net/net_failover.c
@@ -324,8 +324,8 @@ static const struct net_device_ops failover_dev_ops = {
 static void nfo_ethtool_get_drvinfo(struct net_device *dev,
 				    struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, FAILOVER_NAME, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, FAILOVER_VERSION, sizeof(drvinfo->version));
+	strscpy(drvinfo->driver, FAILOVER_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, FAILOVER_VERSION, sizeof(drvinfo->version));
 }
 
 static int nfo_ethtool_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index ddac61d79145..bdff9ac5056d 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -55,7 +55,7 @@ MODULE_PARM_DESC(oops_only, "Only log oops messages");
 #ifndef	MODULE
 static int __init option_setup(char *opt)
 {
-	strlcpy(config, opt, MAX_PARAM_LENGTH);
+	strscpy(config, opt, MAX_PARAM_LENGTH);
 	return 1;
 }
 __setup("netconsole=", option_setup);
@@ -178,7 +178,7 @@ static struct netconsole_target *alloc_param_target(char *target_config)
 		goto fail;
 
 	nt->np.name = "netconsole";
-	strlcpy(nt->np.dev_name, "eth0", IFNAMSIZ);
+	strscpy(nt->np.dev_name, "eth0", IFNAMSIZ);
 	nt->np.local_port = 6665;
 	nt->np.remote_port = 6666;
 	eth_broadcast_addr(nt->np.remote_mac);
@@ -414,7 +414,7 @@ static ssize_t dev_name_store(struct config_item *item, const char *buf,
 		return -EINVAL;
 	}
 
-	strlcpy(nt->np.dev_name, buf, IFNAMSIZ);
+	strscpy(nt->np.dev_name, buf, IFNAMSIZ);
 
 	/* Get rid of possible trailing newline from echo(1) */
 	len = strnlen(nt->np.dev_name, IFNAMSIZ);
@@ -630,7 +630,7 @@ static struct config_item *make_netconsole_target(struct config_group *group,
 		return ERR_PTR(-ENOMEM);
 
 	nt->np.name = "netconsole";
-	strlcpy(nt->np.dev_name, "eth0", IFNAMSIZ);
+	strscpy(nt->np.dev_name, "eth0", IFNAMSIZ);
 	nt->np.local_port = 6665;
 	nt->np.remote_port = 6666;
 	eth_broadcast_addr(nt->np.remote_mac);
@@ -708,7 +708,7 @@ static int netconsole_netdev_event(struct notifier_block *this,
 		if (nt->np.dev == dev) {
 			switch (event) {
 			case NETDEV_CHANGENAME:
-				strlcpy(nt->np.dev_name, dev->name, IFNAMSIZ);
+				strscpy(nt->np.dev_name, dev->name, IFNAMSIZ);
 				break;
 			case NETDEV_RELEASE:
 			case NETDEV_JOIN:
diff --git a/drivers/net/ntb_netdev.c b/drivers/net/ntb_netdev.c
index 80bdc07f2cd3..464d88ca8ab0 100644
--- a/drivers/net/ntb_netdev.c
+++ b/drivers/net/ntb_netdev.c
@@ -364,9 +364,9 @@ static void ntb_get_drvinfo(struct net_device *ndev,
 {
 	struct ntb_netdev *dev = netdev_priv(ndev);
 
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
-	strlcpy(info->version, NTB_NETDEV_VER, sizeof(info->version));
-	strlcpy(info->bus_info, pci_name(dev->pdev), sizeof(info->bus_info));
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->version, NTB_NETDEV_VER, sizeof(info->version));
+	strscpy(info->bus_info, pci_name(dev->pdev), sizeof(info->bus_info));
 }
 
 static int ntb_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index ee374a85544a..134637584a83 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -749,7 +749,7 @@ static void adin_get_strings(struct phy_device *phydev, u8 *data)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(adin_hw_stats); i++) {
-		strlcpy(&data[i * ETH_GSTRING_LEN],
+		strscpy(&data[i * ETH_GSTRING_LEN],
 			adin_hw_stats[i].string, ETH_GSTRING_LEN);
 	}
 }
diff --git a/drivers/net/phy/bcm-phy-lib.c b/drivers/net/phy/bcm-phy-lib.c
index 287cccf8f7f4..b2c0baa51f39 100644
--- a/drivers/net/phy/bcm-phy-lib.c
+++ b/drivers/net/phy/bcm-phy-lib.c
@@ -519,7 +519,7 @@ void bcm_phy_get_strings(struct phy_device *phydev, u8 *data)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(bcm_phy_hw_stats); i++)
-		strlcpy(data + i * ETH_GSTRING_LEN,
+		strscpy(data + i * ETH_GSTRING_LEN,
 			bcm_phy_hw_stats[i].string, ETH_GSTRING_LEN);
 }
 EXPORT_SYMBOL_GPL(bcm_phy_get_strings);
diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index a714150f5e8c..a3e810705ce2 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -1952,7 +1952,7 @@ static void marvell_get_strings(struct phy_device *phydev, u8 *data)
 	int i;
 
 	for (i = 0; i < count; i++) {
-		strlcpy(data + i * ETH_GSTRING_LEN,
+		strscpy(data + i * ETH_GSTRING_LEN,
 			marvell_hw_stats[i].string, ETH_GSTRING_LEN);
 	}
 }
diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index e78d0bf69bc3..16301634b44e 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -1650,7 +1650,7 @@ static void kszphy_get_strings(struct phy_device *phydev, u8 *data)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(kszphy_hw_stats); i++) {
-		strlcpy(data + i * ETH_GSTRING_LEN,
+		strscpy(data + i * ETH_GSTRING_LEN,
 			kszphy_hw_stats[i].string, ETH_GSTRING_LEN);
 	}
 }
diff --git a/drivers/net/phy/mscc/mscc_main.c b/drivers/net/phy/mscc/mscc_main.c
index 7e3017e7a1c0..8a13b1ad9a33 100644
--- a/drivers/net/phy/mscc/mscc_main.c
+++ b/drivers/net/phy/mscc/mscc_main.c
@@ -136,7 +136,7 @@ static void vsc85xx_get_strings(struct phy_device *phydev, u8 *data)
 		return;
 
 	for (i = 0; i < priv->nstats; i++)
-		strlcpy(data + i * ETH_GSTRING_LEN, priv->hw_stats[i].string,
+		strscpy(data + i * ETH_GSTRING_LEN, priv->hw_stats[i].string,
 			ETH_GSTRING_LEN);
 }
 
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 0c6efd792690..451fdaf5454a 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -370,7 +370,7 @@ int phy_register_fixup(const char *bus_id, u32 phy_uid, u32 phy_uid_mask,
 	if (!fixup)
 		return -ENOMEM;
 
-	strlcpy(fixup->bus_id, bus_id, sizeof(fixup->bus_id));
+	strscpy(fixup->bus_id, bus_id, sizeof(fixup->bus_id));
 	fixup->phy_uid = phy_uid;
 	fixup->phy_uid_mask = phy_uid_mask;
 	fixup->run = run;
diff --git a/drivers/net/rionet.c b/drivers/net/rionet.c
index 39e61e07e489..fbcb9d05da64 100644
--- a/drivers/net/rionet.c
+++ b/drivers/net/rionet.c
@@ -443,10 +443,10 @@ static void rionet_get_drvinfo(struct net_device *ndev,
 {
 	struct rionet_private *rnet = netdev_priv(ndev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
-	strlcpy(info->fw_version, "n/a", sizeof(info->fw_version));
-	strlcpy(info->bus_info, rnet->mport->name, sizeof(info->bus_info));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->fw_version, "n/a", sizeof(info->fw_version));
+	strscpy(info->bus_info, rnet->mport->name, sizeof(info->bus_info));
 }
 
 static u32 rionet_get_msglevel(struct net_device *ndev)
diff --git a/drivers/net/team/team.c b/drivers/net/team/team.c
index aac133a1e27a..6a391a60c2a5 100644
--- a/drivers/net/team/team.c
+++ b/drivers/net/team/team.c
@@ -2070,8 +2070,8 @@ static const struct net_device_ops team_netdev_ops = {
 static void team_ethtool_get_drvinfo(struct net_device *dev,
 				     struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
-	strlcpy(drvinfo->version, UTS_RELEASE, sizeof(drvinfo->version));
+	strscpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, UTS_RELEASE, sizeof(drvinfo->version));
 }
 
 static int team_ethtool_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index 259b2b84b2b3..3732e51b5ad8 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -3540,15 +3540,15 @@ static void tun_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info
 {
 	struct tun_struct *tun = netdev_priv(dev);
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
 
 	switch (tun->flags & TUN_TYPE_MASK) {
 	case IFF_TUN:
-		strlcpy(info->bus_info, "tun", sizeof(info->bus_info));
+		strscpy(info->bus_info, "tun", sizeof(info->bus_info));
 		break;
 	case IFF_TAP:
-		strlcpy(info->bus_info, "tap", sizeof(info->bus_info));
+		strscpy(info->bus_info, "tap", sizeof(info->bus_info));
 		break;
 	}
 }
diff --git a/drivers/net/usb/aqc111.c b/drivers/net/usb/aqc111.c
index 3020e81159d0..a017e9de2119 100644
--- a/drivers/net/usb/aqc111.c
+++ b/drivers/net/usb/aqc111.c
@@ -201,7 +201,7 @@ static void aqc111_get_drvinfo(struct net_device *net,
 
 	/* Inherit standard device info */
 	usbnet_get_drvinfo(net, info);
-	strlcpy(info->driver, DRIVER_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRIVER_NAME, sizeof(info->driver));
 	snprintf(info->fw_version, sizeof(info->fw_version), "%u.%u.%u",
 		 aqc111_data->fw_ver.major,
 		 aqc111_data->fw_ver.minor,
diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
index 9ea91c3ff045..72ffc89b477a 100644
--- a/drivers/net/usb/asix_common.c
+++ b/drivers/net/usb/asix_common.c
@@ -752,8 +752,8 @@ void asix_get_drvinfo(struct net_device *net, struct ethtool_drvinfo *info)
 {
 	/* Inherit standard device info */
 	usbnet_get_drvinfo(net, info);
-	strlcpy(info->driver, DRIVER_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRIVER_NAME, sizeof(info->driver));
+	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
 }
 
 int asix_set_mac_address(struct net_device *net, void *p)
diff --git a/drivers/net/usb/catc.c b/drivers/net/usb/catc.c
index 843893482abd..ff439ef535ac 100644
--- a/drivers/net/usb/catc.c
+++ b/drivers/net/usb/catc.c
@@ -672,8 +672,8 @@ static void catc_get_drvinfo(struct net_device *dev,
 			     struct ethtool_drvinfo *info)
 {
 	struct catc *catc = netdev_priv(dev);
-	strlcpy(info->driver, driver_name, sizeof(info->driver));
-	strlcpy(info->version, DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->driver, driver_name, sizeof(info->driver));
+	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
 	usb_make_path(catc->usbdev, info->bus_info, sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
index feb247e355f7..81ca64debc5b 100644
--- a/drivers/net/usb/pegasus.c
+++ b/drivers/net/usb/pegasus.c
@@ -894,7 +894,7 @@ static void pegasus_get_drvinfo(struct net_device *dev,
 {
 	pegasus_t *pegasus = netdev_priv(dev);
 
-	strlcpy(info->driver, driver_name, sizeof(info->driver));
+	strscpy(info->driver, driver_name, sizeof(info->driver));
 	usb_make_path(pegasus->usb, info->bus_info, sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 0f6efaabaa32..37a4d464769c 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -8604,11 +8604,11 @@ static void rtl8152_get_drvinfo(struct net_device *netdev,
 {
 	struct r8152 *tp = netdev_priv(netdev);
 
-	strlcpy(info->driver, MODULENAME, sizeof(info->driver));
-	strlcpy(info->version, DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->driver, MODULENAME, sizeof(info->driver));
+	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
 	usb_make_path(tp->udev, info->bus_info, sizeof(info->bus_info));
 	if (!IS_ERR_OR_NULL(tp->rtl_fw.fw))
-		strlcpy(info->fw_version, tp->rtl_fw.version,
+		strscpy(info->fw_version, tp->rtl_fw.version,
 			sizeof(info->fw_version));
 }
 
diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 3d2bf2acca94..97afd7335d86 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -769,8 +769,8 @@ static void rtl8150_get_drvinfo(struct net_device *netdev, struct ethtool_drvinf
 {
 	rtl8150_t *dev = netdev_priv(netdev);
 
-	strlcpy(info->driver, driver_name, sizeof(info->driver));
-	strlcpy(info->version, DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->driver, driver_name, sizeof(info->driver));
+	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
 	usb_make_path(dev->udev, info->bus_info, sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/usb/sierra_net.c b/drivers/net/usb/sierra_net.c
index bb4cbe8fc846..b3ae949e6f1c 100644
--- a/drivers/net/usb/sierra_net.c
+++ b/drivers/net/usb/sierra_net.c
@@ -612,8 +612,8 @@ static void sierra_net_get_drvinfo(struct net_device *net,
 {
 	/* Inherit standard device info */
 	usbnet_get_drvinfo(net, info);
-	strlcpy(info->driver, driver_name, sizeof(info->driver));
-	strlcpy(info->version, DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->driver, driver_name, sizeof(info->driver));
+	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
 }
 
 static u32 sierra_net_get_link(struct net_device *net)
diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index aaa89b4cfd50..fd399a8ed973 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1050,9 +1050,9 @@ void usbnet_get_drvinfo (struct net_device *net, struct ethtool_drvinfo *info)
 {
 	struct usbnet *dev = netdev_priv(net);
 
-	strlcpy (info->driver, dev->driver_name, sizeof info->driver);
-	strlcpy (info->fw_version, dev->driver_info->description,
-		sizeof info->fw_version);
+	strscpy(info->driver, dev->driver_name, sizeof(info->driver));
+	strscpy(info->fw_version, dev->driver_info->description,
+		sizeof(info->fw_version));
 	usb_make_path (dev->udev, info->bus_info, sizeof info->bus_info);
 }
 EXPORT_SYMBOL_GPL(usbnet_get_drvinfo);
diff --git a/drivers/net/veth.c b/drivers/net/veth.c
index 466da01ba2e3..550c85a366a0 100644
--- a/drivers/net/veth.c
+++ b/drivers/net/veth.c
@@ -128,8 +128,8 @@ static int veth_get_link_ksettings(struct net_device *dev,
 
 static void veth_get_drvinfo(struct net_device *dev, struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
 }
 
 static void veth_get_strings(struct net_device *dev, u32 stringset, u8 *buf)
diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index d934774e9733..ccb86c4aa446 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -2594,9 +2594,9 @@ static void virtnet_get_drvinfo(struct net_device *dev,
 	struct virtnet_info *vi = netdev_priv(dev);
 	struct virtio_device *vdev = vi->vdev;
 
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
-	strlcpy(info->version, VIRTNET_DRIVER_VERSION, sizeof(info->version));
-	strlcpy(info->bus_info, virtio_bus_name(vdev), sizeof(info->bus_info));
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->version, VIRTNET_DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->bus_info, virtio_bus_name(vdev), sizeof(info->bus_info));
 
 }
 
diff --git a/drivers/net/vmxnet3/vmxnet3_ethtool.c b/drivers/net/vmxnet3/vmxnet3_ethtool.c
index e2034adc3a1a..18cf7c723201 100644
--- a/drivers/net/vmxnet3/vmxnet3_ethtool.c
+++ b/drivers/net/vmxnet3/vmxnet3_ethtool.c
@@ -209,12 +209,12 @@ vmxnet3_get_drvinfo(struct net_device *netdev, struct ethtool_drvinfo *drvinfo)
 {
 	struct vmxnet3_adapter *adapter = netdev_priv(netdev);
 
-	strlcpy(drvinfo->driver, vmxnet3_driver_name, sizeof(drvinfo->driver));
+	strscpy(drvinfo->driver, vmxnet3_driver_name, sizeof(drvinfo->driver));
 
-	strlcpy(drvinfo->version, VMXNET3_DRIVER_VERSION_REPORT,
+	strscpy(drvinfo->version, VMXNET3_DRIVER_VERSION_REPORT,
 		sizeof(drvinfo->version));
 
-	strlcpy(drvinfo->bus_info, pci_name(adapter->pdev),
+	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
 }
 
diff --git a/drivers/net/vrf.c b/drivers/net/vrf.c
index 5df7a0abc39d..badf6f09ae51 100644
--- a/drivers/net/vrf.c
+++ b/drivers/net/vrf.c
@@ -1541,8 +1541,8 @@ static const struct l3mdev_ops vrf_l3mdev_ops = {
 static void vrf_get_drvinfo(struct net_device *dev,
 			    struct ethtool_drvinfo *info)
 {
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
 }
 
 static const struct ethtool_ops vrf_ethtool_ops = {
diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index c3285242f74f..939be2e148de 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -3313,8 +3313,8 @@ static int vxlan_validate(struct nlattr *tb[], struct nlattr *data[],
 static void vxlan_get_drvinfo(struct net_device *netdev,
 			      struct ethtool_drvinfo *drvinfo)
 {
-	strlcpy(drvinfo->version, VXLAN_VERSION, sizeof(drvinfo->version));
-	strlcpy(drvinfo->driver, "vxlan", sizeof(drvinfo->driver));
+	strscpy(drvinfo->version, VXLAN_VERSION, sizeof(drvinfo->version));
+	strscpy(drvinfo->driver, "vxlan", sizeof(drvinfo->driver));
 }
 
 static int vxlan_get_link_ksettings(struct net_device *dev,
diff --git a/drivers/net/wireless/ath/ath6kl/init.c b/drivers/net/wireless/ath/ath6kl/init.c
index 9b5c7d8f2b95..201e45554070 100644
--- a/drivers/net/wireless/ath/ath6kl/init.c
+++ b/drivers/net/wireless/ath/ath6kl/init.c
@@ -1014,7 +1014,7 @@ static int ath6kl_fetch_fw_apin(struct ath6kl *ar, const char *name)
 
 		switch (ie_id) {
 		case ATH6KL_FW_IE_FW_VERSION:
-			strlcpy(ar->wiphy->fw_version, data,
+			strscpy(ar->wiphy->fw_version, data,
 				min(sizeof(ar->wiphy->fw_version), ie_len+1));
 
 			ath6kl_dbg(ATH6KL_DBG_BOOT,
diff --git a/drivers/net/wireless/ath/carl9170/fw.c b/drivers/net/wireless/ath/carl9170/fw.c
index 1ab09e1c9ec5..4c1aecd1163c 100644
--- a/drivers/net/wireless/ath/carl9170/fw.c
+++ b/drivers/net/wireless/ath/carl9170/fw.c
@@ -105,7 +105,7 @@ static void carl9170_fw_info(struct ar9170 *ar)
 			 CARL9170FW_GET_MONTH(fw_date),
 			 CARL9170FW_GET_DAY(fw_date));
 
-		strlcpy(ar->hw->wiphy->fw_version, motd_desc->release,
+		strscpy(ar->hw->wiphy->fw_version, motd_desc->release,
 			sizeof(ar->hw->wiphy->fw_version));
 	}
 }
diff --git a/drivers/net/wireless/ath/wil6210/main.c b/drivers/net/wireless/ath/wil6210/main.c
index 7da87c9f363f..94e61dbe94f8 100644
--- a/drivers/net/wireless/ath/wil6210/main.c
+++ b/drivers/net/wireless/ath/wil6210/main.c
@@ -1305,7 +1305,7 @@ void wil_get_board_file(struct wil6210_priv *wil, char *buf, size_t len)
 			board_file = WIL_BOARD_FILE_NAME;
 	}
 
-	strlcpy(buf, board_file, len);
+	strscpy(buf, board_file, len);
 }
 
 static int wil_get_bl_info(struct wil6210_priv *wil)
diff --git a/drivers/net/wireless/ath/wil6210/netdev.c b/drivers/net/wireless/ath/wil6210/netdev.c
index 87a88f26233e..e76b38ad1d44 100644
--- a/drivers/net/wireless/ath/wil6210/netdev.c
+++ b/drivers/net/wireless/ath/wil6210/netdev.c
@@ -445,7 +445,7 @@ int wil_if_add(struct wil6210_priv *wil)
 
 	wil_dbg_misc(wil, "entered");
 
-	strlcpy(wiphy->fw_version, wil->fw_version, sizeof(wiphy->fw_version));
+	strscpy(wiphy->fw_version, wil->fw_version, sizeof(wiphy->fw_version));
 
 	rc = wiphy_register(wiphy);
 	if (rc < 0) {
diff --git a/drivers/net/wireless/ath/wil6210/wmi.c b/drivers/net/wireless/ath/wil6210/wmi.c
index ea7bd403e706..6a5976a2944c 100644
--- a/drivers/net/wireless/ath/wil6210/wmi.c
+++ b/drivers/net/wireless/ath/wil6210/wmi.c
@@ -780,7 +780,7 @@ static void wmi_evt_ready(struct wil6210_vif *vif, int id, void *d, int len)
 		return; /* FW load will fail after timeout */
 	}
 	/* ignore MAC address, we already have it from the boot loader */
-	strlcpy(wiphy->fw_version, wil->fw_version, sizeof(wiphy->fw_version));
+	strscpy(wiphy->fw_version, wil->fw_version, sizeof(wiphy->fw_version));
 
 	if (len > offsetof(struct wmi_ready_event, rfc_read_calib_result)) {
 		wil_dbg_wmi(wil, "rfc calibration result %d\n",
diff --git a/drivers/net/wireless/atmel/atmel.c b/drivers/net/wireless/atmel/atmel.c
index 0361c8eb2008..45d079b93384 100644
--- a/drivers/net/wireless/atmel/atmel.c
+++ b/drivers/net/wireless/atmel/atmel.c
@@ -1518,7 +1518,7 @@ struct net_device *init_atmel_card(unsigned short irq, unsigned long port,
 	priv->firmware = NULL;
 	priv->firmware_type = fw_type;
 	if (firmware) /* module parameter */
-		strlcpy(priv->firmware_id, firmware, sizeof(priv->firmware_id));
+		strscpy(priv->firmware_id, firmware, sizeof(priv->firmware_id));
 	priv->bus_type = card_present ? BUS_TYPE_PCCARD : BUS_TYPE_PCI;
 	priv->station_state = STATION_STATE_DOWN;
 	priv->do_rx_crc = 0;
diff --git a/drivers/net/wireless/broadcom/b43/leds.c b/drivers/net/wireless/broadcom/b43/leds.c
index 982a772a9d87..bfe1be345844 100644
--- a/drivers/net/wireless/broadcom/b43/leds.c
+++ b/drivers/net/wireless/broadcom/b43/leds.c
@@ -118,7 +118,7 @@ static int b43_register_led(struct b43_wldev *dev, struct b43_led *led,
 	led->wl = dev->wl;
 	led->index = led_index;
 	led->activelow = activelow;
-	strlcpy(led->name, name, sizeof(led->name));
+	strscpy(led->name, name, sizeof(led->name));
 	atomic_set(&led->state, 0);
 
 	led->led_dev.name = led->name;
diff --git a/drivers/net/wireless/broadcom/b43legacy/leds.c b/drivers/net/wireless/broadcom/b43legacy/leds.c
index 38b5be3a84e2..79e6fd205bfb 100644
--- a/drivers/net/wireless/broadcom/b43legacy/leds.c
+++ b/drivers/net/wireless/broadcom/b43legacy/leds.c
@@ -88,7 +88,7 @@ static int b43legacy_register_led(struct b43legacy_wldev *dev,
 	led->dev = dev;
 	led->index = led_index;
 	led->activelow = activelow;
-	strlcpy(led->name, name, sizeof(led->name));
+	strscpy(led->name, name, sizeof(led->name));
 
 	led->led_dev.name = led->name;
 	led->led_dev.default_trigger = default_trigger;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
index 7485e784be2a..372deeb69477 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
@@ -261,7 +261,7 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
 				     &revinfo, sizeof(revinfo));
 	if (err < 0) {
 		bphy_err(drvr, "retrieving revision info failed, %d\n", err);
-		strlcpy(ri->chipname, "UNKNOWN", sizeof(ri->chipname));
+		strscpy(ri->chipname, "UNKNOWN", sizeof(ri->chipname));
 	} else {
 		ri->vendorid = le32_to_cpu(revinfo.vendorid);
 		ri->deviceid = le32_to_cpu(revinfo.deviceid);
@@ -314,7 +314,7 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
 
 	/* locate firmware version number for ethtool */
 	ptr = strrchr(buf, ' ') + 1;
-	strlcpy(ifp->drvr->fwver, ptr, sizeof(ifp->drvr->fwver));
+	strscpy(ifp->drvr->fwver, ptr, sizeof(ifp->drvr->fwver));
 
 	/* Query for 'clmver' to get CLM version info from firmware */
 	memset(buf, 0, sizeof(buf));
@@ -424,11 +424,11 @@ static void brcmf_mp_attach(void)
 	 * if not set then if available use the platform data version. To make
 	 * sure it gets initialized at all, always copy the module param version
 	 */
-	strlcpy(brcmf_mp_global.firmware_path, brcmf_firmware_path,
+	strscpy(brcmf_mp_global.firmware_path, brcmf_firmware_path,
 		BRCMF_FW_ALTPATH_LEN);
 	if ((brcmfmac_pdata) && (brcmfmac_pdata->fw_alternative_path) &&
 	    (brcmf_mp_global.firmware_path[0] == '\0')) {
-		strlcpy(brcmf_mp_global.firmware_path,
+		strscpy(brcmf_mp_global.firmware_path,
 			brcmfmac_pdata->fw_alternative_path,
 			BRCMF_FW_ALTPATH_LEN);
 	}
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index bd164a0821f9..5516f7dc10c1 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -561,10 +561,10 @@ static void brcmf_ethtool_get_drvinfo(struct net_device *ndev,
 
 	if (drvr->revinfo.result == 0)
 		brcmu_dotrev_str(drvr->revinfo.driverrev, drev);
-	strlcpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
-	strlcpy(info->version, drev, sizeof(info->version));
-	strlcpy(info->fw_version, drvr->fwver, sizeof(info->fw_version));
-	strlcpy(info->bus_info, dev_name(drvr->bus_if->dev),
+	strscpy(info->driver, KBUILD_MODNAME, sizeof(info->driver));
+	strscpy(info->version, drev, sizeof(info->version));
+	strscpy(info->fw_version, drvr->fwver, sizeof(info->fw_version));
+	strscpy(info->bus_info, dev_name(drvr->bus_if->dev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
index b8379e4034a4..15e99d8865bd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
@@ -769,7 +769,7 @@ brcmf_fw_alloc_request(u32 chip, u32 chiprev,
 		fwnames[j].path[0] = '\0';
 		/* check if firmware path is provided by module parameter */
 		if (brcmf_mp_global.firmware_path[0] != '\0') {
-			strlcpy(fwnames[j].path, mp_path,
+			strscpy(fwnames[j].path, mp_path,
 				BRCMF_FW_NAME_LEN);
 
 			if (end != '/') {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
index d58525ebe618..a3d5030f6fe0 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
@@ -688,7 +688,7 @@ static void brcmf_fws_macdesc_set_name(struct brcmf_fws_info *fws,
 				       struct brcmf_fws_mac_descriptor *desc)
 {
 	if (desc == &fws->desc.other)
-		strlcpy(desc->name, "MAC-OTHER", sizeof(desc->name));
+		strscpy(desc->name, "MAC-OTHER", sizeof(desc->name));
 	else if (desc->mac_handle)
 		scnprintf(desc->name, sizeof(desc->name), "MAC-%d:%d",
 			  desc->mac_handle, desc->interface_id);
diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2100.c b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
index 5234511dac78..ac36c899134e 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2100.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
@@ -5907,8 +5907,8 @@ static void ipw_ethtool_get_drvinfo(struct net_device *dev,
 	struct ipw2100_priv *priv = libipw_priv(dev);
 	char fw_ver[64], ucode_ver[64];
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
 
 	ipw2100_get_fwversion(priv, fw_ver, sizeof(fw_ver));
 	ipw2100_get_ucodeversion(priv, ucode_ver, sizeof(ucode_ver));
@@ -5916,7 +5916,7 @@ static void ipw_ethtool_get_drvinfo(struct net_device *dev,
 	snprintf(info->fw_version, sizeof(info->fw_version), "%s:%d:%s",
 		 fw_ver, priv->eeprom_version, ucode_ver);
 
-	strlcpy(info->bus_info, pci_name(priv->pci_dev),
+	strscpy(info->bus_info, pci_name(priv->pci_dev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2200.c b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
index 029dacebe751..5b483de18c81 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2200.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2200.c
@@ -10424,8 +10424,8 @@ static void ipw_ethtool_get_drvinfo(struct net_device *dev,
 	char date[32];
 	u32 len;
 
-	strlcpy(info->driver, DRV_NAME, sizeof(info->driver));
-	strlcpy(info->version, DRV_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRV_NAME, sizeof(info->driver));
+	strscpy(info->version, DRV_VERSION, sizeof(info->version));
 
 	len = sizeof(vers);
 	ipw_get_ordinal(p, IPW_ORD_STAT_FW_VERSION, vers, &len);
@@ -10434,7 +10434,7 @@ static void ipw_ethtool_get_drvinfo(struct net_device *dev,
 
 	snprintf(info->fw_version, sizeof(info->fw_version), "%s (%s)",
 		 vers, date);
-	strlcpy(info->bus_info, pci_name(p->pci_dev),
+	strscpy(info->bus_info, pci_name(p->pci_dev),
 		sizeof(info->bus_info));
 }
 
diff --git a/drivers/net/wireless/intel/iwlegacy/3945-mac.c b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
index 846138d6e33d..7352d5b2095f 100644
--- a/drivers/net/wireless/intel/iwlegacy/3945-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/3945-mac.c
@@ -3254,7 +3254,7 @@ il3945_store_measurement(struct device *d, struct device_attribute *attr,
 
 	if (count) {
 		char *p = buffer;
-		strlcpy(buffer, buf, sizeof(buffer));
+		strscpy(buffer, buf, sizeof(buffer));
 		channel = simple_strtoul(p, NULL, 0);
 		if (channel)
 			params.channel = channel;
diff --git a/drivers/net/wireless/intersil/hostap/hostap_ioctl.c b/drivers/net/wireless/intersil/hostap/hostap_ioctl.c
index 0a376f112db9..4e0a0c881697 100644
--- a/drivers/net/wireless/intersil/hostap/hostap_ioctl.c
+++ b/drivers/net/wireless/intersil/hostap/hostap_ioctl.c
@@ -3848,7 +3848,7 @@ static void prism2_get_drvinfo(struct net_device *dev,
 	iface = netdev_priv(dev);
 	local = iface->local;
 
-	strlcpy(info->driver, "hostap", sizeof(info->driver));
+	strscpy(info->driver, "hostap", sizeof(info->driver));
 	snprintf(info->fw_version, sizeof(info->fw_version),
 		 "%d.%d.%d", (local->sta_fw_ver >> 16) & 0xff,
 		 (local->sta_fw_ver >> 8) & 0xff,
diff --git a/drivers/net/wireless/marvell/libertas/ethtool.c b/drivers/net/wireless/marvell/libertas/ethtool.c
index d8e4f29b690d..9f53308a9935 100644
--- a/drivers/net/wireless/marvell/libertas/ethtool.c
+++ b/drivers/net/wireless/marvell/libertas/ethtool.c
@@ -20,8 +20,8 @@ static void lbs_ethtool_get_drvinfo(struct net_device *dev,
 		priv->fwrelease >> 16 & 0xff,
 		priv->fwrelease >>  8 & 0xff,
 		priv->fwrelease       & 0xff);
-	strlcpy(info->driver, "libertas", sizeof(info->driver));
-	strlcpy(info->version, lbs_driver_version, sizeof(info->version));
+	strscpy(info->driver, "libertas", sizeof(info->driver));
+	strscpy(info->version, lbs_driver_version, sizeof(info->version));
 }
 
 /*
diff --git a/drivers/net/wireless/microchip/wilc1000/mon.c b/drivers/net/wireless/microchip/wilc1000/mon.c
index b5a1b65c087c..03b7229a0ff5 100644
--- a/drivers/net/wireless/microchip/wilc1000/mon.c
+++ b/drivers/net/wireless/microchip/wilc1000/mon.c
@@ -229,7 +229,7 @@ struct net_device *wilc_wfi_init_mon_interface(struct wilc *wl,
 		return NULL;
 
 	wl->monitor_dev->type = ARPHRD_IEEE80211_RADIOTAP;
-	strlcpy(wl->monitor_dev->name, name, IFNAMSIZ);
+	strscpy(wl->monitor_dev->name, name, IFNAMSIZ);
 	wl->monitor_dev->netdev_ops = &wilc_wfi_netdev_ops;
 	wl->monitor_dev->needs_free_netdev = true;
 
diff --git a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
index 1593e810b3ca..b71ed42188fc 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
@@ -1223,7 +1223,7 @@ int qtnf_wiphy_register(struct qtnf_hw_info *hw_info, struct qtnf_wmac *mac)
 			mac->macinfo.extended_capabilities_len;
 	}
 
-	strlcpy(wiphy->fw_version, hw_info->fw_version,
+	strscpy(wiphy->fw_version, hw_info->fw_version,
 		sizeof(wiphy->fw_version));
 	wiphy->hw_version = hw_info->hw_version;
 
diff --git a/drivers/net/wireless/quantenna/qtnfmac/commands.c b/drivers/net/wireless/quantenna/qtnfmac/commands.c
index 0fad53693292..b1b73478d89b 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/commands.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/commands.c
@@ -967,7 +967,7 @@ qtnf_cmd_resp_proc_hw_info(struct qtnf_bus *bus,
 		hwinfo->total_rx_chain, hwinfo->total_tx_chain,
 		hwinfo->fw_ver);
 
-	strlcpy(hwinfo->fw_version, bld_label, sizeof(hwinfo->fw_version));
+	strscpy(hwinfo->fw_version, bld_label, sizeof(hwinfo->fw_version));
 	hwinfo->hw_version = hw_ver;
 
 	return 0;
diff --git a/drivers/net/wireless/realtek/rtl818x/rtl8187/leds.c b/drivers/net/wireless/realtek/rtl818x/rtl8187/leds.c
index 49421d10e22b..f7d95c9624a0 100644
--- a/drivers/net/wireless/realtek/rtl818x/rtl8187/leds.c
+++ b/drivers/net/wireless/realtek/rtl818x/rtl8187/leds.c
@@ -143,7 +143,7 @@ static int rtl8187_register_led(struct ieee80211_hw *dev,
 	led->dev = dev;
 	led->ledpin = ledpin;
 	led->is_radio = is_radio;
-	strlcpy(led->name, name, sizeof(led->name));
+	strscpy(led->name, name, sizeof(led->name));
 
 	led->led_dev.name = led->name;
 	led->led_dev.default_trigger = default_trigger;
diff --git a/drivers/net/wireless/wl3501_cs.c b/drivers/net/wireless/wl3501_cs.c
index dad38fc04243..1b532e00a56f 100644
--- a/drivers/net/wireless/wl3501_cs.c
+++ b/drivers/net/wireless/wl3501_cs.c
@@ -1441,7 +1441,7 @@ static void wl3501_detach(struct pcmcia_device *link)
 static int wl3501_get_name(struct net_device *dev, struct iw_request_info *info,
 			   union iwreq_data *wrqu, char *extra)
 {
-	strlcpy(wrqu->name, "IEEE 802.11-DS", sizeof(wrqu->name));
+	strscpy(wrqu->name, "IEEE 802.11-DS", sizeof(wrqu->name));
 	return 0;
 }
 
@@ -1652,7 +1652,7 @@ static int wl3501_set_nick(struct net_device *dev, struct iw_request_info *info,
 
 	if (wrqu->data.length > sizeof(this->nick))
 		return -E2BIG;
-	strlcpy(this->nick, extra, wrqu->data.length);
+	strscpy(this->nick, extra, wrqu->data.length);
 	return 0;
 }
 
@@ -1661,7 +1661,7 @@ static int wl3501_get_nick(struct net_device *dev, struct iw_request_info *info,
 {
 	struct wl3501_card *this = netdev_priv(dev);
 
-	strlcpy(extra, this->nick, 32);
+	strscpy(extra, this->nick, 32);
 	wrqu->data.length = strlen(extra);
 	return 0;
 }
@@ -1965,7 +1965,7 @@ static int wl3501_config(struct pcmcia_device *link)
 	this->firmware_date[0]	= '\0';
 	this->rssi		= 255;
 	this->chan		= iw_default_channel(this->reg_domain);
-	strlcpy(this->nick, "Planet WL3501", sizeof(this->nick));
+	strscpy(this->nick, "Planet WL3501", sizeof(this->nick));
 	spin_lock_init(&this->lock);
 	init_waitqueue_head(&this->wait);
 	netif_start_queue(dev);
-- 
2.35.1

