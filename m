Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F23097A6C99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 22:59:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Zx6Rl/ry;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqvDR4qJQz3cRd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 06:59:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Zx6Rl/ry;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe59::601; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=terry.bowman@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqvCS3pBsz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 06:58:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GD73qAAuiN5TGyLNZkimfwWp4vPoc9v4gZquXhaiH+boWLEbWrBr1F0iNFfz/xt51FD3pyMfV8KBYcIAkNiUliXH3Xq7QrbfrQ9UllaCQVl0E4Y9bLc8EWw0HnICBEa/wXch0RXCIy4AB64k/oEKgeGWnHaRLq2iQnB1Hsy+9wzaoAPyhlmiPkipJYY6q5yaGpNzf9cKLxp1+3e+plSm8Syof78WOk1paUFq7pIW8+zLlZGNqGwT/Fn7bg8HI7LDmpqA4YPhReehGTStyhefnp2zwGu9SRho8XubqtlYgJze6gspC3H1DIUZa3pxM1KaMbySlv2F8W7Xnz1e43HTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zElzrxuNAbWiS9RwjEVapl/4lKIEH2mbNZK6HPzhqc=;
 b=lEh1rxQc1iEkoU9P61EdKXjICFEOg8AIXZb2PwV9aFT1aWb4JmIiCIo3IjaPXvbOjx5XQ1b4j57im66MVazoduK6ZDRHpvFgZESwG1MsBRm3enKEgJF77Ef8LeCHq2rgJoixHJ2msSr0ejxgsqCy4ipjf/Ozxy8ks7L8Xr9Tf2BUHUbUzX9fT8a4S1R9V2Vw4vg4DT8zslVErnjSgYlWUSV6LTpm0OHOh8zvYh3Bq3wbw/2v/HiZ1Lon/rloYHnwKYFeUkYMSbmeb1PQH+27+hdsUzZuMCKgQRgxWpBnNVFvS/iGZSvZTSaJprOY0xPU74FnP1Li8IF6z52NUTqMlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zElzrxuNAbWiS9RwjEVapl/4lKIEH2mbNZK6HPzhqc=;
 b=Zx6Rl/ry4Fif136yKBzGj9DNvp2gsxkDf7dvtDs7R4vBVjhoEGMsEPMH46vEuxo93eGRa4GtX0W/UsReZk7XbS2pWXmbGxvMcU8FwufbxE1/ZPnDPJwxtKkrjqVlRIEAnO0HxH7tzJVt491YY6SwAoWOhsNk85Qk6UXTSCKdYXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) by
 MN0PR12MB5931.namprd12.prod.outlook.com (2603:10b6:208:37e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.27; Tue, 19 Sep 2023 20:58:15 +0000
Received: from DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::5b90:dbf9:e0a5:64cc]) by DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::5b90:dbf9:e0a5:64cc%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 20:58:15 +0000
Message-ID: <cfa1aaca-49f1-cb8c-f4d9-f96e5bdc9892@amd.com>
Date: Tue, 19 Sep 2023 15:58:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v10 13/15] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>, alison.schofield@intel.com,
 vishal.l.verma@intel.com, ira.weiny@intel.com, bwidawsk@kernel.org,
 dave.jiang@intel.com, Jonathan.Cameron@huawei.com, linux-cxl@vger.kernel.org
References: <20230831170248.185078-1-terry.bowman@amd.com>
 <20230831170248.185078-6-terry.bowman@amd.com>
 <64f0f9984932b_31c2db29461@dwillia2-xfh.jf.intel.com.notmuch>
