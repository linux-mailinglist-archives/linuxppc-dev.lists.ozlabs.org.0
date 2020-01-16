Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A03140045
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 00:55:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zLfN2RMCzDrCs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 10:55:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mwb@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zLbD61QDzDr3k
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 10:52:24 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00GNbqqp011853; Thu, 16 Jan 2020 18:52:18 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xk0qs1p3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 18:52:18 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00GNqGHf029549;
 Thu, 16 Jan 2020 23:52:17 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 2xjvwnty1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2020 23:52:17 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00GNqFpH55705958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 23:52:15 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCB0C136051;
 Thu, 16 Jan 2020 23:52:15 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68694136053;
 Thu, 16 Jan 2020 23:52:14 +0000 (GMT)
Received: from oc8380061452.ibm.com (unknown [9.80.209.6])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jan 2020 23:52:13 +0000 (GMT)
Subject: Re: [PATCH v2] Fix display of Maximum Memory
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Gustavo Walbon <gwalbon@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>
References: <5577aef8-1d5a-ca95-ff0a-9c7b5977e5bf@linux.ibm.com>
 <8736cg9cay.fsf@mpe.ellerman.id.au>
From: Michael Bringmann <mwb@linux.ibm.com>
Openpgp: preference=signencrypt
Organization: IBM Linux Technology Center
Message-ID: <bf5c536a-6ca4-0a1a-043d-69b002a34c17@linux.ibm.com>
Date: Thu, 16 Jan 2020 17:52:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8736cg9cay.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-16_06:2020-01-16,
 2020-01-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001160189
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

On 1/15/20 11:53 PM, Michael Ellerman wrote:
> Michael Bringmann <mwb@linux.ibm.com> writes:
>> Correct overflow problem in calculation+display of Maximum Memory
>> value to syscfg where 32bits is insufficient.
>>
>> Signed-off-by: Michael Bringmann <mwb@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/lparcfg.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
>> index e33e8bc..f00411c 100644
>> --- a/arch/powerpc/platforms/pseries/lparcfg.c
>> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
>> @@ -433,12 +433,12 @@ static void parse_em_data(struct seq_file *m)
>>  
>>  static void maxmem_data(struct seq_file *m)
>>  {
>> -	unsigned long maxmem = 0;
>> +	u64 maxmem = 0;
> 
> This is 64-bit only code, so u64 == unsigned long.
> 
>> -	maxmem += drmem_info->n_lmbs * drmem_info->lmb_size;
>> -	maxmem += hugetlb_total_pages() * PAGE_SIZE;
>> +	maxmem += (u64)drmem_info->n_lmbs * drmem_info->lmb_size;
> 
> The only problem AFAICS is n_lmbs is int and lmb_size is u32, so this
> multiplication will overflow.
> 
>> +	maxmem += (u64)hugetlb_total_pages() * PAGE_SIZE;
> 
> hugetlb_total_pages() already returns unsigned long.
> 
>> -	seq_printf(m, "MaxMem=%ld\n", maxmem);
>> +	seq_printf(m, "MaxMem=%llu\n", maxmem);
>>  }
> 
> This should be sufficient?
> 
> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
> index e33e8bc4b69b..38c306551f76 100644
> --- a/arch/powerpc/platforms/pseries/lparcfg.c
> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
> @@ -435,10 +435,10 @@ static void maxmem_data(struct seq_file *m)
>  {
>         unsigned long maxmem = 0;
>  
> -       maxmem += drmem_info->n_lmbs * drmem_info->lmb_size;
> +       maxmem += (unsigned long)drmem_info->n_lmbs * drmem_info->lmb_size;
>         maxmem += hugetlb_total_pages() * PAGE_SIZE;
>  
> -       seq_printf(m, "MaxMem=%ld\n", maxmem);
> +       seq_printf(m, "MaxMem=%lu\n", maxmem);
>  }
>  
>  static int pseries_lparcfg_data(struct seq_file *m, void *v)
> 
> 
> cheers
> 

Trying it out.

-- 
Michael W. Bringmann
Linux Technology Center
IBM Corporation
Tie-Line  363-5196
External: (512) 286-5196
Cell:       (512) 466-0650
mwb@linux.ibm.com
