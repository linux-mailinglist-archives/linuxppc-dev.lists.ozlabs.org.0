Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDB135F453
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 14:57:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL2Ym3yxJz30Mp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 22:57:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=VZL40Qx/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=VZL40Qx/; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL2YJ2jyHz2yxv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 22:56:50 +1000 (AEST)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E331F22236;
 Wed, 14 Apr 2021 14:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618404993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nIqcTyZ0aGklq+mdSHotuPklBOhZa+ud8+bN5Q5+CPw=;
 b=VZL40Qx/ZFqrvlYpNa+CpUnri3A5IcdLrj+2SxpxVHAI8fYpizPcSIOU0o4IGsNgU2L8zb
 buzdqfa91h/T+Kc3jCccsyXkXKwvO0deOpvm1xgmDARKkJkG9wKdcW8QSFZ/zWqZRgSGou
 k2tTqyTzN0TuoPWxydGMvbSU0aMYGjo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 14 Apr 2021 14:56:30 +0200
From: Michael Walle <michael@walle.cc>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH net-next v2 1/2] of: net: pass the dst buffer to
 of_get_mac_address()
In-Reply-To: <20210414053336.GQ6021@kadam>
References: <20210414053336.GQ6021@kadam>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <cf5c86dd6492b9c1907ea69e2d660eb2@walle.cc>
X-Sender: michael@walle.cc
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
Cc: kbuild-all@lists.01.org, lkp@intel.com, netdev@vger.kernel.org,
 kbuild@lists.01.org, linux-kernel@vger.kernel.org,
 ath9k-devel@qca.qualcomm.com, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 UNGLinuxDriver@microchip.com, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Dan,

Am 2021-04-14 07:33, schrieb Dan Carpenter:
> url:
> https://github.com/0day-ci/linux/commits/Michael-Walle/of-net-support-non-platform-devices-in-of_get_mac_address/20210406-234030
> base:
> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
> cc0626c2aaed8e475efdd85fa374b497a7192e35
> config: x86_64-randconfig-m001-20210406 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2069 axienet_probe()
> warn: passing a valid pointer to 'PTR_ERR'
> 
> vim +/PTR_ERR +2069 drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> 
> 522856cefaf09d Robert Hancock      2019-06-06  2060  	/* Check for
> Ethernet core IRQ (optional) */
> 522856cefaf09d Robert Hancock      2019-06-06  2061  	if (lp->eth_irq 
> <= 0)
> 522856cefaf09d Robert Hancock      2019-06-06  2062
> 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
> 522856cefaf09d Robert Hancock      2019-06-06  2063
> 8a3b7a252dca9f Daniel Borkmann     2012-01-19  2064  	/* Retrieve the
> MAC address */
> 411b125c6ace1f Michael Walle       2021-04-06  2065  	ret =
> of_get_mac_address(pdev->dev.of_node, mac_addr);
> 411b125c6ace1f Michael Walle       2021-04-06  2066  	if (!ret) {
> 411b125c6ace1f Michael Walle       2021-04-06  2067
> 		axienet_set_mac_address(ndev, mac_addr);
> 411b125c6ace1f Michael Walle       2021-04-06  2068  	} else {
> d05a9ed5c3a773 Robert Hancock      2019-06-06 @2069
> 		dev_warn(&pdev->dev, "could not find MAC address property: %ld\n",
> d05a9ed5c3a773 Robert Hancock      2019-06-06  2070  			 
> PTR_ERR(mac_addr));
> 
>   ^^^^^^^^^^^^^^^^^
> This should print "ret".

Thanks, this was fixed (in the now merged) v4. I forgot
to add you to that huge CC list. Sorry for that.

-michael
