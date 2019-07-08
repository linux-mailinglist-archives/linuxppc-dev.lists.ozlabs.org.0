Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 852D162A19
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 22:06:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jGgc04FbzDqS6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 06:06:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jGdp5RpxzDqPP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 06:05:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45jGdp4N5Xz8wHR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 06:05:18 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45jGdp4530z9sP9; Tue,  9 Jul 2019 06:05:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45jGdp0B65z9sP2
 for <linuxppc-dev@ozlabs.org>; Tue,  9 Jul 2019 06:05:17 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x68K1R94086672
 for <linuxppc-dev@ozlabs.org>; Mon, 8 Jul 2019 16:05:14 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tma9554gk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 08 Jul 2019 16:05:14 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <cclaudio@linux.ibm.com>;
 Mon, 8 Jul 2019 21:05:13 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 8 Jul 2019 21:05:11 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x68K59c342533286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jul 2019 20:05:09 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1CC2C6059;
 Mon,  8 Jul 2019 20:05:09 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24A0CC6057;
 Mon,  8 Jul 2019 20:05:07 +0000 (GMT)
Received: from [9.80.216.78] (unknown [9.80.216.78])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jul 2019 20:05:06 +0000 (GMT)
Subject: Re: [PATCH v4 5/8] KVM: PPC: Ultravisor: Restrict flush of the
 partition tlb cache
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@ozlabs.org
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-6-cclaudio@linux.ibm.com>
 <bd65a80e-c935-d612-bbbd-9ef7cc68d7e3@ozlabs.ru>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Date: Mon, 8 Jul 2019 17:05:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <bd65a80e-c935-d612-bbbd-9ef7cc68d7e3@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19070820-0016-0000-0000-000009CBCF23
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011397; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01229351; UDB=6.00647436; IPR=6.01010610; 
 MB=3.00027639; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-08 20:05:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070820-0017-0000-0000-000043F0EB30
Message-Id: <d77a7421-27ff-8439-49cb-21f04251f72e@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=18 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907080249
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/1/19 2:54 AM, Alexey Kardashevskiy wrote:
>
> On 29/06/2019 06:08, Claudio Carvalho wrote:
>> From: Ram Pai <linuxram@us.ibm.com>
>>
>> Ultravisor is responsible for flushing the tlb cache, since it manages
>> the PATE entries. Hence skip tlb flush, if the ultravisor firmware is
>> available.
>>
>> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
>> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> ---
>>  arch/powerpc/mm/book3s64/pgtable.c | 33 +++++++++++++++++-------------
>>  1 file changed, 19 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
>> index 224c5c7c2e3d..bc8eb2bf9810 100644
>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>> @@ -224,6 +224,23 @@ void __init mmu_partition_table_init(void)
>>  	powernv_set_nmmu_ptcr(ptcr);
>>  }
>>  
>> +static void flush_partition(unsigned int lpid, unsigned long dw0)
>> +{
>> +	if (dw0 & PATB_HR) {
>> +		asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 1) : :
>> +			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
>> +		asm volatile(PPC_TLBIE_5(%0, %1, 2, 1, 1) : :
>> +			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
>> +		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 1);
>> +	} else {
>> +		asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 0) : :
>> +			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
>> +		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
>> +	}
>> +	/* do we need fixup here ?*/
>> +	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
>> +}
>> +
>>  static void __mmu_partition_table_set_entry(unsigned int lpid,
>>  					    unsigned long dw0,
>>  					    unsigned long dw1)
>> @@ -238,20 +255,8 @@ static void __mmu_partition_table_set_entry(unsigned int lpid,
>>  	 * The type of flush (hash or radix) depends on what the previous
>>  	 * use of this partition ID was, not the new use.
>>  	 */
>> -	asm volatile("ptesync" : : : "memory");
>> -	if (old & PATB_HR) {
>> -		asm volatile(PPC_TLBIE_5(%0,%1,2,0,1) : :
>> -			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
>> -		asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
>> -			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
>> -		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 1);
>> -	} else {
>> -		asm volatile(PPC_TLBIE_5(%0,%1,2,0,0) : :
>> -			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
>> -		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
>> -	}
>> -	/* do we need fixup here ?*/
>> -	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
>> +	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>
> __mmu_partition_table_set_entry() checks for UV and
> mmu_partition_table_set_entry() (the caller) checks for UV and the whole
> point of having separate flush_partition() and
> __mmu_partition_table_set_entry() is not really clear.
>
>
> 4/8 and 5/8 make more sense as one patch imho.


Makes sense. I merged them in the next version. Thanks.

Claudio


>
>
>> +		flush_partition(lpid, old);
>>  }
>>  
>>  void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
>>

