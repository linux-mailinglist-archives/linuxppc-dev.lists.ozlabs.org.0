Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF5646830
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 05:20:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSLXb3dTLz3bgt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 15:19:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Z+lznD5v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e88::60a; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Z+lznD5v;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSLWd2VBzz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 15:19:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGKJv0mOdv0EQxSAKZJ6VXamRGFl1aRVjHf9z/Dgi+++XQ/DV36OmRZnBXY6iJ4QoeCysn7I1Ff+LUXG5x8Ug5S1oukwChrT2F06zELI0p9DtxYv9uH4TxQzmtKgDQQ1K++IBJtt6NcR6HmQWsffzcJNPw1jFb+yCVFbXhsPqCNCkmqFFg/BwI54WNl/ZU+vZSemjER6NDtCxoU+EZCArJuUCrggxeSp7PAyFhiIS+fyllt9NhruFyYvjwvQTnkzh1ZwGz5gK6tuAXFT7Okk2vrD3q0gaLnrDD599Ggym8BQarcltQoChJvtTpJR866AKK3r4onMwNKABpgqljaJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brGDVKuQGPhzGaGA14ipo0zENoXAVq1qZ3gLOcUyS2M=;
 b=dHh0U5cyjdqBJO4GsSYi+dyA/9MwCXDmrmOkj9VzZbCn5cUUdrAPyW71QihBNzKniZnFQTdZwRwyypiI1PY9p6HBafCfvyJQ8PIMapgbpW70P0hw/nWCGv+J9RTCI1p1a+elVJHUN5LfuwqBnID/UdO9QZMBm9Odkbg6UzBB/PE+PNOdyv88H4GC9H5ZL4b3nerOS/wjbPrs6UcOlO/0wn7eaoz4fMxHjMryT70GMdbURSPW5HwjOG028qkUj8wwyTe+hZcxmOnRDoUjuSIeCGPecH0zAforW9psIY9XYnKGEduhXCIqDtQuyachImA+Ra+Xcqtc2NnID+Fq26tB2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brGDVKuQGPhzGaGA14ipo0zENoXAVq1qZ3gLOcUyS2M=;
 b=Z+lznD5v9uVFwRLBNmWSSGOwsCluhfr+LoNX88s4e1GkELCRCwZzaHIq3pQw6t07bArH8QkN87AaT60DRhU8LTEoqAV7GrFnR8/fZdhVDZcF9ayzMaLX/Ns5IKXhz6ervWIvzr2WTxDmmqPG+j9IngAOan5etnUk+zAifF0YBRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 04:18:45 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::aa5f:5f2c:4143:f981]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::aa5f:5f2c:4143:f981%8]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 04:18:45 +0000
