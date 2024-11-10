Return-Path: <linuxppc-dev+bounces-3077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDD19C31F9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2024 13:38:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmXK730rBz2xBf;
	Sun, 10 Nov 2024 23:38:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731242299;
	cv=none; b=lPw+R5ROr41zUQejtLQCbR0WTgC5e+lc0xxtmnGbC2bVq8KlOHbn39BHrM3wXQAebjXJDooJZho6XO15FOT4IkV+gKgNtJuA11j3+d/grDy3Jj7xPOExlVoiwW5RhUVvrDufc55Vkqulo7VzVNul4v2nm6PMDcmKY25rv836S9qY+qFZan4s6Y1mQ3I4EISeOifTknwuWB0GoLTb7BdKWTDJaeqbshovsK5g7mhrQp2SwK8Pug7U3DQbfYAag55H9qJFoGAkLe61qQdcL7M2gvtY0J2S93vQHfdnQhHMOKLO+fGCt17dxXzoVB0akHPdcegF/WxUw5PVD/MyE9a+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731242299; c=relaxed/relaxed;
	bh=C3mVIzg0vgpf5YZvQ6oURiQ38jTGnrFaJxMixyqD3lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOJg7dbPFDDVK3uUTLaeUnwdJnjjakvtILZw4k+a/JFwCINLgZR62ADI+/HU1HUv6C1urBsG/0oSyIoj72zjT2BBOy3NAPLp0/Bof+IdKyY65AmHsA0XMSQGyoejdecl08X7ExE0FiHZs+ZB3CdXL72+dEIuEiWyTFlgjtdZiuVkRLVFvhZLId60LQ1wnI3KBAzTlZqxYXXPaR1ssXY3pb8cMVzrJgXyzfcLK8b62PUh5xP8AVM5OJGDn+86ZydNTD2n/Gn+1ElC45LrZsYBVhYFBPFjfZyt+i9Ss0I6YCR/nxmF2sjA+ZuOlwLiWUXnkqJq8nQFtn6/ZrmPwfdH2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cqF6Kfho; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cqF6Kfho;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XmXK442j6z2x9W
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2024 23:38:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731242297; x=1762778297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BLOmLROXbeRAj676Bfm9SCd5IA1Y5+b/3pvlnBIMq1M=;
  b=cqF6KfhoPJdNVhaJVI0jUsP9s0huERiIaSXcAqIlFsu/DTBongHezn7V
   /wlprHPAVb+uRA5KEiMhqXeaGXInLbl3KJzZg5S+vdIuE1i0AAE52vva7
   NH7f8k2rMyDsZvJflbQVmRvoAD3CgmzuJf+HHhyysPN1lVww9QJc1AdWI
   V8Oi4dszEpB4OZIf4hUlP8NNzsZVN6JDiEfHrZS2wInqzlov3Gw0ChhJn
   xe7dJ2mRHatc/JqWY+XqGMtCt5wMGbfmuosf7IhqguDAqXapaxhdGcN7X
   AJxuYze4hL5T3PiaOod+3/WgAZ5dYpxMoaIxiMH7fMMmjF3BYsIX3yz2x
   Q==;
X-CSE-ConnectionGUID: VDTWMcI2TSiifIJ0xkFj4w==
X-CSE-MsgGUID: sQ/+qI0YTTquerqZLeVKDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="42450142"
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="42450142"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 04:38:10 -0800
X-CSE-ConnectionGUID: GE9kT4zXT7eyGYgFWs0yYA==
X-CSE-MsgGUID: p/GKVJBTTayT+22ykQ88cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,143,1728975600"; 
   d="scan'208";a="117275150"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2024 04:38:01 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tA7CY-00008n-0B;
	Sun, 10 Nov 2024 12:37:58 +0000
Date: Sun, 10 Nov 2024 20:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vladimir Oltean <olteanv@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Byungho An <bh74.an@samsung.com>,
	Kevin Brace <kevinbrace@bracecomputerlab.com>,
	Francois Romieu <romieu@fr.zoreil.com>,
	Michal Simek <monstr@monstr.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Zhao Qiang <qiang.zhao@nxp.com>, linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next] net: use pdev instead of OF funcs
