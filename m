Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5524774E9B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 11:02:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0Zcq0MW3z3c7f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 19:02:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 405 seconds by postgrey-1.37 at boromir; Tue, 11 Jul 2023 19:01:35 AEST
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0ZcH1ybXz3bV3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 19:01:34 +1000 (AEST)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8F44361E5FE01;
	Tue, 11 Jul 2023 10:53:08 +0200 (CEST)
Message-ID: <f1f9002c-ccc3-a2de-e4f5-d8fa1f8734e3@molgen.mpg.de>
Date: Tue, 11 Jul 2023 10:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Intel-wired-lan] [PATCH net-next v2 00/10] Remove unnecessary
 (void*) conversions
Content-Language: en-US
To: Su Hui <suhui@nfschina.com>
References: <20230710063828.172593-1-suhui@nfschina.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230710063828.172593-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: andrew@lunn.ch, irusskikh@marvell.com, kernel-janitors@vger.kernel.org, jesse.brandeburg@intel.com, edumazet@google.com, iyappan@os.amperecomputing.com, anthony.l.nguyen@intel.com, quan@os.amperecomputing.com, qiang.zhao@nxp.com, linux@armlinux.org.uk, xeb@mail.ru, intel-wired-lan@lists.osuosl.org, kuba@kernel.org, pabeni@redhat.com, yisen.zhuang@huawei.com, wg@grandegger.com, steve.glendinning@shawell.net, keyur@os.amperecomputing.com, linux-can@vger.kernel.org, mostrows@earthlink.net, mkl@pengutronix.de, salil.mehta@huawei.com, GR-Linux-NIC-Dev@marvell.com, uttenthaler@ems-wuensche.com, rmody@marvell.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, yunchuan@nfschina.com, linuxppc-dev@lists.ozlabs.org, skalluru@marvell.com, hkallweit1@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Su,


Thank you for your patch.

Am 10.07.23 um 08:38 schrieb Su Hui:
> From: wuych <yunchuan@nfschina.com>

Can you please write the full name correctly? Maybe Yun Chuan?

     git config --global user.name "Yun Chuan"
     git commit --amend --author="Yun Chuan <yunchuan@nfschina.com>"

I only got the cover letter by the way.


Kind regards,

Paul


> Changes in v2:
> 	move declarations to be reverse xmas tree.
> 	compile it in net and net-next branch.
> 	remove some error patches in v1.
> 
> PATCH v1 link:
> https://lore.kernel.org/all/20230628024121.1439149-1-yunchuan@nfschina.com/
> 
> wuych (10):
>    net: wan: Remove unnecessary (void*) conversions
>    net: atlantic: Remove unnecessary (void*) conversions
>    net: ppp: Remove unnecessary (void*) conversions
>    net: hns3: remove unnecessary (void*) conversions
>    net: hns: Remove unnecessary (void*) conversions
>    ice: remove unnecessary (void*) conversions
>    ethernet: smsc: remove unnecessary (void*) conversions
>    net: mdio: Remove unnecessary (void*) conversions
>    can: ems_pci: Remove unnecessary (void*) conversions
>    net: bna: Remove unnecessary (void*) conversions
> 
>   drivers/net/can/sja1000/ems_pci.c             |  6 +++---
>   .../aquantia/atlantic/hw_atl2/hw_atl2.c       | 12 ++++++------
>   .../atlantic/hw_atl2/hw_atl2_utils_fw.c       |  2 +-
>   drivers/net/ethernet/brocade/bna/bnad.c       | 19 +++++++++----------
>   .../ethernet/hisilicon/hns3/hns3_ethtool.c    |  2 +-
>   drivers/net/ethernet/hisilicon/hns_mdio.c     | 10 +++++-----
>   drivers/net/ethernet/intel/ice/ice_main.c     |  4 ++--
>   drivers/net/ethernet/smsc/smsc911x.c          |  4 ++--
>   drivers/net/ethernet/smsc/smsc9420.c          |  4 ++--
>   drivers/net/mdio/mdio-xgene.c                 |  4 ++--
>   drivers/net/ppp/pppoe.c                       |  4 ++--
>   drivers/net/ppp/pptp.c                        |  4 ++--
>   drivers/net/wan/fsl_ucc_hdlc.c                |  6 +++---
>   13 files changed, 40 insertions(+), 41 deletions(-)
