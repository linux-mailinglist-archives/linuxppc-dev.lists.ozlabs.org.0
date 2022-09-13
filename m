Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA75B6988
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 10:26:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRc4w0Phlz30M2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 18:26:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BFRGgvoR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.220.85; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BFRGgvoR;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRc462bqXz2ywN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 18:25:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtuK0k8LBGmgjn1YiNngk5HIG2ohXCA3F8+M3dX7kwVJrnxxblt0wpUW7Dh15P6xdlSfTWlnz5w1zCzEt47cZSuthgn7AzTsa6gaPCUP8YVS9Ijh6V36wZ5sZ1UCINSDNH5MqJQx/FohIonlTBIyMAKhXTeJurGho72lThRoQn84pN39XUKTQ/q6jgVVDKANQSGWHjMbeI4tB4xzzkISXrgQZH6K/jQzED00RZqr/PHH4mRknQgBsJKTCuhjT8styB0WxXaIxGMsj/ntd9sL3Vf11HUGcFDIImkMX9Jgwg3NplqGUeNiHwKpAuWffk40NKuwKrwB/i3XJgWm0+iZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXoerSv3XUwJFJ9tY+072iI8M92nS/x+Gql6GR153tg=;
 b=ZCGUNpHYfEBDgPigF9Sx3yHE1zibZL33GOk1YUCv5GIDxVIxxU5CYQ+2K/rkIaBEWfyVFOPgGvA3OpgYl9FjpAXePfO6YvYBAgDTmC3pKwa2YztOhqHpyayDmtnUVZjAEGoUNB/PTL4LB6Mw7R0bZzx6m4LkOyFoyzYMwcqUPjInzBTZ3Z4WOnTAPLG9wsqKEguOVf8mQxA+j0XgxBiKBkDVzBwU4YfLZB4YjbRBraTlOJXug6q1BtmxVLbvuZyoZho+Uq2HffzQpWYRRmDwUYf6gEGxDboVmqmDzsOq9u5Y4X+kN9a2bLgx4udhaZbnCArEpRyHEagzaHdBC19IGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXoerSv3XUwJFJ9tY+072iI8M92nS/x+Gql6GR153tg=;
 b=BFRGgvoRtHT9C8yKpS1V8wIM6sQC/XxqYhv96+QxvWYQU0T2/dqPSDNn2uYZ0drOSw7U9u9x/iDKu3zGbRYgBVuH4tBs9H4XYSBj9SlPzpHxzS2rODlTlGnpJBpVXzVYbXYRJu+fPtR3mL3VBLwEHlL9Pw2+oX0prjImXMpAp860sbJ7ALGqpIyy0fCGnhZs8usV8CyKKooJmkg5pQhuawGQK6HG1ZR++JQfM6UcBAdO9/kl7nhEWeTKECkUzyGDxSX25eCgdB/wr2VT6H7+U6XxtlsoTE6nZvA/vuKNNkFdzkjj7KyAv4Q+TPll/MrljOABDjN8cnCzFgwg/FbLZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 13 Sep
 2022 08:25:35 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::243c:a9ba:2442:8974]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::243c:a9ba:2442:8974%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 08:25:34 +0000
References: <20220913052203.177071-1-apopple@nvidia.com>
 <53390539-cfa9-7498-5b69-8fb8b307182d@redhat.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] hmm-tests: Fix migrate_dirty_page test
