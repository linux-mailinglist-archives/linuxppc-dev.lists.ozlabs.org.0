Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DCE146517
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 10:53:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483HfH1nNzzDqRW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 20:53:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 483Hbl59g8zDqTj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 20:51:28 +1100 (AEDT)
Received: from localhost (unknown [185.13.106.231])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 4199B153D1F49;
 Thu, 23 Jan 2020 01:51:08 -0800 (PST)
Date: Thu, 23 Jan 2020 10:49:58 +0100 (CET)
Message-Id: <20200123.104958.2192934942627784465.davem@davemloft.net>
To: hkallweit1@gmail.com
Subject: Re: [PATCH v2 net-next] net: convert suitable drivers to use
 phy_do_ioctl_running
From: David Miller <davem@davemloft.net>
In-Reply-To: <2db5d899-a550-456d-a725-f7cf009f53a3@gmail.com>
References: <2db5d899-a550-456d-a725-f7cf009f53a3@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 23 Jan 2020 01:51:19 -0800 (PST)
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, michal.simek@xilinx.com,
 wens@csie.org, bcm-kernel-feedback-list@broadcom.com, slemieux.tyco@gmail.com,
 yisen.zhuang@huawei.com, steve.glendinning@shawell.net, mripard@kernel.org,
 vz@mleia.com, opendmb@gmail.com, linux-arm-kernel@lists.infradead.org,
 salil.mehta@huawei.com, timur@kernel.org, sergei.shtylyov@cogentembedded.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, woojung.huh@microchip.com,
 UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Heiner Kallweit <hkallweit1@gmail.com>
Date: Tue, 21 Jan 2020 22:09:33 +0100

> Convert suitable drivers to use new helper phy_do_ioctl_running.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2: I forgot the netdev mailing list

Applied to net-next.
