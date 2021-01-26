Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3615303A92
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 11:42:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQ3GB1wHjzDqJM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 21:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=GKqOOoub; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQ3Cb6dPjzDq94
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 21:40:04 +1100 (AEDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B900223E6C;
 Tue, 26 Jan 2021 11:39:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611657595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCH/YXfZ9HXdQBHPo7Nn9zVU+J0dd/QGNvh+wOZ/2X0=;
 b=GKqOOoubkXGqrd/zE5rlnqsPTy9r0oLk3z+IM3Sf/2UoHZvkZLtvwOhunJfmhZwOa6B0aK
 cdugxcwYILhWGaAagQO7wh0vXI4z0begDwW+Die9587dy0ps0+RVeAl6opeJ7UERxokhLv
 UX9LiZSc46WBwqVpsZdf7Ik5uNyVZGk=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 26 Jan 2021 11:39:54 +0100
From: Michael Walle <michael@walle.cc>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] PCI: dwc: layerscape: convert to builtin_platform_driver()
In-Reply-To: <20210126100256.GA20547@e121166-lin.cambridge.arm.com>
References: <20210120105246.23218-1-michael@walle.cc>
 <20210126100256.GA20547@e121166-lin.cambridge.arm.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <1a36ef741c5ab2a6e90b38c58944aa25@walle.cc>
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
Cc: Roy Zang <roy.zang@nxp.com>, Saravana Kannan <saravanak@google.com>,
 Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 2021-01-26 11:02, schrieb Lorenzo Pieralisi:
> On Wed, Jan 20, 2021 at 11:52:46AM +0100, Michael Walle wrote:
>> fw_devlink will defer the probe until all suppliers are ready. We 
>> can't
>> use builtin_platform_driver_probe() because it doesn't retry after 
>> probe
>> deferral. Convert it to builtin_platform_driver().
>> 
>> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> 
> I will have to drop this Fixes: tag if you don't mind, it is not
> in the mainline.

That commit is in Greg's for-next tree:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=driver-core-next&id=e590474768f1cc04852190b61dec692411b22e2a

I was under the impression there are other commits with this
particular fixes tag, too. Either it was removed from
for-next queues or I was confused.

But I'm fine with removing the tag, assuming this will end
up together with the "driver core: Set fw_devlink=on by default"
commit in 5.11.

-michael
