Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FD05FEC30
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 11:57:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mphdd5Dvbz3cds
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 20:57:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BlGt2aCB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.236.40; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BlGt2aCB;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mphcd6YY7z2xGh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 20:56:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UR0wcTphtdHGBkvQmdpy7s6CD4plOdrzTWSVUhOoF98WtECnFFGEN/g1CcN4duKhUBn6NNNRZJWzCwYcacqZQooaWa3OtvTgmFe0eCzGUTj31cC7RIsAVKKekZp+27YoP5X45XR8S8MV7rUREtz1w90wrqBy22OQ8lcAUuw/IAw1uj8e9j0x8ED1i23j41hqQ9pdsChjXOZbJcIbR0N8liRhfiKBsuB8AzV0IhOnAbGjcm6kFk8bpHJ3Mxvyab3nocDVEIRx43ond/HUstajlGgvsrQOgLLnCh9t4YLXB/9PGPHGsaSq9W5LBsTtyjM3+X9bWgw1qczVpMq3GGC2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WDhYPNF1e2+dGgq+1nO9SXe474oN/4d0El66w6HJnA=;
 b=FdfSwoGu7e1M2TQyvVlYX8spfC5DFw5SKVed+cOhJ8HEdZMy9ZTgp3w2Zj0fZliW9g/W1nzF97SChxsFIK4/xCg9Fa5CCnGubGqUPxtS5KXfweY6nYvanhdZ40C9Sh8wA0ycxm3HE3p/4s1GB7tDbLu+NOeA36ALb23q5xmowckWsqZ+nC5L+zK6tcY/aDNBX5ez+fstVzAZtnlsRT2H/uISRcDGyVItzWkemPDHY73Ffu1QJqCrl0+d2bieU4iaTJLTNh/v+su/wGTXGafN4Hx5K7/MzSLnF1WHg+s3f6GqBuq++h1wImQYcdIZwYd/nkMtGPQRYPrI0e7CpNdkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WDhYPNF1e2+dGgq+1nO9SXe474oN/4d0El66w6HJnA=;
 b=BlGt2aCBatqQ3zl6L8clZ2Gf+PRE4/L4tg1UD9z3gQpsgi7pP35Acusi3zmS7nzElaSuL+muEH3itS9Gu/kJpivdv1HXX/uAT0jdHdyFNJCFeYBtgnw/1kn99AW0qxOFsEC5e+K1L6nAp0RBG4ZTiFvcDzectfhm3PzifWpgkYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by IA0PR12MB7698.namprd12.prod.outlook.com (2603:10b6:208:432::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 09:56:24 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::fa1e:a29e:2f2c:43d1]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::fa1e:a29e:2f2c:43d1%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 09:56:24 +0000
