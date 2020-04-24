Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB951B8277
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 01:31:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4989Rx0Yr4zDrB4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 09:31:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ijJZnogw; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4989Q51Kr4zDqlS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 09:30:20 +1000 (AEST)
Received: from localhost (mobile-166-175-187-210.mycingular.net
 [166.175.187.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F13E82076C;
 Fri, 24 Apr 2020 23:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587771018;
 bh=3wEKGv5ox3xBJSPG5UvCryAAs2g1WF/iqr0nCo6RjAs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ijJZnogwLtbiiPpXNEYBOe46Q77VEphxeEa+EJNqdaJPgJ8+BwQ8ZUhiqwd9BU4KT
 KU7/Y+V732uEGy42LTEWPaEBkKN/eJ39B7ogi+HLr6ORH5cq/6bu4aIv+SwiM9PWXu
 Sr3/76LZE+ZGEy1/I8uLeC/f9wYYT5wKsYGe4f2I=
Date: Fri, 24 Apr 2020 18:30:16 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jon Derrick <jonathan.derrick@intel.com>
Subject: Re: [PATCH v2 1/2] PCI/AER: Allow Native AER Host Bridges to use AER
Message-ID: <20200424233016.GA218665@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587418630-13562-2-git-send-email-jonathan.derrick@intel.com>
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
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Rajat Jain <rajatja@google.com>, Frederick Lawler <fred@fredlawl.com>,
 Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Olof Johansson <olof@lixom.net>, Alex Williamson <alex.williamson@redhat.com>,
 "Patel, Mayurkumar" <mayurkumar.patel@intel.com>,
 Oliver O'Halloran <oohall@gmail.com>, Keith Busch <kbusch@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jon,

I'm glad you raised this because I think the way we handle
FIRMWARE_FIRST is really screwed up.

On Mon, Apr 20, 2020 at 03:37:09PM -0600, Jon Derrick wrote:
> Some platforms have a mix of ports whose capabilities can be negotiated
> by _OSC, and some ports which are not described by ACPI and instead
> managed by Native drivers. The existing Firmware-First HEST model can
> incorrectly tag these Native, Non-ACPI ports as Firmware-First managed
> ports by advertising the HEST Global Flag and matching the type and
> class of the port (aer_hest_parse).
> 
> If the port requests Native AER through the Host Bridge's capability
> settings, the AER driver should honor those settings and allow the port
> to bind. This patch changes the definition of Firmware-First to exclude
> ports whose Host Bridges request Native AER.
> 
> Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
> ---
>  drivers/pci/pcie/aer.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f4274d3..30fbd1f 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -314,6 +314,9 @@ int pcie_aer_get_firmware_first(struct pci_dev *dev)
>  	if (pcie_ports_native)
>  		return 0;
>  
> +	if (pci_find_host_bridge(dev->bus)->native_aer)
> +		return 0;

I hope we don't have to complicate pcie_aer_get_firmware_first() by
adding this "native_aer" check here.  I'm not sure what we actually
*should* do based on FIRMWARE_FIRST, but I don't think the current
uses really make sense.

I think Linux makes too many assumptions based on the FIRMWARE_FIRST
bit.  The ACPI spec really only says (ACPI v6.3, sec 18.3.2.4):

  If set, FIRMWARE_FIRST indicates to the OSPM that system firmware
  will handle errors from this source first.

  If FIRMWARE_FIRST is set in the flags field, the Enabled field [of
  the HEST AER structure] is ignored by the OSPM.

I do not see anything there about who owns the AER Capability, but
Linux assumes that if FIRMWARE_FIRST is set, firmware must own the AER
Capability.  I think that's reading too much into the spec.

We already have _OSC, which *does* explicitly talk about who owns the
AER Capability, and I think we should rely on that.  If firmware
doesn't want the OS to touch the AER Capability, it should decline to
give ownership to the OS via _OSC.

>  	if (!dev->__aer_firmware_first_valid)
>  		aer_set_firmware_first(dev);
>  	return dev->__aer_firmware_first;
> -- 
> 1.8.3.1
> 
