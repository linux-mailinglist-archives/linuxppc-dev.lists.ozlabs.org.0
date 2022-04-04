Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDC54F1069
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 10:01:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KX3By2RZDz3bcR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Apr 2022 18:01:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OUG6uPio;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OUG6uPio; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KX3B95Nzzz2x9c
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Apr 2022 18:01:05 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2345KvRv002639; 
 Mon, 4 Apr 2022 08:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xuMZoxCiAoHdrJQTSKdHoan5/3cQAMgl75sbQBjFMSc=;
 b=OUG6uPioXK0r6rZtFNVUp0cIKtexHa2E6p/8vODLeiZLOZZFOew97CCm85fcKR+Tb278
 eVPLSj2qNavCyqf3IKZgLc+MaYphNopsESaWidxCB9cgD24PuwpxOwrRXSdoCAL2pxRq
 zzupyyTEKtLPBho1L+VP15yadcdiA511E/VoSTbNZl54qArMqrqv03KoKIyEBFYUB8HM
 Y5S8ypvvnXFBHwWrpFay0z9DdPMTTcjPiwVz2ExzlA3rOz1LVs/hd08F+RoHY7xFuM+0
 7U5dkWHDWYevSJpWgq3wvqzkdtKUj5aoJKvYkXZFMH6IDDF9ksrRG1K5jZRnoWzbFv5Q Sw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f705gkk74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 08:00:58 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2347r7P0022360;
 Mon, 4 Apr 2022 08:00:57 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3f6e48u580-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Apr 2022 08:00:57 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23480sa314287238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Apr 2022 08:00:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D82042045;
 Mon,  4 Apr 2022 08:00:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C71A742041;
 Mon,  4 Apr 2022 08:00:53 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Apr 2022 08:00:53 +0000 (GMT)
Message-ID: <02d1e060-e0e4-92e0-ef88-7f237e36fa5c@linux.ibm.com>
Date: Mon, 4 Apr 2022 10:00:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2] powerpc/drmem: Don't compute the NUMA node for each LMB
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <202008051807.Vi8NDJtX%lkp@intel.com>
 <20200805133502.33723-1-ldufour@linux.ibm.com>
 <9d02405a-793e-bcf5-a424-470d9c82ec7d@csgroup.eu>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <9d02405a-793e-bcf5-a424-470d9c82ec7d@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7dCaxTUBNO8YZmlyL818tKVKjP05Kwqh
X-Proofpoint-ORIG-GUID: 7dCaxTUBNO8YZmlyL818tKVKjP05Kwqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-04_02,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204040043
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
Cc: nathanl@linux.ibm.com, cheloha@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/04/2022, 18:35:15, Christophe Leroy wrote:
> 
> 
> Le 05/08/2020 à 15:35, Laurent Dufour a écrit :
>> All the LMB from the same set of ibm,dynamic-memory-v2 property are
>> sharing the same NUMA node. Don't compute that node for each one.
>>
>> Tested on a system with 1022 LMBs spread on 4 NUMA nodes, only 4 calls to
>> lmb_set_nid() have been made instead of 1022.
>>
>> This should prevent some soft lockups when starting large guests
>>
>> Code has meaning only if CONFIG_MEMORY_HOTPLUG is set, otherwise the nid
>> field is not present in the drmem_lmb structure.
>>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> 
> It looks like this patch was superseded by e5e179aa3a39 ("pseries/drmem:
> don't cache node id in drmem_lmb struct").

That patch has been superseded and can be dropped.

Thanks,
Laurent.


> If not, anyway it conflicts with that patch so it has to be rebased.
> 
> Thanks
> Christophe
> 
> 
>> ---
>>   arch/powerpc/mm/drmem.c | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
>> index b2eeea39684c..c11b6ec99ea3 100644
>> --- a/arch/powerpc/mm/drmem.c
>> +++ b/arch/powerpc/mm/drmem.c
>> @@ -402,6 +402,9 @@ static void __init init_drmem_v2_lmbs(const __be32
>> *prop)
>>       const __be32 *p;
>>       u32 i, j, lmb_sets;
>>       int lmb_index;
>> +#ifdef CONFIG_MEMORY_HOTPLUG
>> +    struct drmem_lmb *first = NULL;
>> +#endif
>>         lmb_sets = of_read_number(prop++, 1);
>>       if (lmb_sets == 0)
>> @@ -426,6 +429,15 @@ static void __init init_drmem_v2_lmbs(const __be32
>> *prop)
>>       for (i = 0; i < lmb_sets; i++) {
>>           read_drconf_v2_cell(&dr_cell, &p);
>>   +#ifdef CONFIG_MEMORY_HOTPLUG
>> +        /*
>> +         * Fetch the NUMA node id for the fist set or if the
>> +         * associativity index is different from the previous set.
>> +         */
>> +        if (first && dr_cell.aa_index != first->aa_index)
>> +            first = NULL;
>> +#endif
>> +
>>           for (j = 0; j < dr_cell.seq_lmbs; j++) {
>>               lmb = &drmem_info->lmbs[lmb_index++];
>>   @@ -438,7 +450,18 @@ static void __init init_drmem_v2_lmbs(const __be32
>> *prop)
>>               lmb->aa_index = dr_cell.aa_index;
>>               lmb->flags = dr_cell.flags;
>>   -            lmb_set_nid(lmb);
>> +#ifdef CONFIG_MEMORY_HOTPLUG
>> +            /*
>> +             * All the LMB in the set share the same NUMA
>> +             * associativity property. So read that node only once.
>> +             */
>> +            if (!first) {
>> +                lmb_set_nid(lmb);
>> +                first = lmb;
>> +            } else {
>> +                lmb->nid = first->nid;
>> +            }
>> +#endif
>>           }
>>       }
>>   }

