Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE967B7EB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 18:01:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Z1mq5kYBzF56Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 02:01:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z1kS0ZlkzF3KC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 01:59:27 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8JFwBwo116809
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 11:59:24 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v4asydsh4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 11:59:24 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Thu, 19 Sep 2019 16:59:22 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 19 Sep 2019 16:59:18 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8JFxHD652232332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 15:59:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1AB4A4040;
 Thu, 19 Sep 2019 15:59:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E19CA4059;
 Thu, 19 Sep 2019 15:59:17 +0000 (GMT)
Received: from pomme.tls.ibm.com (unknown [9.101.4.33])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Sep 2019 15:59:17 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] powperc/mm: read TLB Block Invalidate
 Characteristics
To: Michael Ellerman <mpe@ellerman.id.au>, benh@kernel.crashing.org,
 paulus@samba.org, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20190916095543.17496-1-ldufour@linux.ibm.com>
 <20190916095543.17496-2-ldufour@linux.ibm.com>
 <87zhj1vhz6.fsf@mpe.ellerman.id.au>
From: Laurent Dufour <ldufour@linux.ibm.com>
Date: Thu, 19 Sep 2019 17:59:16 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87zhj1vhz6.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19091915-0008-0000-0000-00000318818E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091915-0009-0000-0000-00004A37079B
Message-Id: <ff9ccf9f-0299-372a-a044-02183174723c@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909190145
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 18/09/2019 à 15:42, Michael Ellerman a écrit :
> Hi Laurent,
> 
> Comments below ...

Hi Michael,

Thanks for your review.

One comment below (at the end).

