Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9B25FD79D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 12:09:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp4x40G3tz3dsG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 21:08:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=N1aCnpEV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.237.81; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=ravi.bangoria@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=N1aCnpEV;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mp4w3741nz302k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 21:07:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fO5Lc4+LcvXwz4/FuACjusnmCT8xiXhZxa+u/L/tWh/+Xj1NA/7cLivybJmtl1uOWVhksmn1QZIzdjVsDDszXVGbVnwDfI+aNERlTVClU/HwHumdNYi+ggonVbc0pENK4ew1aCvyYTaGqShKgY5/fltGCHfXMkfZ2PfuGTgnQe6Vz5vKxWuY+fQoXsuoTzEigWz7QentN0WbOWQneC2z+6ngX9//MFIv67Z6x8ra6r/MPmDb5qOOVrk69IGsGxaiBzU2E12oF5bPAA+rCu86plS1uqp7AKR/xBU2bhREcsLJbwNMr2LnP4ZFeLEWn0eTcV6A5cHJ1PHRTTWKe+OIxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vw1+L3nz2vrNvCZWknNB6pVtjJghrO0Pl/CzgwFjdAM=;
 b=KP51lgbE5ZOKdUk21qelN7q2igwPeHDO5w683I1PfHBWhN8y5bKHMNncucOoRV3HiSe8funa/pNUrHTQdeLQ6sWaXcKEqwy9NHbIRvW3OrHJTHRFSAYrheTJ96XoBiLcT4HZfZVPcEm1gKRedVhdgZ6vxrFGOdPmqWBXzHryJVWMJrYMfgSuUI33ffdIZDPgdfjjv7yQ7fYGjWV58uyHYd9GcR2wr0x+2DAX40Gm/kRLViq55fKazVXE1tKIhKU9b9TLUp1nVMOoAZHS4fu36XMtftJWQLJfuW9b5V5GqexXp3VERuYL2sDN5tJSQd1W5y/iGHTKoepvqiwYgT5yWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vw1+L3nz2vrNvCZWknNB6pVtjJghrO0Pl/CzgwFjdAM=;
 b=N1aCnpEVIsINIn/+v45jq48p7CZO8/At+czfvUpxkeNRhyBPdxtyQk7uvG8sMZWMVC/oeYlt8OpZjFgY/TG9d+QiUMYSNwEZmu37chFAecRoqICdV5ioegQiG3A9OE/sOGCUdUS9tM4oDjsSzWa5/Uwwsu4VaPqgxxVbVJzyZms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6588.namprd12.prod.outlook.com (2603:10b6:510:210::10)
 by LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Thu, 13 Oct
 2022 10:07:40 +0000
