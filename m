Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E2666B70
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 08:14:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nswlh3Zt8z3cGv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 18:14:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OP+VoNX5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.93.59; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=vidyas@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OP+VoNX5;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nswkd33Vzz3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 18:13:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzBbLb40QqWwhuvboBeSb4dvP0j2G5ucxsmmwixeaLijxakaTkeE4iK68tB5CjkykxWQj+s6odyAYh9TcD/a/l1j6jLZm5D6temNnfcN/ybwvgOv332pMB1kqEN5XjvR3aHEyeckOStYV96ozOB5XjORMD34Y6R0XqlRpL7OwZusAOLKiO0eG/fk3XXsBA5NgnrQU6YuJgPLxwCu3KaK9Qbz1UcAiqgPMw1Rg5GD2Mj8CYeTzwAOt1em1Ngz0NGZDWnj3qLIsbkig2Ac0cez2Rnt54UmpDZRFyVCPC0dz3hN0oht1MIgBzbx5nuQgKSnL7nFtC/M8W3hXh7ODxC3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvXHBbshstcaq8Bgey3XLTyULNkIUbeFC9M6u5ny3F0=;
 b=aNGLRy90P/sWWFmXf9WWGyu1sD5yUV7UEe+Me5wtxomRcWJ40Ty8OKKKLj71ISMLfkesGy9yg83ahociEXe55gAqkLvmAdHCLs77dMCJ51EER3lU3ZAbrG7zbU0HAlNE8zY69pAsPFyScE3MCn1GrrhmqEy9k1EULkrZZ1kd8u0T8zLe0Vwbdufy5NcVw6hfr/Xs5PCTx5uClSCDC+8XlirvP+sUHoaH3OfZDurOJFzQx91mnKxisQwr6IO+35OLRAYAMp5LTME91Yt9Dy1YREx7Ck80CLxxlE/PCk7+wz4UgHVP1ogP35pkKKS/dNHkGEZUkMZXYqxUoeS+7x5SAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvXHBbshstcaq8Bgey3XLTyULNkIUbeFC9M6u5ny3F0=;
 b=OP+VoNX5FXcaAflt15H/XHGGfY1tDav8bJvxdwDu9vYXt3YVftMwuhjJTDZR5lDveP5OEyWrklfTQYEpurE7tCc//0Atfq45s1teyoqcl9gbZf8kNNjLqJdiBsBs+dgl5e/qxF3DCvJsAls2Kn2XPNksoatSEyUKDQOdRQXskgYuBxf8AZlR+C60IYsoCnYkVfgHuS+T1CwmMbYRwSRT8c241on6Ybs5PQZGl3Vh9ugamBUHGcsI18FqkYzkv6vwc4Zw4gYfCv3aeW3KwiN9fwJXtZLYoUrJAliygChgd15QOHDwa4Yefew8em1dcHby0CRZjpSHXFOxUADdbA04hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN8PR12MB2900.namprd12.prod.outlook.com (2603:10b6:408:69::18)
 by SN7PR12MB7912.namprd12.prod.outlook.com (2603:10b6:806:341::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 07:13:08 +0000
Received: from BN8PR12MB2900.namprd12.prod.outlook.com
 ([fe80::8ae8:c68e:57a9:6dae]) by BN8PR12MB2900.namprd12.prod.outlook.com
 ([fe80::8ae8:c68e:57a9:6dae%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 07:13:08 +0000
Message-ID: <1f1b328d-9324-dac9-a59c-13b5cda0bc8e@nvidia.com>
Date: Thu, 12 Jan 2023 12:42:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V1] PCI/AER: Configure ECRC only AER is native
Content-Language: en-US
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>
References: <20230111231033.GA1714672@bhelgaas>
 <880c4d3c-86d2-082c-bb58-8212adc67ff3@linux.intel.com>
 <4ddef2c9-44b6-4a08-dbeb-428cd0864c55@nvidia.com>
 <de13b6bd-813f-d0bb-3a92-ea1ad3db5d54@linux.intel.com>
 <4a764544-189f-65e0-7d77-84995299721d@nvidia.com>
 <0406e96b-56fc-d9bd-6ef8-88157ce64e1f@linux.intel.com>
From: Vidya Sagar <vidyas@nvidia.com>
In-Reply-To: <0406e96b-56fc-d9bd-6ef8-88157ce64e1f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::20) To BN8PR12MB2900.namprd12.prod.outlook.com
 (2603:10b6:408:69::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB2900:EE_|SN7PR12MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 2259336a-606c-4579-9c38-08daf46c74cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rhM04a7w8cpQI7xVJ9qlb8w4gDVEmwoT7+ynhBb417cNvhJDyl28HogO97+XQZfFWJ24uhgwi7E54P1cdFRvK4XhYKXbjFEBTZBI8mu0qOdj9aCycTOgiW26glUoQ/X4JAWwtLqL1E3d/4+6UyQVw0oIovJQkSFkqfxAIX590NLX9G2GJi3l3mm+ISedus5oDO7JQCpJMeMwtkJGgxauseio2cuoT6u0yMNogrheZBJ9dpeWtxasePVhA+34KaIVbcx9yLmWbYgnvBkP1MV2gpxgOLYX+lpRinFgKfgprZchG8j2h3/Mcom+W2Rn90P691Vo2X7RdaMWOX77BXwfamXR5NzUCmy6NuU5jRDejY2zZStI+BPnWl2rjmMcRYblFmf4XroO4Il7eApbEnZTXPqTDulWkVL2/orVQBAbeVgXX2yUDTVDE/wSHAMh6M/hho6GBwBJX4tlIDIZP97XwEGf+4ltXhYVJnrGEchMSkjTupQNC+ALb2PpHKVQaC21d0IqyrjAbWAQUy8u6vGoB39lQJzVeebD+4yj8P+KjuwIdxZPnlzDoNzJbBszCAzLBAlRJZrK05Av7ZSR4pBlryD8DjssAjioJS7MIRYKShboXlkbcLHCCLUJVVCxv5rlRTJ2cemf3nYTYoxxPQ0qrnxWG85ESyFzPyfvQ6BNeJ/1nbntcW9udh7w+BoABgw0KzF8AXCGGS1eeK/A4Z2X5qTxrwzKa1jfWG+3r+K2LxE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB2900.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199015)(5660300002)(6666004)(2616005)(36756003)(2906002)(6506007)(31696002)(38100700002)(83380400001)(86362001)(6486002)(53546011)(316002)(6512007)(110136005)(186003)(478600001)(26005)(31686004)(8936002)(66946007)(4326008)(8676002)(66476007)(41300700001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WlhmMEgrTW9VcDZRWXdNOStCZ2JRbCt3UmNRYkVjOExqS0xyQURMMEpQTTBU?=
 =?utf-8?B?SkRyWnRNUE5HbE1Hd3FFRnNqd09kTVViL2tpRTB4YUU3b1JWM0Q3VVhNSm5a?=
 =?utf-8?B?TDdQY091Y2ljdEQ2dXBTUTAvc3E2N0dwOXcwVks5MWpsei9KYWhKVkdmcEQ4?=
 =?utf-8?B?TUdFeEE3UWdZYXJEemJhd0Z5MHppd2RoTGFFcWZWZ3FHNU03MUFuRUJrMHhw?=
 =?utf-8?B?dVVHZWJYazNwYVlRTUJkSlBZcTJDWmdLL3V4YUp4cTYyMFNvWmxHTUMrNHdF?=
 =?utf-8?B?QmduY21FN3pQZWN2L0NBQy9YSUh6UEVTMjZMWG5neDliWjJpYkpEaGtHcDFS?=
 =?utf-8?B?aHRrSjIwZWgwOXVPTTFXSE5kOE55M21jcHAxQnJDZFgrVVV0VDI5bms0dlNM?=
 =?utf-8?B?dFhMR0EvMTErVHpBRFphV2pKUDJHamNPNzNseStVd21TZi9nVWdQUlNlcWt6?=
 =?utf-8?B?SVhmSXRNVWc4M1JtSnU3eTVybDFrWEJpYTFTYVFDMXkrSFpidy9VdTJtbkRi?=
 =?utf-8?B?TTVwdmorSVBBcm00R0RaYzdHVzJ5VC9xaXByb0dzNW10ZFBxS291Kyt1dFlo?=
 =?utf-8?B?N0crZnNZcE8xMW4zMFNZS01pOFQ5eWUvaThtaGNRLzNuZlNZM2prZ3BuUjFp?=
 =?utf-8?B?ZG1KMDJPbVRDR0kyM2o3eGd6aC8rYUlsYWIwTUtjMlhIWWNFQ2NnOFRCTExs?=
 =?utf-8?B?UUpobVpyS2lRd2RIOUZwSVZQU0ZMem1WaGhlOGJBMnB4RHBJdldQUUpxZUIr?=
 =?utf-8?B?aGtRbUZSUE81Qkx0T3hjMWlaMXAxN3k4N1IzRFc4ZUw1ZVZPY0M0cnB3dkJX?=
 =?utf-8?B?N3ZPc3g1RnE0b1ZoK3lMZWc5K05Ya2JHQ040cW0xcnZMRWJxdFZTK2lCVG9F?=
 =?utf-8?B?N0tMOHppMEdBclorTll0WXhqa2xGNXptTEtvckdxU0ZMeVhUREl6VW1oRjkz?=
 =?utf-8?B?THFMSmF1b1VVRXNtNVgyY1FlSzBsM2pXU3YvejUzYWFLa1V4dDV5RVVIbENs?=
 =?utf-8?B?RHUrT0RKa29BSVVETENybjJtclBNSHpHWnIwdWs1ckZBQXJqQThVRTdBWkFy?=
 =?utf-8?B?dXg3R2lLYS9mS0tOdlF5NktHeWxhZVhHLzAwQ3VFd2dtWXNpemdtc2xnanJV?=
 =?utf-8?B?VnNuS1Z6UG1SQTF0cmFsWGlhMURxSWNmZUxvRkVKRVBBWEdGUXlWZjhnZzNZ?=
 =?utf-8?B?TGVTOW1oNlROWGFKRFRvOVVZVFJTUXRuUHMvcmVXWUppQmxubUlTME0xYnFI?=
 =?utf-8?B?UnRDSTYvMmRvY3g1bU1xNWVydzBTdWV2T1RBVTBrVGUyMDcyTGp1cWROQS9w?=
 =?utf-8?B?SUhGc2trTW51L2FhSnltdWpXYk55MDBlSkJVKzBuQzFqNE5qREpQOWxmUmhP?=
 =?utf-8?B?ZVRPUE56eFNCdm1GbFRPWXl6eGRqbFlzYmVXQythOTNzanY2VUUwbkZtb2lw?=
 =?utf-8?B?dU1FYW4zM0pWcW5sZ1NKLy9yeGZQdVJ4NnBSSGV1YjFOYUZKb3V3YlJhaVhC?=
 =?utf-8?B?QlZSWlZ0bWhScjBWYU9ZeHF3YUtRNEhmSTlnbzBnS2t5M2ZnMllBaWQ5c21E?=
 =?utf-8?B?ak0xUFBtZlpVRVI5WHpVZHdxdWdMenZENjhtVVlZMjFMZEU3TEtoTWUrK09F?=
 =?utf-8?B?T2JsV1VlRTQ5OGlWanJmVGZXUmVNemJ1WmhSSmVkVVF0TWc5NFAzdloyaWM0?=
 =?utf-8?B?a0JRWFFhZ2ZhZzRyazZtcEVudGM3MFU0KzV3WmowVG5qQVEra0RjQUZaTkVX?=
 =?utf-8?B?bmhYenFLeit3ZGowbTI3V0tFZmFsMUFxaWpwbHFKdUJVK1FadnFibVdvejh1?=
 =?utf-8?B?K3dnSlBXZFhmaEczd056dkFsSVg5MkhRQ2pFR0h1UFlqbUZXcXF3TXRKMEwy?=
 =?utf-8?B?T1pGT2hFWjQ5bm9zQWJEWmpWSkcrZWhPMHM0My9MMU5xcS9HaGFPTlMvTWwx?=
 =?utf-8?B?RmRxVXB0TUkzcENJVjB3S1M5OHBQYVMvRUkwcXQxRm9QUWs1cXJDWmJyUEYv?=
 =?utf-8?B?dWZaaW16amhnQWhaZFJnWldBSzRyWnNPYXBSMDh5WEZQMXd4RE8wVEZQdHJu?=
 =?utf-8?B?VTJ1M3lwc0dKcWxDbUljRzlvQXZhdzFEVkYyRUdVaFp4clA0YXliMmxaNEpv?=
 =?utf-8?Q?MhCzipGsn9vgkJNH8D7J4ZY1k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2259336a-606c-4579-9c38-08daf46c74cf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB2900.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 07:13:08.3348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFOm2UyBzq50Nte62n2RBgF9u6yZVZWwYtzk0T0xoeGsxSvfANJm50w+QPLedZl4+yoBdP7B6Kb9iarvNfI5lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7912
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



On 1/12/2023 10:36 AM, Sathyanarayanan Kuppuswamy wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 1/11/23 8:59 PM, Vidya Sagar wrote:
>>
>>
>> On 1/12/2023 9:18 AM, Sathyanarayanan Kuppuswamy wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> On 1/11/23 7:33 PM, Vidya Sagar wrote:
>>>> I think we still need bios option. For example, consider a system where BIOS needs to keep ECRC enabled for integrity reasons but if kernel doesn't want it for perf reasons, then, kernel can always use 'ecrc=off' option.
>>>
>>> I agree that "on" and "off" option makes sense. Since the kernel defaults ecrc setting to "bios", why again allow it as a command line option?
>>
>> Agree. "on" and "off" are fine but "default" is redundant. Do you want me to push a change to remove that as part of this patch itself? I think
>> it is more like a cleanup and should go separately.
> 
> IMO, the "bios" option cleanup and command line update from Bjorn can be in one patch, and your change could be a separate patch. But it is
> up to you and Bjorn.

I think Bjorn's command line suggestion should go along with my patch 
otherwise the ECRC control through command line doesn't work if OS 
doesn't own the AER. So, it helps to make it explicit that the 'ecrc=' 
option works only if either kernel has native AER control or 
'pcie_ports' is set to 'native'

> 
>>
>>>
>>> --
>>> Sathyanarayanan Kuppuswamy
>>> Linux Kernel Developer
> 
> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
