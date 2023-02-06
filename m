Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BBD68B569
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 06:57:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9Fsq2l2Bz3cMh
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 16:57:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RQXarUHM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9Frq5rrbz2xvF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 16:56:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RQXarUHM;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9Frq47bXz4x1d
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 16:56:59 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P9Frq44j8z4x1h; Mon,  6 Feb 2023 16:56:59 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RQXarUHM;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4P9Frq12nbz4x1d
	for <linuxppc-dev@ozlabs.org>; Mon,  6 Feb 2023 16:56:58 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3165hlPN018778;
	Mon, 6 Feb 2023 05:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Sqfa2bqL5xnRmev75H8A4wZhFuZ4ofjlnHS7iEBugnM=;
 b=RQXarUHMxWtJPigMXD/D314udQK9SNX8V2mSvLTbngQLlVxCD4JRebwlf+Tjsyku79pV
 iIbEim09bEevWIql8TFnVKzRcQyKPzxTX2aXt+AHIsu08X5Nv1nNK3PEpEs8L93jpyKO
 w8KJsOtXsU6Yc2wgfAZiMXv0unmsX10bKn7LErm3RVcbjR0i4URU5Hjo1wqJgXPsSAqr
 nc6vABOc631GeqHiYfiztdJ4cueWyI3lRw9TvgjA7/4apE4sN5sGhZ8ELYiMjgrUZanQ
 U6X8IWWtPNLLdeJwWK76R52l0onLEMSxrpKRugyUIDzwbpWADkIF1XLDwa/56Mg81fMI Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3njund075g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 05:56:50 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3165sO9j024828;
	Mon, 6 Feb 2023 05:56:49 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3njund0759-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 05:56:49 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 315NMWZ6001826;
	Mon, 6 Feb 2023 05:56:47 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3nhf06hyk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 05:56:47 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3165uhZs41288094
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Feb 2023 05:56:43 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9A072004E;
	Mon,  6 Feb 2023 05:56:43 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E838020040;
	Mon,  6 Feb 2023 05:56:41 +0000 (GMT)
Received: from [9.43.108.31] (unknown [9.43.108.31])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Feb 2023 05:56:41 +0000 (GMT)
Message-ID: <c7946991-347b-67ec-5158-4013bb5b396b@linux.ibm.com>
Date: Mon, 6 Feb 2023 11:26:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 4/8] crash: add phdr for possible CPUs in elfcorehdr
Content-Language: en-US
To: Eric DeVolder <eric.devolder@oracle.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230201063841.965316-1-sourabhjain@linux.ibm.com>
 <20230201063841.965316-5-sourabhjain@linux.ibm.com>
 <401813b1-9834-f8bc-e035-2fef309d3fa6@oracle.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <401813b1-9834-f8bc-e035-2fef309d3fa6@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QBJEuSBIG-scMfYpDDJ_bUD6mey5NPBX
X-Proofpoint-ORIG-GUID: _i5BLMOxk0xZl1SRw7djIJEq5Q0YKrGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_02,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060047
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
Cc: mahesh@linux.vnet.ibm.com, ldufour@linux.ibm.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 02/02/23 21:07, Eric DeVolder wrote:
>
>
> On 2/1/23 00:38, Sourabh Jain wrote:
>> On architectures like PowerPC the crash notes are available for all
>> possible CPUs. So let's populate the elfcorehdr for all possible
>> CPUs having crash notes to avoid updating elfcorehdr during in-kernel
>> crash update on CPU hotplug events.
>>
>> The similar technique is used in kexec-tool for kexec_load case.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   kernel/crash_core.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index 37c594858fd51..898d8d2fe2e2e 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -364,8 +364,8 @@ int crash_prepare_elf64_headers(struct kimage 
>> *image, struct crash_mem *mem,
>>       ehdr->e_ehsize = sizeof(Elf64_Ehdr);
>>       ehdr->e_phentsize = sizeof(Elf64_Phdr);
>>   -    /* Prepare one phdr of type PT_NOTE for each present CPU */
>> -    for_each_present_cpu(cpu) {
>> +    /* Prepare one phdr of type PT_NOTE for possible CPU with crash 
>> note. */
>> +    for_each_possible_cpu(cpu) {
>
> Sourabh,
> Thomas Gleixner is suggesting moving away from for_each_present_cpu() 
> to for_each_online_cpu(). Using for_each_online_cpu() is going to the 
> minimum number of needed, whereas your approach of 
> for_each_possible_cpu() would be to the maximum number needed.
>
> What would be the ramifications to ppc for moving towards 
> for_each_online_cpu()?
>
> In my next patch series, I have finally figured out how to use cpuhp 
> framework to where it is possible to use for_each_online_cpu() here, 
> but that is at odds with your changes here.
I was in the impression that if CPU notes are missing for offline CPUs 
in the elfcorehdr then makedumpfile will mess up the
CPU IDs.

But somehow replacing for_each_present_cpu with for_each_online_cpu 
worked on PowerPC, even after disabling a couple of CPUs.

So things are fine if we pack PT_LOAD for online CPUs instead of present 
CPUs but,
I need to investigate how makedumpfile is able to map PT_LOAD to online 
CPUs.

- Sourabh Jain