Message-ID: <9c0ade1e-1c7b-90f5-0385-a568545567db@amd.com>
Date: Thu, 8 Dec 2022 09:48:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] perf test: Update event group check for support of uncore
 event
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org
References: <20221207165815.774-1-atrajeev@linux.vnet.ibm.com>
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <20221207165815.774-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::31) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6588:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d2bed9a-8688-4668-436e-08dad8d34c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tCPdlnSwqyK64FqdirwhorsTUc9at3y+Hij2zIUXFEY/GQieGDpWCES8HpFG6iZdkPLcSE/bJoJWU4N4MuCK1A7TTN4myqBe35jXEUBngbYT+48MZJ7QO8fCDx5vhTQKm4+mrBhwEs/I5FtG9r7b29o6zwbIr9W5STGCTbYkp6243+b9ruEENvlbXLgkP/Kw1BQANOVUxMVgXmcDrj2pbn53BBLN+AxnJenWcZh2h5wvSss06B3KqE1gk1M72eXLOYMpSCd/zcarSM3MCzkFD5beFf9Sqk1q3KQCkHStkoy8Nm2QWOvuUgTHlqPeBshOWX8VFsLcRDA6t20eLM/P/2MYHlWbtI1V2TMaW2pnuHrhk7FU5CIOEX9tYXLLwYPx7KxpEYhvFOV9qwOQpuy0Kri2dwUjMr4dPi+pOp1jqwF9xQmbjW3GS10JFroiBe8/UXcXdQf1E7EBtFtpHo3jLt5cB2pG0vp3nPxunb2eRtvVs5i4FI7UMwDZPtQ10jA/nLMiwM7SQ4GQUDkyzui10Dt7i0cZsWlBXcsdXuiAogLFE6V/QNNTxSIKsdAv1mgfqU6uvTCUaiXPrJiJYuROT3wX75TL5SJC20OtfTPmEwfqnuhp3PKnBHnBiz8oI9fbAITfkzQvshYpg86ONb8vfEPcaHAGKkDMO3345Emh/M+jRnivmXLTWaEsSBdan4HCEgGL3sBF1jkHL+e0uXHbKlzBNNaULeo8oRDtKwI+dMs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199015)(83380400001)(6506007)(186003)(6512007)(86362001)(2906002)(26005)(31696002)(2616005)(44832011)(316002)(4744005)(36756003)(53546011)(41300700001)(5660300002)(7416002)(8936002)(66946007)(66556008)(66476007)(31686004)(478600001)(6486002)(4326008)(8676002)(6666004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?OWRkN0Jxdkp6N0p0VVFYSXpGRjkxajJqeWdJZzNCc3BmcVdyK3JRRHJyNlEv?=
 =?utf-8?B?bkcyOTFXdFZzSUN6MmxxZFY3N3ZlSEt4Y2FpUVA3L3VrcWplR3YzZEdUZVVC?=
 =?utf-8?B?ZTNOYXVrZW1mRDU5L3hvV0xTYk02Z3MzQjhpUjZ6Y3FaeXN3NGJ4cFAyQ0Zu?=
 =?utf-8?B?S25ZakdEK0F2eURVT1ZRL25nS3hpUy9iNkREOWhMZjJPN2U3My9MZUlIZjgz?=
 =?utf-8?B?NXA3QmZkNFlaenc5UElrNGVRNmNNSTg5Tm4vc1kzV2UybmIxZUhma2lyYktu?=
 =?utf-8?B?S2xuRStFbERGNzdvR1krM05BRXJGOHF6TWczME1XNXl2MUFzaFhFQkx0N2NL?=
 =?utf-8?B?TXRoSDM1Nk1yMW11bGIvaEwyZHZCbnNrWllCRjdJd0pDbWlvNjdLN2J6d3lw?=
 =?utf-8?B?YlFkQjNCSWdwL25wb3A2K3UvdWoySUhoeENBdGNoS0JkMS9jcmtUTzV4N0FD?=
 =?utf-8?B?aUV6OWNNQnJXd2s5K0ZmTVpPZ3pRR3pBako2anJLdjZ6RjlJTG12NXE3TGRC?=
 =?utf-8?B?ZEh3RWRCNXR5LzdhZExMOEF1Smk0K25Kb1E2ZTBLSU0xTkcrMlZIcWt4N0ND?=
 =?utf-8?B?dUg0MkE0bi9qQk9ZYlQ2ZXYyTXdCN0U4a0NSY3ZBR1R6VjU2Y3VtVFR4a2Q4?=
 =?utf-8?B?MXFjUXR1Y2tUL1VmRmZyT1FBVWR1UGpPSUpTbkZwR0tHY0VHT1NOdGl1dElS?=
 =?utf-8?B?VlBhbm5PcWc3R1h2QlBJcGZzazU1cGVuK2xPdFBPSVFzemoxTHc1WFEvdkIr?=
 =?utf-8?B?azJSaHhoNTJ2a2RId1NCN0RNUVBuclJqTzFsU28rSXZNbVJkcWcvemRTclVQ?=
 =?utf-8?B?QWVYN3BPa0Q4cUhIbzB3VjdLdFhOS3FqRmJnRllzbFJQcUxjdTM5NkZCYlpT?=
 =?utf-8?B?ZWthQ054clhuUHcyNlFvY2ZOZFF2ZDBDL0ZUVHdvSjRnNGZHR255OS81N3pI?=
 =?utf-8?B?YzhnV2RtTk8wQkhSYVAxWnBVR284bUE5bnBrMVlpN281bVdqM29RZDE5cDV4?=
 =?utf-8?B?VTlMWEdmdHN5S1l4N1Z6b2FnamNzOWc3VGFNbVRSdkhRYXJGbVAwVXozYlc3?=
 =?utf-8?B?NHROMXQ3Y3R5OHJoV1A3Tm5QYzlmQWZJU2J1MnhjZThGR0hBZXRPbDZ6Tmor?=
 =?utf-8?B?M2NZZjJuL091OWZudXhjUHlybWpaUCtDak12Q2hOR1ltTVhnQmFUZWt5NWJT?=
 =?utf-8?B?aG9tb21pK3NhdWZLNGl4TXcwS01aaXdQRXdMUUxwUkdjc09YaFM0TnlOVHp6?=
 =?utf-8?B?S3N5T2o0UmMrd3pvL2VTaDBlczRMZVVjME5vaCttYWJ3aEFVdC9BaSs3dHNu?=
 =?utf-8?B?NHprZ3ZaeG8ydmRuVmV4bFFHZGNtRlVBcStQNHNXVElxUkVwYThieWxHL1ls?=
 =?utf-8?B?UjIyYzkvdkd5NzVHOEhYL1p6ajZpR3VVZFF0T2ZaeVN6RXpFQTEreDN0TE1P?=
 =?utf-8?B?aDJoMWdNMjhPWDFRc0J3a1psMXlWQmphWmhYbzdFSEFPTGdiV2VaaSsraFVh?=
 =?utf-8?B?WERSblpQQzhvSm9tZjFqOWpyb0JNLytUb1lRcUsrQStBYzNscVY4UU52ZFpo?=
 =?utf-8?B?UjZVTW9VYVIyR2ZSZDBaMEpTTVdMVTVBWEp0N1VnV2NOT1JFdGx1b1lLektH?=
 =?utf-8?B?bXBCN01zSWx0YjlLQlhwV3h1QmU3RnQrRjZOcDVMVUhZL0F2R3Zmb0tiYm1H?=
 =?utf-8?B?Mk1SVG5mc082U3lNbVAwdVhvdTdyZGYrV3pBVFg2WVVIdHZ0eTczVjhSODNV?=
 =?utf-8?B?OGFXSHoyVTJJSlFUMnpDcDZXdnZjQkhXUFFLSm41L2k0M2dpVGxHQWY2bzFh?=
 =?utf-8?B?OWtrbElIeU9PTWJMMndFOWdnUHdIQlJSQkpROU5tM2xqVjJoUHhSWC91R09D?=
 =?utf-8?B?VlpJRjFHdFBNVlUrNW9DeVRZMTcvV01sc1NwYzlWcThrcmlrVlE4Z0dmQmMz?=
 =?utf-8?B?THJmOUV5TmhWMFMzSFhXdDZmTDZNU0NFcEtiZjBFejJqdWpoVE8vVHIrS0J2?=
 =?utf-8?B?dUtNY01uY2MxVzk0VVBKbDBVZnN0U2xGbWlSZG1UM3lYQXJwZ0cxRHdwaVdq?=
 =?utf-8?B?T0VWck1pUGdWNkIvczZNMXlCNnVlUEh4eGpFc2lwYjQxYVI3Z1YrZ1dpc0tj?=
 =?utf-8?Q?bK+tCMmjsM7GOBHfl2tq7RuNp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2bed9a-8688-4668-436e-08dad8d34c21
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 04:18:45.6418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbGDSfr3dK/qR+9IXfjZkwMSJnSacSFh+hfWKwfi0NS+il19Gek37pxniF5efPR+QSWgWz/Iplu9NWvvrQjNKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, Ravi Bangoria <ravi.bangoria@amd.com>, linux-perf-users@vger.kernel.org, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07-Dec-22 10:28 PM, Athira Rajeev wrote:
> Event group test checks group creation for combinations of
> hw, sw and uncore PMU events. Some of the uncore pmus may
> require additional permission to access the counters.
> For example, in case of hv_24x7, partition need to have
> permissions to access hv_24x7 pmu counters. If not, event_open
> will fail. Hence add a sanity check to see if event_open
> succeeds before proceeding with the test.
> 
> Fixes: b20d9215a35f ("perf test: Add event group test for events in multiple PMUs")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Acked-by: Ravi Bangoria <ravi.bangoria@amd.com>

Thanks,
Ravi
