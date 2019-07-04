Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 968625F73C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 13:32:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fbRV58H3zDqJW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 21:32:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fbPc73sMzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 21:30:27 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x64BShGe118584
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 4 Jul 2019 07:30:24 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2thdn5q31b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jul 2019 07:30:24 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aravinda@linux.vnet.ibm.com>;
 Thu, 4 Jul 2019 12:30:22 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 4 Jul 2019 12:30:20 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x64BUJss13763534
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jul 2019 11:30:19 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8679AC065;
 Thu,  4 Jul 2019 11:30:19 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 510ACAC059;
 Thu,  4 Jul 2019 11:30:18 +0000 (GMT)
Received: from [9.85.88.166] (unknown [9.85.88.166])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  4 Jul 2019 11:30:17 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/pseries: Fix maximum memory value
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>
References: <156170480663.26214.11212383510892156924.stgit@aravinda>
 <87tvc9sjrb.fsf@linux.ibm.com> <1561743225.hrre8pgw6j.naveen@linux.ibm.com>
 <871rz6qch5.fsf@concordia.ellerman.id.au>
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Date: Thu, 4 Jul 2019 17:00:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <871rz6qch5.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19070411-2213-0000-0000-000003A94988
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011377; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01227282; UDB=6.00646184; IPR=6.01008520; 
 MB=3.00027582; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-04 11:30:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070411-2214-0000-0000-00005F1ACA17
Message-Id: <8581b7e9-f09b-c273-ca8a-c83671cde919@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-04_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907040149
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



On Thursday 04 July 2019 04:43 PM, Michael Ellerman wrote:
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>> Nathan Lynch wrote:
>>> Aravinda Prasad <aravinda@linux.vnet.ibm.com> writes:
>>>> Calculating the maximum memory based on the number of lmbs
>>>> and lmb size does not account for the RMA region. Hence
>>>> use memory_hotplug_max(), which already accounts for the
>>>> RMA region, to fetch the maximum memory value. Thanks to
>>>> Nathan Lynch for suggesting the memory_hotplug_max()
>>>> function.
>>>
>>> Well, I hope I haven't led you astray... will it give you the desired
>>> result on a kernel configured without memory hotplug support, booted in
>>> an LPAR with some huge pages configured?
>>>
>>> If so, then
>>> Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
>>>
>>> It would likely help with review and future maintenance if the semantics
>>> and intended use of the MaxMem field are made a little more
>>> explicit. For example, is it supposed to include persistent memory?
>>> Perhaps a follow-up patch could address this. Or maybe I'm overthinking
>>> it.
>>
>> This was primarily aimed to replicate what AIX lparstat does and 
>> documentation (*) just says:
>>
>>   Maximum Memory
>>       Maximum possible amount of Memory.
>>
>> I think this mirrors the maximum memory value set in the LPAR profile, 
>> and this provides a way to obtain that value from within the LPAR.
> 
> But the doc string for memory_hotplug_max() says:
> 
>  * memory_hotplug_max - return max address of memory that may be added
> 
> 
> ie. maximum *address* not maximum *amount*.
> 
> Possibly it turns out to be the same value, but that is just because you
> have no holes in your layout.
> 
> So I don't think this patch is correct.

memory_hotplug_max (in one of the cases) is taking the value from
"ibm,lrdr-capacity" and according to PAPR:

PAPR section C.6.3.1 ibm,lrdr-capacity:

"The phys (of size #address-cells) communicates the maximum address in
bytes and therefore, the most memory that can be allocated to this
partition."

On other cases memory_hotplug_max() is calculating based on the number
of lmbs assigned to the partition, so should still give max mem value


> 
> cheers
> 

-- 
Regards,
Aravinda

