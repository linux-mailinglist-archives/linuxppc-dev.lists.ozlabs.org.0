Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3342176CA1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 03:58:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WhXg0LXczDqfL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 13:58:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam12-bn8-obe.outbound.protection.outlook.com
 (client-ip=40.107.237.70; helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=kim.phillips@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=eFWqtiYE; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WZVr2dp1zDqYh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 09:26:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtegsG+q7VeJvuvnSMXBnz1Y0Ato2/PxRELP9MXqGa9PcX6h3yYgwLvWwhHbYSPEh3tikALH6AnAQrT0AWg5bAZjkdi9AE51hpW8yPglBq8ZuxWxJE267J/NRLd1Qhz1aGw0BRrkfw+gguz0kAwFBQX1Zjk25ALq+F6roGKQ2i9jDeArY3G3etaWLLKFyqIyYlx6JzaGm3Tm+9RHhBJsQJ7pa2huQzC8Ge5VzWNL6w/NWy2NjYOFkU0Irkv/LdTBM8RU7O/U3c2LYS0CAnKpPqkFVUlqRSzv1CrcuCiEq1Lh5ASRIryvlgnwQOjqvv+MjNk/EZ4I/voFVnbTjWNhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xePwD/9oTSo6veH2q5Nf1c461X+YDRVi9pjFeJLdyso=;
 b=DeBJCPBaTZr7jXDr24Hhl1k4mKq5bhN3CLnIQb7ODPQ3+AX4IAj4kl7LrymBXaWtBH2BVhQv2Y+YwiyQWlpmjPomnMG2W1KEFDt0eHQ/xgOaLH3X7SqsE/kdpM9LhSVgs9mDb1WNfIwBqkrm8BYw+2Tv3jvIgjfUWFZSV7kw8SGYQIkbtuAgYEAm+itkrvKsN7BITw13KFCE6lady7TSfhp9ZhygxVYEFXLf+VfeJlDhz6e8L/3M4e4MM5hFepwSHP4WZGXy5srUe/nKIfcNJuCKijkGBXL05TX0HoNVeJDXxMTt4kQwtsw7Bv6S6Kffp8hCIqG6ixtLOhMRIBlBTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xePwD/9oTSo6veH2q5Nf1c461X+YDRVi9pjFeJLdyso=;
 b=eFWqtiYE7n2LHuXTRQwB+6VxnSxfOL7wFcMFNMGWAsWHw81A8Ygsta7P3wy0Nmeqsh/5fdkLpqKF/YUY+etlyG91IZ7Q/9dns0KEDY3Qq8AJcwAzwdGNpDborjpYhY6wTItvETqGw+GckOluoLzTRO0AsLAgjyQr8DhSgAnpVoM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=kim.phillips@amd.com; 
Received: from SN6PR12MB2845.namprd12.prod.outlook.com (2603:10b6:805:75::33)
 by SN6PR12MB2622.namprd12.prod.outlook.com (2603:10b6:805:72::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Mon, 2 Mar
 2020 22:25:59 +0000
Received: from SN6PR12MB2845.namprd12.prod.outlook.com
 ([fe80::dd6f:a575:af8e:4f1b]) by SN6PR12MB2845.namprd12.prod.outlook.com
 ([fe80::dd6f:a575:af8e:4f1b%7]) with mapi id 15.20.2772.019; Mon, 2 Mar 2020
 22:25:59 +0000
Subject: Re: [RFC 00/11] perf: Enhancing perf to export processor hazard
 information
To: Stephane Eranian <eranian@google.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
 <20200302101332.GS18400@hirez.programming.kicks-ass.net>
 <CABPqkBSzwpR6p7UZs7g1vWGCJRLsh565mRMGc6m0Enn1SnkC4w@mail.gmail.com>
From: Kim Phillips <kim.phillips@amd.com>
Message-ID: <df966d6e-8898-029f-e697-8496500a1663@amd.com>
Date: Mon, 2 Mar 2020 16:25:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <CABPqkBSzwpR6p7UZs7g1vWGCJRLsh565mRMGc6m0Enn1SnkC4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM3PR14CA0129.namprd14.prod.outlook.com
 (2603:10b6:0:53::13) To SN6PR12MB2845.namprd12.prod.outlook.com
 (2603:10b6:805:75::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.136.247] (165.204.77.1) by
 DM3PR14CA0129.namprd14.prod.outlook.com (2603:10b6:0:53::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Mon, 2 Mar 2020 22:25:58 +0000
X-Originating-IP: [165.204.77.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94815d2b-6cfa-4012-fd47-08d7bef8af18
X-MS-TrafficTypeDiagnostic: SN6PR12MB2622:|SN6PR12MB2622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2622A71410E94EBC652A953D87E70@SN6PR12MB2622.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 033054F29A
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(189003)(199004)(66476007)(5660300002)(36756003)(66946007)(16576012)(478600001)(4326008)(31686004)(66556008)(6486002)(7416002)(316002)(53546011)(86362001)(110136005)(8676002)(52116002)(2906002)(54906003)(26005)(81156014)(81166006)(31696002)(186003)(16526019)(8936002)(2616005)(956004)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2622;
 H:SN6PR12MB2845.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hdaZS8zra4H3It/T6hgmDGvOzKLubE6kgeYs1Wd4qwbGEQgS0Ro4SUoZkEG3FE7YxoGCfAB4loxbEjCKWdErug4byQ8gw6Fv40ekp0eCe+TP/0rvu+jIzq1qZArFUsCkx7GEm1TW0iHInzsQwreelCzl1Srb1yNVxTblxyNUCogmqOcbgTdHLd0UsxM7N/ci8zsHee0HImsxGE88YACYQ9BKqTuAkn5yobxWVDpesnhS/uJXdHHcb8x6QjpQTH6Ws+MXboIkSfjF8fBrqVbjoSPFNTnVU6N1pdNS2WzfJ3rZBgAJzrFw5YELYn0r5+QxKpUNUnr66NaLgfrRIsxDybhE4ynWUTJE98+QgWNUmAyEIdV9K/DFesAf3+wxre4VmMu1TAprKDUnVZZdCfPkJQ4B3gMV9hp5L9lvP6RTibpfV+QjW8TYnhJvEzng/6so
X-MS-Exchange-AntiSpam-MessageData: lrhEG9wYmAIY1KpjajfXttz7zKOM0ZYUwnP35QPEEfds9D4Rftz9TzDIk31NhLT1kKP/oKUFPgyvH/rc4ODn4ColB3+WAGvCZPIxilIQtJEt2g5HmghlQ/SnYP7+jElMisDU6qXMY4vq6NzlbMfOQA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94815d2b-6cfa-4012-fd47-08d7bef8af18
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2020 22:25:59.7322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YILT2AnjPXwkGTbyM7/Pzey9S+3rmTw73XaWZUCCRyjWIQPhe7L6kWCg+kU8EoaqttmWFfEXQuD+2FOAWSbhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2622
X-Mailman-Approved-At: Tue, 03 Mar 2020 13:55:46 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Robert Richter <robert.richter@amd.com>, yao.jin@linux.intel.com,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 maddy@linux.ibm.com, Namhyung Kim <namhyung@kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
 Alexey Budankov <alexey.budankov@linux.intel.com>, "Liang,
 Kan" <kan.liang@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/2/20 2:21 PM, Stephane Eranian wrote:
> On Mon, Mar 2, 2020 at 2:13 AM Peter Zijlstra <peterz@infradead.org> wrote:
>>
>> On Mon, Mar 02, 2020 at 10:53:44AM +0530, Ravi Bangoria wrote:
>>> Modern processors export such hazard data in Performance
>>> Monitoring Unit (PMU) registers. Ex, 'Sampled Instruction Event
>>> Register' on IBM PowerPC[1][2] and 'Instruction-Based Sampling' on
>>> AMD[3] provides similar information.
>>>
>>> Implementation detail:
>>>
>>> A new sample_type called PERF_SAMPLE_PIPELINE_HAZ is introduced.
>>> If it's set, kernel converts arch specific hazard information
>>> into generic format:
>>>
>>>   struct perf_pipeline_haz_data {
>>>          /* Instruction/Opcode type: Load, Store, Branch .... */
>>>          __u8    itype;
>>>          /* Instruction Cache source */
>>>          __u8    icache;
>>>          /* Instruction suffered hazard in pipeline stage */
>>>          __u8    hazard_stage;
>>>          /* Hazard reason */
>>>          __u8    hazard_reason;
>>>          /* Instruction suffered stall in pipeline stage */
>>>          __u8    stall_stage;
>>>          /* Stall reason */
>>>          __u8    stall_reason;
>>>          __u16   pad;
>>>   };
>>
>> Kim, does this format indeed work for AMD IBS?

It's not really 1:1, we don't have these separations of stages
and reasons, for example: we have missed in L2 cache, for example.
So IBS output is flatter, with more cycle latency figures than
IBM's AFAICT.

> Personally, I don't like the term hazard. This is too IBM Power
> specific. We need to find a better term, maybe stall or penalty.

Right, IBS doesn't have a filter to only count stalled or otherwise
bad events.  IBS' PPR descriptions has one occurrence of the
word stall, and no penalty.  The way I read IBS is it's just
reporting more sample data than just the precise IP: things like
hits, misses, cycle latencies, addresses, types, etc., so words
like 'extended', or the 'auxiliary' already used today even
are more appropriate for IBS, although I'm the last person to
bikeshed.

> Also worth considering is the support of ARM SPE (Statistical
> Profiling Extension) which is their version of IBS.
> Whatever gets added need to cover all three with no limitations.

I thought Intel's various LBR, PEBS, and PT supported providing
similar sample data in perf already, like with perf mem/c2c?

Kim
