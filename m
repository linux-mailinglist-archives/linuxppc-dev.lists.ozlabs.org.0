Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EB659A972
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 01:30:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8dKH5wkbz3fKx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 09:30:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256 header.s=google header.b=QofUb7DJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=semihalf.com (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=mw@semihalf.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256 header.s=google header.b=QofUb7DJ;
	dkim-atps=neutral
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8RTP04Smz3c7y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 02:06:46 +1000 (AEST)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-f2a4c51c45so5692143fac.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=C/VkUkLDlA7UTo6eTiCDZwcwtLETboqa7t425d7cVFs=;
        b=QofUb7DJOdTcBKkHtRs4SbBflrFzOCIw2B9e+j2rPfVm3+DTUrJWEO4p4eDZy8jLZk
         opsdXQiUJ9WXgMaU1sxZmlc+wuYRoW1/xU68v5GngopvGwxsby5sDbM+TAAkskyyYVbJ
         v0/8DXCGDQYfB2r+7xmBiYCbNMDUeutJGNtIMunNcf4ImRmfm9wTwpQn2yZcEE6A3vN7
         qogadHylDWza51m4clAc74N/Ll8Gd4wv74ESdXlTG0n3xSP3k774PL52ShWjIF3wvopM
         uW6U6tKls0ZmmFGkjaspYpaTtF500g0bFsCrWBdvelWGz+7nuVgbOwF88CUVfE/Y3CHd
         rblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=C/VkUkLDlA7UTo6eTiCDZwcwtLETboqa7t425d7cVFs=;
        b=z0YFQpv0vCCuZARHk37nqWtG9F3EkxTSFQ0f1/DbqQIlE1JO3t0Y8cUEi6HHN5J/1t
         hn5OTpJ200FPse2iKoKIOaPX6BpYzBG2pmGF2KF0ZGDK606A6oHu6Gy+xj3a4ukQn+d8
         G46/3o3x8QzA6tR3hj5NLC0UWoGeI/CDguLT2qziUwu3y+8AfTXJ1fHGEkTiCzxxf+aD
         qr+I2l66ENfJtJW3jgJqbsL8jbttAR2v2Owh97TBI+JtT9qEDppsTSrd6/HLD1cxVyCf
         TFCAv0xaFRENdF3KhkpeGHFuT+op5s7IJm9Si8Edry0Ek87+Tdj8ipUu83DWQycphRS0
         6W4g==
X-Gm-Message-State: ACgBeo0FtdFw3i0J3ExjAx6LNeDMEqN5okZIM7JP6jpBMmSvBribof+b
	NB+eJSGBRbcMAVyKxKvObwQzAAGNyaRHTDG3mo2dfQ==
X-Google-Smtp-Source: AA6agR6Uut65noEds9DTEAIq4MQRn9wvqo20AqeK6lgjbB1e71ZoXHSsYUO7cMA7xG1TwfyTBeH7dfiOL39FELxWe+4=
X-Received: by 2002:a05:6870:a184:b0:116:bd39:7f94 with SMTP id
 a4-20020a056870a18400b00116bd397f94mr7002666oaf.5.1660925202008; Fri, 19 Aug
 2022 09:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220818210050.7108-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220818210050.7108-1-wsa+renesas@sang-engineering.com>
From: Marcin Wojtas <mw@semihalf.com>
Date: Fri, 19 Aug 2022 18:06:29 +0200
Message-ID: <CAPv3WKe2oxyjdyBrkDWwpSFKY21OtB4XEHz8YoWZ0LwhcLkNVw@mail.gmail.com>
Subject: Re: [PATCH] net: move from strlcpy with unused retval to strscpy
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 20 Aug 2022 09:27:17 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Igor Russkikh <irusskikh@marvell.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>, David Dillow <dave@thedillows.org>, Somnath Kotur <somnath.kotur@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, "K. Y. Srinivasan" <kys@microsoft.com>, linux-stm32@st-md-mailman.stormreply.com, Andy Gospodarek <andy@greyhouse.net>, Wei Liu <wei.liu@kernel.org>, Manish Chopra <manishc@marvell.com>, Samuel Holland <samuel@sholland.org>, Madalin Bucur <madalin.bucur@nxp.com>, Christian Lamparter <chunkeey@googlemail.com>, Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>, Franky Lin <franky.lin@broadcom.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Chris Lee <christopher.lee@cspi.com>, Nick Child <nnac123@linux.ibm.com>, Jiri Pirko <jiri@resnulli.us>, Jay Vosburgh <j.vosburgh@gmail.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>
 , Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Igor Mitsyanko <imitsyanko@quantenna.com>, Krzysztof Halasa <khalasa@piap.pl>, Shay Agroskin <shayagr@amazon.com>, linux-omap@vger.kernel.org, Petr Machata <petrm@nvidia.com>, libertas-dev@lists.infradead.org, Rasesh Mody <rmody@marvell.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Douglas Miller <dougmill@linux.ibm.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, Ralf Baechle <ralf@linux-mips.org>, Vivien Didelot <vivien.didelot@gmail.com>, Ion Badulescu <ionut@badula.org>, Hartley Sweeten <hsweeten@visionengravers.com>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, Jon Mason <jdmason@kudzu.us>, Vladimir Oltean <olteanv@gmail.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Christian Benvenuti <benve@cisco.com>, Samuel Chessman <chessman@tux.org>, linux-usb@vger.kernel.org, Ronak Doshi <doshir@vmware.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Chris Snook <chris.snook@gmail.com>, Deni
 s Kirjanov <kda@linux-powerpc.org>, Prashant Sreedharan <prashant@broadcom.com>, linux-kernel@vger.kernel.org, Daniele Venzano <venza@brownhat.org>, Eric Dumazet <edumazet@google.com>, Zhu Yanjun <zyjzyj2000@gmail.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Arthur Kiyanovski <akiyano@amazon.com>, Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Sergey Matyukevich <geomatsi@gmail.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Rain River <rain.1986.08.12@gmail.com>, Veaceslav Falico <vfalico@gmail.com>, Martin Habets <habetsm.xilinx@gmail.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Wolfgang Grandegger <wg@grandegger.com>, Steve Glendinning <steve.glendinning@shawell.net>, Tom Lendacky <thomas.lendacky@amd.com>, Michael Hennerich <michael.hennerich@analog.com>, Ido Schimmel <idosch@nvidia.com>, Sean Wang <sean.wang@mediatek.com>, linuxppc-dev@lists.ozlabs.org, linux-can@vger.kernel.org, Siva Reddy Kallam <siva.kallam@broadcom.com>, Claudiu Manoil 
 <claudiu.manoil@nxp.com>, Doug Berger <opendmb@gmail.com>, Simon Kelley <simon@thekelleys.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, Mirko Lindner <mlindner@marvell.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Nicolas Pitre <nico@fluxnic.net>, David Arinzon <darinzon@amazon.com>, Rohit Maheshwari <rohitm@chelsio.com>, Tariq Toukan <tariqt@nvidia.com>, Sudarsana Kalluru <skalluru@marvell.com>, Taras Chornyi <tchornyi@marvell.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-mediatek@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>, linux-wireless@vger.kernel.org, Ajit Khaparde <ajit.khaparde@broadcom.com>, Petko Manolov <petkan@nucleusys.com>, Andreas Larsson <andreas@gaisler.com>, Jason Wang <jasowang@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, linux-hyperv@vger.kernel.org, oss-drivers@corigine.com, netdev@vger.kernel.org, Subbaraya Sundeep <sbhatta@marvell.com>, Hin-Tak Leung <htl10@users
 .sourceforge.net>, Jassi Brar <jaswinder.singh@linaro.org>, Noam Dagan <ndagan@amazon.com>, Stanislaw Gruszka <stf_xl@wp.pl>, Ajay Singh <ajay.kathat@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>, Dave Jiang <dave.jiang@intel.com>, linux-rdma@vger.kernel.org, Guo-Fu Tseng <cooldavid@cooldavid.org>, Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, b43-dev@lists.infradead.org, Simon Horman <simon.horman@corigine.com>, Paolo Abeni <pabeni@redhat.com>, Allen Hubbe <allenbh@gmail.com>, Shahed Shaikh <shshaikh@marvell.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Byungho An <bh74.an@samsung.com>, Haiyang Zhang <haiyangz@microsoft.com>, Francois Romieu <romieu@fr.zoreil.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, Don Fry <pcnet32@frontier.com>, John Crispin <john@phrozen.org>, Michael Chan <michael
 .chan@broadcom.com>, virtualization@lists.linux-foundation.org, Salil Mehta <salil.mehta@huawei.com>, GR-Linux-NIC-Dev@marvell.com, linux-parisc@vger.kernel.org, Geoff Levand <geoff@infradead.org>, linux-sunxi@lists.linux.dev, Edward Cree <ecree.xilinx@gmail.com>, Bryan Whitehead <bryan.whitehead@microchip.com>, Saeed Bishara <saeedb@amazon.com>, Mark Einon <mark.einon@gmail.com>, Geetha sowjanya <gakula@marvell.com>, Oliver Neukum <oneukum@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Govindarajulu Varadarajan <_govind@gmx.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ayush Sawal <ayush.sawal@chelsio.com>, UNGLinuxDriver@microchip.com, linux-acenic@sunsite.dk, Herton Ronaldo Krzesinski <herton@canonical.com>, Rahul Verma <rahulv@marvell.com>, Russell King <linux@armlinux.org.uk>, SHA-cyfmac-dev-list@infineon.com, Lino Sanfilippo <
 LinoSanfilippo@gmx.de>, intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>, Steffen Klassert <klassert@kernel.org>, Sunil Goutham <sgoutham@marvell.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jes Sorensen <jes@trained-monkey.org>, nic_swsd@realtek.com, Ariel Elior <aelior@marvell.com>, Jouni Malinen <j@w1.fi>, Kalle Valo <kvalo@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, brcm80211-dev-list.pdl@broadcom.com, Sridhar Samudrala <sridhar.samudrala@intel.com>, David Ahern <dsahern@kernel.org>, linux-mips@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Stephen Hemminger <stephen@networkplumber.org>, hariprasad <hkelam@marvell.com>, ntb@lists.linux.dev, Raju Rangoju <rajur@chelsio.com>, Larry Finger <Larry.Finger@lwfinger.net>, Saeed Mahameed <saeedm@nvidia.com>, Felix Fietkau <nbd@nbd.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

czw., 18 sie 2022 o 23:01 Wolfram Sang
<wsa+renesas@sang-engineering.com> napisa=C5=82(a):
>
> Follow the advice of the below link and prefer 'strscpy' in this
> subsystem. Conversion is 1:1 because the return value is not used.
> Generated by a coccinelle script.
>
> Link: https://lore.kernel.org/r/CAHk-=3DwgfRnXz0W3D37d01q3JFkr_i_uTL=3DV6=
A6G1oUZcprmknw@mail.gmail.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/net/Space.c                              |  2 +-
>  drivers/net/bonding/bond_main.c                  |  2 +-
>  drivers/net/can/sja1000/peak_pcmcia.c            |  2 +-
>  drivers/net/can/usb/peak_usb/pcan_usb_core.c     |  2 +-
>  drivers/net/dsa/b53/b53_common.c                 |  2 +-
>  drivers/net/dsa/bcm_sf2_cfp.c                    |  2 +-
>  drivers/net/dsa/hirschmann/hellcreek.c           |  2 +-
>  drivers/net/dsa/mv88e6xxx/chip.c                 |  2 +-
>  drivers/net/dummy.c                              |  2 +-
>  drivers/net/ethernet/3com/3c509.c                |  2 +-
>  drivers/net/ethernet/3com/3c515.c                |  2 +-
>  drivers/net/ethernet/3com/3c589_cs.c             |  2 +-
>  drivers/net/ethernet/3com/3c59x.c                |  6 +++---
>  drivers/net/ethernet/3com/typhoon.c              |  8 ++++----
>  drivers/net/ethernet/8390/ax88796.c              |  6 +++---
>  drivers/net/ethernet/8390/etherh.c               |  6 +++---
>  drivers/net/ethernet/adaptec/starfire.c          |  4 ++--
>  drivers/net/ethernet/aeroflex/greth.c            |  4 ++--
>  drivers/net/ethernet/agere/et131x.c              |  4 ++--
>  drivers/net/ethernet/alacritech/slicoss.c        |  4 ++--
>  drivers/net/ethernet/allwinner/sun4i-emac.c      |  4 ++--
>  drivers/net/ethernet/alteon/acenic.c             |  4 ++--
>  drivers/net/ethernet/amazon/ena/ena_ethtool.c    |  4 ++--
>  drivers/net/ethernet/amazon/ena/ena_netdev.c     |  2 +-
>  drivers/net/ethernet/amd/amd8111e.c              |  4 ++--
>  drivers/net/ethernet/amd/au1000_eth.c            |  2 +-
>  drivers/net/ethernet/amd/nmclan_cs.c             |  2 +-
>  drivers/net/ethernet/amd/pcnet32.c               |  4 ++--
>  drivers/net/ethernet/amd/sunlance.c              |  2 +-
>  drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c     |  4 ++--
>  .../net/ethernet/aquantia/atlantic/aq_ethtool.c  |  2 +-
>  drivers/net/ethernet/arc/emac_main.c             |  2 +-
>  drivers/net/ethernet/atheros/ag71xx.c            |  4 ++--
>  .../net/ethernet/atheros/atl1c/atl1c_ethtool.c   |  4 ++--
>  .../net/ethernet/atheros/atl1e/atl1e_ethtool.c   |  6 +++---
>  drivers/net/ethernet/atheros/atlx/atl1.c         |  4 ++--
>  drivers/net/ethernet/atheros/atlx/atl2.c         |  6 +++---
>  drivers/net/ethernet/broadcom/b44.c              |  6 +++---
>  drivers/net/ethernet/broadcom/bcm63xx_enet.c     |  4 ++--
>  drivers/net/ethernet/broadcom/bcmsysport.c       |  4 ++--
>  drivers/net/ethernet/broadcom/bgmac.c            |  6 +++---
>  drivers/net/ethernet/broadcom/bnx2.c             |  6 +++---
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c  |  2 +-
>  .../net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c  |  6 +++---
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c |  2 +-
>  .../net/ethernet/broadcom/bnx2x/bnx2x_sriov.h    |  2 +-
>  drivers/net/ethernet/broadcom/bnx2x/bnx2x_vfpf.c |  2 +-
>  .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c    |  8 ++++----
>  drivers/net/ethernet/broadcom/bnxt/bnxt_vfr.c    |  2 +-
>  drivers/net/ethernet/broadcom/genet/bcmgenet.c   |  2 +-
>  drivers/net/ethernet/broadcom/tg3.c              |  6 +++---
>  drivers/net/ethernet/brocade/bna/bnad_ethtool.c  |  6 +++---
>  drivers/net/ethernet/cavium/octeon/octeon_mgmt.c |  2 +-
>  .../net/ethernet/cavium/thunder/nicvf_ethtool.c  |  4 ++--
>  drivers/net/ethernet/chelsio/cxgb/cxgb2.c        |  4 ++--
>  drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c  |  4 ++--
>  .../net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c   |  4 ++--
>  drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c  |  4 ++--
>  .../net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c  |  4 ++--
>  .../chelsio/inline_crypto/chtls/chtls_main.c     |  2 +-
>  drivers/net/ethernet/cirrus/ep93xx_eth.c         |  2 +-
>  drivers/net/ethernet/cisco/enic/enic_ethtool.c   |  6 +++---
>  drivers/net/ethernet/davicom/dm9000.c            |  4 ++--
>  drivers/net/ethernet/dec/tulip/de2104x.c         |  4 ++--
>  drivers/net/ethernet/dec/tulip/dmfe.c            |  4 ++--
>  drivers/net/ethernet/dec/tulip/tulip_core.c      |  4 ++--
>  drivers/net/ethernet/dec/tulip/uli526x.c         |  4 ++--
>  drivers/net/ethernet/dec/tulip/winbond-840.c     |  4 ++--
>  drivers/net/ethernet/dlink/dl2k.c                |  4 ++--
>  drivers/net/ethernet/dlink/sundance.c            |  4 ++--
>  drivers/net/ethernet/dnet.c                      |  4 ++--
>  drivers/net/ethernet/emulex/benet/be_cmds.c      | 12 ++++++------
>  drivers/net/ethernet/emulex/benet/be_ethtool.c   |  6 +++---
>  drivers/net/ethernet/faraday/ftgmac100.c         |  4 ++--
>  drivers/net/ethernet/faraday/ftmac100.c          |  4 ++--
>  drivers/net/ethernet/fealnx.c                    |  4 ++--
>  .../net/ethernet/freescale/dpaa/dpaa_ethtool.c   |  4 ++--
>  drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c |  2 +-
>  .../net/ethernet/freescale/enetc/enetc_ethtool.c |  4 ++--
>  drivers/net/ethernet/freescale/fec_main.c        |  8 ++++----
>  drivers/net/ethernet/freescale/fec_ptp.c         |  2 +-
>  .../ethernet/freescale/fs_enet/fs_enet-main.c    |  2 +-
>  drivers/net/ethernet/freescale/gianfar_ethtool.c |  2 +-
>  .../net/ethernet/freescale/ucc_geth_ethtool.c    |  4 ++--
>  drivers/net/ethernet/fujitsu/fmvj18x_cs.c        |  4 ++--
>  drivers/net/ethernet/hisilicon/hip04_eth.c       |  4 ++--
>  drivers/net/ethernet/ibm/ehea/ehea_ethtool.c     |  4 ++--
>  drivers/net/ethernet/ibm/emac/core.c             |  4 ++--
>  drivers/net/ethernet/ibm/ibmveth.c               |  4 ++--
>  drivers/net/ethernet/intel/e100.c                |  4 ++--
>  drivers/net/ethernet/intel/e1000/e1000_ethtool.c |  4 ++--
>  drivers/net/ethernet/intel/e1000e/ethtool.c      |  4 ++--
>  drivers/net/ethernet/intel/e1000e/netdev.c       |  6 +++---
>  drivers/net/ethernet/intel/i40e/i40e_ethtool.c   |  6 +++---
>  drivers/net/ethernet/intel/i40e/i40e_main.c      | 16 ++++++++--------
>  drivers/net/ethernet/intel/i40e/i40e_ptp.c       |  2 +-
>  drivers/net/ethernet/intel/iavf/iavf_ethtool.c   |  6 +++---
>  drivers/net/ethernet/intel/igb/igb_ethtool.c     |  6 +++---
>  drivers/net/ethernet/intel/igb/igb_main.c        |  2 +-
>  drivers/net/ethernet/intel/igbvf/ethtool.c       |  4 ++--
>  drivers/net/ethernet/intel/ixgb/ixgb_ethtool.c   |  4 ++--
>  drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c |  6 +++---
>  drivers/net/ethernet/intel/ixgbe/ixgbe_fcoe.c    |  2 +-
>  drivers/net/ethernet/intel/ixgbe/ixgbe_main.c    |  4 ++--
>  drivers/net/ethernet/intel/ixgbevf/ethtool.c     |  4 ++--
>  drivers/net/ethernet/jme.c                       |  6 +++---
>  drivers/net/ethernet/korina.c                    |  6 +++---
>  drivers/net/ethernet/marvell/mv643xx_eth.c       |  8 ++++----
>  drivers/net/ethernet/marvell/mvneta.c            |  6 +++---
>  drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c  |  6 +++---

For: drivers/net/ethernet/marvell/mvpp2

Acked-by: Marcin Wojtas <mw@semihalf.com>

Thanks,
Marcin
