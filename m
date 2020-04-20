Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE71B00F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 07:21:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495FRp2TNnzDqp7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 15:21:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495FQC60QszDqfC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 15:20:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 495FQC3VP8z9BVQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 15:20:19 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 495FQC354mz9sSg; Mon, 20 Apr 2020 15:20:19 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 495FQB6bTTz9sP7
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Apr 2020 15:20:18 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K530TS132761
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Apr 2020 01:20:16 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30gc2vjx44-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Apr 2020 01:20:16 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.ibm.com>;
 Mon, 20 Apr 2020 06:19:32 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Apr 2020 06:19:31 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03K5KBwY41222156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 05:20:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1D2D4C040;
 Mon, 20 Apr 2020 05:20:11 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD5094C044;
 Mon, 20 Apr 2020 05:20:10 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.69.195])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 20 Apr 2020 05:20:10 +0000 (GMT)
Date: Mon, 20 Apr 2020 10:50:08 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/fadump: consider reserved ranges while
 reserving memory
References: <158387202020.17176.15258122288090851051.stgit@hbathini.in.ibm.com>
 <158387202999.17176.116917127748245682.stgit@hbathini.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158387202999.17176.116917127748245682.stgit@hbathini.in.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20042005-4275-0000-0000-000003C30D58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042005-4276-0000-0000-000038D88DD3
Message-Id: <20200420052008.hmktqzerdeema5ae@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_01:2020-04-17,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=5 bulkscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004200044
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
Reply-To: mahesh@linux.ibm.com
Cc: Vasant Hegde <hegdevasant@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-03-11 01:57:10 Wed, Hari Bathini wrote:
> Commit 0962e8004e97 ("powerpc/prom: Scan reserved-ranges node for
> memory reservations") enabled support to parse reserved-ranges DT
> node and reserve kernel memory falling in these ranges for F/W
> purposes. Memory reserved for FADump should not overlap with these
> ranges as it could corrupt memory meant for F/W or crash'ed kernel
> memory to be exported as vmcore.
> 
> But since commit 579ca1a27675 ("powerpc/fadump: make use of memblock's
> bottom up allocation mode"), memblock_find_in_range() is being used to
> find the appropriate area to reserve memory for FADump, which can't
> account for reserved-ranges as these ranges are reserved only after
> FADump memory reservation.
> 
> With reserved-ranges now being populated during early boot, look out
> for these memory ranges while reserving memory for FADump. Without
> this change, MPIPL on PowerNV systems aborts with hostboot failure,
> when memory reserved for FADump is less than 4096MB.
> 
> Fixes: 579ca1a27675 ("powerpc/fadump: make use of memblock's bottom up allocation mode")
> Cc: stable@vger.kernel.org # v5.4+
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/kernel/fadump.c |   76 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 66 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 7fcf4a8f..ab83be9 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -443,10 +443,70 @@ static int __init fadump_get_boot_mem_regions(void)
>  	return ret;
>  }
>  
> +/*
> + * Returns true, if the given range overlaps with reserved memory ranges
> + * starting at idx. Also, updates idx to index of overlapping memory range
> + * with the given memory range.
> + * False, otherwise.
> + */
> +static bool overlaps_reserved_ranges(u64 base, u64 end, int *idx)
> +{
> +	bool ret = false;
> +	int i;
> +
> +	for (i = *idx; i < reserved_mrange_info.mem_range_cnt; i++) {
> +		u64 rbase = reserved_mrange_info.mem_ranges[i].base;
> +		u64 rend = rbase + reserved_mrange_info.mem_ranges[i].size;
> +
> +		if (end <= rbase)
> +			break;
> +
> +		if ((end > rbase) &&  (base < rend)) {
> +			*idx = i;
> +			ret = true;
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +/*
> + * Locate a suitable memory area to reserve memory for FADump. While at it,
> + * lookup reserved-ranges & avoid overlap with them, as they are used by F/W.
> + */
> +static u64 __init fadump_locate_reserve_mem(u64 base, u64 size)
> +{
> +	struct fadump_memory_range *mrngs;
> +	phys_addr_t mstart, mend;
> +	int idx = 0;
> +	u64 i;
> +
> +	mrngs = reserved_mrange_info.mem_ranges;
> +	for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE,
> +				&mstart, &mend, NULL) {
> +		pr_debug("%llu) mstart: %llx, mend: %llx, base: %llx\n",
> +			 i, mstart, mend, base);
> +
> +		if (mstart > base)
> +			base = PAGE_ALIGN(mstart);
> +
> +		while ((mend > base) && ((mend - base) >= size)) {
> +			if (!overlaps_reserved_ranges(base, base + size, &idx))
> +				goto out;
> +
> +			base = mrngs[idx].base + mrngs[idx].size;
> +			base = PAGE_ALIGN(base);

What happens when all the memory ranges found to be overlaped with
reserved ranges ? Shoudn't this function return NULL ? Looks like in
that case this function returns the last set base address which is
either still overlaped or not big enough in size.

Rest looks good to me.

Thanks,
-Mahesh.

> +		}
> +	}
> +
> +out:
> +	return base;
> +}
> +