> 
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> The PAPR document specifies the TLB Block Invalidate Characteristics which
>> tells for each couple segment base page size, actual page size, the size of
>                   ^
>                   "pair of" again
> 
>> the block the hcall H_BLOCK_REMOVE is supporting.
>                                       ^
>                                       "supports" is fine.
> 
>> These characteristics are loaded at boot time in a new table hblkr_size.
>> The table is appart the mmu_psize_def because this is specific to the
>                 ^
>                 "separate from"
> 
>> pseries architecture.
>            ^
>            platform
>>
>> A new init service, pseries_lpar_read_hblkr_characteristics() is added to
>               ^
>               function
> 
>> read the characteristics. In that function, the size of the buffer is set
>> to twice the number of known page size, plus 10 bytes to ensure we have
>> enough place. This new init function is called from pSeries_setup_arch().
>           ^
>           space
>>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>   .../include/asm/book3s/64/tlbflush-hash.h     |   1 +
>>   arch/powerpc/platforms/pseries/lpar.c         | 138 ++++++++++++++++++
>>   arch/powerpc/platforms/pseries/setup.c        |   1 +
>>   3 files changed, 140 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> index 64d02a704bcb..74155cc8cf89 100644
>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> @@ -117,4 +117,5 @@ extern void __flush_hash_table_range(struct mm_struct *mm, unsigned long start,
>>   				     unsigned long end);
>>   extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,
>>   				unsigned long addr);
>> +extern void pseries_lpar_read_hblkr_characteristics(void);
> 
> This doesn't need "extern", and also should go in
> arch/powerpc/platforms/pseries/pseries.h as it's local to that directory.
> 
> You're using "hblkr" in a few places, can we instead make it "hblkrm" -
> "rm" is a well known abbreviation for "remove".
> 
> 
>> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
>> index 36b846f6e74e..98a5c2ff9a0b 100644
>> --- a/arch/powerpc/platforms/pseries/lpar.c
>> +++ b/arch/powerpc/platforms/pseries/lpar.c
>> @@ -56,6 +56,15 @@ EXPORT_SYMBOL(plpar_hcall);
>>   EXPORT_SYMBOL(plpar_hcall9);
>>   EXPORT_SYMBOL(plpar_hcall_norets);
>>   
>> +/*
>> + * H_BLOCK_REMOVE supported block size for this page size in segment who's base
>> + * page size is that page size.
>> + *
>> + * The first index is the segment base page size, the second one is the actual
>> + * page size.
>> + */
>> +static int hblkr_size[MMU_PAGE_COUNT][MMU_PAGE_COUNT];
> 
> Can you make that __ro_after_init, it goes at the end, eg:
> 
> static int hblkr_size[MMU_PAGE_COUNT][MMU_PAGE_COUNT] __ro_after_init;
> 
>> @@ -1311,6 +1320,135 @@ static void do_block_remove(unsigned long number, struct ppc64_tlb_batch *batch,
>>   		(void)call_block_remove(pix, param, true);
>>   }
>>   
>> +/*
>> + * TLB Block Invalidate Characteristics These characteristics define the size of
>                                             ^
>                                             newline before here?
> 
>> + * the block the hcall H_BLOCK_REMOVE is able to process for each couple segment
>> + * base page size, actual page size.
>> + *
>> + * The ibm,get-system-parameter properties is returning a buffer with the
>> + * following layout:
>> + *
>> + * [ 2 bytes size of the RTAS buffer (without these 2 bytes) ]
>                                           ^
>                                           "excluding"
> 
>> + * -----------------
>> + * TLB Block Invalidate Specifiers:
>> + * [ 1 byte LOG base 2 of the TLB invalidate block size being specified ]
>> + * [ 1 byte Number of page sizes (N) that are supported for the specified
>> + *          TLB invalidate block size ]
>> + * [ 1 byte Encoded segment base page size and actual page size
>> + *          MSB=0 means 4k segment base page size and actual page size
>> + *          MSB=1 the penc value in mmu_psize_def ]
>> + * ...
>> + * -----------------
>> + * Next TLB Block Invalidate Specifiers...
>> + * -----------------
>> + * [ 0 ]
>> + */
>> +static inline void __init set_hblk_bloc_size(int bpsize, int psize,
>> +					     unsigned int block_size)
> 
> "static inline" and __init are sort of contradictory.
> 
> Just make it "static void __init" and the compiler will inline it
> anyway, but if it decides not to the section will be correct.
> 
> This one uses "hblk"? Should it be set_hblkrm_block_size() ?
> 
>> +{
>> +	if (block_size > hblkr_size[bpsize][psize])
>> +		hblkr_size[bpsize][psize] = block_size;
>> +}
>> +
>> +/*
>> + * Decode the Encoded segment base page size and actual page size.
>> + * PAPR specifies with bit 0 as MSB:
>> + *   - bit 0 is the L bit
>> + *   - bits 2-7 are the penc value
> 
> Can we just convert those to normal bit ordering for the comment, eg:
> 
>   PAPR specifies:
>     - bit 7 is the L bit
>     - bits 0-5 are the penc value
> 
>> + * If the L bit is 0, this means 4K segment base page size and actual page size
>> + * otherwise the penc value should be readed.
>                                           ^
>                                           "read" ?
>> + */
>> +#define HBLKR_L_BIT_MASK	0x80
> 
> "HBLKRM_L_MASK" would do I think?
> 
>> +#define HBLKR_PENC_MASK		0x3f
>> +static inline void __init check_lp_set_hblk(unsigned int lp,
>> +					    unsigned int block_size)
>> +{
>> +	unsigned int bpsize, psize;
>> +
> 
> One blank line is sufficient :)
> 
>> +
>> +	/* First, check the L bit, if not set, this means 4K */
>> +	if ((lp & HBLKR_L_BIT_MASK) == 0) {
>> +		set_hblk_bloc_size(MMU_PAGE_4K, MMU_PAGE_4K, block_size);
>> +		return;
>> +	}
>> +
>> +	lp &= HBLKR_PENC_MASK;
>> +	for (bpsize = 0; bpsize < MMU_PAGE_COUNT; bpsize++) {
>> +		struct mmu_psize_def *def =  &mmu_psize_defs[bpsize];
>                                              ^
>                                              stray space there
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
> 
> The +10 is just a guess I think?
> 
> If I'm counting right that ends up as 42 bytes, which is not much at
> all. You could probably just make it a cache line, 128 bytes, which
> should be plenty of space?
> 
>> +void __init pseries_lpar_read_hblkr_characteristics(void)
>> +{
>> +	int call_status;
> 
> This should be grouped with the other ints below on one line.
> 
>> +	unsigned char local_buffer[SPLPAR_TLB_BIC_MAXLENGTH];
>> +	int len, idx, bpsize;
>> +
>> +	if (!firmware_has_feature(FW_FEATURE_BLOCK_REMOVE)) {
>> +		pr_info("H_BLOCK_REMOVE is not supported");
> 
> That's going to trigger on a lot of older machines, and all KVM VMs, so
> just return silently.
> 
>> +		return;
>> +	}
>> +
>> +	memset(local_buffer, 0, SPLPAR_TLB_BIC_MAXLENGTH);
> 
> Here you memset the whole buffer ...
> 
>> +	spin_lock(&rtas_data_buf_lock);
>> +	memset(rtas_data_buf, 0, RTAS_DATA_BUF_SIZE);
>> +	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
>> +				NULL,
>> +				SPLPAR_TLB_BIC_TOKEN,
>> +				__pa(rtas_data_buf),
>> +				RTAS_DATA_BUF_SIZE);
>> +	memcpy(local_buffer, rtas_data_buf, SPLPAR_TLB_BIC_MAXLENGTH);
> 
> But then here you memcpy over the entire buffer, making the memset above
> unnecessary.
> 
>> +	local_buffer[SPLPAR_TLB_BIC_MAXLENGTH - 1] = '\0';
>> +	spin_unlock(&rtas_data_buf_lock);
>> +
>> +	if (call_status != 0) {
>> +		pr_warn("%s %s Error calling get-system-parameter (0x%x)\n",
>> +			__FILE__, __func__, call_status);
> 
> __FILE__ and __func__ is pretty verbose for what should be a rare case
> (I realise you copied that from existing code).
> 
> 		pr_warn("Error calling get-system-parameter(%d, ...) (0x%x)\n",
>                          SPLPAR_TLB_BIC_TOKEN, call_status);
> 
> Should do I think?
> 
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * The first two (2) bytes of the data in the buffer are the length of
>> +	 * the returned data, not counting these first two (2) bytes.
>> +	 */
>> +	len = local_buffer[0] * 256 + local_buffer[1] + 2;
> 
> This took me a minute to parse. I guess I was expecting something more
> like:
> 	len = be16_to_cpu(local_buffer) + 2;
> 
> ??
> 
>> +	if (len >= SPLPAR_TLB_BIC_MAXLENGTH) {
> 
> I think it's allowed for len to be == SPLPAR_TLB_BIC_MAXLENGTH isn't it?
> 
>> +		pr_warn("%s too large returned buffer %d", __func__, len);
>> +		return;
>> +	}
>> +
>> +	idx = 2;
>> +	while (idx < len) {
>> +		unsigned int block_size = local_buffer[idx++];
> 
> This is a little subtle, local_buffer is char, so no endian issue, but
> you're loading that into an unsigned int which makes it look like there
> should be an endian swap.
> 
> Maybe instead do:
> 		u8 block_shift = local_buffer[idx++];
>                  u32 block_size;
> 
> 		if (!block_shift)
>                  	break;
> 
> 		block_size = 1 << block_shift;
> 
> ??
> 
>> +		unsigned int npsize;
>> +
>> +		if (!block_size)
>> +			break;
>> +
>> +		block_size = 1 << block_size;
>> +
>> +		for (npsize = local_buffer[idx++];  npsize > 0; npsize--)
>> +			check_lp_set_hblk((unsigned int) local_buffer[idx++],
>> +					  block_size);
> 
> This could overflow if npsize is too big. I think you can just ad
> "&& idx < len" to the for condition to make it safe?
> 
>> +	}
>> +
>> +	for (bpsize = 0; bpsize < MMU_PAGE_COUNT; bpsize++)
>> +		for (idx = 0; idx < MMU_PAGE_COUNT; idx++)
>> +			if (hblkr_size[bpsize][idx])
>> +				pr_info("H_BLOCK_REMOVE supports base psize:%d psize:%d block size:%d",
>> +					bpsize, idx, hblkr_size[bpsize][idx]);
> 
> I think this is probably too verbose, except for debugging. Probably
> just remove it?

I'd like to keep that displayed because this is the only way to get these 
values.
I tried to use pr_debug() and rely on a dyndbg kernel command line option, 
but the dynamic debug system is not yet initialised at this time of boot.

When a system is booting, those messages are interleaved with other user 
cryptic messages ;):

[    0.000000] numa:   NODE_DATA [mem 0x7ffdd7000-0x7ffddbfff]
[    0.000000] numa:     NODE_DATA(0) on node 2
[    0.000000] numa:   NODE_DATA [mem 0x7ffdd2000-0x7ffdd6fff]
[    0.000000] rfi-flush: fallback displacement flush available
[    0.000000] rfi-flush: mttrig type flush available
[    0.000000] count-cache-flush: full software flush sequence enabled.
[    0.000000] stf-barrier: eieio barrier available
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:0 psize:0 block size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:0 psize:2 block size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:0 psize:10 block size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:2 psize:2 block size:8
[    0.000000] lpar: H_BLOCK_REMOVE supports base psize:2 psize:10 block size:8
[    0.000000] PPC64 nvram contains 15360 bytes
[    0.000000] barrier-nospec: using ORI speculation barrier
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x00000007ffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   2: [mem 0x0000000000000000-0x00000007ffffffff]
[    0.000000] Could not find start_pfn for node 0

Is this an issue to keep those lines ?

Cheers

