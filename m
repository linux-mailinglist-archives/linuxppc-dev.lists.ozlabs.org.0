Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1351B508B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 00:52:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496wfx245XzDqjY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 08:52:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496wcz2Qp0zDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 08:50:26 +1000 (AEST)
IronPort-SDR: /KhKtofXj7K3Qh7R2CtUJVIm4gHWsokhfNDth3Z1yLW65seVHTfK//uTtc1IHnWYWUDPTiidum
 LHpZrjwDItng==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 15:50:19 -0700
IronPort-SDR: AQJuUtKle/RXyk8OeabhgcPSN8iqD+WQkZDNbNj4VjAxRWLpaxrc9UF/e5AuG4sQTEgZBWoWbs
 SBDNZPZOJnDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="259231225"
Received: from crschrol-desk22.amr.corp.intel.com (HELO [10.254.73.197])
 ([10.254.73.197])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2020 15:50:18 -0700
Subject: Re: [PATCH v2 2/2] PCI/DPC: Allow Native DPC Host Bridges to use DPC
To: Jon Derrick <jonathan.derrick@intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <1587418630-13562-1-git-send-email-jonathan.derrick@intel.com>
 <1587418630-13562-3-git-send-email-jonathan.derrick@intel.com>
From: "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <0058b993-0663-7fed-ed31-cb0adf845a39@linux.intel.com>
Date: Wed, 22 Apr 2020 15:50:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1587418630-13562-3-git-send-email-jonathan.derrick@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Rajat Jain <rajatja@google.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Frederick Lawler <fred@fredlawl.com>, Sam Bobroff <sbobroff@linux.ibm.com>,
 linux-pci@vger.kernel.org, Olof Johansson <olof@lixom.net>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>, "Patel,
 Mayurkumar" <mayurkumar.patel@intel.com>, Oliver O'Halloran <oohall@gmail.com>,
 Keith Busch <kbusch@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/20/20 2:37 PM, Jon Derrick wrote:
> The existing portdrv model prevents DPC services without either OS
> control (_OSC) granted to AER services, a Host Bridge requesting Native
> AER, or using one of the 'pcie_ports=' parameters of 'native' or
> 'dpc-native'.
> 
> The DPC port service driver itself will also fail to probe if the kernel
> assumes the port is using Firmware-First AER. It's a reasonable
> expectation that a port using Firmware-First AER will also be using
> Firmware-First DPC, however if a Host Bridge requests Native DPC, the
> DPC driver should allow it and not fail to bind due to AER capability
> settings.
> 
> Host Bridges which request Native DPC port services will also likely
> request Native AER, however it shouldn't be a requirement. This patch
> allows ports on those Host Bridges to have DPC port services.
> 
> This will avoid the unlikely situation where the port is Firmware-First
> AER and Native DPC, and a BIOS or switch firmware preconfiguration of
> the DPC trigger could result in unhandled DPC events.
> 
> Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
> ---
>   drivers/pci/pcie/dpc.c          | 3 ++-
>   drivers/pci/pcie/portdrv_core.c | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 7621704..3f3106f 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -284,7 +284,8 @@ static int dpc_probe(struct pcie_device *dev)
>   	int status;
>   	u16 ctl, cap;
>   
> -	if (pcie_aer_get_firmware_first(pdev) && !pcie_ports_dpc_native)
> +	if (pcie_aer_get_firmware_first(pdev) && !pcie_ports_dpc_native &&
> +	    !pci_find_host_bridge(pdev->bus)->native_dpc)
Why do it in probe as well ? if host->native_dpc is not set then the
device DPC probe it self won't happen right ?
>   		return -ENOTSUPP;
>   
>   	status = devm_request_threaded_irq(device, dev->irq, dpc_irq,
> diff --git a/drivers/pci/pcie/portdrv_core.c b/drivers/pci/pcie/portdrv_core.c
> index 50a9522..f2139a1 100644
> --- a/drivers/pci/pcie/portdrv_core.c
> +++ b/drivers/pci/pcie/portdrv_core.c
> @@ -256,7 +256,8 @@ static int get_port_device_capability(struct pci_dev *dev)
>   	 */
>   	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DPC) &&
>   	    pci_aer_available() &&
> -	    (pcie_ports_dpc_native || (services & PCIE_PORT_SERVICE_AER)))
> +	    (pcie_ports_dpc_native || host->native_dpc ||
> +	     (services & PCIE_PORT_SERVICE_AER)))
>   		services |= PCIE_PORT_SERVICE_DPC;
>   
>   	if (pci_pcie_type(dev) == PCI_EXP_TYPE_DOWNSTREAM ||
> 
