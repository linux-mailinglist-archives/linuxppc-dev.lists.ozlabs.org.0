Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8CD1AD12D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 22:35:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4939vh3n21zDrF1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 06:35:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4939sB1TRHzDr85
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 06:32:57 +1000 (AEST)
IronPort-SDR: vqgUQ82q6Josk9diUAOv893P5WLhdgVjowaC8U+UJO0pFv8RpiGgZkGj3MRuzAJSI9mUNMyspv
 kc9tGyhEAUCg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 13:32:53 -0700
IronPort-SDR: bQIx91LfQ/1cGTGt3CJ21Sg11de1UFLBO5hn51HyVttmh5OEivccc2C2hrfY1U+dHUm/vrErK2
 0GijO9uT9QOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,392,1580803200"; d="scan'208";a="242776228"
Received: from msaddawx-mobl1.amr.corp.intel.com (HELO [10.254.107.229])
 ([10.254.107.229])
 by orsmga007.jf.intel.com with ESMTP; 16 Apr 2020 13:32:52 -0700
Subject: Re: [PATCH] PCI/DPC: Allow Non-ACPI Native ports to use DPC
To: Jon Derrick <jonathan.derrick@intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <1587067157-2291-1-git-send-email-jonathan.derrick@intel.com>
From: "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <4c2bf639-5510-fb17-2f02-73e7016d8f70@linux.intel.com>
Date: Thu, 16 Apr 2020 13:32:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1587067157-2291-1-git-send-email-jonathan.derrick@intel.com>
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
Cc: Frederick Lawler <fred@fredlawl.com>, Sam Bobroff <sbobroff@linux.ibm.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Keith Busch <keith.busch@intel.com>, Olof Johansson <olof@lixom.net>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 4/16/20 12:59 PM, Jon Derrick wrote:
> Some platforms have a mix of ports whose capabilities can be negotiated
> by _OSC, and some ports which are not described by ACPI and instead
> managed by Native drivers. The existing Firmware-First HEST model can
> incorrectly tag these Native, Non-ACPI ports as Firmware-First capable
> ports by advertising the HEST Global flag and specifying the type and
> class (aer_hest_parse).
> 
> This ultimately can lead to bad situations if the BIOS or port firmware
> leaves DPC preconfigured and the Linux DPC driver is unable to bind to
> the port to handle DPC events.
> 
> This patch adds the check for Native DPC in the port's host bridge in
> order to allow DPC services to bind to the port.
> 
> Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
> ---
>   drivers/pci/pcie/dpc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 7621704..a1e355d 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -281,10 +281,12 @@ static int dpc_probe(struct pcie_device *dev)
>   {
>   	struct pci_dev *pdev = dev->port;
>   	struct device *device = &dev->device;
> +	struct pci_host_bridge *host = pci_find_host_bridge(pdev->bus);
>   	int status;
>   	u16 ctl, cap;
>   
> -	if (pcie_aer_get_firmware_first(pdev) && !pcie_ports_dpc_native)
> +	if (pcie_aer_get_firmware_first(pdev) && !pcie_ports_dpc_native &&
For other PCIe services, this check is added in 
get_port_device_capability().
Why not add it there for DPC as well ?
> +	    !host->native_dpc)
>   		return -ENOTSUPP;
>   
>   	status = devm_request_threaded_irq(device, dev->irq, dpc_irq,
> 
