Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB8F5F9D3F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 13:02:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmGGd67xbz3drm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 22:02:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=acDmjKcf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.93.63; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=acDmjKcf;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmGFh3rYZz2xk6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 22:01:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OldLaKX/t5uLyDN0U3a3aDqKOasYg7ztp9wq00EAEHzElW0Y3YriQMZSr1tkDLOHqTxvmx/LOxtrbK0ogvtPUix/jPFPFYnBP2iNod5/WjZ688zpUB0OlHaJbrcqZ28V5w/OWba+TRXeRPUQTDSdYUVbwO2nF6YcaILP8yE0odDTwjPUdmqDcYckmUX5QD3kE4tv9PWM9om0mqTcl8WlLr6GrDnm7HSXtbn/0g4vUtin9mUPUJ1JyrgKbt3y9EBPT5krFuut+jCW0UzP+2Mh2NCju4PM0d2d+C7dzJscM9NGF5EYj7PyBLJYsTN0tw6OgwMW4AEfD0oJDwjnfb3v+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqbJndKhM851haovRGT0w12+ppTqIP/WvpRQBgF2wUk=;
 b=BgkNtwNV45U4/z1CkmVWX6JfvVzj2HcZid8v7Sb6ieNf3teZMPfYFVdnuMk51kDBgFRYbTpRa1BknivTqdqRbaXmKEgmVW0JVOdK4jv6V+oTUC/RQvUhrbuZao9WJkkFTUtlxLIwmSnVXYDIIMnTHC5Ym9O1DJGbOEqb4pc+7162gUR0cqWEqhzinA4BC6JvxeU/9+S1tRh7MzVZbGvWGekXMHD32gYyGukc/D01+YDqU37lw/C77JnERvF/T6YBMbIwsuE7gnJU97t2x9H8OiBErXkBG5jsz4z2h986rKhNyPcym6xH33joyHlxrmK9AAfefHoPX7WQ5MqGGuty0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqbJndKhM851haovRGT0w12+ppTqIP/WvpRQBgF2wUk=;
 b=acDmjKcfXQxr+P9Fp2PyzcIxt7yWQiO7VPG5+BFNp/9uog+rXc5w6Fqa2hNySyUiDrCPsh2kUYvW+K9WSQPlf0LN2XSteJar6CYCDwiTcmT3hOAn8nMTQC7DzC3/TjxScREhAztKyz5kI6N8j7BtadI8PE2PbtJZo1cs+Z0a6AU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by DS7PR12MB6213.namprd12.prod.outlook.com (2603:10b6:8:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 11:01:39 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::4a1c:7d22:b1b:1adc]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::4a1c:7d22:b1b:1adc%6]) with mapi id 15.20.5676.032; Mon, 10 Oct 2022
 11:01:39 +0000
