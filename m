Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9C37A884B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 17:29:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ipP+WCH4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrMsC0y94z3c8r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 01:29:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ipP+WCH4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7ea9::615; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=terry.bowman@amd.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrMrJ4Sy8z3bw9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 01:28:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrfV3WApayH4f1e6w4YXirgl3FsHfARPflLiDtmpoIUGS+Ck0NgHfCYPM8xGB8kVeSpxSrY4ZW1Hk/avZSQwQD/4SulV99sBR+NxTd8LUkkBbA/F9npscYiOnPJlmNfP1+JOWrolOytipc/EajMSxvgfDlupyEhE/Sq4hn0MYFvorVQERs60HkcieUMRvJCPzGqVzBqtsG/fALdba8BM2/Us4/yzS2qlH22mKr0HtGOWH3vpdGbt6lq4dN9Njq0Wh0gDglZKGZor/2kmfaGim9wUdWVGmULAjwWSADP1s56EzIQE6oLm2UUUIYDh8rigMiFvcgvBkmi5kZ2HH4y4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L16fEku9OKHPzg29uNfQE2lhES0OkwE1d6Hb3IFozJo=;
 b=Oo6lfvzSZZ7foreu5GSqqumkL8lQfwJacy0K++9SPoBL5HQxHXKR97yR4m53M51su3qe/pHzcUngW1DjK7+uTopZEFphI98cq7Q2sifsQzAnbjTzzOdrRHK5/WQ6ZlQrnM15W9ctBGU3MBZyDUNJULkhZQbFC8p3SaajLrR2zPnlzHZ48w5tOWmlAi354IR8enTycKblfTbR/SIzAnVg+ygAY1gAESsBM+f0XBxEVp6i+kSc83H1EUCQmpjFwjHPwlsWoIFtDGnjRf3xA7x3dg6MZxeHJXrLODCTjtHHi+Uawutq83EH4MQ8VljwbAN8+KcHfQzQQMQYGjpcTfQaww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L16fEku9OKHPzg29uNfQE2lhES0OkwE1d6Hb3IFozJo=;
 b=ipP+WCH4R0ewGMj/iYkXo2Y4xV0jXJnB0fwHB/reuinLFbjqZL81uASQ8IFrHrdsT5RzuLsYMfncWIP8vkt5lMpOlHmU6vGTLb/vkh89wQa/0h3Pg4Uhp0i2bY4sz9eWu1+5QASBJhVQVHb9SOVOyy5xfidzNKLnJgd7Bgv+yrA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) by
 SA3PR12MB9158.namprd12.prod.outlook.com (2603:10b6:806:380::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 20 Sep
 2023 15:28:17 +0000
Received: from DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::5b90:dbf9:e0a5:64cc]) by DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::5b90:dbf9:e0a5:64cc%6]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 15:28:17 +0000
Message-ID: <353975d6-63e3-43a5-a9d2-5cbf207d5017@amd.com>
Date: Wed, 20 Sep 2023 10:28:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v10 13/15] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Content-Language: en-US
From: Terry Bowman <Terry.Bowman@amd.com>
To: Dan Williams <dan.j.williams@intel.com>, alison.schofield@intel.com,
 vishal.l.verma@intel.com, ira.weiny@intel.com, bwidawsk@kernel.org,
 dave.jiang@intel.com, Jonathan.Cameron@huawei.com, linux-cxl@vger.kernel.org
References: <20230831170248.185078-1-terry.bowman@amd.com>
 <20230831170248.185078-6-terry.bowman@amd.com>
 <64f0f9984932b_31c2db29461@dwillia2-xfh.jf.intel.com.notmuch>
 <cfa1aaca-49f1-cb8c-f4d9-f96e5bdc9892@amd.com>
