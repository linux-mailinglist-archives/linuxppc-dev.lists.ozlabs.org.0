Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8B71718C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 14:34:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Stv32yndzDr1d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 00:34:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=desnesn@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Stmx3BWyzDr1c
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 00:29:19 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01RDR6YK112238
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 08:29:17 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ydq60vyff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 08:29:17 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01RDOl1J031248
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 13:29:16 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 2ydcmm0wh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 13:29:16 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01RDTF0t39059854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 13:29:15 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41092AE062;
 Thu, 27 Feb 2020 13:29:15 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 917F2AE060;
 Thu, 27 Feb 2020 13:29:14 +0000 (GMT)
Received: from [9.85.206.47] (unknown [9.85.206.47])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 13:29:14 +0000 (GMT)
Subject: Re: [PATCH] powerpc: fix hardware PMU exception bug on PowerVM
 compatibility mode systems
To: Leonardo Bras <leonardo@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <9ba1d74b53b573d62becba084bb796d3e983f9b4.camel@linux.ibm.com>
From: Desnes Augusto Nunes do Rosario <desnesn@linux.ibm.com>
Message-ID: <545b8f72-97f2-82e0-571f-a3248b4a9176@linux.ibm.com>
Date: Thu, 27 Feb 2020 10:29:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <9ba1d74b53b573d62becba084bb796d3e983f9b4.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_04:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002270105
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
Cc: gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Leonardo,

On 2/15/20 2:39 AM, Leonardo Bras wrote:
> Hello Desnes, thanks for the patch.
>
> "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com> writes:
>
>> PowerVM systems running compatibility mode on a few Power8 revisions are
>> still vulnerable to the hardware defect that loses PMU exceptions arriving
>> prior to a context switch.
>>
>> The software fix for this issue is enabled through the CPU_FTR_PMAO_BUG
>> cpu_feature bit, nevertheless this bit also needs to be set for PowerVM
>> compatibility mode systems.
>>
>> Fixes: 68f2f0d431d9ea4 ("powerpc: Add a cpu feature CPU_FTR_PMAO_BUG")
>> Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/cputable.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
>> index e745abc5457a..5bfef6263dfb 100644
>> --- a/arch/powerpc/kernel/cputable.c
>> +++ b/arch/powerpc/kernel/cputable.c
>> @@ -2198,6 +2198,8 @@ static struct cpu_spec * __init setup_cpu_spec(unsigned long offset,
>>   		if (old.oprofile_cpu_type != NULL) {
>>   			t->oprofile_cpu_type = old.oprofile_cpu_type;
>>   			t->oprofile_type = old.oprofile_type;
>> +			if (old.cpu_features & CPU_FTR_PMAO_BUG)
>> +				t->cpu_features |= CPU_FTR_PMAO_BUG;
> What are your thoughts about doing:
> 	t->cpu_features |=  old.cpu_features & CPU_FTR_PMAO_BUG;
Looks good to me.
> Also, I would recommend adding a short comment on top of the added
> lines explaining why it is needed.
Sure, I'll send a second version.

Thanks for the review.
>
> Best regards,
> Leonardo Bras
>
-- 
Desnes A. Nunes do Rosario
--------------------------------
Advisory Software Engineer - IBM
Virtual Onsite Engineer - Red Hat

