Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A935A7071
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 00:16:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHM8n3yT6z3dqN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 08:16:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bvs8E5/f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mail.zeus03.de (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bvs8E5/f;
	dkim-atps=neutral
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHJ7H0nNJz2x9J
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 05:59:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=k1; bh=A8bVRCFI98pRUSlXVuZ0JuXQWSsk
	LWEPpZPSCxPQ4Yc=; b=bvs8E5/fix4EfPuCb+OWMHT6Bu46TU1l+IigRSvtvn9P
	EPjUjEMoaKMAh5zUmSlIUll78CFyvIAIO22BPo+YYx2/PHVMYseFmKF27NnJ760a
	yJnn+PLBTo5LOy0cZ+CcMvpCeYZvUs2xJ9oI/cferGF5V0ikEASasUiMDmVqo9M=
Received: (qmail 417445 invoked from network); 30 Aug 2022 21:59:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Aug 2022 21:59:10 +0200
X-UD-Smtp-Session: l3s3148p1@xaob0HrnKMEgAwDtxxrgAFH1RcxMblwv
Date: Tue, 30 Aug 2022 21:59:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] net: move from strlcpy with unused retval to strscpy
Message-ID: <Yw5sCpdgdR9k/mgs@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jay Vosburgh <j.vosburgh@gmail.com>,
	Veaceslav Falico <vfalico@gmail.com>,
	Andy Gospodarek <andy@greyhouse.net>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Steffen Klassert <klassert@kernel.org>,
	David Dillow <dave@thedillows.org>,
	Russell King <linux@armlinux.org.uk>,
	Ion Badulescu <ionut@badula.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Mark Einon <mark.einon@gmail.com>,
	Lino Sanfilippo <LinoSanfilippo@gmx.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jes Sorensen <jes@trained-monkey.org>,
	Shay Agroskin <shayagr@amazon.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>,
	Saeed Bishara <saeedb@amazon.com>, Don Fry <pcnet32@frontier.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Igor Russkikh <irusskikh@marvell.com>,
	Chris Snook <chris.snook@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Ariel Elior <aelior@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Doug Berger <opendmb@gmail.com>,
	Siva Reddy Kallam <siva.kallam@broadcom.com>,
	Prashant Sreedharan <prashant@broadcom.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Raju Rangoju <rajur@chelsio.com>,
	Ayush Sawal <ayush.sawal@chelsio.com>,
	Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
	Rohit Maheshwari <rohitm@chelsio.com>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Christian Benvenuti <benve@cisco.com>,
	Govindarajulu Varadarajan <_govind@gmx.com>,
	Denis Kirjanov <kda@linux-powerpc.org>,
	Ajit Khaparde <ajit.khaparde@broadcom.com>,
	Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
	Somnath Kotur <somnath.kotur@broadcom.com>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Li Yang <leoyang.li@nxp.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Douglas Miller <dougmill@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nick Child <nnac123@linux.ibm.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Guo-Fu Tseng <cooldavid@cooldavid.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Taras Chornyi <tchornyi@marvell.com>,
	Mirko Lindner <mlindner@marvell.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	Petr Machata <petrm@nvidia.com>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	UNGLinuxDriver@microchip.com, Chris Lee <christopher.lee@cspi.com>,
	Jon Mason <jdmason@kudzu.us>,
	Simon Horman <simon.horman@corigine.com>,
	Rain River <rain.1986.08.12@gmail.com>,
	Zhu Yanjun <zyjzyj2000@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Rahul Verma <rahulv@marvell.com>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com,
	Jiri Pirko <jiri@resnulli.us>, Byungho An <bh74.an@samsung.com>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	Francois Romieu <romieu@fr.zoreil.com>,
	Daniele Venzano <venza@brownhat.org>,
	Nicolas Pitre <nico@fluxnic.net>,
	Steve Glendinning <steve.glendinning@shawell.net>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Samuel Chessman <chessman@tux.org>,
	Geoff Levand <geoff@infradead.org>,
	Ishizaki Kou <kou.ishizaki@toshiba.co.jp>,
	Kevin Brace <kevinbrace@bracecomputerlab.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Krzysztof Halasa <khalasa@piap.pl>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Petko Manolov <petkan@nucleusys.com>,
	Oliver Neukum <oneukum@suse.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Ronak Doshi <doshir@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	David Ahern <dsahern@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Simon Kelley <simon@thekelleys.org.uk>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Stanislav Yakovlev <stas.yakovlev@gmail.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>, Jouni Malinen <j@w1.fi>,
	Ajay Singh <ajay.kathat@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Igor Mitsyanko <imitsyanko@quantenna.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Herton Ronaldo Krzesinski <herton@canonical.com>,
	Hin-Tak Leung <htl10@users.sourceforge.net>, netdev@vger.kernel.org,
	linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-acenic@sunsite.dk,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	intel-wired-lan@lists.osuosl.org,
	linux-mediatek@lists.infradead.org, linux-rdma@vger.kernel.org,
	oss-drivers@corigine.com, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org, linux-hyperv@vger.kernel.org,
	ntb@lists.linux.dev, linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com, libertas-dev@lists.infradead.org
