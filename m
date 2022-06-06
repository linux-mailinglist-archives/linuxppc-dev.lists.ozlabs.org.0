Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B0C53F26F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 01:14:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH8TB42zNz3brd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 09:14:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gonehiking.org (client-ip=64.68.200.34; helo=mailout.easymail.ca; envelope-from=khalid@gonehiking.org; receiver=<UNKNOWN>)
X-Greylist: delayed 323 seconds by postgrey-1.36 at boromir; Tue, 07 Jun 2022 02:40:58 AEST
Received: from mailout.easymail.ca (mailout.easymail.ca [64.68.200.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGzky4127z2ygC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 02:40:56 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mailout.easymail.ca (Postfix) with ESMTP id F0673E0E57;
	Mon,  6 Jun 2022 16:35:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at emo08-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
	by localhost (emo08-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhyNN48mX6Hb; Mon,  6 Jun 2022 16:35:29 +0000 (UTC)
Received: from mail.gonehiking.org (unknown [38.15.45.1])
	by mailout.easymail.ca (Postfix) with ESMTPA id 87721E0E2D;
	Mon,  6 Jun 2022 16:35:29 +0000 (UTC)
Received: from [192.168.1.4] (internal [192.168.1.4])
	by mail.gonehiking.org (Postfix) with ESMTP id 689583EF5B;
	Mon,  6 Jun 2022 10:35:28 -0600 (MDT)
Message-ID: <d39fc9bb-07c1-ad74-1e89-d2aa80578cd4@gonehiking.org>
Date: Mon, 6 Jun 2022 10:35:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/6] scsi: remove stale BusLogic driver
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20220606084109.4108188-1-arnd@kernel.org>
 <20220606084109.4108188-6-arnd@kernel.org>
From: Khalid Aziz <khalid@gonehiking.org>
In-Reply-To: <20220606084109.4108188-6-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 07 Jun 2022 09:14:18 +1000
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
Reply-To: khalid@gonehiking.org
Cc: linux-arch@vger.kernel.org, linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martyn Welch <martyn@welchs.me.uk>, Manohar Vanga <manohar.vanga@gmail.com>, linuxppc-dev@lists.ozlabs.org, Denis Efremov <efremov@linux.com>, Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org, Matt Wang <wwentao@vmware.com>, linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/6/22 02:41, Arnd Bergmann wrote:
> From: Arnd Bergmann<arnd@arndb.de>
> 
> The BusLogic driver is the last remaining driver that relies on the
> deprecated bus_to_virt() function, which in turn only works on a few
> architectures, and is incompatible with both swiotlb and iommu support.
> 
> Before commit 391e2f25601e ("[SCSI] BusLogic: Port driver to 64-bit."),
> the driver had a dependency on x86-32, presumably because of this
> problem. However, the change introduced another bug that made it still
> impossible to use the driver on any 64-bit machine.
> 
> This was in turn fixed in commit 56f396146af2 ("scsi: BusLogic: Fix
> 64-bit system enumeration error for Buslogic"), 8 years later.
> 
> The fact that this was found at all is an indication that there are
> users, and it seems that Maciej, Matt and Khalid all have access to
> this hardware, but if it took eight years to find the problem,
> it's likely that nobody actually relies on it.
> 
> Remove it as part of the global virt_to_bus()/bus_to_virt() removal.
> If anyone is still interested in keeping this driver, the alternative
> is to stop it from using bus_to_virt(), possibly along the lines of
> how dpt_i2o gets around the same issue.
> 
> Cc: Maciej W. Rozycki<macro@orcam.me.uk>
> Cc: Matt Wang<wwentao@vmware.com>
> Cc: Khalid Aziz<khalid@gonehiking.org>
> Signed-off-by: Arnd Bergmann<arnd@arndb.de>
> ---
>   Documentation/scsi/BusLogic.rst   |  581 ---
>   Documentation/scsi/FlashPoint.rst |  176 -
>   MAINTAINERS                       |    7 -
>   drivers/scsi/BusLogic.c           | 3727 --------------
>   drivers/scsi/BusLogic.h           | 1284 -----
>   drivers/scsi/FlashPoint.c         | 7560 -----------------------------
>   drivers/scsi/Kconfig              |   24 -
>   7 files changed, 13359 deletions(-)
>   delete mode 100644 Documentation/scsi/BusLogic.rst
>   delete mode 100644 Documentation/scsi/FlashPoint.rst
>   delete mode 100644 drivers/scsi/BusLogic.c
>   delete mode 100644 drivers/scsi/BusLogic.h
>   delete mode 100644 drivers/scsi/FlashPoint.c

I would say no to removing BusLogic driver. Virtualbox is another 
consumer of this driver. This driver is very old but I would rather fix 
the issues than remove it until we do not have any users.

Thanks,
Khalid
