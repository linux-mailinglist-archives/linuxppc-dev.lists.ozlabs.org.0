Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EC22ADD5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 18:50:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVwP64GVyzDqR7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 04:50:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ir75g45d; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVwMC1xKKzDqWr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 04:48:22 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AAHXwUn127278; Tue, 10 Nov 2020 12:47:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=56aqqjn929uuElw5m2Y8wEcM7NHeMtGkTROfJHBw6Ns=;
 b=ir75g45dOB/8qOrA81kFFR3lUfTCw6Ds2qqTSsWLOJAR4Dppe3G2AipaYBMFGhnZoFh9
 LhnsQiT6O1jRjv8MrqHW7poTs0uWto4npYyZUUald/EckqxjCp9rX9DyGlmWm4xxn5VO
 pqwuZMYBO9iysv88vVa2f4y9PCEPp1EMmC8LLzFkuytyradntEyGxYPWFTVfDWOJSYbP
 8FOVA3+HFk8tHFORfjTGWNgRTH2eaL2gAUkyIMcNp1DG6xkn48Ej8W/s4/JetmLgfiJX
 63TDYfNJBHwYu6hjRSQfQdbBehSpKY548Ywv3xfetoe+LTdByNLczYe3Rb2JR3mC3ywN 1Q== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34qsbcwsgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 12:47:56 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AAHc4oG028483;
 Tue, 10 Nov 2020 17:47:55 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 34nk7a1deh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 17:47:55 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AAHlsNN9306716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Nov 2020 17:47:54 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 79D992805A;
 Tue, 10 Nov 2020 17:47:54 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1072228058;
 Tue, 10 Nov 2020 17:47:51 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.230.183])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 10 Nov 2020 17:47:50 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: Fix memleak when cpus node
 not exist
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
References: <20201110123029.3767459-1-zhangxiaoxu5@huawei.com>
 <87ft5hjocy.fsf@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <a00f4a44-6f38-306f-a24f-4e3565deefc2@linux.ibm.com>
Date: Tue, 10 Nov 2020 09:47:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87ft5hjocy.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-10_06:2020-11-10,
 2020-11-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011100120
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
Cc: linuxppc-dev@lists.ozlabs.org, paulus@samba.org, groug@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/10/20 6:08 AM, Nathan Lynch wrote:
> Zhang Xiaoxu <zhangxiaoxu5@huawei.com> writes:
>> From: zhangxiaoxu <zhangxiaoxu5@huawei.com>
>>
>> If the cpus nodes not exist, we lost to free the 'cpu_drcs', which
>> will leak memory.
>>
>> Fixes: a0ff72f9f5a7 ("powerpc/pseries/hotplug-cpu: Remove double free in error path")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: zhangxiaoxu <zhangxiaoxu5@huawei.com>
>> ---
>>  arch/powerpc/platforms/pseries/hotplug-cpu.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> index f2837e33bf5d..4bb1c9f2bb11 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
>> @@ -743,6 +743,7 @@ static int dlpar_cpu_add_by_count(u32 cpus_to_add)
>>  	parent = of_find_node_by_path("/cpus");
>>  	if (!parent) {
>>  		pr_warn("Could not find CPU root node in device tree\n");
>> +		kfree(cpu_drcs);
>>  		return -1;
>>  	}
> 
> Thanks for finding this.
> 
> a0ff72f9f5a7 ("powerpc/pseries/hotplug-cpu: Remove double free in error
> path") was posted in Sept 2019 but was not applied until July 2020:
> 
> https://lore.kernel.org/linuxppc-dev/20190919231633.1344-1-nathanl@linux.ibm.com/
> 
> Here is that change as posted; note the function context is
> find_dlpar_cpus_to_add(), not dlpar_cpu_add_by_count():
> 
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -726,7 +726,6 @@ static int find_dlpar_cpus_to_add(u32 *cpu_drcs, u32 cpus_to_add)
>  	parent = of_find_node_by_path("/cpus");
>  	if (!parent) {
>  		pr_warn("Could not find CPU root node in device tree\n");
> -		kfree(cpu_drcs);
>  		return -1;
>  	}
> 
> Meanwhile b015f6bc9547dbc056edde7177c7868ca8629c4c ("powerpc/pseries: Add
> cpu DLPAR support for drc-info property") was posted in Nov 2019 and
> committed a few days later:
> 
> https://lore.kernel.org/linux-pci/1573449697-5448-4-git-send-email-tyreld@linux.ibm.com/
> 
> This change reorganized the same code, removing
> find_dlpar_cpus_to_add(), and it had the effect of fixing the same
> issue.
> 
> However git apparently allowed the older change to still apply on top of
> this (changing a function different from the one in the original
> patch!), leading to a real bug.

Yikes, not sure how that happened without either the committer massaging the
patch to apply, or the line location and context matching exactly.

> 
> Your patch is correct but it should be framed as a revert of
> a0ff72f9f5a7 with this context in the commit message.
> 

Agreed, in reality we want to revert a patch that shouldn't have been applied.

-Tyrel
