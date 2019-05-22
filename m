Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C51225D3F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 07:03:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4580rh5y80zDqPc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 15:03:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=maddy@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4580pz6kD1zDqLW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 15:01:47 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M4qSir129127
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 01:01:43 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2smyshge82-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 01:01:43 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <maddy@linux.vnet.ibm.com>;
 Wed, 22 May 2019 06:01:41 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 22 May 2019 06:01:38 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4M51bfJ61079740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 May 2019 05:01:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FF234C08B;
 Wed, 22 May 2019 05:01:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EB864C06E;
 Wed, 22 May 2019 05:01:36 +0000 (GMT)
Received: from [9.126.30.226] (unknown [9.126.30.226])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 May 2019 05:01:36 +0000 (GMT)
Subject: Re: [PATCH 2/2] powerpc/perf: Fix mmcra corruption by bhrb_filter
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, peterz@infradead.org,
 jolsa@redhat.com, mpe@ellerman.id.au
References: <20190511024217.4013-1-ravi.bangoria@linux.ibm.com>
 <20190511024217.4013-2-ravi.bangoria@linux.ibm.com>
From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Date: Wed, 22 May 2019 10:31:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190511024217.4013-2-ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052205-0008-0000-0000-000002E925E0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052205-0009-0000-0000-00002255DE7B
Message-Id: <bca3f498-6d63-d951-59f8-15342060edf3@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905220034
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 acme@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/05/19 8:12 AM, Ravi Bangoria wrote:
> Consider a scenario where user creates two events:
>
>    1st event:
>      attr.sample_type |= PERF_SAMPLE_BRANCH_STACK;
>      attr.branch_sample_type = PERF_SAMPLE_BRANCH_ANY;
>      fd = perf_event_open(attr, 0, 1, -1, 0);
>
>    This sets cpuhw->bhrb_filter to 0 and returns valid fd.
>
>    2nd event:
>      attr.sample_type |= PERF_SAMPLE_BRANCH_STACK;
>      attr.branch_sample_type = PERF_SAMPLE_BRANCH_CALL;
>      fd = perf_event_open(attr, 0, 1, -1, 0);
>
>    It overrides cpuhw->bhrb_filter to -1 and returns with error.
>
> Now if power_pmu_enable() gets called by any path other than
> power_pmu_add(), ppmu->config_bhrb(-1) will set mmcra to -1.

Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>


> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/perf/core-book3s.c | 6 ++++--
>   arch/powerpc/perf/power8-pmu.c  | 3 +++
>   arch/powerpc/perf/power9-pmu.c  | 3 +++
>   3 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index b0723002a396..8eb5dc5df62b 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1846,6 +1846,7 @@ static int power_pmu_event_init(struct perf_event *event)
>   	int n;
>   	int err;
>   	struct cpu_hw_events *cpuhw;
> +	u64 bhrb_filter;
>
>   	if (!ppmu)
>   		return -ENOENT;
> @@ -1951,13 +1952,14 @@ static int power_pmu_event_init(struct perf_event *event)
>   	err = power_check_constraints(cpuhw, events, cflags, n + 1);
>
>   	if (has_branch_stack(event)) {
> -		cpuhw->bhrb_filter = ppmu->bhrb_filter_map(
> +		bhrb_filter = ppmu->bhrb_filter_map(
>   					event->attr.branch_sample_type);
>
> -		if (cpuhw->bhrb_filter == -1) {
> +		if (bhrb_filter == -1) {
>   			put_cpu_var(cpu_hw_events);
>   			return -EOPNOTSUPP;
>   		}
> +		cpuhw->bhrb_filter = bhrb_filter;
>   	}
>
>   	put_cpu_var(cpu_hw_events);
> diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
> index d12a2db26353..d10feef93b6b 100644
> --- a/arch/powerpc/perf/power8-pmu.c
> +++ b/arch/powerpc/perf/power8-pmu.c
> @@ -29,6 +29,7 @@ enum {
>   #define	POWER8_MMCRA_IFM1		0x0000000040000000UL
>   #define	POWER8_MMCRA_IFM2		0x0000000080000000UL
>   #define	POWER8_MMCRA_IFM3		0x00000000C0000000UL
> +#define	POWER8_MMCRA_BHRB_MASK		0x00000000C0000000UL
>
>   /*
>    * Raw event encoding for PowerISA v2.07 (Power8):
> @@ -243,6 +244,8 @@ static u64 power8_bhrb_filter_map(u64 branch_sample_type)
>
>   static void power8_config_bhrb(u64 pmu_bhrb_filter)
>   {
> +	pmu_bhrb_filter &= POWER8_MMCRA_BHRB_MASK;
> +
>   	/* Enable BHRB filter in PMU */
>   	mtspr(SPRN_MMCRA, (mfspr(SPRN_MMCRA) | pmu_bhrb_filter));
>   }
> diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
> index 030544e35959..f3987915cadc 100644
> --- a/arch/powerpc/perf/power9-pmu.c
> +++ b/arch/powerpc/perf/power9-pmu.c
> @@ -92,6 +92,7 @@ enum {
>   #define POWER9_MMCRA_IFM1		0x0000000040000000UL
>   #define POWER9_MMCRA_IFM2		0x0000000080000000UL
>   #define POWER9_MMCRA_IFM3		0x00000000C0000000UL
> +#define POWER9_MMCRA_BHRB_MASK		0x00000000C0000000UL
>
>   /* Nasty Power9 specific hack */
>   #define PVR_POWER9_CUMULUS		0x00002000
> @@ -300,6 +301,8 @@ static u64 power9_bhrb_filter_map(u64 branch_sample_type)
>
>   static void power9_config_bhrb(u64 pmu_bhrb_filter)
>   {
> +	pmu_bhrb_filter &= POWER9_MMCRA_BHRB_MASK;
> +
>   	/* Enable BHRB filter in PMU */
>   	mtspr(SPRN_MMCRA, (mfspr(SPRN_MMCRA) | pmu_bhrb_filter));
>   }

