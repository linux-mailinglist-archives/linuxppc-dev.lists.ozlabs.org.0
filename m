Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F302B666AA0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 06:01:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nssnz5dQrz3fBy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 16:01:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XPc959lx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.92.77; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=vidyas@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XPc959lx;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nssn30xWkz3bcs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 16:00:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPjN37J5pIcR/y+0qiIQ49gJcRY03tjgHCVv6iqcko+e/H+C5PF11ldRmDswGm4UWUTyzhs3i8/8BTL4ye8qEGnJuGVN+MThTHq578mgh4fumlBzlVRHvJrqqU7GUdbyas4P8P6OrBgw3ILERy9qBqJLidBxzOBjUqyriwFEgUbdZIpWJLSTmjPM/O/+h3M4B0biGHpebpJoIZEfalKfrXNq/qdfhrTlR1H5I2/tkn+Omfsnkfox4bls//F1zJVmZ1unWBq1lQJavy9CnjtnQA4zc6+KWyHRmINQDYjSAFQYWGHFM20hcshvn/2jyDRw72+oB6nwLi2IAnf4Vn2zvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEU6M6OkqH5wiTiygGKBaea6B7ejTnnXGky+utCfc2k=;
 b=K/3txm2OTeM1K85vlO4RIOCmX6UDL6csRGjTnBwjtO1jSFCxbQrHdsyvzXfgrccRGxzVSR7aNz11nyRRW6nKQZaPrkP+tUxvdjIfVvEyafeffrYqbrCCJLuoDjZOIlh1WeL6gfNdOatBff8pH8JzZQ1+NIBaxKfm0mMXbE885RtY9dxK/jpbfoZBjQ6jl0gHmYjq67YpO1nSXZ1N2Z5lFlfImrm/qYiAWFMa3G+axrvqx4U40xgkUp0tBrYUJZ7qNc/Q2WQlxu7B+2J1ttXp/s9m0YsSXg5qqbcUqGwgOXxLxHWILj53/GSA+ViJWNlXJ/RCIPTfw9q87+nivkhwnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEU6M6OkqH5wiTiygGKBaea6B7ejTnnXGky+utCfc2k=;
 b=XPc959lxzR6k3giHUXPNB877/Vb1W0gpqqyb8slk02fxgbJKTimFNB2NZpwUMonlbrGlXhsOXkVLOavKWQ4joQjouPNS2zgZi3REDmYuFMmqnGrO+JWlETo05S/6Wl9di9kA8ut7uMSCpVu3Wqq8fJTyd2KIVJNvQhAQ+G4y6nL5MuibiLLE+HlnOyeTShZ+djkKFia7FOfu7cLK0d/o7rh4LyXVevMg8P3c8DJEcbuH9VOdNrkSOUi9NdLd9+qznu77ymQrJGVlA7DLUokZiEOtI7HEpA/QyAoMovUmszgTR+fi7DwlR1PQXnBWUxAa0xO4IGyn4zcPiqidZPuY6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN8PR12MB2900.namprd12.prod.outlook.com (2603:10b6:408:69::18)
 by CY8PR12MB8242.namprd12.prod.outlook.com (2603:10b6:930:77::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 05:00:00 +0000
Received: from BN8PR12MB2900.namprd12.prod.outlook.com
 ([fe80::8ae8:c68e:57a9:6dae]) by BN8PR12MB2900.namprd12.prod.outlook.com
 ([fe80::8ae8:c68e:57a9:6dae%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 05:00:00 +0000
Message-ID: <4a764544-189f-65e0-7d77-84995299721d@nvidia.com>
Date: Thu, 12 Jan 2023 10:29:45 +0530
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
From: Vidya Sagar <vidyas@nvidia.com>
In-Reply-To: <de13b6bd-813f-d0bb-3a92-ea1ad3db5d54@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::21) To BN8PR12MB2900.namprd12.prod.outlook.com
 (2603:10b6:408:69::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB2900:EE_|CY8PR12MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: ac0aaed1-a7b7-4e89-912a-08daf459dba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GQeVznYAm6OHZVR4Od05mK/rOr/foXCgBvFvGN6d66zTR4MTjK96yxYPHFOoKZRm6ObpnMCwzCnflYSSs9BVj37tIBw0MGU9tEPvUoJ0KtzFYnmss26ZZP23kEGqJziKnEtHmaDJFcYokt9eNUQSU0dpYKNwzUYTQD6HgKnVz1GRQKFvRglULScu7lpcGRKxHo2tafA5j93IeN2KY4NDikscyUXKym+/3zUkTKbemihtxqhgtKyJRtmuabkxwEBQXHfmL98V7kL2Ag6Ei/zKgBcKu6K9yHoNb0Jt0BKMKfbmxOSNmEI7S34JHPbtBrcF6T2pXnjr6M7ivayR1DZsKQnWnl0L1F4sR2ewTmL9OV3ywRHAuvU5iqcN3sQjGzmTe2Nndd32soxSXiXIvlKLGv4ScOqqZBlMYcLwHmNTQ99eTnO8T2SNgwe5U+DszgFASW6Xuc41by6YYWBugypByMzOq3btPxhnpSmq9HKMPb8fIvPZaom9FNlyEaZV6YykAguY8eYlwfl1hysiyrW+cXFYLr+yuVgAOymDwHsU+SYDRnL6sp4EH+rse0ixwXBVFAh3koMknUhhrH7gu0pVjbyChRVbO0/bsjYvxXwqB9uEJ+0nVaqGqNujmoHBCwSfsuKQlmeCVFKmoavgaS2/qtqNmNfHEAQSFepzSoIKvKnU6VdGsdKsNrdsLGNia/8EgNGLgw5fNEcjxK81UqwrE6/QIxoAzOWtS9j+zqyIAhU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB2900.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199015)(6486002)(478600001)(41300700001)(6512007)(38100700002)(31696002)(86362001)(316002)(110136005)(2616005)(66946007)(26005)(66556008)(66476007)(186003)(4326008)(36756003)(53546011)(5660300002)(6506007)(2906002)(6666004)(31686004)(4744005)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?OEo4Mnd6bE9SQmcwQnVsNmYwMFlRMmlrT1hUckFKQ0RNbjFkYTRBVDRvZnMv?=
 =?utf-8?B?SjlYcHNzMkZ1WGU3Vk52a3NITXkwUEVGbXJHYXFHK2tJa0E2b2Y5d0NoWE16?=
 =?utf-8?B?QzhTU0JrdDQ5MHVPQkFXY2JuSkRzcGRYWElFWXNJaDJXalZjd3JjSEpsNTI1?=
 =?utf-8?B?R3Y1L2ZRNVcwQUxRc2ZKejlINTN0Z0U1ZGJCcVo4bDllSkpVVjUxNGFXRHM2?=
 =?utf-8?B?cVBGQi9JNWxBbTcwVzdLOFZBMjZ1ZGVZUE4vM0pFWXNjYTU4OW9qV3FDd1N3?=
 =?utf-8?B?YTVSWVBxcVFSa2F2NGppR2J1Q2tiSHFaR0FwQkZBUzJEazRHZllqd05MZkFN?=
 =?utf-8?B?U0x5NENiQ2RoeFhCV2hXMlF6Zng3Ky9WYUJoQTBsdmEySmI0cHltMkNUQUUr?=
 =?utf-8?B?MDJIelJ4dC9XVkZwdGhiSGVvTU5tTUJ4cWtYd05tNldDUU1UTGQyc2Y3T1BI?=
 =?utf-8?B?WU1mbEoxa1R3ZTUzY2lKbGw5cVh6eGp2VXo4aHFUYXRRbW1rNGs0dTV5aTQ1?=
 =?utf-8?B?by9SOTBabllNZGRsS1hFZi9TbnZ1VVc3MmZraWFBczdQbDcxaVhheFJIaHpG?=
 =?utf-8?B?RkJJblo3QVI2a0pDSVU3MTdWS0tlSkNzdUdnSDRIQTdkUS9uRGs1Z1BnNWxy?=
 =?utf-8?B?eFhuWHN3Vy9HT3FicDQwQ051TnM3QWVuTTVjTFBZWEFmSThRVVE4VXo2VzBR?=
 =?utf-8?B?VUI0d1BhakNKMnRCdHlCQ0ZFSU1PSGwzWW1FaDNJdm9PL2FqK2lTaGk1MVNC?=
 =?utf-8?B?b0V2Y0NvSGhQNVFteFJUdHRxS1pSeFNxL1B5bDV0Tm5yWWhqWUtYczhzZ3Ir?=
 =?utf-8?B?MmFEZncwcVVKZ2FZVjRxajdDZTJsSTViZGJrQ05va25pNXpkQWxmaU1BMC9Z?=
 =?utf-8?B?RkFuampwQ3NoZ28xb2NmWUtGSFpvMUFyQUpxZGdHRWd5eVNuM3Q5TzhZMEhK?=
 =?utf-8?B?Tk9BUWNWOHRnWWZaNTVxS01zRmdlUUEwUUFrSnJhTm04WSt3eWc1eDQycHB6?=
 =?utf-8?B?WTFmT09mWVplYUQ0aVcwd1VSUUJlMk0vbVVRVHlEU1R0ZUZyaSt6TEgzcWFK?=
 =?utf-8?B?bmlBK0hDdGVoOWg4Nnk2aEdMUCs4VU0raHdFRnJ1dU9hL0RUWlJxSGpmVFpZ?=
 =?utf-8?B?MUs2WWVNejNjdy9xTFh1Z0dyVlpkRUJCcFBlQkJERXRYUVliV3ArM1l1YjNp?=
 =?utf-8?B?WWpKT2wzckxqMW13R2l3dDFhWFI3WGxqYnV2a0xxYWZKRGF6dGtLMjJCRVcx?=
 =?utf-8?B?MENxSStGQU94UVB4eUpUREtLRjVuRTVXaDRhRXBlS0kwb3UyYkxwOVkrUERo?=
 =?utf-8?B?aUtJOC8yY1I5MjFJTXdLVmltWlA3QXBTamk3OXdZYW9VMzZKMmRjTXJmMVM5?=
 =?utf-8?B?dHY1Tlp1YWZqdXVvL0FQU1RET1I3NkpVVGx5NE54cTBTODVoaExMUjQ0alIx?=
 =?utf-8?B?bDhzMTcrRGN1SDhYZGhFYUlSNktrVC9Pcy9hZ1BscmljYm9oK0dRMWVYMWlN?=
 =?utf-8?B?SkVkZUgwR0MwNHZqOU9LQU92Qlp0czEzMG9aWjJ5V0FoN01YVlJvUW9JcE9l?=
 =?utf-8?B?Z2gwV2NNTUk2c3pRcFYxV0NuS3hwM1VRa2xNRGJBUDBrMy9mRzlVZFhGdkZK?=
 =?utf-8?B?eXJjaHV3TlczelpRdE1VbHAvWFFSVlcrS2ZGc2xadThFZEIxN0ZYMG5RNTRP?=
 =?utf-8?B?ZWJjOWtmeFNlSGtONjFxaG5FTVdiOUNnRDZ4cUhxS1ZZOVpCZ1d1blFTZnNO?=
 =?utf-8?B?WVJSVDJOTTEzdzBvcjJzaGJSSStCdmRudHVtRHhNNjEyZk45d2gzc2p0Rm1l?=
 =?utf-8?B?Um9iY0lmYVZ2bXVsL2l5bGc3ZzNOR1FEMy9JbDU5S21GRlB5ZW8wbmhLNUY2?=
 =?utf-8?B?UzNLbFFmL01lRVJRalY3WFFCZ0ZwcktMTkMrVUpMOXdYMGIzV2JVYTliNThG?=
 =?utf-8?B?TEZ0eC9UK2FFc25YQTFvOVk5bm94elozRTVibnFjd1BnQVZnZmRnVmo3WWQr?=
 =?utf-8?B?emhhc0VrM0FyU1NKdGc0clNGYjZHbHJubkhoWlhMTGhadDQzQUFMUXdqZk9m?=
 =?utf-8?B?N0srRGxDbjBEcVdZSm1kd0RSRytuTjlMdTJ3RGQ5T3FGZk9nKzYwR2hJdEZS?=
 =?utf-8?Q?xuDNGrqCgsOB4IUivDuoJfS7D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0aaed1-a7b7-4e89-912a-08daf459dba3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB2900.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 05:00:00.4292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4CeIt1XZN9HqaKP8swMzGWPFDvK94LrUIPrPbMoyColyb7/848/TwyTVlN+vZFI2ySMUDW5EchziFPSWrAc/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8242
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



On 1/12/2023 9:18 AM, Sathyanarayanan Kuppuswamy wrote:
> External email: Use caution opening links or attachments
> 
> 
> On 1/11/23 7:33 PM, Vidya Sagar wrote:
>> I think we still need bios option. For example, consider a system where BIOS needs to keep ECRC enabled for integrity reasons but if kernel doesn't want it for perf reasons, then, kernel can always use 'ecrc=off' option.
> 
> I agree that "on" and "off" option makes sense. Since the kernel defaults ecrc setting to "bios", why again allow it as a command line option?

Agree. "on" and "off" are fine but "default" is redundant. Do you want 
me to push a change to remove that as part of this patch itself? I think
it is more like a cleanup and should go separately.

> 
> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