In-Reply-To: <cfa1aaca-49f1-cb8c-f4d9-f96e5bdc9892@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:8:2f::22) To DS0PR12MB6390.namprd12.prod.outlook.com
 (2603:10b6:8:ce::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6390:EE_|SA3PR12MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: f556daa4-908f-45dc-868a-08dbb9ee365d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fWL9TBib+7mRIPDaH4jE8wH/ZJw2Hr9AUHYWxsJjNhs86kx5kHToiul8Htm1wisMBJZJTk85IXieh0XC0NKeGd8sfGzARnvMphV7RKRj1wZ+ltJmRVevaqgr4sd5aiL9iel92ArfAfsNVD2VI8h0gCGw1yKBumDTiRYyQ0I336dZPF/8A8XW5SuESCzzYMD6vRDbi0OXE0r/hPyYFe0uwIWM8rYUa5XcM3rvM4vW97mA/YEcakM4tGPkIJWmCGRtUweqgArwxcBJv+zQnYiru8N7+jztm/4UwBX9m5buNk6cHZ7jMqPkzPud3wuQEOk7qANg21etGypPpnNFwtee+1OLvWefXzwIe5LSNhMIGq4YYdtf7J/H0NcTBCDF6UKayTA6ebhXnoljR2QbLFjbxCiXAsUXcc0ZJ7zZ/LqMaYfVBeYdN/dqr38r7gfh+fMwlr7YDr/fdyQ+FV8FgjgCBCvG+gJLoVpRw59SKkx+VhEoq4xHlziVugrsw7Yk9KmAbtuVgzOo6HBJpsby7MG3wmc+YtL9AX4ZQrx9+URnc4aREklmMX0+P77S+kUnNAzf6bgjgWu+beuPdCijvp3Zu4XI2MYw1tISM+gwZi2r3x5zz++aQoDJM++p/2aXCl09bRdB/bj4udzAwHYA7xcn9g==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199024)(186009)(1800799009)(31686004)(53546011)(6512007)(6486002)(6506007)(36756003)(31696002)(86362001)(38100700002)(26005)(30864003)(2906002)(2616005)(7416002)(966005)(478600001)(83380400001)(5660300002)(8676002)(4326008)(8936002)(316002)(66946007)(66556008)(66476007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NkZ4dTVYVXlzYnlkZU9LUTdDTWh0Vmp1R2NrQTBPQWMySmd5V2txdG1pS0FG?=
 =?utf-8?B?OHJxM3hWUFo4ZkFDWUFna3J6eEtXSC9nUklkNjNWQXNHZjhEUUxnQWxkME5p?=
 =?utf-8?B?V1l4am5lVmpEdktCT0NacmZJMTRkK29LMGxyLzBiVEUrcnJGRlFJejZNSXh2?=
 =?utf-8?B?bkpEWW1makZsMWZqZm90QWRZTTBTWEhQMGVXWmNDdFZpK3l4MnFhZWQrQk1o?=
 =?utf-8?B?MmhXcGdCMTFEdTlsbmRvdDg1aUVPbTI4Vnp3Nk5YcnJ0eVVUQ2ZHa2xFc0pK?=
 =?utf-8?B?YU9vdWFsbmFPblEzSEswM0c0NkRaNEg4ZmZXQkM0bU9USUZvbzRyWWhwbWhp?=
 =?utf-8?B?TnVyeklVRkFKMC9YVEJUbjRWYm13RGZCZ3JRMDN6Zkc4RjV5UWc1SjhFQ0gv?=
 =?utf-8?B?cHNzWndaWGhZbXZmR1dZVEJqNzhIQ21nSFR3K0x4TXNDNlNOY3BDZjBiTU5S?=
 =?utf-8?B?ZUo2bG5rWm4rM2VKRmIrcmpNV2tCTTA5YmpRVHJMN25XWmJDSWlwaEZtY2tx?=
 =?utf-8?B?ZURzc2YwOENGUEVBcytJc2x1disyNlJMZENOMTh3SC9ZUlErRXRkWlVjU2dh?=
 =?utf-8?B?MFFwdWw4QTdja3h0anhJdUo0YXVXdHRTTGR6eUs4R1B4VkpTZGdwMkxHZDVU?=
 =?utf-8?B?T054UVN5U2huYmJicWZvcXRXcGordG83cmsydWpQWTd1Q2NOcTJQN1pLMUVY?=
 =?utf-8?B?TEdvbm5WbEk5TWRtdDZwZk9OZXM4b2tPczhzSXM2YjVBdDBNZDZGd1didno1?=
 =?utf-8?B?eGZISTVRT05xdHdXZy9LelFuZ25kTWpSaVNBYlowK005NkVyUUtGYnBCUHJq?=
 =?utf-8?B?dSsvTGFUNWRnamxpVnNBUUorb3BKck9zbW1hVHVnNVVpSlp1dnJ0VUhwMVlG?=
 =?utf-8?B?WHJqNG5ObDlFMnBqUWFoemcvZzBGU0c5bEU3UXlTbWM2ZEVWSmxrdXd4NGJu?=
 =?utf-8?B?QnpnS0FZVVVZbDg4UjFYUTZuekRIMmltYStTTVlJcG9idjNZL3ViVGFpSjdU?=
 =?utf-8?B?SDhpWWhNMGJTakRvS0MydHpuaWNwRUtIcnp0REhGRXM0TGlubGtTN3hLdzdz?=
 =?utf-8?B?SzI4MFZJOWw3LzA3MVZzQkVrbE16SGRPM0x4eG0vbkIxTERQNVBCOXVNYVZW?=
 =?utf-8?B?WjIrYm9mczFMMmIwNmpzckEzbG5MNXBwQ1d0NlhWNDJTSStUaGl2TmplTUkx?=
 =?utf-8?B?OWJ0YjhLWitHYTdTTTlXbEJNMVlTa1ZMVDEzRnhqdFhLLzdNSzlQQlBCRDBW?=
 =?utf-8?B?bk9GN09BYTR2YXBQNGxLNG4vd3JFaFM2SFpxdDdURTRnSjNZNFpSN0lQSkVK?=
 =?utf-8?B?RzZVQ1JCM1JGZjZwVmwxL1lBYnZadzdWUU9BeDhWaGxrY3JQeXpXWmZXcnFM?=
 =?utf-8?B?akhWZEZUU0VQdmg1VXB4cVBnTmlVbk5XYUNlZ0MzVkRDcVN2SDZVdElhdlBv?=
 =?utf-8?B?STdzOEE5MGw1L3RBMjZ2QUVxYzR0VnkwTHlsZXZDdTVqS1dFTk85VFJJbno1?=
 =?utf-8?B?WVhldjcwZXU3UGk3aUxaN0R4bGw1UFZobE51Wncyb202ajRxWHRQRlJlbFNr?=
 =?utf-8?B?TmpQWnlMM2NpdWFTWFFYMHhYQXFBWDZsWVRrMUwyQXh3bDhRU0NabHZ0K0dv?=
 =?utf-8?B?RnhLeERra3daK3Z3R2tDTXh2SXRsWGEzT0JOTE9VNmxtbTgzcFlFbllBL2Iz?=
 =?utf-8?B?ZjJPKzAxTGJmMlJIelU3bTNxZ09rbUFQSE44V004QXNYN0hBZDFRNytFQ011?=
 =?utf-8?B?YzVJZXlTd1BrQitxMmM4YjFsYmxrV3VvKzV3U0I1Z3hHZDVDTXY0NHhRaHpk?=
 =?utf-8?B?R3J2cWxzUEN0RDJXazJBbERLaE5JZFJkTFk1OWhZaytLVS90L2FsNWNxaVg1?=
 =?utf-8?B?WEY5UDlwTVVCZlBnNjFmMjRpSC9pWExGa2d0MnpsU1hUaTc1ZWl3ZTZRa0dw?=
 =?utf-8?B?UnJWSW5vR3RMUXY4ck9tdGpYNnRxc2x0QkRlUVYrQ0pxZ2gzK3RtRHNPeC92?=
 =?utf-8?B?SGdRUm4xU1FWcHVGODVWckxLalVmQXNYRTF2Z05yZnExenlSTGV0R3BUTjhL?=
 =?utf-8?B?NVd4WW11S0t3dCtTekdxMUJud0VTU2VFMXVLWk1sMjBhMGZPSHI1UlYvbXFC?=
 =?utf-8?Q?QvjpKZUbG6CZty9A1zimmujqJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f556daa4-908f-45dc-868a-08dbb9ee365d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 15:28:16.9965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCiYhDnOJhBywq76atzwbSri3YwFV0pf1tHuYKbmUCK7VHIFlxjePKgfSWuKbphOnBF5DNHEjJIm/whKRYwGlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9158
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
Cc: rrichter@amd.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Dan,

I adde danothe comment below.

On 9/19/23 15:58, Terry Bowman wrote:
> Hi Dan,
> 
> On 8/31/23 15:35, Dan Williams wrote:
>> Terry Bowman wrote:
>>> From: Robert Richter <rrichter@amd.com>
>>>
>>> In Restricted CXL Device (RCD) mode a CXL device is exposed as an
>>> RCiEP, but CXL downstream and upstream ports are not enumerated and
>>> not visible in the PCIe hierarchy. [1] Protocol and link errors from
>>> these non-enumerated ports are signaled as internal AER errors, either
>>> Uncorrectable Internal Error (UIE) or Corrected Internal Errors (CIE)
>>> via an RCEC.
>>>
>>> Restricted CXL host (RCH) downstream port-detected errors have the
>>> Requester ID of the RCEC set in the RCEC's AER Error Source ID
>>> register. A CXL handler must then inspect the error status in various
>>> CXL registers residing in the dport's component register space (CXL
>>> RAS capability) or the dport's RCRB (PCIe AER extended
>>> capability). [2]
>>>
>>> Errors showing up in the RCEC's error handler must be handled and
>>> connected to the CXL subsystem. Implement this by forwarding the error
>>> to all CXL devices below the RCEC. Since the entire CXL device is
>>> controlled only using PCIe Configuration Space of device 0, function
>>> 0, only pass it there [3]. The error handling is limited to currently
>>> supported devices with the Memory Device class code set (CXL Type 3
>>> Device, PCI_CLASS_MEMORY_CXL, 502h), handle downstream port errors in
>>> the device's cxl_pci driver. Support for other CXL Device Types
>>> (e.g. a CXL.cache Device) can be added later.
>>>
>>> To handle downstream port errors in addition to errors directed to the
>>> CXL endpoint device, a handler must also inspect the CXL RAS and PCIe
>>> AER capabilities of the CXL downstream port the device is connected
>>> to.
>>>
>>> Since CXL downstream port errors are signaled using internal errors,
>>> the handler requires those errors to be unmasked. This is subject of a
>>> follow-on patch.
>>>
>>> The reason for choosing this implementation is that the AER service
>>> driver claims the RCEC device, but does not allow it to register a
>>> custom specific handler to support CXL. Connecting the RCEC hard-wired
>>> with a CXL handler does not work, as the CXL subsystem might not be
>>> present all the time. The alternative to add an implementation to the
>>> portdrv to allow the registration of a custom RCEC error handler isn't
>>> worth doing it as CXL would be its only user. Instead, just check for
>>> an CXL RCEC and pass it down to the connected CXL device's error
>>> handler. With this approach the code can entirely be implemented in
>>> the PCIe AER driver and is independent of the CXL subsystem. The CXL
>>> driver only provides the handler.
>>>
>>> [1] CXL 3.0 spec: 9.11.8 CXL Devices Attached to an RCH
>>> [2] CXL 3.0 spec, 12.2.1.1 RCH Downstream Port-detected Errors
>>> [3] CXL 3.0 spec, 8.1.3 PCIe DVSEC for CXL Devices
>>>
>>> Co-developed-by: Terry Bowman <terry.bowman@amd.com>
>>> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
>>> Signed-off-by: Robert Richter <rrichter@amd.com>
>>> Cc: "Oliver O'Halloran" <oohall@gmail.com>
>>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> Cc: linux-pci@vger.kernel.org
>>> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
>>> ---
>>>  drivers/pci/pcie/Kconfig | 12 +++++
>>>  drivers/pci/pcie/aer.c   | 96 +++++++++++++++++++++++++++++++++++++++-
>>>  2 files changed, 106 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
>>> index 228652a59f27..4f0e70fafe2d 100644
>>> --- a/drivers/pci/pcie/Kconfig
>>> +++ b/drivers/pci/pcie/Kconfig
>>> @@ -49,6 +49,18 @@ config PCIEAER_INJECT
>>>  	  gotten from:
>>>  	     https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
>>>  
>>> +config PCIEAER_CXL
>>> +	bool "PCI Express CXL RAS support for Restricted Hosts (RCH)"
>>
>> Why the "for Restricted Hosts (RCH)" clarification? I am seeing nothing
>> that prevents this from working with RCECs on VH topologies.
>>
> 
> The same option can be used in VH mode. Will remove the RCH reference.
> 
>>
>>> +	default y
>>
>> Minor, but I think "default PCIEAER" makes it slightly clearer that CXL
>> error handling comes along for the ride with PCIE AER.
>>
> 
> We found Kconfig entries do not typically list a dependancy and the default 
> to be the same. We prefer to leave as 'default y'. If you want we can make 
> your requested change. 
> 
>>> +	depends on PCIEAER && CXL_PCI
>>> +	help
>>> +	  Enables error handling of downstream ports of a CXL host
>>> +	  that is operating in RCD mode (Restricted CXL Host, RCH).
>>> +	  The downstream port reports AER errors to a given RCEC.
>>> +	  Errors are handled by the CXL memory device driver.
>>> +
>>> +	  If unsure, say Y.
>>> +
>>>  #
>>>  # PCI Express ECRC
>>>  #
>>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>>> index d3344fcf1f79..c354ca5e8f2b 100644
>>> --- a/drivers/pci/pcie/aer.c
>>> +++ b/drivers/pci/pcie/aer.c
>>> @@ -946,14 +946,100 @@ static bool find_source_device(struct pci_dev *parent,
>>>  	return true;
>>>  }
>>>  
>>> +#ifdef CONFIG_PCIEAER_CXL
>>> +
>>> +static bool is_cxl_mem_dev(struct pci_dev *dev)
>>> +{
>>> +	/*
>>> +	 * The capability, status, and control fields in Device 0,
>>> +	 * Function 0 DVSEC control the CXL functionality of the
>>> +	 * entire device (CXL 3.0, 8.1.3).
>>> +	 */
>>> +	if (dev->devfn != PCI_DEVFN(0, 0))
>>> +		return false;
>>> +
>>> +	/*
>>> +	 * CXL Memory Devices must have the 502h class code set (CXL
>>> +	 * 3.0, 8.1.12.1).
>>> +	 */
>>> +	if ((dev->class >> 8) != PCI_CLASS_MEMORY_CXL)
>>> +		return false;
>>
>> Type-2 devices are going to support the same error flows but without
>> advertising the CXL class code. Should this perhaps be something that
>> CXL drivers can opt into by setting a flag in the pci_dev? It is already
>> the case that the driver needs to be attached for the error handler to
>> be found, so might as well allow the CXL AER handling to be opted-in by
>> the driver as well.
>>
> 
> At the momment type-2 devices are unsupported and the drivers are not 
> available. The absence of CXL class information in type-2 devices will present 
> a challenge in identifying here. We would like to defer making change here 
> and address this in a future a patchset. 
> 

CXL type 2 PCIe device AER errors are handled the same as other PCIe devices.
Device AER is reported to the OS by the parent root port with the BDF value in 
the root port's error root src register. Device AER handling flow is different 
than the RCH handling flow here. The RCH handling discussed here is needed 
because the RCH dport is missing a BDF and uses a RCEC instead of root port.[1]

[1] - 12.2.1.1 - RCH Downstream Port-detected Errors

>>> +
>>> +	return true;
>>> +}
>>> +
>>> +static bool cxl_error_is_native(struct pci_dev *dev)
>>> +{
>>> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
>>> +
>>> +	if (pcie_ports_native)
>>> +		return true;
>>> +
>>> +	return host->native_aer && host->native_cxl_error;
>>> +}
>>> +
>>> +static bool is_internal_error(struct aer_err_info *info)
>>> +{
>>> +	if (info->severity == AER_CORRECTABLE)
>>> +		return info->status & PCI_ERR_COR_INTERNAL;
>>> +
>>> +	return info->status & PCI_ERR_UNC_INTN;
>>> +}
>>> +
>>> +static int cxl_rch_handle_error_iter(struct pci_dev *dev, void *data)
>>> +{
>>> +	struct aer_err_info *info = (struct aer_err_info *)data;
>>> +	const struct pci_error_handlers *err_handler;
>>> +
>>> +	if (!is_cxl_mem_dev(dev) || !cxl_error_is_native(dev))
>>> +		return 0;
>>> +
>>> +	/* protect dev->driver */
>>> +	device_lock(&dev->dev);
>>> +
>>> +	err_handler = dev->driver ? dev->driver->err_handler : NULL;
>>> +	if (!err_handler)
>>> +		goto out;
>>> +
>>> +	if (info->severity == AER_CORRECTABLE) {
>>> +		if (err_handler->cor_error_detected)
>>> +			err_handler->cor_error_detected(dev);
>>> +	} else if (err_handler->error_detected) {
>>> +		if (info->severity == AER_NONFATAL)
>>> +			err_handler->error_detected(dev, pci_channel_io_normal);
>>> +		else if (info->severity == AER_FATAL)
>>> +			err_handler->error_detected(dev, pci_channel_io_frozen);
>>> +	}
>>> +out:
>>> +	device_unlock(&dev->dev);
>>> +	return 0;
>>> +}
>>> +
>>> +static void cxl_rch_handle_error(struct pci_dev *dev, struct aer_err_info *info)
>>> +{
>>> +	/*
>>> +	 * Internal errors of an RCEC indicate an AER error in an
>>> +	 * RCH's downstream port. Check and handle them in the CXL.mem
>>> +	 * device driver.
>>> +	 */
>>> +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC &&
>>> +	    is_internal_error(info))
>>> +		pcie_walk_rcec(dev, cxl_rch_handle_error_iter, info);
>>
>> This would seem to work generically for RCEC reported errors in a VH
>> topology, so I think the "_rch" distinction can be dropped.
>>
> 
> The pcie_walk_rcec() filters on PCI_EXP_TYPE_RC_END devices. As a result this 
> iterator will not apply to VH mode devices (PCI_EXP_TYPE_ENDPOINT, PCI_EXP_TYPE_ROOT_PORT,
> PCI_EXP_TYPE_DOWNSTREAM). This series is focused on RCH mode. VH mode port error 
> handling will be addressed in future patchset. 
> 
> Regards,
> Terry
> 
>>> +}
>>> +
>>> +#else
>>> +static inline void cxl_rch_handle_error(struct pci_dev *dev,
>>> +					struct aer_err_info *info) { }
>>> +#endif
>>> +
>>>  /**
>>> - * handle_error_source - handle logging error into an event log
>>> + * pci_aer_handle_error - handle logging error into an event log
>>>   * @dev: pointer to pci_dev data structure of error source device
>>>   * @info: comprehensive error information
>>>   *
>>>   * Invoked when an error being detected by Root Port.
>>>   */
>>> -static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
>>> +static void pci_aer_handle_error(struct pci_dev *dev, struct aer_err_info *info)
>>>  {
>>>  	int aer = dev->aer_cap;
>>>  
>>> @@ -977,6 +1063,12 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
>>>  		pcie_do_recovery(dev, pci_channel_io_normal, aer_root_reset);
>>>  	else if (info->severity == AER_FATAL)
>>>  		pcie_do_recovery(dev, pci_channel_io_frozen, aer_root_reset);
>>> +}
>>> +
>>> +static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
>>> +{
>>> +	cxl_rch_handle_error(dev, info);
>>> +	pci_aer_handle_error(dev, info);
>>>  	pci_dev_put(dev);
>>>  }
>>>  
>>> -- 
>>> 2.34.1
>>>
>>
>>