Message-ID: <202411102000.aEYCgzAp-lkp@intel.com>
References: <20241109233821.8619-1-rosenp@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109233821.8619-1-rosenp@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/net-use-pdev-instead-of-OF-funcs/20241110-073939
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241109233821.8619-1-rosenp%40gmail.com
patch subject: [PATCH net-next] net: use pdev instead of OF funcs
config: arm-moxart_defconfig (https://download.01.org/0day-ci/archive/20241110/202411102000.aEYCgzAp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411102000.aEYCgzAp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411102000.aEYCgzAp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/moxa/moxart_ether.c: In function 'moxart_mac_probe':
>> drivers/net/ethernet/moxa/moxart_ether.c:457:29: warning: unused variable 'node' [-Wunused-variable]
     457 |         struct device_node *node = p_dev->of_node;
         |                             ^~~~


vim +/node +457 drivers/net/ethernet/moxa/moxart_ether.c

6c821bd9edc956 Jonas Jensen      2013-08-08  453  
6c821bd9edc956 Jonas Jensen      2013-08-08  454  static int moxart_mac_probe(struct platform_device *pdev)
6c821bd9edc956 Jonas Jensen      2013-08-08  455  {
6c821bd9edc956 Jonas Jensen      2013-08-08  456  	struct device *p_dev = &pdev->dev;
6c821bd9edc956 Jonas Jensen      2013-08-08 @457  	struct device_node *node = p_dev->of_node;
6c821bd9edc956 Jonas Jensen      2013-08-08  458  	struct net_device *ndev;
6c821bd9edc956 Jonas Jensen      2013-08-08  459  	struct moxart_mac_priv_t *priv;
6c821bd9edc956 Jonas Jensen      2013-08-08  460  	struct resource *res;
6c821bd9edc956 Jonas Jensen      2013-08-08  461  	unsigned int irq;
6c821bd9edc956 Jonas Jensen      2013-08-08  462  	int ret;
6c821bd9edc956 Jonas Jensen      2013-08-08  463  
6c821bd9edc956 Jonas Jensen      2013-08-08  464  	ndev = alloc_etherdev(sizeof(struct moxart_mac_priv_t));
6c821bd9edc956 Jonas Jensen      2013-08-08  465  	if (!ndev)
6c821bd9edc956 Jonas Jensen      2013-08-08  466  		return -ENOMEM;
6c821bd9edc956 Jonas Jensen      2013-08-08  467  
c22f4680de3d5a Rosen Penev       2024-11-09  468  	irq = platform_get_irq(pdev, 0);
6c821bd9edc956 Jonas Jensen      2013-08-08  469  	if (irq <= 0) {
c22f4680de3d5a Rosen Penev       2024-11-09  470  		netdev_err(ndev, "platform_get_irq failed\n");
bdfd6304c8e243 Wei Yongjun       2013-10-08  471  		ret = -EINVAL;
bdfd6304c8e243 Wei Yongjun       2013-10-08  472  		goto irq_map_fail;
6c821bd9edc956 Jonas Jensen      2013-08-08  473  	}
6c821bd9edc956 Jonas Jensen      2013-08-08  474  
6c821bd9edc956 Jonas Jensen      2013-08-08  475  	priv = netdev_priv(ndev);
6c821bd9edc956 Jonas Jensen      2013-08-08  476  	priv->ndev = ndev;
5dac33ad6f0d1d Christoph Hellwig 2019-02-11  477  	priv->pdev = pdev;
6c821bd9edc956 Jonas Jensen      2013-08-08  478  
35cba15a504bf4 Yang Yingliang    2021-06-07  479  	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
1d3cd1773fddfd Dan Carpenter     2016-03-02  480  	if (IS_ERR(priv->base)) {
1d3cd1773fddfd Dan Carpenter     2016-03-02  481  		ret = PTR_ERR(priv->base);
6c821bd9edc956 Jonas Jensen      2013-08-08  482  		goto init_fail;
6c821bd9edc956 Jonas Jensen      2013-08-08  483  	}
35cba15a504bf4 Yang Yingliang    2021-06-07  484  	ndev->base_addr = res->start;
6c821bd9edc956 Jonas Jensen      2013-08-08  485  
f4693b81ea3802 Sergei Antonov    2022-08-18  486  	ret = platform_get_ethdev_address(p_dev, ndev);
f4693b81ea3802 Sergei Antonov    2022-08-18  487  	if (ret == -EPROBE_DEFER)
f4693b81ea3802 Sergei Antonov    2022-08-18  488  		goto init_fail;
f4693b81ea3802 Sergei Antonov    2022-08-18  489  	if (ret)
f4693b81ea3802 Sergei Antonov    2022-08-18  490  		eth_hw_addr_random(ndev);
f4693b81ea3802 Sergei Antonov    2022-08-18  491  	moxart_update_mac_address(ndev);
f4693b81ea3802 Sergei Antonov    2022-08-18  492  
6c821bd9edc956 Jonas Jensen      2013-08-08  493  	spin_lock_init(&priv->txlock);
6c821bd9edc956 Jonas Jensen      2013-08-08  494  
6c821bd9edc956 Jonas Jensen      2013-08-08  495  	priv->tx_buf_size = TX_BUF_SIZE;
9fe1b3bc8d9182 Jonas Jensen      2014-08-25  496  	priv->rx_buf_size = RX_BUF_SIZE;
6c821bd9edc956 Jonas Jensen      2013-08-08  497  
3a12df22a8f689 Sergei Antonov    2022-08-12  498  	priv->tx_desc_base = dma_alloc_coherent(p_dev, TX_REG_DESC_SIZE *
6c821bd9edc956 Jonas Jensen      2013-08-08  499  						TX_DESC_NUM, &priv->tx_base,
6c821bd9edc956 Jonas Jensen      2013-08-08  500  						GFP_DMA | GFP_KERNEL);
e8048b84bbfd3e SZ Lin            2017-07-29  501  	if (!priv->tx_desc_base) {
bdfd6304c8e243 Wei Yongjun       2013-10-08  502  		ret = -ENOMEM;
6c821bd9edc956 Jonas Jensen      2013-08-08  503  		goto init_fail;
bdfd6304c8e243 Wei Yongjun       2013-10-08  504  	}
6c821bd9edc956 Jonas Jensen      2013-08-08  505  
3a12df22a8f689 Sergei Antonov    2022-08-12  506  	priv->rx_desc_base = dma_alloc_coherent(p_dev, RX_REG_DESC_SIZE *
6c821bd9edc956 Jonas Jensen      2013-08-08  507  						RX_DESC_NUM, &priv->rx_base,
6c821bd9edc956 Jonas Jensen      2013-08-08  508  						GFP_DMA | GFP_KERNEL);
e8048b84bbfd3e SZ Lin            2017-07-29  509  	if (!priv->rx_desc_base) {
bdfd6304c8e243 Wei Yongjun       2013-10-08  510  		ret = -ENOMEM;
6c821bd9edc956 Jonas Jensen      2013-08-08  511  		goto init_fail;
bdfd6304c8e243 Wei Yongjun       2013-10-08  512  	}
6c821bd9edc956 Jonas Jensen      2013-08-08  513  
6da2ec56059c3c Kees Cook         2018-06-12  514  	priv->tx_buf_base = kmalloc_array(priv->tx_buf_size, TX_DESC_NUM,
c9ac080b25d98d Julia Lawall      2022-02-10  515  					  GFP_KERNEL);
bdfd6304c8e243 Wei Yongjun       2013-10-08  516  	if (!priv->tx_buf_base) {
bdfd6304c8e243 Wei Yongjun       2013-10-08  517  		ret = -ENOMEM;
6c821bd9edc956 Jonas Jensen      2013-08-08  518  		goto init_fail;
bdfd6304c8e243 Wei Yongjun       2013-10-08  519  	}
6c821bd9edc956 Jonas Jensen      2013-08-08  520  
6da2ec56059c3c Kees Cook         2018-06-12  521  	priv->rx_buf_base = kmalloc_array(priv->rx_buf_size, RX_DESC_NUM,
c9ac080b25d98d Julia Lawall      2022-02-10  522  					  GFP_KERNEL);
bdfd6304c8e243 Wei Yongjun       2013-10-08  523  	if (!priv->rx_buf_base) {
bdfd6304c8e243 Wei Yongjun       2013-10-08  524  		ret = -ENOMEM;
6c821bd9edc956 Jonas Jensen      2013-08-08  525  		goto init_fail;
bdfd6304c8e243 Wei Yongjun       2013-10-08  526  	}
6c821bd9edc956 Jonas Jensen      2013-08-08  527  
6c821bd9edc956 Jonas Jensen      2013-08-08  528  	platform_set_drvdata(pdev, ndev);
6c821bd9edc956 Jonas Jensen      2013-08-08  529  
6c821bd9edc956 Jonas Jensen      2013-08-08  530  	ret = devm_request_irq(p_dev, irq, moxart_mac_interrupt, 0,
6c821bd9edc956 Jonas Jensen      2013-08-08  531  			       pdev->name, ndev);
6c821bd9edc956 Jonas Jensen      2013-08-08  532  	if (ret) {
6c821bd9edc956 Jonas Jensen      2013-08-08  533  		netdev_err(ndev, "devm_request_irq failed\n");
6c821bd9edc956 Jonas Jensen      2013-08-08  534  		goto init_fail;
6c821bd9edc956 Jonas Jensen      2013-08-08  535  	}
6c821bd9edc956 Jonas Jensen      2013-08-08  536  
6c821bd9edc956 Jonas Jensen      2013-08-08  537  	ndev->netdev_ops = &moxart_netdev_ops;
b707b89f7be361 Jakub Kicinski    2022-05-06  538  	netif_napi_add_weight(ndev, &priv->napi, moxart_rx_poll, RX_DESC_NUM);
6c821bd9edc956 Jonas Jensen      2013-08-08  539  	ndev->priv_flags |= IFF_UNICAST_FLT;
6c821bd9edc956 Jonas Jensen      2013-08-08  540  	ndev->irq = irq;
6c821bd9edc956 Jonas Jensen      2013-08-08  541  
6c821bd9edc956 Jonas Jensen      2013-08-08  542  	SET_NETDEV_DEV(ndev, &pdev->dev);
6c821bd9edc956 Jonas Jensen      2013-08-08  543  
6c821bd9edc956 Jonas Jensen      2013-08-08  544  	ret = register_netdev(ndev);
c78eaeebe855fd Pavel Skripkin    2021-07-09  545  	if (ret)
6c821bd9edc956 Jonas Jensen      2013-08-08  546  		goto init_fail;
6c821bd9edc956 Jonas Jensen      2013-08-08  547  
6c821bd9edc956 Jonas Jensen      2013-08-08  548  	netdev_dbg(ndev, "%s: IRQ=%d address=%pM\n",
6c821bd9edc956 Jonas Jensen      2013-08-08  549  		   __func__, ndev->irq, ndev->dev_addr);
6c821bd9edc956 Jonas Jensen      2013-08-08  550  
6c821bd9edc956 Jonas Jensen      2013-08-08  551  	return 0;
6c821bd9edc956 Jonas Jensen      2013-08-08  552  
6c821bd9edc956 Jonas Jensen      2013-08-08  553  init_fail:
6c821bd9edc956 Jonas Jensen      2013-08-08  554  	netdev_err(ndev, "init failed\n");
6c821bd9edc956 Jonas Jensen      2013-08-08  555  	moxart_mac_free_memory(ndev);
bdfd6304c8e243 Wei Yongjun       2013-10-08  556  irq_map_fail:
bdfd6304c8e243 Wei Yongjun       2013-10-08  557  	free_netdev(ndev);
6c821bd9edc956 Jonas Jensen      2013-08-08  558  	return ret;
6c821bd9edc956 Jonas Jensen      2013-08-08  559  }
6c821bd9edc956 Jonas Jensen      2013-08-08  560  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