From: Terry Bowman <Terry.Bowman@amd.com>
In-Reply-To: <64f0f9984932b_31c2db29461@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR11CA0003.namprd11.prod.outlook.com
 (2603:10b6:806:6e::8) To DS0PR12MB6390.namprd12.prod.outlook.com
 (2603:10b6:8:ce::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6390:EE_|MN0PR12MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: 7412abf0-d5e5-4f5d-6393-08dbb9532481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	47xGYoJRM9oc/dA4IVGgxe7AcmzIzsRH644hpTczp757TMtaXlaJ0Jp4O5kckNBXwCI/nv04NGBu/hHzJG5PtUAq2QdxoDs6bXE7L4zTpIlWs0rHgk3IgKJ1QOD7KAP7gBVFTxDtk9MVI8PiQ7+OsufFyQGfW3fetW6w/hz+c9Bw3/muzl2JGLfhNpMrW+vQC4fD8sbb1pykcytz5oOmVGegD61wm7aA6+WPx670ead22HeznpjWX3X3IHVaTOZSStPx8Xgv7OwO5ryQgC9iTzDy6RUjAuIxMNj/Gj8Zk89QhzhTRSu6HHoow8/KQq6MmdTqkh3lkm1eE0fj60rtOe0A5fPoF+/rZaGu7359Vxz5UVZSeUilWjcxnGHH49j/57d3R85nW4Sems4cwfReHrTzkCE/uh8gB4W/JaJcWJ9scXnoCZMUQzbhLHstz0bVRuZWChhrq0quI1ZWd9CNzTENa6339Netu0J+hYnpRlONM4HCVgsTpG+M9MFcGPu7/EPKkbjasFtPBvhqqD74fld4Bhoxp4nn57gFU8icF/1AqG1UdSJU0uHv6L0bHSXB++usba69tcpTxJIBKtuOxZgvoi42trQbMWYYFGCkBmS0UdxOG0WD0DtZvXS5eBwCEO4q8x86IgOHUQ5k+tRFOw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199024)(186009)(1800799009)(38100700002)(36756003)(31696002)(86362001)(478600001)(966005)(66476007)(66556008)(66946007)(2906002)(6512007)(6666004)(53546011)(6506007)(6486002)(8936002)(8676002)(5660300002)(4326008)(41300700001)(7416002)(31686004)(316002)(26005)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?a0svSkNWYzdOYXIxaU1mQVRPVG9VckowL3czZ2dvQmZZL2JOWFJHUTY3b0NY?=
 =?utf-8?B?MHdzTEFVbnZ2ck4yZFM3WVJSYXFYRGRxaDhRTDhpQlRUWm1YMGwyVGRwUFlJ?=
 =?utf-8?B?Rk43YVNNMkhjQ01rK3hHNGlXQ3BpQzNXOXlyWGg5ekgvYVNVMmdOM0FMWTJr?=
 =?utf-8?B?cGZsRzQrQnRjc0VYUmZUU1BYWHlEVVN2am1nMm1MYmI1UEhkYUU5OFQzdGJh?=
 =?utf-8?B?LzNyU0ltRWVqRktkS05KTUxLbG52QTl4Nk1wVGVvd003U3dtQmZuYWE5Y0x5?=
 =?utf-8?B?UWR2OXAwOHFkdy96dms3MEZqZDV3UEszT2ZPYmttbmtnNXJoUDdHVkVuRjha?=
 =?utf-8?B?b0Nwam91Szk3T3A1R3JCcG5sTnhEVFhhQmk0RjZlUmhnRU5lcWoyblovSTRv?=
 =?utf-8?B?Zm1lOFNqNk14Zy9HeG9ZTjF4Qi9Rbk9LSCtnWE5XVnNjWTBOek1UamNRNWRK?=
 =?utf-8?B?aEJkczRLQ0RJRXo1Y2RoNzRqL0NmQm42MEVqaGRPMHdtOEFnODNHMThmS25R?=
 =?utf-8?B?QklOV0tWVlpueDdlS1JDRzV6ZVFqUEQ5Z2dKMStidWdlandOTnBDWGhlM3NO?=
 =?utf-8?B?WjlBSmVPYVI2VW1Wb1FRaUxXRVBVc2lQR0lMZTQvRHdSWlpON2wwRnpnT0Z3?=
 =?utf-8?B?a0x6eXFBZW8zSWhtcXY1TXk5dTJ5bDBRSHlXd05pbFkyaGluWkx5ZUVZVlJy?=
 =?utf-8?B?VnlFL2thZUlRVE9aRE1Pdm9FblYrcE5qNHk2bXIwdjVNWUdXWmpTcUlLb1JV?=
 =?utf-8?B?SU5zampPTzBlR0dOcVBCb0I2MGFDRkhaSnMzd0Y2QkF2bjZMOHlDWG42RElO?=
 =?utf-8?B?cTJ2Q0QyMUpuZXdVMEplQ1BOQjYvM05mODAwb2pXMFVHVHM4clZyb2hoUGo2?=
 =?utf-8?B?YjdWblJyRldzeEhzcVZtemNDdTA4ekpRVXk3TlZLWWFZb1QrNXJUaWpic1Uz?=
 =?utf-8?B?cytneE9PMHNkR2Qvdm1PeUVTUE0wN2RzNEp3cWZ2dW4xWUU0SjZBU3d1OU5F?=
 =?utf-8?B?ZlkxNFlFSWxsVjdhMVYrZ1hvczE2TFp0ZVUvbDIzaUpLdUVvL2lzQXNBSWVS?=
 =?utf-8?B?TUNlR3MxZXRlRXpTY0h0RUk3cWJ4Qk5ZN2E3OEVpMzB3WnNCdlYvM1Yza08r?=
 =?utf-8?B?VVlYT256dmtDTVdXc25LWnhQVWRwZHJML0NtemF1dmlIMU9yRytMVGtmSW04?=
 =?utf-8?B?d0RyRytoZFdMMVZJMERmazd0QW9Wc1hoeXgvWmd5NXdUb3k2V3puZVJlQTk1?=
 =?utf-8?B?QWg1L0dtZWZUTFE2bEZiMTRoTUJFK0ZtR0tBQlFZSEM5empuSnJ6c25uQ2ds?=
 =?utf-8?B?dFZnUS9hVlhoeGs5VnhuWkpyV1hwbnJOZUNPT0N6NUhPZUlFWnZzdnZrWUJU?=
 =?utf-8?B?c3FTUnZqSGhMcElpQ0Ryd2RSYklGMW05UFpITTRKZUo3Y0dJekVMMDI2UmN4?=
 =?utf-8?B?WHZjUnJEaGJBL0RNeFBWWmxMYUk3VDIwS3lyb25la3dTQUNiMXVWVW9hVm9n?=
 =?utf-8?B?MkJld0JzK0txNEFRaXVnbWd1eHlDNitseXZSdlh0bHVHYTFzWElOSkhwa3pj?=
 =?utf-8?B?QzdpeFJaVW9lZS9NYXYwVjdyaUF6aTFxOU12dUkxTGtNSjhLMk16NW95MFRm?=
 =?utf-8?B?SWUwd3NFS3o3YU01czMyUWR0YXZjYnBVdEY4bjN1aDFRcDZDSmwwQXRNRlRT?=
 =?utf-8?B?SldFLzJsdGdTQ1R2bmpaeExXTzdTMXhxNTZwOEFZREUxN2c5ZnJzdlNLbVBI?=
 =?utf-8?B?bndEQWVLdk9kM3BlTmd4MVAvZ3greDhvUDQ4RWxrRGF4V3Bqdk9ldHdUbUZE?=
 =?utf-8?B?Tm5acWMzUjNyWktzRXE1Yzh3Y3FicnU1a2hsS1B4WWtRc0xmZWV4bUQ2QWVi?=
 =?utf-8?B?ZGlVNUtubU1JVWNZNCtOMXFVOTVTeWdOekpXSTB5aUR2NkFQcW94UmJaa0RQ?=
 =?utf-8?B?UGNwNXhaVlBteGU1RXNYTkg4RkpjdHdIMnNMaVl4SStkanR4SG5mbTVveDNM?=
 =?utf-8?B?YUE1ZHRqUDJZclBuaGd5aDlJd1dmMkozSlJKOGp5RTZDRFFrTUxjVmxiMEk0?=
 =?utf-8?B?aVJ0am9IRDNacEJwWENxM2tBaEhIYTFydmkybG9nUnJrQWdQcHlNUmhKcUo2?=
 =?utf-8?Q?RQQRKZEw5KtJdY0ON6kU5CQW1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7412abf0-d5e5-4f5d-6393-08dbb9532481
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 20:58:15.0418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJku53xsmc8nEY9L/Whj8oXylE7Mz+zEa2R5i9RHs3IiwICSxAlt/Ll0XCZsbX/eJ7GW5ULrSbtDqWeM1pisJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5931
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

