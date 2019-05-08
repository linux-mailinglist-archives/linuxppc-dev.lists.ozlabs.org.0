Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 008E91795D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 14:23:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zbH911x1zDqLT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 22:23:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="rwrtMH5v"; 
 dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zbFR0lxxzDqH4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 22:22:02 +1000 (AEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x48CJBEV086953;
 Wed, 8 May 2019 12:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=Vy0vJPC+R/qK4BTy9W8k2EK+1DkuBwwYmX4Im7RV/1I=;
 b=rwrtMH5vFY76MnriFuwWJRty7cv6d48ndLvoH9qa0iSpe18cQhaRn84K+EEAZ1el4f/y
 JYXzNPHiRG6Um3c2LeXmrh0vIUgokB68rrApoaQDWIhQiq3xdWk5gSEBW5t2CsNm+NQD
 vMj6o0elaMb6F0MU58KC4FWtRSn89CRe22TBfRL7zCGITD8/HSnJoDvmL6xh8b//HGVN
 0/+i+9yb5Er16ot7xGaUWYdgVLnSKYTBDh5U+VgaaiAGanyy3YqtlO3+pRPaxxQxAHqK
 Taf9LSC6aD/fmeyve7zi016PT3fCR2HgfwqDVjH/4iBaBbfLBHPj+ptzQwZZXQN8uHEa Qg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 2s94b63etg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 May 2019 12:20:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x48CJL8V107697;
 Wed, 8 May 2019 12:20:30 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2s94ag20en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 May 2019 12:20:30 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x48CKNew007185;
 Wed, 8 May 2019 12:20:24 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 08 May 2019 05:20:22 -0700
Date: Wed, 8 May 2019 15:20:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alexandru Ardelean <alexandru.ardelean@analog.com>
Subject: Re: [PATCH 09/16] mmc: sdhci-xenon: use new match_string()
 helper/macro
Message-ID: <20190508122010.GC21059@kadam>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
 <20190508112842.11654-11-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508112842.11654-11-alexandru.ardelean@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=644
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905080079
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9250
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=665 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905080079
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-pci@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 andriy.shevchenko@linux.intel.com, linux-rockchip@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 cgroups@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 08, 2019 at 02:28:35PM +0300, Alexandru Ardelean wrote:
> -static const char * const phy_types[] = {
> -	"emmc 5.0 phy",
> -	"emmc 5.1 phy"
> -};
> -
>  enum xenon_phy_type_enum {
>  	EMMC_5_0_PHY,
>  	EMMC_5_1_PHY,
>  	NR_PHY_TYPES

There is no need for NR_PHY_TYPES now so you could remove that as well.

regards,
dan carpenter

