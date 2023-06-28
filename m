Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9687C7410B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 14:05:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrgJb44bxz3bv9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 22:05:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=lanhao@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1095 seconds by postgrey-1.37 at boromir; Wed, 28 Jun 2023 17:59:55 AEST
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrYs73zJPz2yfc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 17:59:51 +1000 (AEST)
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QrYNB6tBxzMpWw;
	Wed, 28 Jun 2023 15:38:18 +0800 (CST)
Received: from [10.67.102.37] (10.67.102.37) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 28 Jun
 2023 15:41:29 +0800
Subject: Re: [PATCH net-next 00/10] Remove unnecessary (void*) conversions
To: wuych <yunchuan@nfschina.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
	<olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <irusskikh@marvell.com>,
	<yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>,
	<jesse.brandeburg@intel.com>, <anthony.l.nguyen@intel.com>,
	<steve.glendinning@shawell.net>, <iyappan@os.amperecomputing.com>,
	<keyur@os.amperecomputing.com>, <quan@os.amperecomputing.com>,
	<hkallweit1@gmail.com>, <linux@armlinux.org.uk>, <mostrows@earthlink.net>,
	<xeb@mail.ru>, <qiang.zhao@nxp.com>
References: <20230628024121.1439149-1-yunchuan@nfschina.com>
From: Hao Lan <lanhao@huawei.com>
Message-ID: <1f5652f7-7eb2-11f0-4a07-c87f2992e509@huawei.com>
Date: Wed, 28 Jun 2023 15:41:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20230628024121.1439149-1-yunchuan@nfschina.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.37]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 28 Jun 2023 22:05:11 +1000
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
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux@rempel-privat.de, intel-wired-lan@lists.osuosl.org, yangyingliang@huawei.com, linuxppc-dev@lists.ozlabs.org, ansuelsmth@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2023/6/28 10:41, wuych wrote:
> Remove (void*) conversions under "drivers/net" directory.
> According to the suggestion[1] of Jakub Kicinski, send these patches
> in series of 10. 
> 
> wuych (10):
>   net: dsa: ar9331: remove unnecessary (void*) conversions
>   net: dsa: qca8k: remove unnecessary (void*) conversions
>   atlantic:hw_atl2:hw_atl2_utils_fw: Remove unnecessary (void*)
>     conversions
>   ice: Remove unnecessary (void*) conversions
>   ethernet: smsc: remove unnecessary (void*) conversions
>   net: hns: Remove unnecessary (void*) conversions
>   net: hns3: remove unnecessary (void*) conversions
>   net: mdio: Remove unnecessary (void*) conversions
>   net: ppp: remove unnecessary (void*) conversions
>   net: wan: Remove unnecessary (void*) conversions
> 

Hi wuych,
Thank you for your patch.
The following two patches conflict with the net-next branch, and others have modified the related code.
Please compile your series in net and net-next branch and upload your series again.
  net: dsa: ar9331: remove unnecessary (void*) conversions
  net: dsa: qca8k: remove unnecessary (void*) conversions

Yours,
Hao Lan