On 8/31/23 15:35, Dan Williams wrote:
> Terry Bowman wrote:
>> From: Robert Richter <rrichter@amd.com>
>>
>> In Restricted CXL Device (RCD) mode a CXL device is exposed as an
>> RCiEP, but CXL downstream and upstream ports are not enumerated and
>> not visible in the PCIe hierarchy. [1] Protocol and link errors from
>> these non-enumerated ports are signaled as internal AER errors, either
>> Uncorrectable Internal Error (UIE) or Corrected Internal Errors (CIE)
>> via an RCEC.
>>
>> Restricted CXL host (RCH) downstream port-detected errors have the
>> Requester ID of the RCEC set in the RCEC's AER Error Source ID
>> register. A CXL handler must then inspect the error status in various
>> CXL registers residing in the dport's component register space (CXL
>> RAS capability) or the dport's RCRB (PCIe AER extended
>> capability). [2]
>>
>> Errors showing up in the RCEC's error handler must be handled and
>> connected to the CXL subsystem. Implement this by forwarding the error
>> to all CXL devices below the RCEC. Since the entire CXL device is
>> controlled only using PCIe Configuration Space of device 0, function
>> 0, only pass it there [3]. The error handling is limited to currently
>> supported devices with the Memory Device class code set (CXL Type 3
>> Device, PCI_CLASS_MEMORY_CXL, 502h), handle downstream port errors in
>> the device's cxl_pci driver. Support for other CXL Device Types
>> (e.g. a CXL.cache Device) can be added later.
>>
>> To handle downstream port errors in addition to errors directed to the
>> CXL endpoint device, a handler must also inspect the CXL RAS and PCIe
>> AER capabilities of the CXL downstream port the device is connected
>> to.
>>
>> Since CXL downstream port errors are signaled using internal errors,
>> the handler requires those errors to be unmasked. This is subject of a
>> follow-on patch.
>>
>> The reason for choosing this implementation is that the AER service
>> driver claims the RCEC device, but does not allow it to register a
>> custom specific handler to support CXL. Connecting the RCEC hard-wired
>> with a CXL handler does not work, as the CXL subsystem might not be
>> present all the time. The alternative to add an implementation to the
>> portdrv to allow the registration of a custom RCEC error handler isn't
>> worth doing it as CXL would be its only user. Instead, just check for
>> an CXL RCEC and pass it down to the connected CXL device's error
>> handler. With this approach the code can entirely be implemented in
>> the PCIe AER driver and is independent of the CXL subsystem. The CXL
>> driver only provides the handler.
>>
>> [1] CXL 3.0 spec: 9.11.8 CXL Devices Attached to an RCH
>> [2] CXL 3.0 spec, 12.2.1.1 RCH Downstream Port-detected Errors
>> [3] CXL 3.0 spec, 8.1.3 PCIe DVSEC for CXL Devices
>>
>> Co-developed-by: Terry Bowman <terry.bowman@amd.com>
>> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
>> Signed-off-by: Robert Richter <rrichter@amd.com>
>> Cc: "Oliver O'Halloran" <oohall@gmail.com>
>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-pci@vger.kernel.org
>> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
>> ---
>>  drivers/pci/pcie/Kconfig | 12 +++++
>>  drivers/pci/pcie/aer.c   | 96 +++++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 106 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
>> index 228652a59f27..4f0e70fafe2d 100644
>> --- a/drivers/pci/pcie/Kconfig
>> +++ b/drivers/pci/pcie/Kconfig
>> @@ -49,6 +49,18 @@ config PCIEAER_INJECT
>>  	  gotten from:
>>  	     https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
>>  
>> +config PCIEAER_CXL
>> +	bool "PCI Express CXL RAS support for Restricted Hosts (RCH)"
> 
> Why the "for Restricted Hosts (RCH)" clarification? I am seeing nothing
> that prevents this from working with RCECs on VH topologies.
> 