Message-ID: <0df72f8e-1c17-2140-c841-5a75fb43db14@amd.com>
Date: Fri, 14 Oct 2022 15:26:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] perf: Rewrite core context handling
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
References: <20221008062424.313-1-ravi.bangoria@amd.com>
 <Y0VTn0qLWd925etP@hirez.programming.kicks-ass.net>
 <ba47d079-6d97-0412-69a0-fa15999b5024@amd.com>
 <Y0V3kOWInrvCvVtk@hirez.programming.kicks-ass.net>
 <Y0WsRItHmfI5uaq3@hirez.programming.kicks-ass.net>
 <174fb540-ec18-eeca-191d-c02e1f1005d2@amd.com>
 <Y0awHa8oS5yal5M9@hirez.programming.kicks-ass.net>
 <Y0cn1xazYpNmqhRo@hirez.programming.kicks-ass.net>
 <99caec5f-dcdf-70c6-8909-11552ce42a20@amd.com>
 <Y0fvpQEEl/tK6mJ5@hirez.programming.kicks-ass.net>
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <Y0fvpQEEl/tK6mJ5@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0213.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::7) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6588:EE_|IA0PR12MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b205332-43a0-4423-0a78-08daadca5a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	N1qVrKfHMckgqgCnL7DuSxtLRskGQ//cGVbfFSEgBMxL1d+NfgmBJNLe6hLnhFj7vKw5CuvjH8+nYBD6xO0bmrme0LazeTCk8GShekxrDIgjm1Zadp3rLjCdsCED5bSMEYf4Tyi0K3ioz3OOr7TUlRZDHiA006OY4P0SNXjKlcGsNu/6iobzT7JZdIA+4wC2i35a7P6mp9JJ2aGmZ4EHwtyG1l7B2NcWwO7NCBW3q8RLXPhanic7k6fAY3fcrVmT3V5Sh3LV8MvPtir/ciVkG5xITPnpXh/Oye7hGg4npB6NIFQuDwzTTL812CIr8Aszi3uUurNAMYee4EuFCAJ02Gn2amXlvSpr6OjKgtAITx7D5qveWKnvJdtw9ZqUYqhFU8EkCv8Xq1lExf5j4GRWE3+PZlBwl3rlX8BcNDyy/xNk3PUagY/JmAfqEc5r5en5dMcU0TRxpBKS4rDjEFNY7mWGo7s97pCsUOpDbxTy+BDbqgBA1r5e30gI52uLJttXKl46+wKoOIf5IJN1sfB9fn3G/jMH7xW87IuxJ7oCHTA1Vrx9Z+IU3M/B7yrqriLVG7vwzq8a6iYvVMhR+HzDKdHD5c1LdZ9Xtk0wmhsGPfuBFZEXvDcSLB0poFrLjpMteKz+eHLUMryGc1nCNaFRILODz/9+fXJL43CUDo2pRH6Qw+i2NobX8NDx6cvKEShZ159MWccN41G9HZqvzYnCBdcxgzwb10CteWx6jLv9fMxw5h+TLdE64AzjZTd5rfqcKzL946HH95U+ZP7Mx/jnB3gYPYBrCGi9ZLARGjndbsD49ryR1R8aawc/6/eZWDk5cU7fkpv1op54U/3NqJOlgg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199015)(2616005)(53546011)(6666004)(26005)(6512007)(186003)(6506007)(2906002)(5660300002)(44832011)(4744005)(478600001)(7416002)(6916009)(316002)(41300700001)(8936002)(66946007)(966005)(66556008)(8676002)(66476007)(6486002)(4326008)(86362001)(31696002)(36756003)(38100700002)(31686004)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?K0NOWllnaEhkR0h3dSs3NUJady9ObktrcmFMOXZkVTNvamxPY2UxeG5iVEF4?=
 =?utf-8?B?eHplMkUrQVRZNjJtN2xmMU9tVDNBWm5scUhPZDEwSnB3STFxdEx1aUxYT2Jn?=
 =?utf-8?B?dkRheEpCTENEd05iVHluRHRaSHIwV2hUZSs0MEdKVCtVZ3lrTm8xSVViQVlV?=
 =?utf-8?B?WHhrK21yNGdaUTZpL2tZcnUyejdpN21zWjYwWFFyaWhyU1lhNGh2SSt4VzRL?=
 =?utf-8?B?SzV1VmJTZUVrZThqaUZmTVRhT3JJU1piZGtjUmxiaXdZOFBEM05FNjYwV1hQ?=
 =?utf-8?B?ZTVaK0lYcnR2allLZDN2b0hyM25BUFI4NEJzUks5NVF0TENmb0VDSHc2WEt6?=
 =?utf-8?B?SEVJSEUwY0VnL0ZZVUgzOGRpSkRpeHo3Tk8wdjhnSExmUDlVRXJsaWp1Vlpl?=
 =?utf-8?B?b1VFRjM5UldPUWpKT0MwOGs5bzN6SDF4dExONW80VnFmWGhvakp0TS9CbHh1?=
 =?utf-8?B?TlNiRE9QdDBSUCsrV21uSkszSFZFOC9FTEpoMHN4Vk1SMXNnblBCbWwxRnFi?=
 =?utf-8?B?K0lKUFVwVUlwdVd2UUd3ekUxVUh4czBlUm03dEt6ZUtIaEJNMHlHRXlsWS9R?=
 =?utf-8?B?aUxyQkZVOUlRQ2pram5pZjh6SDhvM3R4ZDFlK0F6SjBkSTcybms1ZTZaVE52?=
 =?utf-8?B?TGpJZ1RwdVFsYm8xSnN5ME00Ty9yYW55RC85MHBDYXdzdVUrYXQzRituZjJC?=
 =?utf-8?B?RlRJZHRHQ2hrRWZSSjFGajVpWk9nb1RXMGtPN2JJSW5uaG1rOXVuMWsycHVU?=
 =?utf-8?B?WHhidFFUdnBpMmx2b1NzakI2dFlmOHE5YXJ3TXdudlBrTk5rVHkzbjhYOG00?=
 =?utf-8?B?RUM1a1lRdEFpV282RXdnUU9mNWc3RTA4cjNwamlSU2RSeWZGem5rM3QzbTdC?=
 =?utf-8?B?Mm1qdE1yaW5ablpEQ3d4RGNhdVNwOGF2NTVaaDB4Z0phcGNBVStKQmNua1U4?=
 =?utf-8?B?bTNKN0NRMllhQ3RiL3VnWVFuNUFSODFBc2V3eWVjVW00WXRpZ0xKQlBOT1BH?=
 =?utf-8?B?YjArUmJtMVJzR3Y1all1WWQxOEY5NWlhSG9hSlFOYlFvY1FJbEptNHQwVzcv?=
 =?utf-8?B?RnY0aVVjRjY5NGllbkJGeFBuajJaMDhmalZ3ck1qYU5xYTcybUVYTml4WHZk?=
 =?utf-8?B?K3R1ZVlqYWgxcXlGUi9JQXpyazdrRkpMVXV6NklaYThZOXpCYVp1N21XcFZa?=
 =?utf-8?B?M3Z2K2RiandDUVJwcVdNRjIvUDUrTCtRTzE0eHdYYnRNSUlwUzFkTVh1ZVRP?=
 =?utf-8?B?ZDhqOWNXZUFTOEMya2VuLzhJRlZaZGlMaHBjU1BabTBKeWY4bkR1bnFzd29v?=
 =?utf-8?B?eThsU0dqM2FyZjhjbE15aE1pbzFVaE81L1cvbVM3ekFsNHVKRnhIK0lrTmxk?=
 =?utf-8?B?dWdOVU9WeC8vcXRjQTdoT1o4cnYrODhTaXkrQmtlUjExeTJtQ0JiWDhaYlAy?=
 =?utf-8?B?bU9VK3dDOUUySEFKMy9rV3R1dyt1SUx0Y3ZjYlFRZHNMUzF3M3IxWHNnTE9I?=
 =?utf-8?B?VGVNODBpVUkwV3crUHpvVUM2NW5OUU94VE02UmZOQUx5Qk5uZUJNeFBmckE2?=
 =?utf-8?B?eE4vSjFnS2lDZTlrbFBPSFV2bUsrMkFVRHo0WmNMVC9EbzFGaDkweW43cVNQ?=
 =?utf-8?B?ZXMwRUYwTW5pNzFPdzlXMmdFYzhUTG4xMExBckNYV1pkQldSdStLUlo4aFdU?=
 =?utf-8?B?VVU2YXlKV0p6T1N5b1VtVWFvTllNeURWVXZTYllnSStHNlQzM3kzWEhwV0ZM?=
 =?utf-8?B?T1ZRSXE2b01zU2QxZnhlTmlTaXBXaHY4eG9YSHprZm9HaG5Wd2JUY05hMUNn?=
 =?utf-8?B?Vkc1MVhQODFZOWk0dS9waUpHVlB1RFNKMEZHeU5GOGxFcmxuZWdvTndIODl5?=
 =?utf-8?B?UDE2NjlRelRkWVZkZWVQUkViQm54QkFqR0w1TExoTmF5UGt4eExXSXl3b3Yw?=
 =?utf-8?B?L21rZit4YUFFbkdPSjcyL1B6UGdvUEp3UW1Vd2Y0NDN6dTIzcnNqMEc4U1pW?=
 =?utf-8?B?cjRNNWg2b1BOZXVJdkdWWlh3QmR1SlVyM1lVVythVWpGRWxGMGVFOWlNdjZm?=
 =?utf-8?B?VUp3U29yckV6eDlmWG1LUisrMXVnckV4MWJ1MXZIVTExcEJTUDNtMlBCOGdS?=
 =?utf-8?Q?GakYDz8NiV37IdbxsJOO3nF95?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b205332-43a0-4423-0a78-08daadca5a7f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 09:56:24.3057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QoHjFVTRkZP7ibTAu8VF1fsK0giXuyGyZdoMUa9CKk5M/jmRq35efmjJX0lGe7vXP7wI7R1U3wq2giX2GkWHnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7698
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
Cc: mark.rutland@arm.com, irogers@google.com, songliubraving@fb.com, sandipan.das@amd.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, eranian@google.com, kim.phillips@amd.com, will@kernel.org, robh@kernel.org, ak@linux.intel.com, jolsa@redhat.com, mingo@redhat.com, linux-s390@vger.kernel.org, frederic@kernel.org, srw@sladewatkins.net, acme@kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, linux-arm-kernel@lists.infradead.org, Ravi Bangoria <ravi.bangoria@amd.com>, ndesaulniers@google.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ananth.narayan@amd.com, linuxppc-dev@lists.ozlabs.org, santosh.shukla@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13-Oct-22 4:29 PM, Peter Zijlstra wrote:
> On Thu, Oct 13, 2022 at 03:37:23PM +0530, Ravi Bangoria wrote:
> 
>>> -	refcount_t			refcount;
>>> +	refcount_t			refcount; /* event <-> ctx */
>>
>> Ok. We need to remove all those // XXX get/put_ctx() from code
>> which we added to make refcount a pmu_ctx <-> ctx.
> 
> Them already gone :-) I've not yet fixed up the typoes, but current
> version should be here:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=perf/core
> 
> Thanks!

I've been running perf-fuzzer on Xeon machine since yesterday and I don't see any
issue. Will do the same on my AMD machine as well over the weekend.

Thanks,
Ravi
