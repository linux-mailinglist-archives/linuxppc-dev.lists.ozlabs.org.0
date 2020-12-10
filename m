Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B44722D67D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 21:01:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsPtB3n2qzDr1K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 07:00:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=dnygdpHM; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsPqj0c8szDqCs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 06:58:38 +1100 (AEDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7E8E223E5D;
 Thu, 10 Dec 2020 20:58:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1607630307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fMhg82S0rwUSrDpQiFh0ST2pjTuKrxogeVcd6fb/BYU=;
 b=dnygdpHM2m3GMfxdC9krsKYEPRMHmLSimDuAfuHkp9B+WvhENOP1JGuIC1hgvaWYW8vooR
 cObG9mXNSlEl+RbJyAQXjAEUjMNUxeXXJK+9oWx4GAVScYKHglUMULZJH+oHRC4twGtl11
 /qZ1HdnbCMHzriG18csTWpg2CJ/KS0c=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 10 Dec 2020 20:58:20 +0100
From: Michael Walle <michael@walle.cc>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6 0/5] PCI: Unify ECAM constants in native PCI Express
 drivers
In-Reply-To: <20201210173809.GA37355@bjorn-Precision-5520>
References: <20201210173809.GA37355@bjorn-Precision-5520>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <194550494fde93c6eb840eabf59bde38@walle.cc>
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
Cc: kw@linux.com, heiko@sntech.de, shawn.lin@rock-chips.com,
 Alexandru Marginean <alexm.osslist@gmail.com>, paulus@samba.org,
 thomas.petazzoni@bootlin.com, jonnyc@amazon.com, toan@os.amperecomputing.com,
 will@kernel.org, robh@kernel.org, lorenzo.pieralisi@arm.com,
 michal.simek@xilinx.com, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, rjui@broadcom.com, f.fainelli@gmail.com,
 linux-rpi-kernel@lists.infradead.org, Jonathan.Cameron@huawei.com,
 bhelgaas@google.com, jonathan.derrick@intel.com, sbranden@broadcom.com,
 wangzhou1@hisilicon.com, rrichter@marvell.com,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 nsaenzjulienne@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 2020-12-10 18:38, schrieb Bjorn Helgaas:
> On Wed, Dec 09, 2020 at 10:29:04PM +0200, Vladimir Oltean wrote:
>> On Wed, Dec 09, 2020 at 04:40:52PM +0100, Michael Walle wrote:
>> > Hopefully my mail client won't mess up the output that much.
>> 
>> I can reproduce on my LS1028A as well. The following fixes the bug for
>> me. I did not follow the discussion and see if it is helpful for 
>> others.
>> I don't understand how the bug came to be. There might be more to it
>> than what I'm seeing. If it's just what I'm seeing, then the patch was
>> pretty broken to begin with.
> 
> I squashed the fix below into a pci/ecam branch for v5.11, thanks!

FWIW
Tested-by: Michael Walle <michael@walle.cc>

-michael
