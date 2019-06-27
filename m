Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC9657E68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 10:40:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZCyn4fGczDqYS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 18:40:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aravinda@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZCwj68NkzDqRk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 18:38:45 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5R8bY4A023444; Thu, 27 Jun 2019 04:38:39 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tcrwc4ab1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2019 04:38:39 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5R8ZpjT017907;
 Thu, 27 Jun 2019 08:38:37 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 2t9by75530-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2019 08:38:37 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5R8cbw515991788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jun 2019 08:38:37 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 839B5AC05F;
 Thu, 27 Jun 2019 08:38:37 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04D49AC05B;
 Thu, 27 Jun 2019 08:38:35 +0000 (GMT)
Received: from [9.199.51.100] (unknown [9.199.51.100])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Jun 2019 08:38:35 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: Fix maximum memory value
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <156154180258.26182.5331913391297025368.stgit@aravinda>
 <874l4ct1mg.fsf@linux.ibm.com>
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Message-ID: <cb7c0b3f-8b65-d4eb-9908-6b814ba67fcf@linux.vnet.ibm.com>
Date: Thu, 27 Jun 2019 14:08:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <874l4ct1mg.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906270100
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
Cc: naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On Thursday 27 June 2019 04:06 AM, Nathan Lynch wrote:
> Aravinda Prasad <aravinda@linux.vnet.ibm.com> writes:
>> Calculating the maximum memory based on the number of lmbs
>> and lmb size does not account for the RMA region. Hence
>> use drmem_lmb_memory_max(), which already accounts for the
>> RMA region, to fetch the maximum memory value.
>>
>> Fixes: 772b039fd9a7: ("powerpc/pseries: Export maximum memory value")
>> Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/lparcfg.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
>> index e33e8bc..f425842 100644
>> --- a/arch/powerpc/platforms/pseries/lparcfg.c
>> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
>> @@ -435,7 +435,7 @@ static void maxmem_data(struct seq_file *m)
>>  {
>>  	unsigned long maxmem = 0;
>>  
>> -	maxmem += drmem_info->n_lmbs * drmem_info->lmb_size;
>> +	maxmem += drmem_lmb_memory_max();
> 
> Would memory_hotplug_max() be better here? There's no guarantee an LPAR
> will have the device tree node/properties that populate drmem.

I see memory_hotplug_max() calling drmem_lmb_memory_max() if "/rtas"
node is not available or else it fetches from "ibm,lrdr-capacity". So I
think memory_hotplug_max() can be used.

Regards,
Aravinda

> 

-- 
Regards,
Aravinda
