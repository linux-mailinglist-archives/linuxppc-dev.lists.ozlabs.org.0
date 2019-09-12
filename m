Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5830B14CA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 21:28:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TpjF0bg2zF4wx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 05:28:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TpgM3rrBzF4v3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 05:27:10 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8CJD4gi021405
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 15:27:06 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uytcec418-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 15:27:06 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Thu, 12 Sep 2019 20:27:05 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 Sep 2019 20:27:02 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8CJR1gk47120842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 19:27:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A5E6A4053;
 Thu, 12 Sep 2019 19:27:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C807A4051;
 Thu, 12 Sep 2019 19:27:00 +0000 (GMT)
Received: from pomme.local (unknown [9.145.146.20])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 Sep 2019 19:27:00 +0000 (GMT)
Subject: Re: [PATCH 2/3] powperc/mm: read TLB Block Invalidate Characteristics
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com
References: <20190830120712.22971-1-ldufour@linux.ibm.com>
 <20190830120712.22971-3-ldufour@linux.ibm.com> <87impxshfk.fsf@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Date: Thu, 12 Sep 2019 21:26:59 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87impxshfk.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091219-0028-0000-0000-0000039B872E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091219-0029-0000-0000-0000245DF3DF
Message-Id: <468a53a6-a970-5526-8035-eef59dcf48ed@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-12_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909120201
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 12/09/2019 à 16:44, Aneesh Kumar K.V a écrit :
> Laurent Dufour <ldufour@linux.ibm.com> writes:
> 
>> The PAPR document specifies the TLB Block Invalidate Characteristics which
>> is telling which couple base page size / page size is supported by the
>> H_BLOCK_REMOVE hcall.
>>
>> A new set of feature is added to the mmu_psize_def structure to record per
>> base page size which page size is supported by H_BLOCK_REMOVE.
>>
>> A new init service is added to read the characteristics. The size of the
>> buffer is set to twice the number of known page size, plus 10 bytes to
>> ensure we have enough place.
>>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/mmu.h |   3 +
>>   arch/powerpc/platforms/pseries/lpar.c    | 107 +++++++++++++++++++++++
>>   2 files changed, 110 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
>> index 23b83d3593e2..675895dfe39f 100644
>> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>> @@ -12,11 +12,14 @@
>>    *    sllp  : is a bit mask with the value of SLB L || LP to be or'ed
>>    *            directly to a slbmte "vsid" value
>>    *    penc  : is the HPTE encoding mask for the "LP" field:
>> + *    hblk  : H_BLOCK_REMOVE supported block size for this page size in
>> + *            segment who's base page size is that page size.
>>    *
>>    */
>>   struct mmu_psize_def {
>>   	unsigned int	shift;	/* number of bits */
>>   	int		penc[MMU_PAGE_COUNT];	/* HPTE encoding */
>> +	int		hblk[MMU_PAGE_COUNT];	/* H_BLOCK_REMOVE support */
>>   	unsigned int	tlbiel;	/* tlbiel supported for that page size */
>>   	unsigned long	avpnm;	/* bits to mask out in AVPN in the HPTE */
>>   	union {
>> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
>> index 4f76e5f30c97..375e19b3cf53 100644
>> --- a/arch/powerpc/platforms/pseries/lpar.c
>> +++ b/arch/powerpc/platforms/pseries/lpar.c
>> @@ -1311,6 +1311,113 @@ static void do_block_remove(unsigned long number, struct ppc64_tlb_batch *batch,
>>   		(void)call_block_remove(pix, param, true);
>>   }
>>   
>> +static inline void __init set_hblk_bloc_size(int bpsize, int psize,
>> +					     unsigned int block_size)
>> +{
>> +	struct mmu_psize_def *def = &mmu_psize_defs[bpsize];
>> +
>> +	if (block_size > def->hblk[psize])
>> +		def->hblk[psize] = block_size;
>> +}
>> +
>> +static inline void __init check_lp_set_hblk(unsigned int lp,
>> +					    unsigned int block_size)
>> +{
>> +	unsigned int bpsize, psize;
>> +
>> +
>> +	/* First, check the L bit, if not set, this means 4K */
>> +	if ((lp & 0x80) == 0) {
>> +		set_hblk_bloc_size(MMU_PAGE_4K, MMU_PAGE_4K, block_size);
>> +		return;
>> +	}
>> +
>> +	/* PAPR says to look at bits 2-7 (0 = MSB) */
>> +	lp &= 0x3f;
>> +	for (bpsize = 0; bpsize < MMU_PAGE_COUNT; bpsize++) {
>> +		struct mmu_psize_def *def =  &mmu_psize_defs[bpsize];
>> +
>> +		for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
>> +			if (def->penc[psize] == lp) {
>> +				set_hblk_bloc_size(bpsize, psize, block_size);
>> +				return;
>> +			}
>> +		}
>> +	}
>> +}
>> +
>> +#define SPLPAR_TLB_BIC_TOKEN		50
>> +#define SPLPAR_TLB_BIC_MAXLENGTH	(MMU_PAGE_COUNT*2 + 10)
>> +static int __init read_tlbbi_characteristics(void)
>> +{
>> +	int call_status;
>> +	unsigned char local_buffer[SPLPAR_TLB_BIC_MAXLENGTH];
>> +	int len, idx, bpsize;
>> +
>> +	if (!firmware_has_feature(FW_FEATURE_BLOCK_REMOVE)) {
>> +		pr_info("H_BLOCK_REMOVE is not supported");
>> +		return 0;
>> +	}
>> +
>> +	memset(local_buffer, 0, SPLPAR_TLB_BIC_MAXLENGTH);
>> +
>> +	spin_lock(&rtas_data_buf_lock);
>> +	memset(rtas_data_buf, 0, RTAS_DATA_BUF_SIZE);
>> +	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
>> +				NULL,
>> +				SPLPAR_TLB_BIC_TOKEN,
>> +				__pa(rtas_data_buf),
>> +				RTAS_DATA_BUF_SIZE);
>> +	memcpy(local_buffer, rtas_data_buf, SPLPAR_TLB_BIC_MAXLENGTH);
>> +	local_buffer[SPLPAR_TLB_BIC_MAXLENGTH - 1] = '\0';
>> +	spin_unlock(&rtas_data_buf_lock);
>> +
>> +	if (call_status != 0) {
>> +		pr_warn("%s %s Error calling get-system-parameter (0x%x)\n",
>> +			__FILE__, __func__, call_status);
>> +		return 0;
>> +	}
>> +
>> +	/*
>> +	 * The first two (2) bytes of the data in the buffer are the length of
>> +	 * the returned data, not counting these first two (2) bytes.
>> +	 */
>> +	len = local_buffer[0] * 256 + local_buffer[1] + 2;
>> +	if (len >= SPLPAR_TLB_BIC_MAXLENGTH) {
>> +		pr_warn("%s too large returned buffer %d", __func__, len);
>> +		return 0;
>> +	}
>> +
>> +	idx = 2;
>> +	while (idx < len) {
>> +		unsigned int block_size = local_buffer[idx++];
>> +		unsigned int npsize;
>> +
>> +		if (!block_size)
>> +			break;
>> +
>> +		block_size = 1 << block_size;
>> +		if (block_size != 8)
>> +			/* We only support 8 bytes size TLB invalidate buffer */
>> +			pr_warn("Unsupported H_BLOCK_REMOVE block size : %d\n",
>> +				block_size);
> 
> Should we skip setting block size if we find block_size != 8? Also can
> we avoid doing that pr_warn in loop and only warn if we don't find
> block_size 8 in the invalidate characteristics array?

My idea here is to fully read and process the data returned by the hcall, 
and to put the limitation to 8 when checking before calling H_BLOCK_REMOVE.
The warning is there because I want it to be displayed once at boot.

> 
>> +
>> +		for (npsize = local_buffer[idx++];  npsize > 0; npsize--)
>> +			check_lp_set_hblk((unsigned int) local_buffer[idx++],
>> +					  block_size);
>> +	}
>> +
>> +	for (bpsize = 0; bpsize < MMU_PAGE_COUNT; bpsize++)
>> +		for (idx = 0; idx < MMU_PAGE_COUNT; idx++)
>> +			if (mmu_psize_defs[bpsize].hblk[idx])
>> +				pr_info("H_BLOCK_REMOVE supports base psize:%d psize:%d block size:%d",
>> +					bpsize, idx,
>> +					mmu_psize_defs[bpsize].hblk[idx]);
>> +
>> +	return 0;
>> +}
>> +machine_arch_initcall(pseries, read_tlbbi_characteristics);
>> +
>>   /*
>>    * Take a spinlock around flushes to avoid bouncing the hypervisor tlbie
>>    * lock.
>> -- 
>> 2.23.0

