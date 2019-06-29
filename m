Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC2F5AC52
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 17:56:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bdY9191RzDqys
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 01:56:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bdWb4MwtzDqQl
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 01:55:23 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5TFqBC5033232; Sat, 29 Jun 2019 11:55:15 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2te44gh2g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jun 2019 11:55:15 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5TFrBKI034680;
 Sat, 29 Jun 2019 11:55:15 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2te44gh2fv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jun 2019 11:55:15 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5TFtCC7024164;
 Sat, 29 Jun 2019 15:55:14 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 2tdym6b7t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jun 2019 15:55:14 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5TFtDJv48628046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Jun 2019 15:55:13 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77779112063;
 Sat, 29 Jun 2019 15:55:13 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8871F112061;
 Sat, 29 Jun 2019 15:55:11 +0000 (GMT)
Received: from [9.85.87.55] (unknown [9.85.87.55])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 29 Jun 2019 15:55:11 +0000 (GMT)
Subject: Re: ["RFC PATCH" 2/2] powerpc/mm: Conslidate numa_enable check and
 min_common_depth check
To: Vaibhav Jain <vaibhav@linux.ibm.com>, npiggin@gmail.com, paulus@samba.org, 
 mpe@ellerman.id.au
References: <20190629083629.29037-1-aneesh.kumar@linux.ibm.com>
 <20190629083629.29037-2-aneesh.kumar@linux.ibm.com>
 <87imsos8n5.fsf@vajain21.in.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <ddae176b-6ae2-224e-bb23-1bf31e102d0a@linux.ibm.com>
Date: Sat, 29 Jun 2019 21:24:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87imsos8n5.fsf@vajain21.in.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-29_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906290199
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/29/19 9:09 PM, Vaibhav Jain wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> 
>> Update min_common_depth = -1 if numa is disabled. This
>> help us to avoid checking for both in different code paths.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/mm/numa.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> index f6d68baeaa96..c84062a390cc 100644
>> --- a/arch/powerpc/mm/numa.c
>> +++ b/arch/powerpc/mm/numa.c
>> @@ -212,7 +212,7 @@ static int associativity_to_nid(const __be32 *associativity)
>>   {
>>   	int nid = NUMA_NO_NODE;
>>   
>> -	if (min_common_depth == -1 || !numa_enabled)
>> +	if (min_common_depth == -1)
>>   		goto out;
>>   
>>   	if (of_read_number(associativity, 1) >= min_common_depth)
>> @@ -625,6 +625,7 @@ static int __init parse_numa_properties(void)
>>   
>>   	if (numa_enabled == 0) {
>>   		printk(KERN_WARNING "NUMA disabled by user\n");
>> +		min_common_depth = -1;
>>   		return -1;
>>   	}
> 
> I would prefer updating the definition of variable 'min_common_depth' to
> 
> static int min_common_depth = -1;
> 
> This would handle the case where someone calls 'associativity_to_nid()' and
> other functions that read 'min_common_depth' and get an invalid result
> back. And also handle the case where kernel is booted with 'numa = off'.
> 

Sure. As mentioned in another email, I am wondering whether all that 
min_common_depth check should be if !numa_enabled. That makes it much 
easy to read. I will respin once i get more clarity on 
of_drconf_to_nid_single usage.

> Also the init value 'min_common_depth == 0' indicates that the
> first word in "ibm,associativity" array represents the node-id which is
> wrong. Instead its the length of the "ibm,associativity" array.
> 

-aneesh
