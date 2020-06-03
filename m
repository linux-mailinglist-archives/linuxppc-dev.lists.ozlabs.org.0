Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 308E81ED471
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 18:36:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cZLD1J6gzDqTW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 02:36:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cZHW23y7zDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 02:34:14 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 053GVlQV080037; Wed, 3 Jun 2020 12:34:07 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31efawg9ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 12:34:07 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 053GF5vq027853;
 Wed, 3 Jun 2020 16:34:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 31bf483dqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 16:34:05 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 053GY3Zu10158452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jun 2020 16:34:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 637C452050;
 Wed,  3 Jun 2020 16:34:03 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.61.76])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 50FFF5204F;
 Wed,  3 Jun 2020 16:34:02 +0000 (GMT)
Subject: Re: [PATCH kernel] powerpc/perf: Stop crashing with generic_compat_pmu
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20200602025612.62707-1-aik@ozlabs.ru>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <c3852667-210c-48de-7f89-a06250b4df05@linux.ibm.com>
Date: Wed, 3 Jun 2020 22:04:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602025612.62707-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 cotscore=-2147483648 adultscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=18 spamscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006030127
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/2/20 8:26 AM, Alexey Kardashevskiy wrote:
> The bhrb_filter_map ("The  Branch  History  Rolling  Buffer") callback is
> only defined in raw CPUs' power_pmu structs. The "architected" CPUs use
> generic_compat_pmu which does not have this callback and crashed occur.
>
> This add a NULL pointer check for bhrb_filter_map() which behaves as if
> the callback returned an error.
>
> This does not add the same check for config_bhrb() as the only caller
> checks for cpuhw->bhrb_users which remains zero if bhrb_filter_map==0.

Changes looks fine.
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>

The commit be80e758d0c2e ('powerpc/perf: Add generic compat mode pmu 
driver')
which introduced generic_compat_pmu was merged in v5.2.  So we need to
CC stable starting from 5.2 :( .  My bad,  sorry.

Maddy

> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>   arch/powerpc/perf/core-book3s.c | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 3dcfecf858f3..36870569bf9c 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1515,9 +1515,16 @@ static int power_pmu_add(struct perf_event *event, int ef_flags)
>   	ret = 0;
>    out:
>   	if (has_branch_stack(event)) {
> -		power_pmu_bhrb_enable(event);
> -		cpuhw->bhrb_filter = ppmu->bhrb_filter_map(
> -					event->attr.branch_sample_type);
> +		u64 bhrb_filter = -1;
> +
> +		if (ppmu->bhrb_filter_map)
> +			bhrb_filter = ppmu->bhrb_filter_map(
> +				event->attr.branch_sample_type);
> +
> +		if (bhrb_filter != -1) {
> +			cpuhw->bhrb_filter = bhrb_filter;
> +			power_pmu_bhrb_enable(event); /* Does bhrb_users++ */
> +		}
>   	}
>
>   	perf_pmu_enable(event->pmu);
> @@ -1839,7 +1846,6 @@ static int power_pmu_event_init(struct perf_event *event)
>   	int n;
>   	int err;
>   	struct cpu_hw_events *cpuhw;
> -	u64 bhrb_filter;
>
>   	if (!ppmu)
>   		return -ENOENT;
> @@ -1945,7 +1951,10 @@ static int power_pmu_event_init(struct perf_event *event)
>   	err = power_check_constraints(cpuhw, events, cflags, n + 1);
>
>   	if (has_branch_stack(event)) {
> -		bhrb_filter = ppmu->bhrb_filter_map(
> +		u64 bhrb_filter = -1;
> +
> +		if (ppmu->bhrb_filter_map)
> +			bhrb_filter = ppmu->bhrb_filter_map(
>   					event->attr.branch_sample_type);
>
>   		if (bhrb_filter == -1) {

