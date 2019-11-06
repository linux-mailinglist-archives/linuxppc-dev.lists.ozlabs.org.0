Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A02F1793
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 14:47:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477SX20g9HzF3CY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 00:47:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ti.com
 (client-ip=198.47.19.141; helo=fllv0015.ext.ti.com;
 envelope-from=kishon@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ti.com header.i=@ti.com header.b="T6+hrNSE"; 
 dkim-atps=neutral
X-Greylist: delayed 281 seconds by postgrey-1.36 at bilbo;
 Thu, 07 Nov 2019 00:44:46 AEDT
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477SSt6kG5zF48D
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 00:44:46 +1100 (AEDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6DdjRd104694;
 Wed, 6 Nov 2019 07:39:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573047585;
 bh=B4AqWpvbkF9WwJU+qXr/4lM8+KtnmSOFmTVCwEr68/c=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=T6+hrNSEcYbMNGY8yQ8noGwJoc1vkj/nZLrAdWGY4qwTosk3QasLuy2seIDsn9tjG
 NW1S0DM+36C9zcG8uKT1PJYysjyv7gt3g/Hfr8bZz4icnETFcs9f+ysa30CDAj9YlX
 iBj+pEBwVXYN5BYoh3tnvYhOqTyM80B2C7xzBFJQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA6DdjmR071492;
 Wed, 6 Nov 2019 07:39:45 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 6 Nov
 2019 07:39:30 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 6 Nov 2019 07:39:30 -0600
Received: from [172.24.190.233] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA6Dddi6039199;
 Wed, 6 Nov 2019 07:39:40 -0600
Subject: Re: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the doorbell
 way
To: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, Andrew Murray
 <andrew.murray@arm.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-7-xiaowei.bao@nxp.com>
 <20190823135816.GH14582@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299E50BA5D7579D41B8B4F9F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190827132504.GL14582@e119886-lin.cambridge.arm.com>
 <e64a484c-7cf5-5f65-400c-47128ab45e52@ti.com>
 <DM6PR12MB40107A9B97A8DAF32A4C651EDA790@DM6PR12MB4010.namprd12.prod.outlook.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <e34708a1-1116-89f9-c3f8-7f21b63c9d9c@ti.com>
Date: Wed, 6 Nov 2019 19:09:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB40107A9B97A8DAF32A4C651EDA790@DM6PR12MB4010.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>,
 "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.co>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gustavo,

On 06/11/19 3:10 PM, Gustavo Pimentel wrote:
> On Thu, Aug 29, 2019 at 6:13:18, Kishon Vijay Abraham I <kishon@ti.com> 
> wrote:
> 
> Hi, this email slip away from my attention...
> 
>> Gustavo,
>>
>> On 27/08/19 6:55 PM, Andrew Murray wrote:
>>> On Sat, Aug 24, 2019 at 12:08:40AM +0000, Xiaowei Bao wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Andrew Murray <andrew.murray@arm.com>
>>>>> Sent: 2019年8月23日 21:58
>>>>> To: Xiaowei Bao <xiaowei.bao@nxp.com>
>>>>> Cc: bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
>>>>> shawnguo@kernel.org; Leo Li <leoyang.li@nxp.com>; kishon@ti.com;
>>>>> lorenzo.pieralisi@arm.co; arnd@arndb.de; gregkh@linuxfoundation.org; M.h.
>>>>> Lian <minghuan.lian@nxp.com>; Mingkai Hu <mingkai.hu@nxp.com>; Roy
>>>>> Zang <roy.zang@nxp.com>; jingoohan1@gmail.com;
>>>>> gustavo.pimentel@synopsys.com; linux-pci@vger.kernel.org;
>>>>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>>>>> linux-arm-kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org
>>>>> Subject: Re: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the
>>>>> doorbell way
>>>>>
>>>>> On Thu, Aug 22, 2019 at 07:22:39PM +0800, Xiaowei Bao wrote:
>>>>>> The layerscape platform use the doorbell way to trigger MSIX interrupt
>>>>>> in EP mode.
>>>>>>
>>>>>
>>>>> I have no problems with this patch, however...
>>>>>
>>>>> Are you able to add to this message a reason for why you are making this
>>>>> change? Did dw_pcie_ep_raise_msix_irq not work when func_no != 0? Or did
>>>>> it work yet dw_pcie_ep_raise_msix_irq_doorbell is more efficient?
>>>>
>>>> The fact is that, this driver is verified in ls1046a platform of NXP before, and ls1046a don't
>>>> support MSIX feature, so I set the msix_capable of pci_epc_features struct is false,
>>>> but in other platform, e.g. ls1088a, it support the MSIX feature, I verified the MSIX
>>>> feature in ls1088a, it is not OK, so I changed to another way. Thanks.
>>>
>>> Right, so the existing pci-layerscape-ep.c driver never supported MSIX yet it
>>> erroneously had a switch case statement to call dw_pcie_ep_raise_msix_irq which
>>> would never get used.
>>>
>>> Now that we're adding a platform with MSIX support the existing
>>> dw_pcie_ep_raise_msix_irq doesn't work (for this platform) so we are adding a
>>> different method.
>>
>> Gustavo, can you confirm dw_pcie_ep_raise_msix_irq() works for designware as it
>> didn't work for both me and Xiaowei?
> 
> When I implemented the dw_pcie_ep_raise_msix_irq(), the implementation 
> was working quite fine on DesignWare solution. Otherwise, I wouldn't 
> submit it to the kernel.
> From what I have seen and if I recall well, Xiaowei implementation was 
> done having PF's configurated on his solution, which is a configuration 
> that I don't have in my solution, I believe this could be the missing 
> piece that differs between our 2 implementations.

I haven't debugged the issue yet but in my understanding the MSI-X table should
be in the memory (DDR) of EP system. This table will be populated by RC while
configuring MSI-X (with msg address and msg data). The EP will use the
populated msg address and msg data for raising MSI-X interrupt.

From the dw_pcie_ep_raise_msix_irq() (copied below), nowhere the MSI-X table is
being read from the memory of EP system. I've given my comments below.

int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
			     u16 interrupt_num)
{
	.
	.
	reg = PCI_BASE_ADDRESS_0 + (4 * bir);
	bar_addr_upper = 0;
	bar_addr_lower = dw_pcie_readl_dbi(pci, reg);

BAR register will hold the "PCI address" programmed by the host. So
"bar_addr_lower" will have PCI address.

	reg_u64 = (bar_addr_lower & PCI_BASE_ADDRESS_MEM_TYPE_MASK);
	if (reg_u64 == PCI_BASE_ADDRESS_MEM_TYPE_64)
		bar_addr_upper = dw_pcie_readl_dbi(pci, reg + 4);

	tbl_addr = ((u64) bar_addr_upper) << 32 | bar_addr_lower;

The "tbl_addr" now has the PCI address programmed by the host.

	tbl_addr += (tbl_offset + ((interrupt_num - 1) * PCI_MSIX_ENTRY_SIZE));
	tbl_addr &= PCI_BASE_ADDRESS_MEM_MASK;

	msix_tbl = ioremap_nocache(ep->phys_base + tbl_addr,
				   PCI_MSIX_ENTRY_SIZE);

"ep->phys_base" will have EPs outbound memory address and "tbl_addr" will have
PCI address. So msix_tbl points to the EPs outbound memory region.
	if (!msix_tbl)
		return -EINVAL;

	msg_addr_lower = readl(msix_tbl + PCI_MSIX_ENTRY_LOWER_ADDR);
	msg_addr_upper = readl(msix_tbl + PCI_MSIX_ENTRY_UPPER_ADDR);

Here an access to the EP outbound region is made (and the transaction will be
based on ATU configuration).
The message address should ideally be obtained from the MSI-X table present in
the EP system. There need not be any access to the OB region for getting data
from MSI-X table.

	msg_addr = ((u64) msg_addr_upper) << 32 | msg_addr_lower;
	msg_data = readl(msix_tbl + PCI_MSIX_ENTRY_DATA);
	vec_ctrl = readl(msix_tbl + PCI_MSIX_ENTRY_VECTOR_CTRL);

All this should be obtained from the memory of EP.
	.
	.
}

I'm not sure how this worked for you.

Thanks
Kishon

> 
> Since patch submission into the kernel related to msix feature on pcitest 
> tool, I didn't touch or re-tested the msix feature by lack of time (other 
> projects requires my full attention for now). However is on my roadmap to 
> came back to add some other features on DesignWare eDMA driver and I can 
> do at that time some tests to see if the 
> dw_pcie_ep_raise_msix_irq_doorbell() is compatible or not with my 
> solution. If so, I can do some patch to simplify and use the 
> dw_pcie_ep_raise_msix_irq_doorbell() if it still works as expected like 
> on dw_pcie_ep_raise_msix_irq(). Agree?
> 
> Gustavo
> 
>>
>> Thanks
>> Kishon
> 
> 
