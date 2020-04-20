Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7091B042A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 10:18:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495KMz1VbgzDqTk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 18:18:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495JJD3NGGzDqZn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 17:30:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 495JJ90CR9z9BWK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 17:30:16 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 495JJ75Wrwz9sSm; Mon, 20 Apr 2020 17:30:15 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 495JJ72tjcz9sP7
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Apr 2020 17:30:15 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K72kWv115310
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Apr 2020 03:30:11 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gcbe4v71-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Apr 2020 03:30:11 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Mon, 20 Apr 2020 08:29:36 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Apr 2020 08:29:35 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03K7U6g331719848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 07:30:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8393AE061;
 Mon, 20 Apr 2020 07:30:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8596CAE059;
 Mon, 20 Apr 2020 07:30:04 +0000 (GMT)
Received: from [9.102.25.223] (unknown [9.102.25.223])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 07:30:04 +0000 (GMT)
Subject: Re: [PATCH 2/2] powerpc/fadump: consider reserved ranges while
 reserving memory
To: mahesh@linux.ibm.com
References: <158387202020.17176.15258122288090851051.stgit@hbathini.in.ibm.com>
 <158387202999.17176.116917127748245682.stgit@hbathini.in.ibm.com>
 <20200420052008.hmktqzerdeema5ae@in.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Mon, 20 Apr 2020 13:00:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200420052008.hmktqzerdeema5ae@in.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20042007-0008-0000-0000-00000373EC29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042007-0009-0000-0000-00004A95AD2C
Message-Id: <391b2928-4803-1102-03dc-681e6f7089d2@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_02:2020-04-17,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 suspectscore=3 malwarescore=0 spamscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200063
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
Cc: Vasant Hegde <hegdevasant@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/04/20 10:50 AM, Mahesh J Salgaonkar wrote:
> On 2020-03-11 01:57:10 Wed, Hari Bathini wrote:
>> Commit 0962e8004e97 ("powerpc/prom: Scan reserved-ranges node for
>> memory reservations") enabled support to parse reserved-ranges DT
>> node and reserve kernel memory falling in these ranges for F/W
>> purposes. Memory reserved for FADump should not overlap with these
>> ranges as it could corrupt memory meant for F/W or crash'ed kernel
>> memory to be exported as vmcore.
>>
>> But since commit 579ca1a27675 ("powerpc/fadump: make use of memblock's
>> bottom up allocation mode"), memblock_find_in_range() is being used to
>> find the appropriate area to reserve memory for FADump, which can't
>> account for reserved-ranges as these ranges are reserved only after
>> FADump memory reservation.
>>
>> With reserved-ranges now being populated during early boot, look out
>> for these memory ranges while reserving memory for FADump. Without
>> this change, MPIPL on PowerNV systems aborts with hostboot failure,
>> when memory reserved for FADump is less than 4096MB.
>>
>> Fixes: 579ca1a27675 ("powerpc/fadump: make use of memblock's bottom up allocation mode")
>> Cc: stable@vger.kernel.org # v5.4+
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>  arch/powerpc/kernel/fadump.c |   76 ++++++++++++++++++++++++++++++++++++------
>>  1 file changed, 66 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index 7fcf4a8f..ab83be9 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -443,10 +443,70 @@ static int __init fadump_get_boot_mem_regions(void)
>>  	return ret;
>>  }
>>  
>> +/*
>> + * Returns true, if the given range overlaps with reserved memory ranges
>> + * starting at idx. Also, updates idx to index of overlapping memory range
>> + * with the given memory range.
>> + * False, otherwise.
>> + */
>> +static bool overlaps_reserved_ranges(u64 base, u64 end, int *idx)
>> +{
>> +	bool ret = false;
>> +	int i;
>> +
>> +	for (i = *idx; i < reserved_mrange_info.mem_range_cnt; i++) {
>> +		u64 rbase = reserved_mrange_info.mem_ranges[i].base;
>> +		u64 rend = rbase + reserved_mrange_info.mem_ranges[i].size;
>> +
>> +		if (end <= rbase)
>> +			break;
>> +
>> +		if ((end > rbase) &&  (base < rend)) {
>> +			*idx = i;
>> +			ret = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * Locate a suitable memory area to reserve memory for FADump. While at it,
>> + * lookup reserved-ranges & avoid overlap with them, as they are used by F/W.
>> + */
>> +static u64 __init fadump_locate_reserve_mem(u64 base, u64 size)
>> +{
>> +	struct fadump_memory_range *mrngs;
>> +	phys_addr_t mstart, mend;
>> +	int idx = 0;
>> +	u64 i;
>> +
>> +	mrngs = reserved_mrange_info.mem_ranges;
>> +	for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE,
>> +				&mstart, &mend, NULL) {
>> +		pr_debug("%llu) mstart: %llx, mend: %llx, base: %llx\n",
>> +			 i, mstart, mend, base);
>> +
>> +		if (mstart > base)
>> +			base = PAGE_ALIGN(mstart);
>> +
>> +		while ((mend > base) && ((mend - base) >= size)) {
>> +			if (!overlaps_reserved_ranges(base, base + size, &idx))
>> +				goto out;
>> +
>> +			base = mrngs[idx].base + mrngs[idx].size;
>> +			base = PAGE_ALIGN(base);
> 
> What happens when all the memory ranges found to be overlaped with
> reserved ranges ? Shoudn't this function return NULL ? Looks like in
> that case this function returns the last set base address which is
> either still overlaped or not big enough in size.

Thanks for the review, Mahesh. I overlooked that corner case.
Just posted v2 fixing it.

- Hari