The same option can be used in VH mode. Will remove the RCH reference.

> 
>> +	default y
> 
> Minor, but I think "default PCIEAER" makes it slightly clearer that CXL
> error handling comes along for the ride with PCIE AER.
>

We found Kconfig entries do not typically list a dependancy and the default 
to be the same. We prefer to leave as 'default y'. If you want we can make 
your requested change. 

>> +	depends on PCIEAER && CXL_PCI
>> +	help
>> +	  Enables error handling of downstream ports of a CXL host
>> +	  that is operating in RCD mode (Restricted CXL Host, RCH).
>> +	  The downstream port reports AER errors to a given RCEC.
>> +	  Errors are handled by the CXL memory device driver.
>> +
>> +	  If unsure, say Y.
>> +
>>  #
>>  # PCI Express ECRC
>>  #
>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>> index d3344fcf1f79..c354ca5e8f2b 100644
>> --- a/drivers/pci/pcie/aer.c
>> +++ b/drivers/pci/pcie/aer.c
>> @@ -946,14 +946,100 @@ static bool find_source_device(struct pci_dev *parent,
>>  	return true;
>>  }
>>  
>> +#ifdef CONFIG_PCIEAER_CXL
>> +
>> +static bool is_cxl_mem_dev(struct pci_dev *dev)
>> +{
>> +	/*
>> +	 * The capability, status, and control fields in Device 0,
>> +	 * Function 0 DVSEC control the CXL functionality of the
>> +	 * entire device (CXL 3.0, 8.1.3).
>> +	 */
>> +	if (dev->devfn != PCI_DEVFN(0, 0))
>> +		return false;
>> +
>> +	/*
>> +	 * CXL Memory Devices must have the 502h class code set (CXL
>> +	 * 3.0, 8.1.12.1).
>> +	 */
>> +	if ((dev->class >> 8) != PCI_CLASS_MEMORY_CXL)
>> +		return false;
> 
> Type-2 devices are going to support the same error flows but without
> advertising the CXL class code. Should this perhaps be something that
> CXL drivers can opt into by setting a flag in the pci_dev? It is already
> the case that the driver needs to be attached for the error handler to
> be found, so might as well allow the CXL AER handling to be opted-in by
> the driver as well.
> 

At the momment type-2 devices are unsupported and the drivers are not 
available. The absence of CXL class information in type-2 devices will present 
a challenge in identifying here. We would like to defer making change here 
and address this in a future a patchset. 

>> +
>> +	return true;
>> +}
>> +
>> +static bool cxl_error_is_native(struct pci_dev *dev)
>> +{
>> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
>> +
>> +	if (pcie_ports_native)
>> +		return true;
>> +
>> +	return host->native_aer && host->native_cxl_error;
>> +}
>> +
>> +static bool is_internal_error(struct aer_err_info *info)
>> +{
>> +	if (info->severity == AER_CORRECTABLE)
>> +		return info->status & PCI_ERR_COR_INTERNAL;
>> +
>> +	return info->status & PCI_ERR_UNC_INTN;
>> +}
>> +
>> +static int cxl_rch_handle_error_iter(struct pci_dev *dev, void *data)
>> +{
>> +	struct aer_err_info *info = (struct aer_err_info *)data;
>> +	const struct pci_error_handlers *err_handler;
>> +
>> +	if (!is_cxl_mem_dev(dev) || !cxl_error_is_native(dev))
>> +		return 0;
>> +
>> +	/* protect dev->driver */
>> +	device_lock(&dev->dev);
>> +
>> +	err_handler = dev->driver ? dev->driver->err_handler : NULL;
>> +	if (!err_handler)
>> +		goto out;
>> +
>> +	if (info->severity == AER_CORRECTABLE) {
>> +		if (err_handler->cor_error_detected)
>> +			err_handler->cor_error_detected(dev);
>> +	} else if (err_handler->error_detected) {
>> +		if (info->severity == AER_NONFATAL)
>> +			err_handler->error_detected(dev, pci_channel_io_normal);
>> +		else if (info->severity == AER_FATAL)
>> +			err_handler->error_detected(dev, pci_channel_io_frozen);
>> +	}
>> +out:
>> +	device_unlock(&dev->dev);
>> +	return 0;
>> +}
>> +
>> +static void cxl_rch_handle_error(struct pci_dev *dev, struct aer_err_info *info)
>> +{
>> +	/*
>> +	 * Internal errors of an RCEC indicate an AER error in an
>> +	 * RCH's downstream port. Check and handle them in the CXL.mem
>> +	 * device driver.
>> +	 */
>> +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC &&
>> +	    is_internal_error(info))
>> +		pcie_walk_rcec(dev, cxl_rch_handle_error_iter, info);
> 
> This would seem to work generically for RCEC reported errors in a VH
> topology, so I think the "_rch" distinction can be dropped.
> 

