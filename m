Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11252175201
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 04:04:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48W4jW1GzDzDqwD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 14:03:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48W4gs3Dg2zDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 14:02:30 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id C659A13CCE158;
 Sun,  1 Mar 2020 19:02:23 -0800 (PST)
Date: Sun, 01 Mar 2020 19:02:21 -0800 (PST)
Message-Id: <20200301.190221.545987298420886023.davem@davemloft.net>
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
 Sun, 01 Mar 2020 19:02:25 -0800 (PST)
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

> This is second batch of the series which removes various static versions
> in favour of globaly defined Linux kernel version.

This generally looks fine to me but I'll let it sit for a few days so that
others can review.

