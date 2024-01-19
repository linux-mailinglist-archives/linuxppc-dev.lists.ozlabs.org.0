Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D1883251E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 08:43:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=bXMekPVb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGWnW0lBTz3cQf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 18:43:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=bXMekPVb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::72f; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=shijie@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2072f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGWmj3YLXz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 18:42:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7DwmpN7Km7PCYHUNgrD7TCrRxc7507oCfGOD0xTqIJvcBNEQuDgNaBBtbAo9UdUV77m7/PyLTVKrQpwSWeyNlvJTUwJgFtEaqG6hzcxuoFSmWCvp3bFx9VTH+9+mStn6zxy0r41zO39kB1OceH0id7uITnjHkl9bUtopquc4mReezTCirw2bkWyGFgr0KRc5mVDmlXwlHEcDuoJ7ZgmfMnLm3WdfdQp7GqrT68iwp8JBlN3TG2PQn8ju19xtvrtD0oePTPL74TK++dO5gEVa1iuF35WavNkbuq95Xh9poYTJw4x8aDzwVGYSjOlSxPUPpT/icaBwpfSXXU4haFUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjGitqCwTFvgxG5rupwSZQPx81+WwShPcUcfs7dPuC4=;
 b=FFLYgc5bTw9AV5UDy33666I1d+/wfr3fNL/2PRD39myXjvrczYAngiF1vZ/rXBRDWXbOYlGjXK6IQG9W1YZ2yADS7iT2t7//WaH2y/iq6ELl0PUBJf36nKbhXRp+4O86Sv/sQwm01Aro5ufsXYdYG3mn05dysERaTeSpGsotxjEnkIdeBn0rGfTHVMb78I/6lpvmDS1jsY3Ch1Ku0HumjxWyT/O0EhhPn+bcoPCXp2rYXTgxIS6kshbruPfwYa1hcGlqk+bhFBOf+pg43YNR1FcljCAmQ2Kq9STN0ioU1lED+3LGIhJKWgfI1Cjj4uERNQUybxtQ5rAbZqaLVrh2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjGitqCwTFvgxG5rupwSZQPx81+WwShPcUcfs7dPuC4=;
 b=bXMekPVbWiGEgTLEvFvOCMK7Moel7HeRcvzfQlFjn3PpmHjHvMabWZdqEQS0bVQPJSbMQjhV64VTSadORTnMS5Fa7y7yrCRy/8nRHBMBewZXoDl/jgflPP1EOkXPuSoZaQ4Fh7Bf6P38KKDDI/tXK3bLUn07WYAHKvoOSYvpNz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 BN0PR01MB7072.prod.exchangelabs.com (2603:10b6:408:16a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.24; Fri, 19 Jan 2024 07:42:23 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Fri, 19 Jan 2024 07:42:23 +0000
Message-ID: <169d5a71-8204-4773-a13c-940b4190ed37@amperemail.onmicrosoft.com>
Date: Fri, 19 Jan 2024 15:42:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of the
 correct node id
To: Yury Norov <yury.norov@gmail.com>,
 Huang Shijie <shijie@os.amperecomputing.com>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <Zan9sb0vtSvVvQeA@yury-ThinkPad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:610:5a::32) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|BN0PR01MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 27a735ca-7a17-4bc7-d81b-08dc18c22cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PeQBhKhpc3SqDvRRrCTK1NOiW4wZa6N37Pn+bWSoFNJxYblsmPxLaIsGjchCyLXCrrpSZaQtPsV+fDgvA73KtszmWt5pxeYncOFMt5EsgYuYqjSBhnQKxmebNHNkPHtvUr5MhoImruz0HUQFUmADUyM+/A3qPKHGJNI4yHiwu0JKwTns3D0cUwFyRumtZzCbEnQY/vnEKABs/z6F3qhCFws5y3sTeUpzI0Xs5M1wzYEsP/lYH4+ld6/5+74T/G0c4bW9XzleR0LgZ0arUc9fV/eYDj1YL21EuZb8od82/uPWVlZ3s8mI/kZoXeHxqkcocaVMCbkeyegnNjRCBpjVx+9vTmTAlj9ex7KPNaaf7X/3uDULwGq3NiS0Sp142NvcXODs+5v86M1b8z4lgB8jcWUxOiADaOQLOqMXL23pI6N98d1EGAOOKWFE5+ueFYXi98KJK98eb3NyuetBv3RP4hn7coTTuiQHfr4KIyDmArmGnHDuTtN5v5+BzO7ip0KPBXiU32UgBdhBoLwR0l+5mKbThpJur566fDurvd6lB4+bFExPF7074VOkpoDdIT+RSRuPB5P+30pL+U8CTffkpoBhqkQdFnbY/98SG8hG9VhnYTo7EGJ2M1Q9SpXvHtz6
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39850400004)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66476007)(8936002)(6666004)(8676002)(4744005)(6506007)(42882007)(4326008)(41300700001)(26005)(7416002)(38100700002)(5660300002)(107886003)(2616005)(2906002)(83170400001)(31696002)(6512007)(316002)(6486002)(66556008)(66946007)(110136005)(478600001)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ajNZVTdxNm0vem5jSGxsSXNqRmlzd05zc1EyWXI4TkJ5UklSMDJFem9MN1FR?=
 =?utf-8?B?dysrK29PbCtCdkpwVWpIN3N6TzROSWFKRHQ3NC9OY3pwaTVKaXdNemJ6N2Va?=
 =?utf-8?B?QmdyUTlVU0tlZ1FjV2JNUk40ajY4NnVZRDYwdVhZdWJPRnRjZDduempPQTQ0?=
 =?utf-8?B?cUh6amlTN1pIL1pmQUlUM0ZhbU4xVWR0QkpiK010dGxxWCtHQU05VFEzSXBN?=
 =?utf-8?B?ZXg0QmZoYTcvNDJJZGprUldHVVRObmwvcWFvSEdGbDE2R256VjkrVTlIa3Ji?=
 =?utf-8?B?dlZzenVScVRCZmREd1BnM1lGMW5oNGdMeVN2aFJJZUpjT0tMWjZGSHh0UDRM?=
 =?utf-8?B?a09nREhXZG8xSEp2VGg1REdUaU9hbmlnU3FteWxTdmM1bjRVc0x3QkNGSlFC?=
 =?utf-8?B?Q1g0aUpVTEFmR0NlbFYrNCtuaS92M2R2cVRXRmhTUml1WFUzQWUyOHVaTnBq?=
 =?utf-8?B?STdzb2grZkp6eFB2dmZsRG5EeS8rcEo1QkxKYU9OU2xRRzN5aVJVTFg4RlR5?=
 =?utf-8?B?STNPRUFMN1FoTnovQWdUMXR1YktYSUtnWk9IaTVtSG5PTlozVlorL3A1VUFQ?=
 =?utf-8?B?UWxwNUYreDBWSHFZOU84MUNVZXZlVjZSdENsbUcxWmRMbWZuN2YrYTlmdlRJ?=
 =?utf-8?B?Q1VzSGliMGF4RUFCdTR5N2pRdFJaaVNXUGRjQWdKM2cxNVEwSEZRenFjTmZZ?=
 =?utf-8?B?VlhwcE1xMUhkOUhYYUFyNTgrR2wyVUdtYW1rREdyUU9nUmFOQVhDQWR2bXEx?=
 =?utf-8?B?N1hyWmg2eGhxVDJFWjJlL3UrdW1DRFp0Ny9JdnRyTHlRSk8ybkN6dHRnODlu?=
 =?utf-8?B?VWtnMnVoaUdnZm1VVjRwVUs5N1g0Wlp4VGxLSzJjenJCODlCazYyaU1NaDJ5?=
 =?utf-8?B?citUVGtHVTVDTnlwbm52cG1xbWp1TW1qTHFVQ1VtdzI1Nnp2OEhvbEhFYkhp?=
 =?utf-8?B?am0wdVB3czcvenUvVUhzY0ZlSXVHd3BOSmxzVVgvZU9YSzV1NGdVR1JIbnMw?=
 =?utf-8?B?U1Bpbll3NXVUV21RaHFZQVFXZXZmZmhqckpvNE5ML0JNd1dMdFlHdG90N1I5?=
 =?utf-8?B?ZEZuTCt0NXpwQmVSVHFEU3RzRjFzVHJJUDlSWjJtRk1NOG5KcGhUbVRBSGZ0?=
 =?utf-8?B?eGNlemtRenpQZ05KZWlLSHhxaHRndkFmVk5qeUVlNnQybUlBc1M1YzZDYzZp?=
 =?utf-8?B?Qll4YXlqVERralIwTlptY01LQ0czc1RnYlgzZU5ENjFrbDhkcWpWQUM3OXFp?=
 =?utf-8?B?aC9aTFRiVzIyMnRiakRHVDBkeXdMZDJ0STY3cnVhRWpkNXpxb2lnVVBjZy85?=
 =?utf-8?B?c092Y00wZjBMOGRvQVBEZDJiVlJDcEVXU3UvM0RobUYvZURlTysyV2tjR1gz?=
 =?utf-8?B?Y0U1cVBEYmR5MjZwR2ZMR2dqWG9QZTgxQWttdTU1NW5kWDM3SUdaRHk5YjFm?=
 =?utf-8?B?a0toSndZWDN4WDJnbGJIZDY5NHgvTGhRTU5WNkU2MEFNUjJpeUlaN3RjRllB?=
 =?utf-8?B?ZndtazlxZFlKdnBSRm9wdE1zUXpXQzM1T01LNVAvYlpGYWRvN0xiN0g2V3Rq?=
 =?utf-8?B?RldGWFltaUUrRWVXWnZNbHYvNFZ4MGhjdHdsNXBPblozQm1lcFUyQlFETUs5?=
 =?utf-8?B?a3pnYkdWdDNmeHJ5M0dUcWhwOEdNZFgxUHJlK052Z1lFNERyS2I1dDI5MENp?=
 =?utf-8?B?c0hldEZRMDkwUmMwVFErQjFsT0U1emplQW1Od1FMcEloSkdyRkJDN01vUTlp?=
 =?utf-8?B?dlhpaGx3R0o2RTI1U3YzMWg2VTJIeTVOTnpnNjFPRTBOTHBrWGpPUjV3WUl3?=
 =?utf-8?B?Y3IxYXM2MU04WG5vR2dhRW9rMitOV2tDK2crcmxueVR4ckpqTmtXQkdHN0Z6?=
 =?utf-8?B?L0ZmaDUyMUtBK0Z0a1Q1NlBpVzVBOGVaR09uQ3pMeUxOcENHRFNSYUd5VTBR?=
 =?utf-8?B?dnljamRDQlZ4dGtlUXBwUzF3YU96bGdOTG4xeTJMcXVWOXUrMVdVUDhiaGts?=
 =?utf-8?B?UkNsVUI4dHhMTVVSZnR4UDNxblpNNmx5b0tvWW9SYXFkN3ExeDNyRkNHZFFl?=
 =?utf-8?B?M29IVEY1TFNERGg1WU84enNSaGExalNIaDQ5UDNoQzFjeGpYMGVkcHVGeGhv?=
 =?utf-8?B?cVcvUU41NDNOdUdNemVYZU5wWWhsZng3akhtT3pXNG5mRnNHalBKU2l3NzJB?=
 =?utf-8?Q?dTuuqPmPyomlscToe6LyG+Y=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a735ca-7a17-4bc7-d81b-08dc18c22cab
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 07:42:23.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SW+9HThxuhcbDjPCS72fZqCeK1VyHkUczY8SL8uzVy0i5XDWvxW4Mv5tj3oBr+FrF2yuEN1vA70MCM5E8ggR8lYs8gvUHGb2dxUDqZlkgq30ZeR1zvMoItMIcJlp+mhu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB7072
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, chenhuacai@kernel.org, cl@os.amperecomputing.com, vbabka@suse.cz, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, arnd@arndb.de, paul.walmsley@sifive.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2024/1/19 12:42, Yury Norov 写道:
> Regardless, I don't think that the approach is correct. As per your
> description, some initialization functions erroneously call
> cpu_to_node() instead of early_cpu_to_node() which exists specifically
> for that case.

I checked the code again.

The sparc, mips and s390 (which support the NUMA) do not support 
early_cpu_to_node().

So we cannot use early_cpu_to_node() for these functions.


Thanks

Huang Shijie