Message-ID: <2678797b-0ce4-29d1-5bbf-d5e0ce89aa46@amd.com>
Date: Mon, 10 Oct 2022 16:31:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] perf: Rewrite core context handling
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
References: <20220829113347.295-1-ravi.bangoria@amd.com>
 <9d7a9f37-f037-00b8-afd3-72bb840a90df@amd.com>
 <Y0PykAbq/SLjUqhO@hirez.programming.kicks-ass.net>
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <Y0PykAbq/SLjUqhO@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::6) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6588:EE_|DS7PR12MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a34364a-ff0f-4cb2-7faf-08daaaaece8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yGNVXiLdGxgk3YxQt9uXX4KOZ7beel+sweMh07LCoIuhKAK0trWninQ5AXYcpOdzVblhi+40MBk/puHXJSEPVYSo2zkBmXCknfQvsIJ1DstAADquTbSKzzHH4PG/ekbaJ978Por2jXjW9rjr0rp/AQO1idCVPiSoYqjdRcfShUV560GNRWkC6wzuAwbg/NzEXME5M8IdBUVRw/WmgSMGf5Vc6mJwzxpmSa+nHI9NlYnaMA+cW7PIBpyqpdWHYcRm0dTKmwgstJMp1InVJAxr+nZ25dAwbjSIX3odcRJ8vJtPvJnozbfikMQGVYoSfyr5xIm1ccSa0q7yavBYzyjRZ7KaT48+FlIYIuRo600DKMrBYlZi+Dxl+BQK+jbbQ11QGzdfun4/FAgFOyscdMBwD2lQeO9sYQx/ggkhY/iPlYH5CJjDabYPva7IIy5vIxomT2VNmtJxEfGna12KzJHrHiNC5c/OXuuPY8phCym1doZBMrGq/j6NK9pPOQ8y6m8E5cvKu8M8DIgq7fY4j88tkWLDwb4DbXT8LvUudM6ih0GzXOa7mzIMilsj8bjlSqFQ4aLOIKKaLp22TLs2Tnth2K+FjnNbUUU2ioPp1i3K1H/8fnXt+euZhoKV6eEZWbm3dR0ofm0/7hQt3/wTyqlhXz3asiVzqDUuCffNLUl80E50sSzF4yPHRr7ldjtFY2rDxgszaWyLlxh/7Tvz76o7kmNm0E/TZpxn6t2ocrfbcT489uNnYSGhhVHNJr/yZFG/+hx5RP//9NacsxGyQo/hu07RDqpCGEm8F7A6Jr7MCn8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(6666004)(186003)(478600001)(31696002)(6486002)(53546011)(6506007)(86362001)(31686004)(26005)(6512007)(2616005)(6916009)(38100700002)(8676002)(66556008)(2906002)(66946007)(66476007)(36756003)(4326008)(316002)(8936002)(4744005)(41300700001)(44832011)(5660300002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WTA5NkpKR05jN2NKZTdBVUJGTnNVSWpwSHhjbmNXditMNFdoNElMYXNRVkZY?=
 =?utf-8?B?a0pWUDhMU2RFRFNId2VaQ0Z1REp4OEZBK1RCcUM0VExDUEJ1WVRRdFJuSk5q?=
 =?utf-8?B?QWQ5VHdWdG1FUXZjVEVrWmRJU1JNNHQ0QUd0K1JxdUlMVDZJWlVjYndZcDND?=
 =?utf-8?B?RFo3TUtiTTV4QldmakhQZU85QjFTZEJhbUVSbDhrWTVlM1Bma3RFNWdsZVph?=
 =?utf-8?B?bitVdEFXa01DM2VHYTNpZ2llOHNqdWdKV0taQlNBZHJCbEc5a25XOC9CeCtk?=
 =?utf-8?B?QVNWTll1dWwzTE80OHQ4L0krT2V4NFM4SHNjckR5dzBSVXp3R2tubTJrWXlL?=
 =?utf-8?B?QmpGUVN2VlNTd0RXOERjc2VYTVhmS3kyWTJTamJIbG9pcEFoSU93bkR1K08z?=
 =?utf-8?B?azY4c1JxNTNZRE1xcDNlaC9MbTRRMzNqazM1aCtTMWZEa3hQc214MUR1OGFy?=
 =?utf-8?B?eVl3SEdxWEphR3lBT2lWYllEV3c2eDladkNMaWJxcnppcGN3Q2R3bUlSOHJO?=
 =?utf-8?B?b3RZNERhM3A1azArTWpHdGQ5RkhtYk1hSXFOenF1TmZKbmVXdlVQUklVVSt3?=
 =?utf-8?B?ZlBUc3VrQlhJQXlHd3E1cUtVdFowSnVBQTF1cFdpa2NMeHZrMGdRN3RwKzJ0?=
 =?utf-8?B?SUdxd2xXNVlpaitXU04rZVphV21JRjNsbFdkWUJhYzNMOUtyQTFWSEZuSWF1?=
 =?utf-8?B?OElvU01CUEUxYUV6ZVpMTTA2am55OE9LeUx6S3FXQWdzZHo4VFZxTzMva1pO?=
 =?utf-8?B?cjFMQThudVdEUkVkT3VhTWxzYnpqUzJPL2NPSHFMNmp4Z2w0YTkzSlVlU2xZ?=
 =?utf-8?B?NGQ4Tk8xa216aHFJODJYTXVtcEZJQTZMaVM5RHJ6WVBuQjA4V3E2U2ZJbnlQ?=
 =?utf-8?B?S0I0dzRUUXVXNHozcEZoN2ZJOHdDNU5Td2pCSUdONWZrSkhUNHNCYzBSR1lT?=
 =?utf-8?B?S3JHanQzcS85Z2xqTE5ScllYb2ZSUkRoeWtqQkl3VXdpWExOZ1FoaWFCTXpD?=
 =?utf-8?B?MGJTQWRJNmdjTDA5VWY2ZHVzV0l3eDZIcXFQN3c3WFZWWk5aQjVMTkZ2elhN?=
 =?utf-8?B?cXRSS05sSVZybWJhalVxYW9BYU11c29sZldmTGxCajBkclZHOEc1a091dWtm?=
 =?utf-8?B?blM3ZFFKd1dGcW5jMm9acVBYVzhmZlgweVBtdVEwdGF5WVB5ejZ6MTh2L1B5?=
 =?utf-8?B?cVo3d3hXbU9VdUprYW9VcE5OMVEzaEVoTkZ6M2Z0VjhHbmJkZjFhS1Fsd1Rt?=
 =?utf-8?B?c2xrZFkxVDlZYjNDZWY4cTdkbVFJRFVEUXlKcTBrTEpmTGhmVzY5akdxWWtG?=
 =?utf-8?B?OGpkSEhpRUo5SnRGZWxEUVFEUDZHTFNKVnNjNTByby9Ydld0bm5DRDY1QSt5?=
 =?utf-8?B?M2dBSDJNWm10ZlRCRWw2ckNVeExPd3B2MHhJMklNbXBpR1dxK0RTamZWYzFF?=
 =?utf-8?B?SmNDNmsyRm9BbjdUbEFMUTZGUmZTZzV5VWU3L25mN0tUeXV3MmhCMitUaE1p?=
 =?utf-8?B?VmI0TmxQVWd4ZThLbFNzaDRVZ2I4LzF4SXdSSFNyd1F5THpwNVlNZm52UHVT?=
 =?utf-8?B?dVV0bU1DMzhyYzJ0d3ovNzZpelEyVko2Y2l1VHBLeGZRejlwaHVmZ01qaFZG?=
 =?utf-8?B?R2JYOWw5WGtiSVFvZm8yeWpJL1podi9pclJCUkt2MGszbk9jb2tHbCtObTRJ?=
 =?utf-8?B?TG1LYjh3WXo0VTNCb1loVHF5Y2ZIRXNRbzdHOWVlUTRkYzgzZ2x3ZEVTTEda?=
 =?utf-8?B?U3JvYW9xVjc5dDVFeUpEVW13dVZBOC80QnFuWXRZSDM2eXRHQlpEc0VNT3dL?=
 =?utf-8?B?NnF3Ulp2dm9hbFRURkVqVks5NmJFOHRDemwzRXlWdllUT1cyK1RIMVpBYXFo?=
 =?utf-8?B?S29TanFFemJ5b3Y5dU9mRndUa2VSajBGSXdIWUxNRGVnakFwK1Rxbllhd2RI?=
 =?utf-8?B?K002dWduOEovcHVkdVVWd2UxaWcxYWQrM2RPRDVncmhuVFlyb2dTYy80cmxw?=
 =?utf-8?B?RFJFNjdDYVcxNjl6NnYybHU3RWdaZklDbnlkSGtydFd0cXk1bHdPejRRZHlw?=
 =?utf-8?B?TDYrNldBVGV5RTNrWjF5eVlmYlkrZjN2aWluU01wQnkxQTNUM1hSTzkyMFdq?=
 =?utf-8?Q?etnPIt5CKEfIlKaeGM5hWo7L6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a34364a-ff0f-4cb2-7faf-08daaaaece8e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 11:01:39.6728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qjP+v8oJP+CrBj/nzKsfpZN3oNQTDgJLAHv7IqZJtFdTvhEO/o6JnUudjBBFEvqZIaiQReOQzGselTutlMXZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6213
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
Cc: mark.rutland@arm.com, irogers@google.com, songliubraving@fb.com, sandipan.das@amd.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, eranian@google.com, kim.phillips@amd.com, will@kernel.org, robh@kernel.org, ak@linux.intel.com, jolsa@redhat.com, mingo@redhat.com, linux-s390@vger.kernel.org, frederic@kernel.org, acme@kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, linux-arm-kernel@lists.infradead.org, Ravi Bangoria <ravi.bangoria@amd.com>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ananth.narayan@amd.com, linuxppc-dev@lists.ozlabs.org, santosh.shukla@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10-Oct-22 3:53 PM, Peter Zijlstra wrote:
> On Tue, Sep 06, 2022 at 11:20:53AM +0530, Ravi Bangoria wrote:
> 
>> This one was simple enough so I prepared a patch for this. Let
>> me know if you see any issues with below diff.
> 
> I've extraed this as a separate patch since it's not strictly required
> for correctness and the patch is a quite large enough.

Sure. I'll keep it separate.

Thanks,
Ravi
