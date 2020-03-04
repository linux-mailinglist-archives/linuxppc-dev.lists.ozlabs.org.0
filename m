Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46F1787E1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 02:58:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XH8W02gRzDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 12:58:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XH5g6mjgzDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 12:55:33 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 90AF515AD9731;
 Tue,  3 Mar 2020 17:55:18 -0800 (PST)
Date: Tue, 03 Mar 2020 17:55:17 -0800 (PST)
Message-Id: <20200303.175517.2166029762450403219.davem@davemloft.net>
To: leon@kernel.org
Subject: Re: [PATCH net-next 00/23] Clean driver, module and FW versions
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200301144457.119795-1-leon@kernel.org>
References: <20200301144457.119795-1-leon@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 03 Mar 2020 17:55:20 -0800 (PST)
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
Cc: ajit.khaparde@broadcom.com, madalin.bucur@nxp.com, kda@linux-powerpc.org,
 prashant@broadcom.com, _govind@gmx.com, somnath.kotur@broadcom.com,
 vishal@chelsio.com, GR-everest-linux-l2@marvell.com, leedom@chelsio.com,
 opendmb@gmail.com, bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 linus.walleij@linaro.org, sgoutham@marvell.com, pkaustub@cisco.com,
 aelior@marvell.com, ulli.kroll@googlemail.com, sburla@marvell.com,
 fmanlunas@marvell.com, leonro@mellanox.com, claudiu.manoil@nxp.com,
 f.fainelli@gmail.com, sathya.perla@broadcom.com, michael.chan@broadcom.com,
 linux-arm-kernel@lists.infradead.org, rvatsavayi@caviumnetworks.com,
 GR-Linux-NIC-Dev@marvell.com, fugang.duan@nxp.com,
 sriharsha.basavapatna@broadcom.com, linux-parisc@vger.kernel.org,
 siva.kallam@broadcom.com, rmody@marvell.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, hsweeten@visionengravers.com,
 rrichter@marvell.com, dchickles@marvell.com, linuxppc-dev@lists.ozlabs.org,
 skalluru@marvell.com, benve@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Leon Romanovsky <leon@kernel.org>
Date: Sun,  1 Mar 2020 16:44:33 +0200

> From: Leon Romanovsky <leonro@mellanox.com>
> 
> Hi,
> 
> This is second batch of the series which removes various static versions
> in favour of globaly defined Linux kernel version.
> 
> The first part with better cover letter can be found here
> https://lore.kernel.org/lkml/20200224085311.460338-1-leon@kernel.org
> 
> The code is based on
> 68e2c37690b0 ("Merge branch 'hsr-several-code-cleanup-for-hsr-module'")
> 
> and WIP branch is
> https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=ethtool

Series applied, thanks.
