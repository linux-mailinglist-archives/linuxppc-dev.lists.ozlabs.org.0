Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 991A16669AA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 04:34:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsqtD3tynz3fBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 14:34:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=J7GmEn+n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.237.77; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=vidyas@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=J7GmEn+n;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsqsG4tmTz3c3m
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 14:33:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtIY84dMCCWA3zpPokQlOQfFFgpGT2WpYlHxZm3ERPtf/z42XywGQzdm2eUA3OPPyclP9k0WGRfMz8szQKkcmEwokXGbo84gqmeUcooVCH8LwvKc+jlqPCMgOJenafm1UQWktUTugaklnm6sR78DMZf49wbKmCwIhl1l8gKUP3nIFQ4BTYjdheq3s0y93tNKATd6EmN1Xuw1uxZivWpQcnHmH4cd+J9ZhxCLyClLLk8YTe6gyo8nJtQrzw33MHvdkfkHG75w/6/V6E3MFeYXaJ3e5bbtiJa939ywa/I3SRps89cQXAHXR8DiqvGmbzwATvgiE1tKPv12f4/n7gtjBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9WX7/rg2SjKuMTHQWErz/wQYS3o17lcqu8cgXttv58=;
 b=JJic4qbjypvAGBDdP6Acj4bPGIkGCBqZK+c9qKME49ECBdYu6PHHPBjK0Q4RaOTNJVrGcAHfJPdCm/+DqS5y89Hk9gXwkTupKlBrTCcTH1lVbUIxoBTOgAaLBWD++1Zn8JMZtKYUosKTkyVAexVlmHdsgutOySbi+9JKm8OtfleYc1YJJTOxQfDQyIOX4it0hErGK/CDqFZlCZbF13IwJvPXs2BDk2y2riexa7L01L+eCLkcjTwI1uFK4Rik5VeODkECHrXhogZ3ZPv98kBjcz9EGqJmlu46bmKPiqr6dCmfqncK+taRa54+ZS0qm7tSxtoTtdCkgsQBmuFfXRPXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9WX7/rg2SjKuMTHQWErz/wQYS3o17lcqu8cgXttv58=;
 b=J7GmEn+nub/Qel6RHWTETGpRk8U3fnN18wjkzVHBaTx4RHmFM8Ap7H38TYXNYe8KhskgjhJXQ0luPU6cnvhw2lXxodAUhx9IpBfDuYJk2D84pNpkH2Dev6ZuAqV9DrEhgkQdDjZXxoZjeygBs0LNoZOWjSPmgaMxGOCS+etVGaM48SxniHqoXaBzGbVWJA8VlnMnO/gbuvdJOUgDgkSr0/xXyMZ/tu4AfO6QeGbqpSBHAtkn6b7a+lVFgfxgAe1llIxVek1dM7k2n7Q6mEwdP7ofblDjqop+xZqxbV7+V2SmpmHoq+ojb04//dColviME/lM4Y4eWoYXfCLx75Btlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN8PR12MB2900.namprd12.prod.outlook.com (2603:10b6:408:69::18)
 by CH2PR12MB4040.namprd12.prod.outlook.com (2603:10b6:610:ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 03:33:30 +0000
Received: from BN8PR12MB2900.namprd12.prod.outlook.com
 ([fe80::8ae8:c68e:57a9:6dae]) by BN8PR12MB2900.namprd12.prod.outlook.com
 ([fe80::8ae8:c68e:57a9:6dae%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 03:33:30 +0000
Message-ID: <4ddef2c9-44b6-4a08-dbeb-428cd0864c55@nvidia.com>
Date: Thu, 12 Jan 2023 09:03:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V1] PCI/AER: Configure ECRC only AER is native
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <20230111231033.GA1714672@bhelgaas>
 <880c4d3c-86d2-082c-bb58-8212adc67ff3@linux.intel.com>
Content-Language: en-US
From: Vidya Sagar <vidyas@nvidia.com>
In-Reply-To: <880c4d3c-86d2-082c-bb58-8212adc67ff3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To BN8PR12MB2900.namprd12.prod.outlook.com
 (2603:10b6:408:69::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB2900:EE_|CH2PR12MB4040:EE_
X-MS-Office365-Filtering-Correlation-Id: 86bfc1af-484a-4779-4ec8-08daf44dc5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yL3czGYx+0nJShYS143qjHmkz+L8UutahYqA4nf64F2cnrES9VIkXkpSg7XrgDLk/SnJ8r64I+C70D4NPY9zAi/LV99ErLjwOnnx/OplAUHqnljWZZ2cdB/hfSJaqFSMMK6zgwaZ0UH/zwUbQFQg63oRI77YK7g3iHnAZ8wU/k11VsESzdJLT3sb2VBDW1M9VuUbfNel+j0W7XY7z2MrdkZ0b1qdjHDHMDe4kzP1EvVxuk4HOXhcLuTDXf7Q7hZEmPCairwHjXvFO5NNhUaYn4Fxfv5uYqefX5JytTWsydqor9cGnp7O1YCs4F/r2ikiVWKNP2WlFkIxoOYnwyWEKgDzPq7DHteuLKsovMqNpLTYXuP1djEOS7nKgE/NiibdNgjWzRZsiWg0S+wKsbgEyuJtcn1+OjjpkVC31ApRD6LpBqudjoS7CSAmXUKxk1NgxIGs/b5yQ33Qj1E3S2wboTtFTGY2LPy7T5yo5q/jSsyBXuzOZZ0iZUILWnv9zGI6zq+9XRd/saed5NHsg5bidRUof0R05vzBnkDmE/TRJi+Nu9DYCvBKPanNKKEat9t1MbTwgLcyNCs2qEPgy+PouoWnxsYwquf1PLibMFYS7PwCGiqqqigmaTedSFZ/+92sHr9LGQjY2xeRC4G6LejwvTOkPtBNpEGiW+/XwF6/hyh61orWnxENINBppS2caculyIT1oKPbNUKOraI21LD6S/Dn7hOoYgZodhki/SkTXlg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB2900.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199015)(478600001)(6486002)(41300700001)(38100700002)(6512007)(86362001)(31696002)(316002)(110136005)(2616005)(66556008)(66946007)(26005)(66476007)(186003)(4326008)(36756003)(53546011)(5660300002)(6506007)(2906002)(6666004)(31686004)(83380400001)(8676002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?eXpvakFKN1RQVXBpN0dVeXhzeG5EL2ZzWEtaaUFlSzk5cm1RcmoxcXk0Vmtk?=
 =?utf-8?B?MElmS0FvWm5tb0h4WlZ1NzZzZ0tTcitTcGlqeGJJdTMvSUtyeGdyMnViUnpt?=
 =?utf-8?B?Vk1pdDU4TTdyVUJYL004OWIxMXBJRGd0MVVVdzgyaFk3R2dySnpUY3h3WTY4?=
 =?utf-8?B?SVZQbnM5UFZpMlRqTXZjNmZxekROTnprN1N4Y1ZkbGllc05TOTRGUkdzcTJ4?=
 =?utf-8?B?T3FBMDNUWGNVOE9hcEFITm9Ma0ZOOVp6QUtEVTRJVWtUMTdqeU51dG1lV2Zm?=
 =?utf-8?B?NUNMdDg0N3BOMERNZlFyWlpxbmRuQnZQeWhVOVJsZjZOL29sUER3V0tnYVRP?=
 =?utf-8?B?Ym0rWHF1b1czU0VwS2xOUVFTVlZ6QkJhUTZQTVZDdEtTZTZKTFFGdVozMXA1?=
 =?utf-8?B?aStuOU5NL2JkQXhvbzZxeVd3cnZRNVpyV1E3VHI0aUU4RWVTTmczYXE1SkJN?=
 =?utf-8?B?K2ZWTnMyeGZ0blovdFpOR2VFUHZKZjBrSWp4YXJkTDBzeUZsbjVLMnBqQ0xP?=
 =?utf-8?B?OGovN21qNC9jV0lmVWsrdUlrMkFXdnB6VzZhTm5oMG00UVJFdG5oV05HNVQw?=
 =?utf-8?B?dXI4NFJJRTNtbHRyaEhSa29veUZ4NG4vUVV1d3pSSDZObUtaalkrdkJGbnhv?=
 =?utf-8?B?RG5JL1Fac0NQTjhXUW1FRjlEYklEUVZtdVF5VllmclpYZUpINFBJaWVlRjU1?=
 =?utf-8?B?OWVObXYvWWZsbEtnVXVhdGh0UjZJMzdUL0JjR1dBWlBuMmh0bnZhelpDQW5K?=
 =?utf-8?B?WnZaYnZ2UU1GQytkeVI4dlNHVTJhbHY0NUp3VC9RdlpmWEZOOC80dW1ESnJB?=
 =?utf-8?B?NnU2d0Y0aStOYlMyM3h3WjBRUVZYSnFLQ1Vmd2Z5b2xNdUY2WDhjTmdVdTNI?=
 =?utf-8?B?UDNXd0NGOWYzTU95ZGJsb3hmTlNNVDFXRG9PaUhjUlZxcS91N0N0ZXFVZ0Zp?=
 =?utf-8?B?VzlyNDRVakVrTkVvZFVaelhLVnRzK2ErRTU5aStlUk9DU0FmR0hJbkNBOFJM?=
 =?utf-8?B?M0xmLzRFZGdkMlBWOXd6Vi9oSkRDTDJnMHRGaEJTdWhraXUvaXZqMTNrWkFX?=
 =?utf-8?B?dWpCYWd5REh5QWpLMTVjYnFtakIrcXQrWFFzdzhLaFVwaUprV3ZxSmhjTFNU?=
 =?utf-8?B?S0ozbkNyNjlJNjg1dm1taW54WVR2TStuTVdXdGVwSHdSYklpMXFYVnJuKzJz?=
 =?utf-8?B?SXBuNXdPMmZMOWFoa2xEMk9BUTZTcUFUZ2xPTlNZd01IZCttNUZUZTVSOUQy?=
 =?utf-8?B?citaTTBQK21LU2hmOENVTVRINEloKzh6VTFxOHNkT3M3dTZxc3FQNjJKS2E0?=
 =?utf-8?B?cHRzU05CZ0VYK2VveWdjQVE4VVgxTUtLOGV4NnhPcDFpVW5obzRUV1NWSVpF?=
 =?utf-8?B?TjB6RnVTK2ZmU0tMVHY3RTFKVkM0OHdQVk0rd2NybHNSODVJdTVTdU5ITTlP?=
 =?utf-8?B?cm9ncHJqRWhpK0tQVGRrOXJyNDRXYVAyeEovWHlza3B1QWQ5dU5tZ05uSnd0?=
 =?utf-8?B?Y1lzaG1UblJqRlNvK2Y1OHBRQlJTc3krd1NFVld3bGthM2JYaXpOY0NwaGVF?=
 =?utf-8?B?ak93U1A3Wmo5WGVLYzlCQjIzY0VWcXVTVGpWNlZSbElpSWJoY1FSbElTTDFT?=
 =?utf-8?B?QXF1VmEyNnBGUWlVM2pNUGp3RFBrb3lVZjRrR0pRZFZBRkNJMmtLTXdkWmZz?=
 =?utf-8?B?M1g5bmovVWZDbnBPQ2F0NWg4QTg0U29tcmwwdzM1Q3NqMGt3OGptMllCR0x5?=
 =?utf-8?B?MkZUb2pLNHVnQlp2VEVCRXpFVEl1MWpOUFFhcFh6ZHd4b1paUWhzbitaTVNS?=
 =?utf-8?B?Nk54RlI2bFZLVllTUlFMb2E5NlEyN0NsSVAya0pRcUEzTEJiMlRpUE9UM2Uy?=
 =?utf-8?B?RkdSYUk4dm5iRDViNm9xM2F0aTlPcHc1bHJVZGNzYWNnVW9QTzJ5QmNGbysw?=
 =?utf-8?B?QjRscWtKSVBhejRSTzhMcWVQajlDTDhvckJPZnFoWEFoUllFREc0U1JXbmlK?=
 =?utf-8?B?YVZrb0FFQjVBWGp4Y1hlbGp1VjRZT1dwTXRQZmFmbzh4YytxQWh5MFUrNG5T?=
 =?utf-8?B?SVl2MEFIZjkzb0poTm5OZndWcHBZS21OL3lmUTRCcjZBV25aaXgraDdSWU85?=
 =?utf-8?Q?EJ+6QaMhcIGBfdqTMrXiwwW78?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bfc1af-484a-4779-4ec8-08daf44dc5b5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB2900.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 03:33:29.8936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uObn6AZwVXjnUHalj1WiD/zOjY9oXC1goYvCmwJ5AG5vhcGqd5EPFl5e9n6CFBX4fWdQ+XH85Zp0BK/wK2oq7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4040
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
Cc: mmaddireddy@nvidia.com, kthota@nvidia.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, vsethi@nvidia.com, oohall@gmail.com, bhelgaas@google.com, treding@nvidia.com, linuxppc-dev@lists.ozlabs.org, sagar.tv@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/12/2023 4:57 AM, Sathyanarayanan Kuppuswamy wrote:
> External email: Use caution opening links or attachments
> 
> 
> Hi,
> 
> On 1/11/23 3:10 PM, Bjorn Helgaas wrote:
>> On Wed, Jan 11, 2023 at 01:42:21PM -0800, Sathyanarayanan Kuppuswamy wrote:
>>> On 1/11/23 12:31 PM, Vidya Sagar wrote:
>>>> As the ECRC configuration bits are part of AER registers, configure
>>>> ECRC only if AER is natively owned by the kernel.
>>>
>>> ecrc command line option takes "bios/on/off" as possible options. It
>>> does not clarify whether "on/off" choices can only be used if AER is
>>> owned by OS or it can override the ownership of ECRC configuration
>>> similar to pcie_ports=native option. Maybe that needs to be clarified.
>>
>> Good point, what do you think of an update like this:
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 6cfa6e3996cf..f7b40a439194 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -4296,7 +4296,9 @@
>>                                specified, e.g., 12@pci:8086:9c22:103c:198f
>>                                for 4096-byte alignment.
>>                ecrc=           Enable/disable PCIe ECRC (transaction layer
>> -                             end-to-end CRC checking).
>> +                             end-to-end CRC checking).  Only effective
>> +                             if OS has native AER control (either granted by
>> +                             ACPI _OSC or forced via "pcie_ports=native").
>>                                bios: Use BIOS/firmware settings. This is the
>>                                the default.
>>                                off: Turn ECRC off
I'm also fine with this change. I'll take it in V2.
> 
> Looks fine. But do we even need "bios" option? Since it is the default
> value, I am not sure why we need to list that as an option again. IMO
> this could be removed.
I think we still need bios option. For example, consider a system where 
BIOS needs to keep ECRC enabled for integrity reasons but if kernel 
doesn't want it for perf reasons, then, kernel can always use 'ecrc=off' 
option.
> 
>>
>> I don't know whether the "ecrc=" parameter is really needed.  If we
>> were adding it today, I would ask "why not enable ECRC wherever it is
>> supported?"  If there are devices where it's broken, we could always
>> add quirks to disable it on a case-by-case basis.
> 
> Checking the original patch which added it, it looks like the intention
> is to give option to boost performance over integrity.
> 
> commit 43c16408842b0eeb367c23a6fa540ce69f99e347
> Author: Andrew Patterson <andrew.patterson@hp.com>
> Date:   Wed Apr 22 16:52:09 2009 -0600
> 
>      PCI: Add support for turning PCIe ECRC on or off
> 
>      Adds support for PCI Express transaction layer end-to-end CRC checking
>      (ECRC).  This patch will enable/disable ECRC checking by setting/clearing
>      the ECRC Check Enable and/or ECRC Generation Enable bits for devices that
>      support ECRC.
> 
>      The ECRC setting is controlled by the "pci=ecrc=<policy>" command-line
>      option. If this option is not set or is set to 'bios", the enable and
>      generation bits are left in whatever state that firmware/BIOS set them to.
>      The "off" setting turns them off, and the "on" option turns them on (if the
>      device supports it).
> 
>      Turning ECRC on or off can be a data integrity versus performance
>      tradeoff.  In theory, turning it on will catch more data errors, turning
>      it off means possibly better performance since CRC does not need to be
>      calculated by the PCIe hardware and packet sizes are reduced.
> 
> 
>>
>> But I think the patch below is the right thing to do for now.  Vidya,
> 
> Agree.
> 
>> did you trip over an issue because of this, e.g., a conflict between
>> firmware use of AER and Linux use of it?  If so, maybe we could
>> mention a symptom on the commit log.  But my guess is you probably
>> found this by inspection.
Not really. I was just checking when does kernel touch ECRC settings and 
happened to find this where it configures ECRC irrespective of its 
ownership of AER registers.

>>
>> Bjorn
>>
>>>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>>>> ---
>>>>   drivers/pci/pcie/aer.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>>>> index e2d8a74f83c3..730b47bdcdef 100644
>>>> --- a/drivers/pci/pcie/aer.c
>>>> +++ b/drivers/pci/pcie/aer.c
>>>> @@ -184,6 +184,9 @@ static int disable_ecrc_checking(struct pci_dev *dev)
>>>>    */
>>>>   void pcie_set_ecrc_checking(struct pci_dev *dev)
>>>>   {
>>>> +   if (!pcie_aer_is_native(dev))
>>>> +           return;
>>>> +
>>>>      switch (ecrc_policy) {
>>>>      case ECRC_POLICY_DEFAULT:
>>>>              return;
>>>
>>> --
>>> Sathyanarayanan Kuppuswamy
>>> Linux Kernel Developer
> 
> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
