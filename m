Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E741D10F332
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 00:11:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RgpX0S7pzDqPK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 10:11:16 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RgmJ25L0zDqNJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 10:09:18 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id A69F014DAF87D;
 Mon,  2 Dec 2019 15:09:08 -0800 (PST)
Date: Mon, 02 Dec 2019 15:09:08 -0800 (PST)
Message-Id: <20191202.150908.2038427090014426460.davem@davemloft.net>
To: leoyang.li@nxp.com
Subject: Re: [PATCH v6 44/49] net/wan/fsl_ucc_hdlc: avoid use of IS_ERR_VALUE()
From: David Miller <davem@davemloft.net>
In-Reply-To: <VE1PR04MB6687B5428E3E4FA0F8F77DF08F430@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
 <20191128145554.1297-45-linux@rasmusvillemoes.dk>
 <VE1PR04MB6687B5428E3E4FA0F8F77DF08F430@VE1PR04MB6687.eurprd04.prod.outlook.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 02 Dec 2019 15:09:09 -0800 (PST)
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
Cc: timur@kernel.org, netdev@vger.kernel.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, oss@buserror.net, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Leo Li <leoyang.li@nxp.com>
Date: Mon, 2 Dec 2019 22:51:57 +0000

> 
> 
>> -----Original Message-----
>> From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>> Sent: Thursday, November 28, 2019 8:56 AM
>> To: Qiang Zhao <qiang.zhao@nxp.com>; Leo Li <leoyang.li@nxp.com>;
>> Christophe Leroy <christophe.leroy@c-s.fr>
>> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
>> linux-kernel@vger.kernel.org; Scott Wood <oss@buserror.net>; Timur Tabi
>> <timur@kernel.org>; Rasmus Villemoes <linux@rasmusvillemoes.dk>;
>> netdev@vger.kernel.org
>> Subject: [PATCH v6 44/49] net/wan/fsl_ucc_hdlc: avoid use of
>> IS_ERR_VALUE()
> 
> Hi David,
> 
> Would you help to review patch 44-47 in the series?  If it is fine with you, I can take these 4 patches with the whole series though soc tree to enable the QE drivers on ARM and PPC64 with your ACK.

Please take it via your tree, that's fine.