The pcie_walk_rcec() filters on PCI_EXP_TYPE_RC_END devices. As a result this 
iterator will not apply to VH mode devices (PCI_EXP_TYPE_ENDPOINT, PCI_EXP_TYPE_ROOT_PORT,
PCI_EXP_TYPE_DOWNSTREAM). This series is focused on RCH mode. VH mode port error 
handling will be addressed in future patchset. 

Regards,
Terry

>> +}
>> +
>> +#else
>> +static inline void cxl_rch_handle_error(struct pci_dev *dev,
>> +					struct aer_err_info *info) { }
>> +#endif
>> +
>>  /**
>> - * handle_error_source - handle logging error into an event log
>> + * pci_aer_handle_error - handle logging error into an event log
>>   * @dev: pointer to pci_dev data structure of error source device
>>   * @info: comprehensive error information
>>   *
>>   * Invoked when an error being detected by Root Port.
>>   */
>> -static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
>> +static void pci_aer_handle_error(struct pci_dev *dev, struct aer_err_info *info)
>>  {
>>  	int aer = dev->aer_cap;
>>  
>> @@ -977,6 +1063,12 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
>>  		pcie_do_recovery(dev, pci_channel_io_normal, aer_root_reset);
>>  	else if (info->severity == AER_FATAL)
>>  		pcie_do_recovery(dev, pci_channel_io_frozen, aer_root_reset);
>> +}
>> +
>> +static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
>> +{
>> +	cxl_rch_handle_error(dev, info);
>> +	pci_aer_handle_error(dev, info);
>>  	pci_dev_put(dev);
>>  }
>>  
>> -- 
>> 2.34.1
>>
> 
> 
