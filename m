Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 445CD1B5085
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 00:50:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496wcf3xtyzDqjy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 08:50:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496wZh2CmwzDqdh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 08:48:26 +1000 (AEST)
IronPort-SDR: ebqJqsAsHfnqYui0lb88OtSEyO7zM4ga0HS3iKfMSSqzdSWbgoJdUtxSpoLvGeuXusC5lFOI8r
 RaoVAt33FHlw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 15:48:22 -0700
IronPort-SDR: r1IRe2VEuk6z3Z+5U9T7+yFyaDUSRmDToYCZuPClUDlClUJxNkhYfikEQRPuLvaO0Fm633aFfk
 BBSE3g+q1+aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="259230942"
Received: from crschrol-desk22.amr.corp.intel.com (HELO [10.254.73.197])
 ([10.254.73.197])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2020 15:48:20 -0700
Subject: Re: [PATCH v2 1/2] PCI/AER: Allow Native AER Host Bridges to use AER
To: Jon Derrick <jonathan.derrick@intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <1587418630-13562-1-git-send-email-jonathan.derrick@intel.com>
 <1587418630-13562-2-git-send-email-jonathan.derrick@intel.com>
From: "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <9f8c2a62-e67d-2869-db11-4644b69815f4@linux.intel.com>
Date: Wed, 22 Apr 2020 15:48:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1587418630-13562-2-git-send-email-jonathan.derrick@intel.com>
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
> Some platforms have a mix of ports whose capabilities can be negotiated
> by _OSC, and some ports which are not described by ACPI and instead
> managed by Native drivers. The existing Firmware-First HEST model can
> incorrectly tag these Native, Non-ACPI ports as Firmware-First managed
> ports by advertising the HEST Global Flag and matching the type and
> class of the port (aer_hest_parse).
Is there a real use case for mixed mode (one host bridge in FF mode and
another in native)?
> 
> If the port requests Native AER through the Host Bridge's capability
> settings, the AER driver should honor those settings and allow the port
> to bind. This patch changes the definition of Firmware-First to exclude
> ports whose Host Bridges request Native AER.
> 
> Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
> ---
>   drivers/pci/pcie/aer.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f4274d3..30fbd1f 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -314,6 +314,9 @@ int pcie_aer_get_firmware_first(struct pci_dev *dev)
>   	if (pcie_ports_native)
>   		return 0;
>   
> +	if (pci_find_host_bridge(dev->bus)->native_aer)
> +		return 0;
> +
>   	if (!dev->__aer_firmware_first_valid)
>   		aer_set_firmware_first(dev);
>   	return dev->__aer_firmware_first;
> 