Date: Tue, 13 Sep 2022 18:20:45 +1000
In-reply-to: <53390539-cfa9-7498-5b69-8fb8b307182d@redhat.com>
Message-ID: <878rmnn0jq.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0055.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::6) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|MW4PR12MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd608f0-1082-41da-62d4-08da95618796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8mka48wciPWo8Gq0zkOxtprEI0gLQWAkL36TwBMG0BS8VpIbNbcruhnAvB7hv8Dv1bdlXC4ElYGedjBGHOeCq8tCuT8T9lrKJCf7NZcZ0f1fQa4ClroXdFnAPW9DkdfDCqp+uVSn8LB1zDjWa3eDjMmTVL2TZ4YmIEn4VZoVxkzMtas+tGs7lf/VWKtt1MHAitPuz+xJzTAjtrxGovlGkAhJKZAMWPc1StnYFCd3H0wlQRh1GozMOKlqLdxSZpf+1DzQcTVHJzMDZTVGQm2WxZ6NaoKnUMJ5RCaaePZSL8ckBQBDq27HPqw8A2fOjpvOwmAzViNRzSFM68e3LHIm3FM6HtOa/waTdnFDnYxtbPel+UTOJUpEUiH2Mb2fOeQXjpUDsrQ5BEmfFKgqf7pUS0kS37HcfdABZFZ4mwSeyhjpmTTdeIgWRIrWRrxX9+TqgL4nzk4DwFz0F+lAXgoK5TEWb/Um2qhJLXVjWciq4rfNHVBR/F2EYZ8FlYjWCkVenIRn/f+4abJ2udgEfSVvu443C3JklsNp98b1MQCEY9E0sSO4Rnez+LBiU9u4ceQ7Oeut8il48/mBBaqpYj4p3WWVQGQwJnIeVE8i8/NWO5JnXDykQnqM3Bxm8uSHJj2o9R6fWZSeftmqYlgIglXiphOPhwSI/sVmU8EhBNGlrBam8kYsg6rWoY2km4V3eaodu/KCbh7RHICgE2DthlI/ioUetbXRXaCoYRF+V5Ut3cQn9tz8pi9styFYZ6bVRJ/q
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(451199015)(83380400001)(8936002)(38100700002)(186003)(86362001)(26005)(66556008)(41300700001)(8676002)(478600001)(7416002)(6512007)(4326008)(66476007)(6486002)(6916009)(316002)(6666004)(2906002)(9686003)(53546011)(66946007)(6506007)(54906003)(5660300002)(14143004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?fKciIpJS29LoFTQ3B63334qq2pn17Ej+D0J8y1ZYXJw4Guf4Qo8RzzDWTX4Q?=
 =?us-ascii?Q?ZITbMJFI9OxWdHupwiR+IRRKO0aWx0hmYsGvodIBPB2EWACIp15sWFhudtaO?=
 =?us-ascii?Q?263nDO70GFrqvc1Fr04zph8q6QLz0gqpxaFcr+zG6vSCgP1h8dcJWzx+Cto2?=
 =?us-ascii?Q?/AbLjMl1CB1ml2n591CA8VA5Zql+5TD3U4jjppeCAV0o4xHic+mVcKnBFhtC?=
 =?us-ascii?Q?qu38mxL8S/NmTB3YObdWM+36f0qJskue7TAzwtQaKqUOjADu5bLsgqpJwaFr?=
 =?us-ascii?Q?RPT2ER4lSQADLEWwPX42FJs0GnvXEiQr5oCYuf8LVbOBGdwIx4p8IDNjEfNb?=
 =?us-ascii?Q?5tZzBz5UCw7c/L0e4tCvyZlGslSV4TRMXafVF2L5c0K4L66Ge9UcAPKeioBg?=
 =?us-ascii?Q?cwp7/sGZdZWfK63wUpsZYVzSC+p8mEZ5nJEO4kmKlDNM4QIPQuuTC8u7B6ud?=
 =?us-ascii?Q?IRo52nVm4ytVcjhlrGvzvdb1slzRQRhD69kbZsTh5GtwMsIq6uTtm+QDpSuD?=
 =?us-ascii?Q?rxCqKGvw4BSu/91bADhgsVAkiYxVMEQSy+UIweZNIDw8c3REKe0jbjhoT7x/?=
 =?us-ascii?Q?hIeBnChpD/G3N3thMYbajvFC8yUkC8hpA/oQRZA0ueMMWiraT1OtUAyEtlhV?=
 =?us-ascii?Q?nRxwbJmOpF4hpljYy5vmqnOVsz6LbrVOgGZyzo9UVoA6GtXF0Ismyo3tVxuh?=
 =?us-ascii?Q?hGLOm9oSxujpNveSOuad3Oh/lo8mg0ZQzWEqZtn2kqf96ZgTXobtYzyp7wNR?=
 =?us-ascii?Q?i4PU8+vzxzLHrlWZNgZScMC9mFJsgAma47K41cJFWEEgRmqcpcSBeyuy+Af8?=
 =?us-ascii?Q?nkMgzGitYEFnt5vwlfIYYsXDiUBXZuFpANV+sjqQ8/2kwt/aCvnhVI9nmsI7?=
 =?us-ascii?Q?vR11t0Xptus0zcWg1wGISNHAqu3zp1qsEDeXXWJRppMwen/POJs4ALtG7YN/?=
 =?us-ascii?Q?fRfWw96b4R5WzuL9ktkw7AM5pEEptYbAhh2NmMEpRbxVllI5dMeMMhl1C02q?=
 =?us-ascii?Q?aTyj3bGq8Lj5nhxxyLTZi064C0Si1eJeS6EMLL1DHXyC11L3XiZ3vhimQpyb?=
 =?us-ascii?Q?h2DNQUfW5o6ceX5gn1y5P6BdonNQ33Tx0K4tihXFDSEjb5n47rgy+dzAOaM2?=
 =?us-ascii?Q?x28RWYNW59UDNWgLFimpt9greNNeXw7LYG131LwF+d/ZUQi832hTq4XgsBc3?=
 =?us-ascii?Q?Yrugl73LnAKRUoGePR1MsAIMCdNbemCuEOPkqxkpZlz13+9w2qOH68MXhvO2?=
 =?us-ascii?Q?CexJOFeDEbeLzzj62xMCYb0cSVT7n0nxCM3wiv3Ym27F7CMtOFKLtFCirBOh?=
 =?us-ascii?Q?MUTdpQIpGDCYb5pD4twlI1Yq7IJ0G3ACtfxHP3qj8ptbZtOD5CoMYDTLuc35?=
 =?us-ascii?Q?3r/06E3rMqbHkgvmvIvrHim3VJT6gv2huxPH119lFaeLDliTQMzOFV8NM2eJ?=
 =?us-ascii?Q?n+jDE3K2b+IOAPS5GKJSTJVbhPoJUvX9snS/jC8Gc4qUm2HK+QyWGIuLtpPo?=
 =?us-ascii?Q?pjMq31wM1RcP8cIBYHONftOa50rCnKlBtyf/aDN5ViChAF6wdb9UqUryWLt8?=
 =?us-ascii?Q?GRGO6pvRPfnokPQmlC9m9RdPQZo/p26LbZPGphyt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd608f0-1082-41da-62d4-08da95618796
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 08:25:34.7211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8qUkMshBr99AcFXXyO+7QqgsIpyXgx9i5FEdTE1+w5TW2SSEt13arlqDzJfTtwBnW0wAqf9+L4eRNbcHSXIjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6873
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


David Hildenbrand <david@redhat.com> writes:

> On 13.09.22 07:22, Alistair Popple wrote:
>> As noted by John Hubbard the original test relied on side effects of the
>> implementation of migrate_vma_setup() to detect if pages had been
>> swapped to disk or not. This is subject to change in future so
>> explicitly check for swap entries via pagemap instead. Fix a spelling
>> mistake while we're at it.
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> Fixes: 5cc88e844e87 ("selftests/hmm-tests: add test for dirty bits")
>> ---
>>   tools/testing/selftests/vm/hmm-tests.c | 50 +++++++++++++++++++++++---
>>   1 file changed, 46 insertions(+), 4 deletions(-)
>> diff --git a/tools/testing/selftests/vm/hmm-tests.c
>> b/tools/testing/selftests/vm/hmm-tests.c
>> index 70fdb49b59ed..b5f6a7dc1f12 100644
>> --- a/tools/testing/selftests/vm/hmm-tests.c
>> +++ b/tools/testing/selftests/vm/hmm-tests.c
>> @@ -1261,9 +1261,47 @@ static int destroy_cgroup(void)
>>   	return 0;
>>   }
>>   +static uint64_t get_pfn(int fd, uint64_t ptr)
>> +{
>> +	uint64_t pfn;
>> +	int ret;
>> +
>> +	ret = pread(fd, &pfn, sizeof(ptr),
>> +		(uint64_t) ptr / getpagesize() * sizeof(ptr));
>> +	if (ret != sizeof(ptr))
>> +		return 0;
>> +
>> +	return pfn;
>> +}
>> +
>> +#define PAGEMAP_SWAPPED (1ULL << 62)
>> +
>> +/* Returns true if at least one page in the range is on swap */
>> +static bool pages_swapped(void *ptr, unsigned long pages)
>> +{
>> +	uint64_t pfn;
>> +	int fd = open("/proc/self/pagemap", O_RDONLY);
>> +	unsigned long i;
>> +
>> +	if (fd < 0)
>> +		return false;
>> +
>> +	for (i = 0; i < pages; i++) {
>> +		pfn = get_pfn(fd, (uint64_t) ptr + i * getpagesize());
>> +
>> +		if (pfn & PAGEMAP_SWAPPED) {
>> +			close(fd);
>> +			return true;
>> +		}
>
> We do have pagemap_get_entry() in vm_util.c to query the pagemap entry.

Thanks. I'd missed that, although `grep pagemap
tools/testing/selftests/vm` suggests I'm not the first to follow a
tradition of open-coding this :-)

But there's no need to perpetuate that tradition, so will redo this to
use vm_util.c instead.

> Can you further, add pagemap_is_swapped() to vm_util.c?
>
> I'll be also needing that (including a variant for testing a range) in anon COW
> tests.