References: <20220818210050.7108-1-wsa+renesas@sang-engineering.com>
 <20220822180551.160c2a0b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bu+qW3icU8857Hzl"
Content-Disposition: inline
In-Reply-To: <20220822180551.160c2a0b@kernel.org>
X-Mailman-Approved-At: Wed, 31 Aug 2022 08:14:47 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Igor Russkikh <irusskikh@marvell.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>, David Dillow <dave@thedillows.org>, Somnath Kotur <somnath.kotur@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, "K. Y. Srinivasan" <kys@microsoft.com>, linux-stm32@st-md-mailman.stormreply.com, Andy Gospodarek <andy@greyhouse.net>, Wei Liu <wei.liu@kernel.org>, Manish Chopra <manishc@marvell.com>, Samuel Holland <samuel@sholland.org>, Madalin Bucur <madalin.bucur@nxp.com>, Christian Lamparter <chunkeey@googlemail.com>, Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>, Franky Lin <franky.lin@broadcom.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Chris Lee <christopher.lee@cspi.com>, Nick Child <nnac123@linux.ibm.com>, Jiri Pirko <jiri@resnulli.us>, Jay Vosburgh <j.vosburgh@gmail.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>
 , Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Igor Mitsyanko <imitsyanko@quantenna.com>, Krzysztof Halasa <khalasa@piap.pl>, Shay Agroskin <shayagr@amazon.com>, linux-omap@vger.kernel.org, Petr Machata <petrm@nvidia.com>, libertas-dev@lists.infradead.org, Rasesh Mody <rmody@marvell.com>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Douglas Miller <dougmill@linux.ibm.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, Ralf Baechle <ralf@linux-mips.org>, Vivien Didelot <vivien.didelot@gmail.com>, Ion Badulescu <ionut@badula.org>, Hartley Sweeten <hsweeten@visionengravers.com>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, Jon Mason <jdmason@kudzu.us>, Vladimir Oltean <olteanv@gmail.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Christian Benvenuti <benve@cisco.com>, Samuel Chessman <chessman@tux.org>, linux-usb@vger.kernel.org, Ronak Doshi <doshir@vmware.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Chris Snook <chris.snook@gmail.com>, Deni
 s Kirjanov <kda@linux-powerpc.org>, Prashant Sreedharan <prashant@broadcom.com>, linux-kernel@vger.kernel.org, Daniele Venzano <venza@brownhat.org>, Eric Dumazet <edumazet@google.com>, Zhu Yanjun <zyjzyj2000@gmail.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Arthur Kiyanovski <akiyano@amazon.com>, Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Sergey Matyukevich <geomatsi@gmail.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, Rain River <rain.1986.08.12@gmail.com>, Veaceslav Falico <vfalico@gmail.com>, Martin Habets <habetsm.xilinx@gmail.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Wolfgang Grandegger <wg@grandegger.com>, Steve Glendinning <steve.glendinning@shawell.net>, Tom Lendacky <thomas.lendacky@amd.com>, Michael Hennerich <michael.hennerich@analog.com>, Ido Schimmel <idosch@nvidia.com>, Sean Wang <sean.wang@mediatek.com>, linuxppc-dev@lists.ozlabs.org, linux-can@vger.kernel.org, Siva Reddy Kallam <siva.kallam@broadcom.com>, Claudiu Manoil 
 <claudiu.manoil@nxp.com>, Doug Berger <opendmb@gmail.com>, Simon Kelley <simon@thekelleys.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, Mirko Lindner <mlindner@marvell.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Nicolas Pitre <nico@fluxnic.net>, David Arinzon <darinzon@amazon.com>, Rohit Maheshwari <rohitm@chelsio.com>, Tariq Toukan <tariqt@nvidia.com>, Sudarsana Kalluru <skalluru@marvell.com>, Taras Chornyi <tchornyi@marvell.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-mediatek@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>, linux-wireless@vger.kernel.org, Ajit Khaparde <ajit.khaparde@broadcom.com>, Petko Manolov <petkan@nucleusys.com>, Andreas Larsson <andreas@gaisler.com>, Jason Wang <jasowang@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, linux-hyperv@vger.kernel.org, oss-drivers@corigine.com, netdev@vger.kernel.org, Subbaraya Sundeep <sbhatta@marvell.com>, Hin-Tak Leung <htl10@users
 .sourceforge.net>, Jassi Brar <jaswinder.singh@linaro.org>, Noam Dagan <ndagan@amazon.com>, Stanislaw Gruszka <stf_xl@wp.pl>, Ajay Singh <ajay.kathat@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>, Dave Jiang <dave.jiang@intel.com>, linux-rdma@vger.kernel.org, Guo-Fu Tseng <cooldavid@cooldavid.org>, Dexuan Cui <decui@microsoft.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, b43-dev@lists.infradead.org, Simon Horman <simon.horman@corigine.com>, Paolo Abeni <pabeni@redhat.com>, Allen Hubbe <allenbh@gmail.com>, Shahed Shaikh <shshaikh@marvell.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Byungho An <bh74.an@samsung.com>, Haiyang Zhang <haiyangz@microsoft.com>, Francois Romieu <romieu@fr.zoreil.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, Don Fry <pcnet32@frontier.com>, John Crispin <john@phrozen.org>, Michael Chan <michael
 .chan@broadcom.com>, virtualization@lists.linux-foundation.org, Salil Mehta <salil.mehta@huawei.com>, GR-Linux-NIC-Dev@marvell.com, linux-parisc@vger.kernel.org, Geoff Levand <geoff@infradead.org>, linux-sunxi@lists.linux.dev, Edward Cree <ecree.xilinx@gmail.com>, Bryan Whitehead <bryan.whitehead@microchip.com>, Saeed Bishara <saeedb@amazon.com>, Mark Einon <mark.einon@gmail.com>, Geetha sowjanya <gakula@marvell.com>, Oliver Neukum <oneukum@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Govindarajulu Varadarajan <_govind@gmx.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ayush Sawal <ayush.sawal@chelsio.com>, UNGLinuxDriver@microchip.com, linux-acenic@sunsite.dk, Herton Ronaldo Krzesinski <herton@canonical.com>, Rahul Verma <rahulv@marvell.com>, Russell King <linux@armlinux.org.uk>, SHA-cyfmac-dev-list@infineon.com, Lino Sanfilippo <
 LinoSanfilippo@gmx.de>, intel-wired-lan@lists.osuosl.org, Steffen Klassert <klassert@kernel.org>, Sunil Goutham <sgoutham@marvell.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jes Sorensen <jes@trained-monkey.org>, nic_swsd@realtek.com, Ariel Elior <aelior@marvell.com>, Jouni Malinen <j@w1.fi>, Kalle Valo <kvalo@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Marcin Wojtas <mw@semihalf.com>, brcm80211-dev-list.pdl@broadcom.com, Sridhar Samudrala <sridhar.samudrala@intel.com>, David Ahern <dsahern@kernel.org>, linux-mips@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Stephen Hemminger <stephen@networkplumber.org>, hariprasad <hkelam@marvell.com>, ntb@lists.linux.dev, Raju Rangoju <rajur@chelsio.com>, Larry Finger <Larry.Finger@lwfinger.net>, Saeed Mahameed <saeedm@nvidia.com>, Felix Fietkau <nbd@nbd.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--bu+qW3icU8857Hzl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Unfortunately looks like patchwork was unable to ingest this change :(
> Not sure why.

vger rejected this mail because the header was too big. I updated my
scripts to estimate that before sending out.

> Would you mind splitting it into 3 chunks - wireless, ethernet,
> everything else, and resending? Let's see if that'll be small enough..

I did this and my scripts estimate that the patches will be small enough
now. Let's see...


--bu+qW3icU8857Hzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMObAUACgkQFA3kzBSg
KbYmbxAAhLDry8AFCMs0JeaOiDjRHrHjQEgpCeivV6b/gp/jt/RKiaPiEcHJAMtv
EIS+TTWc+VeHctybJ5IXx6ABcP64zEBQmcWaExve4a8QAEd5OBjFBqHMBNYLOjl3
2LGdKq94jeX80mkXitqnxGKCZHvD+3fv86hgce4psGaByDBgrtFvnCYOEMOAb/i/
QevZg2nDRS9Agwpz1u+L/byfiIP9L8n0FxFFkM8acJmU68E7zd1DZ4Zo0CKajVGa
7VuzjWEjYpIRrp6BQh+HCfL+FvHJoxE7euZQ+b5t4jOqEKZwsH8J2367g4NtnTQd
EE9vTTG1K07rfBoratigsH2yyNoi93cTR9mk7WgeYCSzFW5hyc/wrFM+tpIe9OUj
9mOstqkAgKfUeIrkpnH/e1S9S7J8iMehTSU8HvIrX+gyBDXn7IgFTizgT+Kb1N95
gyaciis4a5wdBiEJndYoQup2O94FRuqP4jvs3b6nU4DnspMrcp7OZ1iUYs2MJf/+
jqtbi6y3n3y+PyeB3yic/rT9OKhEMO06A+Th68Ys/EK5KFs71763znTEsqfqMAzs
HJZ6OhnNREklAf0x9E3jQbHD9I90WXUUp8OwiGVa7p+Y2kwa6L/PVTMon/J+97zk
AqapabC9SVMN1KMRdpPlCJsb0CViQ0aWpW2gmfmsNb42RjFBjdQ=
=9XVx
-----END PGP SIGNATURE-----

--bu+qW3icU8857Hzl--
