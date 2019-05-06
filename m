Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA3915024
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 17:27:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yRRy2WVzzDqDb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 01:27:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="qEzSeP3a"; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yR3K50JCzDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 01:09:07 +1000 (AEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46F3o4l106193;
 Mon, 6 May 2019 15:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2018-07-02;
 bh=rDJ/z/pPRZKtR5JzVGMLLDer4402GB87zt7n/gU4krU=;
 b=qEzSeP3aGTDv3s9znu1nX/m58g0qTnZdtpwUK1CQGRD3KDy2qgkIaoxVFwc/d6ws7egj
 wKcF47zucTRQ/UMQoV42jXTQnbrbo1me39YFnJGDlEghnI+xb8AKzpb70cRdkMZYEd2i
 len4M5CrDAbyEt9xWopCKmPOhQ1DHZBZz2BVpO0aHb8kNHooK6KP9UxzWxV3heh1s/+S
 IHEkd4K6qpvVJkObdyJWwYVF8oJH/PC9ukV87kuCFZ0lYFIYkXaJDTX3G+9dvHxZvWPI
 nWzAzWFZ7lixcllZPY2dSxcuLuG3RnRzQi3Z0oyn9pQKiKyurW1w7pvqKKcLmRZUpPQq YQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2s94b0f811-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 May 2019 15:08:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46F6wpr045484;
 Mon, 6 May 2019 15:08:01 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2s94b8y1bu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 May 2019 15:08:01 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x46F7gJH005600;
 Mon, 6 May 2019 15:07:42 GMT
Received: from kadam (/196.110.137.40) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 06 May 2019 08:07:42 -0700
Date: Mon, 6 May 2019 18:07:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Subject: Re: [PATCH net-next 1/3] net: ethernet: support of_get_mac_address
 new ERR_PTR error
Message-ID: <20190506150713.GH2269@kadam>
References: <1557136717-531-1-git-send-email-ynezz@true.cz>
 <1557136717-531-2-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1557136717-531-2-git-send-email-ynezz@true.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9249
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=814
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060130
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9249
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=845 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905060130
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
Cc: Andrew Lunn <andrew@lunn.ch>, Thor Thayer <thor.thayer@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Byungho An <bh74.an@samsung.com>, Frank Rowand <frowand.list@gmail.com>,
 John Linn <John.Linn@xilinx.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Vipul Pandya <vipul.pandya@samsung.com>, linux-renesas-soc@vger.kernel.org,
 Felix Fietkau <nbd@openwrt.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, bcm-kernel-feedback-list@broadcom.com,
 Sylvain Lemieux <slemieux.tyco@gmail.com>, Sunil Goutham <sgoutham@cavium.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 nios2-dev@lists.rocketboards.org, devel@driverdev.osuosl.org,
 Grygorii Strashko <grygorii.strashko@ti.com>, Robert Richter <rric@kernel.org>,
 Girish K S <ks.giri@samsung.com>, Nelson Chang <nelson.chang@mediatek.com>,
 Wingman Kwok <w-kwok2@ti.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Sean Wang <sean.wang@mediatek.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Doug Berger <opendmb@gmail.com>,
 linux-mediatek@lists.infradead.org, Murali Karicheri <m-karicheri2@ti.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Mirko Lindner <mlindner@marvell.com>,
 Salil Mehta <salil.mehta@huawei.com>, Fugang Duan <fugang.duan@nxp.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Stephen Hemminger <stephen@networkplumber.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Anirudha Sarangi <anirudh@xilinx.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 06, 2019 at 11:58:35AM +0200, Petr Štetiar wrote:
> There was NVMEM support added to of_get_mac_address, so it could now return
> ERR_PTR encoded error values, so we need to adjust all current users of
> of_get_mac_address to this new fact.

We need a Fixes tag so we can look at the commit which adds NVMEM
support.

It's not clear to me that anyone ever applied that patch.  If not then
who hoo!  Let's not apply it.  But if it has been committed then it has
a git hash.

regards,
dan carpenter