Received: from PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::fa1e:a29e:2f2c:43d1]) by PH7PR12MB6588.namprd12.prod.outlook.com
 ([fe80::fa1e:a29e:2f2c:43d1%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 10:07:40 +0000
Message-ID: <99caec5f-dcdf-70c6-8909-11552ce42a20@amd.com>
Date: Thu, 13 Oct 2022 15:37:23 +0530
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
From: Ravi Bangoria <ravi.bangoria@amd.com>
In-Reply-To: <Y0cn1xazYpNmqhRo@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::15) To PH7PR12MB6588.namprd12.prod.outlook.com
 (2603:10b6:510:210::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6588:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 29433180-13c1-4768-144e-08daad02c2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4CX+RGk93GRzKBYLOkemqA/ZURNail/fQWi6dvjJIZ6HuxeRV8mW+y53HyfhEw+SVmCWFuMDdNgjM4H4Uq0yFAz65MO/6MZQKl/Py4FnyuybKOzotS75zWHveUtNUyMovCbYwXgM4ks3ZEKcfld4nZRL0qVKm99e81RIF84dN7G+lvRJ/GDFkarVxbdVLVa+Wo99iTHs1uq1ESMMmJDkcN/p3jfkR4RXm+JenlKS7YtYy7q4LVmpisW+MEpontq+Iy5EZWakGz98w1oIkTHFkGRLba0MCJY44YyQLWPA7kJ1vJ83k8xeSz15M+D7Pb2K2jXH9elEYvdameR7aaOixm8/XGIgAWQBYpAFoWj1KoHC7z2SPBCBiUm2Rqrbq0bEXoxJvPHZYqJ2oXlm7XgvibH+8a4X7+MLlXWKDwwRQKlQJkMfE3+OsdigEei6v/9zNy07pNJ0vNSqkzVoYOTLhArGWL9jlAqXVb1Au+BEe57xvt22TQNowqOOBKYh6ySVxpBpsSJODNj6919rasHkQu+nUa+NAUBa10WLNXW1zTXJgfverq47SHNKRBy6eqNF7vsYIAEBT9Fe405oYbAWnXUJ/tGWMd8fbG6BpplkfmjCEtiO8MAVzsAUSaDMcN5P/MLz/3wraRiiRW0B2zWWN+9MkaJRAQ99CqxU0C+6GmfLWR6T2Fp7N0sw7WvYqu4obMkTWfNwPszKFkN1/iQQoKWuzUr5Q5+oGuQ7ho0PsTap+2k9B90s76gM8Biw/GrCCdhho6UcqNIjwCAVaqwquV0U+iTnzK/5Sejwr+z4CYJ7EoAnfCmjiU4iH/mQjJWr
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6588.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199015)(6506007)(186003)(53546011)(86362001)(316002)(6666004)(6916009)(2616005)(31686004)(26005)(6512007)(31696002)(478600001)(66946007)(83380400001)(66556008)(66476007)(7416002)(5660300002)(41300700001)(38100700002)(8936002)(44832011)(4326008)(8676002)(6486002)(2906002)(36756003)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?RnlweDJmVVJRSkgxRXQzbUNmMmIwSXpnZ2p1NWxmaWJBUFE1czh3WjRBNDR6?=
 =?utf-8?B?dGd5UTF1MjRldUNRc1lMTnIzZ3FVd0VBS08rZzg4WTR0Qi93QjYyUHJYbzRI?=
 =?utf-8?B?Z080MzR4TU9tWkdUY0ZFTFJRaDNYTXY0SmFYVEE0SnQ5SzBhT2tIaVpNa2Nr?=
 =?utf-8?B?b3drNTJDeEdjYUdLc2ptSmhrVG52N3lCY0xXdkxlN1BLWFBxY3dFVFp5MHBx?=
 =?utf-8?B?ZldKWml4amxRRjhYSXJkVkhXR29GOGFZZzRKNHlJSEZPb280c09BOE5DK0Jz?=
 =?utf-8?B?R0l3c1JhbWhaNWNqbTdiMTE4RjhJR2JtdjBxU0hERTdVZC9FY3Z6WU5Xc2da?=
 =?utf-8?B?OHF1UXNZQ001YzVYSmdSU041dm9ZaE9Ic1htR2hGM1dranlRaitRQVNuYXds?=
 =?utf-8?B?SzczNFpjNjEySlVYN3JidWpOUXVEc0hyci81Y3Y5eitCcXk1UkJXU2JqWjM2?=
 =?utf-8?B?N3pQV3lzQmQydWk5dVk5MUc3NkJXRjRrVGpWVko4T3R5WExDN3RTWklsN2RC?=
 =?utf-8?B?bVZVYjg5UGM1NExZL1NBRlZDYk9HbkRCMmU4ektXbUlaSTJEUU5TRmJFcjZB?=
 =?utf-8?B?bHBlS2lsWlBJRTl4aW9EcDloTzhwOFYwdDFTcHJ6K0FVaHJsVy9DcTY1aVRs?=
 =?utf-8?B?QXo3OHF5bHdiUXA4KzZMVERYZ3g5QTNaWVVhQzdVT1d4NWVENStEazFDQnNL?=
 =?utf-8?B?cEZRNXAweC9IL25wOHRmUGdhbWk1eDhUeVVuZ1FEUjdQYktKTUYwWGJna0d2?=
 =?utf-8?B?cEErU1kwVitEa2lWMkFFcFc4NWxIdUNlbEgxQWpQYmwyZWhHOTBQcTVEK1Js?=
 =?utf-8?B?L24rOXJTVEFPcTNoRHR6Rk16VHhJanMzY0Q0YzIrcUZKMEN2MEw1bEhRc3Vu?=
 =?utf-8?B?aFlCeStFemRIeVlYTnlwUmE1VC9WOXVYZ0FpTHhRTWpyNml4YjhxUi9uNFFl?=
 =?utf-8?B?NzhtcnZseXFYQmo1RTVsN1cwU1F2Zm5hL0JVSUEwY2N3cnZ5ajEvTzQ0RWJt?=
 =?utf-8?B?YUVzMUVtbVZkREpvK0lDMmo5dC9jenJkdGcrbE1JUE5SSzh3aU8vYWkra3Vj?=
 =?utf-8?B?Q1h2elhCOU83Vm1lS3ZGTXdhWU8rc0trUkV0dklpZzVTM3MyS2NPbkxQTWpi?=
 =?utf-8?B?dkdBSVdEeWt2UmNTVVZKUDNjdVNoZURjSnlaY1JWT1FsaTMxa1BBVktLRDho?=
 =?utf-8?B?SndlYTcrK2dUSnBVckpVcStLR29qdzQwMTc4VEUzdUgxbjc3UXFoNXdMYmpI?=
 =?utf-8?B?ZWExMERBN2FIK1pGUFJPK1kvMFc0VnVEWHJHSXlOSklTT2xxZzNaUlg4Zndp?=
 =?utf-8?B?NFc2UU03QkROS3FYa0FGL1BLK2hUdFp4T0VqODFTOFIyYUkvZ1dSQ2dDdDU0?=
 =?utf-8?B?RFNTTy83Rk1abTZzbFNEN3F0Z3VUN3hEK25qeXdMeVhwdEVpTllrTlUrblZ0?=
 =?utf-8?B?SWV4Y2lxLzZCTmdSSno4cEwwOFlCVEZ3ejRaMnpxOFdjQXl1NzgwM3VOWVhO?=
 =?utf-8?B?QWxnVWJRMHNtcEs3M0VZWHBTQ0ZJRWFtOStCcDk2ZUJSQTFla0JOZE5MeTBT?=
 =?utf-8?B?Q2ZoU0xnS0lrc3NQYm5QTEMxQk14ZndBVXV4ZTR2aUFWelJiS3pIZGtjeUVl?=
 =?utf-8?B?K0EyNk1TengxdGUwSlFhOEhvWHNmTnp4K2ZuVi9kK1c0SXRVcWVGWUZxV1Z5?=
 =?utf-8?B?bGNwZmlQSHJGdUphUGxjckZnWGoydVExdFpCbUZ5ZDlQNm01c2NicW5TYlNu?=
 =?utf-8?B?QUxHQ0ZUUUVmT0NmSCtKTWxlRFFXZmhVdk8zNTRHRURaeEs2VnA3N1VtUUtm?=
 =?utf-8?B?Y015c1BqZDVjTHVtdmF1ck9pa29vOEhYSjJmYUtQVUtBcmtXWHVyTUhTbVov?=
 =?utf-8?B?R3VBWDRrTXZyNGQzZ2pEdGJWYUZPRndCR2puekdLN3ZoS1lJTEJHTVFuZ2FW?=
 =?utf-8?B?cHNMOFc5WDJ3Q3ZUc01oRXBuTVhJSjdMRWtmbmF6M1dldzZDTXJSaFg2R2pr?=
 =?utf-8?B?WVE1eTUrNFhsVXF1bWU2YnhCK040OVBCS1dHS0w4VGZuY3BHMTNPNG9maGJ6?=
 =?utf-8?B?WGdZTkh5aVNld1Nxek5FK0FCVURETWhubldEU2RqWDhxTS9xaFpGZ1ZFWGJL?=
 =?utf-8?Q?b+CUpmLaIU5cfPVedM9igb3dx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29433180-13c1-4768-144e-08daad02c2e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6588.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 10:07:40.1372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVeNRIL20bgGhn1aDNq35WclrpRrx8BGk7dmzmmOVALI/9hUVXLcBSErEUE6ekkWT1ZuK4cSMNBhwgQE2TmL5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848
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

On 13-Oct-22 2:17 AM, Peter Zijlstra wrote:
> On Wed, Oct 12, 2022 at 02:16:29PM +0200, Peter Zijlstra wrote:
> 
>> That's the intent yeah. But due to not always holding ctx->mutex over
>> put_pmu_ctx() this might be moot. I'm almost through auditing epc usage
>> and I think ctx->lock is sufficient, fingers crossed.
> 
> So the very last epc usage threw a spanner into the works and made
> things complicated.
> 
> Specifically sys_perf_event_open()'s group_leader case uses
> event->pmu_ctx while only holding ctx->mutex. Therefore we can't fully
> let go of ctx->mutex locking and purely rely on ctx->lock.
> 
> Now the good news is that the annoying put_pmu_ctx() without holding
> ctx->mutex case doesn't actually matter here. Since we hold a reference
> on the group_leader (per the filedesc) the event can't go away,
> therefore it must have a pmu_ctx, and then holding ctx->mutex ensures
> the pmu_ctx is stable -- iow it serializes against
> sys_perf_event_open()'s move_group and perf_pmu_migrate_context()
> changing the epc around.
> 
> So we're going with the normal mutex+lock for modification rule, but
> allow the weird put_pmu_ctx() exception.
> 
> I have the below delta.
> 
> I'm hoping we can call this done -- I'm going to see if I can bribe Mark
> to take a look at the arm64 thing soon and then hopefully queue the
> whole thing once -rc1 happens. That should give us a good long soak
> until the next merge window.

Sounds good. Thanks for all the help!

I've glanced through the changes and they looks fine, below are few minor
points.

> + * Specificially, sys_perf_event_open()'s group_leader case depends on
> + * ctx->mutex pinning the configuration. Since we hold a reference on
> + * group_leader (through the filedesc) it can't fo away, therefore it's

typo: can't go away

> -	refcount_t			refcount;
> +	refcount_t			refcount; /* event <-> ctx */

Ok. We need to remove all those // XXX get/put_ctx() from code
which we added to make refcount a pmu_ctx <-> ctx.

> +#define double_list_for_each_entry(pos1, pos2, head1, head2, member)	\
> +	for (pos1 = list_first_entry(head1, typeof(*pos1), member),	\
> +	     pos2 = list_first_entry(head2, typeof(*pos2), member);	\
> +	     !list_entry_is_head(pos1, head1, member) &&		\
> +	     !list_entry_is_head(pos2, head2, member);			\
> +	     pos1 = list_next_entry(pos1, member),			\
> +	     pos2 = list_next_entry(pos2, member))
> +
>  static void perf_event_swap_task_ctx_data(struct perf_event_context *prev_ctx,
>  					  struct perf_event_context *next_ctx)

While this is unrelated to this patch, shouldn't we also need to swap
event->hw.target? A purely hypothetical scenario: Consider two processes
having clone contexts (for example, two children of the same parent).
While process switch between these two, the perf event context would get
swapped but event->hw.target will point to other sibling's task_struct.
If any one process exit just after single context swap, _free_event()
will call put_task_context() on sibling process' task_struct.

> @@ -12436,6 +12463,9 @@ SYSCALL_DEFINE5(perf_event_open,
>  			 * Allow the addition of software events to hw
>  			 * groups, this is safe because software events
>  			 * never fail to schedule.
> +			 *
> +			 * Note the comment that goes with struct
> +			 * pmu_event_pmu_context.

typo: perf_event_pmu_context

The good (or bad? ;)) news is, perf test and Vince's perf_event_tests
are running fine without any regression on my machine.

Thanks,
Ravi
