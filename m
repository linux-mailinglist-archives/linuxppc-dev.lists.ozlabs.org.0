Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 626B568B5A9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 07:37:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9GlT1g4Wz3cf1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 17:37:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EzkASmmZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9GkT4sY6z3Wtr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 17:36:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EzkASmmZ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9GkT4RmYz4wgv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 17:36:33 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P9GkT4PbTz4x1d; Mon,  6 Feb 2023 17:36:33 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EzkASmmZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4P9GkT2652z4wgv
	for <linuxppc-dev@ozlabs.org>; Mon,  6 Feb 2023 17:36:33 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3166RPKu022684;
	Mon, 6 Feb 2023 06:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8bePpisbekIx2uOCLLirH2Q0iIjTq63CrYk17YBE2BQ=;
 b=EzkASmmZqYAZwbhv6WC+QzXUT+dDTNkS6VP3nbMwIc+fhjTSaHn+giM9GGtHRlA0gr2f
 KlWi0PBGtbNFBAAMBwjA4LCafgTbqcQDsy3Z2gWb1pFAWY35ViA8IaglHuivQQkGlM5t
 Np2Spt/EZtzpTjaNDljQz7RlyxvTYf7Dt1OZA3KBF93SLo4xwnwepQwW/uc+HWUmiqzN
 NOPN69csAxME8b+zD9GKLPHnnTCdgETTvZB7bPTGhCQeHirj19bQLfVNnosrRsgo6sTp
 Nh2Xxkk7IDlsIiOh4jEgOEd4juwMiDYsn9D+hNJ79xkZu4jT5A4+ZbV8kL/CsL8W3ALI 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj16rfsyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 06:36:24 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3166Vif1019159;
	Mon, 6 Feb 2023 06:36:24 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nj16rfsxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 06:36:24 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 315Nuhe6020984;
	Mon, 6 Feb 2023 06:36:21 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3nhemfj1g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 06:36:21 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3166aI7k22544656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Feb 2023 06:36:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0AF842005A;
	Mon,  6 Feb 2023 06:36:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DB1A2004B;
	Mon,  6 Feb 2023 06:36:16 +0000 (GMT)
Received: from [9.43.108.31] (unknown [9.43.108.31])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Feb 2023 06:36:16 +0000 (GMT)
Message-ID: <f3c68a60-fe61-94e6-cffa-5173d81a0796@linux.ibm.com>
Date: Mon, 6 Feb 2023 12:06:15 +0530
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
 <f81a50ad-ecd3-8866-2307-b9ef52f0f77a@oracle.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <f81a50ad-ecd3-8866-2307-b9ef52f0f77a@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3YTUfQvzeASS9sMW4RmE3L65UrDcNkXP
X-Proofpoint-GUID: XQ_N9_92akkKuSYyTfWiJHSldJ9f4Vzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_03,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302060055
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


On 03/02/23 02:31, Eric DeVolder wrote:
>
>
> On 2/2/23 09:37, Eric DeVolder wrote:
>>
>>
>> On 2/1/23 00:38, Sourabh Jain wrote:
>>> On architectures like PowerPC the crash notes are available for all
>>> possible CPUs. So let's populate the elfcorehdr for all possible
>>> CPUs having crash notes to avoid updating elfcorehdr during in-kernel
>>> crash update on CPU hotplug events.
>>>
>>> The similar technique is used in kexec-tool for kexec_load case.
>>>
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> ---
>>>   kernel/crash_core.c | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>>> index 37c594858fd51..898d8d2fe2e2e 100644
>>> --- a/kernel/crash_core.c
>>> +++ b/kernel/crash_core.c
>>> @@ -364,8 +364,8 @@ int crash_prepare_elf64_headers(struct kimage 
>>> *image, struct crash_mem *mem,
>>>       ehdr->e_ehsize = sizeof(Elf64_Ehdr);
>>>       ehdr->e_phentsize = sizeof(Elf64_Phdr);
>>> -    /* Prepare one phdr of type PT_NOTE for each present CPU */
>>> -    for_each_present_cpu(cpu) {
>>> +    /* Prepare one phdr of type PT_NOTE for possible CPU with crash 
>>> note. */
>>> +    for_each_possible_cpu(cpu) {
>>
>> Sourabh,
>> Thomas Gleixner is suggesting moving away from for_each_present_cpu() 
>> to for_each_online_cpu(). Using for_each_online_cpu() is going to the 
>> minimum number of needed, whereas your approach of 
>> for_each_possible_cpu() would be to the maximum number needed.
>>
>> What would be the ramifications to ppc for moving towards 
>> for_each_online_cpu()?
>>
>> In my next patch series, I have finally figured out how to use cpuhp 
>> framework to where it is possible to use for_each_online_cpu() here, 
>> but that is at odds with your changes here.
>>
>> Thanks,
>> eric
>>
>>
> Without knowing the ramifications of changing to 
> for_each_online_cpu(), I currently am
> using the following:
>
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index e1a3430f06f4..a019b691d974 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -366,6 +366,9 @@ int crash_prepare_elf64_headers(struct crash_mem 
> *mem, int n
>
>     /* Prepare one phdr of type PT_NOTE for each present CPU */
>     for_each_present_cpu(cpu) {
> +       if (IS_ENABLED(CONFIG_CRASH_HOTPLUG)) {
> +           if (!cpu_online(cpu)) continue;
> +       }

How about let the arch decide the list of CPUs they want to pack in? 
Because on
PowerPC the crash notes are created for possible CPUs and we can utilize 
this
to avoid re-generating elfcorehdr for every hotplug operation.


> phdr->p_type = PT_NOTE;
>         notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpu));
>         phdr->p_offset = phdr->p_paddr = notes_addr;
>
> Thomas points out that the above can be simply the 
> for_each_online_cpu(), but again
> I'm not sure how that impacts ppc,
>
> which appears to layout all possible cpus rather
> than just online ones. How are present but not online cpus handled by 
> crash analysis
> utility?

As per my testing all worked fine if we replace for_each_present_cpu 
with for_each_online_cpu
but again I don't know the reason why it worked. I will investigate it 
and let you know.

How packing PT_LOAD for present CPU is impacting x86? Because on PowerPC
when system is on crash path it only populates the crash notes for 
online CPUs, and skip
all other CPUs.

- Sourabh Jain
