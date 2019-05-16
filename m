Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD52085A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 15:38:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454XZK5cQtzDqDP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 23:38:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454XXC65h4zDq9D
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 23:36:58 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4GDYAKe108100
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 09:36:55 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sh8hrsbvk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 09:36:52 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Thu, 16 May 2019 14:36:49 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 May 2019 14:36:46 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4GDajBf22610056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 13:36:45 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BB74124053;
 Thu, 16 May 2019 13:36:45 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DD30124055;
 Thu, 16 May 2019 13:36:44 +0000 (GMT)
Received: from [9.85.74.53] (unknown [9.85.74.53])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 May 2019 13:36:44 +0000 (GMT)
Subject: Re: [PATCH] powerpc/book3s/mm: Clear MMU_FTR_HPTE_TABLE when radix is
 enabled.
To: Nicholas Piggin <npiggin@gmail.com>, mpe@ellerman.id.au, paulus@samba.org
References: <20190514060205.20887-1-aneesh.kumar@linux.ibm.com>
 <1557982690.pk1t7llmyy.astroid@bobo.none>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Thu, 16 May 2019 19:06:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557982690.pk1t7llmyy.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19051613-0072-0000-0000-0000042E6DF2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011105; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01204156; UDB=6.00632118; IPR=6.00985086; 
 MB=3.00026918; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-16 13:36:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051613-0073-0000-0000-00004C3EA8B0
Message-Id: <df83cf16-669c-ae90-88c9-333700e38dcd@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=896 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905160091
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

On 5/16/19 10:34 AM, Nicholas Piggin wrote:
> Aneesh Kumar K.V's on May 14, 2019 4:02 pm:
>> Avoids confusion when printing Oops message like below
>>
>>   Faulting instruction address: 0xc00000000008bdb4
>>   Oops: Kernel access of bad area, sig: 11 [#1]
>>   LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
>>
>> Either ibm,pa-features or ibm,powerpc-cpu-features can be used to enable the
>> MMU features. We don't clear related MMU feature bits there. We use the kernel
>> commandline to determine what translation mode we want to use and clear the
>> HPTE or radix bit accordingly. On LPAR we do have to renable HASH bit if the
>> hypervisor can't do radix.
> 
> Well we have the HPTE feature: the CPU supports hash MMU mode. It's
> just the the kernel is booted in radix mode.
> 

We are not using mmu_features to indicate the capability of the hardware 
right? ie, mmu_features is an indication of current running config. We 
set MMU_FTR_TYPE_RADIX if the kernel is running in radix translation 
mode and on similar lines we should set MMU_FTR_HPTE_TABLE if the kernel 
is running in only hash translation mode. Whether the hardware support 
these translation mode is different from which mode is currently used.



> Could make a difference for KVM, if it will support an HPT guest or
> not.
> 

kvm should not depend on MMU_FTR_HPTE_TABLE to identify whether the 
hardware supports hash page table translation. I don't think we do that.


> That's all highly theoretical and we have other inconsistencies
> already in this stuff, I'd just like to try make things a bit better
> in the long term.
> 


-aneesh

