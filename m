Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F549999D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 19:07:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DrYl3KzmzDrfM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 03:07:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kalray.eu
 (client-ip=92.103.151.219; helo=zimbra2.kalray.eu;
 envelope-from=mrybczyn@kalray.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=kalray.eu
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kalray.eu header.i=@kalray.eu header.b="bQHqxiTt"; 
 dkim-atps=neutral
X-Greylist: delayed 482 seconds by postgrey-1.36 at bilbo;
 Thu, 22 Aug 2019 22:46:09 AEST
Received: from zimbra2.kalray.eu (zimbra2.kalray.eu [92.103.151.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DkmK2NgfzDrPr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 22:46:08 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id CD98627E65B3;
 Thu, 22 Aug 2019 14:37:59 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id T1iT1EPvEIoG; Thu, 22 Aug 2019 14:37:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 5F90927E666C;
 Thu, 22 Aug 2019 14:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 5F90927E666C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1566477479;
 bh=aQw9A1g9cI3XUpS8jFSOKdXpFdrtxIkLZL7+5zjNWQw=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=bQHqxiTtjUjcVlq87ck/i4HrMC1cZMLAPt+wSXhifDKwGWfkWyiK0QMj0Ccm0I7Ds
 /X+oCb+mrqw0cibbGWNAJFWQc9HwmLCJjsM/56f4SjAh0j9rHZjf0FeW7fVN++WNpa
 NsIsiNgvL+3xhuq6V2A6+dRgRq8xl4PNEhh9Vyg8=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id woZOGyPyypH8; Thu, 22 Aug 2019 14:37:59 +0200 (CEST)
Received: from zimbra2.kalray.eu (zimbra2.kalray.eu [192.168.40.202])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 47D0927E65B3;
 Thu, 22 Aug 2019 14:37:59 +0200 (CEST)
Date: Thu, 22 Aug 2019 14:37:59 +0200 (CEST)
From: Marta Rybczynska <mrybczyn@kalray.eu>
To: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Message-ID: <1907682156.57687176.1566477479224.JavaMail.zimbra@kalray.eu>
In-Reply-To: <20190816165101.911-2-s.miroshnichenko@yadro.com>
References: <20190816165101.911-1-s.miroshnichenko@yadro.com>
 <20190816165101.911-2-s.miroshnichenko@yadro.com>
Subject: Re: [PATCH v5 01/23] PCI: Fix race condition in
 pci_enable/disable_device()
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 8.8.12_GA_3794 (ZimbraWebClient - FF57 (Linux)/8.8.12_GA_3794)
Thread-Topic: Fix race condition in pci_enable/disable_device()
Thread-Index: O9C5qKK+P1vDneELlQbdEqY2P5q12A==
X-Mailman-Approved-At: Fri, 23 Aug 2019 03:03:19 +1000
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
Cc: linux-pci <linux-pci@vger.kernel.org>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- On 16 Aug, 2019, at 18:50, Sergey Miroshnichenko s.miroshnichenko@yadro.com wrote:

> This is a yet another approach to fix an old [1-2] concurrency issue, when:
> - two or more devices are being hot-added into a bridge which was
>   initially empty;
> - a bridge with two or more devices is being hot-added;
> - during boot, if BIOS/bootloader/firmware doesn't pre-enable bridges.
> 
> The problem is that a bridge is reported as enabled before the MEM/IO bits
> are actually written to the PCI_COMMAND register, so another driver thread
> starts memory requests through the not-yet-enabled bridge:
> 
> CPU0                                        CPU1
> 
> pci_enable_device_mem()                     pci_enable_device_mem()
>   pci_enable_bridge()                         pci_enable_bridge()
>     pci_is_enabled()
>       return false;
>     atomic_inc_return(enable_cnt)
>     Start actual enabling the bridge
>     ...                                         pci_is_enabled()
>     ...                                           return true;
>     ...                                     Start memory requests <-- FAIL
>     ...
>     Set the PCI_COMMAND_MEMORY bit <-- Must wait for this
> 
> Protect the pci_enable/disable_device() and pci_enable_bridge(), which is
> similar to the previous solution from commit 40f11adc7cd9 ("PCI: Avoid race
> while enabling upstream bridges"), but adding a per-device mutexes and
> preventing the dev->enable_cnt from from incrementing early.
> 
> CC: Srinath Mannam <srinath.mannam@broadcom.com>
> CC: Marta Rybczynska <mrybczyn@kalray.eu>
> Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
> 
> [1]
> https://lore.kernel.org/linux-pci/1501858648-22228-1-git-send-email-srinath.mannam@broadcom.com/T/#u
>    [RFC PATCH v3] pci: Concurrency issue during pci enable bridge
> 
> [2]
> https://lore.kernel.org/linux-pci/744877924.5841545.1521630049567.JavaMail.zimbra@kalray.eu/T/#u
>    [RFC PATCH] nvme: avoid race-conditions when enabling devices
> ---
> drivers/pci/pci.c   | 26 ++++++++++++++++++++++----
> drivers/pci/probe.c |  1 +
> include/linux/pci.h |  1 +
> 3 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 1b27b5af3d55..e7f8c354e644 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -1645,6 +1645,8 @@ static void pci_enable_bridge(struct pci_dev *dev)
> 	struct pci_dev *bridge;
> 	int retval;
> 
> +	mutex_lock(&dev->enable_mutex);
> +
> 	bridge = pci_upstream_bridge(dev);
> 	if (bridge)
> 		pci_enable_bridge(bridge);
> @@ -1652,6 +1654,7 @@ static void pci_enable_bridge(struct pci_dev *dev)
> 	if (pci_is_enabled(dev)) {
> 		if (!dev->is_busmaster)
> 			pci_set_master(dev);
> +		mutex_unlock(&dev->enable_mutex);
> 		return;
> 	}
> 

This code is used by numerous drivers and when we've seen that issue I was wondering
if there are some use-cases when this (or pci_disable_device) is called with interrupts
disabled. It seems that it shouldn't be, but a BUG_ON or error when someone calls
it this way would be helpful when debugging.

Marta
