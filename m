Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4854D13C613
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 15:32:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yVCw5ZCzzDqPy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 01:32:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mwb@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yV9D050KzDqP2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 01:30:23 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00FER4Sx110917; Wed, 15 Jan 2020 09:30:05 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xhgs6npvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2020 09:30:05 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00FESoBW014686;
 Wed, 15 Jan 2020 14:30:05 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 2xf751x35c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jan 2020 14:30:05 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00FEU4uB43647418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jan 2020 14:30:04 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECC0B7805F;
 Wed, 15 Jan 2020 14:30:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3620378060;
 Wed, 15 Jan 2020 14:30:03 +0000 (GMT)
Received: from oc8380061452.ibm.com (unknown [9.80.230.130])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jan 2020 14:30:02 +0000 (GMT)
Subject: Re: [PATCH] Fix display of Maximum Memory
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
References: <55f25626-20ca-0acb-3571-ff636ca4632c@linux.ibm.com>
 <41380afd-05f5-f36f-c857-041243c73ee3@c-s.fr>
From: Michael Bringmann <mwb@linux.ibm.com>
Openpgp: preference=signencrypt
Organization: IBM Linux Technology Center
Message-ID: <eb6c4171-09b3-b8f0-6219-38757da6fc3b@linux.ibm.com>
Date: Wed, 15 Jan 2020 08:30:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <41380afd-05f5-f36f-c857-041243c73ee3@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-15_02:2020-01-15,
 2020-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001150117
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
Cc: Gustavo Walbon <gwalbon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/14/20 11:41 PM, Christophe Leroy wrote:
> 
> 
> Le 14/01/2020 à 22:07, Michael Bringmann a écrit :
>> Correct overflow problem in calculation+display of Maximum Memory
>> value to syscfg where 32bits is insufficient.
>>
>> Signed-off-by: Michael Bringmann <mwb@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/lparcfg.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
>> index 4ee2594..183aeb7 100644
>> --- a/arch/powerpc/platforms/pseries/lparcfg.c
>> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
>> @@ -435,12 +435,12 @@ static void parse_em_data(struct seq_file *m)
>>
>>   static void maxmem_data(struct seq_file *m)
>>   {
>> -       unsigned long maxmem = 0;
>> +       unsigned long long maxmem = 0;
> 
> What about using u64 instead, for readability ?

Okay.
> 
>>
>> -       maxmem += drmem_info->n_lmbs * drmem_info->lmb_size;
>> -       maxmem += hugetlb_total_pages() * PAGE_SIZE;
>> +       maxmem += (unsigned long long)drmem_info->n_lmbs * (unsigned long long)drmem_info->lmb_size;
> 
> This line is likely too long. You only need to cast one of the two operants to force a 64 bits multiply. And using u64 would shorten the line.
> 
> Can both multiplications overflow ?

Yes.

> 
> Christophe
> 
>> +       maxmem += (unsigned long long)hugetlb_total_pages() * (unsigned long long)PAGE_SIZE;
>>
>> -       seq_printf(m, "MaxMem=%ld\n", maxmem);
>> +       seq_printf(m, "MaxMem=%llu\n", maxmem);
>>   }
>>
>>   static int pseries_lparcfg_data(struct seq_file *m, void *v)
>>
> 

Thanks.
-- 
Michael W. Bringmann
Linux Technology Center
IBM Corporation
Tie-Line  363-5196
External: (512) 286-5196
Cell:       (512) 466-0650
mwb@linux.ibm.com
